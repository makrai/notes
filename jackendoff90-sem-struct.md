Semantic Structures
Jackendoff, Ray S
1990

* az itteni elemzés szintaxisalapúbb, mint a 4lang
* minden példát összevetni
* különféle neveken hívja a dekompozíciót (tiers, X-bar flavor)

# Introduction

* two basic problems
  * The Problem of Meaning is to
    * characterize the phenomena that a theory of meaning is to account for,
    * develop a formal treatment of semantic intuitions
    * account for the distinctions of meaning made by language users, and for
    * semantic relations including inference that speakers can draw
      among words, phrases, and sentences
    * relate [ling forms] to their understanding of the nonlinguistic world, so
      that they can make judgments of reference and truth
  * The Problem of Correspondence is to characterize the relationship between
    the formal treatment of meaning and syntax
    * choice of semantic formalism has an immediate effect on [its] solutions
* my research over the past fifteen years
  * Conceptual Semantics [CS]
  * principles parallel to those that motivate generative syntax and phonology
  * books
    * Semantics and Cognition (S&C, 1983) and
    * Consciousness and the Computational Mind (C&CM 1987)
  * situate the study of meaning in an overall psychological framework,
    * perception, cognition, and conscious experience
  * linguistic phenomena [only] in the early and middle 1970s
* now a richer range of lexical items and syntactic constructions
* parts
  1. the basic parameters of the formalization of meaning
    * argument structure and thematic roles
    * lexical structure, including how the syntactic frames [of a lexical item]
      are correlated with alternative meanings
  2. extending the range of semantic fields encompassed
    * by adding features to existing conceptual primitives,
      rather than by introducing altogether new primitives
    * meaning is organized into independent but interacting _tiers_,
      each of which contributes a different class of conceptual distinctions
  3. Correspondence
    * first three chapters
      * a wide range of adjunct constructions in English
      * [complicated] view of the syntax-semantics corresponddence
    * alongside the canonical relations of syntactic to semantic arguments,
      [there are] numerous other strategies [for]  encoding thematic roles
    * simplify the argument structure[s]
    * final chapter: very general principles for the linking

# Part I Basic Machinery

# Chapter 1 Overview of Conceptual Semantics 7

## 1.1 E-Concepts and I-Concepts 8

* concepts, thoughts, or ideas
  1. External: something out there in the world
    * exists independently of who actually knows or grasps it
  2. Internal: an entity within one's head, a private entity,
    a product of the imagination
    * can be conveyed to others only by means of language, gesture, drawing

## 1.2 First Principles of I-Conceptual Knowledge 11

* a finite set of
  * mental primitives and
  * principles of mental combination
  * these two sets together
    * the grammar of sentential concepts
    * describe the set of possible I-concepts expressed by sentences
* lexical concepts, the concepts expressed by the words in the sentence
  * [the] basic units out of which a sentential concept is constructed
  * must be some sort of finite schema that can be compared with the mental
    representations of arbitrary new objects to produce a judgment of
    conformance or nonconformance
  * there may well be objects for which people's judgments disagree
    * these differences too may bear examination
  * there may be novel objects such that one cannot judge clearly whether they
    are dogs or not
    * there is a potential degree of indeterminacy either in
      * the lexical concept itself
      * the procedure for comparing it with [new] objects
      * both
* acquisition of syntax, rules, and concepts (sentential and lexical)
  * on the basis of some combination of linguistic experience, nonlinguistic
    experience, and innate constraints on possible principles
    * part of our task is to determine what [is learned and what is] innate
  * primitives and principles of combination of the innate _grammar of lexical
    concepts_
    * Learning a lexical concept [is] constructing a composite expression
      within the grammar of lexical concepts + phon + synt
    * This contrasts sharply with Jerry Fodor's view that
      lexical concepts are cognitively primitive monads
      linked with each other by meaning postulates
      The Appendix to this chapter compares the two positions

## 1.3 Three Models for the Description of Meaning 16

* a mentally encoded concept C
  * draw inferences i.e
    * construct further concepts that are logical entailments of C
  * compare C with
    * other concepts retrieved from memory
      * _Do I know this already?_; _Is this consistent with what I believe?_
    * conceptual structures derived from sensory modalities
      * _Is this what's going on?_; _Is that what I should be looking for?_
  * can be evaluated with respect to what one believes and perceives
* [this idea of a concept is] not universally accepted
  * Frege's _On Sense and Reference_ (1892)
    * disassociates the
      * _sense_ of an expression, an objective, publicly available entity
        * underpins truth-conditional semantics
          (including model-theoretic semantics and Situation Semantics)
      * _ideas_ that users of the expression carry in their heads, which are
        subjective and variable
* the purposes of truth-conditional semantics are different from those of
  generative linguistics
  * Truth, a relation between language and reality, independent of users
    * both reality and the language that describes it are speaker-independent
    * Tarski, Davidson
  * generative grammar [concerns] the principles internalized in speakers that
    permit them to understand sentences, draw inferences, and [judge] of truth
    * _Speakers of Language L treat Sentence S as true if and only if their
      construal of the world meets Condition C_
    * This is the basis of the approach of Conceptual Semantics
    * conceptual structure
      * in which speakers encode their construal of the world
  * sometimes suggested that model-theoretic semantics is neutral between
    E-semantics and I-semantics
* CS vs Fodor's (1975) _Language of Thought_ Hypothesis
  * Fodor's position is that we grasp the world the way we do precisely because
    that is the way the world is
    * a marriage between the Realism of truth-conditional semantics and the
      mentalism of generative grammar
      * mediated by the relation of intensionality
    * CS is concerned most directly with the
      * form of the internal mental representations that constitute CS
      * formal relations between this level and other levels of representation
      * The computation of inference [is] internal to the organism
    * [Fodor] requires a theory of semantics to include a Realist account of
      truth-conditions and inference
    * Intentional Realism is [useful] for dealing with people in ordinary life
      But _folk physics_ is a good stance for ordinary life, too.  That does
      not make it a productive constraint for doing scientific physics.  So why
      get mired in _folk psychology_ when studying the mind?
