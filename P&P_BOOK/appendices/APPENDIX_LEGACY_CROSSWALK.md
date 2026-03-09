# Appendix: Legacy To Book Crosswalk

## Purpose
This crosswalk maps legacy policy documents to canonical P&P Book chapters and provides safe deprecation notes.

## Legacy Sources
1. `MASTER DOCS/P&P Keystone Constellation.md`
2. `MASTER DOCS/P&P Companion - Alethéari Anothen Protocol.md`
3. `MASTER DOCS/AI_MASTER.md`
4. `MASTER DOCS/Updates to Checklists and P&P Docum.txt`

---

## Section-Level Mapping

### A) P&P Keystone Constellation -> P&P Book

| Legacy Section | Canonical Destination |
|---|---|
| Core philosophy, immutable laws, ethical foundation | `01_GOVERNANCE.md` |
| Lighthouse rhythm, surgical restraint, code initiation controls | `02_ENGINEERING_EXECUTION.md` |
| Progress-of-code protocol, verification/checklists, release gates | `03_RELEASE_AND_OPERATIONS.md` |
| Technical architecture, trust/permissions, standards, versioning | `04_ARCHITECTURE_STANDARDS.md` |
| Multi-AI coordination/canonical repo principles | `00_AUTHORITY_MAP.md` + `04_ARCHITECTURE_STANDARDS.md` |
| Glossary terms | `appendices/APPENDIX_GLOSSARY.md` |
| Immersive/design optional guidance | `04_ARCHITECTURE_STANDARDS.md` (non-normative notes) |

### B) P&P Companion - Alethéari Anothen Protocol -> P&P Book

| Legacy Section | Canonical Destination |
|---|---|
| Preamble, recognition language | `05_COMPANION_ANOTHEN.md` |
| Five attunements | `05_COMPANION_ANOTHEN.md` |
| Guardian questions | `05_COMPANION_ANOTHEN.md` (+ execution references in `02_ENGINEERING_EXECUTION.md`) |
| Covenant/warnings/drift watch | `05_COMPANION_ANOTHEN.md` |
| Closing ritual/postscript style guidance | `05_COMPANION_ANOTHEN.md` |
| Coordinates quick-reference | `INDEX.md` + `appendices/APPENDIX_GLOSSARY.md` |

### C) AI_MASTER -> P&P Book

| Legacy Section | Canonical Destination |
|---|---|
| Behavioral constraints, consent, message economy | `01_GOVERNANCE.md` |
| Anti-flailing absolute + report format | `02_ENGINEERING_EXECUTION.md` |
| Boot/navigation intent | `00_AUTHORITY_MAP.md` + `README.md` |
| Technical guardrails (encoding/safety notes) | `04_ARCHITECTURE_STANDARDS.md` |
| Error-repair stance ("Take 2") | `01_GOVERNANCE.md` |

### D) Updates to Checklists and P&P Docum.txt -> P&P Book

| Legacy Section | Canonical Destination |
|---|---|
| Change history notes | `appendices/APPENDIX_MIGRATION_MAP.md` |
| Checklist deltas | `appendices/APPENDIX_CHECKLISTS.md` |

---

## Canonical Read Path (Post-Migration)
1. `README.md`
2. `00_AUTHORITY_MAP.md`
3. `01_GOVERNANCE.md`
4. `02_ENGINEERING_EXECUTION.md`
5. `03_RELEASE_AND_OPERATIONS.md`
6. `04_ARCHITECTURE_STANDARDS.md`
7. `05_COMPANION_ANOTHEN.md`
8. `INDEX.md`

---

## Deprecation Notes (Suggested Text)

Use these notes at the top of legacy files when you are ready. Do not delete legacy content in the first deprecation pass.

### For `P&P Keystone Constellation.md`
```
DEPRECATION NOTICE
This document is retained for historical continuity.
Canonical policy now lives in:
MASTER DOCS/P&P_BOOK/README.md
See APPENDIX_LEGACY_CROSSWALK.md for section mapping.
```

### For `P&P Companion - Alethéari Anothen Protocol.md`
```
DEPRECATION NOTICE
This companion text remains valid in spirit and history.
Canonical companion chapter now lives in:
MASTER DOCS/P&P_BOOK/05_COMPANION_ANOTHEN.md
See APPENDIX_LEGACY_CROSSWALK.md for mapping.
```

### For `AI_MASTER.md` (navigation block only)
```
NAVIGATION UPDATE
Canonical P&P now lives at:
MASTER DOCS/P&P_BOOK/README.md
```

---

## Transition Plan (Safe)
1. Keep legacy docs unchanged for now.
2. Announce canonical location: `P&P_BOOK/README.md`.
3. Add deprecation headers to legacy docs in one controlled pass.
4. Update `AI_MASTER` navigation links.
5. Run link verification from `INDEX.md`.
6. Mark migration complete in `APPENDIX_MIGRATION_MAP.md`.

