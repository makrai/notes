An Overview of the KL-ONE Knowledge Representation System
RONALD J.BRACHMAN and JAMES G.SCHMOLZE
(1985) COGNITIVE SCIENCE 9, 171-216

# Abstract

* KL-ONE is a system for representing knowledge in Artificial Intelligence pro-
  groms.  It has been developed and refined over a long period and has been
  used in both basic research and implemented knowledge-based systems in a
  number of places in the AI community.  Here we present the kernel ideas of
  KL-ONE, emphasizing its ability to form complex structured descriptions
* we discuss
  * description-forming structures,
  * the philosophy underlying the system, highlight notions of
    * taxonomy and classification that ore central to it
  * use of KL-ONE and its classifier in a recognition task

# 1. INTRODUCTION

* KL-ONE
  * a system for representing knowledge in Artificial Intelligence
    * more or less in the tradition of semantic networks and frames
  * a computational incarnation of ... sfrucfured inheritance networks
    (Brachman, 1978)
* first appeared in 1977 as ... the first author’s Ph.D. dissertation (Brachman, 1978)
  * whose primitives were rather [geared to] AI knowledge representation
    * than those of predicate logic
  * the “epistemological level”
  * to deal carefully with ideas of “description,” “attribute,” “concept,”
    “role,” “inheritance,” and “instantiation,” which were
    * treated in a somewhat informal manner in previous representation systems
    * In that regard, the work owes much to Woods (1975) and Brachman (1977),
      which criticized various inconsistencies and ambiguities in semantic
      network systems.’
* used in/for
  * two systems at Bolt Beranek and Newman Inc.:
    * a system for intelligent information presentation and
    * a large prototype natural language understanding system
      * Appendix: an example of KL-ONE’s utility in the natural language system
  * understanding and generating natural language, interactive information
    retrieval, question-answering about system utilities and natural language
    command execution, computer system configuration, and office procedures
    modeling
* influenced work in philosophy and psychology (Cohen, 1982; Rifkin, 1985).
* this paper: the representational kernel
  * we concentrate heavily on the static structure of and interrelations
    between descriptions
  * inferences that follow from structuring a domain in a KL-ONE knowledge base

# 2. LANGUAGE STRUCTURE AND PHILSOPHY

* representation of conceptual information based on the idea of
  * strucfured inheritance networks (Brachman, 1978, 1979)
* represent general conceptual information and is typically used in the
  construction of the knowledge base of a single reasoning entity
* two different formalisms
  * assertion: beliefs of the system
  * description: the terms out of which the belief sentences would be
    constructed
* descriptional part of KL-ONE allows one to form a variety of descriptive
  terms out of other descriptive terms using a small set of description-forming
  operators.
* assertional part
  * use terms from the description language to
  * make statements about the world
  * ! somewhat impoverished as _compared to a first order language_ with
    equality; they include only statements of existence, of coreference of
    description, and of identity of individual constants (all in a particular
    context)
* two new experimental representation systems,
  * Krypton (Brachman et al., 1983)
  * KL-TWO (Moser, 1983).

## 2.1 Epistemological Primitives

* the principal element of KL-ONE is the structured conceptual object, Concept
* Brachman (1979) and Woods (1975), the history of network representations is
  fraught with imprecision on the meanings of nodes and links
  * links ... being used to represent implementational pointers, logical
    relations, semantic relations (e.g., “cases”), and arbitrary conceptual and
    linguistic relations
  * “levels”
    * implementational, logical, conceptual, linguistic
    * (Brachman, 1979)
* set of underlying object and relation types for knowledge structuring
  * what might be called an “epistemology.”
  * “epistemologically primitive” structure types (e.g., “Concept ,” “Role”)
  * structure-forming operations
    * e.g., “specialization,” “restriction,” “differentiation”

## 2.2 Primitive and Defined Concepts

* one usually first specifies some primitive types, which are then typically
  followed by other types (either primitive or defined) that are specified in
  terms of them
* For example, if our domain were planar geometry
* natural kind terms such as dog or lemon:
  * it is usually assumed that it is not possible to completely define such
    terms
