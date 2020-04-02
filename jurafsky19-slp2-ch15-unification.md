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
    * physics, matter was reduced to atoms and then again to subatomic particls
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
* other advantages [of constraints-based formalisms] that we will not be coverd 
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
  1. For every feature x in F, **x in G és** F(x) ⊑ G(x) (where F(x) means “the
     value of the feature x of feature structure F”).
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
  * lists can be represented via an angle brackets notation < and >. Second,
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

#### Subcategorization in Other Parts of Speech

* subcategorization, or valence ... originally conceived for verbs, more recent
  * e.g. _Keep your seatbelt fastened while/during we are taking off/takeoff_
* adjectives and nouns also have subcategorization frames. Here are some
  * adjectives apparent, aware, and unimportant; nouns assumption and question:
    * _It was apparent [ `Sfin` that the kitchen was the only room. . . ]_
    * _It was apparent [ PP from the way she rested her hand over his]_
    * _aware [ `Sfin` he may have caused offense]_
    * _it is unimportant [ `Swheth` whether only a little bit is accepted]_
    * _the assumption [ `Sfin` that wasteful methods have been employed]_
    * _the question [ `Swheth` whether the authorities might have decided]_
    * See Macleod+ (1998) and Johnson (1999) for descriptions
* Verbs [ subcategorize for] their subjects as well as their complements. For
  * e.g. _seem_ can take an `Sfin` as its subject

### 15.3.4 Long-Distance Dependencies

* The model of subcategorization we have developed so far has two components. 
  * head word has a SUBCAT feature which contains a list of the complements
  * phrasal rules like the VP rule in (15.15) match up each expected complement
    in the SUBCAT list with an actual constituent. This mechanism works fine
* but e.g. wh-non-subject-questions
  * _What cities does Continental service?_
  * _What flights do you have from Boston to Baltimore?_
  * _What time does that flight leave Atlanta?_

S → Wh-NP Aux NP VP

* Now ... require the 
  * Aux and the NP to agree (since the NP is the subject).  But we also need
  * Wh-NP should fill some subcategorization slot in the VP. The representation
* Which flight do you want me to have the travel agent book?
  Melyik **járatra** akarod hogy **foglaltassak** az utazási ügynökkel?
* Many solutions in unification grammars involve keeping a gap list,
  * a feature GAP , which is passed up from phrase to phrase in the parse tree.
  * filler e.g. _which flight_ above) is put on the gap list, and must
    eventually be unified with the subcategorization frame of some verb.  
  * See Sag and Wasow (1999) for an explanation of such a strategy, together
    * many other complications that must be modeled in long-distance deps

## 15.4 Implementing unification algorithm and its required data structures 19

* unification operator takes two feature structures as input and 
  returns a single merged feature structure if successful, or a failure signal
* feature structures are represented as directed acyclic graphs (DAGs), where
  features are depicted as labels on directed edges, and 
  feature values are either atomic symbols or DAGs.  As we will see, the
* implementation [is] recursive graph matching algorithm, suitably tailored to
  * loops through the features in one input and 
    attempts to find a corresponding feature in the other. If all of the
  * recursion is [needed for] features that have feature structures as value
* rather than constructing a new feature structure with the unified information
  * destructively alters the arguments so that 
    in the end they point to exactly the same information. Thus, the result of

### 15.4.1 Unification Data Structures

* destructive nature of this algorithm necessitates [ extensions to the ] DAGs
* additional edges, or fields. Specifically, 
  * each feature structure = two fields: a content field and a pointer field.
    * content field may be null or contain an ordinary feature structure.
    * pointer field may be null or contain a pointer to another feature struct
  * If the pointer field of the DAG is null, then the content field of the DAG
    contains the actual feature structure to be processed.  If, on the other
    * [else] the destination of the pointer represents the actual FS

To see how this works, let’s consider the extended DAG representation for the
following familiar feature structure.

NUMBER sg ⊔ PERSON 3rd = [  NUMBER sg 
                            PERSON 3rd ]

