## Executable Run Spec — Shrink/ΛCDM Parity Test (Gate-1)

---

### SECTION 1 — Required Input Files

| ID | File / Source | Format | Status |
|---|---|---|---|
| IN-01 | Pantheon+ SN Ia distance moduli `Pantheon+SH0ES.dat` | ASCII table (z, μ_obs, σ_stat) | Must be sourced |
| IN-02 | Pantheon+ full statistical + systematic covariance matrix `Pantheon+SH0ES_STAT+SYS.cov` | N×N matrix (N=1701) | Must be sourced |
| IN-03 | Planck 2018 distance priors: {R, l_A, Ω_b h²} from Chen, Huang & Wang (2019) or equivalent | Three scalar values + covariance | Must be sourced |
| IN-04 | Growth factor D(z) tabulation or solver | Output of CLASS or CAMB at fiducial cosmology **before** β fitting begins | Must be pre-computed and frozen |
| IN-05 | Fiducial cosmology for D(z) computation | {H₀=67.4, Ω_m=0.315, Ω_Λ=0.685, Ω_b=0.049} (Planck 2018 TT+TE+EE) | Fixed; not refit |

**Halt condition:** If any of IN-01 through IN-05 is absent or unverified, execution does not begin.

---

### SECTION 2 — Model Definitions and Parameter Accounting

#### Model A — Flat ΛCDM (baseline)

| Parameter | Type | Prior | Bounds |
|---|---|---|---|
| H₀ | Free | Flat | [60, 80] km/s/Mpc |
| Ω_m | Free | Flat | [0.1, 0.6] |
| M_B | SN nuisance (absolute magnitude) | Flat | [−20, −18] |

**k_A = 3** (H₀, Ω_m, M_B)

Note: Ω_Λ = 1 − Ω_m under flatness assumption. If flatness is relaxed, k_A = 4 and must be matched in Model B.

#### Model B — Shrink / Candidate 1

| Parameter | Type | Prior Run 1 | Prior Run 2 | Bounds |
|---|---|---|---|---|
| H₀_geom | **Fixed** | — | — | 67.4 km/s/Mpc (Planck; not floated) |
| Ω_m | Free | Flat | Flat | [0.1, 0.6] |
| β | Free | Flat | Gaussian μ=0, σ=0.5 | [0, 5] (Run 1); unbounded in Run 2 subject to σ |
| M_B | SN nuisance | Flat | Flat | [−20, −18] |

**k_B = 3** (Ω_m, β, M_B) — H₀_geom is fixed, not free.

**Parity check:** k_A = k_B = 3 under this configuration. AIC/BIC comparison is valid only if nuisance treatment is identical (same M_B prior, same covariance matrix). Flag and halt if any nuisance term differs between models.

**Prior justification for Run 2 Gaussian (σ=0.5):**
β=0 recovers ΛCDM; σ=0.5 allows ±1.5 excursion at 3σ, which is physically generous given that R(z) at z=0 must equal 1 exactly (no calibration drift at the observer). This is the conservative skeptical prior. If posterior under Run 2 shifts significantly from Run 1, report prior sensitivity as material.

---

### SECTION 3 — Systematics Leakage Check (Constraint 6)

**Execute before any likelihood evaluation.**

3a. Inspect the Pantheon+ systematic covariance construction documentation (Brout et al. 2022). Identify whether any of the following ΛCDM-specific assumptions are embedded:

- Peculiar velocity corrections derived from ΛCDM-predicted flow fields
- Bias corrections (selection, mass step) calibrated against ΛCDM simulations
- Milky Way dust/host calibration using ΛCDM-based distance anchors

3b. Classification:

| Finding | Action |
|---|---|
| No ΛCDM-specific assumptions in systematics | Proceed |
| ΛCDM assumptions present but affect < 0.1 mag in μ | Flag in output; proceed with caveat |
| ΛCDM assumptions present and affect ≥ 0.1 mag in μ, or affect residual slope vs. z | **Flag as contamination risk; halt; define mitigation before proceeding** |

3c. If halt is triggered: mitigation options are (i) use statistical-only covariance (C_stat) for parity test with explicit caveat, or (ii) reweight systematics under Shrink geometry — requires separate specification before resuming.

---

### SECTION 4 — Redshift Mapping Implementation

The modified luminosity distance is computed as follows:

