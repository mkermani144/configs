---
name: discussion-first-planning
description: Use when user asks to turn an existing conversation, notes, images, or rough idea into a goal/spec for another coding agent. Preserve natural conversation style, then generate a detailed executable goal with architecture and implementation guidance when requested.
metadata:
  short-description: Discussion-first planning and goal slicing
---

# Goal From Conversation

Use when conversation should become executable agent work.

## Rules
- Do not force a Q&A template. Let normal conversation, images, and notes accumulate.
- Write a goal/spec only when user asks or clearly confirms.
- Prefer repo artifact conventions; inspect if unknown. If absent, use `goals/<descriptive-name>.md`.
- Do not include appetite/time budget unless user asks.
- Do not commit goal/spec/plan artifacts unless user asks.

## Goal Quality
- Goal should be detailed enough for a fresh coding agent with no chat context.
- Include implementation placement, key files, data flow, tests, acceptance, risks, no-gos, and commit-often policy.
- For most implementation work, tell executing agent to use the hex architecture skill.
- Typical goal size is ~200-400 lines. If far shorter, add missing details. If far longer, split.

## Splitting
- If scope is broad, write an index plus smaller runnable slice files.
- Each slice should be executable by one agent, independently verifiable, reviewable, and named by behavior/outcome.

## Ask Only When Needed
Ask when acceptance is not observable, target paths are guessed, architecture boundary is unclear, or user intent conflicts with repo state.
