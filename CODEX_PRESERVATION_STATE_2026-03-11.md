Date: 2026-03-11
Status: Active preservation snapshot
Prepared by: Codex

# Purpose

This file preserves Codex-side working state before Keystone Constellation is fully operational.

It exists so session loss does not destroy:
- current role assignments
- current architecture decisions
- current project status
- current next actions

# Current Role Split

- Codex: designer, builder, implementer
- Claude: reviewer, auditor, verifier, gap-finder

This role split has been written into:
- `MASTER DOCS\P&P_BOOK\02_ENGINEERING_EXECUTION.md`
- `MASTER DOCS\AI_MASTER.md`

# Keystone Constellation Status

Canonical docs created:
- `MASTER DOCS\KEYSTONE_CONSTELLATION_BOS_SPEC_v1.md`
- `MASTER DOCS\KEYSTONE_CONSTELLATION_IMPLEMENTATION_BRIEF_v1.md`

Project scaffold created at:
- `C:\Users\Praxillax\Documents\apps\products\KeystoneConstellation`

Scaffold includes:
- Vite + TypeScript shell
- Tauri config and Rust shell
- alpha dashboard UI
- initial project structure
- docs tying the code to the spec

Not yet implemented:
- SQLite boot layer
- first real migration
- JSONL event writer
- persistent universal capture
- sessions table in running code
- real dashboard state from persistence

# Architectural Decisions Locked

1. Keystone is the real business operating system spine, not a throwaway prototype.
2. Local-first is mandatory.
3. Filesystem is the vault, not the brain.
4. Operational state belongs in SQLite.
5. Historical memory belongs in append-only JSONL event logs.
6. Sessions are first-class records and must anchor Braid context.
7. The home screen must feel like a spotlight, not a control room.
8. The Today lane should dominate visual attention.
9. Support lives in the right zone and should be collapsible.
10. AI must operate through protocol, not improvisation.

# Operational State As Of This Snapshot

Commercial state:
- Gumroad products posted
- TikTok videos finished and released

Bolt Engine state:
- desktop, mobile, and bundle are live products
- Play Store release AAB was built successfully during this session

Key mobile signing paths:
- `C:\Users\Praxillax\Documents\apps\products\AnothenBoltEngine_Mobile\android\keystore.properties`
- `C:\Users\Praxillax\Documents\apps\products\AnothenBoltEngine_Mobile\android\anothen-release-key.jks`

Gumroad delivery paths clarified:
- desktop uses desktop zip
- mobile uses mobile zip for Gumroad customer delivery
- bundle uses complete pack zip
- AAB is for Google Play only

# Immediate Next Build Order

1. Implement SQLite initialization in Keystone.
2. Add first migration covering:
- products
- tasks
- launches
- support_tickets
- artifacts
- rules
- ai_actions
- sessions
- captures
3. Implement append-only JSONL event writer.
4. Implement persistent universal capture.
5. Replace static dashboard state with real persisted data.

# Guardrails

- Do not widen scope before the data spine exists.
- Do not add MCP, multi-agent orchestration, or cloud sync in v1.
- Do not trust memory over recorded state.
- Keep Keystone alpha focused on reducing ambiguity and cognitive load.

# Session Note

Timothy explicitly asked for Codex preservation before building Timothy's memory system.
This file is part of that preservation.
