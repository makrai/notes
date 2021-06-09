Compositional Morphology for Word Representations and Language Modelling
Jan A. Botha and Phil Blunsom
2014

# Abstract

* evaluated in the context of log-bilinear language models, rendered suitably
* efficient for implementation inside a MT decoder by
  factoring the vocabulary
* intrinsic and extrinsic evaluations, ... on a range of languages
  * word similarity tasks and ... perplexity
  * used for translation into morphologically rich languages
* compositional vector-space modelling has recently been applied to
  morphology to good effect (Lazaridou+ 2013; Luong+ 2013), but
  lacked the probabilistic basis necessary for use with a MT decoder

# 1 Intro

* trans into 6 languages, including the morphologically complex Czech, German
  and Russian

# 2 Additive

* languages types
  * more fusional languages (e.g. Czech, Russian) to
  * more agglutinative languages (e.g. Turkish)
* Unlike the recursive neural-network method of Luong+ (2013),
  we do not impose a single tree structure over a word, which would ignore the
  ambiguity inherent in words like `un[[lock]able]` vs. `[un[lock]]able`. In

# 4 Experiments

## 4.1 Data & Methods

### Word Factorisation μ.

* We obtain labelled morphological segmentations from ... Morfessor Cat-MAP
  (Creutz & Lagus, 2007). The mapping μ of a word is taken as its surface form
  and the morphemes identified by Morfessor.  Keeping the morpheme labels
  allows the model to learn separate vectors for, say, in stem the preposition
  and in prefix occurring as in·appropriate. By not post-processing
  segmentations in a more sophisticated way, we keep the overall method more
  language independent.

## 4.2 Intrinsic Language Model Evaluation

* Analysis. Model perplexity on a whole dataset is a convenient summary of
  its intrinsic performance, but such a global view does not give much insight
  into how one model outperforms another. We now partition the test data into
  subsets of interest and measure PPL over these subsets
  * freq
  * nouns and adjectives (Figure 4), suggesting our segmentation-based
    representations help abstract over German’s productive compounding

# 5 Related work

* phrase similarity ratings based on bilingual word embeddings
  as a translation model feature (Zou+ 2013)
* formulating translation purely in terms of continuous-space models
  (Kalchbrenner & Blunsom, 2013)
* Accounting for linguistically derived information such as
  * morphology (Luong+ 2013; Lazaridou+ 2013) or
  * syntax (Hermann & Blunsom, 2013) CCG
  * Our contribution is to create morphological awareness in a _probabilistic_
    language model
