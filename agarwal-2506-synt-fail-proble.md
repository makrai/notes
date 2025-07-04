Mechanisms vs. Outcomes: Probing for Syntax Fails
  to Explain Performance on Targeted Syntactic Evaluations
Ananth Agarwal, Jasper Jian, Christopher D. Manning, Shikhar Murty
arXiv:2506.16678 [cs.CL]

* ? the precise mechanism by which LLMs represent syntactic structure
  * interpretability research. 
* Probing
  * identifies the mechanism of syntax being linearly encoded in activations,
  * hE ? predicts its downstream syntactic performance
* we Adopt a "mechanisms vs. outcomes" framework, we evaluate 
  * 32 open-weight transformer models and find that 
  * syntactic features extracted via probing fail to predict outcomes of
    targeted syntax evaluations across English linguistic phenomena. Our results
  * ie a substantial disconnect between latent syntactic representations found
    via probing and observable syntactic behaviors in downstream tasks

# 1 Intro

* interpretability paradigms searching for syntactic mechanisms, 
  eg mechanistic interpretability and causal abstractions
  (Geiger+ 2022; Murty+ 2022)
* probing, a prominent approach in this domain which assumes that 
  * model activations are the mechanism through which syntactic knowledge is
    encoded and that
  * this knowledge is linearly recoverable using small supervised models 
  (Conneau+ 2018; Hewitt and Manning, 2019; Tenney+ 2019, among others).
  * no comprehensive study has evaluated whether
  ? probing accuracy is indicative of targeted syntactic outcomes
* we: Do 
  probing accuracies, measured by tree attachment scores of syntactic probes,
  effectively predict a model’s downstream performance on targeted syntactic
  evaluations? 
  * We evaluate syntactic outcomes using BLiMP (Warstadt+ 2020), 
  * BLiMP: a benchmark of minimal pairs in English grammatical contrasts
* Assigning higher probability to the acceptable sentence in an
  acceptable-unacceptable pair has been established as a desired linguistic
  outcome (Marvin and Linzen, 2018; Warstadt+ 2020).
* We train three syntax probes on 32 open-weight transformer models. 
* We then fit Ordinary Least Squares (OLS) regressions modeling BLiMP minimal
  pairs accuracy as a function of probe attachment scores on the grammatically
  acceptable sentences (Fig 1). We demonstrate that 
* levels of analysis: amalgamation of all BLiMP linguistic phenomena,
    individual phenomena, and targeted suites of challenging minimal pairs
  * across all levels of analysis syntax probing accuracy shows
    no clear predictive power for downstream outcomes. 1 Concretely, we find
    * probing performance—measured via directed and undirected unlabeled
    attachment scores (UAS/UUAS)—fails to predict model accuracy on BLiMP
    minimal pairs.
  * full-dataset level: regression fits are negligible, with
    no statistically significant relationships across 32 models and three probes.
  * per-phenomenon level, only anaphor agreement shows a significant correlation,
    but follow-up controls reveal that
    even a non-syntactic probe can produce similar effects, suggesting
    the result is likely spurious. In 
  * finer-grained evaluations targeting challenging syntactic paradigms, we test
    whether probes can recover
    critical edges—such as the subject-to-verb dependency in agreement examples
    * plausibly relevant for resolving minimal pairs.
    * However, even when the probe identifies these edges correctly,
      model success on the corresponding minimal pair is only weakly aligned
      (40–60% match rate across models). Finally, at the 
  * sentence level: UUAS scores are largely overlapping between correctly and
    incorrectly evaluated minimal pairs in over 85% of BLiMP suites.
* Taken together, our results suggest that while syntactic probing is popular,
  it fails to robustly reveal a model’s latent syntactic knowledge—external tar-
  geted evaluations remain the gold standard.

# 4 Results & Discussion

## Attachment score typically peaks in the middle layers

* Fig 2 plots PTB test g ϕ struct UUAS across model layers.
* Best layers for GPT-2 (Radford+ 2019) match with previous results from the
  literature (Eisape+ 2022), validating our probe training procedure. 
* In Appendix E, Fig 13 plots PTB test g ϕ head UAS, and we further show that
* our syntax probes’ abilities to recover encoded parse tree information in
  BLiMP sentences correlate well across training objective (g ϕ struct vs. g ϕ
  head , Fig 14) and architecture (g ϕ struct vs. g ϕ ortho , Fig 15).
* comparable range of UUAS/UAS scores between the PTB test set and BLiMP
  * ie the probes generalize from human-written PTB text
    to template-generated BLiMP

## Control probe erases contextual information.

* Fig 3 shows that for all models, regardless of the scale of the variance in
  the average word’s contextual hidden states across sentences, 
  the variance in the control probe’s projected representation space is
  near-zero. This shows 
* ie the probe nullifies context and
  uncovers GloVe-like linguistic information within hidden states.

## No significant fit on full BLiMP. 

* The first column of Fig 4 shows 
  OLS simple regression result plots at the full BLiMP dataset granularity. 
* Each of the three syntax probes demonstrates a minimal effect size with
  none reaching statistical significance
* g ϕ head has no measurable effect at all
  * Its UAS values generally exceed the UUAS values of other probes, reflecting
    successful learning of relation directionality, but there is 
    insufficient stratification along the y-axis for any predictive power.
