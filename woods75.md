W. A. Woods
What's in a link
1975

# I. Introduction

* This paper in concerned with the theoretical underpinnings of network
  representations, of the sort dealt with by Quillian [1966,1969], Rumelhart,
  Lindsay, Norman [1972], Carbonell & Collins [1973], Schank [1975], Simmons
  [1973], etc
* semantics of the semantic network structures
* intended meanings for various types of arcs and links, the choosing
  conventions for representing facts, problems of relative clauses and
  quantification
* currently no "theory"
* many of the techniques used in existing semantic networks are inadequate
  * representing propositions without to asserting their truth or belief
  * intensional objects
  * restrictive relative clauses
* three adequate mechanisms
* no complete specification of the semantic network

# II. What is Semantics

* distinction between syntax and semantics?
* is inference and "thought" part of semantics?
## The Philosopher and the Linguist
* linguist: from sentence to representation
  * ambiguity
* philosopher: from representation to truth value
  * notation is already unambiguous
## Procedural Semantics
* logicians and philosophers ... fall down on the specification of the
  semantics of the basic "atomic" propositions
* [the notion of procedural semantics] has served as the basis of several
  computer question-answering systems [Woods, Kaplan and Mash-Webber, 1972;
  Woods, 1973b; Winograd, 1972]
## Semantic Specification of Natural Language
* representing the meanings of sentences inside the brain that is not merely a
  direct encoding of the English word sequence
  * among other [things], disambiguation
  * _semantic interpretation_
## Misconceptions about Semantics
* me: semantics is "the scientific study of the _relations_ between signs or
  symbols and what they denote or mean."
* One common misuse: [to cover] retrieval and inference, "semantic inferences"
* opposite extreme: syntax vs semantics distinction in arbitrary
  * select among different parses, selectional restrictions on so-called
    semantic features
* systems which do not extend beyond the production of a so-called semantic
  representation, there may or may not be a semantic component included, and
  the justification calling something semantic may be lost
## Semantics of Programming Languages
* the use of the term semantics by programming language theorists has been much
  closer to the tradition of the logicians and the philosophers and less
  confused than in computational linguistics

# III. Semantics and Semantic Networks

* The major characteristic of the semantic networks [as opposed to other
  formalisms] is the ... notion of a link or pointer
  * model the associative connections [by] humans
## Requirements for a Semantic Representation
* precisely, formally, and unambiguously, logical adequacy
* there must be an algorithm for analysys and 
  one for subsequent inferences and deductions
## The Canonical Form Myth
* two
  1. it is unlikely that there could [be] a canonical form for English
  2. for independent reasons, in order to duplicate human behavior in
     paraphrasing, one would still need all of the inferential machinery that
     canonical forms attempt to avoid
  * in most cases where one is interested in some paraphrase behavior, the
    paraphrase desired is not one of full logical equivalence, but only of
    implication in one direction
* There is still benefit from "partially canonicalizing"
* uncle: father or mother?
  * we must make provision for storing such predicates directly
## Semantics of Semantic Network Notations
* types of nodes and links that can be used and the rules for their possible
  combinations + what is meant by them
## Intensions and Extensions
## The Need for Intensional Representation
## Attributes and "Values"
* One way of thinking of these pairs is that the attribute name is the name of
  a "link"
* the value may itself be a predicate
* defining and asserted properties of the node
## Links and Predication
* what the link itself means [in relation on attribute-value structure]
* Many people, however, have used the same mechanism and notation (and even
  called it attribute-value pairs) to represent arbitrary English verbs by
  storing a sentence such as "John hit Mary" as a link named HIT
* `height of equals`
## Relations of More than Two Arguments
* such as the English preposition "between"
`Y LOCATION (BETWEEN X Z)`
* what is (BETWEEN X Z)? one place or range?
* finding a natural binary decomposition for sentences such as "John sold Mary
  a book" (or any of Schank's various TRANS operations) is unlikely
## Case Representations in Semantic Networks
* When [agt/rec/pat] notation is applied to network representations, a major
  restructuring of the network and what it means to be a link takes place
* the asserted fact [(action)] is itself a node
    * structure might look something like:
    ```
    SELL
        AGT     John
        RECIP   Mary
        PAT     book
    ```
