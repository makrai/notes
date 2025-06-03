Dimitri Kartsaklis, Mehrnoosh Sadrzadeh
A Study of Entanglement in a Categorical Framework of Natural Language
QPL 2014, arXiv:1412.8102

# Datasets

* Grefenstette and Sadrzadeh
  Compositional Distributional Model Evaluation Dataset, EMNLP 2011
* Grefenstette and Sadrzadeh
  Compositional Distributional Model Evaluation Dataset,
  adjective-noun based transitive sentences, 2012
* Disambiguation Dataset used in Kartsaklis+ CoNLL 2013
  This previously unpublished dataset was
  produced by Edward Grefenstette and Mehrnoosh Sadrzadeh
* Kartsaklis and Sadrzadeh
  transitive sentence similarity dataset, EMNP 2013
  * extends the verb-object part of the Mitchell and Lapata (2010) dataset by
    the introduction of appropriate subject nouns
  * original human judgements from the M&L 2010 dataset
* Kartsaklis and Sadrzadeh
  transitive sentence similarity dataset, QPL 2014
  * the same dataset as the one used in the EMNLP 2013 paper, but with
    re-evaluated human scores collected from Amazon Turk

http://www.cs.ox.ac.uk/activities/compdistmeaning/

# Abstract

* a number of proposals for verb construction lead to almost separable tensors,
  * considerably simplifies the interactions between the words
  * the use of Frobenius algebras mitigates the potential problems
* we briefly examine a machine learning method that creates verb tensors
  exhibiting a sufficient level of entanglement

# 1 Intro

* Abramsky and Coecke [1]
  * provide a structural proof for a class of quantum protocols,
  * essentially recasting the vector space semantics of quantum mechanics
  * compact closed categories applicable to corpus linguistics. Here,
  * Coecke+ [4] unify two seemingly orthogonal semantic models of nat lang
    * a syntax-driven compositional approach as expressed by Lambek [15] and
    * distributional models of meaning based on vector spaces.  The latter
      * do not scale up to larger text constituents such as phrases and sents
* unification based on the fact that both a type logic expressed as a
  pregroup [15] and finite dimensional vector spaces share a compact closed
  structure; so in principle there exists a way to express a grammatical
  derivation as a morphism that defines mathematical manipulations between
  vector spaces, resulting in a sentence vector
  * In [4], the solution was based on a Cartesian product between the pregroup
    category and the category of finite dimensional vector spaces; later this
  * recasted in a functorial passage from the former to the latter [19, 3, 10]
* words with relational types, such as adjectives or verbs, live in tensor
  product spaces of higher order
  * These tensors act on their arguments by tensor contraction, a
    generalization of matrix multiplication
* tensor should be entangled to allow for a so called ‘flow of information’
  (a terminology borrowed from categorical quantum mechanics [1]) among the
  meanings of words in a phrase or sentence. Otherwise, parts of the meaning of
  these words become isolated from the rest, leading to unwanted consequences
* [still] in some [language tasks,]  non-entangled tensors [were] good
  * Grefenstette and Sadrzadeh [8] provide results for verbs that are built
    from the outer product of their context vectors
* We work with a number of concrete instantiations of the framework
  in sentence similarity tasks and observe their performances experimentally
* models
  * weighted relations method of [7], where a verb matrix is computed as the
    structural mixing of all subject/object pairs with which it appears
    * [in the first case,] results are very close to their rank-1 approx,
      that is, they are in effect separable
  * linear regression [2]
    * the level of entanglement is much higher in the verbs of this model
  * Frobenius variations of the weighted relation models,
    such as the ones presented in [13] and a few new constructions
    * Frobenius models are able to overcome the unwanted “no-flow” collapses of
    * a partial flow between the verb and either its subject or its object,
      depending which dimension they are copying

# 7 Experiments

# 7.1 Creating a semantic space

* ukWaC corpus [5], originally using as a basis the
* 2,000 content words with the highest frequency ([minus] stop words)
* 5-word window from either side of the target word, whereas
* for weighting scheme we used local mutual information
  (i.e.  point-wise mutual information multiplied by raw counts). The
* vector space was normalized and projected onto a 300-dimensional space using

## 7.2 Detecting sentence similarity

* two similarity tasks involving pairs of transitive sentences; for each pair,
  we construct composite vectors for the two sentences
* In the first task [7], the same subject and object and sem correlated verbs,
  e.g. ‘pupils write/spell letters’
  * 200 sentence pairs
  * Using cosine distance, all three models (relational, rank-1 approximation,
    separable model) have essentially the same behaviour;
    with Euclidean distance, the relational model performs again the same as
    its rank-1 approximation, while this time the separable model is lower
* second sentence similarity task. Here, we use
  * a variation of one of the datasets in [12], consisting of
  * 108 pairs of transitive sentences. The difference with our first task is
  * sentences of a pair are unrelated in a word level

# 10 Conclusion 12
