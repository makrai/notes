Strategies for scope taking (1997)
Anna Szabolcsi
In Ways of Scope Taking. Springer (1997)

# 1 OVERVIEW

* Standard theories of scope are semantically blind. They employ
  * a single logico-syntactic rule of scope assignment
    (quantifying in, Quantifier Raising, storage, or type change, etc.) which
  * "prefixes" an expression `a` to a domain D and thereby assigns scope to it
    over D, irrespective of what `a` means, and irrespective of what operator
    may occur in D
* two problems: the resulting interpretation may be incoherent, or
  * coherent but not available for the string it is assigned to.
* Szabolcsi and Zwarts (1993) focus on the 1st case. Take a version of (1) that
  * wh-fronting
  * weak island violations," this rule yields unacceptable results.  For
  * the violation is semantic in nature
  * _How_ in (3b, c) and _who_ in (4b, c) ought to scope over domains D that
    they are unable to
  * because manners and collectives are elements of proper join semi-lattices.
  * the computation of the denotation of a factive context (resp negative contx)
    requires taking meets (resp complements)
  * these operations are not defined in join semi-lattices
  * => manners and collectives cannot scope over such contexts. For the moment,
* the second case, which the present paper is concerned with
  * quantifiers in English often scope over operators that are
    higher in the surface syntactic hierarchy
  * old account predicts that all quantifiers interact uniformly with all operators
  * hE, some but not all direct objects can scope over
    the subject (5), and over negation (6)
  * (5) Three referees read every/few abstract(s)
        every N > three N
        * few N > three N
  * (6) a. John didn't read many/few abstracts.
        many N > not
        * few N > not
* these contrasts pertain to the syntax/semantics interface, not pure semantics.
  * the starred examples are not incoherent simply,
    the given form cannot carry the intended meaning
  * because the same `a`s are able to scope over the same `b`s in English when
    * they are originally higher in syntactic structure (7) or when
    * they acquire such a higher position via overt fronting (8): (7) a. Few
      (8) Few men did no one/every woman/two women like.
* Examples comparable to (8) are in fact standard in Hungarian
  * Hungarian disambiguates scope in surface structure (see below).
* undesirable: omnivorous rule (1) + a variety of filters on its (c)overt applic
  * I argue for an approach that is as constructive as possible
  * in the same spirit as the CCG approach to syntax in Szabolcsi (1992)
    * the results in this chapter are entirely independent of categorial grammar
* The assumption is that quantification involves
  a variety of distinct, semantically conditioned processes
  * Each kind of expression participates in those processes that suit its
    particular semantic properties. Thus the heuristic principle is this:
  * (9) What range of quantifiers actually participates in a given process is
    suggestive of exactly what that process consists in.
* semantically conditioned specialized scopal mechanisms were 1st made in
  Ben-Shalom (1993), Beghelli (1993), Beghelli& (1994, 1996), Beghelli (1995)
* oragnization
  * summarize some features of Ben-Shalom's semantic proposal
  * reviewing certain aspects of Beghelli and Stowell's syntactic theory,
  * data from Hungarian, a language that "wears its LF on its sleeve,"
    * provide specific empirical support for Beghelli & Stowell
  * I propose that Beghelli and Stowell's LF, can be quite directly mapped onto
    somewhat modifified Kamp and Reyle (1993) style Discourse Representations.
    * The main concrete modification to be proposed pertains to
      widening the class of discourse referents.
  * the Hungarian data will be shown to provide evidence that
    the denotational semantics of the noun phrase delimits, but not determine,
    whether it introduces a discourse referent.

# 2 CONSTRUCTIVE APPROACHES TO DIFFERENTIAL SCOPE TAKING 4

## 2.1 Ben-Shalom (1993)

* subset of the data in Liu (1990) that do not involve partitives

(10) Three referees read every abstract.
(11) Three referees read fewer than five abstracts.

* The standard way to calculate the object wide scope, O > S reading of (10) is
  * form the set of things read by three referees and
    check whether every abstract is in that set.
  * this set is not the denotation of a surface syntactic constituent of the
  * the analogous set can be used in calculating an O > S reading for (11), too.
    * hE, (11) does not readily admit an O > S reading. This suggests that
* the O > S reading of (10) must be calculated in some alternative way
  that is available when the intended wide scope quantifier is, say, _every_
  but not when it is, say, _fewer than five abstracts_
* Ben-Shalom proposes that inverse scope is effected by a specic binary quantifier
  [O > S]
  * (12) If S and O are generalized quantifiers and R is the relation denoted by a
    transitive verb, the binary quantifier [O > S] is defined to operate as
    follows: For every a \in A S(R(a)), where A is some set determined by O.
  * Grab a set A determined by the quantifier denoted by the object and check, for
    every element a of this set, whether it has the property that three
    referees read it
  * The fact that Ben-Shalom formulates her proposal using a binary quantifier is
    immaterial for our present concerns, so it will not be dwelt on.
* twofold procedural difference between the standard calculation of scope and
  the one encoded by [ O > S ]
  * On the standard account, we construct the set denoted by \lambda a S(R(a))
    and let O operate on it
  * [ O > S ], this set does not need to be constructed and
    O is not a predicate operator
    * O contributes a domain of entities, each of which is checked for the
      property \lambda a S(R(a))
