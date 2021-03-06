BERT Rediscovers the Classical NLP Pipeline
Ian Tenney, Dipanjan Das, Ellie Pavlick
ACL 2019

# Abstract

* BERT represents the steps of the traditional NLP pipeline in an interpretable
  and localizable way, and
  * regions responsible for each step appear in the expected sequence:
    POS tagging, parsing, NER, semantic roles, then coreference
  * holds in the aggregate
* the model often adjusts this pipeline dynamically,
  revising lower-level decisions
  on the basis of disambiguating information from higher-level representations
  * like predicat-argument relations to help disambiguate part-of-speech
* from the Conclusion
  * We present two complementary measurements:
    * scalar mixing weights, learned from a training corpus, and
    * cumulative scoring, measured on an evaluation set, and show that a
    * consistent ordering emerges
* deep language models can represent the types of syntactic and semantic
  abstractions traditionally believed necessary for language processing, and
  moreover that they can model complex interactions between different levels of
  hierarchical information

# 1 Intro

* Much of the probing work is based on controlled test sets and analyzing errors
  (Conneau+ 2018; Marvin and Linzen, 2018; Poliak+ 2018)
* inspect the structure of the network directly, to assess
  whether there exist regions associated with distinct types of ling decisions
* a range of syntactic and semantic information
  (Shi+ 2016; Belinkov, 2018; Tenney+ 2019)
* more complex structures are represented hierarchically in the higher layers
  (Peters+ 2018b; Blevins+ 2018)
  * Peters+ (2018b): lower layers of a LM encode more local syntax while
    higher layers capture more complex semantics
* contributions
  * analysis that spans the common components of a traditional NLP pipeline
    * the order in which specific abstractions are encoded reflects the
      traditional hierarchy of these tasks
  * how individual sentences are processed by the BERT network, layer-by-layer
    * model can allow individual decisions to depend on each other
      deferring ambiguous decisions or revising incorrect ones based on
      higher-level information

# 2 Model

## 2.1 Edge probing

* We use the code from https://github.com/jsalt18-sentence-repl/jiant
  * Dependencies is the English Web Treebank (Silveira+ 2014),
  * SPR is the SPR1 dataset of (Teichert+ 2017), and
  * relations is SemEval 2010 Task 8 (Hendrickx+ 2009)
  * All other tasks are from OntoNotes 5.0 (Weischedel+ 2013)

# 4 Results 4

### Linguistic Patterns

* consistent trend across both of our metrics
* tasks encoded in a natural progression:
  POS tags processed earliest, followed by constituents, dependencies,
  semantic roles, and coreference
* consistent with initial observations by Peters+ (2018b)
  * constituents are represented earlier than coreference
* syntactic information is more localizable, with weights related to syntactic
  tasks concentrated on a few layers (high K(s) and K(∆))
* information related to semantic tasks is generally spread across the entire
  network. For example, we find that for
  * semantic relations and proto-roles (SPR), the mixing weights are close to
    uniform, and that nontrivial examples for these tasks are resolved gradually
    across nearly all layers
  * entity labeling many examples are resolved in layer 1, but with a long tail
    * only a weak concentration of mixing weights in high layers
* Further study is needed to determine whether this is because
  * BERT has difficulty representing the correct abstraction for these tasks, or
  * semantic information is inherently harder to localize

### Comparison of Metrics. For many tasks, we find that the

* differential scores are highest in the first few layers of the model (layers
  1-7 for BERTlarge), i.e. most examples can be classified very early on
  * We attribute this to the availability of heuristic shortcuts: while
    challenging examples may not be resolved until much later,
    many cases can be guessed from shallow statistics
* mixing weights are concentrated much later, layers 9-20 for BERT-large
  * highest weights are found on or just after the highest layers which give an
    improvement ∆_τ in F1 score for that task
    * particularly when weights are highly concentrated
* explain the observations on the semantic relations and SPR tasks:
  cumulative scoring shows continued improvement up to the highest layers, while
  the lack of concentration in the mixing weights suggest that the BERT encoder
  does not expose a localized set of features that encode these semantic phenoms
  * Similarly for entity types, we see continued improvements in the higher lays
    * perhaps related to fine-grained semantic distinctions like ”Organization”
      (ORG) vs. ”Geopolitical Entity” (GPE) – while the
    * low value for the expected layer reflects that
      many examples require only limited context to resolve

### Comparison of Encoders. We observe the same general ordering on the 12-layer
BERT-base model (Figure A.2)
* “stretching effect”
  * representations concentrate at the same layers relative to the top

## 4.1 Per-Example Analysis

* We explore, qualitatively, how beliefs about the structure of individual
  sentences develop over the layers of the BERT network
* OntoNotes development set contains annotations for five of our probing tasks:
  POS, constituents, entities, SRL, and coreference
  * compile the predictions of the per-layer classifiers for each task
  * we use a heuristic to identify ambiguous sentences to visualize
  * Figure 3 shows two selected examples, and more are presented in Appendix A.2
    1. after resolving the semantic role – determining that “Toronto” is the
      thing getting “smoked” (ARG1) – the entity-typing decision is revised in
      favor of ORG (i.e. the sports team)
    2. the model initially tags “today” as a common noun, date, and temporal
       modifier (ARGM-TMP)
      * later reinterprets “china today” as a proper noun (i.e.  the TV network)
        and updates its beliefs about the entity type (to ORG), followed by the
        semantic role (reinterpreting it as the agent ARG0)

# 5 Conclusion
