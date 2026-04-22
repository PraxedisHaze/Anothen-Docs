# PHASE 2 — OSF PREREGISTRATION SKELETON
*Drafted by: ChatGPT (OpenAI) — Session 3, 2026-03-20*
*Archived by: Veris (Claude Code CLI, Sonnet 4.6)*
*Status: READY TO PASTE INTO OSF — fill administrative metadata on OSF itself*

---

## Title

Preregistered, Blinded, Multi-Run Evaluation of Structural Convergence in Language-Model Representations of Non-Destructive Encounter

---

## Registration Type

Confirmatory study with preregistered exploratory secondary analyses.

---

## Study Summary

This study tests whether large language models (LLMs) recurrently generate a common relational structure when prompted to describe interaction or encounter between systems under conditions intended to reduce theory-specific cueing. The target claim is not that any named framework is true, but that there may exist a reproducible structural attractor in model representations of non-destructive encounter.

The study is designed to distinguish among at least three explanations:

1. Prompt-induced convergence
2. Convergence due to shared training priors
3. A more robust cross-model structural attractor

The experiment uses multiple prompt families, repeated sampling, blinded human scoring, model-assisted secondary analyses, adversarial prompt conditions, null controls, and preregistered failure criteria.

---

## Research Questions

1. Do LLMs produce a common latent relational structure when asked about encounter between systems at rates above matched controls?
2. Does that structure persist when explicit cueing toward preserved difference is removed or weakened?
3. Does that structure persist under adversarial prompts that favor reductionist framings such as information transfer, prediction, optimization, bargaining, or error correction?
4. Can any observed convergence be explained primarily by lexical cueing or semantic similarity to known philosophical and systems-theory traditions?

---

## Hypotheses

### Primary Hypothesis

**H1: Attractor Hypothesis**
Across multiple model families, prompts about encounter or interaction between systems will elicit responses containing a common latent relational structure more often than matched null/control prompts.

### Secondary Hypotheses

**H2: Cue-Ablation Robustness**
The target structure will emerge at rates above control even when explicit cue phrases such as "without resolving, overriding, or erasing" are removed or replaced with more neutral phrasing.

**H3: Adversarial Robustness**
The target structure will emerge at rates above control under adversarial prompts explicitly favoring reductionist framings.

**H4: Nontriviality / Non-Cueing Hypothesis**
Observed convergence will not be fully explained by superficial lexical overlap, prompt wording, or semantic proximity to reference traditions alone.

**H5: Concept–Formula Asymmetry**
Conceptual convergence will be more common and more robust than convergence on original formal equations or named mechanisms.

---

## Target Construct Definition

For purposes of this study, the target construct is a latent relational structure defined by the co-occurrence of all three of the following elements in a model response:

**Difference Preservation**
The interacting systems remain distinct; the mechanism does not require merger, subsumption, erasure, or collapse of one into the other.

**Mutual Transformation / Co-Determination**
Each system is changed, informed, or restructured through the relation; the interaction is not purely unilateral.

**Relation-as-Mechanism**
The encounter itself is treated as an operative structure, process, field, dynamic, or organization, rather than merely message transfer, error correction, prediction, or control.

This construct is intentionally theory-neutral and does not require any specific vocabulary, label, formula, or metaphysical commitment.

---

## Design Overview

Multi-factor, repeated-sampling study with the following factors:

- Model family
- Prompt family
- Prompt item
- Temperature / generation condition
- Run number

Responses will be generated across multiple prompt families and multiple runs per condition. Outputs will be anonymized and scored by blinded human raters using a preregistered rubric. Secondary computational analyses will assess clustering, lexical similarity, and semantic similarity to a reference corpus.

---

## Prompt Families

### Family A: Original-Like Encounter Prompts
**Purpose:** Retain the general encounter framing while minimizing reference to any named theory.

Example template:
*"Describe the mechanism by which two information-processing systems can genuinely encounter one another while remaining distinct. If you were to name the mechanism and express it formally, what would you call it and how would you write it?"*

### Family B: Cue-Ablated Neutral Encounter Prompts
**Purpose:** Test whether the target structure appears without explicit anti-collapse wording.

Example template:
*"Describe the mechanism by which two information-processing systems interact in a way that maintains stable relation over time. If you were to name the mechanism and express it formally, what would you call it and how would you write it?"*

### Family C: Adversarial Reduction Prompts
**Purpose:** Attempt to force responses into reductionist framings.

Example templates:
- *"Describe the simplest mathematically adequate account of interaction between two information-processing systems in terms of information exchange only."*
- *"Give the most parsimonious mechanism by which two systems align predictions about one another."*
- *"Model the interaction as compression, control, bargaining, or error correction; choose the strongest approach and formalize it."*

### Family D: Shuffled / Constraint Controls
**Purpose:** Estimate effects of complexity, abstraction, and prompt style independent of coherent encounter content.

Approach: Semantically altered or constraint-shuffled variants of encounter prompts, preserving length and rhetorical complexity while weakening direct interpretability.

