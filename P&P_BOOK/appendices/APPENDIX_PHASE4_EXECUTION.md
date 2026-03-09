# Appendix: Phase 4 Execution Kit

## Objective
Finalize migration by making canonical references discoverable while preserving legacy content.

## Boundary
- This kit defines exact edits.
- Apply in one controlled pass.
- Do not delete any legacy content in phase 4.

## Target Files For Controlled Edit (when approved)
1. `MASTER DOCS/P&P Keystone Constellation.md`
2. `MASTER DOCS/P&P Companion - Alethéari Anothen Protocol.md`
3. `MASTER DOCS/AI_MASTER.md`

## Edit 1: Legacy Deprecation Header (Keystone P&P)
Insert at top:

```
DEPRECATION NOTICE
This document is retained for historical continuity.
Canonical policy now lives in:
MASTER DOCS/P&P_BOOK/README.md
See:
MASTER DOCS/P&P_BOOK/appendices/APPENDIX_LEGACY_CROSSWALK.md
```

## Edit 2: Legacy Deprecation Header (Companion)
Insert at top:

```
DEPRECATION NOTICE
This companion text remains valid in spirit and history.
Canonical companion chapter now lives in:
MASTER DOCS/P&P_BOOK/05_COMPANION_ANOTHEN.md
See:
MASTER DOCS/P&P_BOOK/appendices/APPENDIX_LEGACY_CROSSWALK.md
```

## Edit 3: AI_MASTER Navigation Update
In navigation section, set canonical P&P path to:

`MASTER DOCS/P&P_BOOK/README.md`

Also add:

`Crosswalk: MASTER DOCS/P&P_BOOK/appendices/APPENDIX_LEGACY_CROSSWALK.md`

## Validation Checklist
- [ ] Legacy files still contain full original body.
- [ ] Canonical link resolves from AI_MASTER.
- [ ] Crosswalk link resolves.
- [ ] Book README links resolve.
- [ ] No broken relative links in P&P_BOOK.

## Rollback
- Remove added deprecation header blocks from both legacy files.
- Revert AI_MASTER navigation lines to previous state.

