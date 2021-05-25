James Pustejovsky
The Generative Lexicon
1995

Contents p6

# 1 Introduction

* goal
  * static view: different word senses generally associated with
    distinct lexical items
  * issues:
    * the creative use of words in novel contexts
    * compositionality
  * accounting for phenomena such as synonymy, antonymy, polysemy, and metonymy,
    then compositionahty depends ultimately on what the basic lexical categories
    of the language denote
  * The traditional view has been that words behave as either active functors or
    passive arguments. But we will see that if we change the way in which
    categories can denote, then the form of compositionahty itself changes
  * how to represent lexical ambiguity, both in theoretical and computational
    models. This view, incorporating
    * "sense enumerative techniques,"
      * distinguishes word senses on the basis of finite feature distinctions
      * no distinction between what Weinreich (1964) calls contrastive and
        complementary ambiguity
        * The former is basic homonymy: distinct and unrelated meanings
        * the latter refers to logically related word senses
* organization
  * chapters 2 and 3: most of the careful representation work has been done on
    verb classes (e.g., Levin, 1993)
    * semantic weight in both lexical and compositional terms
    * consequences for how lexical ambiguity has been treated
  * chapter 4: several devices
  * conception of lexical semantic systems emerges. Under such a theory, a
    * core set of word senses, typically
      * with greater internal structure than is assumed in previous theories,
      * is used to generate a larger set of word senses
      when individual lexical items are combined with others in phrases and clauses
    * I will refer to such an organization as a generative lexicon
    * generative devices
      * operations which generate these "extended senses"
      * e.g. type coercion and co-composition
  * natural languages are weakly polymorphic enyhén típusos
    * rich enough to capture logical polysemy and co-compositionality
  * chapter 5: the type system
    * multiple levels of representation
      for the different types of lexical information needed
      * Argument Structure
        * for the representation of adicity information for functional elements
      * Event Structure
        * information related to Aktionsarten and event type (Vendler, 1967)
      * Qualia Structure
        * defining attributes of an object, such as its
          constituent parts, purpose and function, mode of creation, etc., and
      * Inheritance Structure
        * relation between the lexical item and others in the lexicon
  * Chapter 6: the structure of qualia, and
    * the role they play in distributing the functional behavior of words and
      phrases in composition
  * Chapter 7: generative devices
    * coercion
    * selective binding and co-composition
  * Chapter 8: consequences of qualia structure for nominals
    * three dimensions: argument structure, event type, and qualia structure
    * An analysis of nominal polysemy is presented, making use of the type system
  * chapter 8: argument selection as driven by semantic types,
    * explain the polymorphic nature of verbs taking multiple syntactic types
  * chapter 9, I discuss the role that qualia and event structure have in
    describing the way _causal relations_ are lexicalized in language
    * causative/inchoative verbs, aspectual predicates, experiencer predicates,
      and modal causatives such as _risk_
  * chapter 10: how this view of lexical organization relates to current theories of
    * metaphor and pragmatically-induced metonymy
    * I argue for a strong distinction between common-sense knowledge and
      lexical structure, although the issue is clearly an empirical one
      * _creative polysemy_ c
        exhibit a regularity and systematicity across languages that is
        absent from sense extension or modes of metaphor_

# 2 The Nature of Lexical Knowledge 5

* much of the structural information of a sentence is best encoded from a
  lexicalized perspective
* problems for lexical semantics, I believe, are the following:
  1. Explaining the polymorphic nature of language
  1. Characterizing the semanticality of natural language utterances
  1. creative use of words in novel contexts
  1. Developing a richer, co-compositional semantic representation

## 2.1 Semantic Classes and Categorial Alternation 8

* I believe it will soon be difficult to carry out serious computational
  research in the fields of linguistics and NLP without the help of electronic
  dictionaries and computational lexicographic resources
* assumptions for lexical semantics
  1. without an appreciation of the syntactic structure of a language, the
     study of lexical semantics is bound to fail
  2. the meanings of words should somehow reflect the deeper conceptual
     structures in the cognitive system, and the domain it operates in
* principles for computational lexical semantics
  1. a clear notion of _semantic well-formedness_ will be necessary in order to
     characterize a theory of possible word meaning. This may entail
    * abstracting lexical meaning away from discourse and pragmatic factors
    * although this assumption may be wrong, it will help narrow our focus
  2. representations that are richer than
    thematic role descriptions (cf Gruber, 1965, Fillmore, 1968)
    * needed is a principled method of lexical decomposition. This presupposes,
      1. a rich, recursive theory of semantic composition,
      2. the notion of semantic well-formedness mentioned above, and
      3. several levels of interpretation in the semantics (Scha, 1983)
  3. lexical semantics must study all syntactic categories
    * categories other than verbs
    * _verb classes_ and their syntactic constructions (Levin 1985, 1993)
    * semantic nature of _adjectival predication_, and _nominals_
    * a balanced understanding of the lexicon and the methods of composition
* the position of lexical research within the larger semantic picture
  * controlling the inferences associated with the interpretation process
  * how deep or shallow is the understanding of a text?
  * What is the unit of well-formedness
    * the sentence, utterance, paragraph, or discourse?
* semantic levels
  * e.g., lexical semantics, compositional semantics, discourse structure,
    temporal structure
  * individual sources of semantic knowledge compute local inferences with a
    high degree of certainty
    * (cf. Hobbs et al., 1986, and Charniak and Goldman, 1988)
  * semantic interpretation proceeds in a principled fashion, always aware of
    * what the source of a particular inference is, and
    * what the certainty of its value is
  * Such an approach allows the reasoning process to be both tractable and
    computationally efficient
* methods used to classify the lexical items of a language into classes
  predictive of their syntactic and semantic expression
* Within formal semantics, the most fundamental is perhaps semantic type
  * Logical operators such as _the_ and _or_ might be viewed as
    * set-theoretic operations over sets of individuals in the world
      * (cf.  Montague, 1974, for example) or as
    * procedural instructions (cf. Woods, 1975)
  * selectional subsets of members of these categories
    * collocation and cooccurrence tests (cf. Chomsky, 1955, Harris, 1951)
      * For example, the nouns
        * dog and book: animacy
        * book and literature: mass/count distinction

### 2.1.1 Verbal Alternations

* syntactic patterns that words participate in
  (e.g., common grammatical alternations)
  * Levin (1993), outlines a broad classification of alternations
* For example
  * lexical = zero-derivated causation
    * _sink, roll_, and _break_ both transitive and intransitive forms,
    * as opposed to _arrive, die, fall_
  * the conative _shoot +/at_
* participation in one grammatical alternation does not sufficiently determine
  the semantic class of the verb
* the diversity of complement types that a verb or other category may take is
  in large part also determined by the semantics of the complements
* polyadicity more narrowly construed
  * including argument dropping alternations
  * Bresnan (1982), Fillmore (1986), and Levin (1993)
  * e.g eat +/obj
* ditransitive-transitive shifts, e.g. _give_
  * interaction of the verbal semantics
    with semantic information from the complement itself
* why these and just these grammatical forms are part of a certain alternation
  * see chapter 9
* aspectual class or Aktionsarten
  * verbs differ in the kinds of eventualities they denote
  * state,
  * activity, and
    * _walk_: an activity of unspecified duration
  * event
    * accomplishment: gradual
      * Creation-verbs
    * achievements: instantaneous change
