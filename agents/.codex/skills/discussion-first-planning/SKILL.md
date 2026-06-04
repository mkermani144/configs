---
name: discussion-first-planning
description: Use when user asks to plan, shape, write a goal/spec, break down work, go one by one, or turn a rough idea into executable agent work. Discussion-first workflow: align before writing, split broad work into runnable slices, respect repo-local artifact conventions, and avoid giant one-shot plans.
metadata:
  short-description: Discussion-first planning and goal slicing
---

# Discussion-First Planning

Use for planning that must become useful execution input, not abstract strategy.

## Core Rules

- Discuss before writing artifacts. Do not generate a full plan from a rough prompt.
- Keep user in product/intent seat. Ask only for decisions that change scope, behavior, or acceptance.
- Prefer repo-local conventions for artifact path/name. If unknown, inspect first.
- If no convention exists, write goals under `goals/<descriptive-name>.md`.
- Do not include appetite/time-budget unless user asks.
- Do not commit goal/spec/plan artifacts unless user asks.

## Workflow

1. Restate current understanding in 3-6 bullets.
2. Name the next decision needed.
3. Ask 1-3 questions, then wait.
4. When scope is broad, split into runnable slices before writing.
5. Before file creation, show proposed artifact path(s) and slice list.
6. Write only after user confirms.

## Slice Rules

Each slice should be:
- executable by one agent without hidden context
- independently verifiable
- small enough to review
- named by behavior/outcome, not implementation trivia

Use one index plus slice files when shared decisions span multiple chunks.

## Artifact Shape

Use only sections that fit the task:
- Context
- Decisions
- Files in scope
- Do not touch
- Approach
- Slices
- Acceptance
- Risks / traps
- No-gos
- Commit discipline

## Stop Conditions

Stop and ask when:
- acceptance is not observable
- target files/modules are guessed
- user intent conflicts with repo state
- requested scope becomes multiple unrelated projects

## Output Style

Keep chat terse:
- `Have:` known facts
- `Need:` next decision
- `Ask:` question(s)
