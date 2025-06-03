Vector Semantics
András Kornai
2023 Springer

# 1 Foundations of non-compositionality

## 1.1 Background

## 1.2 Lexicographic principles

Universality
Reductivity
Encyclopedic knowledge

### Instead of sophisticated scientific taxonomies, ... a naive world-view

## 1.3 The syntax of definitions

### Starting with ‘disambiguated language’ ... departs from many syntactic 10

* the details of the ‘tinkering’ change from language to language
* the `mark_` primitive connects words to their meanings (see 2.5)
* permitting semantics to cross-cut syntax and morphology
  * particular piece of tinkering both Cresswell and I are guilty of

Coordination
Subordination
External pointers
Subjects and objects
Direct predication
Defaults
Agents, patients
More complex notation

## 1.4 The geo of definitions

### In addition to 0 links 12
defs often explain the definiendum in terms of it being the subject or object

### ... a rudimentary theory of communication 15

### The key link type ...  is the type 0 (is, is\_a) link p20

* More traditional dictionaries, use even more vague terms in the definition,
  * Webster’s New World (Guralnik, 1958) ‘used to express futurity, possibility,
    obligation, intention, etc’; The
  * Concise Oxford (McIntosh, 1951) has, distributed among several senses,
    ‘exist, occur, live, remain, continue, occupy such a position, experien...'
* A more unified treatment seems warranted, and will in fact be provided in 2.3

## 1.5 The algebra of definitions

15. BinaryAtom ->
      `at` | `between` | `cause_` | `er_` | `follow` | `for_` | `from` | `has` |
      `in` | `ins_` | `is_a` | `lack` | `mark_` | `on` | `part_of` | `under`

* morphology and syntax are handled by the same mechanism 25
  * We will see in Chapter 2 in far greater detail
  * syntax and morphological analysis of Latin sentences ordinarily proceeds
    hand in hand (S19:5.3)
* “doing grammar by spreading activation”
  * our concept is almost ident to that of Jackendoff and Audring, 2020 7.2.3
  * both go back to the same ideas (Quillian, 1969; Collins and Loftus, 1975),
  * obliterating the usual distinction between rules and representations
  * all the work is done by the representations and
    there are only a few generic rules that apply to all representations,
    primitive and derived, intermediary or final, the same way
  * characteristic of early combinatorial system like the
    * untyped lambda calculus (Church, 1936) and
    * categorial grammar (Ajdukiewicz, 1935)
  * maintained in all implementations of 4lang, be they by
    * Eilenberg machines (which directly formalize spreading activation), by
    * (hyper)graph kernel methods (Ghosh+ 2018), or by
    * direct linear algebraic manipulation

## 1.6 Parallel description

* three ( + AMR) main approaches to endowing nat lang expressions with semantics
  * the formulaic, the geometric, and the algebraic approaches
    discussed in 1.3, 1.4, and 1.5 respectively
  * All three have a long tradition going back to the 1960s, with many current
    variants. No doubt
  * all these approaches are algebras of their own, and as such
    * they can be connected by a parallel hyperedge rewriting system with
  * other approaches, such as
    * the (now deprecated) automatatheoretic work, are feasible. The view we
    * Abstract Meaning Representation (AMR) theory Banarescu+ (2013) could be
    * UD: rough semantics encoded in explicit marking of head-dependent rels,
      Universal Dependencies could be added as yet another branch. In fact, some
* syntax-directed translation, going back to Aho and Ullman, 1971, is
  * standard both in compiler design and in semantics, where it is considered to
  * implement the Fregean principle of compositionality (see S19:1.1) by two
    systems operating in parallel: a
    * syntax that, proceeding from the bottom (leaf) nodes gradually collects
      these together, and a
    * semantics that computes at each step a formula based on the formulas
      associated to the leaves and associates it to the parent node,
    * using only synthesized attributes in the sense of Knuth, 1968. The basic
  * generalized for more powerful rewriting methods (Rambow and Satta, 1994;
    Shieber, 2004), and here we suggest, with implementation planned for Release
    V3, a hyperedge replacement framework (see Drewes, Kreowski, and Habel
    (1997) for a detailed overview) for two reasons: first, because it offers
    * great clarity in regards to separating the metalanguage from the language,
      the tools from the objects themselves, and second, because it has an
    * efficient implementation, the Algebraic Language Toolkit (Alto)