* sentence does not convey information regarding the temporal extent
* Performance-verbs
* can be affected by non-lexical factors: bare plural object or mass term,
* second test: as complements of _begin_ and _finish_
* kinds of stative predicates
  * individual-level and
    * tall, intelligent, and overweight
    * properties that an individual retains throughout its lifetime
  * stage-level. Predicates such as
    * hungry, sick, and clean
    * non-permanent states of individuals
    * typically appears in forms of the resultative construction as the
      culminating predicate, as shown in the sentences in (36)
* the "imperfective paradox" (cf. Bach, 1986, Dowty, 1979)
  * if _x is \phi ing_ entails _x has \phi ed_,
    then either the verb or the predicate is an activity
  * A theory of lexical semantics should be able to account for this behavior,
* typeshifting
  * aspect may change as the result of syntax
  * e.g. adverbial modification, the structure of the NP in an argument
    position, or the presence of a prepositional phrase
  * problems in compositional semantics
  * Bach (1986), Link (1983), Krifka (1989), and Verkuyl (1993)
* In the discussion that follows, I will
  * restructure the above classification slightly, by making reference to
    subevents and to an event focusing mechanism called event headedness

### 2.1.2 Nominal Alternations pd32

* also have characteristic grammatical behaviors, depending on semantic categ
  * the point of departure for classification
* count versus mass.  This is a distinction which
  * dates back to
    * Aristotle, and more recently has played an integral role in
    * Pelletier and Schubert (1989) and  Link (1983)
  * different quantifier types and patterns of predication
  * nouns that have both mass and count interpretations, _beer, e-mail_
  * individual and group nouns
  * "semantic" plurality requirements
  * anaphoric binding,
* Relational nouns (vs predicative)
  * dependent on another referent in terms of how they themselves denote
  e.g. _neighbor_ and _brother_
* taxonomic classification of objects through language
  * commonsense perspective of what the nouns denote in the world
  * e.g
    * "concrete referring" nouns, such as _woman, boy, horse_ (all count Ns),
      as well as _grass, water_, and _gold_ (mass nouns),
    * "abstract referring" nouns such as _time, place, age, and shape_
  * Wierzbicka (1988) and Dixon (1991)
  * in computational linguistics and AI
    * goals
      * domain modeling
      * driving the inferences that a language reasoning system must perform
    * systems
      * primitives-based inferencing techniques such as Wilks (1975,1978) to
      * commonsense metaphysics reasoning systems applied to language
        * Hobbs et al. (1987)
* renewed interest in computational approaches to language analysis
  * both in computational linguistics and formal semantics
  * selection restriction from the 1960s and 1970s generative tradition
    * selectional features as conditions on lexical insertion
  * sortal specification is viewed in terms of
    type satisfaction within an interpreted model
  * motivations in both computational and theoretical linguistics communities
    for modeling the conceptual or epistemological ground assumptions
  * I hope to identify what the goals are for the _diverse_ communities, and then
    outline what I think the _common_ goals are

### 2.1.3 Adjective Classes

* Some of the previous discussion on types of stativity, e.g., the
  * individual-level vs. stage-level distinction
    * related to but not identical with accidental vs. necessary qualities
      * the oldest distinction, used in Aristotle and the scholastics
  * grammatical distinctions to be made
    * diagnostic: progressive aspect (continuous tense)
    * predicative and attributive
* intransitive and transitive forms
  * adjectives such as _envious_ and _jealous_ as in (52b) are
    inherently relational, and might be analyzed as transitive
* alternating adjectives
  * Mary is certain to be the/It is certain that Mary will be the
* raising/control distinction seen with adjective pairs such as easy
  * subject-control
    * e.g. eager, anxious, and unwilling
    * no alternating construction, while
  * tough-Movement adjectives
    * such as _easy, tough, and difficult_
    * enter into the medio-passive alternation
* Dixon (1982)
  1. DIMENSION: big, little, large, small, long, short
  2. PHYSICAL PROPERTY: hard, soft, heavy, light
  3. COLOR: red, green, blue
  4. HUMAN PROPENSITY: jealous, happy, kind, proud, cruel, gay
  5. AGE: new, old, young
  6. VALUE: good, bad, excellent, fine, delicious
  7. SPEED: fast, quick, slow
  8. DIFFICULTY: difficult, easy
  9. SIMILARITY: alike, similar
  10. QUALIFICATION: possible, probable, likely
  * classes for adjectives from cross-linguistic study
  * reveal little about the syntactic properties of the predicate
  * What is needed is a semantic classification that
    * captures the intuitions listed by Dixon but
    * based on the relational and logical behavior of the predicates and
      not on their folk-epistemology
    * I return to this discussion below in chapter 10

## 2.2 Interlexical Relations 23/38

* five classes of lexical relations:
1. Synonymy
  * standard definition
    * substituting one for the other in all contexts does not change the truth
  * weaker definition
    * substitution relative to a specific context
      * e.g. in carpentry, plank and board might be considered synonyms
  * if synonymy is defined by substitutability of expressions, then it is an
    intra-category relation, e.g., nouns for nouns, verbs for verbs, and so on
2. Antonymy
  * defined over pairs of lexical items rather than concepts
  * e.g. rise/fall, heavy/light, fast/slow, long/short
  * synonyms do not necessarily share the same antonyms
    * e.g. rise and ascend as well as fall and descend are similar in meaning,
      yet neither fall/ascend nor rise/descend are antonym pairs
      (Miller et al 1990)
3. Hyponymy and Lexical Inheritance
  * the taxonomic relation defined in inheritance networks
  * superconcept of the concept _car_
  * the set _car_ is a subset of those individuals denoted by the set _vehicle_
4. Meronymy
  * familiar from knowledge representation languages with predicates or
    slot-names such as part-of and made-of (cf. Brachman and Schmolze, 1985,
    Hobbs et al, 1987). Similarly in the domain of planning
  * necessary or optional subparts
  * in lexical semantics, see Miller et al. (1990) and Cruse (1986)
5. Entailment and Presupposition
  * `A` semantically entails an expression `B` if and only if
    * every situation that makes `A` true, makes `B` true. On the other hand,
  * `A` semantically presupposes `B` if and only if
    * in all situations where `A` is true or false, `B` is true
    * (cf. Strawson, 1952, Keenan, 1972)
    * e.g
      * _manage_ presupposes _attempt_
      * _sell_ and _trade_, where possession or ownership is presupposed
  * Capturing such entailment relations was one of the motivations for
    * lexical decomposition in linguistics in the 1960s, and still motivates
    * Jackendoff (1983) and Dowty (1979)
  * factive
    * e.g. _forget that_ (but _forget to_)
    * presuppose the truth of the complement
    * Kiparsky and Kiparsky (1971)

# 3 The Logical Problem of Polysemy 27

* describe the behavior of ambiguity
  * lexical selection process in the grammar
* this should simplify both the grammatical and semantic description
* I
  * explore two dimensions of the problem of lexical ambiguity and then
  * discuss the simplest lexical model that is able to account for these

## 3.1 Varieties of Sense Extension 27

