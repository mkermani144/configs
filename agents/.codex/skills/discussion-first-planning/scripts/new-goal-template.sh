#!/usr/bin/env bash
set -euo pipefail

# Generate the fixed goal skeleton so recurring policy text cannot drift.
title="${1:-Implementation Goal}"
output_path="${2:-}"

render_template() {
  cat <<EOF
# ${title}

## Goal
<!-- Fill with the user-facing outcome and why it matters. -->

## Current State
<!-- Fill with verified local state, repo conventions, and relevant constraints. -->

## Implementation Placement
<!-- Fill with target directories/modules and ownership boundaries. -->

## Key Files
<!-- Fill with exact paths the executing agent should inspect or modify. -->

## Data Flow
<!-- Fill with inputs, transformations, persistence, outputs, and side effects. -->

## Execution Plan
<!-- Fill with ordered implementation slices sized for reviewable commits. -->

## Tests
<!-- Fill with unit/integration/UI/manual checks and exact commands. -->

## Validation / Acceptance Criteria
- \`<Persona>\` can \`<Action>\` so that \`<Result>\`.
- Criteria describe concept, function, and end-user benefit first.
- Implementation-detail criteria are allowed only when needed for user-visible proof.
- If validation criteria are not 100% clear, ask the user to clarify before writing.

## Risks
<!-- Fill with likely regressions, migration hazards, and verification gaps. -->

## No-Gos
<!-- Fill with explicit exclusions and changes the agent must not make. -->

## Git / Commit Policy
- Commit every logical change separately.
- Commit early and often during implementation; do not batch unrelated work.
- Stage only files touched for the current logical change.
- Do not commit local plan, goal, or scratch artifacts unless the user explicitly asks.
- Before every commit, run: \`git diff --cached | rg -n '/Users/|/home/'\`
- If the leak scan matches, stop and warn the user before committing.
- If repo policy, user instructions, or existing changes conflict, stop and ask.

## Notes For The Executing Agent
- Verify current local state before changing code.
- For architecture-heavy implementation, use the relevant hex architecture skill.
- Keep changes scoped to this goal; leave unrelated work untouched.
EOF
}

if [[ -n "${output_path}" ]]; then
  mkdir -p "$(dirname "${output_path}")"
  render_template >"${output_path}"
  printf '%s\n' "${output_path}"
else
  render_template
fi
