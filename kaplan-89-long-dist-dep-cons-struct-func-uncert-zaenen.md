Long-Distance Dependencies, Constituent Structure, and Functional Uncertainty
Ronald M Kaplan and Annie Zaenen
1989 In Baltin & Kroch eds _Alternative Conceptions of Phrase Structure_ U Chic
1995 In Dalrymple+ _Formal Issues in Lexical-Functional Grammar_ Stanford Uni

# 1 Introduction

* Tree representations are used in generative grammar to
  represent very different types of information
  * Whereas in structuralist practice
    (at least as reconstructed by early transformationalists),
    Phrase Structure Markers were used to represent
    surface cooccurrence patterns,
    transformational grammar extended their use
    to more abstract underlying structures where they
    represent, for example, ‘grammatical relations’
  * The claim embodied in this extension is that
    the primitives of a tree representation,
    namely, linear order, dominance (but not multi-dominance) relations and
    syntactic category labels,
    are adequate to represent several types of dissimilar information
  They have been used, for example, to represent the
  dependencies between predicates and arguments needed for semantic interpret
  and also the organization of phrases that supports phonological interpret
  * In recent work in phrase-structure-based frameworks there has been
    some weakening of this claim. For example,
    almost all proposals now separate out linear order from dominance relations
    * represent grammatical functions mainly in terms of the latter
    * See Pullum (1982) for an early proposal separating these two aspects
* Lexical-Functional Grammar (like Relational Grammar) rejects this claim and
  * represent information about predicate argument dependencies in structures
    that allow multi-dominance and ignore linear order
  * primitives in these representations are not categories like noun or sentence
    * approximates the more traditional functional notions of subject, OBJect,
  * tree representations (called constituent structures or c-structures in LFG)
    is restricted to the surface structure, which is assumed to be
    * the input to the phonological component; information about
  * predicate argument dependencies and the like is represented in the
    functional structure (f-structure).
* anomaly that the original formulation of LFG (Kaplan and Bresnan 1982) used
  c-structures to state generalizations about long-distance dependencies of the
  (1) Who did Bill claim that Mary had seen?
* generative frameworks
  * there is no other device than the phrase structure
  * Most previous accounts of long-distance phenomena were stated there
  * Early LFG proposals (Kaplan and Bresnan 1982, Zaenen 1980, 1983)
    incorporated and developed such c-structural notions
    without seriously examining the assumptions underlying them.
  * But given that LFG makes a clear distinction between the functional and phra
    * encodes predicate-argument relations specifically in functional structure
    * embodies the claim that pred-arg relations are not directly relevant to
      long-distance dependencies
    * surprising, given that so many other syntactic phenomena are more
      sensitive to properties and relations of f-structure than to those of
      c-structure
  * long distance dependencies too obey
    functional rather than phrase structure constraints
  * This motivates the revision to the LFG treatment of long distance dependen-
  * This treatment depends on
    a new formal device for characterizing systematic uncertainties in
    functional assignments.
* The organization of the paper is as follows: in the first section we give an

# 2 The Relevance of Functional Information: Icelandic Island Constraints 3

* long distance dependencies
  out of adjuncts are more restricted than those involving arguments, To give
  an example from
* in (1) the initial Who is interpreted as an argument of the predicate _see_
  within the sentential complement of claim, vs the following:
  (2) * Which picture did they all blush [elpirul] when they saw?
* In (1/2) the embedded clause is an argument/adjunct of the matrix verb
  * This contrast cannot be accounted for simply in terms of node labels,
    because in both (1) and (2) S and/or S’ appear in the ‘syntactic binding
    domain’ (as defined, for example, in Zaenen 1983)
  * In English, it can be plausibly claimed that these sentences differ in the
    configurations in which the nodes appear, so that a c-structure account of
    the contrast is not implausible
  * A similar contrast in acceptability is found in Icelandic. In the Icelandic
    * no difference in surface phrase structure configuration accounts for it
* summarize the arguments given for surface structure in Thrainsson (1986) and
  * sentences with an auxiliary or a modal have a surface structure that is
    different from those that have no auxiliary or modal.
(3) a. Hann mun S stinga `*`S smjorinu `*`S i vasann S.
       He will put butter-the in pocket-the.
       ‘He will put the butter in his pocket.’
  b.  Hann stingur S  smjorinu S i vasann S.
      He puts butter-the in pocket-the.
      ‘He puts the butter in his pocket.’
* difference shows up is
  * when a so-called wandering adverb is added to either of
    * for (3a) there are only two possible positions for such an adverb as in 4
      for (3b) there are the additional possibilities illustrated in (5): a.
      S = _smjorinu_ `seldom`
  * indefinite subjects and ‘floating’ quantifiers show the same placement contr
    * see Thrainsson (1986) for examples of these two latter phenomena.
* Rather than proposing that these three types of elements are
  introduced by different rules in sentences with and without auxiliaries,
  Thrainsson proposes that it is the constituent structure of the clause that
  differs while the constraints on the distribution of the adverbs, indefinite
  subjects and quantifiers remain the same.
  * The generalization is that the adverbs, indefinite subjects and quantifiers
    are daughters of S but can appear in any linear position
    * Thus they can be placed between each pair of their sister constituents
      (modulo the verb second constraint, which prohibits them from coming
      between the first constituent of the S and the tensed verb)
    * This will give the right results if we assume that the c-structure for
      sentences with/out an auxiliary is as in (6/7)
      6. S -> NP AUX/V VP[V NP PP]
      7. S -> NP V NP PP
