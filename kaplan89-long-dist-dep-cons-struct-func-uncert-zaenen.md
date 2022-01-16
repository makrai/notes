Long-Distance Dependencies, Constituent Structure, and Functional Uncertainty
Ronald M Kaplan and Annie Zaenen
1989 In Baltin and Kroch eds Alternative Conceptions of Phrase Structure. U Chic
1995 In Dalrymple+ Formal Issues in Lexical-Functional Grammar. Stanford Uni

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
    * approximates the more traditional functional notions of subject, object,
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
  the Completeness and Coherence conditions and is
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
    * These f-structures are ordered by a subsumption relation and
      Kaplan and Bresnan defined the subsumption-minimal satisfying structure
      to be the grammatically relevant one.
    * The family of f-structures that satisfy the residual uncertainties is also
      ordered, not just according to subsumption but also according to lengths 
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
    between the topic and the object of the most deeply embedded complement 
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
          (the body, here comp*)
* the bottom. There are a variety of other within-clause functions that the
  topic can have, and the equation might be generalized to (34)
`(\up Topic) = (\up COMP* GF)`
* GF denotes the set of primitive grammatical functions
* this is too general for English since
  * As we discuss in Section 3
  * the topic cannot serve as a within-clause complement
  * A more accurate specification is
`(35) (\up Topic) = (\up comp* (GF \setminus COMP))`
* where GF—COMP denotes the set of grammatical functions other than coMP. This
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
      * neither of the predicates claim nor say take objects.
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
  (39) `(\up Topic) = (\up {comp, xcomp}* (GF—coMP))`
  * closed and open complements (Comp and xcomp in LFG terms) on the path, as
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
           (\up Topic) = (\up {comp, xcomp}* (GF—coMP))
* In English, S’ and any XP can occur in topic position.
* Spanish: some topic constructions allow NP’s but not PP’s (Grimshaw 1982

# 4 how the system handles some rather recalcitrant data from English, and in 18

# 5 Interactions with Functional Control: Relatives 23

* multi-dominance (or a similar many-to-one mechanism) is needed

# 6 Conclusion 26

# Ack 27
