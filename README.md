# configs

My config files for different apps and services.

Managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level
directory is a Stow "group" mirroring the target path layout.

## Install

```console
$ brew install stow   # macOS
$ stow -Sv tmux nvim alacritty agents
```

Default target is `$HOME`, so e.g. `nvim/.config/nvim/init.lua` →
`~/.config/nvim/init.lua`.

The `agents` group ships both Codex and Claude assets in one tree:

- `agents/.codex/AGENTS.md` → `~/.codex/AGENTS.md`
- `agents/.codex/skills/`   → `~/.codex/skills/`
- `agents/.claude/CLAUDE.md` → `~/.claude/CLAUDE.md` (symlinked to
  `AGENTS.md` inside the repo, single source of truth)

## Adopting existing files

If a target file already exists as a real file (not a symlink), Stow refuses.
Two options:

- `stow --adopt -Sv <group>` — moves the real file into the repo, replacing
  it with a symlink. Use only after `git diff` to confirm no surprise edits.
- Delete the real file first, then `stow -Sv <group>`.

## Uninstall

```console
$ stow -Dv <group>
```

## Preview

`-n` (no-op) shows what would happen without touching the filesystem:

```console
$ stow -nvS tmux
```