* Dominance Constraints:
  * S can immediately dominate \upV, VP, NP, PP, ADV}
  * VP can immediately dominate \upV, VP, NP, PP}
  * V is obligatory both in S and in VP.
* Ordering Constraints:
  * for both S and VP: V < NP < PP < VP
  * for S: XP immediately precedes V[+tense] (verb-second constraint)
* These constraints (given here in a partial and informal formulation),
  together with LFG’s coherence, completeness, and consistency requirements,
  provide the surface structures embodying Thrainsson's generalization
* Icelandic differs from English in allowing Ss in PPs, as shown in (10) to
  * These are analyzed as PP’s in Icelandic because in all these cases the S'
    alternates with a simple NP:
  (i) Jén kom eftir kvéldmatinn.
      ‘Jon came after dinner.’
  (ii) Jén var ad hugsa um Mariu.
       ‘Jon was thinking about Maria.’
  * In general, the simplest hypothesis about Icelandic phrase structure rules:
    an S’ is permitted wherever an NP can appear (if the meaning allows it).
(10) Hann fér eftir ad ég lauk verkinu.
     He went after that I finished work-the.
     ‘He left after I finished the work.’
(11) Jén var ad bvo golfid eftir ad Maria haf6i skrifad bréfid.
     John was at wash floor-the after that Mary had written letterthe.
     ‘John was washing the floor after Mary had written the letter.’
(12) pu vonadist til ad hann fengi bil.
     You hoped for that he will-get car.
     ‘You hope that he will get a car.’
(13) Jén var ad hugsa um ad Maria heféi liklega skrifad bréfid.
     John was at think about that Mary had probably written letter-the.
     ‘John was thinking that Mary had probably written the letter.’
* the PP clause in 10&11/12&13 is an adjunct/argument
* these complex embedded structures because they allow a straightforward
  illustration of the patterns of long-distance dependencies:
  we find cases that exhibit the same local categ configurations (PP over S’),
  but differ in their long-distance possibilities:
(14) `*`Hvada verki for hann eftir ad ég & lauk?
      Which job went he after that I finished?
      ‘Which job did he go [after I finished]?’
(15)  `*`pessi bréf var Jén ad pvo golfid eftir ad Maria haféi skrifad.
      This letter was John at wash floor-the [after that Mary had written]
      ‘This letter John was washing the floor after Mary had written.’
(16) Hvada bil vonadist pu til ad hann fengi?
     Which car hoped you for [that he will-get]?
     ‘Which car did you hope that he would get?’
(17) bessi bréf var Jén ad hugsa um ad Maria hefdi liklega skrifad.
     This letter was John at think [about that Mary had probably written].
     ‘This letter John was thinking that Mary had probably written.’
* extractions are allowed from the PP-S’ configuration
  only when it is an argument;
  it forms a wh-island when it functions as an adjunct.
  * This is true for tensed clauses, but
    we have not yet investigated infinitives
    * infinitives tend to be less strong as islands, but
    * further studies are needed to understand fully the influence of tense on
      island constraints
