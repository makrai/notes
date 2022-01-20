Grammatical Relations and Montague Grammar
David Dowty
The Nature of Syntactic Representation pp 79-130 | Cite as

# 0 INTRODUCTION

* we: a universal definition of grammatical relations and rel changing rules
  * data from Relational Grammar
  * MG framework
* Montague Grammar
  * formal theory of syntax and semantics of natural language
  * developed originally by Richard Montague (1970,1973) and
  * subsequently extended in a certain series of treatments of Montague's ideas
    * Thomason 1976 (first written in 1972), Thomason 1974, Dowty 1979a (written
      in 1975), Dowty 1975, Dowty 1978, Bach 1979 (written in 1977), Bach 1980,
      and Schmerling 1979.  I believe
* our analysis of grammatical relations is supported by some of the same
  observations as the related theories of Relational Grammar and Arc Pair Gramm
  * RG and APG developed by (Perlmutter and Postal 1977, Johnson and Postal x,
    Perlmutter and Postal to appear, Perlmutter this volume, Postal this vol)
* Chomsky's original definition of grammatical relations (Chomsky 1965), which
  * stated in terms of linear order and domination by the nodes S and VP, seems
  * inadequate for languages in which the order of constituents is different
    * VSO languages like Breton or Welsh in which there can be no VP node, and
    * most inappropriate of all for free word-order languages
* grammatical relations have consistent properties across all these languages
  * rules like Passive, Dative Shift and the Raising rules behave in the same
    way in most languages
    with respect to their effect on these grammatical relations,
    though the word orders that result from these processes are quite different
* Relational Grammar approaches this problem by
  * Subject, Object and Indirect Object (the term relations) to be primitives
  * language-universal rules that 'change' grammatical relations (Passive, Rais)
    defined directly in terms of these relations
* I am not attempting to reconstruct RG in terms of Montague's framework,
  * many of the ideas of Relational Grammar will have no counterpart
    * e.g. no notion of a chômeur in the present account
      * chomeur is a noun phrase that has been "displaced" by a
        relation-assigning rule and is therefore stripped of its term relation;
        see Perlmutter, this volume
  * RGs have produced a large body of research on a wide variety of languages
    * need for a universal definition of grammatical relations and relation
      changing rules, and it is these two fundamental ideas that I would like to
      account for in Montague G

# 1 SOME ESSENTIAL FEATURES OF MONTAGUE'S SYNTAX AND SEMANTICS

* Montague used recursive definitions which build up a sentence from the inside
* no distinction between lexical and non-lexical categories in Montague's synt,
* semantics in Montague Grammar and how it relates to syntax
  * I won't need to say anything at all about some aspects of it that Montague
    considered the most interesting
    * quantifiers are treated, for example, and de dicto and de re ambiguities
    * I systematically simplify what I say about the interpretation of NPs
* basic semantic notions are truth and denotation.  The theory thus associates
  * name: an individual that that name denotes in each possible situation. With
  * intransitive verb: a function that picks out, in any possible situation, the
  * a subject-predicate sentence is true in a situation just in case the
    individual denoted by the subject is among the set of things denoted by the
    predicate
* there is a semantic rule for each syntactic rule: to get the meaning
* problem with the interpretation of transitive verbs
  * In most systems of logic, a transitive verb is treated as denoting a rel,
  * in MG, the verb combines with these Term phrases in two separate rules
    * the second semantic rule we use has to be the same as the rule for intrans
    * a transitive verb denote a function that in any situation, applies to one
      individual to give a new function this new function is one that will in
* this same method could be extended to verbs with three or more arguments

# 2 DEFINING "GRAMMATICAL RELATIONS" 6

* Montague's "one argument at a time" approach to the syn of intrans, trans, di
  * as Schoenfinkel (1924) first observed, that
  * a function of n arguments can always be equivalently represented as a
    function of one argument that yields a function of n 1 arguments as its
  * This simple idea is the germ of my account of grammatical relations
  * implies a certain interrelationship among the syntactic categories involved
    in sentences with multi-place verbs (and likewise the syntactic rules used
    to form sentences with these verbs) as a consequence of the one-to-one
    relation between semantic rules and syntactic rules that Montague requires
* In describing syntactic rules, Montague made a systematic distinction between
  * the operation that a syntactic rule performs on an expression, i.e
    * how it manipulates words or phrases in combining them, and
  * the syntactic rule itself.  A syntactic rule
  * specifies
    * what categories of expressions are inputs to the rule and
    * what category of expression results from the rule, as well as specifying
    * what operation is to be used in putting them together; also, the same
* vary from language to language?
  * operations used by rules: greatly
    * not limited to simple concatenation as are phrase structure grammars but
      may rearrange or add morphological marking to these phrases
    * may perform any of the manipulations that transformations perform in a TG
  * not
    * syntactic rules do not, aside from the nature of the operation,
    * semantic operations that correspond to these rules
* Montague (1970) specified the format of a syntactic rule as an ordered triple:
  * a syntactic operation, e.g. `F_1`,
  * the sequence of categories that are the inputs to the rule, the third member
  * the category of the output of the rule

```
  S_1: <F_1, <IV, T>, t>   (Subject-Predicate Rule)
  S_2: <F_2, <TV, T>, IV> (Verb-Direct Object Rule)
```

