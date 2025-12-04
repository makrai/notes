Hopf algebras and their applications in linguistics
Blanka Kövér
Eötvös Loránd University, Faculty of Science, Diploma thesis, Mathematics BSc
  Supervisors: Gergely Zábrádi, András Kornai, Budapest, 2024

# Preface

* Hopf algebras are versatile algebraic structures
  * first arose in the work of Heinz Hopf in the context of algebraic topology
  in the 1940s. Since then, they have 
* appeared naturally and proven useful in several further areas of mathematics,
  * group theory and combinatorics. Starting with the 
* 1990s+: applications in theoretical physics as well, becoming a central tool
  * perturbative quantum field theory. The latest (and perhaps most surprising)
* a [7, 5, 6] (2023) proposed a potential application in generative syntax
  * mathematical physicist M. Marcolli and linguists R. Berwick and N. Chomsky
  * Hopf algebras may constitute a suitable framework
    for the description of certain transformations of sentences. The aim of this
* we provide a concise introduction to Hopf algebras and to
  briefly present their use in linguistics

# 1 Hopf algebras in mathematics

## 1.1 Preliminaries 4

### Tensor products 4

### Algebras 7

### Lie algebras 12

## 1.2 Elementary coalgebra theory 13

## 1.3 Hopf algebras 18

# 2 Hopf algebras in linguistics 25

## 2.1 Motivation and linguistic background 25

* In order to be able to describe movement, it is clear that
  we need a mathematical structure capable of representing such transformations,
  ie allowing the repositioning of subtrees within some (linguistically
  motivated) constraints. In recent papers , 
* Marcolli, Chomsky, and Berwick [7, 5] propose that Hopf algebras provide a
  * the coproduct will allow us to cut up our tree and extract the corresponding
    subtree in order to insert it into another spot in the tree.

## 2.2 Mathematical formulation 29

* starting out with the individual words,
  combining (merging) them via simple binary set formation, then
  repeatedly combining the resulting objects until we arrive at the whole sent.
* we denote the commutative, nonassociative operation that is binary set
  formation by M.
* The free nonassociative commutative magma on a set S is canonically isomorphic
  to the set T S of abstract binary rooted trees with leaves decorated by
  elements of S.
* _abstract_: there is no planar embedding assigned to the trees, namely, that
  the leaves are not ordered. This is at first sight counterintuitive, since we
  usually perceive language linearly, as a sequence of strings or words.
  However, it proves useful to assume a nonplanar deep structure in the
  background, and regard the apparent (ordered) surface-level structure only as
  a projection of the true deep structure. Notice that the commutativity of M
  guarantees precisely that the leaves are not fully ordered.
* admissible cut
* The Merge operation as defined above in fact
  allows more types of transformations than linguistically motivated, cases that
  violate the aforementioned principle that movement is only possible upwards in
  a tree.
  Hence a slight modification, a mechanism called Minimal Search is needed to
  eliminate unwanted types of Merge. Furthermore, we have only been able to
  summarize the very basics of how Hopf algebras can be used in the study of
  syntax
* nL Marcolli, Chomsky, and Berwick [6] also
  extend this Hopf algebraic formulation to the interaction of syntax and
  semantics. To grasp the full picture of Hopf algebras in linguistics, a
  thorough read of all three papers [7, 5, 6] would be necessary.