* Table 1 (g ϕ struct ), Table 2 (g ϕ ortho ), and Table 3 (g ϕ head ) compare
  simple and multiple regression statistics. For g ϕ head , the significant
  p-value of the LRT conveys that 
  considering non-syntactic signal from activations provides better fit on full
  BLiMP than relation direction-oriented signal alone, but
  the adjusted R 2 is still very weak.

## Only anaphor agreement has statistical significance at the per-phenomenon
granularity

* The second, third, and fourth columns of panels in Fig 4 show
  simple regression result plots for anaphor agreement, subject-verb agreement,
  and filler-gap dependencies respectively. Out of the three syntax probes and
  all phenomena (full regression tables in Appendix F), 
* the only statistically significant correlations are g ϕ struct and g ϕ ortho
  on anaphor agreement.
* Probes show poor fit on minimal pairs accuracy for all other phenomena.
* probes show no predictive power even for phenomena like 
  subject-verb agreement and filler-gap dependencies
  whose behavior we might expect to be closely reliant on syntactic reprs
* the anaphor agreement result warrants caution. 
  * Fig 5 shows the surprising result that 
  the control probe, which is trained on a non-morphosyntactic task, can be
  highly correlated to the BLiMP irregular forms morphosyntactic task.
  * Non-syntactic probes can predict syntactic benchmark performance. 
  * In the absence of broad systematic correlations,
    one-off probe/task correlations are not evidence of syntactic reprs in
    hidden states being a primary explanatory variable for downstream behavior,
    even at the per-phenomenon level: 
    probes designed to be unrelated can be correlated to single tasks. 
    Even with Holm-Bonferroni correction, the anaphor agreement fit could be an
    artifact of multiple statistical testing.
* full BLiMP results: Table 1 (g ϕ struct ), Table 2 (g ϕ ortho ), and Table 3
  (g ϕ head ) present the simple and multiple regression statistics
  side-by-side.
  Aside from anaphor agreement, there is no consistent result of the simpler
  regression model providing a statistically significant better fit than the
  regression that includes the control. As a further example, 
* g ϕ head encodes hierarchical dominance of the head word, which we would
  expect to influence NPI licensing; however, Table 7 shows no such fit.

## Moderate mismatch rate in finer-grained test suite evaluation. 

* Fig 6 shows that for 3 out of the 4 challenging subject-verb agreement and
  filler-gap paradigms discussed in Section 3, 
  the match rate between g ϕ struct correctly predicting the critical edge and
  the model resolving the minimal pair correctly is between 40–60% for the
  majority of models. 
* The scatter plots show a substantial spread in model performance on both axes,
  which suggests the difficulty of the tasks. However, 
* high Hamming distances between correct prediction binary outcomes mean that
  errors do not align as much as expected.
* We conclude that extracting these critical edges, despite its possible
  relevance to deciding between the words which are different between the
  minimal pairs (Appendix D), does 
  not in fact predict evaluation success on the minimal pair.
* Fig 16 yields the same conclusion from g ϕ head probe results.

## UUAS score distributions largely overlap for correct vs. incorrect minimal
pairs. While 
* crossmodel correlations between probing and downstream performance have proved
  elusive, 
  a natural follow-up investigation for each model is the 
  sentence-level comparison of
  if there is a statistically significant difference in the UUAS score
  distribution between 
  the pool of sentences where the minimal pair is evaluated in/correctly.
* For each BLiMP test suite, we run
  a two-sample t-test for each model on these pools of UUAS scores and apply
  Holm-Bonferroni correction on the test p-values.
* The results in Fig 7 show that 
  only 8 out of 67 BLiMP test suites have statistical evidence for
  the mean of UUAS scores for correct minimal pairs being higher
  than that of incorrect minimal pairs for at least 5 models.
* Yet again, we conclude that for most models and test suites, 
  UUAS score of the probe at the sentence level (mechanism) does not predict
  if the model will succeed at the corresponding minimal pair eval (outcome)

# 5 Related Work

* examining the syntactic capabilities of language models through probing
  (Hewitt and Manning, 2019; Clark+ 2019; Müller-Eberstein+ 2022;
   Limisiewicz and Mareček, 2021; Diego-Simón+ 2024, among others).
* Tucker+ (2021) demonstrate that
  counterfactual interventions on contextual embeddings—designed to erase
  information identified by a probe—can affect downstream behavior in
  predictable ways
  * hE such effects are not robust across models or probes.
* Eisape+ (2022) perform causal intervention on transformer states during
  autoregressive generation from GPT-2. Here, 
  * we conduct a more comprehensive study to understand the
    connection between probing and downstream syntactic behavior
    across model types, scale, and probe categories.
* Ruzzetti+ (2023): not probing
  * explore the linguistic properties of monolingual BERT (Devlin+ 2019). While
  * compare layer weight matrices across monolingual models to
    uncover linguistically-motivated typological similarities. Their work can
  * a blueprint for future multilingual probing evaluations
    since common phenomena across languages may be predictable from probes
    trained on monolingual models.
* cautions against inferring causality between probed representations and
  downstream tasks
  (Bommasani+ 2022; Ravichander+ 2021; Elazar+ 2021; Belinkov, 2022)
  * Belinkov (2022) surveys probing research, emphasizing the
    importance of careful task and control design for meaningful insights

# 6 Conclusion 8