* translational approach [to sem repr] whereby
  * the semantics of one natural language is explicated in terms of another
    natural language
* atomic components of all algebras are the morphemes and words
  * including multi-word expressions that contain orthographic word boundaries
  * loosely connected by an `is_a` network. This network is
    * a DAG but not necessarily a tree:
    * undirected cycles are common, as in the classic Nixon diamond (Reiter and
      Criscuolo, 1983). Edges of this network are labeled 0
  * two other networks, with edges labeled 1 and 2. In these,
    * no undirected or directed cycles have been found, but
    * confluences are not rare
* nodes can have non-linguistic content: they may contain
  * pointers to all kinds of encyclopedic (verbal) knowledge as well as
  * non-verbal memory: sounds, images, smell. Further,
    * activation of such may bring activation of the nodes, so these pointers
  * new nodes are added as the individual, whose linguistic capabilities are
    being modeled, is acquiring new words/morphemes
* hypernodes
  * In addition to these static node-like structures
  * hypernodes are more dynamic structures by a process of grouping. In
  * the simplest case, this is just coordinating a few elementary nodes: instead
    of Tom, Dick, and Harry we can refer to the collective entity they form as
  * Typically, hypernodes are nonce elements: boys may very well refer to other
  * best thought of as the meanings of constituents, are
  * denoted in the [mini]syntax by curly brackets. On
  * rare but important: strongly lexicalized groupings we call schemas. For
    eg `{place}`, defined as point, gen at from {place}, a complex schema we
  * will discuss in great detail in 3.1
* nodes and hyfight peredges are not that different. In fact, when we define
  * fight := person want {harm at other(person)}, `ins_` weapon this
  * def means that we can at any time replace the node fight by the hypernode
    {person want {harm at other (person), `ins_` weapon}} salva veritate. This
  * substitution plays a major role in the low-level deduction process that
  * eg _John fought the coyote with his bare hands_:
    we automatically put _bare hands_ in the `ins_` slot and typecast it as a
    weapon
* elementary operations [of deduction during text comprehension]
  (hyper)nofrd can..
  * activate themselves and adjacent edges to various degrees;
  * activate copy themselves (triggered by the keyword other);
  * unify subnodes. This unification, which is
    * automatic for nodes named identically
    * automatic for `gen`, which is capable of unification with anything), is
    * not to be confused with coercion (see 3.3), though
      the effects are somewhat similar

### 5. MarkedClause ~> DefaultClause|PositionClause|ComplexClause|Clause

* Position clauses, just as `mark_`, are language-specific. They are used in a
* we abstract away from a great deal of micro-syntax, since most of the
  ‘tinkering’ is both highly syntactic and highly language-specific, while our
  focus is with the semantic and the universal

### 7. PositionClause ~>  PositionMarker mark_ UnaryAtom

* `mark_` is a semi-technical mark term, the closest we will get to
* the Sausserean sign: its agent is a sign, its patient is a meaning, and it
* A typical example would be in the last clause defining the English word _buy_
  * =agt receive =pat, =agt pay seller, "from _" mark_ seller
  * discussed in 1.4
  * Whatever follows the string “from” is the seller in English
  * in Hungarian it would be whatever precedes the ablative case marker

## 1.6 Parallel description

# 2 From morphology to syntax

## 2.1 Lexical categories and subcategories

* we have much to say about events, actions, and event structure
  in 3.2 and 6.1,

### Places, Paths

* typecasting or coercion to make sense of expressions like _Let’s meet at
  Jim’s_
  * It doesn’t matter what kind of concrete object (eg Jim’s house, restaurant)
  * the object must be viewed as a place for it to function as the obj of _at_
* We discuss locations in 3.1, but note here that
  * their treatment will involve conceptual schemas
    rather than a type theory with distinguished Place or Path types

## 2.2 Bound morphemes

* The causative element in _-ize_ is well known (Lieber, 1992; Plag, 1998), and
* the idea that we define certain verbs by their result state is standard

## 2.3 Relations

## 2.4 Linking (causation is also in this section) 55

* p60 coercion
  * typecasting creates a new instance of the standard coordinate system with
  the office at its origin, and maps many of the features of this system
  appropriately, in the kind of process described by Fauconnier, 1985
  * We call this process coercion, not because it is
  * not that different from what Fauconnier calls ‘projection mapping’, but
  * we wish to emphasize its forcible, Procrustean aspect. By understanding,
    mental reality is created. _at_ forces Bill to be inside the office
    premises.  We may entertain different notions, perhaps he is out shopping,
    but to understand the sentence is tantamount to having a concept of him in
    the office
  * geometric interpretation of the coercion mechanism in 3.3