* relation [to] Cognitive Grammar or Cognitive Semantics
  * Fauconnier 1984; Langacker 1986; Herskovits 1986; Lakoff 1987
  * shared:
    * mental representation of the world and its relation to language
    * the encoding of spatial concepts and their extension to other conceptual
      fields (see section 1.6)
    * Talmy (1980, 1983, 1985) [in CG] has provided important insights and
      analyses to the present framework
  * CS differs
    * an autonomous level of syntactic representation
    * rigorous formalism, insofar as possible
    * contact with relevant results in perceptual psychology
    * learnability and hence to the possibility of a strong innate formal basis

## 1.4 Organization of the Grammar 19

* levels of structure: phonological, syntactic, and conceptual
* syntax has subcomponents
  * D-Structure, S-Structure, Phonetic Form (PF), and Logical Form (LF)
* correspondence of syntactic and conceptual structures is specified by what
  used to be called _projection rules_ (Katz and Fodor 1963)
* rules of inference,
  * logical inference; invited inference, pragmatics, and heuristics
  * defined over the same level of mental representation
  * This is argued in detail in S&C, chapters 5 and 6
* conceptual structure is not completely language-dependent
* lexical item establishes a correspondence
  between  phonological, syntactic, and conceptual structure
  * Similarly, rules of morphology
    may have phonological parts, syntactic parts, and conceptual parts
  * each component in figure (1) as divided into
    * lexical principles (those that apply within words) and
    * extralexical principles (those that apply to larger domains)
    * the basic alphabet of primitives and principles of combination is shared
    * the grammars of sentential concepts and of lexical concepts
      share many of the same primitives and principles of combination
* Katz-Postal (1964) Hypothesis
  * phonology and semantics are _interpretive_ components that derive their
    respective structures from some level or another of syntactic structure
  * The organization proposed [here] eliminates this syntacto-centrism
    * three levels as equally _creative_; none is derived from the others

## 1.5 Intuitions about Lexical Relations 22

* What counts as a lexical item?
  * homonymous items such as the river bank and the savings bank as separate
  * inflectional suffix alternate forms of the same lexical item
  * uses of a verb in different syntactic frames
    3. systematic relation
    6
      a. Max looked at the insects
      b. Max looked for the insects
      c. Max looked smart
      d. It looks at though we'd better leave
    * uses of a verb with or without optional place and time phrases
  * exocentric compounds [i.e. non-compositional MWEs] one must learn
* my procedure here will be to go through many different lexical alternations,
  * what formal relation obtains among different uses, (2)
  * whether that relation can be expressed as a general principle of construal,
    so that one term of the relation does not have to be listed at all in the
    lexicon, or (3) barring that,
  * how the relation can be expressed lexically so as to minimize the
    difference among the uses in question
    * worst case, we can always fall back on mere homonymy (the two _bank_s)
    * [for] making the learner's job easier, a formal lexical relation is
      preferable: learning one use then makes it easier to learn the other

## 1.6 X-Bar Semantics 32

* cross-categorial feature decompositions with an _X-bar_ flavor play an
  important role in the characterization of I-concepts
  * [in] three major subsystems within conceptual structure

### 1.6.1 Ontological Categories and Argument Structure

* S&C, chapters 3, 4, and 9, proposes a basic organization for CS
* Instead of a division of formal entities into [logical types]
  * constants, variables, predicates, and quantifiers,
  * each of which has nothing in common with the others
* conceptual constituents [belong] to one of a small set of major ontological
  categories (or conceptual _parts of speech_)
  * Thing, Event, State, Action, Place, Path, Property, and Amount
* These are quite different in the kind of reference they pick out, but
  formally (algebraically) they have [6 points] in common
  1. Each major syntactic constituent maps into a conceptual constituent
    * NN correspond to Thing-constituents, the
      PP [to a Path-constituent, and the entire sentence] to an Event-cns
    * the converse of this correlation does not hold
      * many conceptual constituents of a sentence's meaning are completely
        contained within lexical items
    * the mapping between conceptual and syntactic categories is many-to-many
      [but] subject to markedness conditions
  2. also on the basis of the visual (or other sensory) environment
  3. Many of the categories support a type-token distinction
  4. Many of the categories support quantification
  5. and 6.  each conceptual constituent [decomposes] into three basic
     feature complexes, one of which, the argument structure feature,
     allows for recursion of conceptual structure and hence an infinite class
     of possible concepts

### 1.6.2 Organization of Semantic Fields

* A second cross-categorial property of conceptual structure
* the _localistic_ theory of Gruber (1965)
* the formalism for encoding concepts of spatial location and motion
  can be abstracted/generalized to many other semantic fields
* many verbs and prepositions appear in more semantic fields
* intuitively related paradigms
* generalization is by no means totally free
  * `*`The meeting went from Tuesday to Monday
* they are each realizations of the [same] basic conceptual functions
* the precise values of the field feature
  that a particular verb or preposition may carry is a lexical fact
* inference rule (21)
  * A variety of such inference rules appear in Jackendoff 1976
  * many so-called implicative properties of verbs
    follow from generalized forms of inference rules
    developed to account for verbs of spatial motion and location
    * properties such as _factive,_ _implicative,_ and _semifactive_
    * need not be stated as arbitrary meaning postulates
    * This is just the sort of explanatory power one wants from a theory of
      lexical decomposition into conceptual features
  * Each semantic field has its own particular inference patterns
    * e.g. in the spatial field, one fundamental principle stipulates that an
      object cannot be in two disjoint places at once
      From this principle plus rule (21), it follows that an object that
      travels from one place to another is not still in its original position
    * in the field of information transfer, this inference does not hold