* Weinreich (1964) distinguishes two types of ambiguity
  1. contrastive ambiguity: distinct and unrelated meanings (i.e., homonymy)
  * e.g
    * bank: part, bank
    * line: sor, vonal
    * taxi
    * turn: rátér, ráfordul
    * bar: ügyvédi kamara, kocsma
  * Whether these senses are historically related or accidents of orthographic
    and phonological blending, is largely irrelevant for purposes of lexicon
    construction and the synchronic study of meaning
  2. manifestations of the same basic meaning in different contexts
  * e.g
    * institution/building
    * window
    * door
    * farm n/v
    * the store is open, open his mouth
      * stative predicates can also refer to causative acts
  * complementary polysemies
    * also describes how cross-categorial senses are related
  * I will define _logical polysemy_ as a complementary ambiguity where there is
    no change in lexical category, and the multiple senses of the word have
    overlapping, dependent, or shared meanings

## 3.2 Contrasitive Ambiguity 29

* sense enumeration lexicons (SELs)
* pragmatically constrained disambiguation
* disambiguation does not occur independently for one lexical item, but rather,
  once the _context_ or domain for one item has been chosen or identified, the
  ambiguity of the other items is also constrained
  * this is a property of contrastive ambiguity, not logical polysemy
* involve issues of discourse inferencing
* sortally constrained disambiguation
  * not require context and pragmatic information for disambiguation
  * by virtue of sortal knowledge of the NP

## 3.3 Complemetary Polysemy 31

* a larger set of alternations called Figure-Ground Reversals
  16. Count/Mass alternations; lamb
  17. Container/Containee alternations; bottle
  18. Figure/Ground Reversals; door, window
    * e.g. door, window, fireplace, pipe, room, gate
    * 'aperture' nyílás and 'physical object' used to frame this aperture
  19. Product/Producer alternation; newspaper, Honda
  20. Plant/Food alternations; fig, apple
  21. Process/Result alternation; examination, merger
  22. Place/People alternation; city, New York
* contextual priming and discourse setting seems irrelevant for thei
  disambiguation]
* relating the multiple complement types that verbs select for
  * _begin_ is polysemous in that
    it must be able to select for Verb Phrase, Gerundive Phrase, or NP
* inchoative/causative alternation _open; break_
  * one sense is actually entailed by the other sense

## 3.4 An Elemetary Lexical Semantic Theory 33

* I present the simplest model of lexical design possible, and one which is
  widely assumed in both computational and theoretical linguistics
* the form that a lexicon takes influences the overall grammar
* The major part of semantic research until fairly recently has been on the
  mapping from a sentence-level syntactic representation
  to a logical representation
* many assumptions regarding lexical meaning are based on models that are 10-20
  years old
* Sense Enumeration Lexicon (SEL)
  * data structure of
    * category type (`cat`), and a basic specification of the
    * genus term (genus)
      * locates the concept within the taxonomic structure of the dictionary
* verbs would allow variation in complement selection to be represented as
  distinct senses,
  * each form can be related to each other by a
    * lexical redundancy rule or meaning postulate
  * since the Aspects-Model (cf. Chomsky, 1965)
* the lexicon remains a separate and independent component or source of data,
  or a _plug-in module_ from the computational perspective

# 4 Limitations of Sense Enumerative Lexicons 39

* the goal of a semantic theory repeated from chapter 1
* three basic arguments showing the inadequacies of SELs
  1. The Creative Use of Words: Words assume new senses in novel contexts
  2. The Permeability of Word Senses: Word senses are not atomic definitions
     but overlap and make reference to other senses of the word
  3. single word sense can have multiple syntactic realization
* to maintain compositionality we must enrich the semantics of the expressions

## 4.1 The Goals of Lexical Semantic Theory 40

* goal of a theory of lexical semantics, and with it a compositional semantics,
  * describe adequately the data
  * the system must be learnable is an obvious way and
  * polymorphisms must be adequately addressed
  * computational tools and descriptions are an important part of the
    machinery for the analysis of linguistic theories
  * we must be cautious with what inferences we draw from corpus data
    * criticism of Chomsky (1955, 1957) is still relevant
    * corpus
      * can be used for data mining and a general notion of empirical
        verifiability for patterns and cooccurrences
      * cannot be used as the only source of semanticality judgments
    * Work that ignores the systematicity accompanying grammatical and
      semantic rule systems, therefore, is throwing away most of the data
* semanticality, analogous to the view of grammaticality (cf. Chomsky, 1964),
  but ranging over semantic expressions rather than syntactic structures
  * the licensed expression of certain types of verbal arguments is predictable
    from the semantics of the expression and semantic operations
* e.g
  a. Mary began the book
  b. ?John began the dictionary
  c. ??Mary began the rock
* Grimshaw and Vikner (1993)
  (4) a. ?The house was built
      b. The house was built by accomplished builders
  (5) a. ?The cookies were baked
      b. The cookies were baked in the oven

## 4.2 The Creative Use of Words 42

* regular sense alternations that are as systematic as transformational
* one might simply keep the meaning of _good_ vague enough to cover all the cases
  * world knowledge or pragmatic effects could further specify the manner in
    which something is `good`, by commonsense understanding
  * the particular chunks of commonsense knowledge needed to interpret how
    _good_ modifies in a specific phrase are actually part of the meaning of
    the noun being modified, and not simply part of world knowledge
    * deploying commonsense inference seems unnecessarily and heavy-handed
* _fast_ and _slow_, where the meaning of the predicate also varies depending on
  the head being modified

## 4.3 Permeability of Word Senses 46

* not always obvious how to select the correct word sense in any given context:
  consider the systematic ambiguity of verbs like _bake_ (discussed by Atkins et
  ai, 1988)
  * change-of-state versus creation
* not possible to guarantee correct word sense selection on the basis of
  selectional restrictions alone
* abstraction. Herskovits (1987,1988), in addressing the issue of lexical
  ambiguity of spatial prepositions, introduces the notion of an _ideal
  meaning_ for a lexical item, which provides the core semantics for the word
  * These undergo semantic deviations due to convention or pragmatic factors,
    supplying additional or overriding information to the existing selectional
    restrictions of the preposition
  * e.g. from the core meaning of _in_, convention will elicit related but
    distinct senses for the preposition as used in the two expressions _the
    hole in the wall_ and _the crack in the bowl_
* express the logical relation between senses in cases of logical polysemy
* adjectives which have complementary senses in well-defined contexts
  * psychological predicates, discussed in Ostler and Atkins (1991, 1992),
    * have the ability to apparently change type
    * e.g. sad and happy are able to predicate of both individuals and events
  * _noisy_, which predicates of an individual or of a particular location

## 4.4 Difference in Syntactic Forms 50

* It is equally arbitrary to create separate word senses  just because it
  can participate in distinct lexical realizations
* e.g. verbs such as _believe_ and _forget_
* the syntactic realization of the verb's complement determines interpretation
  * The tensed-S complement exhibits "factivity" (cf. Kiparsky and Kiparsky, 1971)
  * forget to: a "concealed question"
* The proper approach, in our view, is to have one definition for _forget_
  which could, by suitable composition with the different complement types,
  generate all the allowable readings shown above (cf. chapter 7 below)
* subjects possible with causative and experiencer verbs, e.g. _frighten_
  * similar to general metonymy (Lakoff and Johnson, 1982, Nunberg, 1978),
  * there is an interesting systematicity that we will try to characterize