* The binary quantifier [ O > S ] works most straightforwardly
  when O is a principal filter
  * a principal filter determines a unique set, called its generator, within its
    restrictor
    * The unique set that [[every man]]/[[John and Bill]] determines is the set
      of men/{john, bill}
  * When O is just monotone increasing, it determines several suitable sets (in
    a big enough model), called its witnesses, so the operation of [O > S] is
    less simple but still perfectly viable
  * otherwise O does not determine any suitable set on its own
    * the truth conditions of _Fewer than/Exactly six men walk_ cannot be
      specied as "There is a set A consisting of fewer than/exactly six men such
      that each a \in A walks."
* According to Ben-Shalom, [O > S] captures the empirical facts correctly
  because the best inverse scope takers in English are indeed principal filters.
  * I will consider a wider range of quantifiers in a wider range of contexts, and
    propose a somewhat similar account of them,
    exploiting the fact that the strategy "Grab a witness set and check its
    elements for property P" generalizes exactly to the increasing quantifiers.
* Beghelli and Stowell: the overall picture of scope interaction is more complex
  * need to factor out the contribution of distributivity
  * the possibility of inverse scope depends on the choice of
    both the wide and the narrow scope taker

## 2.2 Beghelli and Stowell (1994, 1996) 6

* Like Ben-Shalom, Beghelli and Stowell dispense with Quantifier Raising, an
  omnivorous movement rule without a specic landing site, and propose that
* Logical Form in English includes, among others, the following hierarchy of
  functional projections
  * RefP = Referential Phrase
  * AgrSP = Subject Agreement Phrase
  * DistP = Distributive Phrase
  * ShareP = Distributed Share Phrase
  * NegP = Negative Phrase
  * AgrIOP = Indirect Object Agreement Phrase
  * AgrOP = Direct Object Agreement Phrase
  * VP = Verb Phrase
* Each type of quantifier acquires its scope by moving into the specier of that
  functional projection which suits its semantic and/or morphological properties
  * position can be filled multiply and its content undergoes absorption.
  * Definites _(the two men)_ move to the specier of RefP, and
  * distributive universals _(every man)_ to the specier of DistP
    * The head of DistP, a distributive operator, selects for a ShareP
      complement, which can accommodate either an indefinite _(two (of the)
      men)_ or an existential quantifier over events.
  * Indefinites may alternatively move to the specier of RefP.
* Modied numerals (more/fewer than/exactly six men) and
  indefinites whose noun is destressed)
  * not move to either RefP, DistP, or ShareP. They
  * just move to the appropriate agreement specier positions to receive Case.
  * they easily take widest scope
    because AgrSP in English is higher than DistP and ShareP
* indirect and direct object modified numerals happen to have their agreement
  positions quite low in the structure, and they scope accordingly
* Scope relations arise in two ways
  * simply follow from the hierarchy specied in (13). For instance, an
    indefinite direct object may scope above a universal subject by moving into
    RefP, which happens to be above DistP: (14) a. Every man read two of the
  * the inverse reading of _Two of the men read every book_ comes about by
    moving every book to DistP and two of the men to ShareP.
  * Inverse scope may also be due to reconstruction: a phrase can be lowered
    into the position(s) of its trace, typically, into its VP-internal position.
    * lowering is restricted to undoing semantically insignificant movement,
      i.e. an expression can be lowered from its Case position but not from
  * The converse is not possible: _Every man read more than three books_ does not
    receive an inverse scope interpretation. Every man cannot undo its presence
* There is a slight difference between (16) and _More than three men read more
  than six books_
  * Here inverse scope is very difficult but, in contrast to (16), can be forced
    by context. Since more than three men as a subject can in general
    reconstruct into its VP-internal position, this is predicted.
* Definites and bare indefinites do not move to DistP even when they are distri
  * their distributive interpretation is due to a silent operator comparable to
    floated _each_
  * Beghelli and Stowell call this "pseudo-distributivity."
* Silent _each_ can apparently occur below AgrSP, ShareP, AgrIOP, and AgrOP, but
  not below RefP. This captures the fact that even when direct object _three
  books_ moves to RefP and is therefore referentially independent of subject
  _two of the men_, it cannot make the latter referentially dependent, since
  there is no distributive operator between the two positions
* On the other hand, in _Two men read three of the books_ the property of having
  read three of the books can be distributed over two men, because the latter
  has a trace in AgrSP associated with silent each :
* Similarly, the direct object in RefP can distribute over a subject that recon-
  structs into VP, because it has a trace in AgrOP, and AgrOP may have silent
  _each_ associated with it.
* In sum, the distributivity of
  * universals is due to a separate distributive operator (Dist) and, similarly,
  * definites and bare indefinites is due to a separate distributive operator
    (silent _each_)
  * Once the distributive key and the distributive operator are separated, they
    can move separately. This possibility is made crucial use of.
    * _Every man_ and _(the) two men_ are allowed to move upward unboundedly to
      a higher RefP,
      but the corresponding distributive operators, being heads or adverbs, stay
  * it is predicted that (20) has a de re reading,
    every/two woman < more than six men
    * as this property does not distribute
    (20) More than six men imagine that every woman/two women will fall in love
    with them.
