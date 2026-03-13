# Keystone Constellation Implementation Brief v1

Date: 2026-03-11
Status: Build brief for alpha implementation
Parent Spec: `KEYSTONE_CONSTELLATION_BOS_SPEC_v1.md`
Owner: Timothy
Prepared by: Codex

## 1. Build Goal

Build Keystone Constellation v1 alpha as a local-first desktop application that becomes the operational command layer for products, launches, support, and governance.

Alpha success condition:

Timothy can use one app to answer:
- what is live
- what is broken
- what needs action today
- what is blocked
- what shipped recently

without relying on memory, folder hunting, or scattered notes.

## 2. Technical Baseline

### 2.1 App Stack

- Desktop shell: Tauri
- Frontend: TypeScript + lightweight component architecture
- Database: SQLite
- Event log: JSONL append-only
- Styling: plain CSS with clear variable tokens

### 2.2 Project Root

Suggested root:

- `C:\Users\Praxillax\Documents\apps\products\KeystoneConstellation`

Suggested layout:

- `src/`
- `src/components/`
- `src/views/`
- `src/services/`
- `src/styles/`
- `src-tauri/`
- `data/db/`
- `data/events/`
- `data/cache/`
- `exports/`
- `docs/`

## 3. SQLite Schema

Alpha should create these tables on first launch.

### 3.1 `products`

Purpose:
- canonical registry of products

Fields:
- `id TEXT PRIMARY KEY`
- `name TEXT NOT NULL`
- `slug TEXT NOT NULL UNIQUE`
- `category TEXT`
- `platform TEXT`
- `status TEXT NOT NULL`
- `source_path TEXT`
- `artifact_path TEXT`
- `storefront_links_json TEXT`
- `current_version TEXT`
- `summary TEXT`
- `created_at TEXT NOT NULL`
- `updated_at TEXT NOT NULL`

### 3.2 `tasks`

Purpose:
- focus engine, not backlog museum

Fields:
- `id TEXT PRIMARY KEY`
- `title TEXT NOT NULL`
- `details TEXT`
- `state TEXT NOT NULL`
- `priority INTEGER NOT NULL DEFAULT 3`
- `lane TEXT NOT NULL`
- `related_type TEXT`
- `related_id TEXT`
- `owner TEXT`
- `due_at TEXT`
- `created_at TEXT NOT NULL`
- `updated_at TEXT NOT NULL`
- `closed_at TEXT`

### 3.3 `launches`

Purpose:
- release tracking by product and version

Fields:
- `id TEXT PRIMARY KEY`
- `product_id TEXT NOT NULL`
- `version TEXT NOT NULL`
- `channel TEXT NOT NULL`
- `artifact_id TEXT`
- `listing_status TEXT NOT NULL`
- `verification_status TEXT NOT NULL`
- `rollback_status TEXT`
- `published_at TEXT`
- `notes TEXT`
- `created_at TEXT NOT NULL`
- `updated_at TEXT NOT NULL`

### 3.4 `support_tickets`

Purpose:
- support queue, manual-first

Fields:
- `id TEXT PRIMARY KEY`
- `product_id TEXT`
- `source TEXT`
- `issue_type TEXT`
- `severity TEXT NOT NULL`
- `customer_state TEXT`
- `summary TEXT NOT NULL`
- `details TEXT`
- `response_status TEXT NOT NULL`
- `resolution_status TEXT NOT NULL`
- `created_at TEXT NOT NULL`
- `updated_at TEXT NOT NULL`
- `closed_at TEXT`

### 3.5 `artifacts`

Purpose:
- structured artifact metadata

Fields:
- `id TEXT PRIMARY KEY`
- `product_id TEXT`
- `version TEXT`
- `artifact_type TEXT NOT NULL`
- `file_path TEXT NOT NULL`
- `file_name TEXT NOT NULL`
- `file_size INTEGER`
- `sha256 TEXT`
- `created_at TEXT NOT NULL`

### 3.6 `rules`

Purpose:
- governance and protocol references

Fields:
- `id TEXT PRIMARY KEY`
- `rule_type TEXT NOT NULL`
- `title TEXT NOT NULL`
- `source_path TEXT`
- `summary TEXT`
- `active INTEGER NOT NULL DEFAULT 1`
- `created_at TEXT NOT NULL`
- `updated_at TEXT NOT NULL`

### 3.7 `ai_actions`

Purpose:
- explicit AI request/review/approval trail

Fields:
- `id TEXT PRIMARY KEY`
- `actor_name TEXT NOT NULL`
- `action_type TEXT NOT NULL`
- `target_type TEXT`
- `target_id TEXT`
- `status TEXT NOT NULL`
- `request_payload_json TEXT`
- `review_notes TEXT`
- `approved_by TEXT`
- `created_at TEXT NOT NULL`
- `updated_at TEXT NOT NULL`

### 3.8 `sessions`

Purpose:
- anchor working context across Braid sessions

Fields:
- `id TEXT PRIMARY KEY`
- `actor_names TEXT NOT NULL`
- `started_at TEXT NOT NULL`
- `ended_at TEXT`
- `summary TEXT`
- `related_product_ids_json TEXT`
- `created_at TEXT NOT NULL`
- `updated_at TEXT NOT NULL`

