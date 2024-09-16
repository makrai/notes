Vector Semantics
András Kornai
2023 Springer

# 1 Foundations of non-compositionality

## 1.1 Background

## 1.2 Lexicographic principles

Universality
Reductivity
Encyclopedic knowledge

## 1.3 The syntax of definitions

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

## 1.5 The algebra of definitions

15. BinaryAtom -> at | between | cause_ | er_ | follow | for_ | from | has | in
    | ins_ | is_a | lack | mark_ | on | part_of | under
* “doing grammar by spreading activation”
  * our concept is almost ident to that of Jackendoff and Audring, 2020 7.2.3
  * both go back to the same ideas (Quillian, 1969; Collins and Loftus, 1975),
  * obliterating the usual distinction between rules and representations. In
  * all the work is done by the representations and
    there are only a few generic rules that apply to all representations,
    primitive and derived, intermediary or final, the same way
  * characteristic of early combinatorial system like the untyped lambda
    calculus (Church, 1936) and categorial grammar (Ajdukiewicz, 1935)
  * maintained in all implementations of 4lang , be they by
    * Eilenberg machines (which directly formalize spreading activation), by
    * (hyper)graph kernel methods (Ghosh+ 2018), or by
    * direct linear algebraic manipulation

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

## 2.2 Bound morphemes

* The causative element in _-ize_ is well known (Lieber, 1992; Plag, 1998), and
* the idea that we define certain verbs by their result state is standard

## 2.3 Relations

## 2.4 Linking (causation is also in this section) 55

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
* The U/V (intransitive/transitive) distinction (p71)
* Since our goals are remarkably close, and our motivations are nearly ident,
  readers of Jackendoff and Audring (2020) may find                     (p72)
  a direct comparison between the two formalisms helpful
  * Turning to the semantic component,
    we avoid the system of linking and coindexation that J&A 4.13.1 rely on
    (equalizers introduced in 3.3 will to some extent make up for this loss)

# 3 Time and space

3.1 Space
3.2 Time
3.3 Indexicals, coercion
3.4 Measure

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
  * the instrumental case marker ins_, defined as `=pat make ins_ =agt[easy]`
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
* parsing in algebraic semantics is relatively easy:
  * It should be clear from 7.3
  * after some morphological analysis, we just look up the words in the lexicon
    and apply spreading activation and unification algorithms
  * in the same manner as we analyzed colorless green ideas sleep furi in 6.4
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