### 1.6.3 Aggregation and Boundedness

* aspects of conceptual structure that display a strong _X-bar_ character but
  are not expressed in so regular a fashion in syntax (at least in English)
  One such aspect (discussed in Vendler 1957; ...),
  * iteration ~ plural
  * bounded/unbounded (event/process, telic/atelic) ~ count/mass
* (23)
* To sum up the discussion of (22): these examples show that
  * a common feature system cutting across Things, Events, and Paths
  * the system is expressed by a heterogeneous collection of syntactic factors,
    including lexical choice, aspect, determiner, and perhaps case
  * there is a set of algebraic principles over conceptual structure that
    correlates the values of the features in all parts of the sentence with the
    features of the sentence as a whole
* _end_

## 1.7 Where Traditional Features Fail 37

### 1.7.1 Spatial Structure of Objects

* How are [duck and goose] distinguished from one another?
  * different appearance
  * how is a chair to be distinguished from a stool? [± has-a-back]?
* the 3D model structure of Marr 1982
  * extension to encode action patterns such as throwing and saluting

### 1.7.2 Focal Values in a Continuous Domain

* a percept whose value in color space is close to focal red is easily
  categorized as red

### 1.7.3 Preference Rule Systems

* which satisfies both conditions at once, is more _stereotypical_
  * that satisfy only one of the conditions are somewhat more marginal but
    still perfectly legitimate
* climb = move up & grasp, see = gaze & ralize
* nouns that denote functional categories: form and function
* when one lacks information about the satisfaction of the conditions, they
  are invariably assumed to be satisfied as default values
* The formalism was in fact developed originally [for] musical cognition
  (Lerdahl and Jackendoff 1983)
* comparison with prototype theory, and fuzzy set theory

## 1.8 Appendix: Lexical Composition versus Meaning Postulates

* the solution Fodor advocates
  * each lexical item [has] its own specific meaning postulates
    * determine the entailments of sentences [the lexical item] occurs in
* e.g. causative-noncausative pairs in (26)
* each element in a lexical decomposition can be regarded as that item's access
  to more general-purpose rules of inference
* studies of language acquisition have benefited from decompositional theories
  of lexical concepts (e.g. Landau and Gleitman 1985; Pinker 1989)

# Chapter 2 Argument Structure and Thematic Roles 43

## 2.1 Basic Function-Argument Structures 46

(1)
  a. The argument serves as a spatial reference point, in terms of which the
     Place-function defines a region
  d. EXT, for the spatial extension of linear objects along a path
     (The road goes from New York to San Francisco)
* functions in (1) are [not] primitives
  * STAY is likely composite, perhaps some sort of durational form of BE
  * EXT is clearly related to GO
  * CAUSE too turns out to be composite as will be seen in chapter 7
  * various Place- and Path-functions have feature decompositions as well
* correspondence between syntax and conceptual structure
  * was stated in section 1.6.1
  * example in (3)
  * implicit argument
    * the well-formedness conditions require the Path argument to be
      present in CS even if it is not expressed syntactically

## 2.2 The Status of Thematic Roles 50

* thematic (q-)roles
  * [for] parallel notions in other syntactic theories, see Wilkins (1988a)
  * are part of the level of conceptual structure, not part of syntax
* [traditional examples]
  * Theme
    * Gruber's (1965) intuitive definition:
      the object in motion or being located
    * structurall defin[ition:] the first argument of the functions in (1, d)
  * Source/Goal
    * "the object from/to which motion proceeds,"
    * structurally: the argument of the Path-function FROM/TO
    * not a direct argument of the Event-function but is embedded
  * Agent is the first argument of the Event-function CAUSE
  * Experiencer presumably is an argument of an as yet unexplored
    State-function having to do with mental states
    * see section 7.5 for one possibility
* thematic roles are nothing but particular structural configurations in CS
* there are many kinds of arguments for which there is no traditional name
  * the object of the verb pass, as in _John passed the house_
  * pierce (The arrow pierced the target) [incorporate] THROUGH (or VIA IN),
  * climb embeds its NP argument in a structure something like
    `[Path TO ([Place TOP-OF ([Thing ]j)])]`
    There is a Goal, both intuitively and formally, but [more specific]
  * not primitives of semantic theory
* a list of a verb's arguments can be constructed simply by extracting the
  indices from the verb's lexical conceptual structure
* The hierarchy of q-roles in Grimshaw's theory is [cca.] provided by the
  relative depth of embedding of the indices in conceptual structure
    * see chapter 11 for amplification
* independent motivation of thematic analyses
  * determine the thematic roles in a sentence has to begin with
    semantic intuitions like those that motivated Gruber
  * the present account embeds the theory of thematic roles in a rich system
    governed by its own combinatorial properties
* how they behave in rules of inference
  * Each kind of argument position plays a distinct role in rules of inference,
    which are stated over full conceptual structures
  * e.g. at the end of an Event of going to some place, one is at that place
    * does not hold if either of the functions in the Event is changed
      * if TO is changed to TOWARD, as in Bill ran toward the house, or
      * if GO is changed to ORIENT, as in Bill pointed to the house
* only limited aspects of conceptual structure interact with syntax
* Three quick consequences
  1. there is no q-role of subject (as appears in Baker 1988 ...)
    * Subject is a syntactic relation, not a conceptual one
  2. not only NPs receive thematic roles. For instance,
    * _green_ is a Goal in _a. The light changed from red to green._
    * proposition
      * e.g. _shut up_ is a Goal in _b. Bill talked Harry into shutting up._
      * not the thematic role for a subordinate clause,
        as suggested by Bresnan (1982d, 293)
      * can occur in various thematic roles, just as Things can
  3. there cannot be a "default" thematic role in the sense that
    * [Objective is "default" or "neutral"] in Fillmore's (1968) Case Grammar
    * [in CS,] an NP must correspond to a specific argument position in
      conceptual structure and therefore must have a specific thematic role
    * Some treatments have taken _Theme or Patient_ to be such a default role
      if one can't think of anything else to call an NP
      * Theme has a specific structural definition, following Gruber,
      * Patient
        * traditionally the "object affected by the action"
        * not a role in Gruber's system
        * CS: neither can serve as a default case see chapter 7

