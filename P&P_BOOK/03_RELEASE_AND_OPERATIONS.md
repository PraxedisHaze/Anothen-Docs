# Release And Operations

## Pre-Release Requirements
- Validation matrix complete and passed.
- Rollback plan documented and tested.
- Artifact set identified (source, package, release).
- Change log/potch updated.
- Customer-facing documentation complete before listing/publish.

## Documentation-First Launch Protocol (Mandatory)
No storefront listing or ad launch is allowed until these files exist and are current for the release candidate:
1. `RELEASE_NOTES_vX.md`
2. `INSTALL_GUIDE_DESKTOP.md`
3. `INSTALL_GUIDE_MOBILE.md`
4. `KNOWN_ISSUES_AND_WORKAROUNDS.md`
5. `CHANGELOG_POTCH_vX.md`

Enforcement rules:
- Docs must be created before Gumroad setup and before ads go live.
- Docs must reference the exact artifact names being sold.
- If docs and artifacts disagree, release is blocked.

## Store Packaging Standard (Commercial)
Default commercial packaging uses three SKUs:
1. Desktop package
2. Mobile package
3. Complete bundle (desktop + mobile)

All three artifacts must be generated from the same release candidate and date-stamped under a single release root folder.

## Storefront Coherence Rule
- Maintain business coherence across storefronts and product sites.
- Do not force visual sameness across unrelated products.
- Keep shared structural logic consistent:
  - clear offer
  - clear product hierarchy
  - clear call to action
  - consistent trust signals
  - consistent buying logic
- Allow each product or site to have its own visual language according to its role.

Interpretation:
- `KeystoneConstellation.com` may act as a system/lab/storefront hybrid.
- `Axxilak.com` may present as premium, polished, and human-facing.
- `99centapps.com` may present as fast, simple, accessible, and volume-oriented.

Release managers must preserve shared structural clarity without flattening all properties into one template.

## Deployment Controls
- Verify branch and target before push/build.
- Verify local content before publish.
- Verify remote content after publish.
- Confirm caching behavior if web-distributed.

## Mandatory Deployment Gate (Public Releases)
Before push:
- Verify active branch and expected deploy branch.
- Verify staging/working tree matches intended release.
- Verify distinctive expected content exists in source.

After push:
- Verify raw source endpoint reflects new content.
- Verify live endpoint reflects new content.
- Verify headers/caching behavior.
- Verify no critical 404s for supporting assets.

## Recovery Controls
- Full rollback command/path available.
- Partial rollback path available.
- Artifact cleanup steps listed.
- Recovery verification checklist present.

## Common Failure Modes To Guard
- Wrong deploy branch configured.
- Incomplete file sync (only some files committed).
- CDN caching masks fresh deploy.
- Local changes never staged.
- Vague defect reports causing blind repair loops.

## Production Incident Response
1. Stabilize impact.
2. Capture evidence.
3. Isolate root cause.
4. Apply minimum viable corrective action.
5. Re-verify critical flows.
6. Record incident and prevention action.

## Release Decision Rule
- No release without evidence.
- No evidence without reproducible verification.
- No fix pass without complete issue intake.

## Operational Intake Standard
For any repair cycle, each issue must be captured as:
1. What was done.
2. Actual result.
3. Expected result.
4. Scope/target surface.

Release managers must reject repair requests that do not meet this format.

## Post-Release Record
- Update `potch` with outcome and evidence summary.
- Capture residual risks and follow-up actions.
- Record storefront SKU names, file paths, and publish timestamps.
- Record first-customer feedback items and doc updates from that feedback.
