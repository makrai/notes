Prószéky bírálata:

> Schank (1973) fogalmi hálójáról, amiben pedig megjelenik az a többi
> szemantikus hálóra kevésbé emlékeztető mozzanat, hogy a fogalmi világ meg-
> gondolásait előtérbe helyezve olykor nyelvészeti szempontból különböző elemek
> kerülnek összevonásra és egységes kezelésre (így jön létre a csak Schank
> elméletére jellemző 11 igeosztály). A 4lang-modellben is megjelenik a
> különböző (szófaji) osztályok összevonása, csak itt egyes nyelvi elemek
> helyett a fogalmi hierarchia egy-egy magasabb csomópontja jelenik meg, vagy
> például a szófajokra jellemző szintaktikai különbségek eliminálásra kerülnek

* A Findler-kötetben idézve
  * Schank (el al) 1973
  [Schank, R. C. 1973a]. The conceptual analysis of natural language
  [Schank, R. C , 1973]. Identification of conceptualizations underlying natural lang
  [Schank, R. C , 1973]. The Fourteen Primitive Actions and Their Inferences
  * Schanktól cikk (nem könyv)
  2x [Schank, R. C , 1973]. The conceptual analysis of natural language. In Natural
  2x [Schank, R. C , 1973]. Identification of conceptualizations underlying natural lang
  4x [Schank, R. C , 1975]. The structure of episodes in memory. In Representation and ­
  1x [Schank, R., 1975]. Using knowledge to understand. In Theoretical Issues in Natural
  * What is a frame anyway?

Inference and the computer understanding of natural language
Roger C. Schank and Charles J. Rieger 111
1973 Stanford University, DARPA

#Abstract

* inference mechanisms designed to function in a language-free deep conceptual
  base (Conceptual Dependency) + The conceptual analysis of a natural
  language sentence into this conceptual base,

#I. INTRODUCTION

* the notion of inference and how it differs from logical deductions (for
  instance in a theorem-prover or question answerer)
  * The intent of inference-making is to "fill out" a situation with is
    alluded by an utterance ... in hopes of tying pieces of information
    together to determine such things as _feasibility, causality and intent_ of
    the utterance
  * features [distinguishing an inference] from a formal deduction:
  1. ..
  2. An inference is not necessarily a logically valid deduction.  A good
     example of this  is called _affirmation of the consequent_
  3. an inference is not necessarily true, for this reason, it is useful for a
     memory to retain and propagate measures of the degree to which a piece of
     information is likely to be true. Memory must also be designed with the
     idea that no information is inviolably true
  4. undirected
    * deductions are highly directed in the sense that a well-defined goal has
      been established, and a path from some starting conditions (axioms and
      theorems) to this goal is desired
    * Inferences on the other hand are generally made "to see what they can
      see"
  * make an inference, then test to see whether it looks similar, identical to,
    or contradicts some other piece of information in the system, When one
    of these situations occur, memory takes special action in the form of
    discontinuing a line of inferencing, asking a question, revising old
    information, creating causal relationships, or invoking a belief pattern
  * [mechanism] for altering the credibility of a piece of information when the
    credibility of some piece of information which was used in its generation
    changes

#II. INFERENCE AND PARSING 4

* we shall disregard any discussion of syntactic parsing [as there are
  computer programs that] go directly from an input sentence into a meaning
  representation
  4. Riesbeck, C.. 'Computer Analysis of Natural Language ; n Context', Ph.D
     thesis. Computer Science Dept., Stanford University, Stanford, Cal. 1973
     {forthcoming)
  5. Schank, R., 'Conceptual Dependency: A Theory of Natural Language
     Understanding" in Cognitive t ive Psychology vol 3 no A October 1972
  9. Uilks, Y., 'An Artificial Intelligence Approach to Machine Translation',
     in Computer Models of Thought and Language. R. Schank* and K. Colby (eds),
     U.H. Freeman & Co., San Francisco 1973
* It is necessary for a meaning representation to contain each and every
  concept and conceptual relation that is explicitly or implicitly referred to
  by the sentence being considered
  * explicit reference: the concepts that underlie a given word
  _(5) John bought a book._
  * in (3) we have the word 'bought' which implicitly references two actions of
    transfer, one whose object is the book and the other whose object is some
    valuable entity. Most hearers of (5), unless specifically told otherwise,
    will definitely assume that this object is 'money'
  * parsing: extraction of explicit and implicit information
  * inference: the adding-on of probably correct information
  * The word 'buy' has a number of senses ..., but the surrounding information
    disambiguates 'buy' so that in (5) it can only mean that
    * two actions of transfer (hence called ATRANS) occurred, an actor did the
      ATRANSing; there was an object acted upon, and there was a recipient and
      a donor of this object
  * LINGUISTIC-INFERENCE: when in the absence of specific information to the
    contrary, a given word or syntactic construction can be taken to mean
    that a specific but unmentioned object is present _in a predicted case for
    a given ACT_
    * these are consequences of words
    * more common example: drink -> alcoholic
    * a property of quite a few languages ... not [that of the] concept
      underlying 'drink'. [Most languages] share common cultural associations
    * instrument of _hit_
    * information that is used for making the decisions involved in these
      processes is contained in the particular language
    * [from now on]: inference that come from world knowledge

