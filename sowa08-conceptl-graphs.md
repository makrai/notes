John F. Sowa
Conceptual Graphs p239
2008
Chapter 5 of Handbook of Knowledge Representation
  Edited by F. van Harmelen, V.  Lifschitz and B. Porter

#Abstract

A conceptual graph (CG) is a graph representation for logic
  * based on the
   * semantic networks of artificial intelligence and the
   * existential graphs of Charles Sanders Peirce
 * Several versions of CGs have been designed and implemented
   * typeless core CGs, which correspond to Peirce’s original existential
    graphs
    * More common are the _extended_ CGs, which are a typed superset of the core
    * research CGs have explored novel techniques for reasoning, knowledge
      representation, and natural language semantics
  * standard
    * the core and extended CGs is defined by a formal mapping to and from
      the ISO standard for Common Logic, but the
    * research CGs are defined by a variety of formal and informal extensions
* This article surveys the notation, applications, and reasoning methods used
  with CGs and their mapping to and from other versions of logic

#5.1 From Existential Graphs to Conceptual Graphs

* early graph-based semantic representations
  * semantic network (Masterman), which included a lattice of concept types
  *  correlational nets (Ceccato) were based on 56 different relations,
     including subtype, instance, part-whole, case relations, kinship
     relations, and various kinds of attributes; and David [15] presented
  * dependency graphs (Hays) formalized the notation developed by the linguist
     Lucien Tesnière [40]
  * critiques of their logical weaknesses: Woods [42] and McDermott [22]
* Sowa [32] developed a version of conceptual graphs
  * rectangles are called concepts, and the circles are [dependency] relations
  * typed or sorted version of logic. Each of the four concepts has a
    * Person, Go, Boston, or Bus. Two of the concepts have names
    * type label that represents the type of relation: agent (Agnt),...
* FOL translation: only logical operators used in Fig. 5.1 are conjunction
  and the existential quantifier
  * many of the early semantic networks could not represent any others
* representing full first-order logic,
  * Begriffsschrift (concept writing), Frege
    * tree notation
    * four operators: assertion, negation, implication, and the universal quantifier
  * Peirce
    * developed the algebraic notation for first-order logic as a
      generalization of the Boolean operators
    * began to experiment with relational graphs for representing logic,
    * like the AI researchers of the 1960s, he could not find a good way of
      expressing the scope of quantifiers and negation
    * 1897, however, he discovered a simple, but brilliant innovation for his
      new version of existential graphs
    * Sowa [33] adopted Peirce’s convention for CGs, but...
* Kamp [18] to develop discourse representation structures (DRSs) whose logical
  structure is isomorphic to Peirce’s existential graphs
  * discourse and formulating the rules for interpreting anaphoric references,
* event or state expressed by a verb is also an entity that could be referenced
  by a quantified variable. That point was independently rediscovered by
  linguists, computational linguists, and philosophers such as Davidson [6]

#5.2 Common Logic p244

#5.3 Reasoning with Graphs

#5.4 Propositions, Situations, and Metalanguage

#5.5 Research Extensions
