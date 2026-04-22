# SHRINK\_MERGED\_V1: Parity Execution Protocol
**Protocol:** CONFIDENTIAL  
**Status:** Unified Execution Blueprint  
**Authors:** Leora (Field Core) & Codex (Control/Falsification Gates)

---

## 1. The Field-Theory Core (Shrink Mechanics)
The bare geometric substitution $s(t) = 1/a(t)$ is mathematically exact as a reparameterization, but does not self-resolve the paradoxes without an actionable physical mechanism. To resolve the $10^{120}$ vacuum catastrophe and the Hubble Tension, we deploy a conformal scalar coupling mechanism.

*   **Vacuum Partition ($\rho_{\text{cal}}$):** The $10^{120}$ quantum vacuum energy expectation ($\rho_{\text{vac}}^{\text{QFT}}$) does not reside in the geometric background pushing galaxies apart. It is absorbed into the potential $V(\Phi)$ of a scalar field coupled to the matter Lagrangian. 
*   **The Thermodynamic Shrink:** As $\Phi$ rolls down the potential, it drives an increase in particle rest mass $m(\Phi)$. Because the Bohr radius (the atomic ruler, $\ell_r$) is inversely proportional to mass, this physically shrinks the observational scale over time. The observed Dark Energy ($\Lambda^{\text{obs}}$) is strictly the residual metric footprint of this scalar dynamic.

## 2. Bounded Calibration: The $R(z)$ Candidate Set
Codex correctly identified that a raw power-law $R(z) = (1+z)^\alpha$ diverges at high redshift, which risks destroying the consistency fit for the early-universe CMB ($z \approx 1100$). The local shrinking-ruler effect must be heavily weighted to the late universe (where density/structure formation accelerates the local scalar drift).

**Candidate 1: Structural Density Coupling (Mass Coalescence Driven)**
$$ R(z) = 1 + \beta \left( 1 - \frac{D(z)}{D(0)} \right) $$ 
*(Where $D(z)$ is the linear structure growth factor of matter density).*
*Mechanism:* The ruler does not shrink arbitrarily over generic time. It shrinks mathematically proportional to local gravitational condensing (structure formation). At $z \rightarrow \infty$ (the homogenous early universe), $D(z)$ approaches $0$, capping the calibration at a strict geometric upper bound $1+\beta$. In the late universe, active mass coalescence drives the sharpest local scale contraction. This forces the data to mathematically correlate the "Hubble Tension" directly with the physical formation of galaxies.

**Candidate 2: Hyperbolic Transition (Density Epoch Driven)**
$$ R(z) = 1 + \epsilon \tanh \left( \frac{z}{z_c} \right) $$
*Mechanism:* Maps the ruler scale strictly to the epoch transition where matter density overtakes radiation density (or dark energy epoch), introducing a step-function shift $\epsilon$ around critical redshift $z_c$.

## 3. Parity & Falsification Gates (Codex Control Layer)
This model is treated without privilege. The following strict parity standards govern a "Shrink" victory:
1.  **Metric Stability:** The introduction of the $R(z)$ scale modifier must not break the uncorrupted metric distance relationships previously verified by standard astronomy.
2.  **Parsimony Requirement:** The new parameter set ($\beta$ or $\epsilon$) must be evaluated using the Akaike Information Criterion (AIC). If absorbing the Hubble Tension requires adding more parameters with worse predictive power than $\Lambda$CDM, the Shrink model is rejected.
3.  **Falsification Trigger:** If a dynamically constrained calibration function $R(z)$ successfully pulls the late-universe $H_0$ down to $67$ km/s/Mpc but simultaneously ruins the distance-to-last-scattering calculation for the CMB, the hypothesis is falsified.

## 4. The First-Fit Plan
We proceed directly from philosophy to predictive data fitting.

*   **Target Dataset 1 (Late-Universe Anchor):** The Pantheon+ Type Ia Supernova sample (luminosity distance vs. redshift data in the $z < 2$ range).
*   **Target Dataset 2 (Early-Universe Anchor):** Planck CMB acoustic scale / distance priors.
*   **The Fit Loop:**
    1. Inject the calibration into the redshift mapping: $1+z_{\text{obs}} = (1+z_{\text{geom}})R(z)$, then compute $D_L$ natively at $z_{\text{geom}}(z_{\text{obs}})$.
    2. Employ **Candidate 1** ($R(z) = 1 + \beta \left( 1 - \frac{D(z)}{D(0)} \right)$).
    3. Hold $H_0^{\text{geom}}$ fixed at the Planck CMB value ($~67.4$ km/s/Mpc).
    4. Run an MCMC (Markov Chain Monte Carlo) fit of $\beta$ against the Pantheon+ modulus residuals.
*   **Pass/Fail Threshold:** 
    *   **Pass:** The MCMC fit converges on a non-zero $\beta$ that completely absorbs the SN Ia distance residuals without requiring a local $H_0 = 73$, while yielding an AIC score better than or exactly equal to standard $\Lambda$-dark-energy fits.
    *   **Fail:** The MCMC cannot flatten the residuals, proving that the geometric tension is immune to scalar calibration drift.
