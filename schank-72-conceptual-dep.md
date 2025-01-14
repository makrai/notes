Conceptual dependency: A theory of natural language understanding
Schank, R. C
Cognitive Psychology, 1972, 3, 552-631
http://www.cs.cf.ac.uk/Dave/AI2/node69.html

a vízszintes illeve függőleges írás szerepe nincs explicite kifejtve

# 1 Introduction

* Winograd (1970) and Woods (1967), for example, have created programs that
  could actually do something, i.e., affect manipulations of blocks with a
  robot or answer questions about a highly restricted data base, and thus can
  legitimately claim to have achieved some measure of understanding
* psychiatric interviewing programs
  * Colby and Enea (1967)) and Weizenbaum (1968),
* Quillian’s (1966) semantic memory, while attempting to model a human memory,
  has presented no theory of the processing of linguistic information
* what is described here is a theory not a program. A program does, in fact,
  exist that does many of the things that are described here
  * programs are always far behind the theory, except when the program is the theory

# 2 The theoretical framework p2

## 2.1 Conceptual-Base Theory

* there exists a conceptual base that is inter-lingual,
  * onto which linguistic structures in a given language map during the
    understanding process and
  * out of which such structures are created during generation
* the first subgoal that the theory presented here attempts to achieve is the
  representation
  * conceptual content is mapped into linguistic units via realization
    rules. We will not discuss realization rules in any detail in this paper
* elements are concepts and not words
* two linguistic structures have the same conceptual representation if
  they are translations or paraphrases of each other
  * another subgoal explicit procedures for formally realizing two such
    linguistic structures as the one conceptual structure
* Linguists
  * transformational-generative grammar proposed by Chomsky (1957, 1965) is
    syntax-based it cannot seriously be proposed as a theory of human
    understanding nor is it intended as such
  * have tried to reorient generative grammar to be semantics-based [e.g.,
    Lakoff (1969) and Chafe (197O)]
  * primarily interested in generation of random sentences
  * word-based
  * Chafe, fail to recognize the distinction between the conceptual content and
    the intention of that content within a given situation
* syntax is not a relevant object of study in its own right, but should be
  studied only as a tool for understanding of meaning
  * syntactic analysis of a sentence for programs which use natural
    language may not even be necessary
* humans certainly do not regularly engage in the process of understanding
  isolated sentences[, but sentences in] linguistic and situational contexts
* an important part of the understanding process is in the realm of prediction
  of the elements of communication that lie outside the conceptual content
  of an utterance

## 2.2 Conceptual Dependency p5

* extract the concepts that the words denote and relate them in some manner to
  those concepts denoted by other words in a given utterance
* two distinct levels of analysis that are part of a stratified system
  * the sentential level,
* conceptual level
  * concepts and certain formal relations that exist between these concepts
  * for any unit on one level, some corresponding realizate exists on the
    other level. This realizate may be null or extremely complex
  * Conceptualizations may relate to other conceptualizations by nesting or
    other specified relationships, so it is possible for a sentence in a
    language to be the realization of many conceptualizations at one time
    * This is like saying that one sentence can express many complete ideas and
      the relation of those ideas
* three elemental kinds of concepts. A concept can either be a nominal, an
  action, or a modifier
  * Nominals are considered to be those things that
    * can be thought of by themselves without the need for relating them to
      some other concept
    * produce a picture of that real world item in the mind of the hearer. We
      thus refer to nominal concepts as PP’s (for picture producer)
    * a general thing for example, a man, a duck, a book, or a pen
    * or of a specific thing, for example, John, New York, or the Grand Canyon
  * An action is that which a nominal can be said to be doing
    * There are certain basic actions (henceforth referred to as ACT’s) the
      core of most verbs in a language, but this will be explained in section~4
  * A modifier is a descriptor of the nominal or action to which it
    relates and serves to specify an attribute of that nominal or action
    * modifiers of nominals as PA’s (picture aiders) and
    * modifiers of actions as AA’s (action aiders)
* relations are called dependencies
  * the dependent item predicts the existence of the governing item
  * A governor need not have a dependent, but a dependent must have a
    governor
* in order for a conceptualization to exist this must be the case for at least
  two governors
                            John <-> hit <-o- dog
* We denote objective dependency <-o-
* POSS: másik fajta nyíl + label
* A conceptual dependency network may be treated as a whole unit by reference
  to the two-way dependency link. Thus, the time of the events of this
  conceptualization may have been ‘yesterday’

## 2.3 Components of the System p8

