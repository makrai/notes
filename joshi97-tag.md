Joshi1 and Yves Schabes (1997)
Tree-Adjoining Grammars

# Introduction

* derivation `trees' for the object language trees
* mildly context-sensitive
* making constraints strictly local

# Tree Adjoining Grammars

* CF `\subsetneq` TAG `\subsetneq` indexed languages `\subsetneq` CS

## Definition

* `(\Sigma,N,I,A,S)`
  * `I` initial trees. Non-terminal symbols on the frontier of the trees in I
    are marked for substitution;
  * `A` auxiliary trees, the foot node
* In \emph{lexicalized} TAG, at least one terminal symbol (the anchor) must
  appear at the frontier of all initial or auxiliary trees
* `I\cup A`: (`X`-type) elementary trees `\leftrightarrow` derived trees
* adjoining auxiliary at a non-substitution node
* substitution, initial trees

## Adjoining Constraints

* for each node of an elementary tree (on which adjoining is allowed), specify
  one of the following three constraints on adjunction:
  * Selective Adjunction: only members of a set `T_s\subseteq A` of auxiliary
    trees can be adjoined on the given node
  * Null Adjunction. `T_s=\emptyset`
  * Obligatory Adjunction: an auxiliary tree member of the set `T\subseteq A`
    must be adjoined on the given node
* Constraints on adjoining are also needed for formal reasons in order to
  obtain some closure properties

## Derivation in TAG

## Some properties of the string languages and tree sets !

* TALs are semilinear;
* All closure properties of context-free languages also hold for tree-adjoining
  languages. In fact, TALs are a full abstract family of languages (full AFLs)
* a variant of the push-down automaton called embedded push-down automaton
  (EPDA, Vijay-Shanker (1987)) characterizes exactly the set of tree-adjoining
  languages, just as push-down automaton characterizes CFLs
* tree sets of recognizable sets (regular tree sets)
* `T (G_1 )` on p10 is not recognizable
* Example 2.2.: NA means null adjunction
* the set of derivations trees of `G`, `D(G)`, is recognizable
  (in fact a local set)

# Lexicalized Grammars

* the entire structure is the category structure of the anchor
* Lexicalized grammars are finitely ambiguous
* `w\in L` is decidable. Undecidable problems for CF languages:
  * Universality
  * Language equality
  * Language inclusion
  * Being in a lower level of the Chomsky hierarchy
* lexicalization, strong capacity

# Lexicalization of CFGs

* finite ambiguity
* we want the choice of the anchor for a given structure to be determined on
  purely linguistic grounds

## Substitution and Lexicalization of CFGs

* in the general case, finitely ambiguous CFGs cannot be lexicalized with a
  tree system that uses substitution as the only combining operation. (The
  underlying idea behind this proof was suggested to us by Stuart Shieber.)
* Even if some CFGs can be lexicalized by using TSG, the choice of the lexical
  items that emerge as the anchor may be too restrictive

## Lexicalization of CFGs with TAGs

* any finitely ambiguous context-free grammar can be lexicalized within
  tree-adjoining grammars; furthermore adjunction is the only operation needed
  * Substitution as an additional operation enables one to lexicalize CFGs in a
    more compact way, `\varepsilon\notin L`
* The idea is to separate the recursive part of the grammar `G` from the
  non-recursive part
* proof
  * we construct a directed graph `\mathcal G` whose nodes are labeled by
    non-terminal symbols and whose arcs are labeled by production rules
  * a base of minimal cycles of `\mathcal G`

# Closure of TAGs under lexicalization

* given a finitely ambiguous TAG, `G`, `\varepsilon\notin L(G)`, there is a
  lexicalized TAG, Glex , which generates the same language and the same tree
  set as G
* we construct a directed graph G whose nodes are labeled by elementary trees
  and whose arcs are labeled by tree addresses

# Summary of Lexicalization

* there is a subclass of TAGs such that lexicalization can be achieved and yet
  this class is not more powerful than CFGs. [Schabes and Waters1995]. The tree
  insertion grammar

# Embedded Push-Down Automaton (EPDA)

* an EPDA may create new stacks above and below (right and left of) the current
  stack

# 9 Some variants of TAGs

## Feature structure bases TAGs

* A feature structure consists of a set of attribute-value pairs, where a value
  may be atomic or another feature structure. The main operation for combining
  feature structures is uni cation. A variety of grammars such as GPSG, HPSG,
  and LFG are feature structure based grammars with CFG as their skeletons. A
  feature structure based TAG is a TAG in which feature structures are
  associated with the nodes of the elementary trees. The operations of
  substitution and adjoining are then de ned in terms of uni cations of
  appropriate feature structures

## Synchronous TAGs

* Stuart Shieber and Yves Schabes. 1990. Synchronous TAGs
* Synchronous tree adjoining machine translation - DeNeefe
* characterize correspondences between languages
* substitution and adjoining are applied simultaneously to related nodes in
  pairs of trees,

## Probabilistic LTAGs

* integrating the lexical sensitivity of stochastic approaches and the
  hierarchical structure of grammatical systems

## Using Description Trees in TAG

## Multi-component TAGs
