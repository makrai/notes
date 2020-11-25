Tensor Product Variable Binding
  and the Representation of Symbolic Structures in Connectionist Systems
Paul Smolensky
1990


# Abstract

* [csak kis részét értem]
* tensor product representation, is defined for the
  * connectionist representation of value~variable bindings
* The representation
  * rests on a principled analysis of structure
  * saturates gracefully as larger structures are represented
  * permits recursive construction of complex representations from simpler ones
  * respects ...  multiple bindings in parallel
  * extends naturally to continuous structures and representational patterns
  * permits values to also serve as variables
  * enables analysis of the interference of symbolic structures stored
  * the basis for working connectionist models of high-level cognitive tasks

# I. Introduction

* Connectionist models rely on parallel numerical computation rather than the
  * serial symbolic computation of traditional AI models
  * [some] argue that ... connectionist models should just be viewed as
    implementations of symbolic systems
  * I [argue that] connectionist models may well offer an opportunity to
    * escape the brittleness of symbolic AI systems
    * develop more human-like intelligent systems--but
    * only if we can find ways of naturally instantiating the sources of power
      of symbolic computation within fully connectionist systems
    * connectionist approach: an excellent opportunity for formally capturing
      the subtlety, robustness, and flexibility of human cognition, and for
      elucidating the neural underpinnings of intelligence
    * symbolic approach: tremendous insights into the nature of the problems
      that must be solved in creating intelligent systems, and of techniques
      for solving these problems; the true capacity of human intelligence
    * If we use connectionist systems merely to implement symbolic systems, we
      might get AI systems that are faster and more tolerant of hardware
      faults, but they will be just as brittle
* The present paper is part of an effort to
  * extend the connectionist framework to naturally incorporate the ingredients
    essential to the power of symbolic computation, without losing the virtues
    of connectionist computation
  * integrate, in an intimate collaboration, the
    discrete mathematics of symbolic computation and the
    continuous mathematics of connectionist computation
* language
  * object like a phrase-structure tree----or even a simple sequence of words
  * problem can be traced back to ... operation of binding a value to a variable
* where the research reported here fits into ... connectionist AI
  * components must be put together in constructing a model
    * representing Elements of the task domain
    * network architecture
    * processing algorithm
    * If the knowledge in the model is to be provided by the designer, a set of
      connections must be designed to perform the task
    * If ... learning, a learning algorithm ... and a training set must
  * For most of these aspects ..., there exists considerable formal literature
  * exception: the representation component.  This is a crucial component
    * particularly ... to understanding the relation between connectionist
      and symbolic computation
* the [representation problem is] amenable to formal analysis
  * In this paper the problem will be characterized as finding a mapping from a
    set of structured objects (e.g. trees) to a vector space
  * mélange of discrete and continuous mathematics
  * reminiscent of a related classical area of mathematics:
    * representing abstract groups as collections of linear operators on a
      vector space
    * discrete [group theory and the continuous] vector space theory interact
    * with its application to quantum physics, in fact offers a useful analogy
      * elementary particles involve a discrete set of particle species [which]
        exhibit many symmetries, ..., that are described by group theory. Yet
      * underlying elementary particle state spaces are continuous
  * human language processing, the
    * discrete symbolic structures that describe linguistic objects are actually
    * imbedded in a continuous connectionist system that operates on them with
      flexible, robust processes that can only be approximated by discrete
* structures ... will be referred to as symbolic structures, because the
  principal cases of interest will be objects like strings and trees
  * however, the analysis presented here is of structured objects in general;
    it applies equally well to objects like images and speech trains

## 1.1 Distributed representation and variable binding in connectionist systems

* why natural connectionist representation of structured objects is a problem
  * I list several properties of the solution to this problem that is presented
    in this paper
* fully distributed representation: each output [neuron] participates in the
  representation of many different outputs
  * At the opposite end [are local] in two senses
    * Most obviously, [one-hot encoding]
    * activity representing different letter positions ["pool"] are all
      disjoint: each
    * Each pool can be viewed as a slot in the structure: a variable
    * The value of each variable is a pattern of activity residing in its pool
      of units
* In the tensor product representation, both the variables and the values can
  be arbitrarily nonlocal, enabling (but not requiring) representations in
  which every unit is part of the representation of every constituent in the
  structure