* two facts underlie the traditional observation that "QR is clause-bounded"
  * Dist and _each_ do not move up
  * the QP's landing site in the higher clause, RefP, is itself not associated
    with a distributive operator

# 3 CLAIMS TO BE MADE 9

* Below I will examine Hungarian data in the light of Beghelli and Stowell
21. Hungarian distinguishes scope positions in its surface syntax that are
    highly reminiscent of those postulated by Beghelli and Stowell for LG in Eng
22. Some noun phrases can occur in only one of the above scope positions, but
    others can occur in more than one, and their interpret vary accordingly.
23. positions => ?
  * It is known that the presuppositional versus existential interpretation of
    noun phrases may be a function of their position
  * Hungarian is shown to exhibit similar positional distinctions in a new dim,
    distributivity
24. Scope taking mechanisms fall into two broad categories. In these, the NP
  * introduces a "logical" subject of predication != a grammatical subject, i.e.
    a nominative
  * performs a counting operation on an independently defined predicate denot
25. The above distinction is not a purely denotational one, instead, it is
    representational/procedural
  * reminiscent of the basic insight of Discourse Representation Theory (DRT)
  * Introducing a logical subject of predication can be assimilated to
    introducing a discourse referent
  * Anaphora facts will motivate
    * a revision of what items introduce discourse referents and
    * the distinction of two kinds of referents:
      individuals (atomic or plural) and sets
26. In general, the logical forms Beghelli and Stowell derive for English
    sentences can be seen as direct instructions for constructing DRS's.

# 4 SCOPE POSITIONS IN HUNGARIAN 10

## 4.1 Hungarian surface structure disambiguates scope

* substantial body of work by Hunyadi, Kenesei, É. Kiss, Szabolcsi, since ea 80s
* surface order and intonation disambiguate scope. 8 For instance, the
  * Sok ember mindenkit felhívott.
  * Mindenkit sok ember felhívott.
  * Hatnál több ember hívott fel mindenkit.
  * Mindenkit hatnál több ember hívott fel.
* it is their occurrence in specic syntactic positions that defines the scope
* names
  * pretheoretical names that have by now become more or less traditional
  * I coined the speaking name Predicate Operator for Focus
  * `*` indicates that the given position may be filled multiply:

`Topic* Quantifier* {(Negation) Focus Predicate Operator} Negation Verb
                                                                    Postverbal*`

* The fact that left-to-right order determines scopal order follows from (30).
  * For recent discussions, see É. Kiss (1991, 1994)
  * (30) In Hungarian, operators c-command their scope at S-structure
    (where c-command is dened in terms of 1st branching node)
