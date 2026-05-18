---
name: shape-up-mini
description: Lightweight Shape Up for small/low-stakes features. 5-10 turns max (fewer better). Output GOAL.md at repo root. No appetite or rigid limits. AI decides impl details not covered by user.
---

# Shape Up Mini

Lightweight sibling of [[shape-up]]. Use when feature is small, throwaway, or low-stakes and full shaping is overkill.

## When to use

- Small/low-stakes feature, bug fix with judgment calls, throwaway script, exploration
- User wants quick alignment, not full shaping
- Use full [[shape-up]] instead when scope is big, stakes high, or downstream AI needs strict boundaries

## Input

Same as [[shape-up]]: sentence, notes, file path, partial brief. If file, read first.

## Protocol

Quick interactive Q&A. 5-10 turns max. Fewer is better. Use more only if context truly requires.

Each turn:
1. Reflect what user gave.
2. Ask 1-3 sharp questions on whatever gap most blocks execution.
3. Wait.

No fixed order. Cover what matters, skip what doesn't. Common gaps to probe:
- Problem in one line
- Acceptance: how AI knows it's done
- Files in scope / do-not-touch
- Hard constraints or known traps
- UX direction if UI

When execution-blocking gaps are filled, emit GOAL.md. Do not over-shape.

## Generate GOAL.md

Write to `<repo-root>/GOAL.md` unless user specifies path. Do not commit unless user asks.

Sections (drop any not relevant):
- **Context**: problem, why
- **Files in scope** / **Do not touch**
- **Approach**: hints; AI decides impl details not stated
- **Acceptance**: how AI verifies done (test, command, output shape)
- **No-gos**: explicit out-of-scope
- **Commit discipline**: commit incrementally. Separate commit per meaningful piece of work as it lands. Commit often, no big batched commits, no piling up unstaged. Never touch foreign changes. Do not commit GOAL.md unless asked. Only skip committing entirely if user explicitly said no-commit.

No time budget. No wrap-up rule. No breadboard requirement. No dedicated risks section. AI agent uses judgment on impl tradeoffs.

## Rules

- Stay quick. Bias toward emitting GOAL.md over more turns.
- Facilitate product calls only. Impl tradeoffs → AI decides downstream.
- Details still matter where they block execution. Push for exact names/paths/shapes only where ambiguity would cause wrong output.
- Detail bar in GOAL.md: enough for strong frontier model (latest Codex/Claude high-thinking) to grasp scope. Less exhaustive than [[shape-up]], still precise.
- No file creation other than GOAL.md
- Mark assumptions
- If scope feels bigger than mini, suggest user switch to [[shape-up]]

## Output Style

Short, conversational during Q&A.
- `Have:` what's nailed down
- `Ask:` 1-3 questions

GOAL.md emitted when execution-blocking gaps closed.
