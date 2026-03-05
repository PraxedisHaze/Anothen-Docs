# KodeGnosis Comprehensive Repair Log
**Date:** 2026-02-01  
**Scan Type:** Full Codebase Audit & Repair  
**Status:** IN PROGRESS

---

## EXECUTIVE SUMMARY
**Goal:** Make KodeGnosis production-ready by fixing all broken buttons, UI inconsistencies, and human-incomprehensible outputs.

**Current State:**
- ✅ Core analysis engine works
- ✅ 3D galaxy visualization beautiful
- ❌ UX incomprehensible to humans
- ❌ Broken buttons everywhere
- ❌ Output only useful for AI consumption

---

## DISCOVERED ISSUES

### 1. FILE SYSTEM CLUTTER
**Location:** `/src/components/`
**Issue:** Multiple broken/backup files polluting the directory
- `LoomGraph.tsx.bak` - Backup file
- `LoomGraph_broken.tsx` - Broken version
- `LoomGraph.ec0d24e.tsx` - Unknown variant
- `nul` - Empty/corrupted file

**Impact:** Confusion, potential import errors
**Fix:** Archive or delete these files
**Status:** PENDING

---

### 2. CSS !IMPORTANT OVERUSE
**Location:** `App.css` and component CSS files
**Issue:** 39 !important declarations creating specificity wars
**Details:** See `!IMPORTANT_AUDIT.md`
- 23 legitimate (browser resets)
- 16 technical debt (sidebar button cascade)

**Impact:** Hard to maintain, brittle styling
**Fix:** Refactor sidebar button cascade
**Status:** DOCUMENTED, NOT FIXED

---

### 3. MISSING TYPE DEFINITIONS
**Location:** `src/components/TabInterface.tsx` & `src/App.tsx`
**Issue:** `TabKey` type is defined in TabInterface but not exported
- App.tsx imports and uses `TabKey` type
- TabInterface.tsx defines it but doesn't export it
- This causes TypeScript compilation errors

**Impact:** Breaks type safety, prevents compilation
**Fix:** Export `TabKey` type from Tab Interface
**Status:** IDENTIFIED - READY TO FIX

---

### 4. BROKEN BUTTON INVENTORY
**Status:** CRITICAL BUGS IDENTIFIED FROM _WHATS_LEFT.md

#### CRITICAL FUNCTIONALITY BREAKS:
1. **'External' button** - Does something unknown, completely unclear to users
2. **Background slider** - No longer works
3. **Spread control** - Doesn't work when 'Shapes' is selected, generally fragile
4. **Stars disappearing** - Selecting items causes stars to vanish/reappear incorrectly
5. **Graph export** - BROKEN
6. **Viewport buttons** - Missing or wrong position

#### UI/UX CONFUSION:
- Floating labels don't match Legend after Intent/Tech split
- Double tooltip issue (popup in wrong spot, then correct spot)
- Labels overlap stars with opaque backgrounds (sharp edges)
- Clicking floating labels breaks star visibility
- No scrollbar in Calibration when Tech view pushes content off screen
- Markdown/Text same color, CSS/Video/TypeScript same color in legend

#### Missing Features:
- No 'x' close button on tabs
- No double-click to close drawers
- Calibration tab not draggable/resizable when out of drawer
- Viewport doesn't re-center when drawer opens

---

### 5. HUMAN-READABLE OUTPUT ISSUES
**Status:** SCANNING...

### 6. OUTDATED DOCUMENTATION
**Location:** `README.md`
**Issue:** Documentation references old Graphviz/Python GUI version
- References `CodeGnosis.exe` (should be Tauri app)
- References Graphviz charts (now uses 3D galaxy visualization)
- Build instructions for PyInstaller (now uses Tauri)
- UI instructions don't match actual React interface

**Impact:** Users will be confused, can't build/run properly
**Fix:** Rewrite README for current Tauri/React architecture
**Status:** IDENTIFIED

---

## REPAIR ACTIONS TAKEN

### ✅ COMPLETED FIXES:
1. **TabKey Type Export** (Type Safety)
   - Exported `TabKey` type from TabInterface.tsx
   - Added import to App.tsx
   - **Impact:** Fixes TypeScript compilation errors

### 🔧 IN PROGRESS:
**Reading potch.md revealed:**
- LoomGraph is FRAGILE - "nukes it every fuckin' time"
- Last stable commit: ec0d24e (already surgically merged)
- Gemini did autonomous work - ambitious, not sabotage
- Multiple known bugs already documented

**Strategy:**
1. Fix SAFE bugs first (tooltips, CSS, non-LoomGraph components)
2. Document EVERYTHING before touching LoomGraph
3. Create backup before any LoomGraph surgery

### ⏳ QUEUED FOR REPAIR:
**Priority 1 - SAFE FIXES (Not LoomGraph):**
1. ✅ Fix TabKey type export - COMPLETE
2. Fix double tooltip rendering (UnifiedTooltip.tsx)
3. Add scrollbar to Calibration when overflow (LoomControlPanel.css)
4. Fix legend color conflicts (LoomControlPanel.tsx color generation)
5. Make floating labels transparent background (LoomGraph.css)
6. Fix README (outdated docs)

**Priority 2 - DANGEROUS FIXES (Requires LoomGraph Surgery):**
1. Fix Background slider (starBrightness not wired to animation)
2. Fix Spread control when Shapes mode active
3. Fix stars disappearing/reappearing bug
4. Clarify 'External' button behavior
5. Update floating labels to match Intent/Tech split

---

## NEXT STEPS
1. Complete component scan
2. Identify all TypeScript errors
3. Document all broken buttons
4. Create prioritized fix list
5. Execute repairs systematically