* In defining the original c-structure formalization for long-distance dependen,
  Kaplan and Bresnan (1982) noted that the correlation of
  extraction constraints with categorial configurations is far less than perfect
  * bounding-node specifications in individual phrase-structure rules
    to characterize the variations of long-distance dependency restrictions
    across languages and
    across different nodes of the same category in a particular language.
    their formal devices are sufficient to describe these Icelandic facts:
  * The argument and adjunct PP’s can be introduced in separate phrase-structure
    expansions, with only the PP receiving the aDJunct function assignment boxed
    as a bounding node
  * the boxing device is used to import functional distinctions into the c-struc
    Looking back at the discussion in Kaplan and Bresnan (1982) one realizes
  * when one instance of a given category is boxed as a bounding node and
    another is not, those instances also have different functional schemata
    attached (ADJ vs.
    one of the oblique argument functions in the Icelandic example, or
    the COMP vs. RELMOD functions that distinguish English
    that-complement S's from relative clauses.)
  * Kaplan and Bresnan, while realizing that extraction domains cannot be defed
    in terms of natural classes of c-structure categories or configurations,
    did not then recognize that natural classes do exist at the functional level
  * They actually considered but quickly rejected the possibility of
    defining long-distance dependencies in terms of f-structure configurations
    because
    * no rigorous functional formalization was at hand and partly because
    * examples like (18) seemed to indicate the long-distance relevance of at
      least some categorial information that would not be available in f-struct
(18) a.  She'll grow that tall/`*`height.
     b.  She’ll reach that `*`tall/height.
c. The girl wondered how tall she would grow/``*``reach.
   The girl wondered what height she would ``*``grow/reach.
  * adjective phrases can only be extracted from AP positions and
    noun phrases only from NP positions, and, more generally, that
    fillers and gaps must have matching categories
  * they ignored the apparently functional constraints on long-distance extract
    * defined special formal mechanisms for encoding those constraints in c-stru
* The Icelandic data given above, however, suggest that
  a more functional approach would capture the facts more directly
  * In section 3, we will show that the data in (18) can also be naturally
    analyzed in functional terms
  * constraints on extraction that in LFG terms are functional in nature
    have also been proposed by completely structure-oriented syntacticians
  * The Icelandic data can is a case of the Condition on Extraction Domain
    proposed in Huang (1982), which can be interpreted as
    * an emerging functional perspective formulated in structural terms:
(19) No element can be extracted from a domain that is not properly governed.
  * Intuitively the distinction between governed and nongoverned corresponds
    to the difference between argument and nonargument
  * hE it is clear from Thrainsson’s arguments for the difference in structure
    between sentences with and without an auxiliary that
    the correct notion of government cannot be simply defined over c-structures.
    To represent the difference between the two types of PP’s as in (20) would
    go against Thrainsson’s generalization.
  * Indeed, adverb placement shows that both adjunct and argument PP’s are
    * sisters of S when there is no auxiliary but are both
    * in the VP when an auxiliary is present
    * Zaenen (1980); the extractability from an S is
      determined by a lexical property of the complementizer that introduces it.
      Under that hypothesis the adjunct /argument contrast discussed here would
      be unstatable, since
      the same complementizer appears in both constructions.
(21) a. Eg vonadist alltaf til ad hann fengi bil.
        I hoped always for that he will-get car.
        ‘I always hoped that he would get a car.’
  b.  Eg hef alltaf vonast til ad hann fengi bil.
      I have always hoped for that he will-get car.
      ‘I have always hoped that he would get a car.’
  c. `*`Eg hef vonast alltaf til ad hann fengi bil.
     I have hoped always for that he will-get car.
(22) a.  Hann for alltaf eftir ad ég lauk verkinu.
         He went always after that I finished work-the.
         ‘He always went after I finished the work.’
  b. Hann hefur alltaf farid eftir ad ég lyk verkinu.
     He has always gone after that I finished work-the.
     ‘He has always gone after I finished the work.’
  c. `*`Hann hefur farid alltaf eftir ad ég lyk verkinu.
     He has gone always after that I finished work-the.
* same pattern in the context of a long-distance dependency, as the following
(23) a. `*`Hvada verki fér hann alltaf eftir ad ég lauk?
        Which job went he always after that I finished?
        ‘Which job did he always go after I finished?’
  b. Hvada bil vonadist bu alltaf til ad hann fengi?
     Which car hoped you always for that he will-get?
     ‘Which car did you always hope he would get?’
* Thus in Icelandic the same c-structure configuration allows for extraction
  when the PP is an argument but not when the PP is an adjunct
  * Netter (1987) draws a similar conclusion from data concerning
    extraposition of relative clauses in German. Given these facts, an adequate
  * a structurally-based account will have to appeal to stages in a derivation®
    * different tree structures for these sentences
      at the moment the relevant movement takes place
    * Whether this is feasible or not will depend on one’s view on principles
      like cyclicity and the like and we leave it to structural people
    * From our nonderivational perspective the most straightforward approach
      * long distance dependencies are sensitive to functional information and
      * how such constraints canbe formulated in functional terms.”
      * the Icelandic data also do not allow for a syntactic account in
        frameworks like GPSG which define ‘government’ solely on the surface

# 3 The Formal Account: Functional uncertainty 10

* for a more extensive discussion of the mathematical and computational aspects
  of this mechanism, see Kaplan and Maxwell (1988)
* long-distance dependencies seem difficult to characterize because they
  involve rather loose and uncertain connections between
  the superficial properties of local regions of a string and its
  more abstract functional and predicate-argument relations
  * For many sentences this connection is very direct and unambiguous
    * If eg the first few words of an English sentence have the internal
      organization of an NP, they often function as the subject of the sentence.
  * garden-path sentence such as (24),
    (24) The cherry blossoms in the spring.
    it is not clear from the local evidence which words make up the initial NP,
    * have never seemed difficult to describe, since
      all grammatical theories admit alternative rules and lexical entries to
      account for all the local possibilities and
      provide some method of composition that may reject some of them
      on the basis of more global contextual information
  * What distinguishes the uncertainties in long-distance dependencies is that
    the superficial string properties local to eg a fronted English topic are
    compatible with an unbounded number of within-clause functional or
    predicate-argument relations
    * The infinite set of possibilities cannot be specified in any finite number
      of alternatives in basic rules or lexical entries, and
* handle this kind of unbounded uncertainty
  * Structural approaches do so through conspiracies of transformations that
    introduce empty nodes and prune others
    => destroy the simple connection between the surface and underlying tree
  * Our solution to the uncertainty problem is much more direct: we utilize
    * a formal device that
      permits an infinite set of functionally constrained possibilities to be
      finitely specified in individual rules and lexical entries.
* Kaplan and Bresnan (1982) observed that each of the possible underlying
  positions of an initial phrase could be specified in a simple equation locally
  associated with that phrase. In the topicalized sentence (25):
(25) Mary John telephoned yesterday.
  * the equation (in LFG notation) (\up Topic) = (\up OBJ)
(26) Mary John claimed [that Bill telephoned yesterday].
the appropriate equation is (\up TOPIC) = (\up COMP 0BJ), indicating that
* The sentence can obviously be extended ‘by introducing additional complement
  predicates (Mary John claimed that Bill said that .... that "Henry telephoned
  yesterday)
* equation of the general form (\up TOPIC) = (\up COMP COMP ...  OBJ)
* The problem, of course, is that this is an infinite family of equations, and
  hence impossible to enumerate in a finite disjunction
* Kaplan and Bresnan
* a simple extension of the elementary descriptive device in LFG, the
  functional-application expression. In the original formalism
(27)
(f s) = v holds if and only if f is an f-structure, s is a symbol, and
  the pair <s, v> \in f
  * extended to allow for strings of symbols, eg in (\up COMP OBJ) above.
  * If  x = sy is a string composed of an initial symbol s followed by a
    (possibly empty) suffix string y, then
(28) (f x) := (fs) y)
     (f \epsilon ) = f, where \epsilon is the empty string.
