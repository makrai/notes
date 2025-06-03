Fernando CN Pereira and Stuart M Shieber
1984
The Semantics of Grammar Formalisms Seen as Computer Languages

Abstract

Using Dana Scott's domain theory, we elucidate [megmagyarázzuk]
the nature of the feature systems used in augmented phrase-structure grammar
formalisms, in particular those of recent versions of GPSG, LFG, and PATRI1

# 1 Instroduction

* we elucidate the nature of the feature systems used in augmented phrase-
  structure grammar formalisms, in particular those of recent versions of
  * generalized phrase structure grammar (GPSG) [5,15],
  * lexical functional grammar (LFG) [2] and
  * PATR-II [ 18,17];
* we find that the mathematical structures developed for this purpose
  contain an operation of feature generalization,
* An abstract analysis [ formalisms ] that are based on
  the simultaneous solution of sets of constraints [9,10]
  * requires a notion of partial information that is
  * precisely captured by the constructs of denotational semantics

# 2. Denotational Semantics

* In broad terms,
  * DS is the study of the connection between programs and
    mathematical entities that represent their input-output relations
* For the purposes of the present work,
  * the semantic domain theory initiated by Scott and Strachey [20]
  * the meanings of programming language constructs are
    * certain partial mappings between objects that represent
      * partially specified data objects or
      * partially defined states of computation
  * the meaning of a construct describes
    * what information it adds to a partial description of a data object

# 3. The Domain of Feature Structures

* feature systems ... are more or less isomorphic to directed graphs
  * or, as they are sometimes described, partial functions
  * what the relation is between these two ways of viewing things
    * will be explained later. In general,
  * are used to encode linguistic information
    * in the form of attribute-vahm pairs
* In domain-theoretic terms, the underlying domain of feature structures F is
  * a recursive domain of partial functions
    * from a set of labels L (features, attribute names, attributes)
    * to
      * complex values or
      * primitive atomic values taken from a set C of constants
  * domain equation
    * F = [L -> F] + C
    * The solution of this domain equation can be understood as
  * a set of trees (finite or infinite} with
    * branches labeled by elements of L, and
    * with other trees or constants as nodes
  * The branches l_1,... l_m from a node n point to
    * the values n(l_1),...  n(l_m)
      * for which the node, as a partial function, is defined

# 4. The Domain of Descriptions

* The inclusion order K in D provides the notion of a description being
  _more or less specific_ than another
* The least-upper-bound operation $\sqsubseteq$
  * combines two descriptions into the least instantiated description that
    satisfies the equations in both descriptions, their unification
* The greatest-lower-bound operation $\sqcup$
  * gives the most instantiated description containing all the equations
    * common to two descriptions, their
  * generalization
* unification operation $\sqcup$ is always defined and
  * returns T? on unification failure
* This description mapping can be shown to be continuous
  * in the sense of domain theory,
    * increasing information in a description leads to nendecreasing
      * information in the described structures {monotonicity) and that
    * if a sequence of descriptions approximates another description, the
      * same condition holds for the described structures
* we can think of elements of
  * D as directed rooted graphs and of elements of
  * F as their unfoldings as trees

# 5.  Providing a Denotation for a Grammar

* TODO

# 7. Conclusion

* We plan to develop the approach further to give accounts of
  negative and disjunctive constraints