## 2.3 Argument Fusion and Selectional Restrictions 55

* combinatorial rules that develop the conceptual structure of a [syntactic
  constituent] headed by a lexical item H
* (7) [assumes that all linkings] are stipulated in the head's lexical item
* [yet] there are regularities of linking,
  * e.g. Agents invariably appear in subject position
  * One can express such regularities
    and thereby leave predictable indices out of lexical entries
  * redundancy rules. I defer discussing it until chapter 11
* argument fusion and selectional restrictions
  * _enter_, where the position indexed `i` is specified as a Thing
  * [if selection fails,] the sentence could not receive a well-formed reading
  * Selectional restrictions [go into much more detail than] the
    conceptual category
    * e.g. the object of _drink_, the direct object of _pay_,
      the subject of German _fressen_, which is predicated only of animals
  * where an argument is not even syntactically expressed:
    * selectional restrictions are explicit information that the verb
      supplies about its arguments
    * selectional restriction = conceptual structure that occurs within an
      indexed conceptual constituent
     e.g. drink
      * cause a liquid to go into one's mouth
      * obviously an oversimplification, but sufficient for the present point
  * the reading of an NP argument as somehow fused or merged with the semantic
    information already present in the constituent
    * If C1 and C2 contain incompatible information,
      the fusion of C1 and C2 is anomalous
      e.g. if the offending features are sisters in a taxonomy
      of mutually exclusive possibilities,
      such as Thing/Property/Place/Event/etc. or solid/liquid/gas
* e.g. drink vs butter
  * Both mean "cause something to go someplace."
  * They differ
    * semantically in what they stipulate about the Theme and the Path
    * syntactically only in [being] obligatorily resp. optionally transitive
    * in the syntactic-semantic correspondence they stipulate
      * direct object of _butter_ is the Goal, and the
        * Theme is completely specified by the verb. By contrast,
      * direct object of _drink_ is the Theme, and the
        * Path is (almost) completely specified by the verb
* orthogonal
  * conceptual structure within arguments of the verb
    * part of the verb's meaning
  * positions of indices on arguments
    * the way the verb links its arguments to syntactic structure
  * selectional restriction and implicit argument

## 2.4 Restrictive Modification

* the use of one constituent as a modifier of another
* syntactic realizations
  a. red hat
  b. house in the woods
  c. John went home quickly
  d. John went home at 6:00
  e. high on the hill
  f. [PP here [PP in the house]]
* must be constrained with respect to the possible combinations of ontological
  categories in head and modifier
* if YP is neither subcategorized by H nor a subject, it does not participate
  in Argument Fusion and must be integrated into the reading of XP by other
  means. The Restrictive Modifier Rule is the simplest of such means; we will
  encounter others in part III

# Chapter 3 Multiple Thematic Roles for a Single NP 59

## 3.1 The Status of the q-Criterion

* q-Criterion says, in our terms,
  * that each subcategorized NP (plus the subject) corresponds to exactly one
    argument position in conceptual structure, and
  * that each open argument position in conceptual structure is expressed by
    exactly one NP
  * central to GB Theory, and
    [there are] parallel notions in other theories (e.g. biuniqueness in LFG)
  * important [for]
    * q-roles as annotations to syntactic structure
    * q-marking and case-marking are comparable phenomena (Dowty 1988)
* examples that collectively suggest that the q-Criterion must be weakened
  * 3.1.1 Cases Where an NP Has More Than One q-Role
    * transaction verbs such as _buy, sell, exchange, and trade_,
      * there are two actions  Thus X and Z have two semantic roles apiece
      * See chapter 9 for a more thorough treatment
    * chase: PAT also moves (Weinreich 1966 and Katz 1972)
  * 3.1.2 Cases Where Multiple NPs Hold a Single q-Role
* The rest of this chapter will recast [the q-Criterion] in more adequate terms

## 3.2 Argument Binding 61

* there is nothing to prevent two indexed positions in {conceptual structure,
  syntax} from bearing the same index
* indicate that the Source of the main transfer and the Goal of the
  countertransfer are the same unmentioned character/funny old man
* two kinds of coindexing:
  * one that links a syntactic constituent to a conceptual constituent
    * the type we have used so far
  * one that stipulates that two or more thematic roles are satisfied by the
    same individual
    * [asymetric, explains cases like] ?`*`_Bill talked about Mary to herself_
  * avoids the repetition of the conceptual material

## 3.3 On So-Called Syntactic Binding 64

* argument binding might take over the work traditionally ascribed to syntactic
  binding, so that binding can be treated as a unified mechanism
* the anaphor is linked to a bound argument in conceptual structure, and its
  antecedent is linked to its binder
* transitive-intransitive alternation: _Bill dressed (Harry) (in a new suit)._
  * to lexical items

## 3.4 Appendix: Thematic Conditions on Control 68

* PRO must also be treated in terms of argument binding [with] sem conditions
* give/get order/promise to do sg
  * it is part of the meaning of
    * _order_ that the recipient (or Goal) of an order is under obligation to
      perform the action described by the complement clause
    * _promise_ that the issuer (or Source) of a promise undertakes an
      obligation to perform the action described by the complement
      * passive?:  *Bill was promised to be allowed to leave
* important especially in nominals

# Chapter 4 Unifying Lexical Entries 71

* unify related uses of a lexical item into a single entry
  * This chapter will propose two abbreviatory conventions that
    permit certain alternations to be expressed within single lexical entries
  * Further alternations will be taken up in part III
