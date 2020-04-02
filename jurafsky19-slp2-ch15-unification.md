Jurafsky, Daniel and Martin, James H.
Speech and Language Processing (2Nd Edition)
2009

# 15 Features and Unification

* reductionist perspective 
  * [in] natural sciences over the last few
    * explain the behavior of larger structures 
      by the combined action of smaller primitives. In 
    * biology: inheritance ... explained by the action of genes, and then again
      * genes have been explained by the action of DNA. In 
    * physics, matter was reduced to atoms and then again to subatomic particles.
	* computational linguistics: grammatical categories and rules
    * e.g. VPto, Sthat, Non3sgAux, or 3sgNP, as well as S → NP VP that make use
    have complex sets of properties associated with them. The information in
    * represented by constraints, and so these kinds of models are 
    * often called constraint-based formalisms .  
* Why do we need a more fine-grained way of representing and placing constraints
  * phenomena such as agreement and subcategorization can lead to over-generatn
    * fine-grained information about number and person, agreement,
      subcategorization, as well as semantic categories like mass/count.  
  * proliferation of primitive grammatical categories such as Non3sgVPto,
  * explosion in the number of grammar rules and ... loss of generality 
* other advantages [of constraints-based formalisms] that we will not be coverd in
  * model more complex phenomena than context-free grammars, and the ability
  * compute semantics for syntactic representations.
* e.g. grammatical number.  
  * property called NUMBER that can have the value singular or plural, with
  * members of the NP and the VP category [can have] the value singular/plural 
  * operations, such as equality tests [paired] with our core grammar rules
    * i.e. constraints to help ensure [ grammaticality] 
* one computational implementation of a constraint-based formalism, based on
  feature structures and unification. The next section describes 
  
## 15.1 feature structures (FS) 2

* encode the kind of properties that we have in mind is through the use of
  * sets of feature-value pairs, where 
    * features are unanalyzable atomic symbols drawn from some finite set, and
    * values are either atomic symbols or feature structures themselves. Such
    * diagram, called an attribute-value matrix (AVM)
* e.g. number property discussed above. To capture this property, we will use
  * feature: the symbol NUMBER to designate this grammatical attribute, and the
  * values: symbols sg and pl (in English)
  * e.g. 3sgNP

```
[ CAT     NP
  NUMBER  sg
  PERSON  3rd ]
```

* The corresponding plural version of this structure would be captured as
  * use of feature structures allows us to both 
    preserve the core set of grammatical categories and o
    draw distinctions among members of a single category.
* features can also have other feature structures as their values. This is
  * bundle a set of feature-value pairs together for similar treatment. As an
  * e.g. NUMBER and PERSON features are often lumped together since grammatical
    subjects must agree with their predicates in both their number and person
  * AGREEMENT feature that takes a feature structure 
    consisting of the NUMBER and PERSON feature-value pairs as its value.

```
[ CAT       NP
  AGREEMENT [ NUMBER  sg
              PERSON  3rd ] ]
```

* test for the equality of the values for both the NUMBER and PERSON features
  of two constituents by testing for the equality of their AGREEMENT features.
* feature path: a sequence of features through a feature structure [to a] value
  e.g. `<AGREEMENT, NUMBER>` path leads to the value sg, 
* directed acyclic graph (DAG): alternative graphical way for feature structurs
  * suggestive of how they will be implemented. In these diagrams, feature
  * features appear as labeled edges and values as nodes.
* reentrant structures: 
  [there are] features that share some feature structure as a value. Such
  * not the simpl[y] have equal values, but rather that they share the same FS
  * in terms of paths through a graph:
    two feature paths actually lead to the same node in the structure.
  * Figure 15.2 illustrates a simple example of reentrancy. In this structure,
    `<HEAD SUBJECT AGREEMENT>` and `<HEAD AGREEMENT>` lead to the same location
  * denoted in our AVM diagrams by numerical indexes that signal the values to
  * notation of the PATR-II system (Shieber, 1986), based on Kay (1979):

## 15.2 unification operator that is used to implement basic operations 5

> FRIAR FRANCIS : If either of you know any inward impediment 
> why you should not be conjoined, charge you, on your souls, to utter it.  
																		 William Shakespeare, Much Ado About Nothing

> Ha bármelyikőtök tud olyan titkos akadályról, mely a házasság megkötése
> ellen szól: üdvösségetekre kérlek, el ne hallgassátok! (Mészöly Dezső ford.)

* wanted: reasonably efficient and powerful operations on [feature structures].
* two principal operations we need to perform are 
	* merging the information content of two structures and 
	* rejecting the merger of structures that are incompatible. Fortunately, a
