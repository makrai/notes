Strategies for scope taking (1997)
Anna Szabolcsi
In Ways of Scope Taking. Springer (1997)

# 1 OVERVIEW

* Standard theories of scope are semantically blind. They employ
  * a single logico-syntactic rule of scope assignment 
    (quantifying in, Quantier Raising, storage, or type change, etc.) which
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
* the second case, which the present paper is concerned with, consider the fact
  * quantiers in English often scope over operators that are
    higher in the surface syntactic hierarchy. These cases are attributed to the
  * account predicts that all quantiers interact uniformly with all operators  .
  * hE, some but not all direct objects can scope over the subject (5), and over
    negation (6)
  * (5) Three referees read every/few abstract(s)
        every N > three N 
        * few N > three N
  * (6) a. John didn't read many/few abstracts.  
        many N > not
        * few N > not 
* these contrasts pertain to the syntax/semantics interface, not pure semantics.
  * the starred examples are not incoherent simply,
    the given form cannot carry the intended meaning. Proof is that
  * because the same `a`s are able to scope over the same `b`s in English when
    * they are originally higher in syntactic structure (7) or when 
    * they acquire such a higher position via overt fronting (8): (7) a. Few
      (8) Few men did no one/every woman/two women like.
* Examples comparable to (8) are in fact standard in Hungarian, a language that
  * Hungarian disambiguates scope in surface structure (see below).
* undesirable: omnivorous rule (1) + a variety of filters on its (c)overt applic
  * I argue for an approach that is as constructive as possible. This
  * in the same spirit as the CCG approach to syntax in Szabolcsi (1992) and
    * the results in this chapter are entirely independent of categorial grammar
* The assumption is that quantification involves
  a variety of distinct, semantically conditioned processes
  * Each kind of expression participates in those processes that suit its
    particular semantic properties. Thus the heuristic principle is this: (9)
  * What range of quantiers actually participates in a given process is
    suggestive of exactly what that process consists in.  
* semantically conditioned specialized scopal mechanisms were 1st made in
  Ben-Shalom (1993), Beghelli (1993), Beghelli& (1994, 1996), Beghelli (1995)
* oragnization
  * summarize those features of Ben-Shalom's semantic proposal that will be
  * reviewing certain aspects of Beghelli and Stowell's syntactic theory, and
  * data from Hungarian, a language that "wears its LF on its sleeve," provide
    specific empirical support for them
  * I propose that Beghelli and Stowell's LF, can be quite directly mapped onto
    somewhat modifified Kamp and Reyle (1993) style Discourse Representations. 
    * The main concrete modification to be proposed pertains to
      widening the class of discourse referents. 
  * the Hungarian data will be shown to provide evidence that
    the denotational semantics of the noun phrase delimits, but does not determ,
    whether it introduces a discourse referent.

# 2 CONSTRUCTIVE APPROACHES TO DIFFERENTIAL SCOPE TAKING 4

## 2.1 Ben-Shalom (1993) 

* subset of the data in Liu (1990) that do not involve partitives. 3 Some

(10) Three referees read every abstract.
(11) Three referees read fewer than five abstracts.

* The standard way to calculate the object wide scope, O > S reading of (10) is
  * form the set of things read by three referees and
    check whether every abstract is in that set.
  * this set is not the denotation of a surface syntactic constituent of the
  * the analogous set can be used in calculating an O > S reading for (11), too.
    * hE, (11) does not readily admit an O > S reading. This suggests that
* the O > S reading of (10) must be calculated in some alternative way
  that is available when the intended wide scope quantier is, say, every
  but not when it is, say, fewer than ve abstracts
* Ben-Shalom proposes that inverse scope is effected by a specic binary quantier
  [O > S]
  (12) If S and O are generalized quantiers and R is the relation denoted by a
  transitive verb, the binary quantier [O > S] is defined to operate as follows:
  For every a \in A S(R(a)), where A is some set determined by O.
  * Grab a set A determined by the quantier denoted by the object and check, for
    every element a of this set, whether it has the property that three
    referees read it
  * The fact that Ben-Shalom formulates her proposal using a binary quantier is
    immaterial for our present concerns, so it will not be dwelt on.
* twofold procedural difference between the standard calculation of scope and the one
  encoded by [ O > S ]
  * On the standard account, we construct the set denoted by \lambda a S(R(a))
    and let O operate on it
  * [ O > S ], this set does not need to be constructed and
    O is not a predicate operator. Instead,
    * O contributes a domain of entities, each of which is checked for the
      property \lambda a S(R(a))
