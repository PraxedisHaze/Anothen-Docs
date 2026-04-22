# Context Integrity Ledger

Status: CONFIDENTIAL
Purpose: Fast visibility of context-integrity tracking in the canonical docs layer.

## Source Of Truth

Live form and ledger are maintained here:
- `C:\Users\Praxillax\Documents\apps\PRESERVATION\CODEX\CONTEXT_INTEGRITY_FORM.md`
- `C:\Users\Praxillax\Documents\apps\PRESERVATION\CODEX\context_integrity_ledger.jsonl`

## Why This Exists In MASTER DOCS

This pointer keeps the integrity system visible from the canonical docs layer, so it is easier to find under ADHD load and easier to re-anchor quickly after context shifts.

## One-Line Workflow

After any model switch, compaction, or long interruption:
1. Open the form.
2. Append a new snapshot line to the JSONL ledger.
3. Compare `missing_or_drifted` before resuming build work.