* allow the argument position in these expressions to denote a set of strings.
  * The interpretation of expressions involving sets of strings is derived in
    the following way from the interpretation (28) for individual strings.
    Suppose `a` is a (possibly infinite) set of strings. Then we say
(29)
  (f a) = v holds if and only if
  ((f s) Suff(s, \alpha)) = v for some symbol s,
  where Suff(s, \alpha) is the set of suffix strings y such that sy \in \alpha
* In effect, an equation with a string-set argument holds
  if it would hold for a string in the set that results from a sequence of
  left-to-right symbol choices
* For the case in which `a` is a finite set this formulation is equivalent to a
  finite disjunction of equations over the strings in `a`
* Passing from finite disjunction to existential quantification captures the
  intuition that unbounded uncertainties involve an underspecification of
  exactly which choice of strings in \alpha will be compatible with the
  functional information carried by the surrounding surface environment.
* We of course impose the requirement that the membership of a be characterized
  in finite specifications
  * linguistically, mathematically, and computationally advantageous to
    require that \alpha in fact be drawn from the class of regular languages.
  * a regular expression over the vocabulary of grammatical function names
(30) `(\up Topic) = (\up COMP* OBJ)`
* appropriate predicate-argument relations can be defined without relying on
  empty nodes or traces in phrase-structure trees
  * the phrase-structure representations much more faithful to the surf org
  * Thus a constraint like the one proposed by Perlmutter (1971) that
    * (tensed) clauses must have local surface subjects
      (and hence that question movement of the subject is not allowed)
      would follow in a straightforward way from
      making the NP constituent bearing the subject equation obligatory in the
      phrase structure rule.
* possible only because subcategorization in LFG is defined on f-structure via
  the completeness and Coherence conditions and is
  * independent of phrase-structure configurations.
* mathematical and computational properties of functional uncertainty are
  discussed further in Kaplan and Maxwell (1988). Here we sum-
  * mathematical characteristics briefly:
  * it is clearly decidable whether a given f-structure satisfies a functional
    description that includes uncertainty specifications.
    * Since a given f-structure contains only a finite number of
      function-application sequences, it contains only
      a finite number of strings that might satisfy an uncertainty equation
      * The membership problem for the regular sets is decidable and each
  * It is less obvious that the satisfiability problem is decidable
  * Given a set of equations describing a functional structure for a sentence,
    is there a structure satisfying all the equations?
  * The difficult case arises when the functional description has two
    uncertainty equations, say `(f a) = v_a` and `(f b) = v_b`
  * If `a` contains (perhaps infinitely many) strings that are initial
    prefixes of strings in b, then the strings that will be mutually
    satisfiable cannot be chosen independently from the two languages.
  * eg, the choice of x from `a` and xy from b implies a further constraint on
    the values v_a and v_b: for this particular choice
    we have (f x) = v_a and (f xy) = ((f x) y) = v_b,
    which can hold only if (v_a y) = v_b
  * Kaplan and Maxwell (1988) show,
    based on a state-decomposition of the finite-state machines
  * there are only a finite number of ways in which the choice of strings from
    two uncertainty expressions can interact.
  * The original equations can therefore be transformed into an equivalent
    finite disjunction of derived equations
    whose remaining uncertainty expressions are guaranteed to be independent.
  * ie no uncertainty when each of the remaining regular languages is replaced
    by a freely chosen member string
    * The satisfiability of descriptions of this sort is well-established
    * A similar proof of satisfiability has been developed by Mark Johnson
  * If the residual uncertainties include an infinite number of strings, then
    an infinite number of possible f-structures will satisfy the original
    description and are thus candidates for the f-structure that the grammar
    assigns to the sentence
    * This situation closely resembles the general case that arises for
      descriptions without uncertainties
    * As Kaplan and Bresnan (1982) noted,
      if a description is consistent
      then an infinite number of f-structures will satisfy it
    * These f-structures are ordered by a SUBJumption relation and
      Kaplan and Bresnan defined the SUBJumption-minimal satisfying structure
      to be the grammatically relevant one.
    * The family of f-structures that satisfy the residual uncertainties is also
      ordered, not just according to SUBJumption but also according to lengths
    * We extend the minimality condition of LFG by requiring that the
      f-structure assigned to a sentence include only the shortest strings
      realizing a particular uncertainty
      * In this way we follow the general LFG strategy of excluding from
        consideration structures that involve arbitrarily redundant information.
  * See Kaplan and Maxwell (1988) for further discussion.
* This formalism may apply to phenomena that are
  * traditionally not thought of as falling into the same class as long-distance
  * involve some degree of uncertainty
  * Germanic infinitival complements and
    * Johnson (1986) and Netter (1986) have used it in the analysis of
  * facts in Finnish that would otherwise require type-raising.
    * Karttunen (1989) discusses how
      similar extensions to Categorial Unification Grammar can account for re-
  * Halvorsen (1988) has extended its use to the semantic domain, where it
    * various kinds of quantifier scope ambiguities
  * In this paper we illustrate the formalism by showing how it can be used to
    represent different conditions on long-distance dependencies
* Consider the multi-complement sentence (31) whose c-structure and f-structure
  are given in (32) and (33):
  (31) Mary John claimed that Bill said that Henry telephoned.LONG-DISTANCE
  * Notice that the tree in (32) has no empty NP node in the embedded clause.
  * The link in the functional structure (33) indicates
    between the topic and the OBJect of the most deeply embedded complement
    * functional identity;
    * just like the relation between a functional controller in a raising or
      equi construction and its controllee
      (see the discussion of functional control in Kaplan and Bresnan 1982)
    * The linguistic conditions on the linkages in
      functional control and long-distance dependencies are quite different,
      * functional uncertainty in long-distance dependencies can be subdivided
        * conditions on the potential functions at the end of the uncertainty
          path (the bottom, OBJ in this example) and
        * conditions on the functions in the middle of the path
          (the body, here COMP*)