* already two mechanisms in place for unifying the syntactic frames
  * potential modifiers are not encoded anywhere in [the] lexical entry
    * place, time, and manner
  * in argument structure optional expression of an argument
  * We have encoded such alternations in more or less traditional terms
    * verb's subcategorization feature contains an optional position;
    * if filled, it is coindexed to a conceptual argument;
    * if unfilled, the conceptual argument becomes implicit

## 4.1 Optional Outer Functions 76

* c. `to(under(...)` to encode the Goal and Route senses of _under_ and _over_
  * the Place sense provides a "conceptual core" that remains constant in
    all three senses [and] can optionally be elaborated by
    embedding it as an argument of either of the Path-functions TO and VIA
  * optional elaborations as part of the preposition's lexical entry
    * what is optional is a non-constituent: a constituent minus an argument
  * I will [notate optional outer arguments with] a dashed underline,
* d. `via(under(...))`
* inchoative verbs
  * alternate between a State reading and an Event reading
  * _point, surround, stand, cover, hide, shelter, block, support, face, sit_
  * the Event reading describes a change whose final state is the State
  * formaliz[ation]: the inchoative as an elaboration of Event into the
    function INCH, whose sole argument is a State
    * more detailed argumentation in section 5.3
* causative
  * {The box slid/Bill slid the box} down the stairs
  * external argument: _the_ in the noncausative [but] Agent in the causative
  * solution Unaccusative Hypothesis (Perlmutter 1978; Burzio 1986)
    * Agent is coindexed with subject position
    * in both causative and non-causative versions the Theme is coindexed
      with the object position
    * Chapter 11 will propose a more flexible linking convention

## 4.2 Multiple Argument Structures 81

* climb,
  * [its] use of a preference rule system was discussed in section 1.7.2
  * three syntactic [frames]: null complement, direct object [or] PP
  * [only the null entails] that the subject reaches the top
  * to(top-of(...)) is optional
  * Argument Fusion [chooses based on] the conceptual category Thing vs Place
  * [some] nouns such as _way_ and _route_ map into Paths instead of Things
  * much like _climb_ is _jump_
* _pass_
  * Syntactically the same as climb
  * PP-complement [restricted to Route] Paths whose Path-function is VIA
* similar: _cross_
  * subcat similar to _pass_
  * forms a near-minimal pair with _jump_
    in the behavior of their PP-complements
* put
  * PP [must express either a Place or] a Path whose function is TO
* return to transitive-intransitive
  * eat: a single entry NP argument optional
  * verb _dress_
    * discussed in section 3.3
    * [the intransitive] binds the Theme to the Agent

## 4.3 Remarks

* more productive lexical processes
  * can be expressed in terms of manipulations on the indices in the verb's LCS
  * e.g. passive participles from verbs
    * delete i, the index that marks the external argument
    * "logical subject" becomes an implicit argument

# A last remark to close part I

* one important thread of these chapters has been to compare a fine-grained
  theory of argument structure with a coarse-grained [one]
* In order for a sentence to be understood, of course, the [fine CS] must exist
* the issue is whether a coarse-grained argument structure is necessary
  * as a temporary shortcut
  * as a codification of a level of mental representation

# Part II Mostly on the Problem of Meaning

## 5.1 Introduction to Part II

* GO, STAY, BE, ORIENT, EXT, and CAUSE listed in (2.1)
  * account for a substantial fraction of the
    verbs of spatial motion and location of English and
  * can be extended to a wide range of other semantic fields
* many conceptual domains [must] be posited as additional elaborations of CS
* two general questions constantly arise
  * new conceptual functions
    * as simple primitives
      [or] by elaborating old primitives in terms of a feature system
    * In the areas examined [in chapter 5,] addition of primitives
    * chapter 6: posit feature elaboration of existing spatial primitives
    * Chapter 7: a combination of the two solutions
  * to what extent conceptual functions receive a consistent synta[x]
    * [whether] a thematic role always corresponds to the same syntactic role
    * there is something like an unmarked realization
      * for certain arguments of certain semantic functions, but
      * there are lexical exceptions to the pattern

# Chapter 5 Some Further Conceptual Functions 87

## 5.2 Verbs of Manner of Motion and Configuration 91

* tekergőzik, vonaglik, dance
  * no Paths, even as an implicit argument,
  * manner of motion, of a sort not easily decomposable into features
  * Peterson (1985): "natural actions", parallel to the class of natural kinds
  * `MOVE() + GO( , [Path ])`
  * laugh + emission of sound
* stay, sit + locative adjunct
  * the distinctions among various CONF-verbs [are]
    not expressed in CS [but in an external] representation
  * CONF + BE

## 5.3 Inchoative 95

* point (ORIENT), surround (EXT), stay, cover
* S&C: BE -> GO
* _reach_
* For the present, we will regard the function INCH as a primitive;
  will be composed into a bundle of more general features
* redundancy: GO(X, TO(Y)) ~ INCH(BE(X, Y))
  * The possibility, that GO can be reduced to INCH (BE)
  * appeared in its essence many times in the literature
    * Schank 1973; Dowty 1979; Hinrichs 1985
    * arguments against such a reduction:
      * GO can occur also
        * with a wide variety of Path-functions:
        * as expressions of extent (_reach_ and _go_ itself)
      * motion must be a primitive in spatial cognition anyway
        * we can perceive an object as in continuous motion
          without knowing anything about the endpoints of its motion
        * visual system contains specialized motion detectors (Marr 1982)
          * independent of the channels that individuate and localize objects
* My conclusion is that GO and INCH are two independent functions of CS
  * three criteria to determine which function is being encoded
    1. If the verb in question appears with a range of Path-prepositions --> GO
    2. If the verb in question appears in an Extent sense  --> GO
       (Recall that EXT is a featural variant of GO)
    3. If the verb [has two senses] related by the inchoative relation --> INCH
      * etc. in chapter 6
      * when modified by a durative expression