#III. THE FOURTEEN PRIMITIVE ACTIONS 9

* a syntax of possible conceptual relationships and 
  a set of conceptual categories that these relate
* six conceptual categories

|   |                     |
|---|---------------------|
|PP	|real world object	  |
|ACT|real world actions	  |
|PA	|attribute of objects	|
|AA	|attribute of actions	|
|T	|time	                |
|LOC|location             |

* sixteen conceptual [relation] rules
* tense: modifications of the ... link
* ACT _hurt_: action unstated, only effect known
* set of only fourteen primitive actions
* any given verb is mapped into a conceptual construction that may use one or
  more of the primitive ACTs in certain specified relationships plus other
  object and states
* task of the primitives to conjoin similar information so that inference rules
  need not be written for every individual surface verb but for the ACTs

|---------|-----------------------------------------------------------|
|ATRANS		| The transfer of an abstract relationship
              such as possession, ownership, or control	              |
|PTRANS		| The transfer of physical location of an object	          |
|PROPEL		| The application of a physical force to an object	        |
|MOVE		  | The movement of a body-part of an animal	                |
|GRASP		| The grasping of an object by an actor	                    |
|INGEST		| The taking in of an object by an animal                   |
|EXPEL		| The expulsion from the body of an animal into the world
|MTRANS		| The transfer of mental information between animals or
            within an animal.  We partition memory into CP (conscious
            processor), LTD (long-term memory), and sense organs
            MTRANSing takes place between these mental locations      |
|CONC		  | The conceptualizing, thinking about an idea by an animal	|
|MBUILD		| The construction by an animal of new information from old
              information	                                            |
|SMELL		| The action of directing ones nose towards an odor	        |
|SPEAK		| The action of producing sounds from the mouth	            |
|LOOK-AT	| The directing of one's eyes towards an object	            |
|LISTEN-TO| The directing of one's ears towards an object	            |

* Case
  1. There are four conceptual cases:
    OBJECTIVE.  RECIPIENT, DIRECTIVE, INSTRUMENTAL
  2. Each ACT takes from two to three of these cases none optional!y
  3. Instrumental case is itself a complete conceptualization involving an ACT
     and its cases
  4. Only animate objects may serve as actors except for PROPEL

#IV. LANGUAGE-FREE INFERENCES 15

(13) John told Mary that he wants a book
(14) John likes chocolate
* people usually want books because they want to MTRANS,
  people normally like chocolate because they like to INGEST it
  * hearers will not remember whether the ACTs were explicit
* inference during or after the establishment of the representation:
  analyzer resp. memory
* infer effect: hit -> health diminished, eat -> not exist
* infer the reasons for a given action
  (20) John hit Mary
  (21) John took an aspirin
  (22) John flattered Harry
* belief pattern: a sequence of causally-related ACTs and states that are
  shared by many speakers within a culture
* naive ethics/law
* Instrumental-INFERENCE, list of instrumental ACTs for the primitive ACTs
* two sentences that occur in sequence have additional inferences together
  which they would not have separately
* CAUSALITY-]INFERENCE is present if two sentences are connected by an _and_ or
  by their appearing in sequence. Then if one could have caused the other, it
  can be inferred that that is what happened
* INTENTION-INFERENCE

#V. OBSERVATIONS 29

#VI. THE Program 30

* The internally stored form of a proposition is called a bond, and is stored
  as a single entity under a LISP generated atom (superatom)
* superatoms have _strenght_, _mode_, _truth_, _reasons_ (set of superatoms
  which participated in the generation of this proposition), _offspring_, and
  _recency_
* tasks p33/39
  * establish referents of all concepts
  * data bank
  * ..
  * answer 'who', 'whether', 'when' and 'why' type questions
* sub-proposition: info conveyed purely by analyzer-initiated inference
  * explicit-focused, explicit-peripheral, or implicit p36/42

#APPENDIX A: Computer EXAMPLES 45
#APPENDIX B: INFERENCE AND REFERENCE ESTABLISHMENT ... 57
#REFERENCES G3