* it is merely how the operations F 1 and F 2 are defined that the langs differ
  * In English, an SVO language, the operations F 1 and F 2 concatenate
    expressions and perform the number agreement and case marking:
    * `F_1 (a, b) = ba'`: marking the verb in `a` to agree with `b`
    * `F_2 (a, b) = ab'`: marking `b` with accusative case
  * In Japanese, an SOV language, the two operations involve
    * suffixing the markers _-ga_ to the subject and _-o_ to the object term,
    * `F_2 (a, b) = b'a'`
  * In Breton, a VSO language, something slightly different is called for: the
    * `F_1` will insert the subject term phrase after the first word of the VP,
      i.e. after the verb
    * This kind of operation is called right wrap by Bach (1979)
    * cannot be done with a PS grammar, and I believe it is one that is
    * found in SVO languages like English as well (though not for `F_1`)
  * Latin as an example of a so-called "Free word order" language
    * Latin may not be the clearest example of a free word order language
    * it may be true that no language is completely free in its word order
    * let us suppose that the order of S, V and O is completely undet by synt
    * we might regard a grammar for at least certain parts as producing an
      unordered set of words as a sentence
    * the subject and Object are marked by case endings, but the derived
      expressions are otherwise simply the unions of two unordered sets
* universal definitions of relations like Subject-of and Object-of:
  * syntactic rules such as S1 and S2 minus the specification of `F_1` & `F_2`
* distinction between syntactic operation and syntactic rule has been suggested
  * Curry (1963) noted that the logician's algebraic way of viewing a language -
    * a finite set of elementary expressions, that is words, plus
    * a set of operations which can be performed recursively on these
    * the most fundamental aspect of grammatical structure is
      * the series of steps by which an expression is put together, the sequence
        in which expressions and operations are employed in producing a full
      * not the way this structure is actually represented in terms of linear
        order or morphological markings
    * two levels of grammar,
      * the study of grammatical structure in itself and
      * a second level has much the same relation to the first that
        morphophonemics does to morphology. In order to have terms for immediate
      * tectogrammatics and phenogrammatics
  * tectogrammatical structure of a sentence is what would be represented by a
    Montague Grammar analysis tree, minus the specification of the expressions
    at the non-terminal nodes
    * would be more invariant across languages than phenogrammatical structure
  * phenogrammatical structure of the sentence is the way the English operations
    fill in these non-terminal nodes
  * universal grammatical relations are an aspect of tectogrammatics, not pheno

* a few more grammatical relations
* Indirect Object
  * three-place verb can be given the same relationship to a transitive verb as

```
  S_3: <F_3, <TV/T, T>, TV> (Verb-Indirect Object Rule)
```

