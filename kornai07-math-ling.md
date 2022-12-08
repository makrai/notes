András Kornai
Mathematical linguisitcs
2007

# 5 Syntax

## 5.2 Grammatical theories

### 5.2.2 Linking

* Modern theories of morphosyntax (Ostler 1979, Kiparsky 1987, Smith 1996),p109
  differ from Pānini chiefly in their ambition to also handle analytic langs
* deep case (kāraka) will be realized (abhihita, ‘spoken’) by morphological and
  structural devices biuniquely but heterogeneously across verbs.  We have
  * biuniqueness in any fixed construction since
    every deep case that appears there will be realized by a single linker and
    every linker realizes some deep case, and we have
  * heterogeneity in that there is
    no requirement for the realization to be constant across verbs.  For
    * eg accusative (surface) case can serve to realize Goal or Patient (but)
    * Goal can also be realized by the instrumental case.  Such theories are
* ‘direct’: proceed from the arguments of the verb, defined semantically,
  to the linkers, which are visible on the surface,
  using only one intermediary, the deep cases
* indirect theories invoke two sets of intermediaries, deep cases and
  grammatical functions (subject, object, etc.), as well
* Relational grammar does not use a separate apparatus for these two
  * but does permit derivational strata, which make the overall theory indirect
* same is true of case grammar
  * original form (Fillmore 1968) was clearly intended as a direct theory but
    used transformations, which brought strata with them
* there is little to recommend the traditional notion of grammatical function
* phenomena that point at differences not easily explained without reference to
  subjects and objects
  * reflexives: John shaved himself is obviously grammatical and `*`Himself shav
* a third set of primitives, called thematic roles or theta roles, that are
  regularly invoked in classifying verbal arguments
  * intended as fully semantical, expressing generalizations that follow from
    the meaning of verbs
  * eg if V is an action and NP refers to the Agent of this action, then NP
    intends V to happen. Comparing _John accidentally killed the pedestrian_
    * _kill_ does not require an Agent but _murder_ does
* both deep and surface cases distinct from both grammatical functions
  (subject, object, indirect object) and thematic roles
* Direct theories that refer to thematic roles use them purely as
  abbreviatory devices to
  distinguish different classes of verbs with different lexical entailments,
* indirect theories, to which we now turn, permit combinatorical statements
  that refer to more than one set of primitives

## Semantics-driven theories

* eg split ergativity gives rise to the suspicion, shared by many in AI,
  that mainstream linguistics goes about the whole matter the wrong way,
  invoking too many hard to define and hard to apply grammatical intermediaries
  * mapping should be straightforward from thought to expression.  The goal
    should be simply to specify the _language of thought_
* goes back at least to the great
  * rationalist thinkers of the 17th century, in particular Descartes, Pascal,
    and Leibniz
  * Early AI research such as
    * Quillian’s (1969) Teachable Language Comprehender and
    * JR Anderson and Bower’s (1973) Human Associative Memory and
      the subsequent ACT-R
    * took quite seriously the task of accounting for human long-term memory
      including performance effects such as reaction times
* accidental and essential properties
  * What is accidental in one kind of entity may be essential in another, and
* Minsky (1975) introduced the notion of frames
  * not to be confused with the case frames introduced in Section 5.2 above
  * KR frames apply to nouns, case frames to verbs
  * Frames extend more or less naturally to events
  * To avoid confusion with case frames, we call the frame representation of
    event objects _scripts_
  * Schank and Abelson (1977). The original intention was to use scripts as
    repositories of commonsense procedural knowledge:
    * what to do in a restaurant, what happens during a marriage ceremony, etc
    * actors fulfilling roles, eg that of the waiter or the best man,
    * decompose the prototypical action in a series of more elementary
      sub-scripts such as ‘presenting the menu’ or ‘giving the bride away’
  * linguistically better motivated models, in particular discourse
    representation theory
    * scope is more modest, being concerned primarily with the introduction of
      new entities (the owner, the best man)
  * studies of ritual, in particular in the Indian tradition (Staal 1982,1989)
* conceptual dependency (Schank 1972) extends ideas familiar from
  dependency grammar down to the level of mental language
  * To apply the MIL formalism of Section 5.2 to Conceptual Dependency, we take
    * primitive objects to be the atomic symbols PP, PA, and AA (which in CD
      correspond roughly to nouns, adjectives, and adverbs), ATRANS, PTRANS,
      MTRANS, GRASP, PROPEL, MOVE, INGEST, EXPEL, ATTEND, SPEAK, MBUILD, and DO
      (which correspond roughly to verbs), and choose the
    * `P_i` as CAUSE, BI-CAUSE, MOBJECT, INSTRUMENT, ENABLES, RESULTS,
      INITIATES, and REASON (which correspond roughly to cases)