1. For each observed z_obs in the Pantheon+ catalog, solve for z_geom via:

   `(1 + z_obs) = (1 + z_geom) · R(z_geom)`

   where `R(z) = 1 + β(1 − D(z)/D(0))`

   This requires a numerical root-find per data point (e.g., Brent's method; tolerance 1e-8).

2. Compute D_L at z_geom using the standard comoving distance integral under {H₀_geom, Ω_m}:

   `D_L(z_geom) = (1 + z_geom) · (c/H₀_geom) · ∫₀^z_geom dz'/E(z')`

3. Compute distance modulus: `μ_model = 5 log₁₀(D_L / 10 pc) + M_B`

**Implementation check:** At β=0, verify that μ_model(z) reproduces the ΛCDM baseline to numerical precision (Δμ < 1e-6) before any fitting begins. Halt if not satisfied.

---

### SECTION 5 — Likelihood Function

`log L = −0.5 · ΔμᵀC⁻¹Δμ`

where `Δμ = μ_obs − μ_model` and C = full Pantheon+ covariance matrix (IN-02).

Both models use this identical likelihood. No modification permitted.

---

### SECTION 6 — Sampler and Convergence Settings

| Setting | Value |
|---|---|
| Sampler | MCMC (emcee or equivalent ensemble sampler) |
| Walkers | ≥ 32 (at minimum 4× number of free parameters) |
| Burn-in steps | 2000 (discarded) |
| Production steps | 10,000 minimum |
| Convergence criterion | Gelman-Rubin R̂ < 1.01 for all parameters |
| Autocorrelation check | Chain length > 50× integrated autocorrelation time τ for each parameter |
| Random seed | Fixed and reported (for reproducibility) |
| Runs | Execute Run 1 (flat β prior) and Run 2 (Gaussian β prior) independently; do not share chains |

---

### SECTION 7 — Pass/Fail Thresholds

#### Test 1 — SN Ia Fit Quality

| Metric | Pass | Fail |
|---|---|---|
| Reduced χ² (Model B) | ≤ 1.05 | > 1.05 |
| Δlog L (B − A) | ≥ 0 | < 0 |

#### Test 2 — AIC / BIC

`AIC = 2k − 2 log L_max`
`BIC = k ln(N) − 2 log L_max` (N = 1701)

| Metric | Interpretation | Halt/Escalate? |
|---|---|---|
| ΔAIC ≤ −2 | Positive evidence for Model B | No |
| −2 < ΔAIC ≤ 0 | Weak preference; inconclusive | No; flag |
| ΔAIC > 0 | Model B not preferred | Candidate 1 fails; evaluate Candidate 2 if structured residuals present |
| ΔBIC > 0 | BIC penalizes Model B (expected given N) | Report; do not override AIC result |

#### Test 3 — CMB Planck Scope Guard (Hard Halt)

Compute shift parameter R and acoustic scale l_A under Model B using the fixed {H₀_geom=67.4, Ω_m_posterior} and the Shrink D_L mapping.

| Condition | Action |
|---|---|
| R and l_A within 1σ of Planck priors (IN-03) | Proceed |
| R or l_A deviates by > 1σ | **HARD HALT — escalate to full Planck CMB scalar power spectrum likelihood before any "successful fit" claim is made** |

This test executes on the best-fit posterior parameters, not on the prior. It is not waivable.

#### Test 4 — Residual Diagnostics

| Check | Pass |
|---|---|
| Δμ(z) slope (linear fit) | |dΔμ/dz| < 2σ detection |
| Δμ vs. host mass step | Consistent with Pantheon+ reported step (no excess) |
| Δμ autocorrelation vs. z | No detectable structure at any scale |

#### Test 5 — Parameter Stability Across z-Splits

Split Pantheon+ into: low-z subsample (z < 0.5) and high-z subsample (0.5 ≤ z ≤ 2.0).

| Check | Pass | Fail |
|---|---|---|
| β_lowz vs. β_highz | Consistent within 2σ | Discrepant at > 2σ → model fitting noise |

#### Test 6 — Prior Sensitivity

| Check | Pass | Flag |
|---|---|---|
| β posterior Run 1 vs. Run 2 | Means within 1σ; widths comparable | Any shift > 1σ between posterior means = prior sensitivity material; must be reported |

---

### SECTION 8 — Candidate Order Discipline

- **Candidate 1 executes first** (all tests above).
- Candidate 2 (tanh form, parameters ε and z_c) is evaluated **only if**:
  - Candidate 1 ΔAIC > 0 (fails parsimony), **AND**
  - Residual diagnostics show structured Δμ(z) not captured by Candidate 1.
- If Candidate 2 is evaluated, apply identical dual-prior sensitivity runs:
  - Run 1: flat ε ∈ [0, 1], flat z_c ∈ [0.1, 5.0]
  - Run 2: Gaussian ε ~ N(0, 0.2), Gaussian z_c ~ N(0.5, 0.5) (justify σ_z_c relative to matter-radiation equality epoch)
  - k_B increases to 4 for Candidate 2; recompute AIC/BIC accordingly.

---

### SECTION 9 — Halt Conditions Summary

| ID | Trigger | Action |
|---|---|---|
| H-01 | Any input file (IN-01 to IN-05) missing or unverified | Do not begin |
| H-02 | β=0 recovery check fails at numerical precision | Do not begin fitting |
| H-03 | Systematics leakage rated material (≥0.1 mag or slope-affecting) | Halt; define mitigation |
| H-04 | Nuisance/systematics treatment differs between Model A and B | Flag comparison invalid; halt |
| H-05 | CMB Planck Scope Guard triggered (R or l_A > 1σ deviation) | Hard halt; escalate to full Planck likelihood |
| H-06 | MCMC fails convergence (R̂ ≥ 1.01 after 10k steps) | Extend chain to 50k; if still failing, halt and report |
| H-07 | β posterior entirely consistent with 0 at > 95% in both runs | Candidate 1 fails; proceed to Candidate 2 only if residuals are structured |
