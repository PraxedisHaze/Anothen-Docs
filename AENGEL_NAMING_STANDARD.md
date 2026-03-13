# Aengel Naming Standard v1.0

Date: 2026-03-09
Owner: Timothy + Aletheari Engineering
Scope: All projects under `C:\Users\Praxillax\Documents\apps`

## 1) Canonical Rule
Use `Aengel` terminology for any background-running helper process, service, listener, watcher, scheduler, agent, or resident task.

Disallowed primary term in new production code/docs/UI:
- `daemon`

Preferred replacements:
- `aengel`
- `background service`
- `resident listener`
- `worker`

## 2) Required Naming Patterns
For filenames, symbols, services, and docs:
- `*_aengel.*` for process/listener scripts
- `Launch_*_Aengel.*` for launchers
- `Start_*_Aengel.*` for user-facing startup scripts

Examples:
- `snaptext_aengel.py`
- `Launch_SnapText_Aengel.vbs`
- `Start_SnapText_Aengel.bat`

## 3) Code and UI Language
Use these words in user-facing text and docs:
- `Aengel`
- `Aengel process`
- `background service`

Avoid in user-facing text and docs:
- `daemon`

## 4) Compatibility Exception
External APIs, OS primitives, or third-party libraries may still expose `daemon` fields or flags (example: Python `threading.Thread(..., daemon=True)`).

Rule:
- Keep external compatibility code as required.
- Wrap/comment with project language using `Aengel` so intent remains aligned.
- Do not rename vendor-owned protocol keys.

## 5) Enforcement Gates
Before merge/release:
1. Run repo scan for forbidden term in changed files.
2. If matches exist, classify as:
   - `allowed-external` (vendor/API key)
   - `must-change` (internal naming/docs/UI)
3. Block release if any `must-change` remains.

## 6) Rollout Plan
Phase 1: New code only (immediate).
Phase 2: Touch-and-fix during normal edits.
Phase 3: Full cleanup sweep per repo.

## 7) Definition Block (for onboarding)
`Aengel`: A trusted background-running software process that quietly serves user intent, safety, and continuity.

## 8) Non-Negotiable
No new internal project asset may introduce `daemon` terminology where `Aengel` can be used.
