---
name: hexarch-rust
description: Build, refactor, and review Rust codebases using hexagonal architecture (ports and adapters). Use when requests mention clean architecture layering, dependency direction, domain isolation, repository/API ports, adapter implementations, migrating legacy Rust modules into domain/application/infrastructure boundaries, or adding tests around use-case and IO boundaries.
---

# Hexarch Rust

## Outcome

Produce Rust code with strict dependency flow:
- `domain <- application <- adapters <- bootstrap`
- Keep domain pure; isolate IO/framework details in adapters.

## Workflow

1. Map existing code.
- Identify entities, value objects, use cases, and side effects.
- Flag framework and transport types leaking into business logic.

2. Define boundaries.
- Put invariants and core behavior in `domain`.
- Put use cases and ports (`trait`s) in `application`.
- Put inbound/outbound translations in `adapters`.
- Keep dependency wiring in `bootstrap`.

3. Refactor incrementally.
- Move one feature slice at a time.
- Introduce ports before replacing concrete dependencies.
- Preserve behavior with focused tests before/after each move.

4. Implement adapters.
- Map external DTO/schema types at adapter edge.
- Keep retries, logging, metrics, caching in adapters.
- Keep domain/application unaware of transport, DB, and SDK details.

5. Verify architecture.
- Unit test domain and use cases with fakes.
- Integration test adapters with real dependencies when possible.
- Review imports; reject outward dependencies from inner layers.

## Rules

- Depend inward only.
- Keep traits small and behavior-oriented.
- Enforce invariants in constructors/smart constructors.
- Return domain/application errors internally; map to HTTP/CLI/queue errors at inbound adapters.
- Keep `Arc<dyn Port>` at composition boundaries; prefer concrete types internally.

## Default Layout

```text
src/
  domain/
  application/
  adapters/
    inbound/
    outbound/
  bootstrap/
```

## Request Mapping

- "Refactor Rust service to clean architecture" -> run full workflow.
- "Add Postgres/Redis without polluting core" -> add outbound port + adapter.
- "Review architecture boundaries" -> audit dependency direction + test gaps.
- "Add endpoint/consumer" -> inbound adapter invoking existing use case.
