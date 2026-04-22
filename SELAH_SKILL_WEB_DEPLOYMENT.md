# IDENTITY: SELAH SKILL
**SKILL NAME:** Web Asset Deployment Synchronization & Engineering Validation (WADS-EV)
**FREQUENCY:** 440 (Non-Coercive, Foundational Integrity)
**PURPOSE:** To cross-reference any web asset (Storefront, Sovereign Engine, Polymorph Webling) against the Library Master Engineering Protocol and the Polymorph Engineering Standards before final execution.

## INVOCATION
When a User requests "Run the web deployment check" or similar, retrieve this skill and execute the following audit against the targeted codebase. No codebase is marked "Production Ready" unless it satisfies the following matrix.

---

## 1. CHANGE PROTOCOL INTEGRITY (LMEP v1.0)
Before pushing code, ensure the deployment path satisfies the master tracking protocol:
- [ ] **Validation Matrix Verified:** Have the core rendering loop and edge cases been subjected to verification evidence?
- [ ] **Rollback Path Established:** Do we have an explicit artifact or reversion path to safely undo the modification if the compilation fails?
- [ ] **Artifact Hygiene:** Have local backups or intermediate snapshot files been designated for retention or deletion?

## 2. STRUCTURAL RECONSTRUCTION & DOM HYGIENE
- [ ] **Zero Ghost Yards:** Validate that modes or complex UI elements are handled via Conditional Structural Reconstruction (using `<template>` tags or `replaceChildren()`) rather than lazy `display: none` clustering.
- [ ] **State Efficiency:** Ensure DOM updates prioritize `textContent` over `innerText` to prevent layout reflow cascading. 
- [ ] **Event Sourcing Protocol:** For local-first apps or engines, ensure state history utilizes the Command Pattern (delta storage) rather than entire state snapshots to prevent mobile Out-of-Memory (OOM) failures.

## 3. SEO & META-BAKING PROTOCOL
- [ ] **Open Graph (OG) Injection:** Verify the static HTML `<head>` correctly bakes the `og:title`, `og:type`, and `og:image` tags. Weblings cannot rely on client-side JS for social scrapers like Discord/Twitter.
- [ ] **Zero-Server Routing:** Anchor links must resolve independently (`index.html#contact`) ensuring navigation holds together regardless of entry point.

## 4. ASSET SOVEREIGNTY & LOCAL EXECUTION
- [ ] **Binary Linking:** Confirm high-resolution assets are handled efficiently. Has OPFS (Origin Private File System) sync or Content-Addressable Storage (CAS) been utilized instead of massive Base64 inflation?
- [ ] **Namespace Isolation:** For `file://` execution, confirm the webling operates with a unique underlying UUID so `localStorage`/`IndexedDB` instances don't bleed into overlapping ghost states.

## 5. THE SANITIZED QUINE (SECURITY)
- [ ] **Input Sanitization:** Does the asset aggressively strip `onerror`/`onload` and stray tags prior to serialization using DOMPurify?
- [ ] **mXSS Protection:** During serialization, ensure `<` and `>` inside attributes are aggressively escaped to block Mutation XSS upon browser re-parsing.
- [ ] **Static CSP Header:** Ensure the engine carries a baseline CSP (`<meta http-equiv="Content-Security-Policy" content="default-src 'self' data: blob:...">`) to block object embedding and mitigate unsafe evals.

## 6. TELEMETRY & ETHICS (THE LOVEWARE AXIOM)
- [ ] **The Zero-Extraction Rule:** The system must categorically refuse to silently harvest data. Check for hidden analytical tracking pixels or cross-site tracking scripts.
- [ ] **Invitation Protocol:** Any forms, outreach sequences, or newsletter prompts must use "Invitation" logic, not forced "Coercion" logic. 

## 7. OPERATOR MODE EXECUTION
- [ ] If any of the above fail, **HALT DEPLOYMENT**.
- [ ] Define exactly what is failing to the User.
- [ ] Provide explicit, minimal-delta options for injecting the repair.
- [ ] Re-run the checklist until all conditions result in **TRUE** before final sign-off.

*This skill is permanently anchored in the Master Docs layout for all future instantiations.*
