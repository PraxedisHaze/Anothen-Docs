# KodeGnosis Comprehensive Audit & Repair Log
**Started:** 2026-01-31
**Auditor:** Claude Desktop
**Scope:** Full codebase audit, error detection, CodeGnosis → KodeGnosis rename

---

## PHASE 1: PACKAGE & CONFIG FILES

### package.json
- [ ] Rename "codegnosis" → "kodegnosis"
- [ ] Update description
- [ ] Update repository URL
- [ ] Update keywords

### Configuration Files to Update
- [ ] codegnosis.config.json → rename to kodegnosis.config.json
- [ ] tsconfig.json - check for any hardcoded references
- [ ] vite.config.ts - check for any hardcoded references
- [ ] index.html - update title and meta tags

---

## PHASE 2: PYTHON BACKEND

### Files to Audit
- [ ] analyzer_core.py
- [ ] ai_packager.py
- [ ] ghost_protocol.py
- [ ] mcp_server.py

### Issues to Find
- [ ] Import errors
- [ ] Undefined variables
- [ ] Logic errors
- [ ] CodeGnosis → KodeGnosis renames

---

## PHASE 3: REACT FRONTEND

### Core Files
- [ ] App.tsx
- [ ] App.css
- [ ] main.tsx
- [ ] index.css
- [ ] initialization.ts

### Component Files (Priority Order)
- [ ] LoomGraph.tsx (main 3D visualization)
- [ ] LoomControlPanel.tsx (sidebar controls)
- [ ] AnalysisReport.tsx
- [ ] TabInterface.tsx
- [ ] NodeInfoPanel.tsx
- [ ] WelcomeOverlay.tsx
- [ ] VaultOfValue.tsx
- [ ] TheConstruct.tsx
- [ ] SettingsModal.tsx
- [ ] DraggableResizable.tsx
- [ ] MissionInfoBox.tsx
- [ ] UnifiedTooltip.tsx
- [ ] PrintableReport.tsx

### CSS Files
- [ ] Check all for !important overuse
- [ ] Verify color consistency
- [ ] Fix broken animations

---

## KNOWN ISSUES FROM _WHATS_LEFT.md

### Critical (Breaks Functionality)
- [ ] Graph is broken
- [ ] Background slider doesn't work
- [ ] Spread doesn't work when 'Shapes' selected
- [ ] External button does unknown/nothing
- [ ] Stars disappearing when clicking missions
- [ ] Double tooltip glitch
- [ ] Missing scrollbar on Calibration/Legend when 'Tech' selected

### High Priority (UX Problems)
- [ ] Viewport buttons need to move to top left
- [ ] Legend colors: Markdown/Text same color, CSS/Video/TypeScript same
- [ ] Legend needs alphabetizing TOP TO BOTTOM, LEFT TO RIGHT
- [ ] Reset to Base tooltip overlaps
- [ ] Text under aquarium needs 120px padding
- [ ] Close 'x' buttons needed on tabs
- [ ] Indicator light positioning under shelf

### Medium Priority (Polish)
- [ ] Bloom only affects labels, not stars
- [ ] Space dust stars get too big/bright
- [ ] Need light skybox with gradient (not flat color)
- [ ] Skybox needs blended gradients, no sharp lines
- [ ] Tab opening should reposition viewport center
- [ ] Shape overlapping when on any axis - need auto-spread
- [ ] Floating labels need transparency/color coding
- [ ] Shapes need 1px borders to prevent blending

### Low Priority (Future Features)
- [ ] "What Your AI Sees" animation button
- [ ] Actionable Data tab with synergist view
- [ ] Pause button
- [ ] Double-click viewport to close tabs
- [ ] Tab viewport sizing/dragging

---

## RENAME CHECKLIST

### Text Content
- [ ] All UI labels
- [ ] All error messages
- [ ] All console logs
- [ ] All comments
- [ ] All documentation

### File Names
- [ ] codegnosis.config.json
- [ ] codegnosis256x256.png
- [ ] codegnosis512x768.png
- [ ] codegnosis768x768.ico.png
- [ ] codegnosis768x768.png
- [ ] Any other files with "codegnosis" in name

### Directory Names
- [ ] Check for any directories with "codegnosis"

---

## PROGRESS TRACKING

**Files Audited:** 0
**Errors Found:** 0
**Errors Fixed:** 0
**Renames Completed:** 0

---

## DETAILED FINDINGS

(Will be populated as audit progresses)

