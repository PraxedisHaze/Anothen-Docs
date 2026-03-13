# ANOTHEN HUB APP SPEC v1

## 1. Purpose
Build one control app that sits between Timothy and all CLI agents, enforces protocol order, tracks evidence, and prevents silent drift.

Primary outcome:
- No release, repair, or ad launch can proceed without passing required gates in the required order.

## 2. Product Definition
`Anothen Hub` is a local-first orchestration app with:
1. Protocol engine (gatekeeper)
2. Task board + session log
3. Evidence locker (screenshots, builds, diffs, test results)
4. Release packaging manager
5. Agent translation layer (human-readable summaries)

## 3. Core Principles
1. `AI_MASTER` stays short; Hub references deeper docs.
2. No hidden moves: every write action is logged.
3. One source of truth per project.
4. Docs-before-launch is mandatory.
5. Fallback-safe: failures degrade to manual checklist, never silent pass.

## 4. MVP Scope (Ship First)
1. Project registry
2. Protocol templates:
   - Debug loop
   - Release prep
   - Gumroad launch
3. Hard gates:
   - Intake complete
   - Plan approved
   - Change evidence attached
   - Build artifact present
   - Docs pack complete
4. Release pack generator:
   - Desktop zip
   - Mobile zip
   - Complete bundle zip
5. Audit log export (`.md` + `.csv`)

## 5. User Flows
### A. Repair Flow
1. Open project
2. Enter issue intake
3. Run protocol steps in order
4. Attach evidence at each gate
5. Mark verified

### B. Release Flow
1. Select release candidate
2. Validate required docs
3. Build/package artifacts
4. Generate release manifest
5. Mark storefront-ready

### C. Storefront Flow
1. Choose product type (Desktop / Mobile / Bundle)
2. Attach matching artifact
3. Copy generated listing text
4. Record publish timestamps and links

## 6. Data Model (Minimal)
Tables/collections:
1. `projects`
2. `sessions`
3. `tasks`
4. `gates`
5. `artifacts`
6. `evidence`
7. `releases`
8. `storefront_records`

Key fields:
- `status`, `owner`, `timestamp`, `source_path`, `hash`, `notes`, `linked_gate_id`

## 7. Gate Engine Rules
1. Gate order is strict; cannot skip.
2. Failed gate blocks downstream actions.
3. Override requires explicit reason + signature record.
4. Every override is highlighted in final report.

## 8. UI Modules
1. `Home`: active projects + blockers
2. `Protocol Runner`: step-by-step execution
3. `Evidence Panel`: drag/drop or path attach
4. `Release Studio`: package build + manifest
5. `Reports`: customer-safe and engineering logs

## 9. Automation Hooks
1. Run local build scripts (`START.bat`, `npm run android:debug`, etc.)
2. Verify artifact existence + size + timestamp
3. Snapshot key files (`potch`, release notes, known issues)
4. Optional: git status + commit checklist (non-destructive)

## 10. Security + Safety
1. Default allowlist for writable roots only
2. No destructive command execution without explicit confirmation
3. Immutable audit history for release sessions
4. Local data only for MVP

## 11. Tech Stack Recommendation
1. Frontend: Electron + React (or Tauri + React)
2. Local DB: SQLite
3. Orchestration: Python service layer (reusing existing triage patterns)
4. Packaging: native PowerShell scripts for Windows builds

## 12. Rollout Plan
### Phase 1 (1 week)
1. Project registry
2. Protocol runner
3. Audit log

### Phase 2 (1 week)
1. Release pack generator
2. Docs gate checks
3. Storefront record tracker

### Phase 3
1. Agent chat room
2. Playground/world modules
3. Advanced analytics and forecasting

## 13. Definition of Done (MVP)
MVP is done when:
1. A full app release can be executed end-to-end through Hub.
2. Hub blocks out-of-order execution.
3. Hub produces publish-ready artifacts + report with evidence.
4. Another agent can reproduce a release using only Hub output.

## 14. Immediate Next Build Task
Implement `Phase 1` with one seeded project:
- `Anothen Bolt Engine`
- Protocol template: `Release Prep + Gumroad Launch`
