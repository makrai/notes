Automated Attribution Graph Interpretation via Probe Prompting 
Giuseppe Birardi, Gonçalo Paulo
BlackBoxNLP 2026

[paper](https://arxiv.org/abs/2511.07002)

* interpret the computations that lead from an LLM's input to its output
  * eg by creating a sparse computational graph that
    captures most of the model behavior with smallest number of computat nodes
* Cross-layer transcoders (CLT) decompose the dense computations of the MLP
  * hE the resulting circuits still contain thousands of nodes
    even for short prompts.
* automated interpretation methods
  label individual features from corpus activations
  * hE often happens that these labels are not validated by causal intervention.
* We introduce probe prompting, a transparent rule-based pipeline that
  * groups the features of an attribution graph into concept-aligned supernodes
    from their responses on a small set of concept-targeted probe prompts,
    summarized as Cross-Prompt Activation Signatures (CPAS)
* exper
  * four factual domains, on Gemma-2-2B with 
    a public CLT dictionary and 45,596 entity-swap interventions, we find that
  * the labeled supernodes have the predicted steering behavior in every one
* Code, datasets, and an interactive demo are released as a harness for
  calibrating supernode labels against causal interventions

[github/peppinob-ol](https://github.com/peppinob-ol/attribution-graph-probing)

[huggingface/spaces](https://huggingface.co/spaces/Peppinob/concept-swap-explorer)

# 1 Intro

* mechanistic interpretability research in LLMs is focused in 
  * eg decomposing the representations used by these models and on 
    simplifying the computational graph ~> human understand
  * called reverse engineering. One way researchers have done this 
  * decomposition by training sparse autoencoders (SAEs) and their variants
    (Bricken+ 2023; Templeton+ 2024; Transformer Circuits Team, 2024; 
    Marks+ 2025). 
  * SAEs are trained with the objective of reconstructing model activations, be
    them the residual stream, the output of MLP or even of attention heads,
    while using a sparsely activating basis (features) which is hopefully more
    interpretable.
* Automated interpretation of individual features by LLM scoring 
  (Bills+ 2023; Paulo+ 2024; Templeton+ 2024) 
  produces per-feature labels from corpus activations but does 
  * hE not yield circuit-level interaction.
* Attribution graphs (Ameisen+ 2025; Lindsey+ 2025a) 
  trace the influence of features through the computational graph, but 
  * hE most graphs still have too many nodes to manually interpret. 
  * eg A single Gemma-2-2B graph for a short factual prompt routinely contains
    600–5,000 cross-layer transcoder (CLT) features and edges between them
    (Ameisen+ 2025; Lindsey+ 2025a), and 
    manual reading by an experienced circuit tracer has been reported to take on
    the order of two hours per prompt (Lindsey+ 2025b).
* As mechanistic interpretability moves from individual case studies to
  large-scale catalogs of circuits (Hanna & Ameisen, 2026; Marks+ 2025),
  automated circuit-level grouping tied to behavior is required.
* We propose probe prompting, a transparent 
  rule-based pipeline that 
  converts an attribution graph 
  into a compact set of concept-aligned supernodes. 
  * For each candidate feature in the graph 
    we run a small set of concept-targeted probe prompts and 
    summarize the feature’s responses as a Cross-Prompt Activation Signature
    (CPAS).
  * Deterministic threshold rules map each signature to one of four functional
    roles, and features that share role and name are merged into a supernode.
  * Every assignment is traceable to a specific threshold crossing, so a
    researcher can audit and edit the grouping.
* We can then produce controlled intervention experiments that can evaluate how
  good the supernode labels are.
* The paper contributes:
  * A transparent rule-based pipeline that 
    groups the features of an attribution graph 
    into concept-aligned supernodes 
    from Cross-Prompt Activation Signatures (Section 3).
  * A fitness check for supernode labels, 
    with a matched-random-control swap protocol that is 
    grouping-method-agnostic and applicable to any future grouping, including
    learned ones (Sections 3), as well as a influence matched protocol that
    swaps the most influential features.
  * Evidence that the proposed protocol labeled supernodes pass this test in
    four different factual-recall domains, showing the generalizability of the
    technique (Section 4).
  * A open release of a 44,596-run intervention dataset, anonymous code, and an
    interactive demo (Appendix A).

# 2. Related Work

## Attribution graphs and replacement models. 

* Attribution graphs operationalize feature→logit pathways in 
  a local replacement model that linearizes the residual stream through CLT or
  SAE features and freezes attention (Ameisen+ 2025; Lindsey+ 2025a).
  * neuronpedia.org exposes these graphs for selected models and displays
    per-feature cards at scale (Neuronpedia, 2025; Lindsey+ 2025c)
  * Circuit-tracer: the open-source reference implementation (Safety Resear, 2025) 
    for computing these graphs. 
  * Our work operates entirely downstream of attribution: we do not propose a
    * no new attribution method, but 
      we do produce supernodes that Neuronpedia tooling can render and pin. Our
    * a clustering technique that reduces the human labor required to 
      produce supernode labels.

## Causal circuits with transcoders. 

* Hanna & Ameisen (2026) use cross-layer transcoder feature circuits to study
  whether language models latently plan rhyming words, structuring their
  analysis around two falsifiability conditions
  (predict-token-before-emission, causally-affect-token).
* Marks+ (2025) apply sparse-feature circuit analysis to subject–verb agreement;
  we contribute a domain-general harness and a proposal on how to generate
  groupings of attribution graphs on scale.

## Causal interpretability and matched random controls.

* Geiger+ (2025) formalize three levels of interpretive claim and emphasize that
  distinguishing levels requires intervention. 
* Heap+ (2025) show that 
  SAE auto-interpretability scores (Bills+ 2023; Paulo+ 2024) and 
  standard SAE reconstruction metrics 
  can be similar for randomly-initialized and trained transformers, highlighting
  * ie need for metrics anchored to causal effect. 
* Our matched-random-control protocol (§3.8) is designed to address this critiqu
  * any structural property a random feature set shares with the labeled one
    (count, layer histogram, eligibility) is held constant; 
    only the concept alignment changes. 
* We also compare our intervention technique with 
  substituting the most influential features, showing that 
  our grouping is working not only by increasing the number of features steered.

# 3. Method

## 3.1. Domains and seed prompts

* We set four domains spanning two-hop factual recall in different relational
  structures and answer templates. Each domain has a fixed seed-prompt with
  three semantic fields (input, intermediate, answer):
|                                               | entities | # non-identity swap pairs |
|----------------------------------------------------------|---------------------------|
|USA: “capital of state containing X”           | 50       |2,450                      |
|Books: “character X appears in a book by”      | 10       |90                         |
|Products: “founder of the company that makes X”| 12       |132                        |
|Paintings: “first name of the painter of X”    | 10       |90                         |

# 6. Discussion and Conclusion

## Methodological lessons. Three findings in this paper may inform 

* intervention practice in related settings. First, 
  * matched random controls need to be structurally matched— same feature count,
    same per-layer histogram, and sampled outside every concept-aligned
    supernode—because otherwise the labeled–random gap is easy to misstate: in
    three of our four domains, matched random feature sets produce more
    source-suppression than the labeled intervention does, even though they
    redirect the model nowhere in particular.
  * the M =20 amplification default that is standard for single-feature steering
    does not carry over to the multi-feature CLT setting studied here:
    * our winning values of M are bimodal at roughly 2.4 and 6.9, and 
      a coarse sweep over M rescues a substantial fraction of misses. Third,
  * semantic fields are not interchangeable for intervention purposes:
    restricting to intermediateand answer-field features gains 14–33 pp of
    Hit-rate over using all three fields.

## Polysemanticity and cross-prompt activation. 

* CLT and SAE features are not guaranteed to be monosemantic in practice.
  * Templeton+ (2024) document feature splitting—a coarse feature in a smaller
    dictionary splits into several finer features as dictionary capacity
    grows—indicating that “one feature” is often a bundle of related meanings.
  * Lindsey+ (2025a) note this explicitly: some member features are polysemantic
    in a dictionary-wide sense, and are kept in the supernode only on account of
    the facet relevant to the traced prompt.
  * Balcells+ (2024) document related pass-through and specialization phenomena
    layer-by-layer.
* Probe prompting formalizes this ad-hoc practice. 
  * By comparing a feature’s activation across concept-targeted probes, 
    CPAS assigns each feature a prompt-contextual role: the feature is
    monosemantic enough, in the context of the prompt family under study, to
    serve as the unit of a supernode, even when it is polysemantic across the
    dictionary as a whole.
  * The same logic suggests that 
    the method is not strictly tied to a trained sparse dictionary and 
    * method can in principle be applied to raw MLP neurons, 
      which are known to be substantially more polysemantic: 
      when neurons are inspected on a small set of carefully chosen probes
      instead of on corpus-wide activations, 
      a usable functional signature can emerge even without the sparsity prior.

## Future work. Several directions seem natural. An obvious first extension is

* make the intervention attention-aware, either/or by 
  incorporating edge-attribution information or by 
  also swapping attention-head outputs along with CLT feature activations;
* replicating the main findings on Gemma2-9B, Llama-3, and alternative feature
  dictionaries would test 
  how much of the current picture is specific to Gemma-22B-it and CLTs. A third
* multilingual extension: our current prompt templates are English-only, and we
  * (Section C): the functional-token vocabulary and the directional search we
    drive do not transfer cleanly to, for example, French.

* Two further directions deserve specific mention. The first concerns 
  * the probe set itself. Our 
    * current probes are positive variations on the seed prompt (“the ⟨entity⟩
      is”), and we treat the set as fixed across features.
    * Contrastive or near-miss probes—probes that differ minimally from the seed
      along a concept dimension the model might confuse—should be considerably
      more discriminating. 
      At longer context lengths, standard for frontier models, one can imagine
      agentic variants of the harness that treat probe design as a detective
      game: an agent with a bounded action budget chooses which substring or po-
      sition to intervene on next, based on what the previous probe revealed.
  * the featurerole taxonomy itself. 
    * The four-role vocabulary (SemanticDictionary, Semantic-Concept,
      Relationship, Say-X) is an empirical extension of the roles that appear in
      circuit-tracing case studies (Lindsey+ 2025a), and the fact that it 
      * generalizes across four unrelated domains suggests 
      * ie there is a useful “model-biology” object hiding behind it; 
    * sharpening this taxonomy—
      adding roles, subdividing existing ones, or reducing them—is a research
  * the grouping machinery itself is open: 
    learned CPAS classifiers trained on the rule-based decisions could 
    replace the hand-authored decision tree 
    with a smoother map from signatures to roles.

## Conclusion. Probe prompting shows that 

* circuit-level interpretability of attribution graphs can be partially auto-
  mated with a transparent, rule-based pipeline, and that 
  the resulting labels can be used to perform entity swaps, 
  an intervention technique that 
  can be used to quickly evaluate whether supernode labels correctly cluster
  features into their actual behavior in the computational graph.
