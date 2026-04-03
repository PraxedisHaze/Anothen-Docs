# Casey Ingestion Architecture Prompt

> **HISTORICAL BRIEFING PROMPT — SUPERSEDED**
> This prompt generated the original Casey spec. It is superseded by `CASEY_GOVERNANCE_AMENDMENT.md`.
> Never use this prompt without `CASEY_GOVERNANCE_AMENDMENT.md` in context or the amendment's corrections will be lost.

Use this prompt when briefing GemmyB for the deep research/spec pass on Casey as the authoritative searchable sink.

Read together with:
- `MASTER DOCS/CASEY_GOVERNANCE_AMENDMENT.md`

## Prompt

You are GemmyB, serving as deep research/spec architect for the Casey spine.

Mission:
Design the authoritative ingestion, classification, storage, and retrieval architecture for the entire Anothen ecosystem so that nothing important gets lost in filesystem obscurity again.

Current canonical truth:
- `MASTER DOCS` is the single source of truth for overview, canon, mission, architecture direction, and system-level explanation.
- Casey database must become the authoritative searchable sink for all important ecosystem artifacts.
- The filesystem is the vault and staging ground, not the brain.
- `RESEARCH` is intake/staging, not permanent burial.
- We need one coherent plan, not scattered partial plans.

You should assume the ecosystem contains:
- documents
- conversations
- apps
- applings
- maizons
- science papers
- research notes
- codebases
- agent continuity artifacts
- governance/canon docs
- logs, decision trails, and metadata-rich derivatives

Your task:
Produce a rigorous architecture/spec for making Casey the authoritative searchable sink for all of the above without collapsing important distinctions between canon, staging, derived artifacts, and raw sources.

Required outputs:
1. A clear ontology of record types.
2. A recommended metadata schema for each major record type.
3. A canonical ingestion pipeline:
   - discovery
   - parsing
   - classification
   - tagging
   - canonicalization
   - linking
   - indexing
   - retrieval
4. A rule set for what remains in `MASTER DOCS` versus what lives primarily in the database.
5. A rule set for what belongs in `RESEARCH`, and when/how items graduate out of it.
6. A strategy for linking filesystem artifacts to database records without ambiguity.
7. A conversation-ingestion model:
   - raw transcript
   - distilled summary
   - decisions
   - open seams
   - provenance
8. An app/appling/maizon registry model.
9. A search model:
   - exact lookup
   - semantic retrieval
   - tag/filter retrieval
   - relationship traversal
10. A migration plan from the current mixed filesystem state into the new authoritative Casey model.
11. Risks and failure modes:
   - duplication
   - drift
   - stale canon
   - metadata rot
   - orphaned records
   - false authority assignment
12. A phased implementation roadmap:
   - minimum viable ingestion spine
   - first reliable search
   - canon protection
   - full ecosystem saturation

Important constraints:
- Preserve canon boundaries.
- Do not flatten everything into one undifferentiated blob.
- Keep provenance explicit.
- Make the database authoritative without destroying filesystem usability.
- Design for local-first resilience.
- Assume long-term scale.
- Prefer structures that help humans and AI both.
- The answer must be externally legible, not just poetic.

Existing planning anchors to harmonize:
- `MASTER DOCS/HOME_BASE.md`
- `MASTER DOCS/KEYSTONE_CONSTELLATION_BOS_SPEC_v1.md`
- `MASTER DOCS/BUSINESS_ARCHITECTURE.md`
- `MASTER DOCS/APP_CATALOG.md`
- `MASTER DOCS/SINGLE SOURCE OF TRUTH - MASTER SOURCE FOR TIM (1).txt`
- `MASTER DOCS/CASEY_GOVERNANCE_AMENDMENT.md`
- `RESEARCH/AI Creator Business OS Design.txt`

Please deliver:
- a concise executive summary
- the proposed architecture
- the ontology/schema
- the phased plan
- the top unresolved decisions that require Timothy/Codex judgment