* `mark_`
* Let us turn to an explanation for more abstract, non-spatial binaries (p58)
  * eg `for_, has, ins_, lack, mark_` and others
    * korábban eg CAUSE, ER, FOR, HAS, INSTRUMENT, LACK, MARK, `PART_OF`
  * using purposive `for_` as our example

### the linkers, the most recalcitrant of our primitives (line 1438, page 63)

* more abstract, notional binaries
  eg CAUSE, ER, FOR, HAS, INSTRUMENT, LACK, MARK, PART_OF
  * defer MARK to 2.5, and
  * Chapter 4: our negation operator LACK
* We begin with purposives: FOR, INSTRUMENT
* CAUSE
  * we define x cause_ y by cause_ x before y, after(y)
  * This falls quite short of a proper analysis of single and multiple causes,
    * encourages precisely the kind of errors that are rampant in the
      identification of cause-effect relations
    * sophisticated data analysis of the kind urged in (Pearl, 2009) cannot be
      replicated in natural language semantics, especially as
      * the kind of statistics and probability theory that undergird the modern
        scientific understanding are not supported by natural language (Ch 5)
  * We compare the commonsensical definition of causation to the counterfactual
    _sine qua non_ definition in Chapter 6
* `PART_OF`, HAS
* We also explained how
  the mainstays of case/valency systems, such as datives, locatives, and ins,
  can be reconstructed without assuming link types beyond ‘1’ and ‘2’,
  by taking these as relationals that typecast their arguments
* we compare 4lang to UD 48
* assume that link types are acting as variable-binding term operators (VBTOs)
  so that we would have not just =agt and =pat, but also =goal, =source,
  =theme, =pos and perhaps several others
* In earlier versions of 4lang (Makrai 2014): several thematic role-like constr
  * hE this really stretched the ontological committment (Quine 1947) of the
    model beyond what is absolutely necessary

## 2.5 Naive grammar 57

* Many of our lexical entries do double duty as elements of p64
  the universal conceptual schema / the naive theory of grammar
* in `cause_` the underscore signifies that we are interested in a substantive,
  if naive, theory of causation, something that
  * must be available to support all kinds of decompositional analyses
    eg kill means ‘cause to die’
  * the common decompositional style of lexical analysis relies on primitives
    like MOVE; BECOME; DO; and others,
  * 4lang simply uses ordinary lexical entries _move_ `before(=agt at place/10`
  * often the distinction between the ‘grammatical’ and the ‘ordinary’ use is
    so slight that we see no reason to even make the distinction:
  * eg `part_of` (discussed in 2.4 above) and `is_a`
* p71 the somewhat elusive idea of ‘an especially close relationship’
  * obtains between betrayal and its object, but
  * not between eating and its object,
  * can be operationalized in terms of coercion
* The U/V (intransitive/transitive) distinction (p71)
* Since our goals are remarkably close, and our motivations are nearly ident,
  readers of Jackendoff and Audring (2020) may find                     (p72)
  a direct comparison between the two formalisms helpful
  * Turning to the semantic component,
    we avoid the system of linking and coindexation that J&A 4.13.1 rely on
    (equalizers introduced in 3.3 will to some extent make up for this loss)

# 3 Time and space

* 3.1 Space
* 3.2 Time
* 3.3 Indexicals, coercion
  * p92 coercion
* 3.4 Measure

# 4 Negation

* Here we take advantage of the mechanism that we have at our disposal
  independent of negation and quantification, thematic roles (Dowty, 1986) and
  the fact that we already have a fundamental `is_a`

# 5 Valuations and learnability. Old title: Probabilistic reasoning 115

# 6 Modals and counterfactuality

## 6.1 Tense and aspect

## 6.2 The deontic world (The instrumental is also discussed here)

* lex sem drives the way things are referred to in language
  * instruments again illustrate this point
  * point already made at the end of 6.1
  * it is the lexical semantics of the elements that drives the way instruments
    are referred to in language,
    * not some top-down theory (such as hierarchical ordering of them roles)
  * the instrumental case marker `ins_`, defined as `=pat make ins_ =agt[easy]`
  * conceptual definitions are paraphrases for trying to get to the meaning of
    * such as Fillmore’s “The case of the inanimate force or object causally
      involved in the action or state identified by the verb” or
    * Pān.ini’s “most effective means”
    * for the analytically minded, they provide excellent guidance in trying to
      sort out what (if anything) can be considered an instrument in a given
      situation
    * Our own definitional attempt differs from these chiefly in being provided
      in a fully formalized language, in keeping with our overall plan

