CYC: TOWARD PROGRAMS WITH COMMON SENSE
Lenat, V Guha, Pittman, Pratt, Shepherd
1990

# Abstract

* attempt to assemble a massive knowledge base [on the order of 10^8 axioms]
  spanning human consensus knowledge
* This article
  * examines the need for such an undertaking
  * efforts over the past five years to begin its construction
  * methodology and history of the project are briefly discussed
  * current state of the representation language used [epistemological level],
  * efficient inferencing and default reasoning [heuristic level], and the
  * content and organization of the knowledge base

# Motivation: Brittleness Bottleneck

* For three decades, Artificial Intelligence researchers have grappled with
  issues like control of search in problem solving, organization of memory,
  logic for the representation of knowledge, perception, and so on, driven by
  tasks ranging from infants exploring their “worlds” through experts

## The Path to Artificial Intelligence

* three tasks:
1. Develop a language (actually a logic)
2. set of procedures for manipulating (i.e., using) knowledge. Some of these
   will of necessity be heuristic, some will be strategic or meta-level, some
   will be aimed at truth maintenance and default reasoning,
3. encode knowledge
  * AI has largely concentrated on 1. and 2
  * McCarthy [21] was the first to point out the importance of being able to
    represent knowledge in a program and initiated the task of devising
    representations for assorted topics such as time, agent-hood, etc
  * Feigenbaum was one of the first to actually build programs which depended
    upon a significant amount of knowledge as their primary source of power
    Later dubbed “expert systems,”

## The Source of Software Brittleness
* special knowledge: a tudás kérge
* Programs often use names for concepts such as predicates, variables, etc.,
  that are meaningful to humans examining the code; however, only a shadow of
  that rich meaning is accessible to the program itself
* Does Freda live on the sun? Was Freda born live or from an egg? Is Freda a
  person? Is Freda larger or smaller than a bacterium?  Is Freda larger or
  smaller than the Pacific Ocean?

## Overcoming Brittleness
* this would include beliefs, knowledge of others’ (often grouped by culture,
  age group, or historical era) limited awareness of what we know, various ways
  of representing things, knowledge of which approximations (micro-theories)
  are reasonable in various contexts,

## L

ate in 1984, we began the first serious attempt at iii)
* [since then, we] anticipate a kind of crossover (from primarily manual
  knowledge entry to primarily automatic entry via natural language
  understanding (NLU)) later th[at] decade
* NLU itself requires such a KB for
  * disambiguation of word senses, resolving anaphora, inducing the meaning of
    ellipses, and so on

## Overview of the Cyc Project

* The next three paragraphs-and, in much more detail, the next three sections
  of this article-discuss our approach to i), ii), and iii):
  1. our representation language (CycL)
  1. our inference engine (actually many little ones)
  1. and our ontology
1. frame-based language embedded in a more expressive predicate calculus
   framework along with features for representing defaults, for reification
   (allowing one to talk about propositions in the KB) and for reflection
   (allowing one to talk about the act of working on some problem.)
2. The same “incremental engineering approach” was taken to building the
   inference engine. As we identified frequently used classes of inferences
   that could be used more efficiently, we introduced special mechanisms for
   this purpose
  * Traditional computer science has identified _many problems having varying
    levels of complexity_ and has devised _special data structures and
    algorithms for solving them_
  * AI on the other hand, has largely opted for single, very general mechanisms
    (e.g., resolution) for doing problem solving
  * We have adopted the former paradigm and are applying it to cover the kinds
    of problems that a system such as Cyc tries to solve. This approach is
    quite similar to that advocated in Bledsoe (1981) Non-resolution theo proving
3. As for the KB, we alternate bottom-up growth with top-down design
  * “micro-theories” of various topics
    * e.g. money, buying and shopping, containers, etc
    * We follow a process that begins with a statement, in English, of the
      theory. On the way to our goal, an axiomatization of the theory, we
      identify and make precise those Cyc concepts necessary to state the
      knowledge in axiomatic form
      * To test whether the topic has been adequately covered, stories dealing
        with the topic are represented in Cyc, then questions any human ought
        to be able to answer after reading the story are posed to Cyc

## T
* Currently in the KB
  * between one and two million assertions
  * many of which are general rules, classifications, constraints, and so on;
  * only a fraction (at present) are specific facts dealing with particular
    objects and events (e.g., famous people and battles.)
