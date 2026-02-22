# Testing Recipes

Test behavior at the layer that owns it.

## Domain Service Recipe

- Use test doubles for every port dependency.
- Test:
  - success path
  - expected business failure path
  - unexpected dependency failure path
- Assert on domain outputs and domain errors only.
- Keep tests deterministic and fast.

## Inbound Adapter Recipe

- Test boundary input parsing and validation mapping.
- Test mapping from boundary request to domain request.
- Test mapping from domain result and error to boundary response.
- Avoid real external systems in these tests.

## Outbound Adapter Recipe

- Test translation between domain port contracts and concrete dependency calls.
- Test mapping of dependency failures into domain errors.
- Avoid re-testing domain business rules in outbound tests.

## Integration Smoke Recipe

- Test only critical end-to-end flows.
- Validate wiring, config, and major boundary contracts.
- Keep count small; use unit tests for logic depth.

## Minimum Test Bar Per Use-Case

- 1 domain service success test
- 1 domain service failure test
- 1 inbound mapping or error-mapping test
- 1 integration happy-path or equivalent smoke flow

## Signals of Poor Test Architecture

- Most logic tested only end-to-end.
- Domain tests require real external systems.
- Boundary tests assert business rules instead of mapping behavior.
- Frequent flaky tests caused by shared mutable state or time coupling.
