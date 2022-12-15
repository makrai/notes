Jerry R. Hobbs
2008
Deep Lexical Semantics

# Abstract

* we have
  * taken a basic core of about 5000 [most frequent] synsets in WordNet
  * categorized these into sixteen broad categories
    e.g. time, space, scalar notions, composite entities, and event structure
  * sketched out the structure of some of the underlying abstract core theories
    of commonsense knowledge, including those for the mentioned areas
    * the basic predicates in terms of which the most common word senses need
      to be defined or characterized
    * axioms that link the word senses to the core theories
    * a kind of “advanced lexical decomposition”, where the “primitives” into
      which words are “decomposed” are elements in coherently worked-out
      theories
* In this paper we focus on our work on the 450 of these synsets that are
  concerned with _events_ and their structure

# 1 Intro

* must have
  * underlying theories
  * axioms that link these to words
  * This includes domain-dependent knowledge, of course, but 70-80% of the
    words in most texts, even technical texts, are words in _ordinary_ English
* a core theory of _scales_ will provide axioms involving predicates such as
  `scale`, `<`, `subscale`, `top`, `bottom`, and `at`. These are
  * abstract notions that apply to partial orderings
    as diverse as heights, money, and degrees of happiness
* automatic acquisition of relevant lexical and world knowledge Pantel [8]
  * e.g. the correlation between “married” and “divorced”, and maybe we can even
  * the corresponding predicate-argument structures and
  * which way the implication goes and with what
  * temporal constraints
  * But this is a too simple relation to axiomatize in comparison to the “range”
* If we construct the core theories and the linking axioms _manually_, we can
  achieve the desired complexity and reliability
  * how many words would It be feasible to axiomatize the meanings of manually?
    * 100,000 not, several thousand yes
* organization
  * Section 2 describes previous work in
    * identifying a “core WordNet” and
    * classify the words in various ways
    * 446 words with senses that are primarily focused on events, abstractly
  * Section 3 we describe several of the core theories
    * that are crucial in characterizing _event_ words, including
    * composite entities, scales, change, and causality
  * Section 4
    * linking WordNet and FrameNet word senses to each other [and] to the core
      theories
    * Not only are the words “decomposed” into what were once called primitives,
      * the primitives are explicated in axiomatic theories,
        enabling one to reason

# 2 Identifying the Core Event Words

* the Princeton WordNet group has compiled a CoreWordNet, consisting of 4,979
  synsets that express frequent and salient concepts
  1. a list with the most frequent strings from the British National Corpus was
     automatically compiled and all WordNet synsets for these strings were
     pulled out
  2. two raters determined which of the senses of these strings expressed
     “salient” concepts ([3])
  * nouns, verbs and adjectives + adverbs
* We classified these word senses manually into sixteen broad categories,
  listed here with rough descriptions and lists of sample words
  * to group together _words that need to be defined or characterized together_
    if a coherent theory is to result

# 3 Some Core Theories

* The theories differ from other commonsense knowledge bases, such as Cyc [4]
  or SUMO [7], primarily in the abstract character and linguistic motivation of
  the knowledge
  * SUMO
  Niles, I., Pease, A.:
  Toward a Standard Upper Ontology,
  in Proc Formal Ontology in Information Systems (FOIS-2001)
* theories
  * Eventualities and their Structure
    * states or events
  * Set Theory
    * in a standard fashion,
  * Composite Entities
    * The predicate `partOf` is a very broad notion
      covering among other relations the componentOf relation
    * the figure-ground relation `at`
  * Scales
    * partial orderings, monotone functions, the construction of
      composite scales, the characterization of qualitatively
      high and low regions of a scale (related to distributions and
      functionality), and constraints on vague scales
  * Change of State
  * Cause
    * We characterize a causal complex for an effect by two strict properties:
      * If every eventuality in a causal complex happens, the effect happens,
      * everything in the causal complex is _relevent_ to the effect in a way
        that can be made precise
    * enable, prevent, help, and obstruct
      * There are also treatments of
        attempts, success, failure, ability, and difficulty
  * Events
    * changes of state and causality compose into more complex events,
      * conditional, iterative, cyclic, and periodic events, and is
      * linked with several well-developed ontologies for event structure,
        e.g., PSL ([2])
* other core theories that have been constructed include
  * a well-developed theory of _time_,
  * a rather sparse theory of _space_, and
  * a large number of theories explicating a commonsense theory of _cognition_

# 4 Some Word Senses Linked to Core Theories

* have p7
  * the predicate `possess` would be explicated in a commonsense theory of
    economics,
* _remain_

# 5 Summary

* we have identified the words which because of their frequency are most
  demanding of explication in terms of the inferences they trigger