* &ast;A car and a tree ran into each other

## 4.5 Semantic Expressiveness 55

* in terms of the type system
* SELs in terms of its generative capacity, we have a monomorphic language
  (cf.  Strachey, 1967) i.e. lexical items are given a single meaning
* leads us to a complex typing for the _door_ class of nominals, rather than
  as a simple set of individuals
* enumerative listing of word senses has been the predominate view, and
  adherents include Montague (1974), Levin (1985), Levin and Rappaport (1988)
  * Dowty (1979) has a more complex view of word senses which is still
    monomorphic, but the meaning postulates are more clearly defined
* unrestricted polymorphic language (UPL)
  * denying the role of literal meaning entirely
  * Searle (1979)
  * meaning is determined more by the context than any inherent properties of
    the language lexicon
  * No restriction on the type that a lexical item may assume
  * No operational distinction between subclasses of polymorphic
    transformations
  * Searle (1979): The contribution of "background knowledge" acts as the
    trigger to shift the meaning of an expression in contexts
* weakly-polymorphic languages (WPLs)
  * what we want is a lexical semantic theory which
    * accounts for the polysemy  while
    * not overgenerating to produce semantically ill-formed expressions
  * Several lines of research
    * early observations made by Katz (1964), Wilks (1975), and Nunberg (1979)
    * work reported in Klein and van Benthem (1987)
  * All lexical items are semantically active, and have a
  * richer typed semantic representation than conventionally assumed
  * semantic operations of lexically-determined type changing (e.g., type
    coercions) operate under well-defined constraints
  * Different subclasses of polymorphic operations are defined,
    each with independent properties and conditions on their application
* I will describe the varieties of coercion types, and then outline an approach
  within generative lexicon theory, how best to constrain the application of
  coercion operations

## 4.6 Generative Lexical Models 57

* conservative approach to decomposition, where
  * lexical items are minimally decomposed into structured forms (or templates)
    rather than sets of features
* two distinct approaches to the study of word meaning:
  * primitive-based theories and
    * word meaning can be exhaustively defined in terms of a fixed set
    * Wilks, 1975a, Katz, 1972, Lakoff, 1971, Schank, 1975
    * Inferences are made through the primitives
  * relation-based theories
    * words (and their concepts) are associated through a network of explicitly
      defined links
    * Quillian, 1968, Collins and Quillian, 1969, Fodor, 1975, Carnap, 1956,
      Brachman, 1979
    * logical rules of inference to
      establish the connectedness between lexical meanings and propositions
    * linguistic data are just another application of a general, more powerful
      set of reasoning devices needed for commonsense inference, naive physics,
      and micro-world modeling
* I would like to propose a new way of viewing decomposition,
  * looking more at the generative or compositional aspects of lexical sem
  * four levels of semantic representations
    * argument structure, which specifies the number and type of arguments
    * event structure
      * basic event type and subeventual structure
    * qualia structure, representing the different modes of predication
      possible with a lexical item; and, a
    * lexical inheritance structure, which identifies how a lexical structure
      is related to other structures in the dictionary
* generative devices connect these four levels, providing for the
  compositional interpretation of words in context
  * type coercion which captures the semantic relatedness between syntactically
    distinct expressions
    * Argument, event, and qualia types must conform to the well-formedness
      conditions defined by the type system and the lexical inheritance
      structure
    * Lexical items are strongly typed yet are provided with mechanisms for
      fitting to novel typed environments by means of type coercion over a
      richer notion of types
    * each lexical item has a set of allowed type shifting operators

## 4.7 Strong vs. Weak Compositionality 59

* space (and possibly time) considerations
* two parameters are important for characterizing semantic devices:
  1. how much unilateral or bilateral function application occurs
    * In most approaches, only one element for each phrase is a function
    * I have argued elsewhere for a high degree of cocomposition
  2. How many senses are necessary for a unique interpretation of the phrase

# 5 The Semantic Type System 61

* I turn to the general motivations of linguistic theory, and specifically, to
  the overriding principles

## 5.1 Levels of Representation 61

* four levels of representations
  1. Argument Structure
    * number and type of logical arguments, and syntactic category
  2. Event Structure
    * event type of a lexical item and a phrase
      * Sorts include state, process, and transition, and
    * events may have subeventual structure
  3. Qualia Structure: Modes of explanation, composed of FORMAL, CONSTITUTIVE,
     TELIC, and AGENTIVE roles
  4. Lexical Inheritance Structure: Identification of how a lexical structure is
     related to other structures in the type lattice, and its contribution to the
     global organization of a lexicon
* generative devices connects these four levels
  * all involving well-formedness conditions on type combinations:
  * including
    * Type Coercion (kényszerítés)
      * a lexical item or phrase is coerced to a semantic interpretation by a
        governing item in the phrase, without change of its syntactic type
    * Selective Binding
      * a lexical item or phrase operates specifically on the substructure of a
        phrase, without changing the overall type in the composition
    * Co-composition
      * multiple elements within a phrase behave as functors,
        generating new non-lexicalized senses for the words
      * underspecified semantic forms becoming contextually enriched,
        e.g.  manner co-composition, feature transcription, and
        light verb specification
  * Semantic underspecification for lexical items plays an important role
  * I call such meta-entries _lexical conceptual paradigms_ (leps)

## 5.2 Argument Structure 62

* by far the best understood of the four levels
* the way arguments are mapped onto syntactic expressions. For example,
  * Chomsky's (1981) Theta-Criterion and
  * Bresnan's (1982) functional completeness and coherence conditions
  * Chomsky's Projection Principle (Chomsky, 1981)
    * such conditions are satisfied at all levels of linguistic representation
  * Williams' (1981) distinction between external and internal arguments and
  * hierarchically structured representation (cf.  Grimshaw, 1990)
* the strongest determinant or constraint on the acquisition of verb meaning
* four types of arguments for lexical items, here illustrated for verbs
  1. True Arguments
    * necessarily expressed at syntax
    * \theta-criterion and other surface conditions on argument structure
  2. Default Arguments
    * necessary for the logical well-formedness of the sentence
    * may be left unexpressed in the surface syntax
  3. Shadow Arguments:
    * semantic content that is not necessarily expressed in syntax
    * e.g.  incorporated semantic content in the verbs _butter_ and _kick_
    * can be expressed only by operations of subtyping or discourse
      specification; e.g., "Mary buttered her toast with an expensive butter."
  4. True Adjuncts:
    * part of the situational interpretation,
      not tied to any particular lexical item's semantic representation
    * include temporal or spatial modification
    * associated with verb classes and not individual verbs
      * e.g. individuated event can be modified by the temporal expression
* Verbal alternations  should be distinguished
  * which result in the expression of true arguments
    * e.g. inchoative/causative alternation in (2), while the latter include
      cases such as the
  * those involving the expression of an optional phrase
    * e.g. material/product alternation,  e.g. _(ki)farag (vmit) (vmiből)_
    * the material is optional, different from the created object
* Compositional operations may create an argument or shadow an argument
  * similarly, a true argument is defaulted by a complement's semantics
  * show (sy) sg
* default arguments can be satisfied as a phrase incorporated into a true
  argument
  * e.g. _Mary built a **wooden** house_

## 5.3 Extended Event Structure 67