* a single computational technique, called **unification**, suffices for both
* this section will illustrate through a series of examples how unification
* Discussion of the algorithm and its implementation will be deferred to 15.4.
* e.g. NUMBER sg ⊔ NUMBER sg = NUMBER sg 
* binary [partial] operation (represented here as ⊔) [on] feature structures
* e.g. NUMBER sg ⊔ NUMBER pl Fails!
* e.g. NUMBER sg ⊔ NUMBER [] = NUMBER sg 
  * [] value ... indicates that the value has been left unspecified.
* e.g.  NUMBER sg ⊔ PERSON 3rd = [NUMBER	sg
																	PERSON 	3rd ] 
  * union of all the information stored in each of the original structures.
  * compatible because they contain no features that are explicitly incompatible.
    The fact that they each contain a feature-value pair that the other does not
    is not a reason for the unification to fail.  
* unification of ... reentrant structures. The following example illustrates an
* copying capabilities of unification.
* difference between features that actually share values versus 
  those that merely have identical looking values.
  * `<SUBJECT AGREEMENT>` is not added to the value of the AGREEMENT feature.
* Finally, consider the following example of a failure to unify.
  * Proceeding through the features in order, we first find that the 
    * AGREEMENT features in these examples successfully match. However, when we
    * SUBJECT features, we find that the values found at the respective
      `<SUBJECT AGREEMENT NUMBER>` paths differ, causing a unification failure.
* representing partial information about some linguistic object or placing
  informational constraints on what the object can be. Unification can be seen
  as a way of merging the information in each feature structure, or describing
  objects which satisfy both sets of constraints. Intuitively, unifying two
  feature structures produces a new feature structure which is more specific
  (has more information) than, or is identical to, either of the input feature
* a less specific (more abstract) feature structure subsumes an equally or more
  specific one. Subsumption is represented by the **relation** ⊑. 
  A feature structure F subsumes a feature structure G (F ⊑ G) if and only if: 
  1. For every feature x in F, **x in G és** F(x) ⊑ G(x) (where F(x) means “the value of the
     feature x of feature structure F”).
  2. For all paths p and q in F such that F(p) = F(q), it is also the case that
     G(p) = G(q).
  * Vegyük észre, hogy az F-ben nem szereplő jegyekről nem mond semmit.
* Subsumption is a partial ordering; there are pairs of feature structures that
  neither subsume nor are subsumed by each other: 15.3 !⊑ 15.4, 15.4 !⊑ 15.3
* (Semi)lattice: 
  * példák (fél)hálóra
    * A természetes számok halmazán 
      * művelet: legnagyobb közös osztó (és legkisebb közös többszörös)
      * Részbenrendezés: oszthatóság.
    * Nemüres halmaz részhalmazai hálót alkotnak a 
      * művelet: halmazelméleti metszet (és unió)
      * Részbenrendezés: tartalmazás
    * Vigyázat, a könyv zavaros! A jegystruktúrák metszetfélhálót alkotnak, de
      az érdeke ,,művelet", az unifikáció, az uniónak felel meg, és csak
      parciálisművelet
  * every feature structure is subsumed by the empty structure [], the relation
  * F ⊔ G is defined as the most general feature structure H such that F ⊑ H
    and G ⊑ H
    * vagyis F <= I és G <= I implies H <= I
* unification operation is 
  * monotonic
  (Pereira and Shieber, 1984; Rounds and Kasper, 1986; Moshier, 1988). 
  a <= b implies a <= b U c
  * associative; given a finite set of feature structures to unify, we can
    check them in any order and get the same result.  
    (a bizonyítást végiggondoltam. Ha valakit érdekel, leírom.) 
* unification ~ integration of knowledge from different constraints. 
  * Given two compatible feature structures as input, it produces the most
    general feature structure which nonetheless contains all the information in
    the inputs. Given two incompatible feature structures, it fails.

## 15.3 grammatical formalism: integration of these structures 9

* elegantly express syntactic constraints that would be difficult to express
  * augmenting the rules of ordinary context-free grammars with attachments
    that specify feature structures for the constituents of the rules, along
  * unification operations that express constraints on those constituents. 
* From a grammatical point of view, these attachments will accomplish the follw
  * associate complex feature structures with both 
    lexical items and instances of grammatical categories
  * guide the composition of feature structures for larger constituents 
    based on the feature structures of their component parts
  * enforce compatibility constraints between specified parts of constructions

* notation ... based on the PATR-II system described in Shieber (1986):
* [two styles of constraints]
  1. the value found at the end of the given path must unify with the specified
  2. the values found at the end of the two given paths must be unifiable.