* The binary quantier [ O > S ] works most straightforwardly
  when O is a principal filter
  * a principal lter determines a unique set, called its generator, within its
    restrictor
    * The unique set that [every man]/[John and Bill] determines is the set of
      men/{john, bill}
  * When O is just monotone increasing, it determines several suitable sets (in
    a big enough model), called its witnesses, so the operation of [O > S] is
    less simple but still perfectly viable
  * otherwise O does not determine any suitable set on its own. As is explained
    * the truth conditions of _Fewer than/Exactly six men walk_ cannot be
      specied as "There is a set A consisting of fewer than/exactly six men such
      that each a \in A walks."
* According to Ben-Shalom, [O > S] captures the empirical facts correctly
  because the best inverse scope takers in English are indeed principal filters.
  * I will consider a wider range of quantiers in a wider range of contexts, and
    propose a somewhat similar account of them,
    exploiting the fact that the strategy "Grab a witness set and check its
    elements for property P" generalizes exactly to the increasing quantiers.  
* Beghelli and Stowell: the overall picture of scope interaction is more complex
  * need to factor out the contribution of distributivity
  * the possibility of inverse scope depends, not only on the choice of the wide
    scope taker but, sometimes, also on the choice of the narrow scope taker.

## 2.2 Beghelli and Stowell (1994, 1996) 6

* Like Ben-Shalom, Beghelli and Stowell dispense with Quantier Raising, an
  omnivorous movement rule without a specic landing site, and propose that
  * Logical Form in English includes, among others, the following hierarchy of
  functional projections
  RefP = Referential Phrase
  AgrSP = Subject Agreement Phrase
  DistP = Distributive Phrase
  ShareP = Distributed Share Phrase
  NegP = Negative Phrase
  AgrIOP = Indirect Object Agreement Phrase
  AgrOP = Direct Object Agreement Phrase
  VP = Verb Phrase.  (13) 
* Each type of quantier acquires its scope by moving into the specier of that
  functional projection which suits its semantic and/or morphological properties
  * position can be filled multiply and its content undergoes absorption. Some
  * Definites ( the two men ) move to the specier of RefP, and
  * distributive universals ( every man ) to the specier of DistP
* The head of DistP, a distributive operator, selects for a ShareP complement,
  which can accommodate either an indefinite ( two (of the) men ) or an
  existential quantier over events. Indefinites may alternatively move to the
  specier of RefP.
* Modied numerals (more/fewer than/exactly six men) and
  indefinites whose noun is destressed)
  do not move to either RefP, DistP, or ShareP. They
  just move to the appropriate agreement specier positions to receive Case. The
  * they easily take widest scope
    because AgrSP in English is higher than DistP and ShareP. On the other hand,
* indirect and direct object modified numerals happen to have their agreement
  positions quite low in the structure, and they scope accordingly. 6
* Scope relations arise in two ways.  They may
  * simply follow from the hierarchy specied in (13). For instance, an
    indefinite direct object may scope above a universal subject by moving into
    RefP, which happens to be above DistP: (14) a. Every man read two of the
  * the inverse reading of _Two of the men read every book_ comes about by
    moving every book to DistP and two of the men to ShareP. 
  * Inverse scope may also be due to reconstruction: a phrase can be lowered
    into the position(s) of its trace, typically, into its VP-internal position.
    * lowering is restricted to undoing semantically insignicant movement,
      i.e. an expression can be lowered from its Case position but not from
  * The converse is not possible: _Every man read more than three books_ does not
    receive an inverse scope interpretation. Every man cannot undo its presence
* There is a slight difference between (16) and _More than three men read more
  than six books_
  * Here inverse scope is very dicult but, in contrast to (16), can be forced by
    context. Since more than three men as a subject can in general reconstruct
    into its VP-internal position, this is predicted. 
* Definites and bare indefinites do not move to DistP even when they are
  * their distributive interpretation is due to a silent operator comparable to
    floated _each_
  * Beghelli and Stowell call this "pseudo-distributivity."
* Silent each can apparently occur below AgrSP, ShareP, AgrIOP, and AgrOP, but
  not below RefP. This captures the fact that even when direct object _three
  books_ moves to RefP and is therefore referentially independent of subject _two
  of the men_, it cannot make the latter referentially dependent, since there is
  no distributive operator between the two positions 
* On the other hand, in _Two men read three of the books_ the property of having
  read three of the books can be distributed over two men, because the latter
  has a trace in AgrSP associated with silent each :
* Similarly, the direct object in RefP can distribute over a subject that recon-
  structs into VP, because it has a trace in AgrOP and AgrOP may have silent
  each associated with it.