* default or typicality information. KL-ONE as yet does not address this
  directly, although we do comment on it in section 7.

# 3. NETWORKS AND THE NOTION OF A CLASSIFIER p7

* KL-ONE is based on the idea of sfructured inheritance
  * it is convenient to think of a KL-ONE knowledge base as a type of semantic
    network with a roughly hierarchical organization of general types (called
    Generic Concepts)
* given two KL-ONE descriptions, an important question to consider is whether one
  subsumes the other
* the network is simply a by-product of the structure of terms in the language
  (the network is not itself the language), not all network-derived subsumption
  inferences are valid
* classifier (Schmolze & Lipkis, 1983), which is a mechanism for taking a new
  KL-ONE description and putting it where it belongs in the hierarchy.
* KL-ONE knowledge bases have a network flavor, with the links standing for
  what we have called the “epistemologically primitive” relations

# 4. GENERIC CONCEPTS AND BASIC TAXONOMY p8

* types of Concepts
  * The most important type is the Generic Concept,
    * the KL-ONE equivalent of a “general term” (Quine, 1960)
* components of a Concept are
  * its subsuming Concepts (its superconcepts)
  * and its local internal structure expressed in
    * Roles, which describe potential relationships between instances of the
      Concept and those of other closely associated Concepts (i.e., its
      properties, parts, etc.), and
    * Structural Descriptions, which express the interrelations among the
      Roles
* Concept must
  * have more than one superConcept (if there are no local restrictions),
  * differ from its superconcept in at least one restriction, OR
  * be primitive.
  * A Concept with no local restrictions is defined as the conjunction of its
    superconcepts.
* superconcept serves as a proximate genus, whereas the
  * local internal structure expresses _essential differences_,
  * as in classical classificatory definition (Sellars, 1917)
* the network structure formed by the subsumption relationships between
  Concepts as a “taxonomy.”
* always have a single root Concept, usually named THING.

# 5. ROLES, RESTRICTION, AND DIFFERENTIATION p11

* Roles are the KL-ONE equivalent of two-place predicates.
* distinguishes Roles from their fillers. The difference is motivated
  essentially by the “attributive/referential” distinction in the philosophy of
  language (Donnellan, 1966). Imagine a situation in which an alligator’s tail
  has fallen off. We might remark, “The alligator’s tail lay wriggling on the
  ground.” Or, we might say something like, “Don’t worry, the alligator’s tail
  win grow back again.”
* types of Roles of which the Generic RoleSet is the most important. RoleSets
  (in general, used to mean Generic RoleSet) capture the notion that a given
  functional role of a Concept (e.g., sender of a message, upright of an arch,
  officer of a company, input to a program) can be played by _several different
  entities_ for just one individual.
* RoleSets themselves have structure. Descriptions of potential fillers are
  specified with a Value Restriction (V/R). In Figure 2 we see that the RoleSet
  Sender has a Value Restriction of PERSON. The system interprets Value
  Restrictions as necessary type restrictions on RoleSet fillers, and so the
  senders of messages must be persons. No cancellation of Value Restrictions
  is allowed

## 5.1. RoleSet Restriction p13

* specification ... with respect to the components of a RoleSet

## 5.2. RoleSet Differentiation p15

* a differentiation relation between President and Officer specifies that any
  president of a company is, by definition, an officer of that company.

# 6. CLASSIFICATION OF KL-ONE CONCEPTS p17

[semmi új]

# 7. A NOTE ON DEFAULT VALUES AND CANCELLATION p19

* it would be inappropriate to “cancel” an inherited component and KL-ONE
  does not allow any such cancellation.
* “exceptions” (e.g., three-legged elephants-see Fahlman, 1979). However, if we
  were to allow cancellation of components within Concepts, then these
  components would be reduced in status from necessary conditions to default
  assertions. We feel that such nonnecessary conditions are more appropriately
  expressed outside of the taxonomy.
* We intend, instead, to allow statements of default rules between Conceprs
  only. Thus (when implemented), one would not represent’elephants’ typically
  having four legs as in Figure 9. Instead,...
* KL-ONE seems to be different from many of today’s representation languages
  precisely because of its reliance upon necessary conditions rather than
  default assertions.