* In our previous examples, the first item (holding the position where we have
  `sell` above) has been the unique name or "handle" on a node and the
  remaining link-value pairs have been predicates that are true of this node
  In the case above ... a description of a particular instance of selling
  (`S13472`)
## Assertional and Structural Links
* case structure
* nodes such as S13472 which represent assertions or facts
* S13472 has no meaning other than that which we establish by virtue of the
  structural links
* part of the problem that we cited earlier in trying to determine whether a
  structure such as:
  ```
  N123C8
    SUPERC  telephone
    MOD     black
  ```

  is to be interpreted as an intensional representation of a black telephone or
  an assertion that telephones are black

# IV. Problems in Knowledge Representation

* In the remainder of this paper, I would like to discuss
  * two difficult problems of KR
    * restrictive relative clauses and
    * quantified information
  * illustrate 
    * additional possible uses of links and
    * different types of nodes and links
## Relative Clauses
### 1.1. The Shared Subpart Fallacy
  * fallacy: to simply take the two propositions involved, the main clause and
    the relative clause, and represent the two separately as if they were
    independent propositions
### 1.2. The Transient-Process "Account"
  * Quillian [personal communication]: a portion of what was in an input sentence
    [is] _stage directions_ to enable the underpinning process to identify
    * an appropriate internal concept or node and
    * the rest ... as new information to be added somehow to the network
  * relative clause: do not add anything to the network at all but determine
    which dog
  * argument[s] against the transient process account:
    1. it evades the issue of representing the meaning of the sentence,
      focusing instead on the resulting change in memory contents
      * What about a situation when I read this sentence out of context and I
        haven't heard about the dog before?
      * solution with EGO link
    2. something needs to be extracted from the input sentence which describes
       the node to be searched for ... the process must know 
       * when it finds an instance 
       * that it is the dog that is of interest and not the man
    3. not an account at all, but merely a way of avoiding the problem
  * én _discourse dinamics_-nek mondanám. De talán az NP ''csoport''-hoz is
    érdekes lehet a következő szakasszal együtt
## Representation of Complex Sentences
* whether one needs a representation of the whole sentence
## Definite and Indefinite Entities
* [when] we had to infer the existence of a ... dog because we found no
  referent for "the dog that bit the man"
* it is a particular dog and not a class of dogs
* [existentioal] presupposition of ... determiner[s] in questions
* nodes corresponding to not necessarily existing objects: a new type
* arguments for intensional nodes
  * a new definite node gets created, it may in fact stand for the same object
    as some other that already exists, but the necessary information to
    [identify it] may only come later
  * verbs such as "need" and "want"
## Consequences of Intensional Nodes
* how we decide for particular sentences which type to create (intensional or
  not)
## Functions and Predicates
* szelekciós megszorítás és jelentés közötti különbség
* some explicit indication ... that the two nodes are of different types
## Representing Quantified Expressions
* simply tagging the quantifier onto the noun phrase [is] inadequate
  * unfortunately it is the most used in implemented semantic networks
* scope
* three nodes for _three lookouts_?
### 6.1. Quantifiers as Higher Operators
* two people [who suggest a] logically adequate treatment of quantifiers
  * Shapiro [1971b]
    * breaks up the chains of connections from node to node
  * Martin Kay
### 6,2. Other Possible Representations
1. "Skolem function method"
  * Kay [1973]
  * mechanical theorem proving and certain branches of formal logic ...
   a pivotal technique in resolution theorem proving
  * [in] natural language quantification ... the quantification operation
    implicitly determines a real function of exactly this sort,
    * implicit function [referenced by] pronouns outside the scope of the
      original quantifier
      * _Is there someone here from Virginia? If of I have a prize for him_
 * including with every existentially quantified object a link which points to
   all of the universally quantified objects on which this one depends
 * negation involves a complex operation
2. "lamdda abstraction method,"
  * [geleralized quantifiers]
  * a node type of a predicate defined by the lambda operator,

# V. Conclusion

* representation of propositionios whithout commitment to asserting their truth
* intensional descriptions of objects without commitment to their external
  existence/distinctness,
* representation without commitment to covering all existing things
* quantification
* other problems such as the representation of mass terms, adverbial
  modification, issues of probabilistic information, degrees of certainty, time
  and tense