## 6.3 Knowledge, belief, emotions

## 6.4 Defaults

# 7 Implicature and gradient adjectives

## 7.1 Adjectives
## 7.2 Gradience
## 7.3 Implicature

## 7.4 Spreading activation

* see the end of sec 1.5

### ... parsing in algebraic semantics is relatively easy 169

* It should be clear from 7.3
  * after some morphological analysis, we just look up the words in the lexicon
    and apply spreading activation and unification algorithms
  * in the same manner as we analyzed _colorless green ideas sleep furio_ in 6.4
  * This is the approach taken eg in
    * Unification Grammar (Shieber, 1986)
    * HPSG (Pollard and Sag, 1987)
    * and more recently in
      * Extended Dependency Unification Grammar (EDUG, Hellwig, 1993) and
      * Abstract Meaning Representation (AMR, Banarescu+ 2013)
  * Broadly speaking, all ‘algebraic’ approaches are direct
    * ie not just the classic AI models originating with Quillian (1967), but
      also Pān.ini and Generative Semantics
    * proceed from meaning representation to surface form directly,
      without any reliance on Logical Form
    * view interpretation as the inverse task, analysis by synthesis
* (hyper)graph manipulation
  * The linearization of meanings as formulas is a relatively new development:
  * Frege (1879) actually used 2D notation, as does
  * Generative Semantics used tree structures on the semantic side, and almost
  * The exception is Pān.ini, whose
    notational conventions were geared toward the pronuncability of the sūtras:
    linear, but with special indicatory letters (it, anubandha) interspersed
* the limitations of short-term or working memory (Miller, 1956)
  * Starting perhaps with Yngve (1961), linguists have long wrestled with
    assessing the impact on sentence processing of ~
  * The bulk of this work concerns syntax and takes it for granted that
    the central issue is dealing with the linear succession of words
* 169 Island parsing techniques (Carroll, 1983), based on the idea that
  a full parse may be built from well-understood subgrammars
  * Ken Church’s famous declaration: parsers don’t work
  * ~> interest in partial parses
  * eg light parsing (Abney, 1991),
* semantics: no reason to suppose that the memory is sequentially organized
  outside of procedural/episodic memory
  * the bulk of linguistic information is stored in
    the lexicon, a device that is best thought of as random access
  * graph transduction
    * best suited to random access of this sort
    * The classic model is the Kolmogorov Б-complex (KБC),
      * originating with Kolmogorov (1953) – for
      * a more accessible English-language introduction:
        Ch 1 of Uspensky and Semenov (1993)
    * more modern concepts
      * Storage Modification Machine of Schönhage (1980)
      * Pointer Machine of Shvachko (1991)
      * Random Access Computer of Angluin and Valiant (1979) –
    * for a good discussion, see Gurevich (1988)
    * all these models are “more appropriate for lower time complexities like
      real time or linear time” than the standard Turing Machine

### Theories of 'algebraic conceptual representation' (Kornai:2015c) share

* hypergraphs
  * Theories of ‘algebraic conceptual representation’ (Kornai and Kracht 2015)
    take all lexical entries, and the knowledge representations, to be
    (hyper)graphs, just as the KБC family of models
  * vector semantics demands a new set of parsing and generation techniques
    * direct, assigning vector output to each sentence input, or
    * indirect, proceeding first to create a hypergraph, and
      computing the vector based on this
  * why (hyper)graph?
    * not so much as a suggestion about the architecture of the grammar but
    * a means of filling the vacuum left by the deprecation of the Eilenberg Ms
    * no theoretical claim of ‘psychological reality’ attached to the
    * nor is there a practical claim that indirect methods will turn out to be
      the best possible way to organize computation
    * not seen as Logical Form any more than binary strings are ‘logical form’
      for numbers. They are merely
    * a perspicuous [clearly expressed and easily understood] shorthand, and
    * economy of the rules that can be stated with their use
