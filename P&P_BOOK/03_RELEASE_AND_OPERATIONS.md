# Release And Operations

## Pre-Release Requirements
- Validation matrix complete and passed.
- Rollback plan documented and tested.
- Artifact set identified (source, package, release).
- Change log/potch updated.

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
