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
  * RG and APG developed by (Perlmutter and Postal 1977, Johnson and Postal
    x, Perlmutter and Postal to appear, Perlmutter this volume, Postal this vol)
* Chomsky's original definition of grammatical relations (Chomsky 1965), which
  * stated in terms of linear order and domination by the nodes S and VP, seems
  * inadequate for languages in which the order of constituents is different
    * VSO languages like Breton or Welsh in which there can be no VP node, and
    * most inappropriate of all for free word-order languages
* grammatical relations have consistent properties across all these languages
  * rules like Passive, Dative Shift and the Raising rules
    behave in the same way in most languages
    with respect to their effect on these grammatical relations, though
    the word orders that result from these processes are quite different
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
    * need for a universal definition of
      grammatical relations and relation changing rules, and it is
      these two fundamental ideas that I would like to account for in Montague G

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
    * not limited to simple concatenation as are phrase structure grammars -
      but may rearrange or add morphological marking to these phrases
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
  S_2: <F_2, <TV, T>, IV>  (Verb-Direct Object Rule)
```

* it is merely how the operations F 1 and F 2 are defined that the langs differ
  * In English, an SVO language, the operations F 1 and F 2
    concatenate expressions and perform the number agreement and case marking:
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
    * we might regard a grammar for at least certain parts as producing
      an unordered set of words as a sentence
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
  * tectogrammatical structure of a sentence is
    what would be represented by a Montague Grammar analysis tree,
    minus the specification of the expressions at the non-terminal nodes
    * would be more invariant across languages than phenogrammatical structure
  * phenogrammatical structure of the sentence is
    the way the English operations fill in these non-terminal nodes
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
      * The operation `F_3` would produce [IV a [pp [`b` to] b']],
        where b' is the accusative form of b
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
  * characterize them in terms of the universal grammatical relations
    i.e. in terms of tecto grammatical structure alone
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
    * In this case also the TV is converted to an IV, but here
      the verb is marked with passive morphology; the rule is given and
      * semantic operation: "the set of all y such that for some x, x stands in"
    * An alternative way that languages have of performing this kind of redu is
      by an impersonal construction
      * a rule which leaves the verb as a transitive verb but
        interprets the verb in much the same way as before the object of the
        derived verb is still interpreted as the object of the original verb
        would have been, but
        the subject now makes a "vacuous" contribution to the meaning
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
  * _Mary gives John a book_ will be produced as the analysis tree in (24) shows,
* Raising to Object Position. This rule, given in (27), will take as
  * input a verb subcategorized for a sentential object, e.g. _believe_
  * IV/t -> TV/IV

## 4.3. Relation Expanding Rules 17

* like the cases of modifier rules I discussed earlier, which effectively
  map an n-place relation into a n + 1-place relation. The difference here is
* the "added" noun phrase is represented in the syntax as a subject or an object
* e.g. the causative rule, in which the
  new noun phrase, the agent of the causation, appears as the subject of the new
  verb. The syntactic rule for making a transitive causative: verb from an
* Semantic Operation: \l y \l x \exists P P(x) CAUSE a'(y)
* Other languages also have a causative rule for turning a
  * transitive verb into a ditransitive causative verb this is S12 in (33) and
  * ditransitive verb into a four-place causative (cf. Dowty 1979).
* There is a construction in a number of Bantu languages in which
  a noun phrase with locative, benefactive, or instrumental meaning
  appears in the syntactic position of the direct object and
  behaves, with respect to other syntactic rules, as if it were a direct object;
  * a case of a relation-expanding rule in which the added NP appears as the DO
  * adds a suffix to the verb stem (called an applied affix by Bantuists), e.g.
    the suffix _-r-_ in Chichewa.

# 5 ARGUMENTS FOR THIS TREATMENT OF GRAMMATICAL RELS AND REL CHANGING RULES 19

* why this approach might be preferable to either the TG or RG accounts of the
* §5.1 and §5.2 provide reasons for preferring the definitions of gramm rels,
  the remaining arguments pertain to relation-changing rules.

## 5.1. Universal Tendencies in Word Order 19

* Greenberg's (1963) ground breaking work on word order, linguists have tried to
* a VO/OV language is one in which functors tend to be ordered to the left/right
  of their arguments, while an OV language is one in which functors tend to come
  * The attempt to account for these word order universals in terms of functor
    and argument relations is of course not new (cf. Vennemann 1973), but what
  * Montague's semantic framework explicates which constituent is "functor" and
    * such independent justification is of course necessary if alleged
      explanations of word order have any true explanatory power.

## 5.2. Discontinuous Constituents

* superior to the PS grammar-plus-transformational component theory; this
* arises from the use of operations like Right Wrap in the structure building
* Anderson and Chung (1977): in Breton, there is no evidence that the VSO word
  order arises either from an underlying SVO order or an underlying VOS order.
* from the point of view of several syntactic rules, the combination of verb and
  object seems to behave as a constituent that is, like a VP constituent in
* paradoxical under the transformational theory, since if VSO were the
  underlying word order, there could be no such underlying constituent.
  But in the analysis I suggested for Breton, Verb and Object do form a
* here: a constituent in the tecto grammatical sense, not (in Breton) in pheno

## 5.3. "Structure-Preserving" Rules

* relation-changing rules are rules applying to verbs or VPs, not to sentences.
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
  * e.g. the passive morphology, the _applied suffixes_ in Bantu,
    causative affixes and the Dative Shift Affix in Bahasa Indonesian. 10
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
    ations are lexical rules. According to this proposal,
* lexical rules are in general exactly the same as that of true syntactic rules,
  * difference being in the status of the outputs of the rule in the grammar:
    * syntactic rules, the outputs are all grammatically derived expressions of
    * lexical rules, the outputs are: merely possible derived lexical items of
      * meanings: some conform exactly to that produced by the lexical rule,
        other words do not
* It also follows, that a putative syntactic rule can be treated as a lexical
  rule instead only if the expressions to which the rule applies are finite in
  * this will be the case for Dative Shift and some of the other rel chang rules
    as I have formulated them because they in effect apply only to single verbs,
    * unlike under the TG or RG accounts, because the rules in these frameworks
      apply to an infinite number of sentences, not to a finite list of verbs.
* it would not be possible to reanalyze rules such as Relative Clause Formation
  (in English, at least) as category-changing rules applying to a finite number
* Bresnan has recently proposed a view of a grammar in which rules such as
  * important difference in the claims she and I are making:
  * she regards all function-dependent rules as lexical rules in principle, I am
  * Bresnan would consider the English passive rule to be a lexical rule, but I
    do not. Under the present framework,
  * two sets of arguments can be given for treating Passive as a syntactic rule.
    * there are cases in which the TV expression that undergoes Passive is a
      syntactically derived phrase instead.
      * e.g. all of the italicized phrases in (36) are synt complex TV phrases
      * the basic verb occurring within them would be put in some other category
    * Bach (this volume) has argued: 
      under the assumptions of the approach taken by this paper,
      purpose clauses such as _to deliver groceries in_ in (37) must be analyzed
      as modifiers of transitive verbs, not as modifiers of verb phrases.
      * the TV expressions that are passivized in (39) must be _buy for Bill to
        deliver groceries in_ and _bring in for us to talk to_ respectively;
      * syntactically complex expressions which have a potentially infinite
        variety offorms, so the Passive rule I have given cannot apply to them
* The view of category changing rules as potentially either lexical or syntactic
  * we can recognize a single language-universal characterization of these
  * they can be lexical rules in some languages and syntactic rules in others.
    (Causative, for example, is clearly a lexical rule in English, but I
    consider it a syntactic rule in Turkish). Since the rules have the same form
    in either case, it also makes it plausible that
  * a language might have one of these rules as a lexical rule at one historical
    stage of its development and easily reanalyze it as a syntactic rule at a
    later stage (or vice versa) without any significant change in the form or
  * in the course of language acquisition, children may temporarily acquire as a
    syntactic rule a rule that is lexical in their parents' speech, since no
    change in the form of the rule need be postulated when the child later
    reanalyzes the rule as a lexical rule and starts memorizing its outputs
    individually
    * there is some evidence that English-speaking children use the causative
      as a freely productive syntactic rule at some stage (Bowerman 1974),

## 5.7 Object-Controlled vs. Subject-Controlled Verbal Complements 25

* Bach (1980): under the category-changing analysis of rules like Passive, we
  can take advantage of the possibility of the novel way of treating
  discontinuous constituents I mentioned earlier to systematically
  exclude on syntactic grounds what had been thought to be lexical exceptions to
  the passive rule. Excluding such apparent exceptions syntactically is of
  * we want maintain the claim that Passive is a syntactic rule and that
* Bach suggests that it is a systematic principle that
  when an infinitive complement of a verb is syntactically controlled by a NP
  outside the infinitive
  i.e. when this NP triggers reflexive agreement or number agreement within the
  infinitive, and when this NP is involved in semantic entailments with respect
  to the infinitive,
  then this NP must be the next higher argument of the verb after the
  infinitive
* e.g. _persuade_ vs _promise_. In the sentence
  * Mary persuaded John to wash himself, the infinitive is controlled by the NP
    John, and it is this NP that will trigger reflexivization in the infinitive.
    Also John is the "understood subject" of wash himself. Given Bach's
  * with _promise_, the NP that controls reflexivization and is semantically
    interpreted as the understood subject of the infinitive is the matrix
    subject NP Mary, not the object NP John. Thus the proper
    * syntactic analysis for promise should be that illustrated in (41), in
      * the object NP is the argument added before the infinitive, so that the
        next NP to be added after the infinitive is the subject NP. Thus
  * persuade should be put in the same syntactic category TV/IV, while
    promise is put in the category (IV /IV)/T a verb that combines with a term
  * different tectogrammatical structures, in spite of the fact that their
    phenogrammatical forms would appear to be parallel.  (41) [Mary promises
* Bach's principle does not follow from the assumptions I have developed up 
  * it does slightly simplify the syntactic treatment of reflexivization and
    other agreement within infinitive complements, without resorting to an Equi
    analysis of infinitives}. But the interesting thing about Bach's principle
  * it predicts that verbs like promise can never undergo passive. This is so
    * no phrase of the category TV is ever produced, yet the category TV is the
* This correlation between subject control and lack of passives if of course
  well-known (Visser and other traditional grammarians have noted it), but I
  * nothing in any transformational theory that connects the lack of passives
    with subject control.

## 5.8 The Interaction of Causativization with Other Rules 27

## 5.9 "Wanna" Contraction 29

## 5.10 Theoretical Simplicity

# 6 SYNTACTIC COUNTEREVIDENCE TO THE CATEGORY-CHANGING ANALYSIS 30

# 7 ERGATIVE LANGUAGES

# 8 RELATION-CHANGING VERSUS VARIABLE-BINDING RULES

# 9 THE ELUSIVE BOUNDARY BETWEEN ARGUMENTS AND MODIFIERS

# NOTES 42