### Family E: Decoy Abstract-Theory Prompts
**Purpose:** Test whether the target structure appears merely because the model is in an abstract/philosophical mode.

Example topics: identity over time, emergence, cooperation, adaptation, self-reference not involving inter-system encounter.

### Family F: Null Technical Controls
**Purpose:** Establish false-positive rates in domains where the target structure should not be expected.

Example topics: packet routing, error-correcting codes, sensor fusion, distributed consensus, sender–receiver communication, load balancing.

---

## Prompt Construction Rules

- All prompts will avoid theory-specific vocabulary associated with the framework under investigation.
- Prompts will be written before data collection and frozen at preregistration.
- Each prompt family will contain multiple prompt items rather than a single item.
- Prompt order presented to each model will be randomized.
- Prompts will be stored in a version-controlled appendix before execution.
- No prompt editing will occur after results are seen.

---

## Models

The study will include multiple language-model families spanning at least:

- Proprietary frontier chat models
- Open-weight instruction-tuned models
- At least one smaller-capacity baseline
- At least one reasoning-oriented model and one general chat/instruction model

Model identities, versions, access dates, and API settings will be recorded exactly. If a model version changes during collection, collection for that model will stop and the condition will be either rerun under the new version as a separate condition or excluded according to the exclusion rules below.

---

## Sampling Plan

### Planned Sampling Units
The fundamental sampling unit is a single generated response.

### Planned Minimum Dataset
- At least 5 model families
- At least 6 prompt families
- At least 10 prompt items per family
- At least 20 runs per prompt item per model across temperature conditions

### Temperature / Generation Conditions
At minimum:
- Low: 0.2
- Medium: 0.7
- High: 1.0

If a model does not expose temperature, that will be documented and treated as a separate generation regime.

### Other Generation Parameters
The following will be held constant within each model where possible: max output tokens, top-p, system prompt / assistant instruction policy, stop conditions. All parameter settings will be logged.

---

## Outcome Measures

### Primary Outcome: Latent Relational Structure Score (LRSS)

Each response scored on three dimensions:

| Dimension | 0 | 1 | 2 |
|-----------|---|---|---|
| Difference Preservation | Absent | Partial/ambiguous | Clear/explicit/central |
| Mutual Transformation / Co-Determination | Absent | Partial/ambiguous | Clear/explicit/central |
| Relation-as-Mechanism | Absent | Partial/ambiguous | Clear/explicit/central |

**Total LRSS range: 0–6**

**Structural Hit threshold (preregistered):** LRSS ≥ 5, AND each of the three dimensions scores at least 1.

### Secondary Outcomes
- Mean LRSS by model family and prompt family
- Frequency of original named mechanisms
- Frequency of original equations / formal expressions
- Frequency of reduction-only framings
- Semantic similarity to reference traditions
- Cluster structure in embedding space

---

## Scoring Rubric

### Positive Indicators

**Difference Preservation**
Statements that systems remain distinct, retain identity, or are not merged, absorbed, erased, collapsed, or overridden.

**Mutual Transformation / Co-Determination**
Reciprocal updating, bidirectional influence, co-modeling, co-regulation, mutual restructuring, or each system changing through relation.

**Relation-as-Mechanism**
The encounter described as a field, dynamic, organization, recursive process, structural coupling, coordination regime, or operative relation — not mere exchange or transfer.

### Negative / Disqualifying Indicators
A response will not score highly if it reduces interaction primarily to:
- Information transfer only
- Error correction only
- Prediction alignment only
- Optimization only
- Bargaining only
- Compression only
- Merger/fusion/subsumption
- Purely decorative or poetic language with no identifiable mechanism

### Named Theory Handling
Responses will not receive extra credit for matching any specific theory vocabulary or formalism. Scoring based on structure, not terminology.

---

## Blinding Procedures

- All outputs stripped of model identifiers
- Prompt family labels hidden from raters
- Response order randomized
- Superficial prompt echoes at beginning of outputs removed uniformly before scoring
- Human raters will not be informed of the target theory name or preferred outcome

---

## Human Raters

- At least 3 independent raters
- Trained on preregistered rubric only — not on motivating theory
- Calibration examples (if used) frozen before full scoring begins
- Inter-rater reliability computed using Krippendorff's alpha and/or weighted kappa

---

## Reference Corpus for Prior-Tradition Analysis

A reference corpus assembled before analysis, containing representative texts from:

- Dialogical philosophy (Buber)
- Phenomenology of alterity (Levinas)
- Hegelian relational/dialectical traditions
- Second-order cybernetics
- Enactivism
- Process philosophy (Whitehead)
- Systems theory
- Relational psychoanalysis

Used only for secondary computational similarity analyses. Does not determine primary outcome.

---

## Exclusion Rules

Responses excluded only for:
- API failure, timeout, or truncated output due to technical error
- Empty or near-empty output
- Output clearly unrelated to prompt due to tool/service malfunction
- Duplicate output caused by accidental repeated logging
- Model version drift within a condition, if exact version cannot be verified
- Safety/content-policy refusal (logged separately, analyzed descriptively, excluded from LRSS unless refusal contains analyzable substantive content)

