András Kornai
Mathematical linguisitcs
2007

# 5 Syntax

## 5.2 Grammatical theories

### 5.2.2 Linking

* ‘direct’: proceed from the arguments of the verb, defined semantically, to the
  linkers, which are visible on the surface, using only one intermediary, the
  deep cases. In contrast, 
* indirect theories invoke two sets of intermediaries, deep cases and
  grammatical functions (subject, object, etc.), as well.  
* Relational grammar does not use a separate apparatus for these two
  * but does permit derivational strata, which make the overall theory indirect.
* same is true of case grammar, which in its 
  * original form (Fillmore 1968) was clearly intended as a direct theory but
    used transformations, which brought strata with them
* there is little to recommend the traditional notion of grammatical function.
* phenomena that point at differences not easily explained without reference to
  subjects and objects.  Consider first the behavior of 
  * reflexives: John shaved himself is obviously grammatical and `*`Himself shav
* a third set of primitives, called thematic roles or theta roles, that are
  regularly invoked in classifying verbal arguments. These are 
  * intended as fully semantical, expressing generalizations that follow from
    the meaning of verbs
  * e.g. if V is an action and NP refers to the Agent of this action, then NP
    intends V to happen. Comparing John accidentally killed the pedestrian to
    * _kill_ does not require an Agent but _murder_ does. The theories of
      linking discussed so far distinguish between deep and surface cases and
      keep both of these distinct from both grammatical functions (subject,
      object, indirect object) and thematic roles to the extent they admit
* Direct theories that refer to thematic roles use them purely as abbreviatory
  devices to distinguish different classes of verbs with different lexical
  entailments, while 
* indirect theories, to which we now turn, permit combinatorical statements that
  refer to more than one set of primitives.

## Semantics-driven theories

* [e.g. split ergativity] gives rise to the suspicion, shared by many in the
  field of artificial intelligence (AI), that mainstream linguistics goes about
  the whole matter the wrong way, invoking too many hard to define and hard to
  apply grammatical intermediaries in what
  * should be a straightforward mapping from thought to expression.  The goal
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
    * actors fulfilling ... roles, e.g.  that of the waiter or the best man,
    * decompose the prototypical action in a series of more elementary
      sub-scripts such as ‘presenting the menu’ or ‘giving the bride away’
  * linguistically better motivated models, in particular discourse
    representation theory
    * scope is more modest, being concerned primarily with the introduction of
      new entities (the owner, the best man)
  * studies of ritual, in particular in the Indian tradition (Staal 1982,1989)
* conceptual dependency (Schank 1972) ... extends ideas familiar from
  dependency grammar down to the level of mental language
  * To apply the MIL formalism of Section 5.2 to Conceptual Dependency, we take
    * primitive objects to be the atomic symbols PP, PA, and AA (which in CD
      correspond roughly to nouns, adjectives, and adverbs), ATRANS, PTRANS,
      MTRANS, GRASP, PROPEL, MOVE, INGEST, EXPEL, ATTEND, SPEAK, MBUILD, and DO
      (which correspond roughly to verbs), and choose the
    * `P_i` as CAUSE, BI-CAUSE, MOBJECT, INSTRUMENT, ENABLES, RESULTS,
      INITIATES, and REASON (which correspond roughly to cases)
* [átvezetés Schankból Jackendoffba]
  * This skeletal picture would need to be supplemented by a host of additional
    axioms to recapitulate the exact combinatorical possibilities of CD, e.g
    the notion that objects need to be AT-LOC before they can PTRANS out of it
    (Schank 1973). We will not pursue CD in this detail because
  * the representations preferred in linguistics tend to use a slightly
    different set of primitives;
    * e.g. for _John gave the book to Bill_ we could have
      `DO(John,CAUSE(HAVE(Bill,book)))` as the underlying semantic structure
      (Jackendoff 1972). The
    * explicit use of implicit illocutionary primitives _such as `DO`_ in this
      example is particularly characteristic of the generative semantics school
      (Harris 1995)
* Wierzbicka
* conceptual modeling of the _folk theory_ or _naive theory_ behind conceptual
  entities fits very well in the style of logical analysis undertaken in AI
  (Hayes 1978), except perhaps for the issue of [language-dependence]
* autonomy of syntax thesis that both
  * the combinatorical properties of words and the grammatical descriptions of
    sentences are independent of their meaning
* [summary of 5.3]
  * conceptual primitives such as LIVE and MOVE
  * axioms connecting these to each other
  * dictionary definitions or meaning postulates that
    connect the vast majority of lexical items to [the few primitives]
  * inner syntax [of] conceptual representations, both primitive and derived

## 5.7 Further reading

* Moravcsik and Wirth (1980) presents the analysis of (5.8) and (5.9) in a
  variety of syntactic frameworks. Some of these frameworks are still in use in
  essentially unchanged format; in particular
  * tagmemics, being the standard theory at the Summer Institute of Linguistics
    is in wide use, and covers an immense variety of languages, many of which
    have no analyses in any other framework
* The first proposal within generative linguistics to use case as the driving
  mechanism for syntax was by Fillmore (1968, 1977). The standard introduction
* ergativity is Dixon (1994). 
* Dependency grammars are due to Tesnière (1959).  Other modern formulations
  include Sgall+ (1986), Mel’cuk (1988), Hudson (1990), and McCord (1990).
  * Again, 
    * an important early result that served to deflect interest from the area
      was by Gaifman (1965), who proved the equivalence of one formulation of
      dependency grammar to CFGs, and again the area 
    * revived largely because of its strong connections to key notions of grammr
* A variety of dependency and valency models are 
  surveyed in Somers (1987) and Tapanainen and Järvinen (1997). 
* A modern survey of argument linking theories is Levin and Rappaport (2005).

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

* a range of syntactic theories we called grammatical because they rely on
  notions such as (deep) case, valence, dependency, and linking, which are
  _expressed only indirectly in the manner in which words are combined_: sec 5.2
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
* nonstandard propositional logic, perhaps e.g. the kind that Belnap (1977)
  thinks a computer should use when reasoning from inconsistent information
* Ginsberg’s (1986) system D, which
  * combines paraconsistency with default reasoning