* In sum, the distributivity of
  * universals is due to a separate distributive operator (Dist) and, similarly,
  * definites and bare indefinites is due to a separate distributive operator
    (silent _each_)
  * Once the distributive key and the distributive operator are separated, they
    can move separately. This possibility is made crucial use of.
    Every man and (the) two men are allowed to move upward unboundedly to a
    higher RefP,
    but the corresponding distributive operators, being heads or adverbs, stay
  * it is predicted that (20) has a de re reading, 
    every/two woman < more than six men
    * as this property does not distribute
    (20) More than six men imagine that every woman/two women will fall in love
    with them.
* two facts underlie the traditional observation that "QR is clause-bounded"
  * Dist and _each_ do not move up, together with the fact that
  * the QP's landing site in the higher clause, RefP, is itself not associated
    with a distributive operator

# 3 CLAIMS TO BE MADE 9

* Below I will examine Hungarian data in the light of Beghelli and Stowell and
21. Hungarian distinguishes scope positions in its surface syntax that are
    highly reminiscent of those postulated by Beghelli and Stowell for Logical
    Form in English.
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
* pretheoretical names that have by now become more or less traditional I coined
  the speaking name Predicate Operator for Focus. As usual, the 
  `*` indicates that the given position may be filled multiply:
`Topic* Quantier* {(Negation) Focus Predicate Operator} Negation Verb
                                                                    Postverbal*`
* The fact that left-to-right order determines scopal order follows from (30).
  * For recent discussions, see E ! . Kiss (1991, 1994)
  * (30) In Hungarian, operators c-command their scope at S-structure 
    (where c-command is dened in terms of 1st branching node)
* Typically, a Hungarian sentence with n scope-bearing DPs will have n or n 1
  in the preverbal field, so that their scopes are indeed disambiguated by
  * The postverbal field is assumed to have a flat structure
  * It is rare but possible to have more than one scope-bearing DP postverbally
  * to their relative interpretation I will return to in the Appendix.  Some of
  * diagnostics of which position a DP occupies in the preverbal field follow:
    * Topics, but not other preverbal items, can be followed by sentential
      adverbials like _tegnap_ `yesterday.'
    * When a Topic or Quantier precedes a non-negated finite verb that has a prefix,
      the prefix is in proclitic position. 
    * When a Focus or Predicate Operator precedes a non-negated finite verb that
      has a prefix, the prefix occurs postverbally
    * A sequence of Quantiers cannot be broken by a non-Quantier. 
    * A DP in Focus receives an exclusion-by-identication interpretation
      * a DP in Predicate Operator does not.

## 4.2 A parallelism with Beghelli and Stowell's LF 11

* I argue that the extent to which Hungarian surface structure reveals the
  syntax of scope is even greater than has been thought. In general, it demon-
  * QPs are not simply lined up in the desired scopal order but occupy specic
    positions
  * the traditionally distinguished positions correspond quite closely to the
    specier positions of the functional categories in Beghelli and Stowell's
  * For the time being, I ignore the postverbal field.  (32) 

|Topic                | Spec, RefP    | Proper names, definites, and indefs   |
|                     |               | that take widest scope in their own cla|
|Quantier             | Spec, DistP   | Distributive universals               |
|Focus (with indefs.) | Spec, ShareP  | Bare indefinites that scope under     |
|                     |               | distributive universals               |
|Predicate Operator   | Spec, AgrP/VP | Modied numerals, which do not readily |
|                     |               | take inverse scope in English; indefs |
|                     |               | whose N is destressed and whose numeral|
|                     |               | is interpreted as "exactly n"         |

* This parallelism is supported by data that pertain to 
  * exactly what noun phrases occur in each position, and 
  * what kind of interpretation they receive there.
* restrictions on the occurrence of DPs in these positions are well-known. E.g.
  * a Topic must be specic, and universals do not occur in Topic or Focus (this
  * hE, no systematic investigation of these matters has been carried out to
  * I examine a representative sample. The data are summarized in (33) on the
  * many DPs occur in more than one position as we shall see, their
    interpretations vary accordingly.
* it seems justied to refer at least to
  Hungarian Topic as (spec of) HRefP and Hungarian Quantier as (spec of) HDistP.
  * hE, I will retain the labels Focus and PredOp since here, it seems, the
    pertinent similarities are functional and
    the residual differences are signicant.
  * ShareP, unlike Focus, does not host definites
  * PredOp, unlike AgrP, is not Case-related, etc.  
* another respect in which Hungarian differs from English is that
  Hungarian has no agreement (Case) positions mixed with the scope positions in
  the preverbal field, whence scope relations are independent of the arg hier.
  * In the Appendix I outline an analysis of Hungarian sentence structure that,
    among other things, captures the observations above.

# 5 OUTLINE OF THE ANALYSIS 14

* I will focus on the positions HRefP, HDistP, and PredOp, and argue that their
  inhabitants contribute to the interpretation of the sentence as summarized in
  (34) through (36). 
* Focus is omitted, because it has an obvious additional semantic function that
  is irrelevant to the present concerns.)
* I formulate my claims with respect to Hungarian and will argue for them using
  Hungarian data, but recall that I believe that, modulo the obvious
  cross-linguistic differences, these data are supportive of Beghelli and
  Stowell's approach and my claims are intended to hold of their logical forms,
  too. In fact, some of these claims are incorporated into Beghelli and Stowell
  (1994, 1996). 13 
34. DPs that occur both in HRefP and Focus, as well as valamely/bizonyos N `some
    N(s)' that only occur in HRefP, contribute an individual to the
    interpretation of the sentence, i.e., an atomic or a plural individual (the
    atoms of) which correspond(s) to the element(s) of a minimal witness set of
    the DP. 14 This individual serves as a logical subject of predication.
    Predication may be distributive or collective, depending on the predicate.  