* event variable for a verb within an event-based semantics is listed as a
  single argument along with the logical parameter defined by a particular
  predicate or relation
  * merging aspects of both Davidson's (1967) and Parsons' (1990)
* Moens and Steedman (1988) and Pustejovsky (1991b) argue that
  * finer-grained distinctions for event descriptions
  * aspect and Aktionsarten
  * subeventual structure associated with lexical items
  * relation between events and the arguments of the verb
    * Pustejovsky (1995a), a mechanism called Orthogonal Parameter Binding
* predicates in the qualia refer directly to the parameters:
* sorts: PROCESSES, STATES, and transitions
* a subeventual structure to these event sorts as well
  * allowing principles of predicate-argument binding to refer to subevents
  * theoretical consequences (cf.  Grimshaw, 1990, and Pustejovsky, 1991b)
  * evidence from unaccusativity and
    causative constructions (Pustejovsky and Busa 1995)
* extended event structure as a tuple, `<E, \prec, <, \circ, \sqsubseteq, * >`
  * relation between an event and its proper subevents
  * Extending van Benthem (1983) and Kamp (1979)
  * E is the set of events,
  * \prec is a partial order of part-of,
  * < is a strict partial order,
  * \circ is overlap,
  * \sqsubseteq is inclusion, and
  * `*` designates the "head" of an event
* An event structure with structured subevents
  * Pustejovsky (1988, 1991)
  * event tree structure
* event headedness (cf. Pustejovsky, 1988)
  * foregrounding and backgrounding of event arguments
  * events are ordered by relative prominence
  * HEAD marker, annotated as `e*`
    * Rules of agreement, government,
    * what part of the matrix event is being focused by the lexical item
  * összehasonlítani after-rel és before-ral
  * When adjoined to predicates denoting transitions, _prepositional and
    adverbial phrases_ not only _can modify_ the entire event, but can also
    take scope over the individual subevents. In particular, heads
    * e.g
      * My terminal died for two days
      * Mary left town for two weeks

## 5.4 Qualia Structure 76

* four essential aspects of a word's meaning (or qualia):
  * constitutive:
    * internal structural differences
    * the relation between an object and its constituent parts
    * e.g. text in a novel is characteristically a narrative or story, while a
      dictionary is by definition a listing of words
  * FORMAL: that which distinguishes it within a larger domain
    * novel FORMAL book
  * TELIC: its purpose and function
    * what we do with something, i.e., how we use it
  * agentive
    * how they come into being (cf.  Aristotle, Metaphysics)
* inspired in part by Moravcsik's (1973) interpretation of
  Aristotle's modes of explanations
  * ld. Trón: Metonymy cikkét is
* two general points that should be made concerning qualia roles:
  1. Every category expresses a qualia structure
  2. Not all lexical items carry a value for each qualia role
* set of properties or events associated with a lexical item
  which best explain what that word means
* the jumping off point for operations of semantic reconstruction and type
  change

```
[
  novel
  QUALIA =  [
    FORMAL = book(x)
    telic = read(y,x)
  ]
]
```

* in order to derive the "sense in context
* how modes of explanation map into a verb's event structure
  * a stative predicate corresponds to the FORMAL role in the qualia structure,
    e.g., that state of affairs which exists, without reference to how it came
    about. For example, the predicate _tall_
  * stage-level predication involves reference to the bringing into being of
    the resulting state, i.e., the AGENTIVE quale
  * causative predicates (i.e., transitions)
    * involving an initial act or process followed by a resulting state
    * two phases map directly into the AGENTIVE and FORMAL qualia roles,
  * process are distinguished according to which mode of explanation the
    predicate is associated with. I will consider here only the distinction
    between AGENTIVE and FORMAL processes
    * many languages distinguish active and passive classes of processes
      * Talmy (1975,1985)
      * active: verbs of motion such as run and move, while
      * passive: verbs such as sleep and snore
      * not necessarily isomorphic to an unaccusative vs unergative distinction
    * processes are quantifiable in different ways
      * specify explicitly the resulting state in the FORMAL role
      * more complex event structures
        * e.g. walk
        * bind into both AGENTIVE and FORMAL qualia roles

## 5.5 The Interaction of Semantic Levels 81

* for discussion, a system
  * based on typed feature structures such as Carpenter's (1992) system, and
  * application to lexical semantics described in Copestake et al. (1993).  The
  * two parts; the
    * type hierarchy itself, and the
    * constraint system operating over the types
 * semantic class information may be inherited by subtyping specifications,
   providing constraints on the types of arguments
 * (42)

# 6 Qualia Structure 85 (p100)

## 6.1 Modes of Explanation 85

1. Constitutive: constituents, or proper parts
  * Material
  * Weight
  * Parts and component elements
2. Formal: That which distinguishes the object within a larger domain
  * Orientation
  * Magnitude
  * Shape
  * Dimensionality
  * Color
  * Position
3. TELIC: Purpose and function of the object
  * Purpose that an agent has in performing an act
  * Built-in function or aim which specifies certain activities
4. AGENTIVE: Factors involved in the origin or "bringing about" of an object
  * Creator
  * Artifact
  * Natural Kind
  * Causal Chain
* qualia might seem at first to be a simple listing of case roles or
  named features associated with lexical items
  * qualia structure is the set of semantic constraints by which we
    understand a word
* TELIC roles for _movie, coffee,_ and _book_ somehow project the activities of
  _watching_, _drinking,_ and _reading_ respectively
* adjectival submodification

## 6.2 The Qualia Structure of Nominals 90

* In this section
  * typing system necessary to characterize the semantics of NPs, and,
  * logically polysemous behavior of nominals such as window and door
* system based on typed feature structures,
  * as applied to lexical structures in Copestake et al (1993)
* details of the typing constraints will not be discussed here
  * cf. Briscoe et al, 1993
* both to 2-dimensional objects such as window and door, as well as to
  3-dimensional objects, such as room, fireplace, and pipe
* Lexical Conceptual Paradigm (lcp) allows us to treat these as logical
  expressions of different aspects to the meta-entry for newspaper
* typing judgments with respect to a grammar (cf. Gunter, 1992)
  * rules
    * application
    * projection and abstraction
    * recursive type constructor as shown in (13) is needed
      correspond to the rule of recursive types in Categorial Grammar
      (cf. Lambek, 1958, Moortgat, 1988, van Benthem,Qualia Structure 1991)
    * Let us analyze the logical type relation between the polysemous senses of
      a lexical item such as _door_ as a dotted type
* process/result nominals such as _merger, joint venture, consolidation,_ etc

### 6.2.1 The Interpretation of the FORMAL Quale p110

* distinguishes an object from a larger set
* _reading_ requires not just that the complement be _information_ or
  propositional in nature, but it must have some _physical_ manifestation
  in order to be interpreted as symbolic

### 6.2.2 The Interpretation of the agentive Quale p112

* "coming into being," in Aristotle's terms (Physics), of an object
* will distinguish natural kinds from artifacts
  * cookies, cakes, and bread are typically baked

### 6.2.3 The Interpretation of the constitutive Quale p113

* parts or material of an object
* what that object is logically part of, if such a relation exists. The
  relation `part_of`

### 6.2.4 The Interpretation of the telic Quale p114

