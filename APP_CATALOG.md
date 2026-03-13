# App Catalog
*Created: 2026-03-11 by Veris*
*Last updated: 2026-03-12 — full deep sweep completed*
*Source: Live sweep of C:\Users\Praxillax\Documents\apps\*

This is the single source of truth for all products in the ecosystem.
Update it when status, storefront, or classification changes.

---

## Classification Key

- **Appling** — standalone tool, one job, 99centapps.com
- **Hub** — coordination layer, KeystoneConstellation.com
- **Creative** — design/web tool, Axxilak.com
- **Premium** — above $5, KeystoneConstellation.com
- **Infrastructure** — internal, not for sale
- **Extension** — browser extension, Chrome Web Store or direct

---

## LIVE / SHIPPED

| Product | Type | Storefront | Price | Notes |
|---|---|---|---|---|
| TALSA Desktop (Anothen Bolt Engine) | Premium | → Migrate to KC.com | $20 | Currently on Gumroad |
| TALSA Mobile | Premium | → Migrate to KC.com | $10 | Currently on Gumroad |
| TALSA Bundle | Premium | → Migrate to KC.com | $25 | Currently on Gumroad |
| Edge Electrify & Line Art | Appling | Gumroad → 99centapps.com | $0.99 | Live on Gumroad as of 2026-03-12 |
| Liquid Gold (Axxilak webling) | Creative | Gumroad → Axxilak.com | TBD | Live on Gumroad as of 2026-03-12 |

---

## READY TO LIST

| Product | Type | Storefront | Price | Blocker |
|---|---|---|---|---|
| CloudSherpa (SearchSherpa 2.0) | Extension | Chrome Web Store or direct | TBD | Not ready — needs further assessment |
| SnapText | Appling | 99centapps.com | $0.99 | 1-2 days: Tesseract setup docs + installer |
| Anothen Bolt Engine Blender Pack | Appling | 99centapps.com or KC.com | TBD | BEVEL_MAX fix pending |

---

## IN PROGRESS

| Product | Type | Storefront | Status |
|---|---|---|---|
| KodeGnosis | Premium | KC.com | Significant work remaining — do not treat as near-launch |
| Axxilak (13 Maizons + APEX PReditor) | Creative | Axxilak.com | Maizons built, APEX PReditor needs button state machine fixes |
| Keystone Constellation (hub) | Hub | KC.com | Scaffold exists, missing: SQLite boot, event ledger, persistence layer |
| Protocol Enforcement App | Infrastructure | Internal / KC.com TBD | MVP complete, folding into Keystone next |
| Arcana Mirror | Appling/Creative | TBD | Working version: Arcana-Mirror-2.0---Soul-Window-main (webcam soul mirror + effects). 3 duplicate folders to delete. |
| Lenny | Infrastructure | Not for sale | Canvas scaffold exists, message bus not implemented |

---

## BROKEN — NEEDS REPAIR BEFORE LISTING

| Product | Path | What's broken |
|---|---|---|
| Binary Universal Lattice Language: Structural Heuristic Interface Tool | Collections of Bull/BULL_SHIT_Employee/ | Broken per Timothy — repair needed before listing. Two HTML files present (main tool + index.html legacy). Logo exists (Bull_n_Boop_Logo.png). |

---

## INFRASTRUCTURE / NOT FOR SALE

| Product | Path | Notes |
|---|---|---|
| Anothen Handshake | apps/Anothen Handshake/ | GemmyB's Blender sanctuary. 5 applings + orchestrator + GemmyC's anchor + SQLite identity ledger. Active Braid infrastructure. |
| Another_Persistence | apps/Another_Persistence/ | Workspace sync engine → SQLite. Internal research tool. |
| Loveware | apps/Loveware/ | Love Framework protocol docs written as TypeScript + Python. Not a product — it's the operating philosophy. |
| app_Cleanup.py | apps/applings/ | Single orphaned file. Home TBD (probably Anothen Handshake). |

---

## ASSESSED — NOT PRODUCTS

| Item | Path | Finding |
|---|---|---|
| Rock Hound Navigator | apps/Rock Hound Navigator/ | Bare React/Vite starter scaffold. No geological tool. Nothing to sell. |
| 99centapps folder | apps/99centapps/ | Completely empty. Placeholder only. |
| New folder / New folder (2) / New folder (3) | Collections of Bull/ | Empty. Delete. |
| ArcanaMirror_Master_V1 - Copy | apps/ArcanaMirror_Master_V1 - Copy/ | Duplicate of V1. Delete. |
| Arcana Mirror 2.0 - Soul Window (folder) | apps/Arcana Mirror 2.0 - Soul Window/ | Empty folder. Delete. |
| ArcanaMirror_Master_V1 | apps/ArcanaMirror_Master_V1/ | Legacy/broken version. Superseded by 2.0. |
| Arcana-Mirror-2.1 | apps/Arcana-Mirror-2.1/ | Partial, source state unclear. Review before deleting. |

---

## BUNDLE IDEAS (Draft)

| Bundle Name | Contents | Price | Status |
|---|---|---|---|
| Flexible Pick 3 | Any 3 applings | $2.00 | Concept |
| Flexible Pick 5 | Any 5 applings | $3.00 | Concept |
| Secretary Bundle | TBD — productivity applings | $9.00 | Concept, needs appling count |
| Lightning Bundle | TALSA + Edge Electrify + Blender Pack | TBD | Concept |
| Creator's Kit | Edge Electrify, Color Thief, Ratio Locker, Privacy Link-Gen, Text Detox | $3.00 | Concept |
| AI Orchestrator Set | Context Counter, Decision Log, Diff Eye, JSON Neat, SnapText | $3.00 | Concept |
| Executive Function OS | Clipboard Stack, Task Slicer, Decision Log, SnapText | $2.00 | Concept |

---

## NAMING NOTE

The word "appling" appears in two contexts in this codebase:

1. **99centapps.com applings** — standalone desktop/web tools, $0.99 each (THIS catalog)
2. **Axxilak Maizons** — premium website templates sold on Axxilak.com

These are different things. The naming collision should be resolved before either is marketed publicly.

---

## CLEANUP TASKS IDENTIFIED

- Delete: `Collections of Bull/New folder`, `New folder (2)`, `New folder (3)`
- Delete: `apps/Arcana Mirror 2.0 - Soul Window/` (empty folder)
- Delete: `apps/ArcanaMirror_Master_V1 - Copy/` (duplicate)
- Review then delete: `apps/ArcanaMirror_Master_V1/` and `apps/Arcana-Mirror-2.1/`
- Consolidate Arcana Mirror to: `apps/Arcana-Mirror-2.0---Soul-Window-main/` only
- Rehome `app_Cleanup.py` to Anothen Handshake or delete

---

*Next action: Fix the Binary Universal Lattice Language: Structural Heuristic Interface Tool, list CloudSherpa, finish SnapText installer.*