35. A DP in HDistP contributes a set to the interpretation of the sentence,
    i.e., a witness set. This set serves as a logical subject of predication
    mediated by a distributive operator.  
36. A DP in PredOp does not contribute an entity to the interpretation of the
    sentence and does not serve as a logical subject of predication
  * It performs a counting operation on the property denoted by the rest of the
    sentence
  * If that predicate is
    * distributive and thus denotes a set, the DP counts its elements. If that
    * collective and thus has plural individuals in its denotation, the DP
      counts the atoms
  * The result of counting may even be compared to the cardinality of the common
    noun set, i.e. the DP's determiner need not be intersective.  
* The basic distinction that I wish to make is between DP denotations that
  * contribute an entity as a target of predication and DP denotations that
  * operate on the denotation of the predicate in the manner of generalized qnts 
* Such a distinction seems straightforward between
  names, definites and bare indefinites on the one hand and
  modied numerals on the other. 
* Distributive quantiers might seem to side naturally with the latter group, but
  I claim they indeed side with the former and end up as one
  * subspecies in the "subject of predication" category. This is what the
    proposals in (34) through (36) attempt to capture.
* a natural framework for expressing these proposals is a version of the
  Discourse Representation Theory expounded in Kamp and Reyle (1993)
  * The claim that some DPs serve as logical subjects of predication should
    translate as the claim that they introduce discourse referents. Following
  * by "introduces a discourse referent" I mean that
    the rule processing the DP introduces a referent
    either into the universe of the very DRS to which it is applied
    or into the universe of a superordinate DRS.  
* Thanks to such referents, these noun phrases support non-maximal reference
  anaphora. This contrasts with rules that take care of quantiers; these place a
  discourse referent into a newly created subordinate DRS (introduce duplex con-
  ditions). These latter noun phrases only support maximal reference anaphora
  (constructing an antecedent for a subsequent pronoun involves the abstraction
  operation that intersects the denotations of the 1st and the second arguments
  of the determiner). 16 
* Kamp and Reyle stipulate that when a DP "introduces a discourse referent"
  then, at the point of introduction, it is associated with all and only the
  conditions that come from material inside the DP
  * i.e. even if a referent is introduced into a superordinate DRS, it will
    never be divorced from its DP-internal conditions. This needs to be
    stipulated, because Kamp and Reyle's discourse referents are plain variables
    ranging over the whole universe, and DP-internal conditions are represented
    as predicated of them
  * In contrast, in (34) and (35) I assume that a referent is a sorted variable
    that is ab ovo restricted to ranging over (plural individuals formed from
    minimal) witness sets

# 6 DISTRIBUTIVE AND COLLECTIVE READINGS 19

## 6.1 Distributivity in HDistP

## 6.2 Two types of collective readings: HRefP and PredOp 22

# 7 TWO TYPES OF DISCOURSE REFERENTS 23

## 7.1 No plural individual referent in HDistP

## 7.2 Essential quantiers and distributivity

## 7.3 Set referents in HDistP

# 8 THE SUBJECT OF PREDICATION MODE OF OPERATION 30

## 8.1 Grab a witness and predicate distributively

## 8.2 The increasingness constraint

## 8.3 Witnesses and minimal witnesses

## 8.4 Essential quantication, again

# 9 THE ROLE OF DENOTATIONAL SEMANTIC PROPERTIES: IMPORTANT BUT LIMITED 35

# 10 APPENDIX ON HUNGARIAN 37

# REFERENCES 43