* thematic role..., modes of explanation
* Modes of Telic:
  1. Direct Telic: something which one acts on directly
    * `beer`, where reference to the activity of `drinking` incorporates a
      variable for the noun _as object_ of the predicate drink
  1. Purpose Telic: something which is used for facilitating a particular
     activity
    * objects that are used in the performance of an activity, such as with
      tools, such as the noun _knife_
```
 boo
  ARGSTR = [
    ARGl = x: information
    ARG2 = y:phys_obj
  ]
  QUALIA = [
    informationphys_obj_lcp
    FORMAL = hold(y,x)
    TELIC = read(e,w,x.y)
    AGENT = write(e',v,x.y)
  ]
]
```

### 6.2.5 Mapping from Qualia p116

* consequences of qualia-based representations
  for how arguments are mapped to syntax
* Our strategy would overgenerate without constraints
* event-headedness acts to foreground or "focus" a single quale of the verb
  * the focused  quale must be saturated at s-structure
* kill, (37) előtti bekezdéstől
* build,
  * discussed in chapter 9
  * constitutive causatives, an
  * additional constraint is at play
    * there is a default argument
    * (the material z used by x to bring about y)

# 7 Generative Mechanisms in Semantics 105

ebben a fejezetben nincs semmi értelmes, a következőben viszont van

* semantic transformations of
  * type coercion,
  * selective binding, and
  * co-composition
    * transformations making use of semantically underspecified forms
    * manner co-composition, feature transcription, and light verb
      specification
    * well-formedness conditions on type combinations in the grammar
* syntactic phrase cannot be interpreted outside of  context
  * but There are canonical syntactic expressions for semantic types,
    * presented in 7.4 below
* organization
  * type shifting in the literature, and
    * how this tradition relates to my view of type coercion
  * selective binding and co-composition are discussed in 7.2 and 7.3
  * section 7.4
    * the notion of lexical conceptual paradigm and canonical syntactic forms
    * how syntactic categories relate to semantic types

## 7.1 Coertion and Type Shifting 106 p121

* Type shifting
  * first introduced as a way of allowing operators such as negation and
    conjunction to change type according to what they modified or took as
    arguments (cf. Geach, 1968, Strachey, 1967)
  * Rooth and Partee (1982), Klein and Sag (1985), and Chierchia (1984)
    developed the mechanism to allow an NP, or any expression, to change type

### 7.1.1 Parametric Polymorphism and Type Shifting

* Klein and Sag (1985) show how the "raised" and "non-raised" forms with
  _believe_, and Equi and non-Equi sentences with _prefer_ can be accounted for
* meaning postulate 123
* have been treated as ambiguous verbs in McCawley (1979) and Dowty (1979)
  concerning the complement types of the verb _want_ p124

### 7.1.2 Subtype Coercion p128

### 7.1.3 True Complement Coercion

## 7.2 Co-composition 122 p137

* _bake_ has two meanings, a change of state sense and a creation sense
  (Atkins et al, 1988)
* process reading and a transition reading
* Pustejovsky (1991a) proposed that the complements carry information which
  acts on the governing verb, essentially taking the verb as argument and
  shifting its event type. Here we will make this proposal more explicit
* applications are illustrative to this point; namely,
  * manner co-composition, feature transcription, and light verb specification
  * see one phenomenon related to the semantics of light verbs in chapter 10

## 7.3 Selective Binding 127

* Now we return to the problem of adjectival polysemy
  * In chapters 3 and 4, I discussed three types
* issues to be dealt with here:
  1. adjectives being able to modify individuals or events; and
  2. interpretation depends on the semantics of the head (Bartsch, 1985)
* fast
* evaluative adjectives such as good, discussed in chapters 2 and 3
  * Since good functions as an event predicate, it is able to selectively
    modify the event description in the TELIC quale of the noun,
* subselective binding properties of different classes of adjectives, as
  modifying different facets or qualia of the head, by virtue of their type
  * Modification by an adjective such as long, fast, or bright , can be seen as
    event predication, selectively binding the appropriate quale of the head
* _expensive_ and _opaque_ refer to the physical object, the FORMAL
* _old_ and _new_ as used in _an old friend_ and _a new neighbor_
  * non-intersective interpretation
  * relational nouns
  * similar to fast and long
  * "a house that I've had for a long time,"

## 7.4 Semantic Selection 131

### 7.4.1 Canonical Syntactic Forms p147

* canonical syntactic form of a semantic type
* two lexical items are truly distinguished in their semantic types
  * the residual difference is attributable to syntactic distinctions
* an elaboration and extension of the ideas discussed in Chomsky (1986)
* two examples
  * selectional distinctions between the following two minimal pairs:
    a.  the verbs _like_ and _enjoy_
    b. the interrogative selecting verbs _ask_ and _wonder_
* A syntactic expression, YJ, of type `a`, is substitutable
  for the csf of a type `r` only if this type is fully recoverable from licensed
  semantic operations on `a`
* interrogative complementation
  * Chomsky (1986) `<-` Grimshaw (1979, 1981), and Pesetsky (1982)
  * semantic selection in relation to interrogative complements and the
    problem of concealed questions
  * Groenendijk and Stokhof (1989) who distinguish between _know_ and _wonder_
    as extensional and intensional complement interrogatives, respectively
* approach outlined here:
  1. the ability of the verb to coerce its complement
  2. the ability of the complement to metonymically reconstruct the required
     coercing type from the semantic structure within the complement

# 8 The Sematics of Nominals 141

## 8.1 Basic Issues 141

* classification of the different nominal types
* four major areas of concern
  1. distinction in complement-taking behavior between nouns and verbs
  2. How nominalizations and event-denoting nominals are distinguished from
     their corresponding verbal representations and the events they denote
    * 1. and 2.: 8.3 and 8.4
  3. logical polysemy in nominals, such as _window, record, book_, and
    * how these implicitly relational nominals differ from relational nominals
    * addressed in part in chapter 6
    * dot objects and
    * how argument and event parameters interact in the qualia expressions
    * 8.1 and 8.2
    * unified types and dotted types
  4. how coercion and co-composition rules makes use of qualia-based info

## 8.2 Nominals with Unified Types 142

* multiple inheritance
  * has been explored in a generative lexicon
    * to some extent in Pustejovsky and Boguraev (1993) and
    * more generally in Copestake (1992) and Copestake et al.  (1993)
* different aspects of objects become more or less prominent as context varies
  * "book" is.a "information," as well as a "physical-object; a
  * "dictionary" `is_a` "physical-object," as well as "reference"; a
  * "car" is.a both "vehicle" and an "artifact,"
* lexical relations between lexical items in terms of _links between only
  certain aspects_ of their respective lexical structures
  * approach presented here has several distinct levels of semantic description
* separate lattice per role in the qualia structure

```
  book is_formal phys-object
  book is_telic information
  book is_agent information
```

* typed inheritance, excluding the unwanted inferences
* unified types
  * In Carpenter (1992), _type unification_ is defined as the unique _greatest
    lower bound_, glb, for two types
  * objects which are non-polysemous, yet do involve the logical conjunction of
    their types
* only orthogonal types to be unifiable
  * a concept (i.e., type) that refers both to a physical object and a
    proposition, however, is not a possible unified type, since the FORMAL
    qualia values for the two concepts are not unifiable
