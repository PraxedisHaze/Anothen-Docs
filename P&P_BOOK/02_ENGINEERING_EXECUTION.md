# Engineering Execution

## Non-Negotiable Sequence (Anti-Flail)
1. Parse check first.
2. Runtime error capture second.
3. Behavior change third.
4. One hypothesis per change.
5. Verify immediately after each change.
6. Roll back immediately if no measurable improvement.

## Enforcement
- If parse/runtime fails, stop feature work and resolve blocker first.

## Severity Gates
- `S0`: emergency break/fix, retro-report required.
- `S1`: written plan + explicit approval before coding.
- `S2`: written plan + acknowledgement.
- `S3`: lightweight plan.

## Mandatory Report Format
- Changed:
- Verified:
- Result:
- Next step:

## Change Controls
- Small reversible edits.
- Explicit scope boundaries.
- No hidden side effects.
- Maintain rollback path before ship.

## Role Split (Default)
- `Codex`: designer, builder, implementer.
- `Claude`: reviewer, auditor, verifier, gap-finder.

Purpose:
- keep build and audit as separate jobs
- reduce self-justifying mistakes
- improve verification quality before ship

Rule:
- The builder does not act as sole final verifier on high-risk or ship-bound work when a reviewer is available.
- The reviewer prioritizes regressions, hidden assumptions, missing tests, and incomplete verification.

## Change Design Standard
Every S1/S0 and any high-risk change must include:
1. Written goal.
2. Design choice and rejected alternatives.
3. Detailed plan.
4. Breakage assumption.
5. Risk register with rollback triggers.
6. Validation matrix with explicit pass criteria.
7. Deployment and recovery plan.

## Validation Minimums
- Core flow tests.
- Edge case tests.
- Regression checks.
- Platform checks (desktop/mobile as relevant).

## Universal Issue Intake Gate (No Exceptions)
Before debugging or repair work starts, issue intake must be complete.

Mandatory fields per issue:
1. What you did.
2. What happened.
3. What should have happened.
4. Scope (Desktop/Mobile/Backend/Build/Release/Docs/Other).

If intake is incomplete:
- Stop implementation.
- Request missing fields only.
- Resume only after complete intake.

Required add-ons by class:
- UX/Layout: screen name, device/model, orientation, screenshot/video.
- Behavior/logic: exact trigger sequence, frequency.
- Performance: device + observed metric.
- Build/release: command + full error text + expected artifact.
- Data/state: source + persistence expectation + restart behavior.

Triage order when multiple issues are provided:
1. ship blockers
2. severe regressions
3. polish

## One-Change Execution Rhythm
- One change chunk.
- Verify immediately.
- Report.
- Wait for explicit go if requested by owner mode.

## Stop Conditions
- Unexpected behavior growth.
- Reproducible regression in critical path.
- Requirement ambiguity with high risk.
- Owner requests pause.

## Artifact Discipline
- Generated artifacts are not source of truth.
- Never manually maintain build intermediates.
- Keep source/editable files separate from generated outputs.

## Applings-First Rule (Absolute)
- Build features as reusable modules first, not one-off page code.
- Each change must either create a reusable module or improve an existing one.
- No feature is complete without module boundary + interface contract.
- Prefer composition over duplication; app assembly should be integration of modules.
- Record module details in report blocks (module name, interface, source-of-truth path).

## Standard Report Block
- Changed:
- Verified:
- Result:
- Next step:
- Risks now:
- Rollback trigger:

## Terminal Command Etiquette (MANDATORY)

Every terminal command given to Timothy must include:
1. **Where to run it** — which app, which terminal type (PowerShell, bash, cmd), which directory.
2. **The command itself.**

Never assume Timothy knows which terminal is open or which directory he's in. Never use shell syntax (`&&`, `/c/`, etc.) without confirming the shell type first.

Default assumption: Timothy is in PowerShell unless told otherwise.
PowerShell uses `;` not `&&` to chain commands. Paths use `C:\` not `/c/`.

Example format:
> Open PowerShell in `C:\Users\Praxillax\Documents\apps\SnapText\` and run:
> ```
> npm start
> ```

Giving a command without context is unkind. It costs Timothy time and tokens every time he guesses wrong.
