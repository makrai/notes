A Knowledge-Space-Based Medium Solver: A Conceptual Framework
Antal Jakovác, András Telcs

# 1 Introduction

## 1.1 Broader Motivation: From Task Performance to Cognitive Development

* LLM perform across linguistic, scientific, technical, and practical tasks.
  * a learned generative model can acquire broad regularities,
    combine information flexibly, and produce useful responses
    in domains far beyond those repred by traditional task-specific programs. It
  * systems combine language models with retrieval, tools, external memory,
    verification, and multi-step control.
  * hE High task performance != an explicit mechanism of cumulative cog devel
  * in LLM sys, much of the knowledge supporting a response remains
    distributed across model parameters, the current context, retrieved
    information, and external components.
  * A successful solution can be stored, supplied again, or used for further
    training, but this does not by itself specify
  * hE which concept, procedure, relation, schema, or representational dimension
    has been formed, how it is connected to earlier knowledge, or
    under which conditions it should govern later problem solving.
* our objective is a solver whose development is represented as
  a sequence of inspectable changes in an explicit cognitive structure.
  * Solving a task should be able to alter the organization available for
    solving later tasks:
    a verified trace may support a reusable procedure, a higher-level concept, a
    generalized relation, a schema, or an extension of the represented universe.
  * The resulting change should record its sources, derivation, applicability,
    scope, and epistemic status
    rather than appearing only as an undifferentiated modification of a learned
    model or as another item in an external memory.
  * ie diff role assigned to a language model. The language model is not
    * LM != the solver or its knowledge. It may serve as
    * LM is a flexible navigation proposer that
      suggests possible operations over the solver’s current structured state.
    * The same functional role could instead be implemented by deterministic
      graph navigation, a heuristic search policy, another learned model, or a
      combination of mechanisms.
* The persistent object that develops is the Knowledge Space, while proposal
  mechanisms are replaceable components used to navigate it.
* The proposed architecture seeks to place LM capabilities inside a different
  developmental organization. Its central aim is to
  * examine whether a solver can construct and reorganize an explicit conceptual
    and procedural universe through the verified tasks it receives,
    without task-specific external instruction about what it should learn.
* Existing work on agents, memory, retrieval, neuro-symbolic systems, lifelong
  learning, and self-improvement addresses important parts of this broader
  * we: combination of an explicit evolving Knowledge Space,
    task-driven formation of new representational elements, and
    a strict separation between
    the persistent cognitive structure and
    the replaceable mechanism that proposes how to navigate it

## 1.2 From the Structural Framework to the Medium Solver

* The first two papers developed a structural account of cognitive represen-
  tation and problem solving. In that account, 
  * represented objects are determined relative to contexts and their
    available distinctions, while 
    coordination among contexts supports abstraction, generalization, and
    extension of the represented universe.
  * Concepts, laws, schemas, tasks, and procedures are organized in 
    an evolving Knowledge Space (KS), and 
    problem solving proceeds through operations on this structured state 
    rather than through an isolated mapping from a task statement to an answer.
* This framework makes 
  the development of the solver inseparable from the development of its KS.
  * Solving a task may reuse an existing element, compose available elements,
    produce a new trace, support a higher-level abstraction, 
    generalize the applicability of a stored element, or 
    require an extension of the represented universe. 
  * These outcomes must remain distinguishable. 
  * In particular, 
    * insertion of a new KS element is an update operation, whereas 
    * abstraction, generalization, and extension describe different changes in
      representational content.
* The weak solver introduced in the preceding work 
  established finite workability of this approach. 
  * Starting from a small KS and a fixed set of elementary operations, it could
    solve bounded structured tasks, verify its steps, and 
    record the resulting traces. 
  * Its limitations were deliberate: the available operations, search bounds,
    task representation, and mechanisms of KS development were fixed and small.
  * The weak solver therefore demonstrated that 
    structured, verifiable problem solving is possible within the framework, but
    * did not provide a general architecture 
      for navigating a larger and evolving KS.
* The present paper addresses this next problem. 
  * As the KS grows, the solver must select a task-relevant local structure,
    propose possible next operations, verify those proposals, 
    record accepted and rejected steps, and 
    determine whether verified traces justify new KS elements. 
    * These functions should not be collapsed into a single mechanism.
    * In particular, the source of navigation proposals 
      should not determine correctness and should not modify the KS directly.
* We call the resulting architecture a medium solver. It 
  * separates localization, proposal, verification, trace formation, and 
    KS insertion. 
    * The proposal module is defined functionally: 
      given the current solver state and a localized part of the KS, it 
      returns ordered candidate operations or candidate insertions 
      in the admissible proposal language.
  * Its implementation is replaceable.
    * It may use deterministic graph navigation, a heuristic or learned policy,
      a (large) language-model layer (LML), which is a proposal module, or
      another functionally equivalent mechanism. The architecture 
    * requires only that its outputs can be parsed and externally verified.
* The central question of the paper is 
  whether a self-evolving medium solver can be 
  specified consistently and shown to be feasible when, after initialization,
  its only external inputs are the tasks it receives. 
* The initialization is problem-agnostic and meta-level: it 
  fixes the representational grammar, admissible object and operation types,
  verification and update protocols, and 
  the interfaces needed to invoke proposal modules. 
  * When an LML is used, its fixed prompts belong to this meta-initialization;
    they specify how proposals must be formed and returned, but contain 
    no task-specific solution, domain-specific hint, or instruction identifying
    a KS element that should emerge.
* The solver must develop its underlying KS 
  through its processing of the task sequence itself.
* We address this question by 
  defining the medium-solver architecture, 
  instantiating one replaceable proposal module with an LML in a restricted
  experiment, and 
  specifying how verified task traces can 
  support the controlled formation of new conceptual and procedural KS elements.
* The separation of proposal, verification, and insertion is 
  a consistency condition of this construction, not the research question itself
  * The experiment is intended as 
    a proof of feasibility of task-driven KS development, 
    not as a performance benchmark or a claim of general problem-solving compet