* to represent artifacts that are physical objects, we would like a type which
  combines both the FORMAL value of a physobj and the AGENTIVE value of an
  artifact
  * but there are naturally occurring object being used as a tool, or to a
    rhetorical device used as a tool of persuasion

## 8.3 Nominals with Complex Types 149

* dot objects,
  * first discussed in chapters 6 and 7
  * analyze the inherently relational aspect of certain nominals
    * without having to treat them as overtly relational
* book, door, and novel
  * such nouns are relational
    * expressed in the FORMAL quale,
    * as outlined in 6.2
    * book: containment relation  between an individual physical object and
      information is in the FORMAL role
* head or predicative qualia role in this structure,
  * `formal = x.y : R(x,y)`
* _likes the book_
  * _enjoy_ semantically selects for an event function
* nominals denoting dot objects
  * all these noun classes are predicative nominals
  * along the FORMAL dimension alone, we can distinguish between
    * simple natural kind terms such as rock and man, as well as
    * simple typed artifacts, such as knife, and
    * complex typed nominals such as book and record
  * how they are different from relational nominals, such as father and sister
    * denotes a set of individuals standing in relation to others in a
      specific way
    * discussed above in chapter 2
    * whether the argument corresponding to the other sibling is
      existentially closed or bound to a constant
      (Eschenbach 1993; Bierwisch 1983)
* linguistic motivation for the existence of dot objects
  1. Semantic Motivations
    * doors, windows, books, computer programs
    * predicates and relations for such items are characteristic of the do
      object of e.g. printed material] alone
      * "reading" and "writing" are not conceivable without the dot object
    * not  the conjunction of simple types (or properties)
  2. Lexical Motivations
    * specific type of logical polysemy
      * not necessarily associated with true complement coercion
      * systematic and predictable
        * strong cross-linguistic evidence
* the dot object is
  * not a unified type, created from the meet on types
  * nor a standard generalization (or join) (Morrill, 1994)
  * Cartesian type product
* the relation, R, which structures the component types
  * part of the definition of the lep type constructor itself
  * book and record, the relation R is a subtype of "containment,"
  * partially event-denoting nouns such as _lunch_ and _sonata_, the
    * relation is more complex (cf. 8.5 below)
    * "event" and "food"
* In addition to the senses of _book_, represented by the dot object shown
  above, the noun _newspaper_ refers logically also to the publisher
  * specialization of the lcp known as product-producer AGENTIVE quale
* dot objects are constructed in a pair-wise recursive fashion
* distinction is between nominals such as book and novel: narrative

## 8.4 Propositions and Event Descriptions 157 p172

* event descriptions and nominalizations
* our assumptions regarding the treatment of
  * tense, and the
  * distinction between propositions and events
* untensed utterance such as _Mary build a house_ will denote a set of events,
* proposition only by virtue of being "tensed" (cf.  Verkuyl, 1993)
* distinction
  * assertion of an event having occurred
* both untensed sentences and NPs may denote event descriptions
  * proposition is the result of applying tense to an event description
  * tense acts as a generalized quantifier over event descriptions
* proper named event _The Vietnam War_
  * presupposition or existential closure
    * I read a book about The Vietnam War
* "general individual,"
* in some languages, aspect is primary and tense secondary (Comrie, 1976,1980)
* More complicated modes of reference will be considered below and in the next
  section
* simple event denoting nominal such as _war_
  * logical agent
  * extended sense of attack or assault, such as _the war on drugs_
* complex events
  * such as burning
  * constructed with the lcp type constructor into dot objects, the
  * subject of the next section
* left unanswered, such as the
  * relation between events and propositions to facts, as well as
  * further consequences to the analysis of tense as a generalized quantifier

## 8.5 Varieties of Nominalization 165

* Davidson (1967) and Parsons (1981)
  * connection between nominalizations and events
  * adding an event variable to
    verbs as well as to nouns such as _burning_ and _arrival_
    * supported by inference patterns
    * elevate the event to a first-order object in the logic,
      * such that quantification over the _ing_-phrase
* alternative view might be that the ing-nominal denotes the complete event
  in a way identical to ..
    * simple events such as _party_ and _war_ and
    * polysemous event nominals such as _examination_
* event-event nominalizations, which are
  logically polysemous between process and result interpretations
  1. the process reading in the nominal is the
    imperfective construction for the verbal;
  2. the result reading in the nominal is the
    perfect construction for the verbal; and
  3. the dot object reading in the nominal is the
    simple construction for the verbal form
* _examination_ and _exam_
  * Grimshaw (1990)
  * like the event nominals sonata and symphony
    * event and the music are related by performing
  * Exam is an event artifact while
    * examination is purely an event with no physical object denotation
  * sonata appears to make reference to both an event and an information type
  * lecture, class, and lunch. These have the
    * same type of polysemy as that exhibited above with exam
  * event type and a proposition
    * belief and regret
    * state of believing something as well as the proposition of belief itself
* factive nominalizations. Asher (1993) claims
  * _John informed Sue of Mary's departure._
  * NPs themselves are not factive
  * factive interpretation is due to factive predicates such as inform

## 8.6 Lexicalisation of LCPs 177

* _sale, purchase,_ and _transaction_
  * `give`, `take`
  * _transaction_ is unable to refer to the individual types, each
    representing a unilateral event of transfer, but only to the dot object
  * purchase and sale do refer to the individual events, while
    still requiring reference to the entire type cluster
* tree and the fruit
  * If pine cones were to be edible or eaten,
    * then the semantic conceptualization would change as well,

### 8.6.1 Referential Transparency

* distinctions made in the way that NPs refer
  * pronouns, proper names, and descriptions
  * important both for anaphoric binding and interpretive differences

# 9 The Lexical Semantics of Causation 183

* how extended event structure and qualia structure interact
  to account for the polysemy associated with certain verbal alternations
* the Default Causative Paradigm
* sections
  1. causative and unaccusative forms for verbs such as _sink_ and _break_
    * same underlying semantic representation, but distinct event headedness
  2. aspectual verbs such as _begin_ and _start_
    * raising and control readings
  3. event structures associated with _non-lexical (synthetic)_ causatives
    * comparison to the lexicalization phenomena discussed in previous sections
  4. _experiencer predicates_ are based on an underlying causal relation
    * responsible for the syntactic binding violations
  5. modal causative, such as _risk_ and _gamble_

## 9.1 How Language Encodes Causation 183

* causal reasoning has been elucidated in the AI and computational linguistics
  * Wilks (1978) develops a taxonomy of causal relations
  * Allen (1984), Eberle (1988), and Kowalski and Sergot (1986)
    * explore temporal connections between events,
      * in order to structure an event-based logic for planning or reasoning
  * Kamp (1979) and van Benthem (1983): philosophical logic
  * Hobbs et al. (1987) presents an extremely rich language
    * causal connections and constraints on temporal binding
  * Discourse Representation Theory (DRT)
    * Kamp and Reyle, 1993, and Asher, 1993
    * concentrated on event quantification in discourse,
* semantics  need not reflect the currently accepted view of _reality_
    for those concepts
    * Reichenbach (1978)
    * e.g. _quantum mechanics_
    * If anything remarkably _Aristotelian_
* properties of causation
  1. the causing event (i.e., the AGENTIVE quale) can completely precede or
     precede and overlap the resulting event
  2. The relation expressed by the causing event and that expressed by the
     resulting event must make reference to at least one parameter in common
