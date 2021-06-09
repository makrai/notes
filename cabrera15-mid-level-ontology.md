A Middle-Level Ontology for Context Modelling 1
Oscar Cabrera, Xavier Franch, and Jordi Marco

# Abstract. Context modelling is one of the stages conducted during the context

* gaps related to the reusability of the models themselves and the lack of
  consolidated and standardized ontological resources. To tackle this problem,
* we adopt a three-layered context ontology perspective and
* we focus on this paper in the middle layer, which is
  defined following a prescriptive process and structured in a modular way

# 1 Introduction

* Context is a term widely used in many areas of conceptual modelling.
  * Dey defines it as “any information that can be used to characterize the
    situation of an entity. An entity is a person, place, or object that is
    considered relevant to the interaction between a user and an application”
* context information affects positively or negatively an entity.
* One of its major applications is concentrated on context-aware
  infrastructures, i.e.  areas such as Smart Cities, Pervasive Computing and
  Internet of Things [2].
* In a previous work, we analyzed the state of the art on context modelling [3]
  * One of the most important issues is the difficulty of reusing the context
    * lack of homogeneity among their elements, as well as the shortage of their
      definitions. This problem calls for efforts to consolidate the context
* in this paper we adopt a three-level ontology approach for context modelling:
  * The upper-level provides a basic taxonomy of context classes that represent
    general context concepts. We have presented this upper level in a previous
    work [3].
  * The middle-level supports reusing and extending ontological resources of
    existing context models and other consolidated ontologies from a modular
    perspective.
  * The lower-level includes a set of detailed classes highly dependent on the
    domain.
  The rest of the paper is organized as follows.

# 2 Background

## 2.1 Classification of Ontologies

* Different designs and structures of ontologies have been proposed so far
* Two usual criteria are: generality and expressiveness.
  * Generality: specifying general classes towards top levels and more specific
    classes towards lower levels [7].  This criterion
    * supports the adoption of a layered view of ontologies [8, 9].
  * Expressiveness indicates the level of detail of an ontology. Usually they
    * lightweight and heavyweight [10]. In this paper we adopt a 3-level view of
      * express axioms and constraints more than
      * only concepts, taxonomies and relationships

## 2.3 Reuse in Methodologies for Developing Ontologies

* two different reuse processes: merge and integration. In a
  * merge process, it is usually difficult to identify regions in the resulting
    ontology that were taken from the merged ontologies more or less unchanged.
  * integration process source ontologies are aggregated, combined and assembled
    * changes, such as extension, specialization or adaptation. We propose
      integration because we are more interested on unifying modules than
    * process defined by Pinto and Martins [14] since they have compiled

# 3 Antecedents

* previous paper [3] we included a preliminary state of the art in context. This
  1. compiled different gaps reported by researchers in context modelling (CM)
  1. identified gaps
  1. established a basic taxonomy of high level classes intended to serve as
    * abstract level of a context model consolidating all these proposals.
    * The consolidated resources encompass all the perspectives
    * especially, resources regarding context information vocabulary, properties
      and terminology definitions.
* next step was a systematic mapping study
  according to the guidelines proposed by Kitchenham and Charters [15].

# 4 the proposed model focused on the middle-level ontology.

* Pinto and Martins [14] define several tasks that are applied below. For the

## Identify integration possibility. In this first step, Pinto and Martins

* select the framework being used to build the ontology. Following the criteria

## Identify modules and knowledge to be represented in each of them. As starting

* we associate a module to each of the leaves of the class hierarchy established
  in the upper-level ontology (see Fig. 1). We have consolidated the knowledge
* these classes are defined as follows:
  * Time. Temporal concepts and properties common to any formalization of time [6].
  * Profile. Biographical sketch [18].
  * States and Status. A state at a particular time (e.g., a condition or state
    of disrepair, the current status of the arms negotiations) [18].
  * Environment. Environment in which the user interacts [19].
  * Role of an agent, to characterize the intention of the agent [20] .
  * Location: we mean a collection of dynamic knowledge
  * Activity. Represents a set of actions [6].
  * Resource. Resources describe anything used to perform the activity [21].
  * Agent. Both computational entities and human users can be modeled as agents

## Identify and get candidate ontologies. According to [14], this task first

* identifies candidate ontologies that could be used as modules of our
*  we selected those ones more referenced by existing proposals of CM:
  CONON [9], SOUPA [6], SUMO [8], OpenCyc [22], FOAF, CCPP, OWL-Time and OWL-S .

## Study and analysis of candidate ontologies. In this task the candidate

* identify possible problems in the integration process. We applied the
* SEQUAL evaluation framework formulated by Hella and Krogstie [23]. There are
* 7 quality categories used to evaluate the reusability of the ontologies. For
  * Physical (Phy). The ontology should be physically available and it should be
  * Empirical (Emp). If a visual representation of the ontology is provided it
  * Syntactic (Syn). The ontology should be represented according to the syntax
    of a preferred machine readable language. OWL full (); partial OWL (-); RDF
  * Semantic (Sem). The ontology should cover the area of interest.
  * Pragmatic (Prag). It should be possible to understand what the ontology
    contains, and being able to use it for our purpose. Satisfactory (); not
  * Social (Soc). The ontology should have a relatively large group of users.
  * Organizational (Org). The ontology should be freely available, accessible,
    maintained and supported. Free, accessible, and stable (); free,

## Choosing source ontologies. Given the study and analysis of candidate

* In the semantic and pragmatic qualities, SUMO and OpenCyc are upper ontologies
  providing an extensive vocabulary; although it can be used for purposes of
  context modelling, a large set of this vocabulary is irrelevant for this
  purpose.
* The rest of the foundational ontologies are more concrete and provide a
  smaller set of vocabulary partially covering the context of an entity.
* e.g. For instance, the Object module is selected from SUMO since it provides
  the overlap required to conceptualize this module. However, this ontology does
  not provide at all the required resources to conceptualize a computational
  entity, so we complement it with resources from CONON.  3

## Apply integration operations. Once the candidate ontologies have been

# 5 Conclusions

* analyzing, selecting and combining many useful vocabularies from different
  existing proposals. To do so, we gathered parts of different ontologies to be