* the bottom. There are a variety of other within-clause functions that the
  topic can have, and the equation might be generalized to (34)
`(\up Topic) = (\up COMP* GF)`
* GF denotes the set of primitive grammatical functions
* this is too general for English since
  * As we discuss in Section 3
  * the topic cannot serve as a within-clause complement
  * A more accurate specification is
`(35) (\up Topic) = (\up COMP* (GF \setminus COMP))`
* where GF—COMP denotes the set of grammatical functions other than COMP. This
* still much too general, in that it permits a great number of possible bottom
  functions most of which would be unacceptable in any particular sentence.
* other requirements that are imposed on it, not only
  * case-marking and agreement etc.
  * the general principles of consistency, completeness, and coherence.
(36) `*`Mary, he said that John claimed that Bill saw Peter.
  * ignore the interpretation with Mary as a vocative
  * If OBJ is chosen as the bottom function
    * and the body reaches down to the lowest clause, the features of Mary will
      be inconsistent with the features of Peter. An
      * even if Peter were replaced by a repetition of the word Mary
        because of the instantiation property and Bresnan of LFG’s semantic forms
        (Kaplan 1982)
    * If the body does not reach down to the lowest clause, then
      one of the intermediate f-structures will be incoherent:
      * neither of the predicates claim nor say take OBJects.
  * The f-structure would also be incoherent if
    * some other function, say 0BJ2, were chosen as the bottom or if
    * the body were extended below the lowest clause.
* restrictions on the sequence of functions forming the body can be stated
  in terms of regular predicates
  * The following sentence has the same c-structure as (36) but is
    grammatical and even ambiguous, because the function ADJ can be the bottom:
    (37) Yesterday, he said that Mary claimed that Bill telephoned Peter.
  * This is acceptable because ADJ is in GF but is
    * not one of the governable grammatical functions,
    * not one that can serve as an argument to a lexical predicate, and thus is
    * not subject to the coherence condition as defined by Kaplan and Bresnan
* The restriction for Icelandic that adjunct clauses are islands might be
  (38) `(\up Topic) = (\up (GF—ADJ)* GF) `
* For English the body restriction is even more severe, allowing only
  (39) `(\up Topic) = (\up \upCOMP, XCOMP}* (GF—COMP))`
  * closed and open complements (COMP and XCOMP in LFG terms) on the path, as
* island constraints becomes a theory of the generalizations about
  the body of possible functional paths,
  expressible as regular predicates on the set of uncertainty strings.
* eg in languages that obey the complex-NP constraint.
  * RELMOD is the function assigned to relative-clause modifiers of NPs
  * RELMOD would be excluded from the body
* Other conditions can be stated
  in the phrase-structure rules that introduce the uncertainty expression.
  * These rules are of the general form
    S' ->          \Omega          \Sigma
               (\up DF) = \down
          (\up DF) = (\up body bottom)
* \Omega is to be realized as a maximal phrasal category,
* \Sigma is some sentential category, and
* DF is taken from the set of discourse functions (TOPIC, FOCUS, etc.). This
* expresses the common observation that
  constituents introducing long-distance dependencies are maximal projections
  and are sisters of sentential nodes.
  * Restricting the introduction of discourse functions to rules of this sort
    also accounts for the observation that
    discourse functions need to be linked to within-clause functions
    (see Fassi-Fehri 1988 for further discussion)
* The rule in (41) for English topicalization is an instance of this schema:
(41) S' ->                   XP or S'
                       (\up TOPIC) = \down
           (\up Topic) = (\up \upCOMP, XCOMP}* (GF—COMP))
