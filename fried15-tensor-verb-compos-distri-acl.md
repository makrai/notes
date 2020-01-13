Daniel Fried, Tamara Polajnar, and Stephen Clark
Low-Rank Tensors for Verbs in Compositional Distributional Semantics
ACL 2015

# Abstract

* We investigate the effect of low-rank tensors on the transitive verb
  construction where the verb is a third-order tensor
* low-rank tensors require about two orders of magnitude fewer parameters per
  verb, they achieve performance comparable to, and occasionally surpassing,
* on sentence similarity and verb disambiguation tasks

# 1 Introduction

* compositional distributional semantics (CDS):
  * combining the distributional representations for words, often [syntax-driv]
  * Mitchell and Lapata, 2008; Baroni and Zamparelli, 2010; Socher+ 2012;
    Zanzotto and Dell’Arciprete, 2012).  One method for CDS is the
  * Categorial framework (Coecke+ 2011; Baroni+ 2014),
  * each word is represented by a tensor whose order is ... the CG type
    For example, nouns are an atomic type represented by a vector, and
    adjectives are matrices that act as functions (Baroni and Zamparelli, 2010)
    A transitive verb is a third-order tensor (Polajnar+ 2014)
  * However, ... parameters can be quite numerous for even low-dimensional
* We aim to reduce the size of the models by demonstrating that
  reduced-rank tensors [capture the semantics of complex types] well
* experiments on the transitive verb construction for which there are
  established tasks and datasets
  (Grefenstette and Sadrzadeh, 2011; Kartsaklis and Sadrzadeh, 2014)
* Although we focus on the Categorial framework, the low-rank decomposition
  methods are also applicable to other tensor-based semantic models including
  * Van de Cruys (2010)
  * Smolensky and Legendre (2006)
  * Blacoe+ (2013)
    William Blacoe, Elham Kashefi, and Mirella Lapata
    A quantum-theoretic approach to distributional semantics
    NAACL 2013