* Features of the tensor product representation,
  most of which distinguish it from existing representations
  * The representation rests on a principled and general analysis of structure:
    role decomposition (Section 2.2.1)
  * A fully distributed representation of a structured object is built from
    distributed representations of both the structure's constituents and the
    structure's roles (Section 2.2.4)
  * Nearly all previous connectionist representations of structured data, em-
    ploying varying degrees of localization, are special cases (Section 2.3)
  * If a structure does not saturate the capacity of a connectionist network
    that represents it, the _components_ of the structure can be
    extracted with complete accuracy (Section 3.1)
  * Structures of _unbounded_ size can be represented in a fixed connectionist
    network, and the representation will saturate gracefully (Section 3.2)
  * The representation applies to continuous structures and to infinite networks
    as naturally as to the discrete and finite cases (Section 3.3)
  * The binding operations can be simply _performed_ in a connectionist network
    (Section 3.4)
  * The representation respects the independence of two aspects of parallelism
    in variable binding: generating vs. maintaining bindings (Section 4.1)
  * The constituents of structure can be simply extracted in a connectionist
    network (Section 3.4.2)
  * A value bound to one variable can itself be used as a variable (Sec 3.6)
  * The representation can be used recursively, and connectionist representa-
    tions of operations on symbolic structures, and recursive data types, can
    be naturally analyzed (Section 3.7)
  * Retrieval of representations of structured data stored in connectionist
    memories can be formally analyzed (Section 3.8)
  * A general sense of optimality for activity patterns representing roles in
    structures can be defined and analyzed (Section 3.9)
  * A connectionist "recirculation" learning algorithm can be derived for
    finding these optimal representations (Section 3.9)

## 1.2 Connectionist representation of symbolic structures 7

* I respond to the possible connectionist criticism that it is misguided to even
  try to solve this problem 
* the issue [of representation in connectionist systems of symbolic structures]
  figures prominently in the argument of Fodor and Pylyshyn (1988) that
  connectionist models are inadequate on fundamental representational grounds,
  and the work reported here began as a response to this attack; for responses
  to Fodor and Pylyshyn based in part on the work reported here, see [40, 42]
* A more concrete motivation for pursuing this issue are the 
  challenges facing connectionist modeling of higher cognitive processes such as
  language. Here our central question takes the form: What are computationally
  adequate connectionist representations of strings, trees, sentences?
* This section is addressed to connectionists who may find this question
  misguided
* The essence of the connectionist approach, they might say, is to expunge
  symbolic structures from models of the mind
* A reasonable starting point would seem to be to take linguistic analysis of
  the structure of linguistic objects seriously, and to find a way of
  representing this structure in a connectionist system: trees and strings, it
  is important to find adequate connectionist representations of these symbolic
  structures
* new connectionist representations of linguistic structures ... will rest on
  prior understanding of connectionist representations of existing symbolic
  descriptions of linguistic structure
* The importance [of representing linguistic structures beyond] NLP
  * basis for connectionist models of conscious, serial, rule-guided behavior
  * modeled as explicit (connectionist) retrieval and interpretation of
    linguistically structured rules. Adequate connectionist models of such
    behavior are important for connectionist models of higher thought processes 
* One line of thought: analyses of connectionist representations of symbolic
  structures are unnecessary. The argument goes something like this. Just as a
  child somehow learns to internally represent sentences with no explicit
  instruction on how to do so, so a connectionist system with the right
  learning rule will somehow learn the appropriate internal representations
  * The problem of linguistic representation is not to be solved by a
    connectionist theorist but rather a connectionist network 
* In response to this argument I have five points
  1. In the short term, at least, our learning rules and network simulators do
     not seem powerful enough
  2. we will still need to explain how the representation is done
  3. build bridges as soon as possible between ... accounts of language;
    the problem is just too difficult to start all over again from scratch
  4. to experiment now with connectionist learning [of rather complex] skills
     (e.g. parsing, anaphoric resolution, and semantic interpretation, all in
     complex sentences)
     connectionist representation ... to serve as inputs and outputs. We want to
     * study the learning of the operations [without waiting] for the completion
       of the study of the learning of the linguistic representations
  5.
    * Language is 
      * more than just a domain for building models, it is 
      * a foundation on which the entire traditional theory of computation rests.
    * crucial: how the basic concepts of symbolic computation and _formal_
      language theory relate to connectionist computation 
* The semantic processing of a connectionist representation of a parse tree
  should not be performed by a connectionist implementation of serially
  applied symbolic rules that manipulate the tree
* The view behind the present research is
  * not that mental operations are always serial symbol manipulations
  * that the information processed often has useful symbolic descriptions

## 1.3 I outline the rest of the paper

# 2. Connectionist Representation and Tensor Product Binding: Defs and Exmps 9

* the notion of connectionist representation is formally defined
* the tensor product representation is constructed
* Examples are considered
* special cases that reduce to previous connectionist representations

# 3 Tensor Product Representation: Properties 27

* properties are proved and several extensions discussed
* The connectionist representation of symbolic operations is defined, and
  examples for strings and trees are considered
* Retrieval of symbolic structures represented in connectionist memories by
  the tensor product representation is analyzed
* Finally, work reported elsewhere is briefly summarized concerning a sense of
  optimality for patterns representing roles in structures, and a connectionist
  "recirculation" algorithm for learning these optimal representations

## 3.9. Learning optimal role representations

# 4 Summary and conclusion 54