* analysis of a sentence [proceeds] through the following processors:
* (A) Syntactic Processor
  * Syntactic processing is by no means done in isolation from the rest of the
    processes
* (B) Conceptual Processor
    1. a dictionary of the possible conceptual realizates of a word
    2. a dictionary of ACT’s that is used to select the correct ACT realizate of
       a given verb given the semantic environment on the conceptual level
    3. a conceptual _expectation maker_ that predicts conceptual information most
       likely to follow given the present incomplete conceptual structure
    4. a list of the different conceptual dependency rules that may exist
    5. heuristics for searching through syntactic structures to find the main
       PP and ACT candidates for a conceptualization.  Conceptual processing is
       * [can rely] on the memory structure operating above it
* (C) Conceptualization-Memory Interface
    1. a dictionary that relates two concepts or conceptual structures based on
       the individual experience of the hearer
    2. a dictionary that finds the function of a given PP in the real world
    3. a dictionary that recognizes the implications or connotations of a given
       word or concept and relates them to the intermediate memory
    4. a conceptualization expectation maker that predicts the next likely
       conceptualization
    5. a list of possible relations among conceptualization types
    6. a routine for searching through conceptualizations for information to be
       stored in long-term memory
  * The Interface operates on the conceptualizations in order to know how to
    deal with them in intermediate memory so as to generate a response
* (D) Intermediate Memory
    1. core beliefs
    2. recent input conceptualization
    3. information about topic under discussion from long-term memory
    4. _emotional_ variables dependent on input conceptualizations
    5. routine to _modify long-term memory_
    6. response-initiator
  * The Intermediate Memory is the operating memory whose function it is to
    begin responses to input conceptualizations and to affect the long-term
    memory
* (E) Long-Term Memory

# 3 THE SENTENTIAL LEVEL p9

# 4 THE CONCEPTUAL LEVEL p12

## 4.1 Conceptual Rules

1. PP<->ACT:
Ex: John <-> sleep
Sent: John is sleeping
2. PP<=>PA/PP
Ex: John <=> tall/a doctor
Sent: John is tall/a doctor
4. PP <-PA
  man   tall
Sent: The tall man
5. `PP /_LOC PP`            containment, location, and possession
  man   New York
  dog   John
Sent: The man in New York
John’s dog .
6. ACT <-oPP
Ex: hit <-oboy
Sent: (He) hit the boy
* We will present other conceptual rules as they are needed for the examples

## 4.2 Underlying ACT’s p15

* it may have seemed that what we are passing off as conceptual ACT’s are
  really no more than verbs
* love
* The man took a book. (3)
  * we know that there was a time and location of this conceptualization and
    furthermore that the book was taken from ‘someone’ or ‘someplace’ and is,
    as far as we know, now in the possession of the actor. We thus posit a
    two-pronged recipient case,
  * conceptually realize both ‘give’ and ‘take’ by the ACT ‘trans.’

## 4.3 Conceptual Cases p17

* If it is present at all, it is because it was required. There is no option
  and no ACT’s can have a recipient dependency without having required it
* dependents that are required by the ACT, conceptual cases
* There are four conceptual cases in conceptual dependency, namely,
  * OBJECTIVE,
  * RECIPIENT,
  * DIRECTIVE, and
  * INSTRUMENTAL
* We use conceptual case as the basic predictive mechanism available to the
  conceptual processor. That is, if I say ‘I am going,’ a very reasonable
  inquiry would be Where?
* transitive alternation
  * John grew the plants with fertilizer
  * We denote causality by <=
* what appeared to be an _instrument_ syntactically then conceptually
  turned out to be an object of an action
  * This is what always happens to a conceptual instrument:
    a single PP cannot be a conceptual instrument
* actors can only be animate or some natural phenomenon
  * The stick hit the boy
* connection between synt and conceptual case p23
  * We are concerned, however, with recognizing when a syntactic construction
    is reflective of an underlying conceptual case

## 4.4 ACT Categories p26

