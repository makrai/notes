Radu Soricut, Franz Och
Unsupervised morphology induction using word embeddings
NAACL 2015

# Abstract

* unsupervised method for inducing morphological transformations between words
* relies on certain regularities manifest in high-dimensional vector spaces
  * as the ones trained using the Skip-Gram model (Mikolov+ 2013a)
* discovering a wide range of morphological rules,
  which in turn are used to build morphological analyzers
* evaluate this method across six different languages and nine datasets, and
  * significant improvements across all languages
  * improve on current SOTA for the morphologically-rich Stanford Rare-words

# 1 Intro

* Word representations [from] neural networks (Bengio+ 2003; Socher+ 2011a) or
  specialized models (Mikolov+ 2013a)
* used [in] various NLP tasks
  (Mnih+ 2009 LM; Huang+ 2014 weakly supervised; Bansal+ 2014 dependency)
* capture various syntactic and semantic properties (Mikolov+ 2013b). In many
* [supervised] approaches that combine morphology with word vectors
  (Luong+ 2013; Botha and Blunsom, 2014),
  * we do not rely on an external morphological analyzer
* our method is [based on] the Skip-Gram model described in (Mikolov+ 2013a)
* observations made by Mikolov+ (2013b), and
  further studied by (Levy and Goldberg, 2014; Pennington+ 2014)
* we exploit these regularities to
  model, in a principled way, prefix~ and suffix-based morphology
* contributions of this paper are as follows:
1. a method by which morphological rules are learned ... unsupervised
2. a mechanism for applying these rules to
  * known words (e.g., boldly is analyzed as bold+ly, while only is not);
  * rare and unseen words;
* eval on ...  word-similarity rating task using standard datasets
* [our technique induces] both
  * regular morphological rules, such as adding suffix ed sto verbs in English,
  * exceptions e.g. pluralization of words that end in y
* [sem of trafos] Because they are represented in the embedding space
  * it allows us to build vector representations for any unseen word
    for which a morphological analysis is found
* languages: English, German, French, Spanish, Romanian, Arabic, and Uzbek

# 2 Previous Work

* word-representations [for] sentence-level tasks such as
  * language modeling (Mnih and Hinton, 2007; Mikolov and Zweig, 2012)
  * paraphrase detection (Socher+ 2011a)
  * sentiment analysis (Socher+ 2011b)
  * discriminative parsing (Collobert, 2011)
  * larger units such as documents (Glorot+ 11; Huang+ 12; Le and Mikolov, 14)
* sub-word units and their compositionality have looked at explicitly engineered
  * [supervised] models such as factored NLMs (Alexandrescu & Kirchhoff, 2006)
  * compositional distributional semantic models (Lazaridou+ 2013) to derive
  * recursive neural networks in the work of Luong+ (2013),
  * log-bilinear models in the case of Botha and Blunsom (2014)), is used to
* this paper uses the same vector-space embedding to achieve both the
  morphological analysis of words and to compute their representation. As a
  * morphological analysis can be justified in terms of the relationship
    between the resulting representation and other words that exhibit similar
    morphological properties

# 3 Morphology Induction using Embedding Spaces 2

## 3.1 Morphological Transformations

* two main transformation types, namely prefix and suffix substitutions. Other
* The following steps are applied to monolingual training data [with] vocab V
  1. Extract candidate prefix/suffix rules from V
  2. Train embedding space, Evaluate quality of candidate rules
  4. Generate lexicalized morphological transformations

### Evaluate quality of candidate rules

* We use as `F_E` function rank E , the cosine-similarity rank function in E n . We

### Generate lexicalized morphological transformations

* e.g. rule suffix:ly: we want to avoid applying them for e.g. _only, on_
* compute best direction vectors ↑d w for each rule support set S r . It
* We consider multiple direction vectors [for] ambiguity, e.g. -s noun, verb
* graph-based interpretation [of] Lexicalized morphological transformations
  * words represent nodes, transformations represent dir edges in a
  * weights are ...  rank and cosine values
  * cycles may exist, see
* strongly connected components ... representing families of morph variations
* canonical surface form ... a more frequent form
  * not “traditional” morphological mappings,
    with morphology-inflected words mapped to their linguistic roots. Rather,
  * to favor the accuracy of the word-representations for the normal forms;
  * different normalization procedures e.g. length: more linguistically motived

## 3.3 Morphological Transformations for Rare and Unknown Words

* e.g. unassertiveness → assertive

# 4 Empirical Results 7

* How does the impact of morphology analysis change with training data size?

## 4.1 Quality of Morphological Analysis [in] word-similarity

### Data

* test sets, we use standard, publicly-available word-similarity datasets
* Most relevant ... is the Stanford English Rare-Word dataset (Luong+ 2013),
* We also use for English the WS353 (Finkelstein+ 2002) and RG65 datasets
  (Rubenstein and Goodenough, 1965).  For
* German, we use the Gur350 and ZG222 datasets (Zesch and Gurevych, 2006).  For
* French we use the RG65 French version (Joubarne and Inkpen, 2011); for
* Spanish, Romanian, and Arabic we use their respective versions of WS353
  (Hassan and Mihalcea, 2009)

### Results

We present in Table 4 the results obtained across
* 6 language pairs and 9 datasets, using a
* count threshold for SG+Morph of C = 100. We also include the results obtained

## 4.2 Quality of Morphological Analysis for Unknown/Rare Words

* T1-words should be morphologically an- alyzed, while
  T2-words should not; a method that over-analyses has poor performance on T2,

## 4.3 Morphology and Training Data Size

# 5 Conclusions and Future Work

* word-compounds in German ... require a more focused approach for solving
