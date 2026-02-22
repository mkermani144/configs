---
name: rust-hexarch
description: >
  Build or refactor Rust applications to hexagonal architecture (ports/adapters)
  with domain-owned services, models, and errors. Use when extracting business
  logic from handlers/controllers/workers, introducing trait-based ports,
  implementing inbound/outbound adapters, mapping boundary errors separately from
  domain errors, enforcing invariants with domain value types, and improving
  testability through dependency injection and test doubles.
---

# Rust Hexarch

Apply this skill use-case by use-case. Optimize for small, reversible refactors.

## Workflow

Prefer a small commit after each completed step or slice.

1. Pick one use-case to create or refactor.
2. Define domain request and result types, plus newtypes/value objects for key fields.
3. Define or refine a domain service method for the behavior.
4. Define domain ports for external capabilities the service needs.
5. Implement or update adapters that satisfy those ports.
6. Parse raw boundary input into domain types early; map domain output back to boundary DTOs.
7. Wire concrete adapters in bootstrap code.
8. Add or update tests, then remove dead paths.

## Non-Negotiables

- Keep domain code free of framework, protocol, and vendor SDK types.
- Keep business decisions in domain service, entities, and value objects.
- Keep ports domain-owned; make adapters conform to ports.
- Keep adapters as translators only.
- Keep domain errors separate from public or boundary errors.
- Parse at boundaries and use domain newtypes/value objects instead of passing raw primitives.
- Validate invariants at domain boundaries using constructors or factories.
- Keep bootstrap thin: configure, compose, start.
- Keep behavior backward-compatible unless a change is explicitly requested.

## Suggested Single-Crate Layout

```text
src/
  domain/<context>/{models.rs,service.rs,ports.rs,errors.rs}
  adapters/inbound/<trigger_or_transport>/{handlers.rs,dto.rs,error_map.rs}
  adapters/outbound/{dependency_a.rs,dependency_b.rs}
  app/{bootstrap.rs,config.rs}
  main.rs
```

## When To Load References

- Load `references/refactor-slices.md` for incremental migration recipes.
- Load `references/testing-recipes.md` for layer-by-layer test design.

## Execution Protocol

1. Restate the use-case and coupling problem in 2-4 lines.
2. Propose the smallest viable change slice.
3. Implement domain-first: types, errors, service, ports.
4. Implement adapters and wiring for the slice.
5. Add tests for service behavior and boundary mapping.
6. Commit the completed slice with a focused message.
7. Report what changed, what did not, and the next slice.