* In English, S’ and any XP can occur in topic position.
* Spanish: some topic constructions allow NP’s but not PP’s (Grimshaw 1982

# 4 how the system handles some rather recalcitrant data from English, and in 18

* category-matching requirement (Kaplan and Bresnan 1982)
(42a) The girl wondered    how tall she would grow.
(43a)                   what height she would reach.
* Grow seems to subcategorize for an AP and reach for an NP. But
  * sub categorization in LFG is done in functional terms, and it turns out that
  * independently motivated functional constraints
    also provide an account of these facts
* First observe that reach but not grow governs the OBJ function, as indicated
(44) b.  That height has been reached.
     a. *That tall has been grown.
* Grimshaw (1982) shows that
  passivization is not dependent on syntactic category but on
  whether the verb takes an OBJ
  * Jacobson (1982) ; _ask_ and _hope_ are not susceptible to this analysis
* The verb _grow_, on the other hand, establishes a predicational relationship
  subject and its adjectival complement (XCOMP) and thus
* The relevant lexical entries for reach and grow are as follows:
  reach: (\up PRED) = ‘reach<(\up SUBJ)(\up OBJ)>’
  grow: (\up PRED) = ‘grow<(\up SUBJ)(\up XCOMP)>’
                      (\up SUBJ) = (\up XCOMP SUBJ)
* grow
  * XCOMP is chosen as the bottom function
    * Tall, being a predicative adjective, also requires a local subject, and that
    * satisfied by the control equation in  grow (\up SUBJ) = (\up XCOMP SUBJ).
    * The choice of XCOMP in _how tall she would reach_ is unacceptable because
      it makes the local fstructure for reach be incoherent
    * Choosing OBJ
      * satisfies the requirements of reach,
        but the sentence is still ungrammatical because
        the f-structure for tall, in the absence of a control equation, does not
        satisfy the completeness condition
  * the choice of OBJ at the bottom satisfies all grammaticality conditions.
* for _what height she would grow_,
  * If OBJ is chosen, the f-structure for grow is incoherent
  * If XCOMP is chosen the f-structure for grow is complete and coherent, and
    * _what height_ should take the controlled subject
    * Although some noun-phrases can be used as predicate nominals
      (She became a doctor, She seems a fool),
      others, in particular what height, cannot (*She became that/a height,
      *She seems that height, *I wonder what height she became/seemed).
    * Whether the restrictions are functional or semantic in nature
      * not synt categ eg _become_ and _seem_
* category-matching unnecessary, it does not always yield the correct results.
  * Kaplan and Bresnan (1982) discussed the examples in (46) (their 136) where a
(46)
a. That he might be wrong he didn’t think of.
b. *That he might be wrong he didn’t think.
c. *He didn’t think of that he might be wrong.
d. He didn’t think that he might be wrong.
* fronted S’ can only be linked to
  a within-clause position that is normally associated with an NP.
* Kaplan and Bresnan complicated the treatment of constituent control
  to account for these cases by allowing
  the categories of the controller and controllee
  both to be specified in the topicalization rule
* hE the lexical requirements of the verbs involved
* Bresnan (1982); association principles between
  syntactic categories and grammatical functions
* VP rule for English:
(47)
```
  VP ->    V         (NP)       (NP)           PP*       ...      (S’)
                  (↑OBJ) = ↓ (↑OBJ2) = ↓ (↑(↓PCASE)) = ↓       (↑COMP) = ↓
```
* ie the OBJ/COMP function is only associated with NPs/S's
* partial lexical entries for think and think of :1°
  * This analysis assumes an unlayered f-structure representation of oblique
    * related to the proposal of Bresnan (1982) and
    * slightly different from the two-level approach
      Kaplan and Bresnan (1982) and Levin (1986)
    * The only change necessary to accommodate the two-level representation
      * the bottom to be a two-element sequence such as OBL_OF OBJ,
        the same sequence that think-of would subcategorize for under that appr
(48)
a.  think: (\up PRED) = ‘think<(\up SUBJ) (\up COMP)>’
b.  think: (\up PRED) = ‘think<(\up SUBJ) (\up OBL_OF)>’
* The difference between the grammatical and ungrammatical sentences in (46)
  * comps cannot be the bottom of an uncertainty in English
    (whereas OBJ, OBJ2, and obliques such as OBL_OF can)
  * For 46a the choice of OBL_OF for the bottom is compatible with the lex
  * COMP cannot be the bottom,
    OBL_OF and (48b) are also the only possible choices for (46b),
    but with this string the requirement that the preposition _of_ be present
    (this requirement is similar to the conditions on idiosyncratic
    case-marking, the details of which do not concern us here)
    * Qne kind of sentence that is not ruled out on syntactic grounds is:
      That John saw Mary Bill kissed.
      * this is out for semantic reasons:
      that-clauses, regardless of their grammatical function, correspond to
      semantic propositions and propositions are not kissable
* the OBL_OF, slot in (46a) is filled in a way that would be impossible in
  sentence internal position (46c), but this
  * follows simply from the phrase-structure rules of English
    * There is no rule that expands PP as a preposition followed by an S’, no
    * a very languagespecific restriction. But as far as the
    * functional requirements of think-of:
      nothing corresponding to an S’ prevents it from serving as the OBL_OF
* no need to parameterize long-distance dependencies in terms of particular
  phrase-structure categories. This proposal
* also easily handles the following contrasts, discussed in Stowell (1981):
  (49) Kevin persuaded Roger that these hamburgers were worth buying.
  (50) `*`That these hamburgers were worth buying, Kevin persuaded Roger.
  (51) Louise told me that Denny was mean to her.
  (52) That Denny was mean to her Louise told me (already).
  (53) `*`Kevin persuaded Roger the news.
  (54) Louise told me the story.
* (53) shows that _persuade_ does not subcategorize for an OBJ2, while
  (54/51) shows that tell does take an OBJ2/COMP
* footnote
  * Notice that according to our proposal the grammaticality of (i) does not
    license (ii):
    (i) John persuaded Roger.
    (ii) `*`That these hamburgers were worth buying, John persuaded.
  * Arguments slots in LFG are reserved for semantically restricted types, as
    (iii) * John persuaded the fact.
  * One way to achieve this is to assume that
    each GF is associated with a thematic role and that
    lexical rules do not change these associations
    eg a verb like _give_ takes a goal and a theme, and
    in the <OBJ, OBL_GOAL> realization
    the theme is linked to the OBJ and the goal to the OBL_GOAL
    In the <OBJ, OBJ2> construction, however, it is
    the goal that is linked to the OBJ and the theme to the OBJ2
  * For different ways to formulate this correspondence
    that preserve thematic role assignments, see Bresnan (1982) and Levin (1986)
  * With persuade,
    the goal argument is obligatory and the prepositional argument is optional,
    (iv) *John persuaded that Bill had left
* The relevant lexical information is given in (55)
(55) tell: (\up PRED) = ‘tell<(\up SUBJ) (\up OBJ) (\up OBJ2) >’ or
           (\up PRED) = ‘tell<(\up SUBJ) (\up OBJ) (\up COMP)>’
 persuade: (\up PRED) = ‘persuade<( fT SUBJ) (\up OBJ) (\up COMP)>’
* The ungrammaticality of (50) <= the bottom cannot be a COMP, whereas
* (52) is acceptable because an OBJ2 is permitted.
* Our proposal is different from the one made in Stowell (1981) in that
  * adjacency plays no role for us,
    so we do not need incorporation rules to account for (51-52)
  * phrase-structure rules and functional structure are in a much looser rel
  * the incorporation analysis of (51) is not independently motivated
  * Both proposals account for
    generalization made in phrase-structure terms by Higgins (1973), namely,
    that S’ topicalization is only possible from an NP position
    * include contrasts involving extraposition like those in (56):
      (56) a. That Susan would be late John didn’t think was very likely.
           b. * That Susan would be late John didn’t think it was very likely.
* Extraposition is a lexical rule that
  for each extraposable entry of the form in (57a)
  adds a lexical entry of the form shown in (57b):
  (57) a. (\up PRED) = ‘R<(\up SUBJ) ...>’
       b. (\up PRED) = ‘R<(\up COMP) ...>(\up SUBJ)’
          (\up SUBJ PERS) = 3
          (\up SUBJ NUM) = SG
          (\up SUBJ GEND) = NEUT
* This rule applied to the lexical entry for likely yields (58) and accounts for
  * ... = empty string
  * That Susan will be late is likely
    It is likely that Susan will be late.
* Since a PRED value must be linked to a thematic function,
  either directly or by a chain of functional control,
  expletive _it_ as in (59) is the only possible realization of the nonthem SUBJ
  in (59b): (60) it: (\up PERS) =3 (\upt NuM) = sg (\down GEND) = NEUT (\neg\up PRED)
* the ungrammaticality of (56b) easily follows.
  * The function COMP is not a legal uncertainty bottom, so that with this entry a
  * Choosing SUBJ as the uncertainty bottom would be
    compatible with the entry corresponding to (57a),
    but => subject having a sentential PRED value,
    which the features for expletive it do not allow.
* The lexical extraposition rule also interacts with
  the phrase structure rule that introduces sentential subjects to exclude (60):
    (61) *John didn’t think (that) that Susan would be late was very likely.
  * Whereas the phrase-structure rule for embedded clauses is as given in (62a),
    main clauses also allow the one given in (62b)
(62) a. S ->      (NP)         VP
            (\up SUBJ) = \down
  b.  E —>       (XP)        VP
           (\up SUBJ) = \down
* E is the category for a root-node expression and
* XP can be any phrase that can bear the subject function,
  namely S’, PP (as in _Into the room jumped a rabbit_; see Levin 1986) and NP
* In embedded position, however, we only find NP.
* footnote
  * These rules also allow us to account for the ungrammaticality of (i) & (ii):
    (i) *That John will be late seems.
    (ii)*That John will be late Bill doesn’t think seems.
  * seem has only the ‘derived’ lexical entry in (57b) and not the one in (57a).
  * Thus the thematic argument with seem is always a COMP and never a SUBJ, and
    * there are no sentences like (iii) that might lead to (ii):
      (iii) *John/The fact seems
* Our discussion ignores embedded questions but it is clear that
  some contrasts like the one exemplified in (62) can be treated along the same
  (63) a. `*`Whether John would come early she didn’t wonder.
       b.    Whether John would come early she didn’t know.
* Translating the observations of Grimshaw (1979) into our framework, we would
  * wonder takes a COMP only whereas
    know allows for a COMP and an OBJ.
* But the general problem of embedded questions needs further study: it is well
  * in some cases embedded questions are more OBJ-like than that-clauses.
  * We don't propose a general treatment.
* summ
  * a functional approach can account for the basic correspondences that
    characterize
    * long-distance dependencies >= well as previous category-matching approache
    * for a variety of additional facts
      that have seemed rather puzzling under a categorial analysis.

# 5 Interactions with Functional Control: Relatives 23

* no multiply dominated substructures in phrase-structure trees, and, hence,
  * any two nodes are connected by just one path. This is
  * not the case with paths in functional structure. The following example shows
(64) Mary John expected to walk.
(65)
[
  TOPIC [f1 PRED ‘Mary’]
  PRED ‘expect<(\up SUBJ) (\up XCOMP)>(\up OBJ)’
  SUBJ [ PRED ‘John’ ]
  OBJ f1
  XCOMP [PRED ‘walk( (\up SUBJ) )’
         SUBJ f1  ]]
* The matrix OBJ and the XCOMP SUBJ in this example are identified by an
  equation of functional control
  => there are two equivalent ways of resolving the topic uncertainty in this
* XCOMP is allowed in the body and OBJ and SUBJ are both allowed at the bottom.
* no need for both of these uncertainty paths?
  * English: no
  * Japanese: offers a simple account for certain
    interactions between coordination and long-distance dependencies
* Saiki (1985); some relative clauses in Japanese are constrained so that
  in a coordinate structure
  * when a SUBJ is bound in one conjunct, a SUBJ must also be bound in the other
    * Native speakers of Japanese seem to differ about the exact generalizations
  * When there is a nonsubject in the one there has to be a nonsubject in the
    other conjunct too. The pattern is illustrated by the following examples:
(66) Takashi ga kat-te Reiko ga tabeta ringo.
     Takashi SUBJ bought Reiko SUBJ ate apple.
     ‘the apple which Takashi bought and Reiko ate.’
(67) Hon o yon-de rekoodo o kiita gakusei.
     Book OBJ read record OBJ listened-to student.
     ‘the student who read a book and listened to a record.’
(68) `*`Ookiku-te Reiko ga katta suika.
        Big Reiko SUBJ buy watermelon.
        ‘the watermelon which was big and which Reiko bought.’
(69) `*`Takashi ga nagut-te Reiko o ketobashita otoko. '
        Takashi SUBJ hit Reiko OBJ kicked man.
        ‘the man whom Takashi hit and who kicked Reiko.’
* Bresnan, Kaplan, and Peterson (1985) present
  a functionally-based theory of coordination within the LFG framework.
  * coordinate structures are represented formally as a set in f-structure, with
    the elements of the set being the f-structures corresponding to the
    individual conjuncts. LFG’s function-application primitive is extended in a
    natural way to apply to sets of f-structures:
    a set is treated as if it were a function with the properties that are
    common to all its f-structure elements
  * this simple extension, which is
    * orthogonal to the extension (27) that we are proposing here, is
    * sufficient to provide elegant accounts for the wide variety of facts that
      coordinate reduction rules and across-the-board conventions attempt to
* interacts properly with the present theory of long-distance dependencies:
  * a path of functional uncertainty that passes into a set will be
    resolved independently for each of the set’s elements
  * Thus, for sentence (70a) the topic uncertainty will be resolved as XCOMP OBJ
    for the first conjunct and as XCOMP OBL, for the second.
(70) a.  Mary John expected to see      and give the book to.
     b. *Mary John expected to see Bill and give the book to.
* But even though the paths are allowed to differ from one conjunct to the other
  * if an uncertainty is resolved inside one of the functions
    it must also be resolved inside the other, as illustrated by (70b).
* The fact that uncertainties are resolved independently for each conjunct, as
  required for the English example (70a), may seem incompatible with the
  Japanese pattern in (66-69).
* Indeed, if the within-clause role of the relative clause head is specified by
  a single uncertainty expression whose bottom allows either SUBJ or non-SUBJ
  functions, the constraint, against mixing functions would not be satisfied.
* There is an obvious way of describing these facts, however, by specifying
  the within-clause function as a choice between two uncertainties,
  one with a SUBJ bottom and one with GF—SUBJ, as in the following rule for
  Japanese relative modifiers, adapted from Saiki (1985):
(71) NP ->    S'                                 NP
          (\up RELMOD) = \down   (\up RELMOD {(X)COMP}*} SUBJ) = \down
                                (\up RELMOD {(X)COMP}*} GF-SUBJ) = \down