* unification is accomplished by ... changing some of the pointers from one
  structure to the other so that in the end they contain the same content. In
  * adding a PERSON feature to the first argument, and assigning it a value by
    filling its POINTER field with a pointer to the appropriate location in the
    second argument, as shown in Figure 15.7.
* two arguments [must be] completely unified at the top level, 
  future unifications involving one of the arguments 
* set the POINTER field of the second argument to point at the first one. When
  this is done any future change to either argument will be immediately
  reflected in both. The result of this final change is shown in Figure 15.8.
* 15.8-as ábrán rajta felejtették az alsó FS null pointerét

### 15.4.2 The Unification Algorithm

* pointer following process, often referred to as dereferencing.
* As with all recursive algorithms, the next step is to test for the various
  base cases of the recursion before proceeding on to a recursive call
  1. The arguments are identical 
    * the pointer of the first is set to the second and the second is returned.
    * [reason for] pointer change: two arguments to be identical 
  2. One or both of the arguments has a null value 
    * the pointer field for the null argument is changed to point to the
      other argument, which is then returned. The result is that both 
  3. The arguments are non-null and non-identical 
    * two possibilities: they are 
      * non-identical atomic values: incompatible, failure
      * non-identical complex structures: recursive call is needed to ensure
        * key to the recursion is a loop over all the features of f2. This loop

## 15.5 Parsing with unification constraints

* order-independent nature of unification allows us to largely ignore the
  actual search strategy used in the parser. Once we have 
* associate unification constraints with the context-free rules of the grammar,
  and feature structures with the states of the search, 
  any of the standard search algorithms described in Ch. 13 can be used.
* a fairly large range of possible implementation strategies. We could, for
  * simply parse as we did before using the context-free components of the
    rules, and then build the feature structures for the resulting trees 
    * filtering out those parses that contain unification failures.  Although
  * use the power of unification to reduce the size of the search space 
    * integrating unification constraints directly into the Earley parsing
    * ill-formed structures to be eliminated as soon as they are proposed. As
    * only minimal changes to the basic Earley algorithm.  We 
  * then ... briefly consider an approach that moves even further from CF

### 13.4.2 The Earley Algorithm

* In contrast with the bottom-up search implemented by the CKY algorithm, the
* Earley algorithm (Earley, 1970) uses dynamic programming [and] top-down searc
* core of the Earley algorithm is a single left-to-right pass that 
* fills a chart i.e. array that has N + 1 entries. 
  * For each word position in the sentence, the chart contains a 
    list of states representing the partial parse trees 
    indexes represent the locations between the words in an input 
  * Each possible subtree is represented only once and 
    can thus be shared by all the parses that need it.
* individual states [in] each chart entry contain three kinds of information:
  * a subtree corresponding to a single grammar rule, 
    information about the progress made in completing this subtree, and the
    position of the subtree with respect to the input. We’ll use a 
* • within the right-hand side of a state’s grammar rule to indicate the
  progress made in recognizing it. Structure is called a dotted rule A state’s

_0 Book 1 that 2 flight 3_

```
S → • VP, [0, 0] 
NP → Det • Nominal, [1, 2] 
VP → V NP • , [0, 3]
```

1. represents a top-down prediction for this particular kind of S. The first 0
2. created at a later stage in the processing of this sentence, indicates that
3. with its dot to the right of all its two constituents, represents the
   successful discovery of a tree corresponding to a VP that spans the entire
* The basic operation of an Earley parser is to march through the N + 1 sets of
  * At each step, one of the three operators described below is applied to each
  * this results in the addition of new states to the end of either the current
    or the next set of states in the chart
* states are never removed and the algorithm 
  never backtracks to a previous chart entry once it has moved on. The presence

#### Predictor

* representing top-down expectations generated during the parsing process.  P
* applied to any state that has a non-terminal immediately to the right of *
* new states are placed into the same chart entry as the generating state. 
* They begin and end at the point in the input where the generating state ends.

#### Scanner

* When a state has a part-of-speech category to the right of the dot, S CANNER
* examine the input and incorporate a state corresponding to the prediction of
* when the state VP → • Verb NP, [0, 0] is processed, SCANNER consults the
  * results in the creation of the new state Verb → book • , [0, 1]. This 
