Modeling and Learning Semantic Co-Compositionality
  through Prototype Projections and Neural Networks
Masashi Tsubaki, Kevin Duh, Masashi Shimbo, Yuji Matsumoto
EMNLP 2013

#Abstract

* Inspired by Generative Lexicon Theory (Pustejovsky, 1995)
* our goal is a [co-]compositional model
  * addresses [the polysemy issue of] current vector space models, notably
* We
  * implement cocompositionality using prototype projections on preds/args and
  * neural network
    unsupervised algorithm to jointly train word representations with co-compos
  * best result to date (ρ = 0.47) on the semantic similarity task of
    transitive verbs (Grefenstette and Sadrzadeh, 2011)

#1 Introduction

* compositionality (Frege, 1892) in vector space
  (Mitchell and Lapata, 2008; Mitchell and Lapata, 2010; Baroni and Zamparelli,
  2010; Socher+ 2012; Grefenstette and Sadrzadeh, 2011; Van de Cruys+ 2013)
* The main questions for semantic compositionality that we are concerned with
  1. how can polysemy be handled by a single vector representation per word
  2. how does composition resolve these ambiguities
* inspired by the idea of type coercion and co-compositionality
  in Generative Lexicon Theory (Pustejovsky, 1995)
* Co-compositionality advocates that instead of a predicate-argument view of
  e.g. polysemous word run: _He runs the company./He runs the marathon._
  * verbs that select for company differ from those that select for marathon,
  * predicate also coerces meaning to the argument to fit expectation
* We [propose a model that incorporates] elements of co-compositionality
  * what we call prototype projections. For each predicate, we transform its
    vector representation by projecting it into a latent space that is
    prototypical of its argument. This projection is performed analogously for
    each argument as well, and the final meaning is computed by composition of
    these transformed vectors
  * cast as a neural network where word representations could be re-trained or
    fine-tuned
  * not implement qualia structure and other important components of GL
* Our contributions are two-fold:
  1. We propose a novel model for semantic cocompositionality
     * easy to implement and achieves SOTA performance in the sentence
       similarity dataset developed by Grefenstette and Sadrzadeh (2011)
  2. Our results empirically confirm that existing word representations (eg.,
     SDS and NLM in Section 2) are sufficiently effective at capturing
     polysemy

#2 background to the word representations employed here (Section 2)

#3 the model for co-compositionality in Section 3 and

#4 the corresponding neural network in Section 4.

#5 Evaluation

#6 experiments

#7 related work

#8 conclusions