* `F_3`
  * English: F 3 (a, b) = a to b', where b' is the accusative form of b
    * This simple description is only illustrative. Ways of remedying this:
    * allow syntactic operations to "build" phrase structures, following the
      suggestions of Partee (1975, 1979)
      * The operation `F_3` would produce [IV a [pp [`b` to] b']], where b' is
        the accusative form of b
    * Gazdar's proposal (in this volume) to treat prepositional phrases as
      syntactically subcategorized by the "case marking" prepositions that occur
      as their heads, e.g., there would be categories PP[+to], PP[+for] , etc
  * in other languages, `F_3` marks T with Dative case
* the English Verb-Direct Object operation will have to be modified to a "Right
  Wrap" operation, when combining a verb with a direct object
  * there is independent motivation for this Right Wrap operation in English, as
    (Partee (1975), myself (1979b: ch. 4), and Bach (1980))
* IV-complements, for example, sentence complements or adjective complements,
  will all be treated as arguments of verbs, just as noun phrases will; these
  are just "other" grammatical relations like subject and object

# 3 ARGUMENTS VERSUS MODIFIERS  11

* Relational Grammarians talk about some other noun phrase grammatical relations
  * Subject, Object, and Indirect Object
    * (called term relations by Perlmutter and Postal)
  * the (socalled) Oblique relations Benefactive, Instrumental and Locative
* Under the present analysis, the these are quite different
  * the "term relation" noun phrases are arguments inherently needed for the
    meaning of a verb
  * Obliques are best treated as modifiers of IVs. That is, a
    * Benefactive rule is a rule that takes a term phrase `b` and an IV `a` and
      turns them into a new IV denoting the property of doing `a` so as to
      benefit the individual named by the term `b`. That is, it might
      * e.g. map the set of individuals that walk into the set of individuals
        that walk for Mary.  Such a rule is given in (15):
* two reasons why Obliques are treated this way rather than as args of verbs
  * one can add a benefactive to virtually any IV whatsoever
    * an intransitive verb, or a verb with an object, or a verb with other
      complement(s) e.g. _try to walk_
  * the meaning of an IV can be complete without an Oblique:
    * e.g. _I baked a cake_,  I might baked the cake for no one at all. By
    * the second and/or third arguments of an inherently two or three-place verb
      are always implicit in the meaning of the verb, even if they are

# 4 RELATION-CHANGING RULES 12

* Just as Relational Grammar describes them in a language-universal way
  * characterize them in terms of the universal grammatical relations i.e. in
    terms of tecto grammatical structure alone
* it is not the status of a noun phrase which is changed, but only the verb / VP
  * In contrast to TG and RG,
* all such rules change the (sub)category of a verb in this analysis
  * a category-changing analysis of relation-changing verbs

## 4.1 Relation-Reducing Rules 13

* e.g. eat or hunt or cook: the object may not be relevant to the addressee, or
  the speaker may not know or care what the second individual is
* two ways one can turn a relation into a set of individuals:
  * extract the set of individuals that are first members of all the pairs in
    * treated in classical TG by a transformation which deletes something from O
    * in the present theory: a rule which converts a transitive verb into an IV
    * the associated semantic rule affects the meaning in the appropriate way
  * take the set of individuals that are second members of pairs
    * the so-called agentless passive
    * In this case also the TV is converted to an IV, but here the verb is
      marked with passive morphology; the rule is given and
      * semantic operation: "the set of all y such that for some x, x stands in"
    * An alternative way that languages have of performing this kind of redu is
      by an impersonal construction
      * a rule which leaves the verb as a transitive verb but interprets the
        verb in much the same way as before the object of the derived verb is
        still interpreted as the object of the original verb would have been,
        but the subject now makes a "vacuous" contribution to the meaning
      * The syntax must now be arranged so as to insert a dummy NP into subject

## 4.2. Relation-Rearranging Rules 14

* converts the verb into a new function with the arguments interpreted in a
  different order. One such rule is the
* agentive passive construction (or "full passive"). The semantic operation
  * mapping a relation into its converse.  As I write the rule here, this
  * accomplished in one step:
    * this "reversing" of the relation and
    * the combination of the function with the argument denoted by the agent
  * [John is loved by Mary]
* Dative Shift
  * takes a 3-place verb, such as give, and converts it into a new 3-place verb
  * hE, the rule combining verbs in TV/T with their object inserts the _to_ and
  * The semantic operation for Dative Shift (S8) maps (x, y, z) to (x, z, y)
  * _Mary gives John a book_ will be produced as the analysis tree in (24)
    shows,
* Raising to Object Position. This rule, given in (27), will take as
  * input a verb subcategorized for a sentential object, e.g. _believe_
  * IV/t -> TV/IV

## 4.3. Relation Expanding Rules 17

* like the cases of modifier rules I discussed earlier, which effectively map an
  n-place relation into a n + 1-place relation. The difference here is
* the "added" noun phrase is represented in the syntax as a subject or an object
* e.g. the causative rule, in which the new noun phrase, the agent of the
  causation, appears as the subject of the new verb. The syntactic rule for
  making a transitive causative: verb from an
* Semantic Operation: \l y \l x \exists P P(x) CAUSE a'(y)
* Other languages also have a causative rule for turning a
  * transitive verb into a ditransitive causative verb this is S12 in (33) and
  * ditransitive verb into a four-place causative (cf. Dowty 1979)
* There is a construction in a number of Bantu languages in which a noun phrase
  with locative, benefactive, or instrumental meaning appears in the syntactic
  position of the direct object and behaves, with respect to other syntactic
  rules, as if it were a direct object;
  * a case of a relation-expanding rule in which the added NP appears as the DO
  * adds a suffix to the verb stem (called an _applied affix_ by Bantuists),
    e.g. the suffix _-r-_ in Chichewa

# 5 ARGUMENTS FOR THIS TREATMENT OF GRAMMATICAL RELS AND REL CHANGING RULES 19

* why this approach might be preferable to either the TG or RG accounts of the
* §5.1 and §5.2 provide reasons for preferring the definitions of gramm rels,
  the remaining arguments pertain to relation-changing rules

## 5.1. Universal Tendencies in Word Order 19

* Greenberg's (1963) ground breaking work on word order, linguists have tried to
* a VO/OV language is one in which functors tend to be ordered to the left/right
  of their arguments, while an OV language is one in which functors tend to come
  * The attempt to account for these word order universals in terms of functor
    and argument relations is of course not new (cf. Vennemann 1973), but what
  * Montague's semantic framework explicates which constituent is "functor" and
    * such independent justification is of course necessary if alleged
      explanations of word order have any true explanatory power

## 5.2. Discontinuous Constituents

* superior to the PS grammar-plus-transformational component theory; this
* arises from the use of operations like Right Wrap in the structure building
* Anderson and Chung (1977): in Breton, there is no evidence that the VSO word
  order arises either from an underlying SVO order or an underlying VOS order
* from the point of view of several syntactic rules, the combination of verb and
  object seems to behave as a constituent that is, like a VP constituent in
* paradoxical under the transformational theory, since if VSO were the
  underlying word order, there could be no such underlying constituent.  But in
  the analysis I suggested for Breton, Verb and Object do form a
* here: a constituent in the tecto grammatical sense, not (in Breton) in pheno

## 5.3. "Structure-Preserving" Rules

* relation-changing rules are rules applying to verbs or VPs, not to sentences
* the category-changing analysis predicts three commonplace observations about
  * TG and RG have certainly described adequately but in no way predict; these
  * discussed in this and the two following sections.  Because these
* the "structure-preserving" nature of rules like Passive, Raising and Dat Shift
  * the results are structures almost exactly like those structures produced
* here: the rules which add the noun phrase arguments to a verb after it has had
  its grammatical relations changed will be (in the simplest grammar) the very
  same rules that add these arguments to an unchanged verb, e.g. `S_1` and `S_2`

## 5.4. "Relation-Changing" Morphology is Marked on Verbs 21

* when the application of a relation-changing rule is signified morphologically,
  that marking appears on the verb of the sentence, not e.g. on the NP changed
* here: since the only constituent the relation-changing rules have to operate
  on at the time they apply is the verb, hence there is nothing else that a
  * e.g. the passive morphology, the _applied suffixes_ in Bantu, causative
    affixes and the Dative Shift Affix in Bahasa Indonesian. 10
* In both RG and in the TG account, by contrast, a whole sentence is operated on
  by the rules in question, so there is no obvious reason why the passive marker
* possible objection: operation of the passive is in fact marked on the Object
  * NP appears in Subject position, rather than in post-verbal position it would
  * what I am predicting does not occur in natural language is a passive rule
    whose application is marked by a special morpheme on the subject NP in
    addition to whatever normally marks subjects in that language, but with no

## 5.5. Relation-Changing Rules are Lexically Governed by Verbs

* these operations are lexically governed in many languages, and that
* the lexical item which governs them is invariably the verb of the sentence. As
  (rather than, say, the NP to be moved)
* nothing in the TG analysis of these constructions nor in RG predicts that
* why re1ation-changing rules should be governed lexically while other rules,
  such as Relativization, Question formation and other unbounded rules, are
  never lexically governed in any language. Under the category-changing

## 5.6. Category-Changing Rules as Either Lexical or Syntactic 22

* Dowty (1975, 1978) proposed a theory of lexical rules for a Montague Grammar
  * Dative Shift, Raising and other such alleged "lexically governed" transform-
    ations are lexical rules
* lexical rules are in general exactly the same as that of true syntactic rules,
  * difference being in the status of the outputs of the rule in the grammar:
    * syntactic rules, the outputs are all grammatically derived expressions
    * lexical rules, the outputs are: merely possible derived lexical items
      * meanings: some conform exactly to that produced by the lexical rule,
        other words do not
* It also follows, that a putative syntactic rule can be treated as a lexical
  rule instead only if the expressions to which the rule applies are finite in #
  * this will be the case for Dative Shift and some of the other rel chang rules
    as I have formulated them because they in effect apply only to single verbs,
    * unlike under the TG or RG accounts, because the rules in these frameworks
      apply to an infinite number of sentences, not to a finite list of verbs
* it would not be possible to reanalyze rules such as Relative Clause Formation
  (in English, at least) as category-changing rules applying to a finite number
* Bresnan has recently proposed a view of a grammar in which rules such as
  * important difference in the claims she and I are making:
  * she regards all function-dependent rules as lexical rules in principle, I am
  * Bresnan would consider the English passive rule to be a lexical rule, but I
    do not. Under the present framework,
  * two sets of arguments can be given for treating Passive as a syntactic rule
    * there are cases in which the TV expression that undergoes Passive is a
      syntactically derived phrase instead
      * e.g. all of the italicized phrases in (36) are synt complex TV phrases
      * the basic verb occurring within them would be put in some other category
    * Bach (this volume) has argued: under the assumptions of the approach taken
      by this paper, purpose clauses such as _to deliver groceries in_ in (37)
      must be analyzed as modifiers of transitive verbs, not as modifiers of
      verb phrases
      * the TV expressions that are passivized in (39) must be _buy for Bill to
        deliver groceries in_ and _bring in for us to talk to_ respectively;
      * syntactically complex expressions which have a potentially infinite
        variety offorms, so the Passive rule I have given cannot apply to them
* The view of category changing rules as potentially either lexical or syntactic
  * we can recognize a single language-universal characterization of these
  * they can be lexical rules in some languages and syntactic rules in others
    * Causative, for example, is clearly a lexical rule in English, but I
      consider it a syntactic rule in Turkish). Since the rules have the same
  * a language might have one of these rules as a lexical rule at one historical
    stage of its development and easily reanalyze it as a syntactic rule at a
    later stage (or vice versa) without any significant change in the form or
  * in the course of language acquisition, children may temporarily acquire as a
    syntactic rule a rule that is lexical in their parents' speech, since no
    change in the form of the rule need be postulated when the child later
    reanalyzes the rule as a lexical rule and starts memorizing its outputs
    individually
    * there is some evidence that English-speaking children use the causative as
      a freely productive syntactic rule at some stage (Bowerman 1974),

## 5.7 Object-Controlled vs. Subject-Controlled Verbal Complements 25

* Bach (1980): under the category-changing analysis of rules like Passive, we
  can take advantage of the possibility of the novel way of treating
  discontinuous constituents I mentioned earlier to
  * systematically exclude on syntactic grounds what had been thought to be
    lexical exceptions to the passive rule
  * we want maintain the claim that Passive is a syntactic rule
* Bach suggests that it is a systematic principle that when an infinitive
  complement of a verb is syntactically controlled by a NP outside the
  infinitive
  * i.e. when this NP triggers reflexive agreement or number agreement within
    the infinitive, and when this NP is involved in semantic entailments with
    respect to the infinitive,
  * then this NP must be the next higher argument of the verb after the inf
* e.g. _persuade_ vs _promise_. In the sentence
  * _Mary persuaded John to wash himself_, the infinitive is controlled by John,
    * it is this NP that will trigger reflexivization in the infinitive.  Also
      John is the "understood subject" of _wash himself_
    * `[persuade to leave]_TV John`
  * with _promise_, the NP that controls reflexivization and is semantically
    interpreted as the understood subject of the infinitive is the matrix
    subject NP Mary
    * syntactic analysis for promise should be that illustrated in (41), in
      * the object NP is the argument added before the infinitive, so that the
        next NP to be added after the infinitive is the subject NP
    * `[promise John]_IV/IV leave`
  * _persuade_ should be put in the same syntactic category TV/IV, while
    _promise_ is put in the category (IV /IV)/T
  * different tectogrammatical structures, in spite of parallel phenogrammar
* Bach's principle does not follow from the assumptions I have developed
  * it does slightly simplify the syntactic treatment of reflexivization and
    other agreement within infinitive complements, without resorting to an Equi
    analysis of infinitives
  * it predicts that verbs like _promise_ can never undergo passive. This is so
    * no phrase of the category TV is ever produced
* This correlation between subject control and lack of passives if of course
  well-known (Visser and other traditional grammarians have noted it), but I
  * nowhere in any transformational theory

## 5.8 The Interaction of Causativization with Other Rules 27

* problem (Aissen 1974) with the usual "two-clause" analyses of causative sents
* cyclic transformations must (in at least many cases, in various languages) be
  prohibited from applying in the lower clause before causative formation
  converts the two-clause structure to one clause
* if causative rules are relation-expanding rules applying to verbs, as sugges-
  * there is no lower clause involved in the derivation of causative sentences
  * arguments for the presence of the underlying two-clause-structure are sem
  * hypo: causative formation (or "Verb Raising") is pre-cyclic (Aissen 1974)
* If causative formation is treated as a
  * lexical rule in a given language while Passive, Reflexivization, etc. are
    handled by syntactic rules in
    * the effect of a "lower clause" application of any such syntactic rule is
      predicted not to occur, given the theory of lexical rules advanced in
      Dowty (1978, 1979b). If causative is a
  * syntactic rule or rules, taking as input VPs of category IV, TV, etc., it is
    * still predicted that no "lower clause" applications of rules involving the
      "embedded subject" can be observed (e.g.  subject-verb agreement), but
    * Passive and Reflexivization will give as output expressions of category
      IV,
    * it is now possible for such rules to "feed" causative formation
* causatives of passives do appear in some languages, ones which have synt cau
  * (cf. Newmeyer (1976, note 10) on Eskimo; Zimmer (1976) on Turkish). And
  * reflexive pronouns sometimes appear in complements of causatives in various
    Romance languages (Taraldsen 1976), in positions controlled by the "embedded
    subject" in a traditional analysis (but compatible with the IV -treatment of
    reflexivization just mentioned). Though I have not made investigations of
    all the relevant languages, there seems to me