* new state is then added to the following chart entry 

#### Completer

* COMPLETER is applied to a state when its dot has reached the right end 
* parser has successfully discovered a particular grammatical category over
* advance, all previously created states that were looking for this grammatical
  category at this position in the input. 
* New states are then created by copying the older state, advancing the dot
* new state in the current chart entry.
* when the state NP → Det Nominal • , [1, 3] is processed, 
  COMPLETER looks for incomplete states ending at 1 and expecting an NP. It
  * finds the states `VP → Verb • NP, [0, 1]` and `VP → Verb • NP PP, [0, 1]`.
  * new complete state VP → Verb NP • , [0, 3], and the new 
    incomplete state VP → Verb NP • PP, [0, 3] to the chart.

#### Retrieving Parse Trees from a Chart

* the representation of each state must be augmented with ... information about
  the completed states that generated its constituents.
* can be gathered by making a simple change to the COMPLETER function. 
  * Recall that COMPLETER creates new states by advancing existing incomplete
    states when the constituent following the dot has been discovered 
  * add a pointer to the older state onto a list of constituent-states for the
    new state.  Retrieving a parse tree from the chart is then merely a matter

### 15.5.1 Integrating Unification into an Earley Parser 26

* two goals in integrating feature structures and unification into the Earley
  * richer representation for the constituents of the parse, and to 
  * block entry into the chart of ill-formed constituents that violate unif 
* original Earley scheme given on page 448 (i.e. 475)

S → NP VP
`<NP HEAD AGREEMENT> = <VP HEAD AGREEMENT>`
`<S HEAD> = <VP HEAD>`

* Converting these constraints into a feature structure 
  * first creating top-level features for each of the parts of the context-free
    rule, S , NP , and VP in this case. We 
  * then add further components by following the path equations in the constrns
* feature structure can be passed directly to our unification algorithm.  
* states used to represent partial parses in the Earley chart. The 
  * original states contain fields for the context-free rule being used, the
    position of the dot representing how much of the rule has been completed,
    the positions of the beginning and end of the state, and a list of other
    states that represent the completed sub-parts of the state. To this set of
  * add an additional field to contain the DAG representing the feature
    structure corresponding to the state
    * PREDICTOR: DAG will simply [be] retrieved from the rule.
      For example, when PREDICTOR uses the above S rule to enter a state into
      * the feature structure given above.  
* altering the algorithm itself. 
  The most important: 
  when COMPLETER creates a new state by the extension of a state, which takes 
  i.e. when a completed constituent has been added to the chart. Its 
  * task is to attempt to find, and extend, existing states in the chart that
    are looking for constituents that are compatible with the newly completed
* To be more specific, C OMPLETER adds a new state into the chart by 
  * finding an existing state whose • can be advanced by the newly completed
    state. A • can be advanced when the category of the constituent immediately
    following it matches the category of the newly completed constituent. To
* The final change to the original algorithm: check for states already in chart
  * ENQUEUE function refused to enter into the chart any state that was
    identical to one already present in the chart.  
    * orig: “Identical” meant the same rule, with the same start and finish
      positions, and the same position of the • . It is this check that allows
    * avoid the infinite recursion problems associated with left-recursive ruls
* purpose is to prevent the wasteful addition of a state into the chart 
  whose effect on the parse would be accomplished by an already existing state.
  * prevent ... duplicat[ing] the work that will eventually be done by other
  * it is also the case for states in the chart that are more general than new
* e.g.  chart contains the following state, 
  where the Dag places no constraints on the Det.

NP → • Det NP, [i, i], [], Dag

* parser wants to insert a new state into the chart that is identical to this
  one, with the exception that its DAG restricts the Det to be singular. In
	* subsumption: check whether a newly created state is subsumed by any old

#### The Need for Copying

* COPY DAG within the UNIFY-STATE procedure require some elaboration
* states [in] the chart they may be used again and again in derivations,
* [not copying would have] negative consequences regardless of whether the
  unification succeeds or fails, since in either case the original states are