* “solutions” for various representation thorns
  * time, space, belief, hypotheticals and counterfactuals, interval-based
    quantities, subtangible and stances, composite intangible entities,
  * a set of partial solutions which work adequately in the moderately common
    cases, and which work very well in the very common cases
* three possible levels of success, in decreasing order
  1. provide some insight into issues involved in task iii).  Perhaps it gives
     us an indication as to whether the symbolic paradigm is flawed
  3. No one in the early twenty-first century even considers buying a machine
     without common sense,

# CycL---The Cyc Representation Language p5

* “wish list”
  * be usable by many different problem solvers
    * should have a clear (and hopefully simple) semantics
  * inferential capabilities and these should not be intolerably inefficient
    Since most of our commonsense knowledge is in the form of defaults, CycL
    should provide some scheme for dealing with such knowledge
  * all the expressiveness of first-order predicate calculus with equality
  * means for handling propositional attitudes (such as beliefs, goals, dreads,
    etc.) [26]
  * operations such as reification, reflection, and so on

## Epistemological Level and Default Reasoning

* To improve inferencing abilities, we want to include special-purpose
  representations and inference routines, procedural attachments, etc. But
  these make it harder to provide a simple semantics
* an epistemological level and a heuristic level
  * in the sense as used by McCarthy and Hayes in [23]
  * an external program (or human user) can interact with CycL at either of
    these levels
* Epistemological Level (EL) uses a language that is
  * essentially first-order predicate calculus (with a slightly different
    syntax) with augmentations for
  * reification (McCarthy 1986)
    * i.e., having a name for propositions, and being able to make statements
      about other statements) and
  * reflection [32]
    * e.g., being able to refer to the facts supporting the system’s beliefs
      in another fact in axioms
  * “Cyc constraint language”
* Heuristic Level (HL), by contrast, uses a variety of special-purpose
  representations and procedures for speedy inference. The HL is used
  whenever any inference needs to be done
  * (inverse, transfersThrough, automatic classification, inheritance, etc.)
* Tell-Ask (TA) for translating sentences from the Epistemological Level into
  the most appropriate representations in the Heuristic Level and vice versa
* Some of the assertions in Cyc’s KB are monotonic (i.e., the addition of new
  facts cannot cause them to be retracted). But most (over 90 percent) are
  non-monotonic: they are currently held default beliefs
  * The monotonic (absolutely true) assertions are usually those that are
    _definitional_ (e.g., it is absolutely certain that tall people are people)
    or ... mathematical
* An argument for a proposition P is similar to a proof for P, but is non-
  monotonic

## The Heuristic Level: Inferencing In Cyc p7

* a host of “logically” superfluous mechanisms for improving efficiency
* “shallow” still means one or two deductions away from what is already there in the KB
* For instance, you have to make the following decisions:
  * what to cook for dinner tonight;
  * whether a wrench released on the moon will hang there or fall
  * why someone just laughed;
  * whether X is likely to already be acquainted with Y,
* Most of the answerable queries are not worth precomputing
  * because tney are numerous
* quickly identify a small subset of sentences relevant
  * efficiently reason using those sentences