* átvezetés Schankból Jackendoffba
  * This skeletal picture would need to be supplemented by a host of additional
    axioms to recapitulate the exact combinatorical possibilities of CD, e.g
    * eg objects need to be AT-LOC before they can PTRANS out of it (Schank
      1973). We will not pursue CD in this detail because
  * the representations preferred in linguistics tend to use a slightly
    different set of primitives;
    * eg for _John gave the book to Bill_ we could have
      `DO(John,CAUSE(HAVE(Bill,book)))` as the underlying semantic structure
      (Jackendoff 1972)
    * explicit use of implicit illocutionary primitives _such as `DO`_ in this
      example is particularly characteristic of the generative semantics school
      (Harris 1995)
* Wierzbicka
* conceptual modeling of the _folk theory_ or _naive theory_ behind conceptual
  entities fits very well in the style of logical analysis undertaken in AI
  (Hayes 1978), except perhaps for the issue of language-dependence
* autonomy of syntax thesis
  * the combinatorical properties of words and the grammatical descriptions of
    sentences are independent of their meaning
* summary of 5.3
  * conceptual primitives such as LIVE and MOVE
  * axioms connecting these to each other
  * dictionary definitions or meaning postulates that
    connect the vast majority of lexical items to the few primitives
  * inner syntax of conceptual representations, both primitive and derived

## 5.7 Further reading

* Moravcsik and Wirth (1980) presents the analysis of (5.8) and (5.9) in a
  variety of syntactic frameworks. Some of these frameworks are still in use in
  essentially unchanged format; in particular
  * tagmemics, being the standard theory at the Summer Institute of Linguistics
    is in wide use, and covers an immense variety of languages, many of which
    have no analyses in any other framework
* The first proposal within generative linguistics to use case as the driving
  mechanism for syntax was by Fillmore (1968, 1977)
* ergativity: the standard introduction is Dixon (1994)
* Dependency grammars are due to Tesnière (1959).  Other modern formulations
  include Sgall+ (1986), Mel’cuk (1988), Hudson (1990), and McCord (1990)
  * Gaifman (1965) proved the equivalence of one formulation of dependency
    grammar to CFGs
    * deflected interest from the area
  * revived largely because of its strong connections to key notions of grammar
* A variety of dependency and valency models are
  surveyed in Somers (1987) and Tapanainen and Järvinen (1997)
* A modern survey of argument linking theories is Levin and Rappaport (2005)
  p149
* In Minsky’s (1975) theory, p150
  * the slots are endowed with ranges (used for p139 error checking) and often
  * explicit algorithms that compute the slot value or update other values on
    an as-needed basis, but there are
    * no clear natural language phenomena that would serve to motivate them
* the relationship between AI/KR and syntax is far more tenuous today
  * AI/KR has largely given up on syntax as too hard, and on the other, its
  * AI has moved to machine learning, a field more immediately concerned with
    linguistic pattern recognition in speech, handwriting, and machine print
    recognition (see Chapters 8 and 9) than in syntax proper
  * default inheritance and defeasible reasoning, see Ginsberg (1986a)
  * The best introduction to thematic roles remains Dowty (1991)

# 6 Semantics

# 6.1 The explanatory burden of semantics

* characterizing the set of expressions and
* characterizing the set of meanings
* expressions that have similar form should receive analyses by the same
  apparatus
* expressions occurring in fiction should receive analysis by the same
  apparatus as expressions used in nonfiction contexts
* the system must be flexible about naming
* the system must remain invariant under a change of facts
* all expressions should receive analysis by the same apparatus as supposed
  statements of fact

### 6.2.1 Montague grammar

* The problem, known as the defeasability of natural language statements, has
  given rise to a wide variety of
  * nonmonotonic logic approaches (for an overview see Ginsberg 1986a). Of
    particular interest here are
  * generic constructions such as
    * _Sea turtles live to be over a 100 years old_, which can be true even if
      the majority of specific instances fail
    * At the extreme end, some generic statements such as _P6 processors are
      outdated_ may be considered true without any individual instances holding
      true

### 6.2.2 Truth values and variable binding term operators

## 6.3 Grammatical semantics

* a range of syntactic theories we called grammatical because they
  rely on notions such as (deep) case, valence, dependency, and linking, which
  * expressed only indirectly in the manner in which words are combined
  * sec 5.2
* here: develop a formal theory of semantics that fits these theories
  as well as standard MG fits combinatorial theories of syntax

## 6.4 Further reading

* generics is Carlson and Pelletier (1995)
  * generics admit exceptions and thus require a mechanism greatly different
    from that of standard quantification (Jespersen 1924)
* nonmonotonic
  * a summary evaluation and quick dismissal of _nonmonotonic_ approaches to
    generics, see Pelletier and Asher (1997), and for a more
  * sympathetic view, see Thomason (1997) in the same volume
* standard treatment of exceptions is Moltmann (1995), who takes the exception
  domain to be subtracted from each element in the set of properties that make
  up a generalized quantifier (see also Lappin 1996)
* paraconsistent logic has already been considered by Bäuerle and Cresswell
  (1989); Possibly we would need in addition a
* nonstandard propositional logic, perhaps eg the kind that Belnap (1977)
  thinks a computer should use when reasoning from inconsistent information
* Ginsberg’s (1986) system D, which
  * combines paraconsistency with default reasoning