* e.g. _Show me morning flights._ 
  * When the word _me_ is read, the state representing the (uni)transitive verb
    phrase will be completed since its dot has moved to the end. C OMPLETER
  * we have already altered the DAG attached to the state representing _show_,
    as well as the one attached to the VP thereby ruining them for use with the
* can be quite expensive. As a result, a number of 
* alternative techniques have been developed that attempt to minimize this cost
  (Pereira, 1985; Karttunen and Kay, 1985; Tomabechi, 1991; Kogure, 1990).
  B Kiefer+ (1999b) and Penn and Munteanu (2003) describe a set of related
  techniques used to speed up a large unification-based parsing system.  
  
### 15.5.2 Unification-Based Parsing

* A more radical approach to using unification in parsing can be motivated by
* alternative way of denoting our augmented grammar rules.  Consider the
  following S rule that we have been using throughout this chapter.

S → NP VP
`<NP HEAD AGREEMENT> = <VP HEAD AGREEMENT>`
`<S HEAD> = <VP HEAD>`

* change the way grammatical categories are specified. In particular, we can
* place the categorical information about the parts of the rule in FS
  (Shieber, 1986).

X 0 → X 1 X 2
`<X 0 CAT>` = S
`<X 1 CAT>` = NP
`<X 2 CAT>` = VP


`<X 1 HEAD AGREEMENT> = <X 2 HEAD AGREEMENT>`
`<X 0 HEAD> = <X 2 HEAD>` 

* Altering the Earley algorithm to deal with this notational change is trivial.
  Instead of seeking the categories of constituents in the context-free
  components of the rule, it simply needs to look at the CAT feature in the DAG
* benefit? to this change. To see the potential benefit of this change,
  consider the following rules.

X 0 → X 1 X 2
`<X 0 CAT>` = < X 1 CAT>`
`<X 2 CAT> = PP`

X 0 → X 1 and X 2
`<X 1 CAT = < X 2 CAT>`
`<X 0 CAT = < X 2 CAT>`

1. generalize over e.g. NP → NP PP and VP → VP PP. It simply states that 
  * any category can be followed by a prepositional phrase, and that the
2. generalize over e.g. `S → S and S`, `NP → NP and NP`, and so on. 
  * any constituent can be conjoined with a constituent of the same category to
* not ... correct, or complete, accounts of the phenomena in question
* constituents with constrained, but unspecified, categories

* their effect
could be approximated [without CAT] by simply enumerating all the instantiatins
* A more compelling case for the new approach is motivated by the existence of
  * constituents that are not easily characterized using any existing synt cat

Consider the following examples of the English H OW -M ANY construction from
the WSJ (Jurafsky, 1992).

* _How early does it open?_
* _How deep is her Greenness?_
* _How papery are your profits?_
* _How quickly we forget._
* _How many of you can name three famous sporting Blanchards?_

* lexical item or phrase that is rather hard to characterize syntactically. It
  * adjective, adverb, or some kind of quantified phrase (although not all)
  * semantics: a scalar concept

X 0 → X 1 X 2 
`<X 1 ORTH>` = hhowi 
`<X 2 SEM>` = SCALAR>`

* A complete account of rules like this involves semantics, see Ch. 17. The key
  * not make any use of the notion of a syntactic category.

Of course, dealing this kind of rule requires some changes to our parsing scheme.

All of the parsing approaches we have considered thus far are driven by the syntac-
tic category of the various constituents in the input. More specifically, they are based
on simple atomic matches between the categories that have been predicted, and cate-
* COMPLETER [ searches the chart based on] the category of the constituent
  following the • in the existing state. Clearly this approach will run into
  trouble when there are no such categories to consult.
* remedy: search the chart for states whose DAGs unify with the new DAG 
  * PREDICTOR can be changed in a similar fashion by having it 
    add states to the chart states whose X 0 DAG component can unify with the
    constituent following the • of the predicting state. Exercise 6 asks you to

## 15.6 types and inheritance, and other extensions to constraint-based formlsm