* separate but equivalent paths in f-structure
  * The analysis of these examples does not depend on them
  * But there are other Japanese examples that contain two ~
    * one of which ends in a SUBJ and the other in a non-SUBJ
  * eg causatives which have the following lexical schemata (Ishikawa 1985)
(72) (\up PRED) = ‘cause<(\up SUBJ)(\up 0BJ2)(\up XCOMP)>’
     (\up XCOMP SUBJ) = (\up OBJ2)
* Saiki (1985); formalization predicts that
  either of the uncertainties in (71) can lead to the common element, so that
  causative phrases ought to be conjoinable
  with other clauses in which either a SUBJ or non-SUBJ is relativized. That
  * this prediction is correct is shown by the acceptability of the following
    (73) Takashi o nagutte, Reiko ga Satoru o ketobas-ase-ta otoko
         Takashi OBJ hit, Reiko SUBJ Satoru OBJ kick CAUS man
         ‘the man who hit Takashi and whom Reiko caused to kick Satoru.’
         'a Takashit megütött és Reiko által Satorut megrugatott ember'
    (74) Takashi ga nagutte, Reiko ga Satoru o ketobas-ase-ta otoko
         Takashi SUBJ hit, Reiko SUBJ Satoru OBJ kick CAUS man
         ‘the man whom Takashi hit and whom Reiko caused to kick Satoru.’
