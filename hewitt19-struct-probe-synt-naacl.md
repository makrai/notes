John Hewitt and Christopher D. Manning
A Structural Probe for Finding Syntax in Word Representations
NAACL 2019

geometry of English parse trees is approximately discoverable in the geometry
of deep models of language

# Abstract

* whether syntax trees are represented in their entirety ...  in a linear
  transformation of a neural network’s word representation space
* linear transformations
  * two
    * squared L2 distance encodes the distance between words in the parse tree,
    * squared L2 norm encodes depth in the parse tree
  * such transformations exist for both ELMo and BERT but not in baselines,

# 1 Introduction

* probing methods are designed to evaluate the extent to which [pretrained deep
  LMs i.e. contextualized word reprs] encode particular knowledge of interest,
  * part-of-speech (Belinkov+ 2017),
  * morphology (Peters+ 2018a), or
  * sentence length (Adi+ 2017)
* Such methods work by specifying a probe (Conneau+ 2018; Hupkes+ 2018),
  * a supervised model for finding information in a representation
* whether deep models’ representations encode syntax (Linzen, 2018)
  * recent work (Kuncoro+ 2018; Peters+ 2018b; Tenney+ 2019),
  * [we:] whether deep contextual models encode entire parse trees
