A Massively Multilingual Analysis of Cross-linguality in Shared Embedding Space
Alex Jones, William Yang Wang, Kyle Mahowald
EMNLP 2021 arXiv:2109.06324 [cs.CL]

data and code for our experiments publicly available

# Abstract

* cross-lingual LMs, reprs for many different languages in the same space
* we investigate the linguistic and non-linguistic factors affecting
  sentence-level alignment in cross-lingual pretrained language models for 101
  languages and 5,050 language pairs. Using 
  * BERT-based LaBSE and BiLSTM-based LASER as our models, and 
  * the Bible as our corpus, we compute a 
  * measures
    * task-based measure of cross-lingual alignment in the form of 
      bitext retrieval performance, as well as 
    * four intrinsic measures of vector space alignment and isomorphism. 
* We then examine a range of linguistic, quasi-linguistic, and training-related
  features as potential predictors of these alignment metrics.  The results of
  * word order agreement and agreement in morphological complexity are two of
    the strongest linguistic predictors of cross-linguality.  We also note
    * (similarly to Pires+ 2019) 
  * in-family training data as a stronger predictor than language-specific
    training data across the board. 
  * moderate effects of other typological measures on crosslinguality. In the
* We verify some of our linguistic findings by looking at the effect of
  morphological segmentation on English-Inuktitut alignment, in addition to
  examining the effect of word order agreement on isomorphism for 66 zero-shot
  language pairs from a different corpus. We make the 

# 6 Analysis 5

## 6.1 Simple Correlations

### (Quasi)-linguistic Features Among the predic-

## 6.2 Feature Search and Ablation

### Exhaustive Feature Selection. We look at the optimal set of lang-pair-spec

### Single-step Regression. To appraise the marginal contribution of each feature

## 6.3 Controlling for Training Data

# 7 Zero-shot Cases

# 8 Case Study 1: Morphological Segmentation of Inuktitut

# 9 Case Study 2: Word Order & Isomorphism

# 12 Ethical Considerations

* low-resource, Indigenous, and endangered. Previous works have looked at the
  * challenges facing these sorts of langs (Mager+ 2018; Joshi+ 2020) 
  * broad solutions and guidelines (e.g. Kann+ 2019; Bender 2019).  
* The Bible corpus (Christodouloupoulos and Steedman, 2014) that we use in our
  * includes 35 and 45 languages that are zero-shot for LaBSE and LASER resp
    * all of which could be classified as low-resource or extremely low-resource
  * owes its existence largely to a settler colonial tradition
    * missionaries translated the Bible into Indigenous languages
      often without crediting the Indigenous peoples who contributed 
    * We acknowledge these Indigenous peoples’ contributions to this work 
* energy consumption, cost, and environmental impact of NLP models
  * Strubell+ (2019) and Schwartz+ (2019) identified, analyzed, and proposed sol