* 171 spreading activation
  * The key, most compelling notion these theories have since Quillian
  * island parsing writ large,
  * beginning with nouns, named entities, NPs and PPs, detection of case
    marking, assembly of clausal structure, and verbal slot filling
  * At every stage, morphemes, words, or larger lexical entries are active, and
    by spreading activation so are their links
  * A structure is detected whenever two such spreading waves of activation
    meet

`#`John dared to chew gum (Sec 7.3, p 166, example 7.4)

* Pragmatics, in the sense relevant to our understanding of _dare_ and other
  implicatives, is simply an effort to find paths where none initially exist
  * There is clearly no link, at least initially, from chewing gum to danger
  * But chewing gum is the object of dare, so we make the link, and
    now chewing gum is risky
* How far the activation is spread (how many substitutions are made) is
  obviously related to short-term memory limitations: we, as humans, can only
  * the motivating experiments: humans respond faster to specific questions like
    Is a robin a bird? than to more general ones Is a robin an animal? (Collins
    and Quillian, 1969)
  * there are 0-links from robin to bird, and from bird to animal, and
    it simply takes more time to traverse two links than one
* our linkers =agt and =pat are equalizers, with coercive effect
  * When we say _John sleeps_ we are committing not just to the idea that ,,,
    but (by implication) also to the idea that there is nobody else
    participating in this particular sleeping event

### To see how island parsing can provide locality constraints on spreading 172

* we need some notion of a pattern that imposes linearity constraints
  (immediate precedence). A well-known example would be the standard
* eg English SVO pattern: `=agt V =pat` and the
  * ‘nmod’ pattern A N. Both assume linearity
* simplifications for presentation
  * the subject agrees with the predicate in number and person, and that
  * other critical phrase-level features eg bar level
    (Harris, 1951; Jackendoff, 1977)
  * these require more complex graphs (feature structures in GPSG/HPSG)
* ‘radical lexicalist’ paradigm (Karttunen, 1989),
  * tactic patters are also lexical entries, though considerably less contentful
* eg _colorless green ideas sleep furiously_
  * The first islands are built on the morphologically preferred color+less and
    furious+ly
  * We can try to match the nmod pattern A N to green ideas, to ideas sleep, and
  * invoke the lexical category of the elements. Though 4lang , being a
  * -ly is a deadjectival adverb-forming suffix, and -less is adj-forming
    Since colorless is an adjective, it can match the first member of the A N
    pattern, while furiously, being D, cannot match the second member
* extramorphological formatives acting as separate words or clitics?
  * eg the English subordinating particle _that_, which can act as a device for
    activating either/or
    * the subject of the subordinate clause the flood that engulfed me or
    * its object the vote that I cast
* To summarize [the section], we need only one operation, spreading activation,
  to handle all forms of sensemaking
  as long as we have a low-level unification primitive that enforces
  well-formedness at all times,
  * somewhat analogous to autosegmental spreading, resyllabification, and
    similar processes maintaining phonological well-formedness
  * syntax, much like morphology, is about matching patterns specified in
    lexical entries (constructions)
  * similarity/relation of this view to 
    * classical (Lambek-style) Categorial Grammar and 
    * modern Combinatory Categorial Grammar is evident, as is the relation to
    * the more lexically inspired Berkeley Construction Grammar

# 8 Trainability and real-world knowledge. Old title: Coreference 175

## 8.3 Dynamic embeddings

### Vectors

* Both Harris, 1954 and Firth, 1957 are frequently cited as early precursors of
  vector semantics, but contemporary readers will be greatly disappointed if
  they read these works with the goal of understanding these key elements of
  modern systems
  * Harris’ work is clear, well reasoned, and forms the basis for much
    theoretical and computational linguistic work in the subsequent decades,
    but neither vectors nor cooccurrence statistics play a major role in it
  * Firth, besides providing the slogan “You shall know a word by the company"
    has had practically no impact, and much of what he wrote is quite opaque
  * In truth, none of the key ideas can be fully traced to them
* the use of vectors appeared first via multivariate statistics, importing
  * Principal Component Analysis and the strongly related SVD which
  * go back to the late 19th and early 20th century. In
  * S19:2.7 we discussed how
    * Osgood, May, and Miron (1975) and
    * Deerwester, Dumais, and Harshman (1990) used these methods to study human
      conceptual structure and improve information retrieval
  * The key conceptual step,
    parting with the venerable Prague School tradition of discrete features and
    relying entirely on embedding the discrete elements in a cont vector space,
    was taken by Schütze, 1993

# 9 Applications
