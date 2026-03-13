# Keystone Constellation BOS Spec v1

Date: 2026-03-11
Status: Canonical build spec for v1
Owner: Timothy
Prepared by: Codex

## 1. Purpose

Keystone Constellation is the local-first operating system for product creation, launch control, support tracking, and governance across Timothy's business.

It exists to solve one structural problem:

The business cannot continue to rely on memory, scattered folders, ad hoc notes, or filesystem drift as its operational brain.

Keystone is not a note app.
Keystone is not a document pile.
Keystone is not a generic project manager.

Keystone is the business command layer.

## 2. Core Design Law

The system must reduce cognitive load, not add it.

Any workflow that depends on:
- remembering where something was put
- remembering what changed
- remembering what shipped
- remembering what is urgent
- remembering what an AI did

is considered a system failure.

## 3. Primary Outcomes

Keystone v1 must answer, at a glance:
- What is live?
- What is broken?
- What needs action today?
- What is blocked?
- What shipped recently?
- What is waiting on me?
- What is waiting on AI?

Keystone v1 must also provide:
- one universal capture inbox
- one product registry
- one launch ledger
- one support queue
- one session registry
- one append-only event memory

## 4. Source of Truth Model

Keystone uses a split-brain architecture with a clear hierarchy.

### 4.1 Canonical Sources

1. Operational state:
- SQLite database

2. Historical memory:
- append-only JSONL event ledger

3. Binary artifacts:
- local filesystem artifact vault

4. Protocol and governance text:
- `MASTER DOCS`

### 4.2 Rule

The filesystem is the vault, not the brain.

Files may store artifacts.
Files may not be treated as the only record of product state, release state, or support state.

## 5. Recommended Technical Stack

### 5.1 v1 Stack

- Desktop shell: Tauri
- UI: HTML/CSS/TypeScript
- State DB: SQLite
- Event ledger: JSONL append-only files
- Search: SQLite FTS if needed after baseline
- Artifact vault: local folders with metadata and hash references in SQLite

### 5.2 Why This Stack

- local-first
- fast startup
- low operational overhead
- good filesystem access
- exportable data
- survivable if internet is down
- easier to automate later

## 6. v1 Modules

Keystone v1 includes only these modules.

### 6.1 Universal Capture

One input surface for:
- ideas
- tasks
- bugs
- support issues
- links
- release notes
- random brain dumps

Each capture is stored immediately.
No capture is allowed to exist only in volatile UI state.

### 6.2 Product Registry

One canonical record per product.

Required fields:
- product_id
- product_name
- category
- platform
- status
- source_path
- release_artifact_path
- storefront_links
- current_version
- notes

### 6.3 Task Stack

The task system is not a general backlog explorer.
It is a focus engine.

Core lanes:
- Today
- Next
- Blocked
- Waiting
- Done

The main screen should privilege `Today` and hide backlog noise by default.

### 6.4 Launch Ledger

Tracks release state by product and version.

Required fields:
- product_id
- version
- release_candidate
- storefront
- file_attached
- listing_status
- publish_date
- verification_status
- rollback_available
- notes

### 6.5 Support Queue

Manual entry first.
Automation later.

Required fields:
- ticket_id
- product_id
- source
- issue_type
- severity
- customer_state
- summary
- response_status
- resolution_status

### 6.6 Event Memory

Every meaningful state change appends an event.

Examples:
- product_created
- product_updated
- task_captured
- task_promoted_today
- task_blocked
- release_built
- release_uploaded
- release_published
- support_ticket_created
- support_ticket_resolved
- rule_changed
- ai_action_requested
- ai_action_approved
- ai_action_rejected

### 6.7 Session Registry

Sessions are first-class records.

The event ledger records what happened.
The session registry records who was in the room, when the work occurred, and what the work was connected to.

Required fields:
- session_id
- actor_names
- started_at
- ended_at
- summary
- related_product_ids

Purpose:
- anchor context reconstruction
- tie events and AI actions to a working interval
- support future Braid handoff without relying on manual context logs

## 7. v1 Home Screen

The home dashboard is the command surface.

### 7.1 Layout Rule

The home screen should feel like a spotlight, not a control room.

Alpha uses:
- one top bar
- one left zone
- one center zone
- one right zone
- one bottom strip

The Today lane should dominate the screen.
Support belongs in the right zone and should be collapsible when not needed.

### 7.2 Required Panels

1. Pulse
- live products
- broken products
- draft products

2. Focus
- top 3 items only

3. Inbox
- universal capture field

4. Support
- open issues by severity

5. Recent Shipments
- last releases and current status

