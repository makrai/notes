The first BUG report
Jeff Goldberg, László Kálmán
COLING-92

# 1 Intro

* BUG differs from other unification-based grammar-writing tools in two major
  * feature geometry: a (recursive) definition of well-formed feature structs,
    which must be specified in the source grammar
  * a built-in performance restriction, called the string completion limit (SCL)
    * limit the generative power of a context-free grammar to regular languages
  * separation of the structural description (SD, conditions of application)
    from the structural change (SC, effect of application) in source rules

# 2 Feature Geometries

* feature geometry
  * term from generative phonology, where it was introduced by Clements (1985)
  * determines what feature structures are allowed by
  * specifying what (complex or atomic) values each path can have
  * feature cooccurrence restrictions (FCRs, Gazdar+ 1985)
    * local in the sense that they can be formulated in terms of
      path continuation restrictions
    * arbitrary or global constraints on wen-formed feature structures leads
      to undecidable systems if coupled with structure sharing
      (Blackburn and Spaan, 1991)
  * specify whether or not the continuations of a given path are pairwise compat
    * eg the attributes FINITE and NON-FINITE can be made incompatible
      continuations of the attribute VERB_FORM. As a result, in any actual
      feature structure at most one edge can lead from a node that a path ending
      in VERB_FORM leads to. What this mechanism allows us to express are
      also local FCRs, eg `\neg ([VERB..FORM FINITE] A [VERB-FORM NON-FINITE])`

## 2.2 How Are Feature Geometries Used?

* makes the unification operation and the unifiability test more efficient
  * geometry-based unification will fail
    if incompatible continuations of a path are to be unified
  * extra check is performed each time new continuations are created during unif
    * nL if the feature geometry is reasonably structured (ie, not flat), then
      the cost of this extra checking is insignificantly
  * major distinctions between linguistic objects are made by attributes closer
    to the root of a feature structure, and minor features are in deeply
    * the information that something is a verb will be superordinate to the
      information that it has a second person form
* assists the grammar-writer to develop her/his grammar in two ways:
  * the feature geometry forces her/him to take the semantics of features and
    feature structures more seriously than is typically the case
  * feature geometries also determine which paths can share values
    * checking of structure sharing at compile-time providing additional error
      checking on the grammar

# 3 The string completion limit

## 3.1 What Is the SCL?

* constraints on the complexity of derivation trees has a long tradition
  * Yngve (1961) limits the depth of possible derivation trees
  * limitations on the direction of their branching (eg, Yngve, 1960)
  * either too weak or too strong on their own
* Kornai's (1984) hypothesis, in terms of which
  * broad enough in its coverage, and yet conceptually simple
  * any string that can be the beginning of a grammatical string can be
    completed with k or less terminal symbols, where k (ie, the SCL) is a
    small integer. For example, consider:
    (1) This is1 the2 dog3 that4 chased5 the6 cat7 that8 ate9 the10 rat11
    (2) The 1 cheese2 thats the4 rats that6 the7
* imposes a limit on the depth of center-embedding; but
  * not constrain the depth of right-branching structures
  * Left branching, however, is limited, though the effect of this limitation is
    less pronounced than in the case of center-embedding
  * K in English can be accommodated if k is 3: In those cases when the above
    * (3) Aflerl as very
    ... long walk, sleep!
  * cross-serial dependencies
    * Although the current implementation of BUG uses the context-free source
      grammar format, in which so-called cross-serial dependencies cannot be
    * SCL also puts an upper bound on tile length of these:
* additional consequences (and maybe more). First, it
  * excludes certain lexical categories, such as modifiers of adjective
    modifiers (if k < 4). If, say, shlumma were a word of that category, then we
    would need at least 4 words to complete Aftera shlumma... (cf  (3) above)
  * all upper limit is placed on the number of obligatory daughters of
    non-terminal nodes

## 3,2.  How Is the SCL Used?

* we can produce the biggest regular subset of a context-free language that
  respects the SCL. Can be sketched as follows
  * produce a recursive transition network (RTN) A equivalent to the grammar
  * An RTN is like a finite-state automaton, but its input symbols may be RTNs
    or terminal symbols
  * assign a minimum completion length (K in the tables above) to each node
  * If B is an RTN accepted by the transition from state s1 to state s2 in A,
  * Since the K-value of s2 may be bigger than 0, assigning K values to some
    states of B may be impossible (if those values would exceed k). We leave
    out those states (and whatever additional states and transitions depend on
    them)
  * In those cases when the above procedure would not terminate (ie, when s2
    is an accepting state in A and B is the same RTN as some other RTN C the
    acceptance of which takes the machine to s2), we eliminate the transition
    corresponding to B, and collapse s1 with the initial state of C (with the
    standard technique). So the procedure will terminate in all cases

# 4 Structural description vs structural change

* unificationalists have been asserting that this old-fashioned distinction
  should be abandoned
  (ie pieces of information coming from different sources have the same status)
* hE origins of a piece of information may matter
  (Zaenen and Karttunen, 1984; Pullum and Zwicky, 1986; Ingria. 1990)
* in BUG
  * The structural description in a BUG rule specifies
    the conditions under which the rule can be applied in the parsing process.
    * ie when parsing, it refers to the right-hand side of the rewrite rule
      only, and it is never used to update any feature structure
    * check unifiability,
  * The structural change describes
    what action to take when the structural description is satisfied
    * ie how to build a new feature structure (when parsing, this corresponds to
      the left-hand side of tile context-free rule)
    * builds structure
    * Unifiability differs from unification in a crucial respect
* example:
  1.  A: []
      B: [NUMBER = SINGULAR]
      C: [NUMBER = PLURAL]
  * A is unifiable with B and A is unifiable with C, even though
    B is not unifiable with C
    * if a structural description requires
      unifiability of A with both B and C, it will be satisfied.
    * hE if we were to formulate this requirement in terms of unification,
      as is currently done in unification-based grammars, then
      A, B and C will not satisfy this requirement
  2. auxiliary verb should agree with each subject of a co-ordination:
    * (6) Will Jean leave and the others arrive?  
    * This sentence is in because
      will's NUMBER is unifiable with both that of Jean and that of the others,
      although the unification of all three NUMBER values still fails
    * So BUG will behave correctly in this case

# 5 Generative Capacity

* distinction between the context-free grammar format and context-free grammars
  * a unification-based grammar in the context-free format is not context-free
    unless the number of possible feature structures arising in all its possible
    derivations is finite. By the same token, the
  * automata compiled by BUG would not recognize a regular language if we did
    not constrain the possible feature structures that they give rise to
* The separation of SDs from SCS allows BUG to avoid this problem
  * SDs are only used in unifiability tests and are never modified at run-time,
  => they can be constrained in such a way that they yield a finite set of
    equivalence classes of feature structures
  * SCs only affects the structures being built and
    cannot interfere with the trajectory through the automaton
    ~> unification (but not unifiability tests!) may never fail
* we use an associative, idempotent and commutative version of 'default
  unification' (see Bouma, 1990), which we are not going into here
  => The automaton produced by BUG is actually finite-state
  * an extremely important benefit, if not the most important one, of
    separating SDs from SCs in a grammar-writing system
