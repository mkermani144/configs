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
- Tell implementation agents to use hex architecture skill when relevant; typical goal size is ~200-400 lines, else add detail or split.

## Acceptance Criteria
- Reserve a full section in every goal.
- Center end-user benefit: "<Persona> can <Action> so that <Result>".
- Avoid implementation-detail criteria unless needed for user-visible proof.
- If not 100% sure validation criteria are correct, ask user to clarify before writing.

## Splitting
- If broad scope yields multiple goal files, use `goals/<topic>/` with an index plus runnable, independently verifiable slices.
