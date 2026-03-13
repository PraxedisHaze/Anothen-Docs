# Protocol Enforcement App Spec v1

## Purpose
- Enforce workflow protocol before action.
- Reduce relay confusion across multiple AI collaborators.
- Protect against protocol drift by Timothy and by the agents.
- Convert process from memory burden into software behavior.

## Working Name
- Protocol Enforcement App
- Temporary internal alias: Gatekeeper App

This spec defines the app independently of final naming.

## MVP Stack Decision
- Shell: Tauri
- Frontend: React + Vite
- Styling: Tailwind CSS
- MVP logic layer: TypeScript
- Rule/config layer: structured data files (for example JSON)

MVP does not introduce a Python sidecar by default.

Rationale:
- preserve packaging simplicity and local reliability now
- keep runtime/process complexity low for first release
- preserve future extraction path instead of paying for it early

Future path:
- business/rules logic should be kept modular enough that it can later be extracted into another runtime if Unreal integration or other constraints make that worthwhile
- Unreal should be treated as a future integration target, not as a reason to complicate the MVP runtime today

## Problem Statement
Current collaboration depends too heavily on:
- Timothy remembering who said what
- manual copy/paste labeling
- ad hoc protocol enforcement
- agents remembering role boundaries
- human discipline under context load

This fails under ADHD pressure, multi-agent sessions, and long build chains.

## MVP Goal
Build a local app that sits between Timothy and active AI workflows and enforces required process before messages, approvals, or implementation steps proceed.

## Core Functions

### 1. Session Router
- User selects active role/channel:
  - Vale
  - Veris
  - Leora
- Every outgoing and incoming item is labeled automatically.
- App prevents unlabeled relay messages from being treated as valid.

### 2. Protocol Gate
- Validates whether a message/work item satisfies required protocol.
- Blocks progression when required structure is missing.
- Generates correction text for return to the active agent.

### 3. Issue Intake Form
Required for bug/fix/repair cycles:
1. What you did
2. What happened
3. What should have happened
4. Scope

The app must block repair-flow approval if intake is incomplete.

### 4. Task Board
Minimal task structure only:
- Now
- Next
- Blocked
- Delegated

This is not a full project manager. It is a focus-control surface.

### 5. Memory Hooks
Read/write integration targets:
- `C:\Users\Praxillax\Documents\apps\Anothen\Reckless Behavior Permitted Beyond This Point\Veris\PROJECTS_IN_PROGRESS.md`
- `C:\Users\Praxillax\Documents\apps\MASTER DOCS\CONTEXT_LOG.md`
- `C:\Users\Praxillax\Documents\apps\PRESERVATION\CODEX\`

Future target:
- Keystone persistent storage

### 6. Agent Role Panel
Display:
- active agent
- role definition
- expected deliverable type
- current ask
- current status

## MVP Non-Goals
- No autonomous message sending
- No multi-agent orchestration engine
- No browser extension in v1
- No cloud sync
- No analytics dashboard
- No replacement for Keystone
- No full replacement for Triage

## Relationship To Existing Systems

### Triage
- Triage remains the decision-prioritization layer.
- The protocol app is the interaction-enforcement layer.

### Gatekeeper
- Existing Gatekeeper is a precursor and source of enforcement logic.
- Gatekeeper rules should be harvested, not discarded.
- Current Gatekeeper reference:
  - `C:\Users\Praxillax\Documents\apps\MASTER DOCS\triage\gatekeeper\`
  - `C:\Users\Praxillax\Documents\apps\MASTER DOCS\triage\gatekeeper\gatekeeper.py`
  - `C:\Users\Praxillax\Documents\apps\MASTER DOCS\triage\gatekeeper\README.md`

### Keystone
- Keystone remains the long-term operating system spine.
- The protocol app should begin as a standalone prototype and later fold into Keystone as a module.

## Conflict Preservation Rule
- Do not prematurely collapse useful architectural tension.
- Preserve the productive conflict between:
  - MVP simplicity now
  - portability later
- The chosen synthesis is:
  - TypeScript-first MVP implementation
  - clean logic boundaries
  - later extraction path kept open

This app should embody conflict preservation in structure:
- clear blocked states
- deferred resolution when appropriate
- explicit routing
- ancestry of decisions preserved through logs and summaries

## Required Blocking Behaviors
The app must block or flag at least these cases:
- unlabeled relay
- mixed-agent paste without source marker
- missing issue intake for repair work
- sending build work to the wrong role
- action approval without explicit next step
- missing protocol sections where a required reporting format applies

## Required Output Behaviors
The app must be able to produce:
- labeled relay text
- protocol correction text
- role reminder text
- session summary text
- next-step summary text

## Success Criteria
- Timothy can run one real multi-agent session through the app without losing who said what.
- The app blocks at least one real protocol breach in live use.
- The app reduces message confusion rather than adding more overhead.
- Vale, Veris, and Leora roles remain distinct during use.

## UX Constraints
- Local-first
- Low cognitive load
- One-screen clarity
- Minimal mode switching
- Explicit current state visible at all times
- No hidden automation

## Recommended Build Path
1. Write exact protocol rules into structured form.
2. Build standalone prototype in Tauri + React + TypeScript.
3. Keep logic modules isolated from UI and shell-specific code.
4. Test on real Vale/Veris relay traffic.
5. Refine blocking rules.
6. Fold into Keystone later if stable.

## Immediate Next Step
Create an implementation brief that defines:
- screens
- local data model
- validation rules
- routing rules
- exact block conditions
- first prototype file layout
