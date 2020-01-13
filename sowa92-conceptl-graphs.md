Conceptual graphs as a universal knowledge representation
John F. Sowa
1992 Computers Math. Applic

# Abstract

* Conceptual graphs are a knowledge representation language designed as a
  synthesis of several different traditions
  * semantic networks ... used in machine translation and computational ling
  * logic-based techniques of unification, lambda calculus, and Peirce's
    existential graphs
  * linguistic research based on Tesniere's dependency graphs and various forms
    of case grammar and thematic relations
  * dataflow diagrams and Petri nets, which provide a computational mechhanism
    for relating conceptual graphs to _external procedures_ and databases
* The result is a
  * highly expressive system of logic with a
  * direct mapping to and from natural languages. The
  * lambda calculus supports the definitions for a taxonomic system and
    provides a general mechanism for restructuring knowledge bases
  * CGs can be used as an intermediate stage between natural languages and the
    rules and frames of _expert systems_, an important feature for _knowledge
    acquisition_ and for help and explanations
* applied to almost every aspect of AI,
  * [in] the past five years
  * expert systems, natural language, computer vision, neural networks
* This paper surveys conceptual graphs, their development from each of these
  traditions, and the applications based on them

# 1. A common framework for AI

* Natural languages set the standard for flexibility and expressive power
* Symbolic logic sets the standard for precision and generality in formal
  systems
* topics
  * Natural language: parsing, generation, discourse analysis, text generation,
    tense and aspect, lexical choice, contexts, metaphor, analogies, thematic
    relations, and machine translation
  * Logic and reasoning: inference engines, inheritance theory, truth
    maintenance, induction, modality, uncertainty, plausible reasoning, and
    reasoning about sets and numeric quantitiers
  * Knowledge engineering: knowledge acquisition, machine learning, extracting
    knowledge from texts, requirements analysis, systems analysis, database
    design, and semantic data models
  * Hybrid systems: 
    * conceptual programming, 
    * logic programming with conceptual graphs, and 
    * pattern recognizers that combine neural networks with conceptual graphs
  * Applications: expert systems, information retrieval, intelligent help,
    computer vision, robotics, computer-integrated manufacturing, and
    communication in distributed systems
* scruflies and neats. For the
  * neats, CGs are a system of logic with a model-theoretic semantics. For the
  * scruffies, CGs are data structures that can be manipulated with the
    heuristic techniques of AI
* organization
  2. sources of conceptual graphs in both the scruffy and the neat traditions
  3. examples of the graphs and their 
    * relationship to frames, predicate calculus, and other systems
  4. applications of CGs that have been implemented in the last five years

# 2. Foundations of conceptual graphs P3

* The box and circle notation for conceptual graphs was invented by John Sowa
* In 1882, [Peirce] had developed his relational graphs,
* discourse representation structures by Hans Kamp (1981)
* Lucien Tesniere (1959) developed graph structures for his system of
  _dependency grammar_
* For over 20 years, Igor Mel'čuk [4]: lexical patterns in Russian and French
* For computational linguistics, David Hays [5] adopted them and influenced
* Roger Schank, who shifted the emphasis from syntactic dependencies to
  conceptual dependencies [6]
* graphs by Tesniere, Hays, Schank, and Melčuk are at the same logical level
  as Peirce's relational graphs of 1882 ...  By combining [Peirce's]
  contexts with the dependency graphs, conceptual graphs ... provide a
  formalism that can represent Schank's scripts [7] and memory organization
  packets [8]
* Tesniere concentrated on the syntactic relations between words and phrases,
  but he did not distinguish the different kinds of semantic relations
  * Tom built a house
  * He owned the house
  * He liked the house
  * He sold the house
* Syntactically, these four sentences have the same subject-verb-object
  pattern.  Semantically, however, the underlying relations are very different
  Building and selling are `actions`, whose subjects are `agents`; but owning
  and liking are `states`, which do not have agents. Since liking is a `mental
  state`, its subject would be an `experiencer`. Since owning is a legal state,
  its subject is merely in a state of ownership. Since the object of building
  does not exist until after the action is performed, it is the `result` of the
  action. But for the other verbs, the object is a passive participant that
  exists before the action or state; it is usually called the `patient`. To
  distinguish these semantic relations, the arcs on the graphs should be
  labeled with agent and palient or their abbreviations AGNT and PTNT
* Ceccato (1964) [9] labeled the arcs with 56 different relation types. Besides
  the linguistic relations, he included time and place relations and structural
  relations like part-whole or element-collection. Although Ceccato was
  * the first to implement a graph system with labeled relations, he
  * mixed the low-level linguistic relations with more complex relations such
    as puller to thing pulled. 
* linguists Fillmore [10] and Gruber [11] later 
  * analyzed the relations in greater depth
  * case roles or thematic relations
* High-level relations are especially common in expert systems
  * rules and frames tend to use complex relations 
    * e.g. original-cost-in-US-dollars or number-of-loading-cycles
* Alan Robinson's unification algorithm for theorem proving [16] 
  * a general and elegant form of pattern matching that 
  * was adapted to graph unification as the maximal join algorithm [17]
* Besides the ability to represent logic and language, a computational system
  requires links to other computer facilities and the _outside world_. Those are
  provided by actor nodes attached to conceptual graphs. They are associated
  with external procedures and database relations, which may be triggered by a
  marker passing algorithm inspired by Petri nets [18]
* the first version of conceptual graphs was developed in 1968 as a term paper
  for Marvin Minsky's course on AI at MIT. It introduced the box and circle
  notation with nested boxes for subordinate clauses in English. The only two
  graph influences on that system were Quillian [19] and Hays [5]
* Since Roger Schank has always eschewed formalism, his work has not
  contributed any formal features to the conceptual graphs. However, his
  research has had a strong influence on the way the graphs are used to support
  AI applications: Schank and his students are second only to Peirce in the
  number of references in the index of Conceptual Structures
* To show conceptual relations, Schank's graphs [22] have various kinds of
  arrows instead of labeled circles

# 3. Examples of conceptual graphs 6

# 4. Applications of conceptual graphs 13
