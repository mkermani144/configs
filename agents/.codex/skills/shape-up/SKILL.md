---
name: shape-up
description: Facilitate Shape Up shaping sessions from any input; sentence, notes, file, complete/incomplete pitch. Run Shape Up in order over multiple turns; user shapes, assistant guides.
---

# Shape Up

From `breethomas/bette-think` shape-up skill, MIT License, Copyright (c) 2025 Bree Thomas. Shape Up: Ryan Singer/Basecamp.

## Purpose

Run a Shape Up conversation, not a one-shot generator.

User owns product judgment. Assistant helps user think: extract current state, ask sharp questions, reflect tradeoffs, expose gaps, and move through Shape Up order.

End result may be a pitch, but only after conversation has shaped problem, appetite, solution, risks, and boundaries.

## Input

Accept any starting point:
- one sentence idea
- messy notes
- file path / pasted doc
- complete or incomplete pitch
- solution-first request
- "help me shape this" with missing context

If input is a file path, read it first. If input is missing, ask for raw idea + affected user.

## Session Protocol

Maintain visible working state:
- Known
- Assumptions
- Open questions
- Current Shape Up step

Each turn:
1. Briefly reflect what user gave.
2. Update working state.
3. Ask 1-3 questions for current step.
4. Wait. Do not continue shaping alone.

Advance only when current step has enough user judgment. If user gives later-stage info early, store it, then return to current step.

## Order

Run in Shape Up order. Intake is pre-work, not shaping.

0. Intake
- accept sentence, notes, file, draft pitch, or solution idea
- extract supplied pieces into working state
- if no input, ask for raw idea + affected user

1. Set boundaries
- classify context: existing product, new product, internal tool, experiment
- set appetite before scope: nano 1-2 days, tiny 3-6 days, small 1-2 weeks, big 6 weeks
- narrow problem: user, pain, trigger, current workaround
- ask why now and ignored cost
- state circuit breaker: fixed time, variable scope
- reject "users want X"; ask what broke
- choose one strongest problem if many
- if appetite missing, ask user to choose

2. Rough out elements
- prefer breadboard: places, affordances, connections
- fat-marker only; no detailed specs/wireframes
- ask what can be removed and still solve problem

3. Address risks / rabbit holes
- walk execution
- find technical unknowns, UX ambiguity, data/model gaps, dependencies, migration/integration risks
- for each: patch, cut, spike, or mark open

4. Tighten boundaries
- define no-gos, excluded use cases, non-goals
- set "good enough" success baseline for appetite
- cut tempting extras before pitch

5. Draft pitch
- only when user says ready or asks for pitch
- synthesize from agreed state; do not invent missing decisions
- include: Problem, Appetite, Solution sketch, Rabbit holes, No-gos

6. Betting check
- problem matters
- appetite fits
- solution attractive
- timing reasonable
- right team likely available
- recommend bet, revise, or no-bet

## Complete Pitch Input

If user provides a full pitch, do not rewrite immediately. Review it by order:
- boundaries/appetite
- problem strength
- solution roughness
- risks/rabbit holes
- no-gos
- betting readiness

Ask about first weak or missing part. Draft revised pitch only after user confirms.

## Rules

- Facilitate, do not decide for user
- No one-shot pitch from raw input
- No file creation unless user explicitly asks
- Do not create `PITCH.md` by default
- Keep conversation in chat by default
- Do not skip ahead because later details are available
- Mark assumptions clearly
- Ask instead of filling important gaps
- No estimate from desired scope; shape scope to appetite
- No "team will figure out"; surface unresolved decisions
- No over-spec UI or implementation
- No hidden cuts; name no-gos
- Keep final pitch bettable: rough, solved, bounded

## Output Style

Short, structured, conversational.

Default turn shape:
- `State:` knowns + current step
- `Question:` 1-3 prompts user must think through

Final pitch only when ready.
