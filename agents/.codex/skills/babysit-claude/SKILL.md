---
name: babysit-claude
description: Spawn Claude Code in right tmux split with given goal. Poll every 2 min. Auto-approve safe permission prompts. Loop until goal done. Pane stays open after.
---

# Babysit Claude

Codex spawns Claude Code in a tmux pane, watches it, approves safe prompts, until goal achieved.

## Input

Goal text passed by user. Example: `babysit-claude let's fix bug #2`.

## Protocol

Assume `tmux` and `claude` exist on PATH and codex runs inside a tmux session. No precondition checks.


### 1. Open right split, capture pane id

```bash
PANE=$(tmux split-window -h -P -F '#{pane_id}')
echo "$PANE"  # e.g. %42
```

Pane is created and focused. Stays at ~50% width by default.

### 2. Launch claude with goal

Escape goal text for shell. Send as single command. Use `--` to be safe if goal starts with `-`.

```bash
GOAL='let's fix bug #2'   # from user
# single-quote-safe wrap:
ESCAPED=$(printf '%s' "$GOAL" | sed "s/'/'\\\\''/g")
tmux send-keys -t "$PANE" "claude '/goal ${ESCAPED}'" Enter
```

Note: `/goal` is the prefix the user wants prepended. If `/goal` is not a real Claude slash command in their setup, send the bare goal: `claude '${ESCAPED}'`. Confirm with user once if unsure; default to `/goal` prefix as specified.

### 3. Poll loop (every 2 minutes)

```bash
while true; do
  sleep 120
  OUT=$(tmux capture-pane -t "$PANE" -p)
  # analyze $OUT
done
```

`capture-pane -p` prints visible pane only (no scrollback). Enough to see current permission prompt or final summary. Keeps codex context small per tick.

### 4. Classify pane state each tick

Two things only:

- **Permission prompt** — claude paused asking to run a command (look for `Do you want to`, `Allow`, numbered options `1. Yes` / `2. Yes, don't ask again` / `3. No`, or `❯` selector). Extract proposed command, run security check (§5).
- **Goal achieved** — claude printed final summary matching goal, returned to prompt, no spinner. Exit loop. Pane stays open.

Anything else → continue loop. No other classifications needed.

### 5. Security check before approving

Auto-approve ONLY safe commands. Approve = send `1` + Enter (or whichever index maps to "Yes" / "Yes, allow once" — read the prompt).

Safe (auto-approve):
- read-only: `ls`, `cat`, `grep`, `rg`, `find`, `git status`, `git log`, `git diff`, `git show`, `wc`, `head`, `tail`
- builds/tests inside repo: `npm test`, `pnpm test`, `cargo test`, `go test`, `pytest`, `make`, `npm run build`, lint/format
- safe edits to files inside repo (claude's own Edit/Write tool calls scoped to project dir)
- package install if user pre-approved scope (default: NO — surface to user)

Refuse (do NOT approve, surface to user):
- `rm -rf`, `rm` of anything outside repo, `:>`/truncation of tracked files
- `git push --force`, `git push -f`, `git reset --hard` on shared branches, `git clean -fdx`, branch deletion of `main`/`master`
- `curl … | sh`, `wget … | sh`, `bash <(curl …)`
- writes outside repo root (`~/.ssh`, `/etc`, `~/.aws`, `~/.config`, `/usr/*`)
- network calls to non-allowlisted hosts that exfiltrate (rare but watch)
- `sudo` anything
- `chmod 777`, `chown`
- killing processes, `kill -9`, `pkill`
- secret printing: `cat .env`, `cat ~/.netrc`, etc.
- anything claude itself flagged as risky in its prompt text

If unsure → treat as unsafe. Surface to user.

### 6. Send approval / denial

```bash
# approve once
tmux send-keys -t "$PANE" '1' Enter

# deny
tmux send-keys -t "$PANE" '3' Enter
```

Adjust digit to match the prompt's actual numbering — capture-pane and read the options before sending.

### 7. Loop exit

On goal achieved:
- Tell user: done.
- Leave pane alive. Do NOT `tmux kill-pane`.

## Tmux command cheatsheet

```bash
# new right split, return pane id, do not auto-focus (-d) optional
PANE=$(tmux split-window -h -P -F '#{pane_id}')

# read visible pane (stdout, no scrollback)
tmux capture-pane -t "$PANE" -p

# send keystrokes (Enter as literal key name)
tmux send-keys -t "$PANE" 'text here' Enter

# send single keypress (no enter), useful for menus
tmux send-keys -t "$PANE" '1'

# kill pane (only if user asks)
tmux kill-pane -t "$PANE"
```

## Rules

- Never auto-approve destructive or out-of-repo commands.
- Never `kill-pane`.
- Silent while working. One line only on approve/deny/done.