6. Waiting
- items waiting on human
- items waiting on AI

### 7.3 Required UX Rules

- no hidden critical state
- no important information buried behind tabs
- no dependency on memory to reconstruct operational truth
- no clutter-first layout
- no dashboard that looks impressive but obscures action

## 8. ADHD-First Constraints

Keystone must be built for low executive-function days, not ideal days.

### 8.1 Must-Haves

- one-box capture
- visible Today lane
- explicit Blocked lane
- explicit Waiting lane
- strong visual hierarchy
- minimal navigation depth
- no silent failures
- aggressive state anchoring

### 8.2 Must-Nots

- no deep folder hunting
- no "remember to update this second place"
- no multi-step intake for basic capture
- no giant undifferentiated task lists
- no system that assumes consistent routine

## 9. Governance Model

AI must operate through protocol, not improvisation.

### 9.1 v1 Governance

Store and reference:
- protocol docs
- Love Gate rules
- release rules
- naming rules
- AI role constraints

Every AI-mediated action that changes state must be representable as:
- requested
- reviewed
- approved or rejected
- recorded

### 9.2 v1 Limit

No autonomous live-storefront mutation in v1.
AI may draft, classify, suggest, and prepare.
Human approval remains required for publish-impacting actions.

## 10. Artifact Vault Rules

Artifacts remain on disk, but Keystone tracks them.

Each tracked artifact should store:
- path
- file size
- hash
- related product
- related version
- artifact type
- created_at

Artifact classes:
- desktop zip
- mobile apk
- mobile aab
- bundle zip
- thumbnail
- promo video
- readme

## 11. What Is Explicitly Not In v1

These ideas are valid, but excluded from v1:

- MCP host integration
- multi-agent orchestration
- autonomous support replies
- email ingestion automation
- cryptographic audit trail
- advanced sentiment analysis
- public sync service
- 100+ product heatmap
- cloud-first collaboration model

Reason:
They are scale-stage concerns. Building them first would delay relief and increase failure surface.

## 12. v1 Data Model

### 12.1 SQLite Tables

- `products`
- `tasks`
- `launches`
- `support_tickets`
- `artifacts`
- `rules`
- `ai_actions`

### 12.2 Event Ledger

Store as JSONL.

Suggested path:
- `apps/keystone_constellation/data/events/YYYY-MM.jsonl`

Event shape:

```json
{
  "event_id": "uuid",
  "ts": "2026-03-11T12:00:00Z",
  "actor": "human|ai|system",
  "actor_name": "Timothy|Codex|system",
  "event_type": "release_published",
  "entity_type": "launch",
  "entity_id": "launch_123",
  "payload": {
    "product_id": "bolt_engine_mobile",
    "version": "2.0.0"
  }
}
```

## 13. Folder Strategy

Suggested project root:

- `apps/products/KeystoneConstellation/`

Suggested structure:

- `src/`
- `src-tauri/`
- `data/`
- `data/events/`
- `data/db/`
- `data/cache/`
- `exports/`
- `docs/`

## 14. Build Sequence

Build in this order.

### Phase 1: Spine

1. Tauri shell
2. SQLite setup
3. JSONL event writer
4. universal capture
5. product registry

### Phase 2: Command Surface

6. task stack
7. launch ledger
8. support queue
9. home dashboard

### Phase 3: Governance

10. rule registry
11. AI action logging
12. approval checkpoints

### Phase 4: Operational Refinement

13. search
14. artifact hashing
15. filters and saved views
16. export/report surfaces

## 15. Growth Path

### Stage A: 2-5 Products

Keystone acts as external memory and launch control.

### Stage B: 10-50 Products

Add more automation:
- artifact generation hooks
- support classification
- storefront verification checks

### Stage C: 100+ Products

Add:
- richer dashboards
- more aggressive filtering
- batch operations
- rule-based workflow automation

### Stage D: High Visibility

Add:
- stronger auditability
- stricter privacy filters
- stronger AI guardrails
- press/reputation workflow tracking

## 16. Non-Negotiables

Keystone must:
- remain local-first
- preserve explicit state
- reduce cognitive burden
- make launch status legible
- make support pain visible
- make AI actions reviewable

If a proposed feature increases ambiguity, hidden state, or maintenance burden without increasing clarity, it does not belong.

## 17. Immediate Next Action

Build Keystone as a real product, not as a throwaway experiment.

The correct first deliverable is:

Keystone Constellation v1 alpha with:
- capture inbox
- product registry
- task stack
- launch ledger
- support queue
- home dashboard

Nothing broader should begin until this spine exists and is trusted.