* Within a classical transformational framework,
  the causative could be analyzed as a raising or equi construction,
  but at the moment of wh-movement, the information about the ‘deep structure’
  subjecthood of the noun phrase would be unavailable
  * It would thus be expected to behave only as an object.
  * With trace theory and other enrichments of phrase structure approaches, one
    can imagine stating the right conditions on the long distance dependency.
  * hE no convergence of surface structure/postulated configuration

# 6 Conclusion 26

* LFG proposes a distinction between
  functionally conditioned and c-structure dependent phenomena. We have argued
* long-distance wh constructions are in fact functionally conditioned,
  * contrary to what was previously assumed, and hence should be accounted for
  * The Icelandic facts show that
    c-structure dominance relations are not always relevant,
  * the English facts show that
    node labels alone do not allow the proper distinctions to be made, and the
  * Japanese causative illustrates a case in which multi-dominance is necessary.
* Of course phrase-structure accounts of these phenomena are possible
  if several (successive) tree structures are admitted
  to encode different types of information and
  if traces and/or reconstruction are introduced to give the effect of
  multi-dominance
  * these accounts are not more economical than the LFG approach:
  * besides the succession of tree structures and abstract traces, further
    principles must be defined
    to govern the mapping from one tree representation to another
    (such as the pruning convention proposed in Thrdinsson (1986) and
    distinctions between casemarked & non-casemarked positions in Stowell (1981)
  * are the postulated phrase structures independently motivated?
    * As the Icelandic case illustrates, there are clear cases where they are not.
* Given this lack of convergence, we conclude that
  phrase-structure accounts obscure
  the basically functional nature of long-distance dependencies.
* In part this is because they do not formally distinguish them
  from purely distributional generalizations
  such as those concerning the ordering of adverbs in Icelandic.

# Ack 27
