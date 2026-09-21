Cognitive Schemas, Laws and Tasks
Antal Jakovác, András Telcs 
ACM Trans Intell Syst Technol, Vol 1, No 1 Article Publicat: Sep 2026

# Abstract

* how explicit reprs can support reusable cognitive schemas in knowledge-based
  problem solving
* We: a structural framework in which
  * schemas are organized by the info and relations required for their use,
    rather than introduced as unrelated primitives
  * distinguishes context-dependent relations from more stable structures that
    can be reused across different reprs
* Tasks are described through the info available, the unknowns to be determined,
  and the constraints that admissible solutions must satisfy
* This makes it possible to separate limitations of the repr from limitations of
  the solving procedure
* we distinguish inconsistency, underdetermination, and contextual
  insufficiency,
  * latter? the repr lacks distinctions or relations required by the external
    task meaning
* We also show formally when a reduction of repr preserves the task-relevant
  solution structure
* The resulting task–schema interface offers a structured way to describe repral
  conditions relevant to problem solving
  * supports the reuse and stabilization of derived knowledge while remaining
  * indep of the particular mechanism used to generate candidate solutions
  * may provide a useful component for future solver architectures that combine
    structured knowledge, verification, and learned proposal mechanisms

# Intro

* Knowledge repr is a central component of intelligent problem solving: the form
  in which a task and its objects are represented determines which relations,
  transformations, and solution procedures are available. This paper develops
* we: a structural account of cognitive schemas within the repral framework
  introduced/further discussed in Jakovác and Telcs (2015/2016)
  * finite contexts, invariance relations, representative objects, and a
    Knowledge Space as a substrate for problem solving. Here we ask
  * which higher-level schemas can be derived from this substrate without
    introducing additional repral primitives
* The main idea is that
  notions such as equivalence, order, successor, conditional dependence, causal
  dependence, discrete succession, number-like structure, implication, and
  logical operations
  can be represented as derived structural patterns. They are
  * not introduced as independent cognitive faculties or algorithmic modules
  * their applicability follows from relations among contexts, repral objects,
    and admissible transformations
* The central contribution is
  a dependency-structured hierarchy of such schemas
  together with a formal task–schema interface
  * The hierarchy identifies the repral conditions required for progressively
    richer relational and process structures
  * A task is represented by
    a context, given elements, unknown placeholders, and constraints
  * These jointly determine the admissible instantiations of the unknowns and
    the schemas that can legitimately be applied
* Problem solving can therefore be viewed as constrained instantiation under
  task-compatible representational structure
* This formulation also makes it possible to
  distinguish failures of representation from failures of a solving procedure
  * three basic forms of ill-posedness:
  inconsistency, underdetermination, and contextual insufficiency
  * In each case, the task specification fails to provide the representational
    conditions required for a unique admissible solution
* we
  * organize these notions within a common structural framework:
    * contexts are task-relative representational structures,
    * schemas specify conditions of structural applicability,
    * laws capture relations stable across relevant contexts, and
    * task formulation determines which schemas may participate in problem
      solving. The paper
  * develops this representational layer through the schema hierarchy, the
    task–schema interface, and explicit conditions for task illposedness