* I hope that the remaining failures of syntactic rules to feed causativization
  (in languages where causativization is syntactic) may be explainable in
  various languageparticular ways: There may be morphological incompatibilities
  between reflexive and passive affixes (cf. Zimmer (1976, 403ff)); given the
  rich system of verbal subcategories needed in the present approach,
  * causative can perhaps be excluded from applying to certain motivated
    subcategories of verb phrases; conditions on Reflexivization will vary from
    language to language, causing Reflexivization to interact differently with
    causativization in different languages

## 5.9 "Wanna" Contraction 29

* _Teddy is the man I wanna/want to succeed._
* phonological contraction
  * cannot apply across the "extraction site" of a transformation like WH-move,
    * my anal: "gap" (subscripted pronoun, trace, etc.) to be put in place of
      the "missing" NP, at least temporarily
  * can apply across the gap left by Passive, Raising, or Equi (on mov/del
    * in my anal, no deletion or movement of a NP is involved in these latter
* my assumption that gaps uniformly block contraction
* Jacobson (in this volume) surveys the accounts that have been proposed

## 5.10 Theoretical Simplicity

* RG takes grammatical relations as primitives, while in the approach I have
  * I: grammatical relations play an important role in the way syntax relates to
    compositional semantics
* most of RG axioms or laws are entirely independent of one another. Though the
* my approach is much less detailed, but all results from
  * Montague's general approach to syntax and semantics, plus only two
  * 'single argument' principle in (6) and the assumption that
  * relation-changing rules are operations on verbs, not on full sentences
  * All the rest follows as a consequence of these assumptions.  Thus it is
    * e.g. Stratal Uniqueness law, the Oblique Law, the Final 1 Law in RG
    * cannot be rescinded except on pain of causing the whole analysis to collap

# 6 SYNTACTIC COUNTEREVIDENCE TO THE CATEGORY-CHANGING ANALYSIS 30

* counterevidence to the proposal that relationchanging rules do not involve any
  movement or change in the grammatical status of the noun phrases of a
  * quite familiar from TG and RG. As I think
  * it is premature to adopt any specific way of dealing with this counterevid
  * I will only briefly review them and sketch proposed solutions that I know of
* "dummy NPs" that have apparently been raised or passivized, e.g. _there_ in
  * _John believes there to be a unicorn in the garden_
  * _There appears to be a unicorn in the garden_
  * _There is believed to be a unicorn in the garden_ etc. One kind of
* solution to the problem presented by
  * "dummy NPs", given in Thomason (ms), is
    * "long distance" syntactic operations such as are used in Montague's
      treatment of relative clauses and wide-scope quantification. Thus Thomason
      produces
    * _There is certain to be a man here_
    * man + [be certain to be `*there` here]
    * `*there i`s a special "non-surfacing" abstract NP that is replaced with a
  * by Lauri Karttunen as the "ugly object" analysis. Here one
    * treats _there_ syntactically as a NP like any other and assigns it a denot
    * denotation is an abstract and unique semantical object (the "U gly
      object")
    * A particularly clever version of an "ugly object" analysis is given by Sag
      (this volume), taking advantage of the strict type stratification imposed
      by Montague to effect the semantic coherence/incoherence of the
      interpretations
  * by Gazdar in unpublished work
    * also given a denotation which has (virtually) no effect on the meaning,
    * the filtering of inappropriate sentences with _there_ is handled by
      syntactic features rather as verb agreement is treated, and not by
      "semantic filtering
  * See Cooper (ms., 1979) for yet another kind of solution
* cases where RG makes reference to the underlying grammatical status of a NP,
  rather than its "derived" status, to describe some other grammatical facts
  * Perlmutter (this volume) certain cases of control of reflexivization by an
    NP in Russian depend on whether that NP was an underlying subject (init 1)
  * in my anal, the class of "chomeurs" of RG would be divided up into several
    distinct kinds of grammatical relations
* in Icelandic (Andrews, this volume), the case-marking on "Raised" NPs may be
  one of several cases but seems to depend systematically on the "underlying"
  grammatical role of the NP
* a striking asymmetry in the data that argues for/against the categ chang methd
  * the pro evidence appears in all (or most, in the case of lexical government)
    of the sentences of the language in which a relation-changing rule has
    applied
  * the evidence against it appears in relatively few sentences
    (at least in English-like languages)
  * This asymmetry is all the more striking from language acquisition
    * Sentences with raised or passivized dummy NPs are relatively rare
      * confined primarily to learned discourse, hence
      * children learning their native language would be exposed to thes late,
      * a child should in any case acquire a non-movement analysis long before
        the data supporting a movement analysis is encountered

# 7 ERGATIVE LANGUAGES

* Following Dixon (1979), we may say that a language has ergative
  characteristics to the extent that the "notional [English]
  * object" of a transitive verb is treated syntactically in the same way as the
    subject of an intransitive IV, while the "notional
  * subject" of a transitive verb is treated differently
* (The most frequent manifestation of ergativity is case marking
  * the case marking of the notional object of a TV is the same as the subject
    of an IV, in which instance this marking is known as absolutive case,
  * the case marking of the notional subject of a TV is called the ergative
  * The terms nominative and accusative are then reserved for the more familiar
* divide my discussion among three (idealized) types of ergative languages:
  * deep ergative languages
    * not only case marking but also all other syntactic properties that
      distinguish subjects from objects follow an ergative pattern
    * endnote 14: there are those who are skeptical of Dixon's claim that there
      are "deep ergative" languages
      * nothing in the general account of grammatical relations presented in
        this paper hinges on the existence of "deep ergative" languages
  * surface ergative languages (in which relatively few erg characteristics)
  * split ergative languages
    * ergative patterning consistently in some tenses but never in others
* I have not even mentioned semantic notions like "agent" and "patient" in my
  * in a referential theory of semantics and compositional principles
  * it suffices to identify, e.g., a transitive verb's meaning with a relation
  * it is only in the domain of lexical semantics that notions like agentivity
    * what enable one to determine whether an arbitrary pair is a member thereof
    * Dowty (1979) for extensive discussion of lexical semantics)
* for any relation R denoted by a transitive verb, a verb denoting the converse
  of R (denoted R^-1) would indicate the same "information" as the original verb
  * any English-like language is unlikely to have such a verb, and I believe
  * languages seem to follow a set of systematic principles that determine, for
    any relation R, which of R and R^-1 is denoted by a verb. These principles
    * If x causes something to happen to y, R is "lexicalized", not R^-1 (cf
    * If x is a sentient being that perceives something about y or has an
      emotion or attitude toward y, R is lexicalized not R^-1 (see, hear, love)
    * If x is moving and y is stationary, R is lexicalized, not R^-1
      (enter, overtake, pierce, collide with)
    * perhaps others are necessary as well, and perhaps a different formulation
* it would be a mistake conflate all three into a single definition of "agency",
* there is a class of verbs for which principles (i) and (ii) are conflicting
  * it is in this class and only in this class that one finds both a relation
    and its converse lexicalized
  * "psychological" verbs
  * e.g. _seem, surprise, disappoint, frighten, anger, please,_ etc
  * x causing some emotion in y, y perceives an emotion toward x
* Here one finds
  * pairs of independent lexemes, one the converse of the other
    * I like it vs. It pleases me, German mögen vs. gefallen,
    * _I suppose it is true_ vs. _it seems true to me_), and
  * various constructions systematically related to their converses by
    operations other than the usual passive rules, e.g. the
    * "Psych Movement" in English (I am surprised at it, it surprise me),
    * "reflexive verbs" or "middle verbs" in other languages.  Here also
  * a verb may "reverse" its subject and object historically over time, as was
    * e.g. English think
* principles (i)--(iii) are essentially independent of the system of gramm rels
* "deep ergative" language 14 like Dyirbal (Dixon 1972, 1979)
  * conforms to the same universal principles of grammatical rels as non-erg
  * the converses of principles (i)-(iii) are employed in its lexical semantics
  * the absolutive/erg NPs are actually its grammatical subjects/obj
  * the relation-changing rules of Dyribal are on this view essentially the same
  * the so-called "antipassive" rule of Dyirbal is simply the Passive in (18)
    and its semantic interpretation is the same as is given in (18)
  * A complete Montague fragment of this kind for Dyirbal: Schmerling (1978),
* A "surface ergative language" i.e. less ergative characteristics than non-erg
  * a less elegant syntax than a consistently ergative or consistently non-erg
  * If for example the case marking of NPs is the only ergative characteristic
    * the syntactic operation of the subject-predicate rule
      sensitive to the form of the IV
    * if the IV consists of a TV plus object, the subject be marked with erg
    * if the IV is intransitive, the subject will be marked with absolutive
* when a language is analyzed as "deep ergative" but still has a few non-erg
  * the non-ergative characteristics will have to be treated in a way parallel
    to the ergative characteristics of a "surface ergative" language
  * e.g. Dyirbal is a fairly consistently ergative language, but
    the case marking on first and second person pronouns follows a nom/acc patt
  * the subject-predicate rule for Dyirbal will specify that
    * the subject is marked
      absolutive when it is not a first or second person pronoun,
      nominative when it is such a pronoun and the IV is intransitive, and
      accusative when the subject is such a pronoun and the IV is transitive
  * The verb-object operation marks the object ergative when it is not such a
    pronoun but nominative when it is
* the choice of whether to analyze a language as deep ergative or surface erg
  * in Eskimo, the ergative and non-ergative characteristics seem about equal
  * how the language treats coordination: when an intransitive IV is conjoined
    with a transitive IV, the NP which the transitive IV "shares" with the
    intransitive IV is the "notional subject" of the transitive verb in a
    non-ergative language but the "notional object" of the transitive IV in a
    deep ergative language
    * follows straightforwardly from Montague's treatment of IV -conjunction in
* split ergativity by tense where the ergative pattern appears consistently
  (i.e. as deep ergativity) in some tenses
  * I will sketch a theoretical option that presents itself in this approach
  * a number of languages follow an ergative pattern in past tense but a
    non-ergative pattern elsewhere (Dixon 1980)
  * (This method would only be helpful if the past tense ergativity is "deep",
    though I do not know if any such cases actually exist.)
  * Bach (ms.) points out (assigning the syntactic cat IV to the sem cat t/T)
  * treat tenses as functors that combine with verbs, rather than as operations
    on full sentences, yet still permit the semantics of tense to be treated
    adequately
  * tenses as always combining with a lexical verb
    (i.e. a verb that has not yet been combined with its objects, if any), it
  * the semantics of the tensing operation to
    * "reverse" the interpret of subject and object, in effect turning a
    * place the verbs in a new syntactic subcategory, which would trigger
      ergative/absolutive case marking

# 8 RELATION-CHANGING VERSUS VARIABLE-BINDING RULES

* division among syntactic rules traditionally treated as movement rules is
  between category-changing rules vs unbounded movement rules e.g. Relative Clau
* category-changing can describe apparent "movement" of an NP from only one
  syntactic position and to only one syntactic position; this
  * follows from
    * a general constraint in Montague's theory that each syntactic rule must
      have a unique interpretation, and from the fact that
    * these rules are operations on verbs
* rules like relativization that seem to extract NPs from various positions, a
  * like variable binding in logic: a noun phrase within the relative clause
    (perhaps an "empty" one) plays the semantic role of a variable in logic, and
    the semantic interpretation of the relative clause is that the variable
    within the clause is bound
  * not matter where the variable occurs within the clause, it may even be
    embedded in a subordinate clause within the relative clause
  * the hierarchy Subject/Direct Object/Indirect Object plays no role whatsoever
* relativization, across languages, seemed to be governed by this hierarchy
  * i.e. there are some languages in which only subjects may be relativized,
  * (Keenan and Comrie 1977)
  * our analysis thus offers no explanation at all for this observation
  * my speculation
    * languages that only allow relativization on subjects
      do not use variable binding at all in forming relative clauses but rather
      combine an IV i.e. a sentence lacking a subject with the head noun
      to form a relative clause;
      e.g. _man who walks_ <- _man_ plus the IV _walks_
    * A language which allows relativization on both subjects and objects (but
      no other positions) would then have a second relative clause: rule that
      forms a relative clause out of a TV phrase (along with another NP to serve
      as its subject), and so on
    * At some point a language would switch to a variable binding strategy in
      order to form all kinds of relative clauses by a single rule
    * i.e. two kinds of strategies for forming relative clauses
    * categorial rules and variable-binding processes
* e.g. variable-binding strategies for what in English are category-changing
  * a dialect of Shona studied by Kathryn Hodges of the University of Illinois
  * one can passivize not only the DO, the IO and objects of prepositions within
    the verb phrase, but even, in some circumstances, a NP from a lower clause
    within the VP. Thus in effect one might
  * _John believes that Mary loves that man_ ->
    _That man is believed by John that Mary loves (him)_. The only way I can
  * by a rule that "passivizes" an IV by binding a variable within the IV and
    interpreting the IV in such a way as to let the variable be identified with
    the eventual subject of the IV

# 9 THE ELUSIVE BOUNDARY BETWEEN ARGUMENTS AND MODIFIERS

* three cases where the roles of arguments/modifiers of a verb overlap
* benefactive NPs versus Indirect Objects
  * In a great many languages the case marking is the same
  * the most common three-place verbs in various languages
    e.g. give, sell, show, take, promise, award, offer, say
  * the indirect object in almost all cases names a person who also benefits,
  * some languages might conceivably get by without three-place relations but
    rather make do with only two-place verbs plus benefactive modifiers (of
    category IV/IV)
    * Perhaps such languages later change and distinguish between datives (arg)
      and mere benefactives, and thus
    * the earlier stage explains the converg of case marking between ben & dat
  * children, when they really understand three-place verbs, may have a grammar
    with only twoplace verbs plus benefactives, but
    * the concurrence between benefactive and indirect object case forms in
      their parents' speech allows them to understand roughly what is being said
* the genitive case, this convergence being one that occurs very widely in
  * nouns, rather than verbs
  * many nouns are inherently relational that is they denote two-place relations
    * e.g. father or a mother, or a friend
  * the genitive case serves to mark the second argument place of the noun;
  * _John's father_ denotes the individual that stands in the father relation
  * the genitive serves much the same role for relational nouns as the
    accusative case does for transitive verbs
  * genitive case can play another role as well, in all or almost all languages
    * a highly context-dependent modifier,
      indicating that there is some very salient relation
      that the genitive NP bears to the individual denoted by the head noun, but
    * _John's chair_ might mean the chair that John owns, the chair that John
      built, the chair that John is sitting in or standing near, and so on
      depending on the context in which it is used. Rich
  * Plato was aware of this double role that genitives play, for Plato is said
    * "That dog is John's dog; that dog is a mother, therefore, that dog is
      John's mother."
  * question whether in some languages, or at some stages of language acquisit
    * the genitive is interpreted as indicating a context-determined relation,
      rather than sometimes as denoting the argument of a relational noun
    * e.g. _mother_ might be analyzed as merely denoting a set, and the phrase
      _John's mother_ might be analyzed as denoting an individual that is a mother
      and stands in some important relation to John
* the agent phrase of a passive
  * in many languages there is no agentive passive, only an agentless passive,
  * children acquire agentless passives before agentive passives; these
  * the agentless passive is more basic
  * in a great many languages, the agent of a passive is marked by the inst
    * or a preposition that elsewhere expresses instrumentality
  * e.g. the history of English, not only with the preposition _by_ but also by
    the prepositions _from, with, through_, and the dative case alone,
    * all devices elsewhere used to express instrumentality (cf. Visser 1963)
  * I suggest that some languages with apparent full passives really have only
    agentless passives as category-changing rules and that the agent phrase in
    such a passive is really functioning as an instrumental
  * e.g. John was kissed by Mary might really be analyzed as saying that
    John was kissed (by someone or other) and that this came about by means of M
* problem of finding a criterion for determining whether a dative etc is an arg
  of a verb (or noun) or the role of a modifier
  * both kinds of roles are taken by these cases in languages at one time or ano
  * the number of grammatical roles played by noun phrases may greatly exceed
    the number of distinct morphological case forms employed by the language;
    * postulating two or more distinct rules which use the same case marking for
    * attempt in Montague's theory to determine "the meaning" of the dative, or
      genitive, or instrumental case
* this convergence may have its explanation in the stepwise nature of lang acqui
  * at an early stage, there are certain graspable relations
    e.g. "x is the agent of an event y", "x is the instrument of event y",
    "x is an object connected with y in some salient way" and that these
    * learning of relational verbs may come later than that of non-rel verbs
  * the case marking of the arguments of verbs and nouns corresponds with that
    for these graspable relations between events and participants, the child is
    able to understand roughly what the adult says
  * Later a more sophisticated grammar  having the same overt syntactic form,
    but a different semantics
* parallel to that lexical rules are first acquired as syntactic rules
  * lexically derived words need not be limited in meaning to exactly what a
    lexical rule predicts for them, but can range over a variety of more
  * a three-place relation can have a greater variety of meanings than can the
    combination of a two-place verb with a benefactive (instrumental, etc.)
  * evidence from language acquisition studie:s that children do at first use
    lexical rules as if they were syntactic rules
    * e.g. causative (Bowerman 1974) and noun compounding (Clark and Clark 1979)
* the choice of analyzing certain NPs as modifiers versus args in the rivalry of
  * case grammar analyses
    * relations like "agent", "experiencer", "goal", etc. are primitives of the
      semantic interpretation of a sentence, apart from the meaning of its verb
    * a kind of "modifier" analysis
  * Generative Semantics and other theories
    * the correspondings NPs have these semantic associations in virtue of the
      meaning of the verb of the sentence
* In the philosophy of language, this same question has arisen (with diff exmps)
  as the choice between treating adverbials as
  * predicates of events (Davidson's 1967 analysis of _with a knife_ as a pred)
  * additional argument places of verbs

# NOTES 42
