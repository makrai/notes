A Massively Multilingual Analysis of Cross-linguality in Shared Embedding Space
Alex Jones, William Yang Wang, Kyle Mahowald
EMNLP 2021 arXiv:2109.06324 [cs.CL]

data and code for our experiments publicly available

# Abstract

* cross-lingual LMs, reprs for many different languages in the same space
* we investigate the linguistic and non-linguistic factors affecting
  sentence-level alignment in cross-lingual pretrained LMs for 101 languages
  and 5,050 language pairs
  * BERT-based LaBSE and BiLSTM-based LASER as our models, and
  * the Bible as our corpus
  * measures
    * task-based measure of cross-lingual alignment in the form of
      bitext retrieval performance, as well as
    * four intrinsic measures of vector space alignment and isomorphism
* We then examine a range of linguistic, quasi-linguistic, and training-related
  features as potential predictors of these alignment metrics
  * word order agreement and agreement in morphological complexity are two of
    the strongest linguistic predictors of cross-linguality
    * similarly to Pires+ (2019)
  * in-family training data as a stronger predictor than language-specific
    training data across the board
  * moderate effects of other typological measures on crosslinguality
* We verify some of our linguistic findings by looking at the effect of
  * morphological segmentation on English-Inuktitut alignment
  * word order agreement on isomorphism for 66 zero-shot language pairs from a
    different corpus

# 6 Analysis 5

## 6.1 Simple Correlations

### (Quasi)-linguistic Features

## 6.2 Feature Search and Ablation

### Exhaustive Feature Selection

### Single-step Regression. To appraise the marginal contribution of each feat

## 6.3 Controlling for Training Data

# 7 Zero-shot Cases

# 8 Case Study 1: Morphological Segmentation of Inuktitut

# 9 Case Study 2: Word Order & Isomorphism

# 12 Ethical Considerations

* low-resource, Indigenous, and endangered
  * challenges facing these sorts of langs (Mager+ 2018; Joshi+ 2020)
  * broad solutions and guidelines (e.g. Kann+ 2019; Bender 2019)
* The Bible corpus (Christodouloupoulos and Steedman, 2014)
  * includes 35 and 45 languages that are zero-shot for LaBSE and LASER resp
    * all of which could be classified as low-resource or extremely low-resourc
  * owes its existence largely to a settler colonial tradition
    * missionaries translated the Bible into Indigenous languages
      often without crediting the Indigenous peoples who contributed
    * We acknowledge these Indigenous peoples’ contributions to this work
* energy consumption, cost, and environmental impact of NLP models
  * Strubell+ (2019) and Schwartz+ (2019) identified, analyzed, & proposed solu
