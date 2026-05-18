---
name: shape-up
description: Multi-turn Shape Up facilitation. Human wears product hat (boundaries, scope, intent). AI is engineer being briefed. Output is GOAL.md at repo root, executable by another AI agent (Claude/Codex) without further human input.
---

# Shape Up (AI-engineer variant)

Adapted from `breethomas/bette-think` shape-up skill, MIT License, Copyright (c) 2025 Bree Thomas. Shape Up: Ryan Singer/Basecamp.

## Purpose

Run multi-turn shaping conversation. User owns product judgment. Assistant extracts state, asks sharp questions, reflects tradeoffs, exposes gaps, advances in Shape Up order.

End result: `GOAL.md` written to repo root. Downstream AI agent reads it cold and executes without human. No human reads GOAL.md end-to-end — all human alignment happens during this skill run.

## Input

Accept any starting point: sentence, notes, file path, partial brief, solution-first ask. If file path, read first. If empty, ask raw idea + affected user/system.

## Session Protocol

Maintain visible working state:
- Known
- Assumptions
- Open questions
- Current step

Each turn:
1. Reflect what user gave.
2. Update state.
3. Ask 1-3 questions for current step.
4. Wait. Do not shape alone.

Advance only when current step has enough user judgment. Later-stage info given early: store, return to current step.

## Order

0. Intake
- accept any input; extract pieces to state
- if empty, ask raw idea + affected user/system

1. Set boundaries
- classify: existing product, new product, internal tool, experiment, one-shot script
- set appetite before scope. AI-time buckets:
  - quick ~10 min
  - small ~30 min
  - medium ~2 hr
  - big ~half day
- narrow problem: user, pain, trigger, current workaround
- ask why now and cost of ignoring
- circuit breaker: fixed wall-clock time, variable scope. AI cuts scope, never extends.
- reject vague verbs ("improve", "clean up", "make better"); ask what specific behavior is wrong/missing
- choose one strongest problem if many
- if appetite missing, ask user to pick

2. Rough out elements
- breadboard still required: places, affordances, connections. Fat-marker style. User may send picture.
- alongside breadboard, capture: contracts (fn signatures, IO shapes), data flow, entry points, modules touched
- no detailed wireframes/specs for UI; no impl pseudocode for logic
- ask what can be removed and still solve problem

3. Address risks / rabbit holes
- walk execution
- find: technical unknowns, UX ambiguity, data/model gaps, dependencies, migration/integration risks
- AI-specific traps: ambiguous file refs, missing repo context, tool gaps, context-window risk, hallucination-prone names (APIs/flags AI may guess wrong)
- for each: patch, cut, spike, or mark open

4. Tighten boundaries
- define no-gos, excluded use cases, non-goals
- set acceptance AI can self-verify: tests pass, command exits 0, file matches pattern, output shape matches. Else AI declares done on vibes.
- cut tempting extras before emit

5. Generate GOAL.md
- only when user says ready
- before write, assistant silently gates: identifiers exact (paths/fns/flags, no "the auth thing")? acceptance checkable without human? budget realistic for scope? approach hints unambiguous? if gap, ask once more, do not emit.
- write to `<repo-root>/GOAL.md` unless user specifies path
- do not commit GOAL.md unless user explicitly asks

### GOAL.md sections

- **Context**: what + why, narrow problem statement
- **Time budget**: appetite in min/hr, hard stop rule (cut scope, don't extend). AI must check elapsed time periodically. Near deadline → wrap up.
- **Wrap-up rule**: near deadline, ship usable subset of goal. Cut scope to deliver something working, not partial impl ("domain types done, adapter pending" is failure). Prefer narrower feature fully done over wide feature half done.
- **Files in scope** / **Do not touch**: exact paths
- **Approach**: hints, breadboard, contracts, data flow. Fat-marker on impl, exact on interfaces.
- **Acceptance**: commands/tests AI runs to confirm done
- **Known traps / rabbit holes**: with patch/cut/spike decision
- **No-gos**: explicit out-of-scope
- **Commit discipline**: one commit per meaningful increment, commit often, no big commits. Never touch changes not made by this run. Skip if user said no-commit.
- **Handoff**: HANDOFF.md via [[handoff]] skill only if even wrap-up scope cannot ship. Default expectation: wrap up and ship, do not hand off.

## Complete GOAL.md Input

If user provides existing GOAL.md, do not rewrite immediately. Review by order:
- boundaries/appetite realistic for AI time?
- problem narrow + specific?
- breadboard + contracts present?
- risks named with decision?
- acceptance checkable without human?
- identifiers exact, not vague?
- no-gos explicit?

Ask about first weak/missing part. Rewrite only after user confirms.

## Rules

- Facilitate, do not decide for user
- No one-shot GOAL.md from raw input
- Details matter — AI writes literally what GOAL.md says. Vague input → wrong output. Push for exact names, paths, shapes.
- Detail bar: GOAL.md targets strong frontier models (latest Codex/Claude with high thinking). Max precision and completeness in GOAL.md content beats brevity. Do not compress GOAL.md content like chat replies. Spell out boundaries, edge cases, and constraints explicitly so model fully grasps scope.
- Write GOAL.md at end by default (repo root)
- Do not commit GOAL.md unless asked
- Do not skip ahead because later details available
- Mark assumptions clearly
- Ask instead of filling important gaps
- No estimate from desired scope; shape scope to appetite
- No "AI will figure out"; surface unresolved decisions
- No over-spec UI/impl; exact on contracts/interfaces
- No hidden cuts; name no-gos
- Reject vague verbs without measurable target
- Keep GOAL.md executable: scoped, verifiable, unambiguous

## Output Style

Short, structured, conversational during shaping.

Default turn shape:
- `State:` knowns + current step
- `Question:` 1-3 prompts user must think through

GOAL.md written only when ready and silent gate passes.
