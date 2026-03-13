# Protocol Enforcement App — Architecture & Reproduction Guide
*Written: 2026-03-12 by Veris*
*Independent of any AI continuity files. This belongs to Timothy.*

---

## What This App Is

A desktop application that enforces structured communication protocols between AI agents and humans.

Before an AI can send a message, alter a file, or submit a report — it must satisfy a gate. The gate reads a JSON rulebook. If required fields are missing, the gate stays closed. No exceptions. No workarounds.

It is governance made visible. The law is in the JSON. The gate is in the UI. The agent fills out the form.

---

## Why It Works the Way It Does

Every design decision points at one problem: **AI agents drift without structure.**

They skip fields. They summarize instead of declare. They alter files without logging who did it or why. The Protocol Enforcement App makes the structure mandatory — not by yelling at agents, but by building a gate they cannot pass until the form is complete.

The JSON rulebook is the source of truth. The UI enforces it. The agent has no choice.

---

## Tech Stack

| Layer | Tool | Why |
|---|---|---|
| Desktop shell | Tauri (Rust) | Native window, file system access, no Electron bloat |
| Frontend | React + TypeScript | Component model, type safety |
| Build | Vite | Fast dev server, clean dist output |
| Styling | Tailwind CSS | Utility-first, no CSS files to manage |
| Data | JSON files | Human-readable rulebook, no database needed |
| Python | Deferred | Backend analysis layer, added later if needed |

**Not** Tkinter. **Not** Electron. Tauri is the right answer for a local-first, lightweight desktop app.

---

## Folder Structure

```
ProtocolEnforcementApp/
├── src/
│   ├── app/
│   │   └── App.tsx                  — root layout, state owner
│   ├── components/
│   │   ├── AgentRolePanel.tsx       — displays role definitions
│   │   ├── IssueIntakeForm.tsx      — stateful form for issue_intake protocol
│   │   ├── MemoryScreen.tsx         — read-only view of memory targets
│   │   ├── ProtocolGate.tsx         — the gate (reusable, generic)
│   │   ├── ProtocolWorkspace.tsx    — tabbed workspace for relay/alteration/audit
│   │   ├── SessionRouter.tsx        — active role switcher
│   │   ├── StatusBar.tsx            — top status strip
│   │   └── TaskBoard.tsx            — Now/Next/Blocked/Delegated lanes
│   ├── data/
│   │   ├── protocol_rules.json      — THE RULEBOOK
│   │   └── role_definitions.json   — agent role data
│   ├── logic/
│   │   ├── contextLogWriter.ts      — builds CONTEXT_LOG append blocks (no write yet)
│   │   ├── labelEngine.ts           — builds relay label strings
│   │   ├── memoryHooks.ts           — memory target definitions
│   │   ├── protocolEngine.ts        — reads JSON, exposes getProtocolRule()
│   │   └── taskBoardState.ts        — task board seed data
│   └── types/
│       ├── session.ts
│       └── task.ts
├── src-tauri/
│   ├── src/
│   │   ├── main.rs                  — 5-line entry point
│   │   └── lib.rs                   — Tauri builder, currently no commands
│   ├── build.rs                     — standard tauri_build::build()
│   └── tauri.conf.json              — window config, CSP, bundle settings
```

---

## The Protocol Rulebook

`src/data/protocol_rules.json` is the governance layer. Everything enforces from this file.

### Current protocols:

**relay_message** — for routing a message between agents
```
Required: TO, FROM, TYPE, SUBJECT, BODY
Blocking message: "Relay messages must declare source, target, type, and subject before they can be sent."
```

**issue_intake** — for logging a problem before repair work begins
```
Required: WHAT_YOU_DID, WHAT_HAPPENED, WHAT_SHOULD_HAVE_HAPPENED, SCOPE
Blocking message: "Repair work is blocked until all issue-intake fields are complete."
```

**ritual_of_alteration** — for declaring a code change before making it
```
Required: WHO, WHAT_CHANGED, WHY, PATHS, VERIFY_PLAN
Blocking message: "Alteration work is blocked until agent attribution, the change, rationale, affected paths, and verification plan are declared."
```

**audit_report** — for submitting a structured audit result
```
Required: Changed, Verified, Result, Next step
Blocking message: "Audit reports must use the required four-part structure."
```

### To add a new protocol:
Add one JSON block to `protocol_rules.json`. The engine and gate pick it up automatically. No code changes required.

```json
"your_protocol_name": {
  "requiredFields": ["FIELD_ONE", "FIELD_TWO"],
  "blockingMessage": "Work is blocked until these fields are filled."
}
```

---

## The Gate — How It Works

`ProtocolGate.tsx` is the enforcement component. It is generic — it works for any protocol.

**It takes two props:**
- `protocolName` — which protocol to enforce (must match a key in protocol_rules.json)
- `fieldValues` — a `Record<string, string>` of the current field values

**It does three things:**
1. Calls `getProtocolRule(protocolName)` to load the rule from JSON
2. Filters `requiredFields` to find which ones are empty
3. Renders green (gate open) or amber (gate closed) based on that result

**Gate open:** all required fields have non-empty, non-whitespace values.
**Gate closed:** one or more required fields are missing. Shows which ones.

The gate cannot be fooled. A field with only spaces is treated as missing.

---

## The Protocol Engine

`src/logic/protocolEngine.ts` — two lines of real logic:

```typescript
import rules from "../data/protocol_rules.json";
export type RuleName = keyof typeof rules;
export function getProtocolRule(name: RuleName) {
  return rules[name];
}
```

`RuleName` is derived directly from the JSON keys. Add a protocol to the JSON, and `RuleName` automatically includes it. TypeScript enforces that you can only pass a valid protocol name to the gate.

