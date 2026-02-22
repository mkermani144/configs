# Refactor Slices

Use one slice at a time. Keep each slice independently shippable.

## Slice 1: Boundary-to-Service Extraction

- Goal: stop doing business decisions in boundary code.
- Starting smell: handlers/controllers branch on business rules directly.
- Minimal moves:
  - Add domain request and result types.
  - Add one service method for the use-case.
  - Move branching and decisions into the service.
  - Keep boundary layer for parse-call-format only.
- Done check: boundary code has no business decisions.

## Slice 2: Direct Dependency Calls to Port Calls

- Goal: remove direct infrastructure calls from domain and boundary logic.
- Starting smell: use-case code calls concrete clients directly.
- Minimal moves:
  - Define a domain port for required capability.
  - Change service dependency to the port.
  - Implement adapter using existing concrete integration.
- Done check: use-case logic depends on ports only.

## Slice 3: Domain Error Contract

- Goal: make failure modes explicit at domain level.
- Starting smell: opaque error strings or mixed error types across layers.
- Minimal moves:
  - Define domain error enum for expected business failures.
  - Include one variant for unexpected failures.
  - Map adapter-specific failures into domain errors.
  - Map domain errors into boundary/public errors separately.
- Done check: domain interfaces return domain errors only.

## Slice 4: Invariant Enforcement

- Goal: prevent invalid state from entering domain behavior.
- Starting smell: repeated ad-hoc validation across layers.
- Minimal moves:
  - Parse raw boundary fields into domain value objects/newtypes early.
  - Introduce value objects or constructors for constrained values.
  - Enforce invariants in constructors/factories.
  - Update service inputs to require validated domain types.
- Done check: invalid raw values cannot bypass domain checks.

## Slice 5: Thin Bootstrap

- Goal: keep startup code compositional and replaceable.
- Starting smell: bootstrap or main contains business behavior.
- Minimal moves:
  - Move behavior to domain service or adapter modules.
  - Leave bootstrap with config loading, wiring, and startup only.
- Done check: bootstrap has composition logic only.

## Defaults During Refactor

- Prefer incremental refactor over rewrite.
- Prefer narrow ports over broad utility interfaces.
- Prefer explicit mapping functions when behavior matters.
- Prefer compatibility with current external behavior unless asked to change.