## 5.4 Kinds of Conceptual Clause Modification

* a partial taxonomy of functions that convert a State or Event into a
  restrictive modifier of another State or Event
  * syntactically most transparent as subordinating conjunctions
    * turn sentences into restrictive modifiers
1. means, How?
  * John got into the room by coming through the window
  * `BY`
  * ~ VIA
2. cause, Why?
  * reason, `FROM`, a variety of the usual FROM
  * purpose, goal, or rationale,
    * normally encoded as an infinitival, _in order to_-phrase, or _for_-phrase
    * differ from causes in their entailments
    * conceptualized by the speaker as the intended result
    * the intention may be the speaker's [or] attributed to the Agent
    * `FOR`, a variety of TO or TOWARD
3. accompaniment
  * mutual dependence between Bill's coming and Harry's,
  * "foreground[ing]"
  * asymmetrical
  * [more] than [conjunction but less than] causation
  * `WITH`, a variety of the spatial WITH
4. exchange, jutalom/büntetés
  * a voluntary act of social cognition, based on assessment
    * legal and economic systems
  * EXCH
* similarities of the first four subordinators to spatial functions
  * inferences associated with these [are] parallel
  * more than morphological similarity
  * I have not found a spatial counterpart for EXCH
* conceptual category of the modifying constituents `[BY [GO ...]]`

# Chapter 6 Some Featural Elaborations of Spatial Functions 101

* ezeket két szinten is bevezeti a CS-ben, minek?
* a 4lang szótárszerűbb: inkább szavakkal magyaráz, mint jegyekkel

## 6.1 Distributive Location 106

* an unbounded stream of water or people
* media in the sense discussed in section 1.6.3
  As pointed out there, a medium can consist either of a
  * substance like water, which has no internal organization, or of an
  * aggregate like people, which is organized in terms of minimal units
* progressive aspect, which in a sense takes a
  snapshot of an event in progress whose temporal boundaries are not in view
* similar determiner constraints appear in location sentences
  [with] _over, all along_, and _throughout_:
  `*`Some water was all over the floor
  * acceptable determiners and the possibility of only plural or mass nouns
  * the location of the subject with respect to the object of the preposition
    [vs extension] over the whole space subtended by the object
* sentences [in (3)] not only locate the medium but also specify its form
  * aggregates to be densely packed [e.g.] a line of telephone poles
    * not localized in one part of the [object]
* feature
  * a. on the floor `[Place ON+dist [Thing FLOOR]]`
  * semi-idiomatic combinations recorded in the lexicon
    | on                    | all over                  |
    | {along around across} | all {along around across} |
    | in                    | throughout                |
* completiveness [load with hay]
  * Fillmore (1968), Chomsky (1972), Anderson (1971)

## 6.2 Verbs of Touching 112

* attached to => in contact with => located at
* [_touch_ is] ambiguous between a State reading and an inchoative Event
  * optional inchoative
* _hit, prick, strike, bump, knock_, and _kick_, have only an Event reading
  * obligatorily inchoative
* a new feature opposition [in] spatial location, say Location versus Contact
  (or [±contact])
* also in the prepositional system
  * _on_ and _against_ contrast with _in, next to, alongside, above_
* IN ±contact
* nonspecific location function AT
* secondary locative
  * a further location expression describing the point of contact,
  * [permited by most] verbs of contact
