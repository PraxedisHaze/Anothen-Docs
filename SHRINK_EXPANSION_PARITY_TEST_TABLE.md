# Shrink vs Expansion Parity Test Table

Protocol: CONFIDENTIAL  
Purpose: Evaluate `Shrink` and `Expansion` with identical standards.  
Rule: No privileged model. Same evidence bar, same falsification bar, same status lanes.

## Status lanes
- `KEPT` = survives current evidence and falsification checks.
- `REJECTED` = contradicted by evidence or fails core predictions.
- `UNRESOLVED` = insufficient evidence, mixed evidence, or test not completed.

## Evidence fairness rules
1. A claim is never promoted by rhetoric; only by observations and reproducible analysis.
2. A claim can be rejected by one decisive contradiction if the contradiction is robust.
3. If both models can fit current data, both remain `UNRESOLVED` until discriminating tests are run.
4. External challenge rule: each claim must state what evidence would change its status.

## Core comparison table
| ID | Domain | Expansion Model Claim | Shrink Model Claim | Shared Observable | Discriminating Prediction | Falsification Trigger | Current Status |
|---|---|---|---|---|---|---|---|
| C1 | Cosmological redshift | Redshift mostly from metric expansion of spacetime. | Redshift mostly from scale/ruler contraction effects in observer frame. | Distance-redshift relations across surveys. | If independent ruler standards remain stable while redshift trends persist exactly as expansion predicts, favors Expansion. If ruler-drift signatures appear consistently and reduce dark-energy residuals, favors Shrink. | A stable, cross-method ruler baseline that removes shrink-fit advantage rejects Shrink for this claim. | UNRESOLVED |
| C2 | Acceleration / dark energy | Late-time acceleration requires dark-energy term (or equivalent). | Apparent acceleration emerges from shrinking scale interpretation; dark energy partly/wholly reinterpreted. | Supernova Ia residuals, BAO, CMB fit residuals. | Model with fewer ad hoc terms and stronger cross-dataset fit wins. | If shrink reinterpretation cannot fit multi-probe datasets without extra complexity, reject Shrink for this claim. | UNRESOLVED |
| C3 | Gravity interpretation | Gravity from curved spacetime dynamics (standard GR framing). | Gravity interpreted as differential contraction/lag effects between mass-dense regions and frame. | Precision orbital dynamics, lensing, timing tests. | Predictive parity must hold at precision-test level. | Any systematic mismatch on precision tests rejects the weaker framing in this lane. | UNRESOLVED |
| C4 | Quantum-classical transition | Decoherence/measurement frameworks explain transition. | Synchronization/coherence-threshold framing explains transition (same substrate, different lock states). | Decoherence timing and synchronization analog experiments. | Better predictive mapping across both micro and meso regimes wins. | If synchronization framing fails to predict transition behavior where decoherence succeeds, reject Shrink lane here. | UNRESOLVED |
| C5 | Parsimony | Expansion is baseline parsimonious under current accepted frameworks. | Shrink is parsimonious if it reduces unexplained terms across domains. | Total parameter count vs explanatory coverage. | Lower complexity for equal-or-better predictive power wins. | If shrink requires equal or more assumptions without better predictions, reject Shrink on parsimony. | UNRESOLVED |

## Test execution log template
| Date | Test ID | Dataset/Method | Result Summary | Model Favored | Confidence (Low/Med/High) | Reviewer |
|---|---|---|---|---|---|---|
| 2026-04-06 | C1 | Internal derivation review from `ANOTHER_PAPER_RECORD.md` (redshift/ruler-decay claim; line anchors ~402) + framing in `Antigravity_Cores/02_SCIENCE_CORE.md` | Current record asserts redshift can be reinterpreted as ruler/scale decay (Shrink lane), but no external cross-survey discriminating fit is logged here yet. This is a coherent internal hypothesis, not yet external multi-probe confirmation. | Shrink (provisional) | Low | Codex (record synthesis) |
| 2026-04-06 | C2 | Internal derivation review from `ANOTHER_PAPER_RECORD.md` (dark-energy reinterpretation; line anchors ~402) + `Antigravity_Cores/02_SCIENCE_CORE.md` | Current record claims dark energy may be measurement-effect under shrinking-ruler interpretation. No side-by-side external fit against SN Ia + BAO + CMB residuals is documented in this file set. Keep as unresolved until discriminating multi-probe test is run. | Neither (pending discriminating fit) | Low | Codex (record synthesis) |
| 2026-04-06 | C3 | Internal derivation review from `ANOTHER_PAPER_RECORD.md` (gravity as differential contraction; line anchors ~404, ~426) | Current record provides a clear Shrink-side technical definition of gravity and a consistent explanatory narrative, but no precision-test comparison (orbital/lensing/timing residuals) is recorded here. Treat as structured hypothesis pending precision benchmark tests. | Shrink (provisional) | Low | Codex (record synthesis) |

## Evidence provenance map (current, from existing records)
| Claim ID | Internal Derivation Present | External Reproducible Dataset Fit Logged Here | Notes |
|---|---|---|---|
| C1 | Yes | No | Internal framing exists; cross-survey discriminating fit not yet logged. |
| C2 | Yes | No | Reinterpretation stated; no full multi-probe residual comparison logged. |
| C3 | Yes | No | Definition present; no precision-test benchmark table logged. |

## Decision protocol
1. Run at least one discriminating test for each claim ID (`C1-C5`).
2. Update status per claim after each tested result.
3. Only promote global model preference after at least 3 claim lanes reach `KEPT` with medium-or-higher confidence.
4. Preserve rejected hypotheses in archive with rejection reason (no silent deletion).

## Immediate next actions
1. Populate first three rows in the test execution log from existing notes in `ANOTHER_PAPER_RECORD.md` and `Antigravity_Cores/02_SCIENCE_CORE.md`.
2. Mark which claims currently rely on internal derivation vs external reproducible datasets.
3. Assign independent review pass before any `KEPT` promotion.