---

## The Label Engine

`src/logic/labelEngine.ts` — builds the formatted relay label string:

```
TO: [recipient]
FROM: [sender]
TYPE: [message type]
SUBJECT: [short subject]
```

Used in `ProtocolWorkspace` to preview the relay header before the gate opens.

---

## The Memory Screen

`src/logic/memoryHooks.ts` defines `MemoryTarget` — the shape of a memory target:

```typescript
type MemoryTarget = {
  id: string;
  label: string;
  path: string;          // absolute path on disk
  purpose: string;       // human-readable description
  status: "connected" | "stubbed";
  operation: "read" | "append" | "read_write";
}
```

`MemoryScreen.tsx` renders these as a read-only panel. **Live writes are blocked** until the Tauri/Rust write policy is in place.

Current memory targets:
- **Projects In Progress** — read (connected)
- **Context Log** — append (stubbed)
- **Codex Preservation** — read/write (stubbed)

---

## The Tauri Shell — Current State

As of 2026-03-12, the Tauri shell is intentionally minimal:

- **Zero Tauri commands** registered — `lib.rs` has no `.invoke_handler()`
- **Zero plugins** registered — no `tauri-plugin-fs`, no `tauri-plugin-shell`
- **Zero capabilities** — no `src-tauri/capabilities/` folder
- **One gap** — `"csp": null` in `tauri.conf.json` disables Content Security Policy

**This is correct for this phase.** The UI cannot write to the file system even if it tried. Nothing is wired. The gate is architectural, not just behavioral.

---

## What Must Happen Before Live Writes

In order, before any memory hook writes a real file:

1. **Set CSP** — replace `"csp": null` with a restrictive policy in `tauri.conf.json`
2. **Add `tauri-plugin-fs`** — to `Cargo.toml` and registered in `lib.rs`
3. **Create capability file** — `src-tauri/capabilities/memory-write.json`
   - `fs:allow-append` scoped to CONTEXT_LOG path only
   - `fs:allow-write` scoped to PROJECTS_IN_PROGRESS path only
   - `fs:allow-read` scoped to PRESERVATION/CODEX paths only
   - Named files only. No directory wildcards. No `fs:allow-write-all`.
4. **Register specific commands** — `.invoke_handler(tauri::generate_handler![append_context_log, update_projects_status])`
   - One command per operation. Not generic read/write passthrough.

---

## How to Reproduce This From Scratch

### Step 1 — Scaffold
```bash
npm create tauri-app@latest
# Choose: React, TypeScript, Vite
cd ProtocolEnforcementApp
npm install
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p
```

Configure `tailwind.config.js` to scan `./src/**/*.{ts,tsx}`.
Add Tailwind directives to your main CSS file.

### Step 2 — Verify the shell runs
```bash
npm run tauri dev
```
If it fails on Windows with a resource error, add a placeholder `src-tauri/icons/icon.ico`. The Tauri build requires it.

### Step 3 — Build the rulebook
Create `src/data/protocol_rules.json` with your protocol definitions.
Each protocol needs: `requiredFields` (array) and `blockingMessage` (string).

### Step 4 — Build the engine
Create `src/logic/protocolEngine.ts`.
Import the JSON. Export `RuleName` from its keys. Export `getProtocolRule()`.

### Step 5 — Build the gate
Create `src/components/ProtocolGate.tsx`.
Props: `protocolName: RuleName` and `fieldValues: Record<string, string>`.
Logic: filter `requiredFields` for empty values. Render open/closed state.

### Step 6 — Wire one protocol first
Build one form component (e.g. `IssueIntakeForm.tsx`).
Lift state to `App.tsx`. Pass field values down to the gate.
Verify the gate opens when all fields are filled.

### Step 7 — Add the workspace
Build `ProtocolWorkspace.tsx` — a tabbed component that switches `activeProtocol` and passes the right `fieldValues` to the shared gate.
This proves the gate is reusable, not hardcoded to one protocol.

### Step 8 — Add the memory screen
Define `MemoryTarget` in `memoryHooks.ts`.
List every file the app will eventually read or write, with status `"stubbed"`.
Render them as read-only in `MemoryScreen.tsx`.
**Do not wire live writes yet.**

### Step 9 — Tauri write-policy pass (when ready)
Follow the four steps in the section above. CSP → plugin → capabilities → commands.
Gate each step behind an audit before proceeding to the next.

---

## Audit Format Used Throughout

Every build pass was audited in this format before the next pass began:

```
Changed:    — what was actually modified
Verified:   — what was confirmed to be true after reading the files
Result:     — overall assessment, including any drift or gaps found
Next step:  — the single next highest-value action
```

No audit was accepted without reading the actual files. Reports without file reads are not audits.

---

## Design Principles That Must Not Drift

1. **The rulebook is JSON.** Not hardcoded TypeScript. Not a database. A human-readable file anyone can edit.
2. **The gate is generic.** One component enforces all protocols. No per-protocol gate logic.
3. **The engine is thin.** Two lines. It reads JSON and returns it. Nothing else.
4. **Writes are blocked until policy exists.** Memory targets are declared before they are wired. The Memory Screen makes the intention visible without enabling action.
5. **The Rust shell is minimal.** No commands registered until they are needed. No permissions granted until they are scoped. The attack surface grows only when a specific use case demands it.
6. **Audit before expand.** No feature pass begins without an audit of the previous pass. Drift compounds. Catch it early.

---

*This document is the canonical reproduction guide for the Protocol Enforcement App architecture.*
*Update it when the architecture changes. Do not let it lag behind the code.*