* parsing technique: top-down one and back again,
* The category of an ACT is an indication of what cases an ACT must take
  * Physical ACT-PACT’s require an objective case and an instrumental case
    * traditional actor-action-object-type constructions
    * Example: hit, eat, touch
  * Emotional ACT-EACTs require an objective case only
    * abstract in nature
    * Example: love
  * Transfer ACT-TACT’s require objective, recipient, and instrumental cases
    * express alienable possession
    * Example: trans
  * Communication ACT-CACT’s also
    * require objective, recipient, and instrumental cases
    * The object, however, is never concrete and, in fact, is never a PP but
      always a conceptualization
    * Example: communicate, say, read
  * Direction ACT-DACTs take
    * directive case, objective case, and instrumental case and express
    * motion of objects that are inanimate
    * Example: move
  * Reflexive ACT-RACT’s take directive and instrumental case.  The
    object of the action is the same as the actor in these instances
    * Example: go
  * Intransitive ACT-IACT
    * have to do with the state of existence of the actor and nothing else
    * Thus, IACT’s take no case at all
    * Example: sleep, be
  * State ACT-SACT’s are a special kind of ACT in that they serve to
    introduce another conceptualization that they are not a part of. That is,
    whereas instrumental conceptualizations are actually part of the complete
    process of which the main ACT is the name, SACT’s describe the actor’s
    relationship to the nested conceptualization that the SACT requires. We
    can consider the nested conceptualization of the SACT to function as
    objective case. However, since the object conceptualization here is the
    primary assertion we write it horizontally and thus need another
    conceptual rule
    * Example: want, believe

## 4.5 Conceptual Relations p31

* dependencies that denote the way conceptualizations relate to other con-
  ceptualizations are called conceptual relations
* The most important conceptual relation is that of causality
* what makes a relation different from a case p33.3
* The other conceptual relations are time and location p35

# 5 THE CONCEPTUAL PROCESSOR P36

## 5.1 Processor

* input the triple consisting of the main noun, main verb, and the verb
  category, and the direct object(s) of the verb
* must decide upon a conceptual configuration by using the verb-ACT
  dictionary, the conceptual rules, and the conceptual semantics
* must make predictions as to what information is required by the conceptual
  construction and proceed to search the unprocessed part of the sentence

## 5.2 Conceptual Semantics p40

* whereas the conceptual categories of two concepts may allow their
  combination in some specified way, the actual concepts may not make sense
  when combined
* conceptual semantics are hierarchic. That is, food, readable object and
  weapon are all physical objects as are animals

## 5.3 Syntactic Ambiguity p44

* traditional approach has been to find all the possible syntactic analyses
  for a given sentence
  * disregards the problem of simulating human understanding

## 5.4 Semantic Ambiguity p50

* passive construction
* The C-diagram for the first sense of ‘fill’ indicates that this means that a
  person will put an amount of liquid, Q, into a container that can contain at
  most amount Q of liquid. Since the semantic requirements on the sentential
  object need a ‘container,’ here is where the choice between the different
  senses of ‘glasses’ is made
* when English speakers hear this sentence they select ‘glasses,’ first
  meaning spectacles, and then revise their choice after hearing ‘fill’

## 5.5 Syntactic Similarity p53

* sentences
  * John’s love of Mary was beautiful,
  * John’s can of beans was edible
* copular p53.2
* p56
  (10) I want a book
  (11) I want to get a book
  (12) I want to have a book

# 6 CONCEPTUAL DEPENDENCY REVIEWED p57

1. Predictive ability
  * predict accurately what kinds of conceptual items have not been explicitly
    mentioned from the sentence or group of sentences being processed
    * directing the search through data for the information that is needed,
    * basis of the system’s interaction with memory. For example, certain
      kinds of information are left out of a sentence largely because the
      information is redundant within context
1.. Responses
  * treating certain constructions as commands to the memory
    * For example, ‘trans’
    * commands to add a belief to the belief structure
1. Paraphrase
1. Computer programs
1. Psychological models
  * the basis for language is an interlingual conceptual structure
  * there exists a network of concepts and relations
    * one relation is the central core (G)
  * an action is made up of from zero to three principal dependents
    * that these dependents are retrievable through the ACT and that
      it is probably not possible to think of an actor and a case dependent
      without somehow thinking of the action that links them
    * some dependents are retrievable through each other (object and recipient
      for example)
      * this is because of their simultaneous existence
      * an item retrieved from memory that is derived from the
        conceptualization
  * while the case dependents are retrievable through the ACT, many things are
    retrievable as relations connected to the core of the conceptualization
    (H) or the simultaneous occurrence of an actor and action. Thus,
    * time and location of a conceptualization should function more like
      causals than like cases
  * conceptualizations relate to other conceptualizations as either subsuming
    them (as instruments) or causing them in a specified way

# 7 ANALYSIS OF INTENTION p59

# 8 CONNECTION WITH MEMORY

## 8.1 Idiosyncratic Definitions

## 8.2 Interaction With Belief Structures

# 9. CONCLUSION
