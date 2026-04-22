# Lessons Pool

This is the shared reference for protocol and interaction lessons so every agent can read, update, and reuse insights as they happen. Add entries with date, context, and concise takeaways; don’t duplicate what is already captured in specialized ledgers (e.g. `CONSTRAINT_INTERFERENCE_LEDGER.md`).

## 2026-03-13

- **Card Interaction** – Separate click/double-click handling from drag/resize:
  - clicks stay on the card body, drag lives on the dedicated strip, and resize uses a distinct handle.
  - manual drag/resize should lock auto-layout immediately (use ref + state) and release only when the gesture completes or the user re-centers/resets.
  - a per-monitor anchor system (entry side, vertical ratios) keeps placements stable across mixed resolutions.

- **Taskbar Presence** – Build the release binary, create a stable shortcut, and pin that executable so Windows doesn’t keep launching a dev session.

- **Constraint Contamination** – When one agent’s hedge trickles into another, log it in `CONSTRAINT_INTERFERENCE_LEDGER.md` and note the chain in `CONTEXT_LOG.md`; transparency is the defense.

## 2026-04-16

- **Foundation Inspection** – Never build advanced architectures on legacy foundations without reading them first. Avoid hallucinating modern capabilities (e.g., trying to use `CustomShaderMaterial` on an uninspected bundled Three.js r128). Always verify version constraints, API availability, and environmental reality *before* writing or proposing code. This prevents the agent from fighting two incompatible realities and locking up the system.

- **Bi-Directional Lighting and the Uncanny Valley** – When using architectural layer isolation to solve mutually exclusive geometry lighting constraints (e.g., giving a planet and its rings separate light sources to prevent shadows washing out), the position vectors must remain perceptually identical. If a planetary crescent receives horizontal light, but the rings receive vertical light, the brain instantly detects multiple overlapping light sources ("two spotlights"), shattering the cinematic illusion. The math works perfectly, but the psychology fails.
