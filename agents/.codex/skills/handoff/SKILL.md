---
name: handoff
description: Write/update HANDOFF.md so next fresh-context agent (Claude/Codex) continues work.
---

Write/update handoff doc → next agent resumes w/o re-deriving context.

Steps:
1. `HANDOFF.md` exists at repo root? Read first.
2. Write/update `HANDOFF.md`:
   - **Goal** — what + why
   - **Status** — done / in progress / blocked
   - **Next steps** — ordered, concrete, no user input needed
   - **Decisions** — chose X over Y + rejected alts + reason (prevents re-litigation)
   - **Open questions** — only items blocked on user
3. Print abs path. Tell user: new session → `continue from <path>`.

Rules:
- Telegraph. No filler. No code dumps — `file:line` refs only.
- Pull from current convo. Don't re-explore repo to pad.
- Empty section → omit.
