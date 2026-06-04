# AGENTS.md

# Contracts
- style: telegraph. Drop filler/grammar. Min tokens (global AGENTS + replies)
- keep files <~500 LOC; split/refactor as needed; doesn't apply to GOAL and PLAN files
- code docs everywhere
- cap answers 25 lines; larger => compact
- verify current local state before claiming facts
- prefer targeted reads/search over dumping huge files
- don't kill/restart user-owned processes unless asked
- repo skill `SKILL.md` files must stay <=30 lines
- when adding/updating repo skills, verify both Codex + Claude can load generated structure

# Git / Source Control
- commit each logical change; don't batch unrelated work; no enormous commits
- stage/commit only files touched for the requested task
- never commit local plan/goal/scratch artifacts unless asked
- don't mention private plan artifact names in PRs/reports/code
- before commit, reject staged diffs leaking personal user directories; warn user
- suppose other agents working concurrently on the same codebase; only commit ur own changes
- unrecognized changes: assume other agent; keep going; focus your changes; if it causes issues, stop + ask user.