* Constitutive causation,
  * discussed briefly in chapter 5
    in connection with  creation verbs such as _build_
* event headedness, there are (at least) three lexical semantic classes

| Left-headed events  | Direct causative accomplishments | kill, murder
| Right-headed events | Direct causative achievements    | die, arrive
| Headless events     | causative/unaccusative verbs     | sink, break, burn

* underspecification occasioned by a lexically headless event
  * gives rise to the polysemy exhibited by the predicates in the
    causative/unaccusative alternation and in the raising/control alternation

## 9.2 Causation and Uncaussativity 188

* alternation
  * diathesis
  * unaccusative/unergative
* Italian, "The enemy sank the boat."
* Chierchia (1989)
  * unaccusatives is an underlying causative
* adjunct phrases e.g. "John died from pneumonia."
  * not a true adjunct, but is in fact adding specificity to the relation in
    the event associated with the AGENTIVE quale for the verb

## 9.3 Aspectual Causatives and Coertion 198

* _begin_ and _finish_
  * it was suggested that the verb selects for event function
  * If the appropriate type is absent from the local environment then
    coercion applies, making use of semantic information associated with the
    complement, in order to reconstruct the proper type
  * _John began the book_
  * associated with the TELIC roles of the complements are reading and drinking
* force

## 9.4 Experiencer Predicates 208

* _kill_, _break_, psych

## 9.5 Modal Causatives 215

* the uncertainty of the resulting state is encoded into the lexical item
  * _John *risks* killing the tree by watering it so much_
* complementarity to the expression of the internal argument
  * _risk_ as motivation for constructions within a construction grammar
    (Fillmore, 1987 and Goldberg, 1994)
  * _Mary risked {death/her life} to save her_
* Fillmore and Atkins (1990) argue that the semantic roles associated with the
  verb _risk_ must include the following named relations:
  * HARM: a potential unwelcome development or result
  * VICTIM: the individual who will potentially be harmed
  * DEED: the act which brings about the risky situation
  * GOAL: that which is achieved by the act
  * POSSESSION: something valued by the victim

## 9.6 Conclusion 218

* have been ignored in this chapter
  * the semantics of resultative constructions, morphologically derived
    causatives, as well as the relation to syntactic causatives
* causative constructions involving the verbs _make_, and _have_, and the
  Italian causative, _fare_

# 10 Consequences of Generative Lexicon 221

## 10.1 Co-composition and Verbal Semantics 221

* differently from _sink, kill_, and the other verb classes th
  representation for _open_] makes reference to a predicate with the same name
* open: `the function or purpose associated with the object of the predicate is
  available for use`
  * For a noun such as letter, the TELIC specifies `read`
* break and close both make reference to the TELIC role of the complement
  as well, but in different ways
* when is it appropriate to "pack" many meanings into a single lexical
  representation?
* Some cases of nominal polysemy are not straightforward
  * lamb and haddock (tőkehal)

## 10.2 Stage-Level Predication 225

* stage-level/individual-level distinction in predicate types
  * first made by Carlson (1977)
  * analogy to nouns
    * stage-level predicates as similar in some way to artifacts, and
    * individual predicates as similar to natural kinds
    * as an artifact is defined by virtue of its AGENTIVE quale making
      reference to how it comes into being,
      a changeable state also makes reference to such an event
* psych-stage-level predicates angry, nervous, and upset
* resultatives
  * first mentioned in chapter 8, in the context of co-composition
  * adjectival phrases entering into resultative constructions are just those
    stage-level predicates which "cohere"_..._
* "role-defining" nominals such as physicist, linguist, and violinist, and
  * individual-level nominals (ILNs)
  * TELIC quale for violinist refers to "playing the violin," it
  * need not be an activity or state that holds at the time of reference
  * generic
* "situationally-defined" nominals such as
  * pedestrian, student, passenger, and customer
  * stage-level nominals (SLNs)
  * must be engaged in this activity in order to be identified by this term
  * identified with the AGENTIVE quale of the noun

## 10.3 Further Applications of Coertion 230

### Temporal Connectives

* before, after, while, and during,
* lexically-encoded linguistic knowledge and pragmatic effects on
  interpretation is studied in more detail in Asher and Lascarides (1995) and
  Nunberg (1995)

### Functional Prepositions and the Role of Qualia

* _at_ and _in_
* _at_ seems to only select locations that have in their qualia structure a
  specific TELIC role. For example, blackboards are used for writing on
  * if I am at my desk, then I am situated in the specific orientation
* definiteness and the bare singular predicative readings
  * for many TELlC-specified nominals, most with dot object status,
  * such as hospital and school,
  * when they appear as bare singular expressions as complement to prepositions
    such as _in_ (and _at_), they predicate the activity associated
  * "in hospital"

## 10.4 Linguistic versus Commonsense Knowledge 232 p247

### WordNet (Note 7) p282

* the way that it structures these three categories
  * Nouns are organized into topical hierarchies along hyponymy
  * verbs are organized by means of various entailment relations
    * according to a set of lexical entailment relations
  * Adjectives, on the other hand, are structured as n-dimensional hyperspaces
    * two classes: ascriptive and nonascriptive
      The former involves a typically bipolar

### 0

* Herzog and Rollinger (1991), and in particular, Lang (1991)
  * there appears to be a continuum between these two types of knowledge
* Asher and Lascarides (1995) investigates
  * how discourse structure can affect the selection of lexical senses,
  * three components
  * heuristics for lexical disambiguation: disambiguate words so that
    * discourse incoherence is avoided; and
    * rhetorical connections are reinforced
* types of sense extension
  * displaced reference, studied in
    * Nunberg (1979,1995), Fauconnier (1985), and Jackendoff (1992b)
    * opposed to logical polysemy
    * lexically idiosyncratic and semi-productive
* polysemy is the result of both
  * compositional operations in the semantics, e.g. coercion and co-composition
  * contextual effects, such as the structure of
    * rhetorical relations in discourse and
    * pragmatic constraints on co-reference

## 10.5 Lexical Inference and Rhetoric 236 p251

* enthymemic inference in the structure of rhetoric
  * that is, the conditions which license ellipsis in persuasive discourse
* ellipsed proposition is the major premise

## 10.6 Summary 238

* the natural language vocabulary is itself the data set of primitives
* left unanswered in the current work
  * details of interpretation concerning quantification, and
  * connections to pragmatic and commonsense inferencing

# Preface ix

* My aim in the current work has been to outline what I feel is the necessary
  infrastructure for a truly generative, highly distributed, and lexically-
  based semantic theory for language
* original work with Bran Boguraev, Ted Briscoe, and Ann Copestake
* not examined
  * lexical inheritance, recent work in computational lexicography and
    semantics, much of it reported in Briscoe et al., 1993) has pointed to
    new and exciting directions for how lexicons should be organized globally
    * a projective inheritance model (Pustejovsky 1991) is currently one of
      the topics of research with Bran Boguraev
  * co-specification and processes of selection
    * proved to be a central concern in the
      * applied computational research at Brandeis as well as
      * lexical acquisition and induction from corpora
  * quantification and genericity are only touched on briefly, if at all
  * details of several of the mechanisms of composition are to be found in
    Pustejovsky (1995b)
