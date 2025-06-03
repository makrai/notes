A Systematic Analysis of Morphological Content in BERT Models for Multiple Languages
Daniel Edmiston
arXiv:2004.03032 [cs.CL]

* This work: probe the hidden repr of several BERT-style models for
  * the extent to which discrete linguistic structure, in the form of
    morphological features and feature values, presents itself
  * in the vector representations and attention distributions of pre-trained LMs
  * five European languages, each somewhat different typologically, we hope to
* The experiments
* Transformer architectures largely partition their embedding space into
  convex sub-regions highly correlated with morphological feature value,
  * as feature values are largely recoverable by a linear classifier
* the contextualized nature of transformer embeddings allows models to
  distinguish ambiguous morphological forms in many, but not all cases, and
* very specific attention head/layer combinations appear to hone in on
  subject-verb agreement
  * consistent with: different head-layer combinations specialize for
    different types of linguistic information (Clark+ 2019)
  * from discussion section:
    * this information is best reflected in the early-mid layers

# 1 Introduction

* two types of experiment. For the first type, we perform
  1. a series of classification tasks on hidden-layer vector representations,
     attempting to predict the morphological feature values of contextualized
     representations.  The second type of experiment consists of a task which
  2. probes self-attention distributions for morph agreement
     * comparing the proportions of a sentence’s attention distributions
       allocated to words which agree for some morphological feature value
* analysis at the level of morphological feature is particularly useful for
  evaluating linguistic information within embeddings for three reasons. First,
  1. it is relatively simple to obtain large amounts of quality gold-standard
     annotation in many languages
  2. less susceptible to models using heuristics to learn surface patterns
     (McCoy+ 2019), testing instead whether they’ve generalized
  3. certain morphological features are important for real-world tasks
    * e.g. gender feature is inextricably linked to coreference resolution in
    * mood contains discourse information which is necessary for NLU,
      e.g. commands (imperative mood) vs statements (indicative mood)
* contributions of this paper are therefore the following: we show that
  * BERT-style architectures are capable of encoding morphological information
    in their hidden vector representations at the featural level, and do so by
    dividing the embedding space into convex (i.e. linearly separable)
    sub-regions,
  * that the contextualized nature of embeddings aids models’ ability to
    disambiguate morphologically ambiguous forms, but doesn’t solve the problem,
  * by introducing a score based on Pearson’s χ^2 test for investigating
    attention distributions, we show that localized regions in the
    layer/attention-head space reflect subject-verb agreement
* from the conclusion
  * certain attention heads learn to focus attention in a manner consistent with
    morphological agreement
  * morphological information may be best represented in the middle layers of

## 3.3 Data Sets

* All data used for the experiments were collected from a collection of
  Universal Dependency (UD) Treebanks (Nivre+ 2016) and UD-compatible lexicons
  (Sagot, 2018)
* important aspects of morphology in Indo-European languages are
  * the number of values a feature can take
  * syncretism (Baerman+ 2005): how likely the forms are to be ambiguous

# 5 Discussion

* classification by layer
  * relatively uncorrelated with performance for English, French, and Spanish
    * We speculate: due to their simple morphological paradigms (relative)
      * morphological values more predictable from orthography, and
      * more fixed word-order syntax potentially making morphological
        information more recoverable from later layers
  * One would expect morphological to reside mostly in the middle-to-late layers
  * German and Russian show that each language in fact shows
    * peak performance in the middle layers for overall performance (Figure 1),
    * middle-to-late layers to disambiguate syncretic forms (Figure 2).  This
    * in line with the findings of Peters+ (2018b) and Tenney+ (2019)

# 6 conclusion and future work

* future work should include
  * identifying morphological information in BERT-style models in an unsup fash
  * improving models’ ability to disambiguate syncretic forms for languages
    with complex inflectional morphology, and
  * further exploration of how morphological information is shared between words
    via self-attention
