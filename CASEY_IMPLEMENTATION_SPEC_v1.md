# Casey Implementation Spec v1

Status: Build-facing implementation spec for Casey as the authoritative searchable sink.

Read together with:
- `MASTER DOCS/CASEY_GOVERNANCE_AMENDMENT.md`
- `MASTER DOCS/SINGLE SOURCE OF TRUTH - MASTER SOURCE FOR TIM (1).txt`
- `MASTER DOCS/CASEY_INGESTION_ARCHITECTURE_PROMPT.md`

## Purpose

This document turns the Casey architecture direction into a practical implementation sequence without losing canon boundaries, governance law, or braid standing.

Casey is:
- the authoritative searchable sink for structured ecosystem memory
- a local-first database and retrieval layer
- a memory matrix that indexes the filesystem rather than replacing it

Casey is not:
- the only place truth exists
- a replacement for `MASTER DOCS`
- a hard dependency for Lenny routing or braid survival

## Core Law

1. `MASTER DOCS` remains the canonical human-readable overview and governance layer.
2. The filesystem remains the artifact vault and editable source layer.
3. Casey is the authoritative structured search and retrieval layer.
4. Casey enhances the braid; Casey does not gate survival.
5. All implementation must obey `CASEY_GOVERNANCE_AMENDMENT.md`.

## Record Ontology

Casey v1 should support these record classes:

1. `canon`
- Foundational overviews, governance, architecture, and approved shared truth.

2. `artifact`
- Apps, applings, maizons, codebases, binaries, media-bearing work products.

3. `interaction`
- Conversations, campfire exchanges, session events, witness events.

4. `derivative`
- Summaries, decisions, open seams, corrections, implementation notes.

5. `staging`
- Raw research, imported notes, uncategorized intake, unratified source material.

## Minimum Schema

Every Casey record must support at least:

- `id`
- `record_type`
- `title`
- `canonical_status`
- `author_node`
- `session_id`
- `source_system`
- `source_path`
- `file_hash`
- `created_at`
- `modified_at`
- `imported_at`
- `tags`
- `summary`
- `search_text`
- `embedding_model`
- `embedding_version`
- `relationships`
- `audit_log_ref` — UUID string; points to the primary governing audit_log entry for this record; full audit history stored as one-to-many rows in audit_log keyed back to the record

Recommended `canonical_status` values:
- `canonical`
- `ratified`
- `ratified_candidate`
- `draft`
- `staging`
- `archived`
- `deprecated`
- `incomplete`

## Required Tables

Casey v1 should begin with explicit relational tables rather than a vague blob store.

1. `records`
- one row per ingested entity
- stores identity, status, provenance, and anchor metadata

2. `record_text`
- extracted text snapshot for resilience and search
- keeps search usable even if the original file path later drifts

3. `record_links`
- typed relationships between records
- examples: `derived_from`, `depends_on`, `summarizes`, `belongs_to`, `promoted_from`

4. `record_tags`
- normalized tag rows for filter retrieval and tag auditing

5. `ingestion_runs`
- one row per ingestion attempt
- tracks status, started_at, completed_at, initiator, and failure reason

6. `dead_letters`
- invalid or rejected ingestions
- visible queue, never silent discard

7. `audit_log`
- authority changes, canonical promotions, overrides, corrections, and contested decisions

8. `embeddings`
- derived semantic vectors plus model/version provenance

## Ingestion Pipeline

Casey v1 ingestion should run in this order:

1. Discover
- detect new or modified files, transcripts, or artifacts

2. Parse
- extract text and structure based on file type

3. Classify
- assign record type and initial canonical status

4. Snapshot
- write extracted text into Casey for resilience

5. Hash
- compute file hash for drift detection

6. Tag
- assign proposed tags with attribution to proposer

7. Link
- attach relationships to known records where confidence is sufficient

8. Validate
- schema check, authority check, and required-field check

9. Commit
- either write atomically or fail without partial masquerade

10. Notify
- emit success, drift, or dead-letter visibility to the relevant operator

## Failure Law

Casey may not fail quietly.

Required behaviors:
- any invalid ingestion goes to `dead_letters`
- any partial write either rolls back or is marked `incomplete`
- any schema failure preserves source reference and failure reason
- dead-letter entries must be visible to Veris
- Casey unavailability may degrade search, but must not stop Lenny routing

## Canon Promotion Law

Canon promotion is a governance event, not a side effect.

Rules:
- AI-originated insights may enter Casey as `draft` or `ratified-candidate`
- promotion to `canonical` requires explicit ratification
- dissent and objections should be linkable to the same record
- Timothy may exercise executive ratification when braid deliberation deadlocks
- every promotion or override must land in `audit_log`

## Search Model

Casey v1 search must support four paths:

1. Exact lookup
- by id, filename, path, or exact title

2. Tag/filter search
- by record type, status, author, session, tag, and date range

3. Semantic retrieval
- via embeddings with visible model/version provenance

4. Relationship traversal
- walk linked records such as raw transcript -> decision -> canon note

## Drift Detection

Drift detection should be event-triggered first, periodic second.

Required behavior:
- on write or ingestion, compare current file hash to Casey anchor
- if mismatch exists, mark the record as drifted
- do not silently overwrite prior extracted text or provenance
- surface drift to audit workflow instead of resolving automatically

## Routing Independence

Casey must not become a single point of failure for transport.

This means:
- Lenny still routes campfire and bus traffic without Casey
- Casey may enhance routing decisions, lookup, and observability
- if Casey is down, the braid continues in degraded mode
- degraded mode should be visible, not hidden

## Conversation Ingestion

Conversation records must preserve both sequence and synthesis.

Required sub-records:
- raw transcript anchor
- distilled summary
- extracted decisions
- extracted open seams
- provenance including participants and `session_id`

Campfire-specific rule:
- append-only source ledgers remain authoritative as historical event memory
- Casey indexes and derives from them; Casey does not rewrite them

## Implementation Phases

### Phase 1: Spine
- create database schema
- create `records`, `record_text`, `record_links`, `record_tags`, `ingestion_runs`, `dead_letters`, `audit_log`, `embeddings`
- ingest one markdown document end-to-end
- prove exact lookup and text retrieval

### Phase 2: Canon Safety
- add authority checks
- add canon promotion pathway
- add audit logging
- add event-triggered drift detection
- prove archive-only staging graduation

### Phase 3: Conversation Memory
- ingest campfire/history and transcript artifacts
- generate summary/decision/open-seam derivatives
- prove link traversal from source conversation to derivative record

### Phase 4: Ecosystem Saturation
- ingest app, appling, maizon, and inventory records
- add semantic retrieval
- add embedding provenance and re-embedding support
- expose reliable Casey-backed retrieval to the braid

## Immediate Build Order

Build next in this order:

1. schema file
2. minimal ingestion CLI or script
3. one-document proof
4. dead-letter visibility
5. audit logging
6. drift detection
7. conversation ingestion

## Out of Scope for v1

Not first:
- full cloud sync
- automated canon promotion
- Casey as transport authority
- speculative graph over-modeling before retrieval works

## Success Condition

Casey v1 is successful when:
- important material no longer exists only as “a file somewhere”
- canon boundaries remain explicit
- AI provenance is preserved at session level
- failures are visible
- braid routing survives Casey outages
- Timothy can retrieve a needed document, conversation seam, or architecture record without filesystem archaeology