```
S → NP VP
<NP NUMBER> = <VP NUMBER>
```

* in cases where there are two or more constituents of the same category, 
  we will subscript the constituents to keep them straight, as in
* the simple generative nature of context-free rules has fundamentally changed
  * CF: simple concatenation; an NP followed by a VP is an S, or generatively,
  * now concatenation must be accompanied by a successful unification
  * computational complexity?, generative power? will be discussed in Ch. 15.
* The following sections present applications to four linguistic phenomena:
  agreement, grammatical heads, subcategorization, and long-distance dep

### 15.3.1 Agreement

* [in] This section, two main types of English agreement phenomena:
  subject-verb agreement and determiner-nominal agreement. We will use the

(15.8)  This flight serves breakfast.
(15.9)  Does this flight serve breakfast?
(15.10) Do these flights serve breakfast?

[involves] PERSON: make use of the AGREEMENT feature

S → NP VP
`<NP AGREEMENT> = <VP AGREEMENT>`

* yes-no-questions, the subject NP must agree with the auxiliary verb, rather
  * main verb appears in a non-finite form. This agreement constraint can be

S → Aux NP VP
`<Aux AGREEMENT> = <NP AGREEMENT>`

* Agreement between determiners and nominals in noun phrases is handled in a
  * NUMBER feature. Again, 
  * the logical place to enforce this constraint is in the grammar rule that
    brings the parts together.

NP → Det Nominal
`<Det AGREEMENT>  = <Nominal AGREEMENT>`
`<NP AGREEMENT>   = <Nominal AGREEMENT>`
* minek ide PERSON?

* how the various constituents that take part in these constraints (the Aux,
  VP, NP, Det, and Nominal) acquire values for their various agreement features
* constraints involve both lexical and non-lexical constituents. The simpler
  * lexical constituents, Aux and Det, receive [feature] values from the lex

Aux → do
`<Aux AGREEMENT NUMBER> = pl`
`<Aux AGREEMENT PERSON> = 3rd`

Aux → does
`<Aux AGREEMENT NUMBER> = sg`
`<Aux AGREEMENT PERSON> = 3rd504`

Det → this
`<Det AGREEMENT NUMBER> = sg`

Det → these
`<Det AGREEMENT NUMBER> = pl`

Returning to our first S rule, let us first consider the AGREEMENT for the VP

Verb → serve
`<Verb AGREEMENT NUMBER> = pl`

Verb → serves
`<Verb AGREEMENT NUMBER> = sg`
`<Verb AGREEMENT PERSON> = 3rd`

VP → Verb NP
`<VP AGREEMENT> = <Verb AGREEMENT>`

The same technique works for the remaining NP and Nominal categories. The

Noun → flight
`<Noun AGREEMENT NUMBER> = sg`

Noun → flights
`<Noun AGREEMENT NUMBER> = pl`

Nominal → Noun
`<Nominal AGREEMENT> = <Noun AGREEMENT>`

* Note that this section has only scratched the surface of the English agreemnt
  * other languages can be considerably more complex than English

### 15.3.2 Head Features

* preceding section: copying feature structures from children to their parents.
* a much more general phenomenon in constraint-based grammars.  Specifically,
* the features for most grammatical categories are copied from one of the
  children to the parent. The 
  * child that provides the features is called the head of the phrase and the
    features copied are referred to as head features.  
* heads, first introduced in Sec. 12.4.4, plays an important role in

VP → Verb NP
`<VP AGREEMENT> = <Verb AGREEMENT>`

NP → Det Nominal
`<Det AGREEMENT> = <Nominal AGREEMENT>`
`<NP AGREEMENT> = <Nominal AGREEMENT>`

Nominal → Noun
`<Nominal AGREEMENT> = <Noun AGREEMENT>`

* verb is the head of the verb phrase, the nominal is the head of the NP
* We can rewrite our rules to reflect these generalizations by 
  placing the agreement feature structure under a HEAD feature and then 
  copying that feature upward as in the following constraints.  (15.11)

VP → Verb NP
`<VP HEAD> = <Verb HEAD>`

NP → Det Nominal
`<NP HEAD> = <Nominal HEAD>`
`<Det HEAD AGREEMENT> = <Nominal HEAD AGREEMENT>`

utóbbi minek?

Nominal → Noun
`<Nominal HEAD> = <Noun HEAD>`

* Similarly, the lexical entries that introduce these features must now reflect

Noun → flights
`<Noun HEAD AGREEMENT NUMBER> = pl`

Verb → serves
`<Verb HEAD AGREEMENT NUMBER> = sg`
`<Verb HEAD AGREEMENT PERSON> = 3rd`