* hit: GO( , TO) or INCH(BE( , AT))
  * GOc might [specify e.g. motion while in continuous contact with the object
    * _stroke_ and _scratch_ [mean] exactly this
* _rub_ and _brush_ specifying a Path of contact
* _bounce_ specifies travel that is interrupted by an impact and that continues
  in a new direction
* _slide_, which also expresses
  * motion of the Theme while in contact with a surface. _slide_, like _bounce_
  * difference between _slide_ and _stroke_
* verbs of impact (_hit/strike_)
  * exactly the same structure as inchoatives of verbs of pure contact (22a)
    * the standard test for the Patient role
      * _What happened to the tree? The car hit/*touched it_
    * This feature of exerting force is also found in _push_ and _pull_
* The secondary locative
  * is a Place, not a Path
  * must be a part of the object being contacted
  * the contact function is BE or GO
  * the second argument is a Place or a Path

## 6.3 Verbs of Attachment 116

* adhere or stick. 2 (27) is either a State or the inchoative of a State
* secondary locative, causation
* glue, nail, and pin, incorporate the instrument
* detachment
  * one element of the [analyses should be] reversed or negated
    * INCH could be reversed to an element TERM(inate)
    * BE could be negated
    * AT could be reversed or negated
* _from_ [is] a Place-function that expresses the _negation_ of a position !
* AT-END-OF
* _detach_
  * The presupposition that NPj was previously attached to NPk comes out of the
    logic of the inchoative: for this state to come to pass, the reverse had to
    be the case before the event took place
* Where is the instrument of attachment, the glue or nails, integrated into CS?
* [difference between] contact and attachment
  * contact verbs are transitive but the attachment verbs use _to_, and
  * there are verbs of detachment but none of ceasing to touch
* reciprocal
  * Harry and Sue touched/kissed/hit/collided/rubbed/bumped/`*`struck/contacted
  * The hoses stuck/connected/joined/`*`attached/glued
  * _mix_ and _combine_ contact throughout a volume instead of on a surface

## 6.4 Verbs of Material Composition 122

* make/form/build/assemble/put/construct/erect/manufacture/produce/create
  * typically causative
  * Some allow expression of either Source or Goal; others allow only a Source
* decomposition
  * broke/split/cracked/splintered/crumbled/divided/shattered
  * inchoative and causative
  * All of these permit a Goal-expression; none permits a Source
  * destroyed/demolished/wrecked
* resemblance [to] the Identificational field
  * change into, turn into, become
  * [but here] the Theme is referential
  * syntactic patterns are in part the same
    * especially the use of into as the standard preposition of Goal
* [Composition is] with Identification under a supercategory Character
  * Character [is in contrast with] Location [and] Possession
* statives must be analyzed as BE(-comp),
  with a Theme and a reference object
* there happens to be the verb _consist of_ with the proper argument structure
* mapping from [the whole and its parts] to thematic relations
  * parts as Theme, whole as reference object (49a), and the reverse (49b)
  * a further feature must be added in CS to distinguish [these]
    * a diacritic on the field feature Comp, as follows:
* the usual question: are the inchoatives [INCH BE-verbs, or] GO-verbs?

## 6.5 Conclusion

* Each of the semantic classes investigated here is realized with a
  characteristic syntactic structure[, a
  canonical mapping] to a standard syntactic argument structure + exceptions
  * contact typically are transitive
  * attachment typically appear with the preposition _to_
  * composition: _out of/from_ for Source and _into_ for Goal
  * Cross-linguistic study is important here, of course:
    * if the same apparently idiosyncratic fact appears in language after lang,
      something is being missed. Conversely,
    * if an apparently principled fact is violated in other languages,
      the principle must be questioned

# Chapter 7 The Action Tier and the Analysis of Causation 125

## 7.1 The Roles Actor and Patient; the Action Tier 130

* affected entity, the traditional role of Patient
  * missing from the theory of thematic relations in S&C and earlier sources
    (back to Gruber 1965)
  * What happened to Pat? What did Agt do to Pat?
  * [othogonal to] what moves where {under whose agency[?]}
* Actors ("doers of the action")
  * Agt did what
  * [similarly orthogonal to] Source (6a), Theme (6b), and Goal (6c)
* tiers of conceptual roles
  * Culicover and Wilkins (1986) and Talmy (1985)
  * thematic tier dealing with motion and location
    * including (GO, STAY, and CAUSE), (MOVE), and (INCH)
    * Theme: "thing in motion or being located"
  * action tier dealing with Actor-Patient relations
* [CS] that has Actor and Patient as argument positions,
  parallel to the treatment of Theme, Source, and Goal
  * a new formal elaboration of Events in the action tier
  * `EVENT -> [ AFF(<THING>,<THING>)]`
* Up until now, all conceptual functions have had a fixed number of arguments
  * implicit arguments
  * AFF has two optional arguments
    * there is no sense of an "implicit Patient"
    * [evidence for] the optionality of the Actor role
      * intransitive verbs such as _roll_
      * subject passes the test for either Actor or Patient
      * contrasts with, for instance, enter or march
        * Themes can only be Actor
* dissect the traditional notion of Agent into a number of independent parts
  * suggested by Dowty (1988)
  * "extrinsic instigator of action," -- "first argument of CAUSE,"
  * "volitional actor."
    * selects for a volitional Agent for instance, buy and look
    * permit the function AFF a feature elaboration [± volitional]
* a general linking rule that correlates agentivity with subject position

## 7.2 Varieties of Causation 133

* hindering, overcoming, letting, helping, and resisting Talmy (1985)
* The next few sections are devoted to incorporating Talmy's insights into CS
* agonist-antagonist dyad
* we introduce a general function CS that contains a "success parameter"
  * + to encode application of force with a successful outcome; this case
  * u for application of force with an undetermined outcome. Thus force (17)
  * Fail requires a third value of the success parameter
    * not the same as CS+ NOT. The latter would mean that Harry's
    * latter is _avoid_: efforts are directed toward not going away, successful
* push/pull is undetermined, but with Path, do of course have a positive outcome
  such as Amy pushed/pulled Bill out the window,
  * Chapter 10 will treat them as resultative constructions with means modifiers
* _miss_ (as in _The arrow missed the target_) = "fail (CS) to hit,"
  providing a third value for the success parameter in lexical causatives

## 7.3 Varieties of Dyadic Interaction; the Role Beneficiary 138

###7.3.1 Verbs of Helping and Letting

* second parameter in force-dynamic theory is the character of the interaction
* verbs like _help, assist, and aid_: two characters are striving for the same
* another configuration appears in verbs like _let, allow, and permit_
  * potential opposition between antagonist and agonist that is not realized
* if someone is allowed to do something, there is a strong presumption but not a
  logical inference that he or she did it
* Guide: "help to go along a Path"; support, "help to stay up";
  promote, "help to advance."; release: "let go out/away"; drop, "let fall";
  admit, "let enter."

###7.3.2 Verbs of [transfer of] Possession

* the "dative shift" verbs have an alternation in the action tier not unlike
  that of the locative alternation with _load_
* direct object: canonical positions for action tier roles. The use of an
  indirect object, then, is a means of canonically marking the Beneficiary role
  (We return to this matter in chapter 11.)
* light verb, e.g. _give X a kiss, give X a kick_
  * preserved of the regular verb give is its action tier, in which X is the
  * switch from Beneficiary in give X a kiss to Patient in give X a kick: neut

###7.3.3 Verbs of Reaction

* _Sam gave in to/withstood/resisted Harry('s pressure on him)._
* the rhetoric of political and social resistance has stressed its active char

## 7.4 Temporal Relations between the Cause and the Effect 139

* a. Bill dragged the car down the road.  b. Bill threw the ball into the field
* Michotte (1954): principal variants in the perception of physical causation

## 7.5 Extensions of Force-Dynamics to Logical Verbs and Psych-Verbs 142

* stative force-dynamic interactions: constrains the cattle. lets the water out
  leads (you) to Tucson. blocks the light
* don't actively do anythingthey are just there, and their presence inhibits or
  facilitates movement of things that happen to come in contact with them
* logical relation (suggested by Talmy and hinted at in Jackendoff 1976)
  a. X entails/implies/leads to Y.  (cause)
  b. X rules out/precludes Y.  (cause . . . not)
  c. X permits/is consistent with Y.  (let)
  d. X reinforces/supports Y.  (help)
    * strictly speaking are not considered verbs of logical relation but which
      in fact play a prominent role in argumentation
* _must_ and _may_ pair up conceptually with the verbs _require_ and _permit_, which
  * verbs of causing and letting respectively
* The trick in the analysis is identifying the antagonist, always implicit arg
  * epistemic use of the modal: logic, morality, the present situation
  * some contextually understood authority (the root use of the modal)
* Experiencer verbs. A well-known bifurcation of these verbs, going back in the
  * Chomsky 1965, Postal 1971, and Lakoff 1970, concerns whether the Experiencer
    (1) in object or oblique position, as with please, matter, and strike, or
    (2) in subject position, as with like, admire, and regard. Another parameter
  * whether the affect is positive, as in please and like,
    negative, as in displease and hate, or neutral, as in strike and regard
  * stative or eventive + tense and aspect:
    a. Thunder frightens Bill.  (stative)
    b. Harry (deliberately) frightened Bill.  (eventive)
* Suppose Experiencer as the person affected by the State or Event i.e. Patient
* well beyond the physical domain: examples chosen freely from the fields of
  physical force (push, roll) and social interaction (pressure, urge)
  * ambiguous between the two fields (force, resist, let)
  * logical relations, the modals, and the Experiencer verbs introduce new
    fields of causation, sometimes using the very same lexical items
    (e.g. lead to, permit, support, reinforce, strike)
* force-dynamic domain yields a further application of the semantic field
  * beyond the extensions of thematic roles
* The observed generalizations, particularly in the logical domain,
  have little to do with the nature of the world out there
* verbs of logical relation express an abstract form of force-dynamic
  * related to verbs that express pushing things around in space. It is
  * Piaget (1970) arrives at a similar hypothesis. He claims that concepts of
    logical relation are abstractions of concepts involved in motor activity,
  * logical concepts, often taken to be the core of rational thought -- the
    thing a theory of concepts must explain first -- are really derivative. The
  * demotes the logical vocabulary to a small and rather eccentric concern in
    * physical world to a much more prominent status

## 7.6 The Role Instrument; Unifying the Uses of Hit 145

* Instrument
  * it plays a role in the means by which the Actor accomplishes the action
  * the Actor acts on the Instrument;
  * the Instrument acts on the Patient
* This means expression is completely vague in terms of thematic roles; it
  basically contains only action tier information
* CS: embedded affect functions
* _kick_, for example, selects the foot as default Instrument

## 7.7 Argument Binding in Force-Dynamic Verbs 150

* syntax

## 7.8 Appendix: Lexical versus Periphrastic Causatives

* A distinction has frequently been noted in the literature
  (Fodor 1970; Shibatani 1976; McCawley 1978; Comrie 1985; Gergely and Bever
  1986; Pinker 1989)
  * "direct" causation of lexical causatives such as break Y and kill Y and the
  * "indirect" causation in periphrastic causatives such as cause Y to break and
    cause Y to die. The difference appears in contrasts like (68)
* lexical causatives have idiosyncratic (stereotypical) manners
  * causative _jump_ is applied primarily to horses being ridden by the Instig
  * Intransitive _smoke_, "give off smoke," has a highly specialized causative,
  * Fodor (1981): _paint_ is more specific than "cause to become covered with p"
    * one is not painting the brush that one dips in the paint in order to paint
      the wall, even though the brush does become covered with paint

# Part III Mostly on the Problem of Correspondence

# Chapter 8 Adjuncts That Express an Incorporated Argument 155

## 8.1 Introduction to Part III 159
## 8.2 Fill and Cover 164
## 8.3 Butter, Powder, Water, Ice, and Frost 166
## 8.4 Empty, Uncover, and Skin 170
## 8.5 Bottle, Pocket, and Package 171
## 8.6 Load, Spray, Pack, Stuff, Clear, and Drain 174
## 8.7 Obligatory Adjuncts: Rid, Provide, Present, Deprive, Swarm, and Teem 179
## 8.8 The Passive by-Phrase

# Chapter 9 Adjuncts That Express an Argument of a Modifying Concepl Clause 183

## 9.1 Three Kinds of For-Adjuncts 185
## 9.2 The CS of the For's of Beneficiary and Benefit; the Instrumental 189
## 9.3 Buy, Pay, and Sell 191
## 9.4 The For-Exchange Adjunct Rule 194
## 9.5 _For-Dative_ and _To-Dative_ Adjuncts 200
## 9.6 Depictive Predication 207
## 9.7 Appendix: Control in Gerundive Secondary Predicates

# Chapter 10 Adjuncts That Express Arguments of a SuperordConceptual Clause 211

## 10.1 Babe Ruth Homered His Way into the Hearts of America 218
## 10.2 Alternative Approaches to the Way-Construction 223
## 10.3 Willy Jumped into Harriet's Arms 225
## 10.4 Charlie Laughed Himself Silly 235
## 10.5 An Alternative Treatment of Resultatives 241
## 10.6 Final Remarks on Adjuncts

# Chapter 11 Toward a Theory of Linking 245

## 11.1 The Notion of Linking Rules 247
## 11.2 What Conceptual Semantics Can Do for Linking Theory 249
## 11.3 What Linking Theory Can Do for Conceptual Semantics 255
## 11.4 Digression: What Is Left of Subcategorization? 257
## 11.5 Refining the Thematic Hierarchy 262
## 11.6 Factoring Argument Fusion 264
## 11.7 Linking Non-NP Arguments 267
## 11.8 The Subject and the External Argument 269
## 11.9 Incorporating Most of the Adjunct Rules 275
## 11.10 Depictive Predication Again 278
## 11.11 Summary 279
## 11.12 Appendix: Restatement of the Rest of the Adjunct Rules

# Epilogue: Compositionality, Autonomy, Modularity 283
