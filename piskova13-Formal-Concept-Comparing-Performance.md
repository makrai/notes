Lenka Pisková, Tomáš Horváth
Comparing Performance of
  Formal Concept Analysis and Closed Frequent Itemset Mining Algorithms
  on Real Data
2013

# Abstract

* an experimental comparison of publicly available algorithms for computing
  intents [intenzió] of all formal concepts and mining frequent closed itemsets
* Experiments are performed on real data sets from
  UCI Machine Learning Repository and FIMI Repository

# Intro

* Frequent itemset mining (FIM) introduced in (Agrawal+, 1993) was proposed as
  a method for market basket analysis
  * closed and maximal frequent itemsets were proposed
* FCA and FIM are ... are closely related to each other (Martin+ 2008)..
  * Iceberg concept lattice
    * the set of all frequent concepts connected with the
      subconcept-superconcept relation [23]
  * Finding the set of all intents (of formal concepts) is equivalent to
    finding the set of all closed frequent itemsets using a minimum support
    equal to zero [20]

# 2 Compared Algorithms

* algorithms [for] generating formal concepts and/or a concept lattice
  * Ganter: Two basic algorithms in concept analysis. TH Darmstadt, 1984.
  * Kuznetsov: A Fast Algorithm for Computing All Intersections of Objects in a
    Finite Semi-lattice.  Automatic Documentation and Math Ling 1993.
  * Lindig: Fast Concept Analysis. Working with Conceptual Structures
    (ICCS 2000)
  * Norris: An Algorithm for Computing the Maximal Rectangles in a Binary
    Relation.  Revue Roumaine de Mathématiques Pures et Appliquées, 1978.
  * L. Nourine, O. Raynaud: A fast algorithm for building lattices IPL 1999
    many have been proposed [8], [15], [17], [21], [22]. A
  * comparative performance study of algorithms
    * Godin, R. Missaoui, H. Alaoui: Incremental concept formation algorithms
      based on Galois (concept) lattice. Computational Intelligence 1995.
    * Kuznetsov, S. A. Obiedkov: Comparing Performance of Algorithms for Gen-
      erating Concept Lattices. Journal of Experimental and Theoretical AI 2002
* In this paper we will focus only on those algorithms which compute the set of
  all formal concepts (frequent closed itemsets) only
* fastest algorithms for computing formal concepts are
  * FCbO
    * Krajca+ Advances in algorithms based on CbO.  CLA 2010.and
  * In-Close
    * Andrews: In-Close, a fast algorithm for computing formal concepts 2009.
  * based on the CbO algorithm [15].
  * In the competition between FCA algorithms at ICCS 2009 1 FCbO took the
    first place and the runner-up was In-Close.  The improvement of In-Close
    algorithm [3] was developed in response to the competition to outperform
    FCbO, but our results show that FCbO still performs better. A
  * parallel variant of FCbO was also proposed [14], however, we consider only the
    serial version in this paper.
* Implementations of algorithms for mining closed frequent itemsets were ex-
  perimentally compared 2 and presented at FIMI’03 and FIMI’04 workshops [12].
  The best of the tested algorithms ([5], [13], [18], [19], [24], [26]) was
  FP-Close [13] although it gave a segmentation fault for 4 out of 14 data
  sets.

# 3 Experimental Evaluation

* The input file
  * of In-Close2 is in the cxt (formal context) format while the input
  * of other algorithms is in the standard FIMI format -
    * each line represents a list of attributes of an object
* In-Close2 [unlike other algorithms] also computes extents of formal concepts
  (in addition to their intents).