* Functional Interface ... consists of the following six operations
  1. Tell: add \sigma as an axiom
  2. Unassert: remove axiom \sigma
  3. Deny: squelches all positive arguments for \sigma, and does not affect
     negative arguments (arguments for \neg\sigma) in any way
     * e.g. children of teachers typically go to college. But we might want to
       Deny that for children of gym teachers
  4. Justify: [returns] the argument for a given proposition
    * (Actually, Justify returns a somewhat more complicated value, which
      specifies the various pro and con arguments about (T, and how they
      combine to produce the “net” truth-value of u in KB.)
  5. Ask: (C x KB -+ truth-value/bindings)
    * which free-variable bindings make an expression true
  6. Bundle:

## Default Reasoning Modules

* Most of the gain in speed of processing at the Heuristic Level comes about
  because of the way we implement Ask. (Much of the complexily at the
  Heuristic Level is due to the need to do Deny properly.)
* modules:
  * Argument Generator: given a sentence..
  * Argument Comparator
  * Conclusion Retractor
    * truth values of other sentences that depend on x are also updated
  * Contradiction Resolver
* Current truth-values include:
  monotonically true; true by default; unknown; false by default; and
  monotonically false
  * “Unknown” is used for sentences for which there are unresolved conflict-
    ing arguments,

## Speeding up the Argument-Generator Module

* The bulk of Cyc’s time spent inferencing is used by the ArgumentGenerator
  module. A number of techniques have been introduced to make the
  Argument-Generator (and Conclusion-Retractor) modules work more efficiently
  These techniques fall into three categories:
  1. highly specialized inference rules,
   * e.g. `(\forall x, y, z) s1(x, y) and s2(y, z) \applies s1(x, y)`
   * specialized procedures for speeding up that sort of inferencing. For
     example, a certain amount of compilation can be done that cuts down
     drastically on unification
  2. domain-specific inference modules
    * information about “most frequently seen cases.”
    * e.g. temporal reasoning [l], quantity arithmetic [33], equality
  3. dependency analysis of the KB
    * analysis of the structure of the axioms in the KB
    * For example [the analysis] could reveal the circumstances in which there
      could be circular justification
* Dealing with Multiple Specialized Inference Engines
  * heuristics to control the search strategy. The performance of the iterative
    deepening strategy has been so good, however, that this meta-level [7]
    mechanism is rarely used
* specifying control information for individual [sentences]

## Denials

# The Cyc Ontology

* most of the discussion of the ontology of Cyc’s KB in this article will be at
  the EL, not HL
* organization
  * introducing some of the basic concepts and distinctions used
  * “representation issues” such as time, events, agents, causality

## Some Basic Concepts and Distinctions

* The ontology of Cyc is organized around the concept of categories. We shall
  also refer to these as classes or collections
  * Though we shall frequently use set-theoretic notions to talk about
    collections, these collections are more akin to what Quine termed _Natural
    Kinds_ [29]
* The collections are organized in a generalization-specialization hierarchy
  * (not a tree since each collection may have more than one direct
  generalization)
  * The generalizations and specializations of a collection (that is, its
    supersets and subsets) will often be referred to as its genls and specs
  *  Elements or members of a category are usually referred to as its instances
* we begin by discussing some of its important nodes and why they are in
  certain unintuitive genls/specs relations; we also discuss some of the
  partitions of categories
* The universal set is called Thing.  One of its partitionings is into the two
  sets IntenalMachineThing and RepresentedThing
* Another partition of Thing is into IndividualObject and Collection
* Predicates are all strongly typed and a single category from the Cyc
  hierarchy has to be specified
* a distinction is made between instances (elements) and specs (subsets)

## Substances and Processes vs. Individuals and Events

* Substances are usually referred to in English as mass nouns; some of them are
  obvious (sand, air, peanut butter) and some less so (time, walking)
* interesting relations between substances and individuals
* one could take a glob of peanut butter and separate out all the peanut
  chunks, and these alone do not form a glob of peanut butter
* the substancehood principle applies only to pieces larger than the _granule_
  of that substance

## Events and Persistent Objects

* Walking is a type of temporal substance-what we will call a Process
* two abstractions of time to specify these temporal properties:
  interval-based and set-based
  * before

# Temporal Projection

* default periods of persistence with classes of propositions by using ax-
  ioms, which are called Temporal Projection Axioms

# Causality

* Given any atomic ground sentence q that refers to an event, either q should
  be “basic” or there should be some sentence p so that (causes p q) is true
  Intuitively, q being classified as _basic_ corresponds to the notion of it
  being “unexplainable.”

# Actions and Concurrent Processes

* as there may be orthogonal ways of breaking down a physical object, there
  may be orthogonal ways of breaking down an action into subEvents
* actions [have] two important categories of parts, namely actors and subEvents
* there are separate categories of slots that are used to relate the actors to
  the particular action (the ActorSlots) and to relate the subEvents to the
  particular event (the SubEventSlots). The
  * actor slots define the “roles” played by the different actors in the event
    (performer, victim, instrument)
  * the subAbstraction of the actor just before, during and after the action
* there are no “primitive” actions into which all actions are broken down
  * That is, the actions are not merely macros introduced for notational
    convenience, for use instead of more complex sequences of primitive
    actions. This approach is motivated by two reasons: we wish to be able to
    reason at different levels of abstraction and a priori assigning of a set
    of actions as primitives goes against this;
* concurrent events
* Interval-based quantity slots [also for] ... happiness, alertness, level of
  frustration, attractiveness
  * reified “mileposts” for these attributes’ values can be defined, and
  * partial orders and even crude calculi developed

# Composite Objects and Agents

* a very incomplete treatment of Agents and Agreements
* objects like books and people with whom we would like to associate an
  intangible aspect such as a message or a mind (which also would have a
  temporal aspect)
  * purely tangible and the purely intangible parts,
* subset of CompositeTangibleObject is Agent-the set of intelligent agents-and
  this subsection considers some aspects of representing agents
* issues related to agenthood
  * collective (such as organizations and institutions) or individual
  * can have one or more _propositional attitudes_ toward any given
    proposition
    * fundamental propositional attitudes currently used are believes and
      desires
    * From these two, using time and other concepts, a variety of other modals
      are described and used (e.g., dreads, purposes, expects)
  * Each agent has a set of terms and predicates of which he is _aware_. An
    agent may have an attitude only toward sentences that involve only terms of
    which he is aware

## A

ttributing our own beliefs to other agents (with whom we might never have
directly communicated)
* belief projection axioms (analogous to temporal projection axioms) that
  enable Cyc to efficiently do this sort of mirrorimaging, yet explicitly
  record separate beliefs when they are known.  The belief projection rules
  themselves are moderately interesting, since they describe what it means to
  be a public figure, what it means to be commonsense knowledge, etc.  CycL
  provides special support to handle these efficiently at the Heuristic Level
* Agents can be in control of (the truth of) propositions
  * If there is an agent in control of a proposition P, and he or she desires
    P, then we can assume that P is true
  * abstraction layer that allows us to skip the details
    * of the agent planning to make P true, executing that plan, monitoring it,
      repairing it
* voluntary or involuntary participation of Agents in Events
* Agents can enter into Agreements with other agents
  * An agreement defines a set of propositions that all the participants share
    (though they may have quite different propositional attitudes toward the
    various clauses of the agreement!)
  * responsibilities (logically, these are also propositions) to specific
    participants

# Conclusion

* not touched on in this article
  * subsystem roams over the KB, typically at night, looking for unexpected
    symmetries and asymmetries. These in turn often turn out to be bugs,
    usually crimes of omission
  * neural nets that we can use at the very earliest (preheuristic) and very
    latest (reduction to instinct) stages of understanding of some task. One
    example of this development, training a net on examples of good and bad
    analogies, and then letting it make “hunches” about potentially good new
    analogies, hunches which the rest of Cyc can investigate and flesh out
    symbolically
  * many of the extra assertions deal with overcoming ambiguities, with being
    precise about a cluster of closely related concepts, and that means that
    Cyc can help the user copy a whole cluster of related "thin" concepts in
    approximately the time we expected it to take to copy one of our original
    “fat” concepts
* How do we make sure that we do not go through these 10 years of labor, only
  to learn in 1994 that the assumptions upon which we based our efforts were
  fundamentally mistaken all along? We do this by getting others to actually
  use our system. In the past 18 months, as the Cyc Representation Language
  and Ontology stabilized, we began to encourage both with
  * academic researchers and with industrial researchers and developers; we
    held workshops and panel sessions; and we have begun once again (after a
    purposeful several-year hiatus to focus solely on research) to write books
    and technical reports and journal articles,

## C

* application programs using it, but the early results are promising
  * DEC, for example, John McDermott, David Marques, Renata Bushko,
* given that the basic business unit in a hotel is “the room”, and at a car
  rental agency is "the car", use relatively deep understanding of what goes on
  at each kind of place to decide that for a new potential customer which is a
  hospital the right business unit is the bed, not the room
* Academic collaborations include coupling with
  * large engineering knowledge bases (with Ed Feigenbaum and Tom Gruber)
  * large data bases (with Stuart Russell and Mike Stonebraker at Berkeley),
  *  standardizing knowledge interchange formats (with Mike Genesereth)
  * axiomatizing human emotions (with John McCarthy at Stanford),
  * ... analogy (with Devika Subramanian at Cornell), and
  * qualitative physics reasoning in ... children’s stories (with Ken Forbus)
  * NLU project (Barnett et al (1990) Knowledge and NLP)
