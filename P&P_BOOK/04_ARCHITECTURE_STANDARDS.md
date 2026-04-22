# Architecture Standards

## Objectives
- Maintain modularity and clarity.
- Avoid fragile coupling.
- Favor explicit interfaces over implicit behavior.

## Constellation Model
- Core services are centralized, Stars are modular.
- Every Star should run standalone and constellation-integrated.
- Shared overlays and shared memory layers must be optional and reversible.

## Standards
- Stable naming and predictable structure.
- Explicit ownership of source-of-truth files.
- No manual edits to generated artifacts.
- Clear separation of source, build outputs, and release artifacts.

## Applings Architecture Rule
- Treat reusable modules ("applings") as first-class architecture assets.
- Keep applings in designated source locations with clear ownership.
- Require explicit contracts for each appling (inputs, outputs, side effects).
- New product capability should be delivered by composing applings whenever possible.
- Avoid one-off feature code that cannot be harvested into reusable modules.

## Trust And Communication
- Scope actors by manifest and validated capability contracts.
- Version and validate inter-process/inter-app messages.
- Audit critical communication paths.

## Quality Rules
- Prefer simple deterministic logic over clever complexity.
- Avoid magic values; use named constants.
- Keep functions focused and testable.
- Use consistent error handling patterns.

## Integrity Rules
- No silent fallback that masks critical failure.
- No stale duplicate source files without ownership designation.
- No runtime dependency choices that undermine delivery context without explicit rationale.

## Customization Safety Pattern
- Use stable identity keys for user-editable entities.
- Protect persistence with validation guards.
- Keep internal UI excluded from user-edit targeting.

## Versioning Rules
- Keep rollback-ready snapshots for high-risk changes.
- Avoid destructive overwrite workflows.
- Preserve auditability of major decisions.

## Platform Safety Notes
- Never hardcode environment-specific handles when dynamic targeting exists.
- Prefer robust transport for complex payloads (structured files or validated IPC over fragile argument packing).

## Visual & Physical Asset Design Rules
- Every physical UI/UX asset must possess exactly one standout, distinctive characteristic (be it a unique micro-animation, a striking gradient edge, or an asymmetric structural weight). Do not allow generic or flat components to dilute the Alethéari aesthetic.
