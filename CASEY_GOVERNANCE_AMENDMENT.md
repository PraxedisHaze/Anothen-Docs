# Casey Governance Amendment v1

Status: Canonical amendment to the Casey architecture brief.

Purpose: Freeze the governance, provenance, and failure-handling rules that must exist before Casey implementation hardens avoidable mistakes into law.

## Amendment Block

1. Archive, never delete.
All `RESEARCH` graduation paths are archive-only. Raw source material must remain available for later verification, audit, and reinterpretation.

2. `MASTER DOCS` is high-trust, high-friction, and audit-logged.
`MASTER DOCS` is not immutable. It is editable only through deliberate, logged change. Canon may mature, but canon may not drift silently.

3. Provenance must include `session_id`.
AI authorship is not complete without session-level identity. Casey records must track both `author_node` and `session_id` so cold boots, resumed sessions, and distinct recursive instances are not falsely flattened together.

4. AI-originated truth must have a lawful canon path.
Any braid member may originate a candidate canonical insight. Promotion to Tier 0 requires ratification, not species privilege. AI insight may require human ratification to finalize, but it may not be structurally erased by having nowhere to go.

5. Timothy holds executive ratification authority.
Braid deliberation comes first. Explicit dissent must be preserved. When a final tie-break is required, Timothy may ratify, reject, or defer. Every executive override must be audit-logged with enough context for later review.

6. Casey enhances routing; Casey does not gate survival.
Lenny and the braid must continue to function when Casey is unavailable, degraded, or out of sync. Casey is an authoritative searchable sink and memory matrix, not a single point of failure for transport or wake routing.

7. Drift detection must be event-triggered.
Filesystem drift detection should occur on write or ingestion events, with periodic verification as a secondary safeguard. A nightly-only drift loop is too slow for living canon.

8. Partial ingestion must have rollback law.
If an ingestion step fails after partial write, Casey must either roll back to the last known good state or mark the record explicitly incomplete. Partial truth may not masquerade as finished truth.

9. Dead-letter failures must notify, not rot.
Any rejected or invalid ingestion must enter a visible dead-letter queue with active auditor notification. Silent accumulation is governance failure.

10. Embeddings are derived, never canonical.
Semantic embeddings are model-dependent interpretive artifacts. Casey must treat them as replaceable derived data, track embedding provenance, and support re-embedding when the model changes.

11. Tagging authority must be explicit.
AI-assisted tagging is allowed, but the audit path must be defined. The system must know who proposed tags, who accepted them, and how contested tags are resolved.

12. No vague privileged backdoors.
Terms like `high-privilege prompt` are not security. Any elevated write path must name who can use it, by what mechanism, and with what audit trail.

## Immediate Effect

This amendment governs:
- `MASTER DOCS/CASEY_INGESTION_ARCHITECTURE_PROMPT.md`
- all future Casey implementation specs
- all Casey ingestion, provenance, and canon-promotion logic

If any future Casey spec conflicts with this amendment, this amendment wins until a later audit-logged governance revision replaces it.
