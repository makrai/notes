Omer Levy and Yoav Goldberg
Linguistic Regularities in Sparse and Explicit Word Representations
acl 2014

#Abstract

* searching for a word that maximizes
  a linear combination of three pairwise word similarities
* not restricted to neural word embeddings, and
  * a similar amount of relational similarities can be recovered from
    traditional distributional word representations

#1 Introduction

* relational similarities
  * using vector arithmetic on RNN-embedded vectors
    * Mikolov et al., 2013c Linguistic, Zhila et al., 2013
    * from embeddings trained with different architectures
      (Mikolov et al., 2013a Efficient; Mikolov et al., 2013b Distributed)
* alternative: bag of contexts, explicit
  * literature
  * the explicit vector space representation as a competitive baseline
  * for further work on neural embeddings

#2 Explicit Vector Space Representation

* positive pointwise mutual information
* a window of 2 to each side

#3 Analogies and Vector Arithmetic

#3.2 Vector Arithmetic

* PAIRDIRECTION:
  * alternative to 3COSADD is to require that the 
    direction of transformation be conserved
* Though it was not mentioned in the paper, Mikolov et al. (2013c) used
  * PAIRDIRECTION for solving the semantic analogies of the SemEval task,
  * 3COSADD for solving the syntactic analogies

#4 Empirical Setup

* Underlying Corpus and Preprocessing
  * Wikipedia
  * _..._
* Word Representations
  * min_count=100

#4.1 Evaluation Conditions

* Open Vocabulary
  * azt érti alatta, hogy a keresési tér a teljes szókincs

#5 Preliminary Results

* Why is PAIRDIRECTION performing so well on the SEMEVAL task, yet so poorly on
  the others? Recall that the PairDirection objective 
  * focuses on the similarity of b ∗ − b and a ∗ − a, but 
    does not take into account the spatial distances 
  * problematic when considering the entire vocabulary as candidates
  * We are likely to find candidates b ∗ that 
    * have the same relation to b as reflected by a − a ∗ but 
    * are not necessarily similar to b
    * e.g. man:woman, king:? ... feminine entities, but not necessarily royal
  * SEMEVAL test set [already provides related] candidates

#6 Refining the Objective Function

* linear objectives ... exhibit a “soft-or” behavior and
  * allow one sufficiently large term to dominate the expression
  * multiplicative combination, 3COSMUL

#7 Main Results

#8 Error Analysis

#8.1 Agreement between Representations

* a non-negligible amount of cases in which
  * [the two resentations] complement each other
* Some trends emerge
  * nem csak azt kell nézni, hogy melyik a jobb, hanem százalékot is

#8.3 Default-Behavior Errors

* "Fresno” is returned 82 times
  * as an incorrect answer in the city-in-state relation

#8.4 Verb-inflection Errors

#9 Interpreting Relational Similarities

* úgy lenne érdekes, hogy PPMI helyett olyan hasonlóságot használni, ami nem
  részesíti előnyben a ritka szavakat

#10 Related Work

#11 Discussion

* contrary to the recent findings of Baroni et al. (2014), 
  under certain conditions traditional word similarities induced by explicit
  representations can pergform just as well as neural embeddings
