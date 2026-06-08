---
name: discussion-first-planning
description: Use when user mentions setting a goal, defining a goal, extracting into goals, writing a goal, or turning conversation, notes, images, or rough ideas into executable goal/spec files for coding agents.
metadata:
  short-description: Discussion-first planning and goal slicing
---

# Discussion First Planning

## Rules
- Do not force a Q&A template. Let normal conversation, images, and notes accumulate.
- Write a goal/spec only when user asks or clearly confirms.
- Prefer repo artifact conventions; inspect if unknown. If absent, use `goals/<name>.md`.
- Start every goal from `scripts/new-goal-template.sh "<title>" [path]`.
- Preserve template policy sections verbatim; fill only goal-specific content.
- Do not include appetite/time budget unless user asks.
- Do not commit goal/spec/plan artifacts unless user asks.

## Goal Quality
- Goal should be detailed enough for a fresh coding agent with no chat context.
- A goal is valid only with clear Validation / Acceptance Criteria; if expected output or success criteria are even slightly unclear, ask first.
- For most implementation work, tell executing agent to use the hex architecture skill.
- Typical goal size is ~200-400 lines. If far shorter, add missing details. If far longer, split.

## Splitting
- If broad scope yields multiple goal files, put them under `goals/<topic>/` with an index plus runnable slice files.
- Each slice should be executable by one agent, independently verifiable, reviewable, and named by behavior/outcome.

## Ask Only When Needed
Ask only when acceptance, paths, architecture boundary, or repo/user intent conflict is unclear.