* Typically, a Hungarian sentence with n scope-bearing DPs will have n or n 1
  in the preverbal field, so that their scopes are indeed disambiguated
  * The postverbal field is assumed to have a flat structure
  * It is rare but possible to have more than one scope-bearing DP postverbally
  * to their relative interpretation I will return to in the Appendix
  * diagnostics of which position a DP occupies in the preverbal field follow:
    * Topics, but not other preverbal items, can be followed by sentential
      adverbials like _tegnap_ `yesterday.'
    * When a Topic or Quantifier precedes a non-negated finite verb that has a
      prefix, the prefix is in proclitic position.
    * When a Focus or Predicate Operator precedes a non-negated finite verb that
      has a prefix, the prefix occurs postverbally
    * A sequence of Quantifiers cannot be broken by a non-Quantifier.
    * A DP in Focus receives an exclusion-by-identification interpretation
      * a DP in Predicate Operator does not.

## 4.2 A parallelism with Beghelli and Stowell's LF 11

* I argue that the extent to which Hungarian surface structure reveals scope is
  even greater than has been thought
  * QPs are not simply lined up in the desired scopal order but
    occupy specic positions
  * the traditionally distinguished positions correspond quite closely to the
    specier positions of the functional categories in Beghelli and Stowell's
  * For the time being, I ignore the postverbal field

|Topic                | Spec, RefP    | Proper names, definites, and indefs   |
|                     |               | that take widest scope in their own cla|
|Quantifier             | Spec, DistP   | Distributive universals               |
|Focus (with indefs.) | Spec, ShareP  | Bare indefinites that scope under     |
|                     |               | distributive universals               |
|Predicate Operator   | Spec, AgrP/VP | Modied numerals, which do not readily |
|                     |               | take inverse scope in English; indefs |
|                     |               | whose N is destressed and whose numeral|
|                     |               | is interpreted as "exactly n"         |

* This parallelism is supported by data that pertain to
  * exactly what noun phrases occur in each position, and
  * what kind of interpretation they receive there.
* restrictions on the occurrence of DPs in these positions are well-known
  * a Topic must be specic, and universals do not occur in Topic or Focus
  * hE, no systematic investigation of these matters has been carried out
  * I examine a representative sample. The data are summarized in (33)
  * many DPs occur in more than one position as we shall see,
    * their interpretations vary accordingly.
* it seems justified to refer at least to
  Hungarian Topic as (spec of) HRefP and Hungarian Quantifier as (spec of) HDistP.
  * hE, I will retain the labels Focus and PredOp since here, it seems,
    * the pertinent similarities are functional and
      the residual differences are significant.
  * ShareP, unlike Focus, does not host definites
  * PredOp, unlike AgrP, is not Case-related, etc.
* another respect in which Hungarian differs from English is that
  Hungarian has no agreement (Case) positions mixed with the scope positions in
  the preverbal field, whence scope relations are independent of the arg hier.
  * In the Appendix I outline an analysis of Hungarian sentence structure that
    captures the observations above.

# 5 OUTLINE OF THE ANALYSIS 14

* I will focus on the positions HRefP, HDistP, and PredOp, and argue that
  * their inhabitants contribute to the interpretation of the sentence
    as summarized in (34) through (36).
* Focus is omitted, because it has an
  obvious additional semantic function that is irrelevant to present concerns
* I formulate my claims with respect to Hungarian and will
  * argue for them using Hungarian data, but recall that
  * I believe that, these data are supportive of Beghelli and Stowell's approach
    * modulo the obvious cross-linguistic differences
    * my claims are intended to hold of their logical forms, too. In fact,
    * some of these claims are incorporated into Beghelli and Stowell (1994, 96)
34. DPs that occur both in HRefP and Focus, as well as
  _valamely/bizonyos_ N that only occur in HRefP,
  * contribute an individual to the interpretation of the sentence, i.e.,
  * an atomic or a plural individual
    (the atoms of) which correspond/s to the element/s of a minimal witness set
  * This individual serves as a logical subject of predication.
  * Predication may be distributive or collective, depending on the predicate.
35. A DP in HDistP contributes a set to the interpretation of the sentence,
    i.e., a witness set
  * serves as a logical subject of predication mediated by a distributive op
36. A DP in PredOp does not contribute an entity to the sentence interpretation
  * does not serve as a logical subject of predication
  * It performs a counting operation
    on the property denoted by the rest of the sentence
  * If that predicate is
    * distributive and thus denotes a set, the DP counts its elements
    * collective and thus has plural individuals in its denotation,
      the DP counts the atoms
  * The result of counting may even be
    compared to the cardinality of the common noun set
    * i.e. the DP's determiner need not be intersective.
* The basic distinction that I wish to make is between DP denotations that
  * contribute an entity as a target of predication vs
  * operate on the denotation of the predicate in the manner of generalized Qs
* Such a distinction seems straightforward between
  * names, definites and bare indefinites on the one hand and
  * modified numerals on the other.
* Distributive quantifiers might seem to side naturally with the latter group, but
  I claim they indeed side with the former and end up as one
  * subspecies in the "subject of predication" category
  * This is what the proposals in (34) through (36) attempt to capture.
* a natural framework for expressing these proposals is a version of the
  Discourse Representation Theory expounded in Kamp and Reyle (1993)
  * The claim that some DPs serve as logical subjects of predication should
    translate as the claim that they introduce discourse referents
  * by "introduces a discourse referent" I mean that
    the rule processing the DP introduces a referent
    either into the universe of the very DRS to which it is applied
    or into the universe of a superordinate DRS.
* Thanks to such referents,
  these noun phrases support non-maximal reference anaphora.
  * contrasts with rules that take care of quantifiers;
  * these place a discourse referent into a newly created subordinate DRS
    (introduce duplex conditions)
  * These latter noun phrases only support maximal reference anaphora
    (constructing an antecedent for a subsequent pronoun involves the
    abstraction operation that intersects the denotations of the 1st and the
    second arguments of the determiner)
* Kamp and Reyle stipulate that when a DP "introduces a discourse referent"
  then, at the point of introduction, it is associated with all and only the
  conditions that come from material inside the DP
  * i.e. even if a referent is introduced into a superordinate DRS,
    it will never be divorced from its DP-internal conditions
  * This needs to be stipulated, because Kamp and Reyle's discourse referents
    are plain variables ranging over the whole universe, and DP-internal
    conditions are represented as predicated of them
  * In contrast, in (34) and (35) I assume that a referent is a sorted variable
    * ab ovo restricted to ranging over (plural individuals formed from minimal)
      witness sets of the generalized quantifier denoted by the DP.
    * E.g., the discourse referent introduced by _two men_ is a variable over
      plural individuals made up of two men
    * Since a witness set, by denition, is of the right "size" and contains only
      entities drawn from the determiner's restriction,
      the inseparability of the referent from the information that comes from
      the DP follows without further stipulation.
* this proposal differs from the usual notion of restricted quantication,
  which relies on the (smallest) set the GQ lives on, i.e. its common noun set,
  rather than a witness.
* Kamp and Reyle's stipulation in fact takes care of
  a problem discussed in Abusch (1994) and Reinhart (1995).
  * example comes from Heim (1982)
  * _If a cat likes a friend of mine, I always give it to her._ On the intended
  * a friend of mine > a cat
  * But if only existential closure is outside the conditional and
    the predicate _friend of mine_ is in the antecedent, the sentence will be
    incorrectly veried by any model where there is someone who is not a friend
    of mine.
  * Abusch (1994) proposes a specic syntactic mechanism to percolate the
    predicate up to the quantifier.
  * Reinhart (1995) invokes choice functions in the interpretation of indefs.
  * My own proposal is highly compatible with Reinhart's, given that the value
    of her choice function is exactly my witness set
  * Reinhart (1995) and Winter (1996) show how to obtain those choice functions
    compositionally; their procedure might be adopted by the present theory.
* The behavior of DPs that occur in HRefP and Focus (the latter the functional
  counterpart of Beghelli and Stowell's ShareP) is straightforwardly derivable
  from the properties Kamp and Reyle attribute to set denoter referents (sin-
  gular or plural individuals, in present terms). What DRT gains from Beghelli
  * a characterization of distributivity that is empirically more precise and
    less stipulative
  * Recall from 2.2 that silent _each_ is claimed to behave much like its overt
    counterpart, whose behavior is governed by wellstudied principles of syntax.
* Let us assume, then, in general that the DRS construction algorithm does not
  take the simple phrase structures used in Kamp and Reyle as input but, rather,
  its operation is directly determined by the kind of Logical Form Beghelli and
  Stowell's analysis assigns to the sentence. This will have clear
  * advantages in connection with the treatment of inverse scope.
  * Kamp and Reyle comment on the fact that not all NPs can take inverse scope,
    * opt for the stipulation that a syntactically lower noun phrase may be
      processed before a syntactically higher one, which is
    * equivalent to assuming an unconstrained QR.
  * Beghelli and Stowell's theory eliminates QR and replaces it with an
    articulated synt theory of where each type of noun phrase ends up at LF.
    * Their LF now species the correct orders in which to process NPs
* hE, there are reasons for more substantial modications of DRT.
  * have to do with the behavior of DPs in HDistP, see (35), vs in PredOp (36) I
  * the inhabitants of HDistP, universals among them, are construed as
    targets of (obligatorily distributive) predication.
  * This claim will be supported by showing that
    * they support only distributive readings and
    * they introduce discourse referents, although not exactly the same kind as
      inhabitants of HRefP
      * Only the inhabitants of PredOp, which are all "counters," operate on
        predicate denotations in the manner of generalized quantifiers. 17
* the picture that we are led to is a generalization of Ben-Shalom's (1993)
  * Recall from 2.1 that
  * restricting her attention to the calculation of inverse scope,
  * Ben-Shalom argued that there is a procedural difference in the evaluation
    of sentences involving
    * names, definites, specic indefinites, and universals on the one hand and
      * she proposes to start out with a set determined by the quantifier and
        check its members for some property
      * In present terms: act as subjects of predication
    * modified numerals on the other. In the former case,
      * she proposes to directly tackle the predicate's denotation.
      * In present terms: act as predicate operators.
* Pursuing the DRT analogy, these observations amount to
  adding a procedural flavor to DRT, in the following sense.
  * DPs that introduce discourse referents do differ from others
    * in how they support anaphora, which is largely a matter of logical syntax.
    * at the interface between DRSs and the model theory, because
      * the verication of the truth of sentences containing them is carried out
        using different procedures.
  * may be reminiscent of Brentano and Marty's distinction between
    categorical versus thetic judgments,
    * revived in Kuroda (1972), Sasse (1987), and Ladusaw (1994). At present I
  * this issue may tie together formal and informal lines of research.  (One
    * the present proposal is concerned strictly with the contribution of
      particular DPs, not with whole sentences/judgments.)
* Likewise, the "subject of predication" and the "predicate operator" types of
  verication procedures may be relevant in connection with the construction of
  mental models,
  * in a sense similar to Webber (1979) and Crain and Hamburger (1992). Finally,
* the two modes of operation recall the "look-up" versus "compute" distinction
  in Szabolcsi and Zwarts (1993)
* In concrete terms, I will be arguing that
  the Beghelli and Stowell-style logical forms in (37) and (39) correspond to
  discourse representations as in (38) and (40), respectively.
* (38) is much like in Kamp and Reyle. The differences are
  * X is now understood as a variable over plural individuals, not sets, and
  * X is a restricted (sorted) variable. I will use the following
* notational convention:
  * X \in DP is a variable ranging over plural individuals whose atoms are the
    elements of some minimal witness set of DP ]
* I represent few books simply in terms of a duplex condition. Note that
* the cardinal and the proportional readings behave alike from the present pers
* "sc Each is Beghelli and Stowell's silent each.
(37) RefP Two boys_1 AgrSP t_1 each read_2 AgrOP few books_3 VP t_1 t_2 t_3 ]]]]
* (40) involves _every boy_ that, according to my proposal, introduces a set
  referent
* Notation: `X \in DP*` is a variable ranging over witness sets of [[DP]] , and
  "forall is the distributive operator Dist
(39) `AgrSP t_1 read_2 DistP every boy_1 Dist AgrOP few books_3 VP t_1 t_2 t_3`
* This replaces a "tripartite" structure in Kamp and Reyle.
* With these general considerations in mind, let us turn to the justication of
  (34) through (36), with reference to Hungarian.

# 6 DISTRIBUTIVE AND COLLECTIVE READINGS 19

## 6.1 Distributivity in HDistP

* all DPs occurring in the Hungarian Quantifier position HDistP are strictly
  distributive.
  * (Although we get distributive readings elsewhere, too, as will be discussed)
* Some DPs occur only in HDistP and not in the other three distinguished poss.
  * Universals
    * _minden fiu_ and _valamennyi fiu_ are the paradigmatic cases.  But
    * all _is_ phrases are like universals
      in that they are barred from HRefP, Focus and PredOp
* _Kati is fel-emelte az asztalt_
  * no collective
* (42) _Hat fiu is fel-emelte az asztalt_
  * here _even_ is essentially scalar: _hat ... is means_ that
    six is considered many. Nevertheless, while
  * the same sentence without _is_ may well have a collective reading,
  * (42) not collective
* some noun phrases may occur in more than one position, and their
  interpretation varies accordingly.
  * telic predicates that can be either distributive or collective.  (43) shows
  * names, definites and bare indefinites (the DPs that occur both in HRefP and
    in Focus) support either reading
  * DPs in HDistP do not support a collective reading at all. Finally,
  * DPs in PredOp support an
    * unmarked distributive reading of the sentence as well as a
    * marked collective one, which has the avor "It took as many/few as n boys"
* In the examples below the
  * first DP is one that occurs only in the given position and the
  * second is one that occurs in different positions with varying interpretations.
    a. Kati és Mari/Két fiú fel-emelte az asztalt.          HRefP   OK coll
    b. Minden fiú/Több, mint hat fiú fel-emelte az asztalt. HDistP  * coll
    c. Kevesebb/Több, mint hat fiú emelte fel az asztalt.   PredOp  it took N cl
* purely non-distributive telic predicates: "once only" predicates, e.g. destroy
  * Similar results are obtained
  * the distributive interpretation is out, no matter what the subject is:
    * the same sand castle cannot be destroyed more than once (marked with #).
  a. Kati és Mari le-rombolta a homokvárat.               HRefP   # collective
  b. Minden/Több mint fiú le-rombolta a homokvárat.       HDistP  # collective
  c. Kevesebb/Több, mint hat fiú rombolta le a homokvárat PredOp  it took coll
ok destruction: "it took n"-collective
* other non-distributive predicates like surround where even `*`"it took n "
  * modified numerals in PredOp support an unmarked collective interpretation of
  * this difference is due to the stativity of the predicate
    * plays no role in my analysis and will not be investigated further,
  * _surround_ differs from gather, for instance, in that
    * if a plurality of entities surround something (in one layer), then no
      subset of them surrounds it, but
    * a single entity may surround something by forming a full circle on its own
  a. Az X birtok és az Y birtok körül-öleli a kastélyt.         HRefP   OK coll
  b. Minden/Több, mint hat/Sok birtok körül-öleli a kastélyt    HDistP  * coll
  c. Kevesebb/Több, mint hat/Sok birtok öleli körül a kastélyt  PredOp  OK coll
* DPs in Quantifier position fully supports the idea that
  Quantifier is analogous to Spec, DistP. Not only do the
  * Hungarian counterparts of every boy and each boy occur in this position, but
  * a variety of further DPs do, too. And while the latter
    * they can support collective readings elsewhere,
    * in this position they only support distributive readings. 21 However, the
* Do the collective or distributive readings arise in the same manner in all
  three positions?

## 6.2 Two types of collective readings: HRefP and PredOp 22

* what role this DP specically plays in the formation of coll/distri reading. I argue
* somewhat different in every one of the three positions that we are considering
* DPs in HRefP versus DPs in PredOp:
(46)
   a. Ez a hat fiú fel-emelte az asztalt.  HRefP
   b. Ez a hat birtok körül-öleli a kastélyt.
(47)
  a. Több/kevesebb, mint hat fiú emelte fel az asztalt.  PredOp
  b. Több/kevesebb, mint hat birtok öleli körül a kastélyt.
* Kamp and Reyle (1993), I propose that
  * in (46) the subject introduces a plural individual referent and _lifted up
    the table_ is predicated of it collectively
  * More precisely, Kamp and Reyle treat bare indefinites as "set denoters,"
    * these sets are in one-to-one correspondence to plural individuals and
      the plural individual view is intuitively preferable
  * I am switching to plural individuals on the technical level, too,
    * reserving the option of having set referents for another kind of DP.
* In Kamp and Reyle's theory, collective predication is the only way to obtain a
  collective interpretation for the sentence, and in fact, they do not discuss
  * hE, in the examples in (47), The subjects do not introduce a discourse
    referent either in a technical sense (see the anaphora facts below) or in an
    intuitive sense. The sentences in (47) are in no way "about" some boys or
  * it is the predicate that denotes a group, as opposed to a set of
    individuals, and what the DP does is to count the atoms of this group. E.g.,
  * the sentences in (47) have a collective interpretation but their subject DPs
    are not interpreted collectively. 22
* So, in line with Kamp and Reyle, I assume that DPs in
  * HRefP/Focus denote plural individuals that can be subjects of collective or
    distributive predication, while DPs in
  * PredOp are counters
    * In distinction to Kamp and Reyle, however, I assume that the latter can
      count either the elements of a set, or the atoms of a group, whichever the
      predicate they operate on denotes. This takes care of (46) versus (47).

# 7 TWO TYPES OF DISCOURSE REFERENTS 23

## 7.1 No plural individual referent in HDistP

* DPs in HDistP introduce a set referent.
* anaphora facts that establish whether a DP introduces a plural individual reft
  * In Kamp and Reyle, the most important mark of DPs that introduce a plural:
  * that they can antecede a collective subject pronoun
    even when the latter is inside their own distributive predicate, see
* (50) John és Bill olyan titkárnőt vett fel, akivel előbb elbeszélgetett `*`col
  Két ügyvéd                                               elbeszélgettek ?dist
* In cross-sentential anaphora like _Many boys came.  They were curious_,
  * the pronoun constructs an antecedent for itself using the restrictor 'boy'
    and the predicate 'came.'
  * But a pronoun located inside a predicate cannot use that same predicate in
    constructing an antecedent for itself. It can only corefer with a previously
    introduced discourse referent.  And since we want a collective
    interpretation for the pronoun, the discourse referent it corefers with must
    be a plural individual, too.
* In Hungarian, DPs that contain a numeral are themselves in the singular and,
  alongside with conjunctions of singulars, trigger singular agreement on the
* In cross-sentential anaphora, all these DPs antecede plural pronouns.
* When however they c-command a (possibly non-overt) pronoun, a
  * singular pronoun receives a bound individual variable reading, while a
  * plural pronoun receives a coreferential reading. Given this morphological
  * all that needs to be judged in Hungarian is whether a DP can be linked to a
    plural pronoun in Kamp and Reyle's diagnostic context. For transparency, I
* If 3sg, distributive
* if 3pl, interview can (must?) be collective
(51) Minden     olyan titkárnőt vett fel, akivel előbb elbeszélget-ett  distri
     Sok ügyvéd                                                   *tek
(52) Hatnal kevesebb vett fel olyan titkarnőt, akivel elbeszelget-ett distri
     Sok ügyved                                                  *tek
* the demarcation line lies exactly where Kamp and Reyle place it in English on
* Only in the case of DPs that occur in HRefP/Focus can the plural pronoun be
  linked to the DP itself, cf. (50)
* In (51)--(52), with DPs that occur in HDistP and PredOp, respectively,
  the plural pronoun may at best pick up DP's smallest live-on set or be
  interpreted deictically.

## 7.2 Essential quantifiers and distributivity

* The fact that DPs in HDistP are never linked to a plural pronoun in this
  context might suggest that they are interpreted in essentially the same way as
  those in PredOp, namely, as generalized quantiers. The difference would consist
  in the first type having distributivity built into their denition.
* Partee (1995, p. 564) conjectures (extending a claim in Gil 1989, 1995) that
  all essentially quanticational DPs are distributive. To make Partee's point
  * I reinterpret "essentially quanticational" as those DPs whose determiner is
    not purely intersective and which cannot be taken to denote (atomic or
    plural) individuals, either
  * _Every N_ and proportionals are essentially quanticational. Furthermore,
  * non-individual denoting DPs
    whose restrictor is presupposed not to be empty
    are essentially quanticational. The reason is that
    * a presupposition that pertains to only one argument of the determiner
      prevents the determiner from being symmetrical (and hence intersective).
* If _több/kevesebb, mint hat N_ is replaced by _az N-ek közül több/kevesebb,
  mint hat_,  the closest we can get to a partitive in Hungarian, the collective
  readings disappear
* Similarly, if we have _sok_ 'many' or _kevés_ 'few' in PredOp and they are
  interpreted proportionally, the collective readings disappear. We may say
* both changes result in essentially quanticational DPs.  Now, it is possible to
* all DPs in HDistP are essentially quanticational in this slightly modified
  sense. Recall what we have here: every N, many N, at least/more than n N, and
  also, even phrases. Crucially, it is not counter-intuitive to say that
* when _több, mint hat fiú_ occurs in HDistP, we presuppose that there are boys.
  * Maybe we are even thinking of boys drawn from a known superset
  * i.e. the phrase may be specic in Enc's (1991) sense.
* If all DPs in HDistP have semantic properties that make them essentially
  quanticational, then the fact that they are invariably distributive may simply
  follow from Partee's generalization.

## 7.3 Set referents in HDistP

* both the anaphora facts and the distributivity facts concerning HDistP
  correlate with the inhabitant DPs being essentially quanticational.
  * well motivated:
    essentially quanticational DPs automatically have a "tripartite" structure,
  * hE, there are other facts that
    * receive a natural explanation if we assume that these DPs introduce a
      discourse referent of some sort, and the same facts
    * remain mysterious on the "tripartite" analysis.
* the diagnostics of introducing a discourse referent have to do with
  non-maximal reference anaphora and referential variation. According to
  * Beghelli and Stowell: in English only universals reside in DistP. But
  * a universal has a unique witness that is identical to its restrictor (=
    smallest live-on) set.
  * => ~ come out the same
    * maximal reference anaphora (computed by intersecting the restrictor and
      the predicate sets) and
    * non-maximal anaphora to some witness set .
* Likewise, universals will not exhibit referential variation, however they may
  be entered in the DRS
  * => the behavior of universals is compatible with more than one analysis. To
  * we would need to test
    * non-maximal anaphora on a DP with witnesses distinct from the restrictor,
    * referential variation on a DP with more than one witness.
  * In Hungarian, DPs like 'many men' and 'more than five men' occur in the same
    HDistP position as 'every man,' thus the relevant tests can be performed.
  * Furthermore, since the same DPs occur in PredOp, too, minimal pairs can be
    formed to isolate the properties present only in HDistP.
* it is possible not to predict that these English DPs behave analogously
  * I show in Section 9 that denotational semantics delimits, but does not
    determine, a DP's actual mode(s) of operation
  * that a Hungarian DP is denotationally equivalent to some English DP !->
    that they operate identically
  * the crosslinguistic signicance of the Hungarian facts then?
    * Since I have argued for a global analogy between
      * HDistP and English DistP on the one hand and
      * PredOp and English AgrP on the other,
    * the Hungarian data may offer an insight into the way DPs in these
      positions operate, even if the items that occur in those positions are not
      exactly the same.
* _több, mint hat diákunk_ in HDistP vs PredOp,
  * a variant of the "others" test, cf. Problems (69)--(70) in Chapter 1.
  * two teachers in the process of correcting the exams of a large class. When
  * HDistP
    Több, mint hat diákunk félreértette a kérdést.
    Lehet, hogy még másokat is találsz.
  * PredOp
    Több, mint hat diákunk értette félre a kérdést .
    *Lehet, hogy még másokat is találsz.
* HDistP: The first teacher's remark is unambiguously about a set of students.
  PredOp: The first teacher's remark can only be about the number of students
  * cannot be followed by a remark about the "others."
    * this interpretation does not present a set of individuals in comparison
    * the exams yet to be corrected will not change the fact
* I conclude that the DP in
  * HDistP introduces a set that is salient enough for anaphora to build on
    * a witness of the generalized quantier denoted by the DP. But a DP in
  * PredOp crucially does not support this kind of anaphora, because it does not
    talk about individuals at all.
* (55)  Legalább két elemző úgy gondolja, hogy több, mint hat hazug igazat mond.
        Legalább két elemző úgy gondolja, hogy több, mint hat hazug mond igazat.
  * Farkas (1996) argues that the descriptive content (DC) of any noun phrase
    may be evaluated with respect to the worlds introduced by superord clauses;
* the entities referred to may be liars in the speaker's world, not in the
  analysts' worlds. This does not follow from the present proposal and
  thus, if correct, the mechanism Farkas proposes needs to be incorporated.
* there is another difference between the possible interpretations of (55a,b)
  * (a) can mean that more than six liars > at least two analysts think that
    * the liars and the analysts are chosen independently. In contradistinction
  * in (b) it may at best be a coincidence if the liars are identical;
* This difference between (55a) and (55b) follows straightforwardly if we assume
  that the DP in
  * HDistP introduces a referent corresponding to a witness (a set of >6 liars),
  * PredOp merely counts how many liars each analyst thinks are truthful. The
  * discourse referents may be introduced into either the current DRS box or
    into any superordinate box
    * the analysts nevertheless do not become dependent <= the distributive
      operator invariably gets stuck in its base position.  (These square with
      other proposals that Farkas makes.)
  * No mechanism with a comparable eect is available to DPs that do not
    introduce a referent, cf. (55b)
* residual question: why, then, these DPs fail to support anaphora in (51). We
  * coreference in the strict sense involves a relation between a pronoun and an
    expression denoting an individual, atomic or plural
  * Then one (natural) difference between bare indefinites like _hat fiú_
    and inhabitants of HDistP is that the
    referent that the former/latter introduces is an individual/a set
* the distinction can be accommodated in Kamp and Reyle's framework
  * may be benecial in explaining why, according to Beghelli and Stowell, bare
    indefinites never move to Spec, DistP
    and thus need to receive their distributive interpretation in an other way
  * We may correlate the feature that is checked in DistP with introducing a
    set, not an individual, referent.
* How should universals in DistP and HDistP be analyzed, then? Recall that
  * they denote principal filters, they conform happily to both the referent and
    the tripartite analyses
  * we want to treat them in the same way as the other, more discriminating
    inhabitants of the same syntactic position, i.e., using discourse referents.
  * this analysis is the only one compatible with Stowell and Beghelli's indep
    * they argue that distributivity is a separate factor
      even in the case of universals; what remains, then, is a set.
  * More specically, they discuss the following two types of data:
  (56) John didn't read every book.
  (57) What did every boy read?
  * on normal intonation, (56) only allows a reading where not > every book. The
  * (57) is that it has a pair-list reading.
  * Beghelli and Stowell (1996) and Beghelli (1996) analyze both cases by assum
    * the universal acts as a variable bound by some operator (negation or wh)
    * makes good sense if the universal introduces a set referent,
      since that is a bindable variable in DRT terms.

# 8 THE SUBJECT OF PREDICATION MODE OF OPERATION 30

## 8.1 Grab a witness and predicate distributively

## 8.2 The increasingness constraint

## 8.3 Witnesses and minimal witnesses

## 8.4 Essential quantication, again

# 9 THE ROLE OF DENOTATIONAL SEMANTIC PROPERTIES: IMPORTANT BUT LIMITED 35

# 10 APPENDIX ON HUNGARIAN 37

# REFERENCES 43