# 8. INDIVIDUAL CONCEPTS p20

* suitable for uniquely describing individuals. The primary unit for
  individual description is the Individual Concept, which is similar to the
  Generic Concept but can be used to describe at most one individual in a
  particular context.
* has associated Role descriptions that serve to describe the actual individual
  fillers of the Roles inherited from its parent Concept. There are two kinds
  of Roles that can be components of Individual Concepts: IRoles and Particular
  RoleSets. An IRole represents the binding of two individuals together in a
  relation. The relation is the one denoted by the parent RoleSet of the IRole
  (IRoles are always descended from Generic RoleSets). The two individuals are
  the one represented by the Individual Concept,and the one that is described
  as filling the IRole.
* Role filler can also be a Lisp object. The IRole for Body shows a Lisp string
  as the description of the Body of MESSAGE.

# 9. STRUCTURAL DESCRIPTIONS p22

* form Concepts by constraining the relation between more than one Role of the
  same Concept.
* e.g.
  * the vertical clearance of an arch is a function of the location of its
    lintel and the surface the arch is standing on; or,
  * we might characterize an “important-message” as one whose sender is the
    supervisor of the recipient
* these relations among Roles are specified with Structural Descriptions.
* the technical details of Structural Descriptions (SDs) [are] a bit messy
* another motivation for their existence.  While KL-ONE Roles can be given
  “names,” these are meaningless strings as far as the system is concerned.
* the buyer in a transaction is the person to whom goods go in exchange for
  legal tender provided by that buyer. The Structural Description mechanism
  allows us to describe such a transaction in terms of two connected giving
  events
* two types of SDS

## 9.1 Role Value Maps

* express the equality of two sets of Role fillers.
* “the grandparents of a person are exactly the same as the parents of the
  parents of that person.“”

## 9.2. Structural Descriptions

* two fundamental aspects to the relation of two Roles using KL-ONE Concepts.
  1. simply getting access to those Concepts in such a way that their use in
     defining a new Concept does not inadvertently change their meaning or
     assert the existence of any individuals.
  2. While programming languages typically use argument order to achieve the
     correspondence between actuals and formals, KL-ONE’s philosophy advocates
     using explicit links; thus the KL-ONE structure that implements SDS is
     unhappily complicated.

# 10. ASSERTIONAL LANGUAGE p27

* We have tried carefully to distinguish between
  * purely descriptional structure and
  * assertions about coreference, existence, etc.
    * relative to a Confexf
    * not affect the (descriptive) taxomony of generic knowledge
    * use in reasoning about hypotheticals, beliefs, and desires.
* One asserts the existence of some thing satisfying a description (i.e.,
  Concept) by connecting it to a Nexus within a particular Confext. This con-
  necting link is called a Description Wire. A Nexus is a structureless entity
  which serves as a locus of coreference statements;
  * Contexts are at the moment simply collections of Nexuses and Description
    Wires.
* not support any meaningful relations between Contexts, although a hierarchy
  of Contexts can be created by putting the meta-anchor (i.e., a Nexus-see
  section 11.1) of one Context into another Context.

# 11. ADDITIONAL KL-ONE FACILITIES p28

* meta-describe a KL-ONE object in KL-ONE. Of couise, to do this, the system
  needs to have the Concepts of a KL-ONE Concept, a KL-ONE Role, a KL-ONE Role
  Value Map, etc.
* attach procedures and data to structures in the network.
  * “PRE-” and “POST-” for conditional execution, or “WHEN-” for side
    effects

# 12. CONCLUSION p30

* KL-ONE has pioneered the idea of constructing a representation out of
  “epistemological” primitives and has provided a first set of such primitives
  for examination and experimentation.  It has also instigated
* first-class status for Roles (a k a slots) in frame-based knowledge
  representation systems, including the potential for multiple fillers and ex-
  plicit differentiation into subRoles
* separation of the representation task into descriptional and assertional
  components
* interaction of Roles through its Structural Description and Role Value Map
  mechanisms.

# APPENDIX AN EXAMPLE USING KL-ONE AND THE CLASSIFIER p33
