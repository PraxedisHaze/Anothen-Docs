# Slider Debug Checklist
**Date:** 2026-02-01
**Issue:** Sliders not working

## WHAT TO TEST:

### 1. Check if Calibration tab is visible:
- Launch app (`npm run tauri:dev`)
- Analyze a project
- Look at the tabs at top of screen
- **Do you see a "Calibration" tab?**

### 2. Check if tab opens:
- Click the "Calibration" tab
- **Does a drawer slide out from the left?**

### 3. Check what's inside:
- If drawer opens, look for:
  - "Map Legend" header
  - Intent/Tech toggle buttons  
  - List of file types with colored dots
  - Sliders below the legend

### 4. Check if sliders respond:
- Try dragging the "Atmosphere (Bloom)" slider
- **Does the slider handle move when you drag it?**
- **Does the percentage number change?**

### 5. Check console for errors:
- Press F12 to open DevTools
- Look at Console tab
- **Are there any red errors?**

## TELL ME:
1. Which step fails?
2. What do you see instead?
3. Any error messages?

This will help me pinpoint the exact issue.