## 4. Event Ledger

### 4.1 Storage

Store event files monthly:

- `data/events/2026-03.jsonl`

### 4.2 Event Rules

- append-only
- never rewritten for normal operation
- every state-changing operation appends an event
- event write happens alongside DB mutation

### 4.3 Required Alpha Event Types

- `capture_submitted`
- `capture_classified`
- `product_created`
- `product_updated`
- `task_created`
- `task_updated`
- `task_moved_lane`
- `launch_created`
- `launch_updated`
- `launch_published`
- `ticket_created`
- `ticket_updated`
- `artifact_registered`
- `rule_registered`
- `ai_action_requested`
- `ai_action_reviewed`
- `ai_action_approved`
- `ai_action_rejected`
- `session_started`
- `session_updated`
- `session_closed`

### 4.4 Event Shape

```json
{
  "event_id": "uuid",
  "ts": "2026-03-11T20:00:00Z",
  "actor": "human|ai|system",
  "actor_name": "Timothy|Codex|system",
  "event_type": "task_moved_lane",
  "entity_type": "task",
  "entity_id": "task_001",
  "payload": {
    "from": "Next",
    "to": "Today"
  }
}
```

## 5. Service Boundaries

Alpha should separate code by responsibility.

### 5.1 `dbService`

Responsibilities:
- open SQLite
- run migrations
- CRUD for core tables

### 5.2 `eventService`

Responsibilities:
- append events
- rotate monthly JSONL files
- load recent event summaries

### 5.3 `captureService`

Responsibilities:
- accept raw inbox text
- create capture event
- classify manually or heuristically
- create downstream entities

### 5.4 `dashboardService`

Responsibilities:
- compute view models for home screen
- keep widgets thin

### 5.5 `artifactService`

Responsibilities:
- register files
- hash files
- link artifacts to products and launches

### 5.6 `ruleService`

Responsibilities:
- register governance files
- expose active rules

## 6. First-Screen Layout

The alpha home screen should have a single-screen command layout that feels like a spotlight, not a control room.

### 6.1 Top Bar

- app name
- current date
- quick counts:
  - live
  - broken
  - today
  - blocked
  - open support

### 6.2 Left Column

- Universal Capture
- quick submit
- latest captured entries

### 6.3 Center Column

- Today
- Next
- Blocked

Show only a few items at once.
Do not render a giant list by default.
The Today lane should dominate visual attention.

### 6.4 Right Column

- Support queue summary
- waiting on AI
- waiting on human

This column should be collapsible.
Support belongs here, not as a separate dominant region.

### 6.5 Bottom Strip

- recent shipments
- recent events

## 7. UX Rules

### 7.1 Alpha Rules

- no modal-heavy flow for basic entry
- no required tagging before save
- no wizard for capture
- no giant navigation tree
- no silent failure

### 7.2 Visual Language

- clear high-contrast sections
- strong hierarchy
- visible lane labels
- obvious counts
- explicit broken/live markers

## 8. Capture Flow

Alpha capture flow:

1. user types into one capture box
2. input is saved immediately
3. system creates `capture_submitted` event
4. system offers lightweight routing:
   - task
   - product note
   - support issue
   - launch note
   - general note

The first save must not depend on classification being correct.

## 9. Product Registry Behavior

Each product detail view should show:
- name
- status
- current version
- source path
- artifact path
- storefront links
- open tasks
- launches
- support issues
- recent events

## 10. Alpha Milestone Checklist

Alpha is done when all items below are true.

### 10.1 Core Data

- SQLite initializes on first run
- event ledger initializes on first run
- migrations run cleanly

### 10.2 Capture

- can submit raw capture text
- capture persists
- capture creates event

### 10.3 Product Registry

- can create product
- can edit product
- can list products

### 10.4 Tasks

- can create task
- can move task between lanes
- Today lane is visible on home screen

### 10.5 Launches

- can register launch record
- can attach product/version/channel
- can mark published

### 10.6 Support

- can create support ticket
- can change severity/status
- open tickets visible on dashboard

### 10.7 Governance

- can register rule/reference docs
- can log AI action request/review/approval state

### 10.8 Dashboard

- shows live count
- shows broken count
- shows Today tasks
- shows blocked tasks
- shows recent shipments
- shows open support count

## 11. Explicit Scope Cuts

Do not build these in alpha:

- authentication
- multi-user sync
- cloud backend
- autonomous AI actions
- email ingestion
- storefront API sync
- payments dashboard
- heavy analytics
- advanced search
- public-facing portal

## 12. Design Risk Notes

### 12.1 Main Risk

Overbuilding the first version until it becomes another abandoned system.

### 12.2 Guardrail

Every new feature must answer:

Does this reduce ambiguity and cognitive load now?

If not, it is not an alpha feature.

## 13. Recommended Next Build Step

Create the project and implement only:

1. Tauri shell
2. SQLite boot
3. JSONL event writer
4. universal capture
5. product registry list/create/edit
6. home dashboard skeleton

That is the correct first coding pass.