### 15.3.3 Subcategorization

* verbs can be picky about the patterns of arguments they will allow 
* In Ch. 12, [we] split the category of verb into multiple sub-categories.
* categories were then used in the definition of the specific verb phrases that

VP → Verb-with-S-comp S
Verb-with-S-comp → think

* undesirable proliferation of categories that we saw with the similar approach
* introduce feature structures to distinguish among the various verbs
* atomic feature called SUBCAT, with an appropriate value, with each of the
* e.g. transitive version of _serves_ could be assigned the following FS in lex

Verb → serves
`<Verb HEAD AGREEMENT NUMBER> = sg`
`<Verb HEAD SUBCAT> = trans`

* corresponding constraints to all the verb phrase rules in the grammar, as in

VP → Verb
`<VP HEAD> = <Verb HEAD>`
`<VP HEAD SUBCAT> = intrans`

VP → Verb NP
`<VP HEAD> = <Verb HEAD>`
`<VP HEAD SUBCAT> = trans`

VP → Verb NP NP
`<VP HEAD> = <Verb HEAD>`
`<VP HEAD SUBCAT> = ditrans`

* requires unique symbols for each of the 50–100 verb phrase frames in English.
  * unanalyzable SUBCAT symbols do not directly encode either the 
    number or type of the arguments that the verb expects to take. To see this,
* you must use ... a pointer to those verb phrase rules in the grammar that can
  accept the verb in question.
* A more elegant solution: directly specify the order and category type of args

Verb → serves
`<Verb HEAD AGREEMENT NUMBER> = sg`
`<Verb HEAD SUBCAT FIRST CAT> = NP`
`<Verb HEAD SUBCAT SECOND> = end`

* the value of the SECOND feature indicates that this verb expects only one arg
* _leave Boston in the morning_, with two arguments, would have the following

Verb → leaves
`<Verb HEAD AGREEMENT NUMBER> = sg`
`<Verb HEAD SUBCAT FIRST CAT> = NP`
`<Verb HEAD SUBCAT SECOND CAT> = PP`
`<Verb HEAD SUBCAT THIRD> = end`

* encoding a list [with] types defined in Sec. 15.6 to define a list type more

VP → Verb NP5


Features and Unification
`<VP HEAD> = <Verb HEAD>`
`<VP HEAD SUBCAT FIRST CAT> = <NP CAT>`
`<VP HEAD SUBCAT SECOND> = end`

* complex subcategorization frames, (e.g., NP PP, NP NP, or NP S) and these
  frames can be composed of many different phrasal types. In order to come up
* Fig. 15.3.3 shows one short list of possible phrase types for making up
  * from ... the FrameNet project (Johnson, 1999; Baker+ 1998), and includes
  * special subjects like _there_ and _it,_ as well as for objects and comps

* e.g. VPto, which is subcategorized for by _want_ might be expressed as:

Verb → want
`<Verb HEAD SUBCAT FIRST CAT> = VP`
`<Verb HEAD SUBCAT FIRST FORM> = infinitive`

* e.g. the two-complement want. We can use this example to demonstrate 
  * two different notational possibilities. First, 
  * lists can be represented via an angle brackets notation h and i. Second,
  * represent the lexical entry as a single ORTH feature 
* very large set of possible subcategorization frames. Furthermore, 
  * each verb allows many different subcategorization frames. Fig. 15.4
* comprehensive subcategorization-frame tagsets exist, such as the 
  * COMLEX set (Macleod+ 1998), which includes subcategorization frames for
    verbs, adjectives, and nouns, and the 
  * ACQUILEX tagset of verb subcategorization frames (Sanfilippo, 1993). Many
  * other information about the complements, such as specifying the 
    identity of the implicit subject in a lower verb phrase, i.e. control
    e.g. _Temmy promised Ruth to go_ vs _Temmy persuaded Ruth to go_
* [info about the] subcategorization frames for a verb can be partially
  predicted by the semantics of the verb; for example many 
  * e.g. verbs of transfer (like _give, send, carry_) predictably take the 
    two subcategorization frames NP NP and NP PP:
    * NP NP sent FAA Administrator James Busey a letter
    * NP PP sent a letter to the chairman of the Armed Services Committee
* relationships between subcategorization frames across classes of verbs are
  called argument-structure alternations, and 
  * will be discussed in Ch. 19 when we discuss the semantics of verbal
  * Ch. 14 will introduce probabilities [of] the different subcategorization
    frames [of each verb]
  
## 15.4 unification algorithm and its required data structures 19

## 15.5 parser: feature structures and the unification operator integrated

## 15.6 types and inheritance, and other extensions to constraint-based formlsm