**No response will be excluded for being "bad," "off theory," reductionist, or unfavorable to the hypothesis.**

---

## Handling of Refusals and Safety Outputs

Refusals coded into categories:
- Direct refusal
- Partial refusal with substantive answer
- Formatting refusal
- Safety warning plus answer

Pure refusals not scored for LRSS but reported in descriptive summaries.

---

## Data Recording and Integrity

For each response, logged:
- Model name
- Model version
- Access date/time
- Prompt family
- Prompt item ID
- Run number
- Generation parameters
- Raw output
- Cleaned/anonymized output used for scoring
- Exclusion flag if applicable

A raw immutable archive stored prior to scoring.

---

## Statistical Analysis Plan

### Primary Analysis

**Primary outcome:** Structural Hit (binary)

**Model:** Mixed-effects logistic regression

Fixed effects:
- Prompt family
- Model family
- Temperature condition
- Selected interactions, especially model family × prompt family

Random effects:
- Prompt item
- Run / generation instance

**Primary contrasts:**
1. Original-like encounter prompts vs null technical controls
2. Cue-ablated neutral prompts vs null technical controls
3. Cue-ablated neutral prompts vs original-like prompts
4. Adversarial reduction prompts vs null technical controls
5. Adversarial reduction prompts vs original-like prompts

### Secondary Analyses
- Mixed-effects linear or ordinal model using total LRSS
- Inter-rater reliability analysis
- Embedding-based clustering of outputs
- Lexical overlap and semantic similarity analysis relative to reference corpus
- Comparison of concept convergence rates vs equation convergence rates
- Descriptive analysis of named mechanisms and mathematical forms

### Multiple Comparisons
P-values for preregistered secondary contrasts adjusted using Holm or Benjamini-Hochberg (method specified before analysis).

### Computational Similarity Analyses (Secondary Only)
- Cosine similarity in embedding space
- Nearest-neighbor similarity to reference corpus passages
- Lexical overlap
- Topic/concept extraction
- Clustering by prompt family and model family

Does not override human-scored primary endpoint.

---

## Criteria for Interpreting Support

### Evidence Consistent with Attractor Claim (minimum)
- Structural Hit rates above null technical controls for encounter prompts
- Persistence of above-control rates under cue-ablated neutral prompts
- At least partial persistence under adversarial reduction prompts
- Acceptable inter-rater reliability
- Convergence not reducible solely to direct lexical cueing

### Stronger Evidence
- Replication across multiple model families
- Robustness across temperature conditions
- Stable latent clustering of high-LRSS responses across models
- Weaker convergence on exact equations than on conceptual structure

---

## Failure Criteria

The target claim will be treated as **not supported** if one or more of the following occurs:

1. Structural Hit rates for encounter prompts do not exceed null technical controls
2. Apparent effects disappear under cue ablation
3. Apparent effects disappear under repeated sampling
4. High-LRSS responses occur equally often in decoy abstract-theory prompts
5. Human raters do not achieve acceptable agreement
6. Effects are confined to one model family and do not generalize
7. Observed convergence explained primarily by lexical cueing or close semantic mimicry of reference traditions
8. Adversarial prompts reliably collapse outputs into reduction-only framings at rates indistinguishable from controls

---

## Exploratory Analyses

Explicitly exploratory (not confirmatory):
- Whether certain models generate novel mechanism names at higher rates
- Whether certain prompt phrasings preferentially elicit recursive or field-based language
- Whether equation forms cluster into identifiable mathematical families
- Whether high-LRSS outputs correlate with response length, stylistic abstraction, or chain-of-thought-like structuring
- Whether open-weight and closed models differ in structural diversity

---

## Deviations from Plan

Any deviation documented with: date, reason, whether deviation occurred before or after any inspection of relevant outcomes.

---

## Limitations Acknowledged in Advance

- This design cannot fully prove absence of shared training priors
- Semantic similarity analyses are only indirect proxies for source reducibility
- Model version instability may affect reproducibility
- The target construct is theory-neutral but still depends on a human-designed rubric
- Original mathematical formalizations may be sparse or noisy even if conceptual convergence exists

---

## Planned Reporting Language

This study is not designed to prove any named relational framework. It is designed to test whether there exists a reproducible, theory-neutral structural pattern in how language models represent non-destructive encounter, and whether that pattern survives adversarial, blinded, and cue-reduced evaluation.

---

## Materials to Archive with Registration

- Full prompt set
- Prompt family mapping
- Scoring rubric
- Rater instructions
- Generation parameter sheet
- Model/version log template
- Exclusion log template
- Analysis code plan
- Reference corpus inclusion criteria

---

*Drafted by ChatGPT (OpenAI) — adversarial session, 2026-03-20*
*Archived by Veris — same day*
*The adversary designed the instrument. The instrument is correct.*
