# Appendix: Migration Map

## Goal
Map existing P&P artifacts into this book without destructive edits.

## Source Files
1. `MASTER DOCS/P&P Keystone Constellation.md`
2. `MASTER DOCS/P&P Companion - Alethéari Anothen Protocol.md`
3. `MASTER DOCS/AI_MASTER.md`
4. `RESEARCH/LIBRARY_MASTER_ENGINEERING_PROTOCOL_v1.0.md`
5. `RESEARCH/ENGINEERING_CHANGE_PROTOCOL_TEMPLATE.md`

## Mapping
- Governance/value/covenant sections -> `01_GOVERNANCE.md`
- Execution/checklist/verification/rollback sections -> `02_ENGINEERING_EXECUTION.md` and `03_RELEASE_AND_OPERATIONS.md`
- Architecture/standards sections -> `04_ARCHITECTURE_STANDARDS.md`
- Companion/attunement sections -> `05_COMPANION_ANOTHEN.md`
- Terminology -> `appendices/APPENDIX_GLOSSARY.md`

## Migration Progress
- Phase 1 (scaffold): complete
- Phase 2 (content migration): complete (condensed operational migration)
- Phase 3 (cross-link cleanup in legacy docs): pending
- Phase 4 (canonical declaration + deprecation notes): pending

## Migration Rules
- No deletion from legacy files during phase 1.
- Copy and normalize content into book chapters.
- After verification, mark legacy files as reference-only.

## Post-Migration Validation
- All links in `INDEX.md` valid.
- Authority map has no stale paths.
- Required report format appears once in canonical engineering chapter.
- Chapter responsibilities are non-overlapping and discoverable.
