Putting Semantics into Semantic Roles
James F. Allen 1,2 and Choh Man Teng 1
`*`Sem 2018

# Abstract

* there have been many proposals for theories of semantic roles over the years,
  * models are mostly justified by intuition and
    the only evaluation methods have been interannotator agreement
* We explore three different ideas for providing more rigorous theories
  * more objective criteria for designing role sets, and
  * some experimental evaluation

# 1 Intro

* role taxonomy is
  * defined by an informal gloss and some examples OR
  * purely convenient names for arguments of a predicate, frame or event,
* if we are going to base a representation on semantic roles,
  they should have consequences independent of the predicate or event
* we will explore three different aspects that identify criteria
  1. Entailment from a role independent of the type that has such roles
  2. Integration with ontology:
    * Roles should obey the typical entailments in an ontology
      (e.g., inheritance of properties from parents in the ontology)
  3. Derivability
    * roles [should be derivable from the] definitions [in] dictionaries
* This paper will examine the TRIPS roles (Allen & Teng, 2017)
  * the third [property] allows empirical evaluation

# 2 Preliminaries

* A key distinction that most frameworks make is between the
  * inner (or core or argument) roles and the
    * objects that are typically required to fully specify the content
    * semantically are like arguments to a predicate,
      although they might be optional
  * outer (or relational or adjunct) roles. The core roles identify
    * typically optional but add additional information. For instance
    * denote a relationship between an event and some other condition
      not an argument
    * e.g. _melt **into a puddle**_ denotes [a] relationship called
      RESULTINGOBJECT(the melting event, a puddle)

# 3 Overview of TRIPS Semantic Roles

* AGENT, AFFECTED, NEUTRAL, FORMAL, EXPERIENCER
  * [features:] causality, temporality, existence, and sentience
  * defined to reflect the causal relationship between the role[s] and the
    events
  * +/affected, +/existent +/cognitive
  * NEUTRAL and FORMAL roles are acausal

# 4 Axiomatizing Roles

## The Framework

* We start from the formalism developed in Allen & Teng (2013),
  * extended from the interval temporal logic based framework
    (Allen & Ferguson 1994; Allen 1984)

# 5 Integration with an Ontology

* literature concerning roles in [early] semantic networks
  (e.g., Hayes, 1980; Thomason & Touretsky, 1991)
* any role that is essential for a given type T
  must also then be essential for all subtypes of T
* predominant models of semantic roles [e.g VerbNet] do not address such issues
  * classes based on clustering by verb usage patterns
  * [in] Propbank semantically very similar verbs have different rolesets
    (e.g., compare the rolesets for the verbs constrict, compress and squeeze)
* The TRIPS role set is fully integrated with a rich ontology
  * concepts are organized both by entailment [and] semantic roles
  * explanation closure techniques (Schubert, 1994) – if a role is not defined
    as possible in the ontology then the role is not possible
* selectional preferences are soft constraints
  i.e., the parser prefers interpretations that satisfy the constraints
  * inherited down the hierarchy

# 6 Derivability in Definitions

* [e.g.] _kill_, defined as `cause to die`
  * two essential roles: AGENT and AFFECTED
  * The definition a predicate `cause`
    that takes an AGENT, AFFECTED and a FORMAL role (to die)
    * only the FORMAL role is fixed by the definition (i.e., it is the `die`)
    * The unfilled essential roles in the definition are the roles for kill
* To implement this we need a strategy for identifying unfilled semantic roles
  * in WordNet definitions[,] the unfilled roles are
    * elided
      * The TRIPS parser instantiates such gaps in the logical form
    * indefinite pronoun, such as someone or something
    * occur  in an embedded clause [e.g.] _approach_ `move towards`
      * We created a mapping based on the semantics of the roles

## 6.1 Experimental Evaluation of Derivability

* we built a customized TRIPS system to parse definitions
  * a dozen top level syntactic rules that capture the common  definitions,
* baseline: we assigned each verb the AGENT and AFFECTED roles
* manual analysis of the errors in this experiment, the errors arose from a
  * parse errors, ambiguities, terse [tömör] and loose definitions
  * e.g. one sense of appear is `to come into sight`
    * acquisition reading where sight is acquired The parser chose
  * a sense of _pronounce_ is `to declare judgement on` (e.g., _they pronounced
    him unfit_)
    * The parser failed to identify the second gap
    * our strategy for identifying arguments was inadequate
      There is an argument to this verb that is the judgement
* [future work]
  * [combine] multiple definitions
  * Currently we only analyze the first one
  * parse examples. Often the lexicographer depends on the examples
