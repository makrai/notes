Ryan Cotterell and Hinrich Schütze
Morphological Word-Embeddings
NAACL 2015

# Abstract

* Linguistic similarity is multi-faceted: semantics, syntax, or morphology
* This work considers guiding word-embeddings with morphological annotation
  * extend the log-bilinear model to this end
* German as a case study

# 1 Intro

* We augment the log-bilinear model (LBL) of Mnih and Hinton (2007)
  with a multi-task objective
  * In addition to raw text, our model is trained on a morphological tags
* task is
  1. language modeling— the traditional use of the LBL—and the second is
  2. akin to unigram morphological tagging
* We extend the [LBL] model to jointly predict the next morphological tag along
  with the next word, encouraging the resulting embeddings to encode [both]
  * present a novel metric and experiments on German as a case study

# 2 Related Work

* no previous [supervised work] to incorporate morphological tags into embeds
* there has been recent work on incorporating ... segmentations

## 2.1 Morphology in Language Modeling

* Morphological structure ... integrated into LMs. Most notably,
  * Bilmes and Kirchhoff (2003) introduced factored LMs, which effectively
    add tiers, allowing easy incorporation of morphological structure + POS
  * Müller and Schütze (2011) trained a class-based LM using common suffixes—
    * interpolated with a KneserNey LM. In
* Luong+ (2013) described a recursive neural network LM, whose
  * topology was derived from the output of Morfessor (Creutz and Lagus, 2005)
* Qiu+ (2014) augmented word2vec (Mikolov+ 2013) to embed morphs
* dos Santos and Zadrozny (2014) with a convolutional neural network with a
  k-best max-pooling layer to extract character level n-grams, efficiently
  inserting orthographic features into the LM—use of the vectors in down-stream
  POS tagging achieved state-of-the-art results in Portuguese. Finally, most
* Botha and Blunsom (2014) introduced the additive logbilinear model (LBL++)
  * a neural factored LM
  * separate embeddings for each constituent morpheme of a word, summing them

## 2.2 Computational Morphology

* much of the information needed to determine a word’s morphological tag is
  encoded in the word itself. For example, the suffix ed is generally
  * distributional similarity has also been shown to be an important cue
    (Yarowsky and Wicentowski, 2000; Schone and Jurafsky, 2001)
* our model : isolation of the components of the contextual signature that are
  indeed predictive of morphology

# 5 Evaluation

* is [it] true that words similar in the embedding space are morph related? yes

## 5.1 MorphoDist

* We introduce a new evaluation metric for morphologically-driven embeddings
  * are words that are similar in the embedded space also morph related?
* let `M_w` be the [bit vector] of morphological tags associated with w
  * This is a set because words may have several morphological parses
`sum_{w' near in embed} min_{w near in Hamming}`
* Metrics similar ... have been applied in the speech recognition community
  * Levin+ (2013) had a similar motivation for their evaluation of fixed-length
    acoustic embeddings that preserve linguistic similarity

# 6 Experiments and Results

## 6.1 Experiment 1: Morphological Content

* We first investigated whether the embeddings learned by Morph-LBL do indeed
  encode morphological information
* For each word, we selected the most frequently occurring morphological tag
* labeling a word-embedding with its most frequent morphological tag
  as a multiway classification problem. We trained a
  * k nearest neighbors classifier where k was optimized on development data

## 6.2 Experiment 2: MorphoDist

* We also evaluated the three types of embeddings
  using the MorphoDist metric introduced in section 5.1

## 6.3 Discussion

* superior performance of Morph-LBL over both the original LBL and word2vec
  under both evaluation metrics
  not surprising as we provide our model with annotated data at training time
  That the LBL outperforms word2vec is also not surprising. The
  * LBL looks at a local history thus making it more amenable to learning
    syntactically-aware embeddings than word2vec, whose
    skip-grams often look at non-local context
* is of interest ... Morph-LBL’s ability to robustly maintain morphological
  relationships only making use of the distributional signature, without
  word-internal features

# 7 Conclusion and Future Work

* We [introduced] Morph-LBL, for the semi-supervised induction of
  morphologically guided embeddings
  * combination of morphologically annotated data with raw text allows us to
  * contextual signatures + orthographic features are [both] requisite for a
    strong model. Consider the words loving and eating. Both are likely to
* Future work will handle such
  * integration of character-level features.  We are interested in the
  * application ... to morphological tagging and other tasks.  Word-embeddings
