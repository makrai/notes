Daniel Jurafsky and James H Martin
Speech and Language Processing (2nd Edition)
2009

# 15 Features and Unification

* reductionist perspective
  * in natural sciences
    * explain the behavior of larger structures
      by the combined action of smaller primitives
    * biology: inheritance explained by the action of genes, and then again
      genes have been explained by the action of DNA
    * physics, matter was reduced to atoms and then again to subatomic particls
  * computational linguistics: grammatical categories and rules
    * eg VPto, Sthat, Non3sgAux, or 3sgNP, as well
    * complex sets of properties associated with rules like S → NP VP
    * represented by constraints
    * often called constraint-based formalisms
* Why do we need a more fine-grained way of representing and placing constrants
  * phenomena such as agreement and subcategorization can lead to over-generatn
    * fine-grained information about number and person, agreement,
      subcategorization, as well as semantic categories like mass/count
  * proliferation of primitive grammatical categories such as Non3sgVPto,
  * explosion in the number of grammar rules and loss of generality
* other advantages of constraints-based formalisms that will not be covered
  * model more complex phenomena than context-free grammars
  * compute semantics for syntactic representations
* eg grammatical number
  * property called NUMBER that can have the value singular or plural
  * members of the NP and the VP category can have the value singular/plural
  * operations, such as equality tests paired with our core grammar rules
  * ie constraints to help ensure grammaticality
* one computational implementation of a constraint-based formalism,
  based on feature structures and unification

## 15.1 feature structures (FS) 2

* sets of feature-value pairs, where
  * features are unanalyzable atomic symbols drawn from some finite set, and
  * values are either atomic symbols or feature structures themselves
  * diagram, called an attribute-value matrix (AVM)
* eg number property discussed above
  * feature: the symbol NUMBER to designate this grammatical attribute, and the
  * values: symbols sg and pl (in English)
  * eg 3sgNP

      [ CAT     NP
        NUMBER  sg
        PERSON  3rd ]

* the use of feature structures allows us to both
  * preserve the core set of grammatical categories and
  * draw distinctions among members of a single category
* features can also have other feature structures as their values
  * bundle a set of feature-value pairs together for similar treatment
  * eg NUMBER and PERSON features are often lumped together since
    grammatical subjects must agree with their predicates
    in both their number and person
  * AGREEMENT feature that takes a feature structure
    consisting of the NUMBER and PERSON feature-value pairs as its value

      [ CAT       NP
        AGREEMENT [ NUMBER  sg
                    PERSON  3rd ] ]

* test for the equality of the values for both the NUMBER and PERSON features
  of two constituents by testing for the equality of their AGREEMENT features
* feature path: a sequence of features through a feature structure to a value
  eg `<AGREEMENT, NUMBER>` path leads to the value sg,
* directed acyclic graph (DAG): alternative graphical way for feature structurs
  * suggestive of how they will be implemented
  * features appear as labeled edges and values as nodes
* reentrant structures:
  there are features that share some feature structure as a value
  * not simply equal values, but rather that they share the same FS
  * in terms of paths through a graph:
    two feature paths actually lead to the same node in the structure
  * Figure 15.2 illustrates a simple example of reentrancy
    * `<HEAD SUBJECT AGREEMENT>` and `<HEAD AGREEMENT>` lead to the same loc
  * denoted in our AVM diagrams by numerical indexes that signal the values
  * notation of the PATR-II system (Shieber, 1986), based on Kay (1979)

## 15.2 unification operator that is used to implement basic operations 5

> FRIAR FRANCIS: If either of you know any inward impediment
> why you should not be conjoined, charge you, on your souls, to utter it
                                    William Shakespeare, Much Ado About Nothing

> Ha bármelyikőtök tud olyan titkos akadályról, mely a házasság megkötése
> ellen szól: üdvösségetekre kérlek, el ne hallgassátok! (Mészöly Dezső ford.)

* wanted: reasonably efficient and powerful operations on feature structures
* two principal operations we need to perform are
  * merging the information content of two structures and
  * rejecting the merger of structures that are incompatible
* a single computational technique, called **unification**, suffices for both
* this section will illustrate through a series of examples
* Discussion of the algorithm and its implementation will be deferred to 15.4
* eg NUMBER sg ⊔ NUMBER sg = NUMBER sg
* binary partial operation (represented here as ⊔) on feature structures
* eg NUMBER sg ⊔ NUMBER pl Fails!
* eg NUMBER sg ⊔ NUMBER  = NUMBER sg
  *  value indicates that the value has been left unspecified
* eg

      NUMBER sg ⊔ PERSON 3rd = [NUMBER  sg
                                PERSON  3rd ]

  * union of all the information stored in each of the original structures
  * compatible because they contain no features that are explicitly incompatibl
    * The fact that they each contain a feature-value pair that the other does
      not is not a reason for the unification to fail
* unification of reentrant structures
* copying capabilities of unification
* difference between features that actually share values versus
  those that merely have identical looking values
  * `<SUBJECT AGREEMENT>` is not added to the value of the AGREEMENT feature
* Finally, consider the following example of a failure to unify
  * Proceeding through the features in order, we find that the
    * AGREEMENT features in these examples successfully match
    * SUBJECT features: the values found at the respective
      `<SUBJECT AGREEMENT NUMBER>` paths differ, causing a unification failure
* representing partial information about some linguistic object or
  placing informational constraints on what the object can be
  * Unification can be seen as a way of
    merging the information in each feature structure, or
    describing objects which satisfy both sets of constraints.  Intuitively,
  * produces a new feature structure which is more specific (has more
    information) than, or is identical to, either of the input FSs
* a less specific (more abstract) feature structure subsumes an equally or more
  specific one. Subsumption is represented by the **relation** ⊑
  A feature structure F subsumes a feature structure G (F ⊑ G) if and only if:
  1. For every feature x in F, **x in G és** F(x) ⊑ G(x) 
    (where F(x) means “the value of the feature x of feature structure F”)
  2. For all paths p and q in F such that F(p) = F(q), it is also the case that
     G(p) = G(q)
  * Vegyük észre, hogy az F-ben nem szereplő jegyekről nem mond semmit
* Subsumption is a partial ordering; there are pairs of feature structures that
  neither subsume nor are subsumed by each other: 15.3 !⊑ 15.4, 15.4 !⊑ 15.3
* (Semi)lattice:
  * példák (fél)hálóra
    * A természetes számok halmazán
      * művelet: legnagyobb közös osztó (és legkisebb közös többszörös)
      * Részbenrendezés: oszthatóság
    * Nemüres halmaz részhalmazai hálót alkotnak
      * művelet: halmazelméleti metszet (és unió)
      * Részbenrendezés: tartalmazás
    * Vigyázat, a könyv zavaros! A jegystruktúrák metszetfélhálót alkotnak, de
      az érdekes ,,művelet", az unifikáció, az uniónak felel meg, és csak
      parciális(-)művelet
  * every feature structure is subsumed by the empty structure
  * F ⊔ G is defined as the most general feature structure H such that F ⊑ H
    and G ⊑ H
* unification operation is
  * monotonic
  (Pereira and Shieber, 1984; Rounds and Kasper, 1986; Moshier, 1988)
  a <= b implies a <= b U c
  * associative; given a finite set of feature structures to unify, we can
    check them in any order and get the same result
    (a bizonyítást végiggondoltam. Ha valakit érdekel, leírom.)
* unification ~ integration of knowledge from different constraints
  * Given two compatible feature structures as input, it produces
    the most general feature structure which nonetheless contains all the
    information in the inputs
  * Given two incompatible feature structures, it fails

## 15.3 Grammatical formalism 9

* elegantly express syntactic constraints
  * augmenting the rules of ordinary context-free grammars with attachments
    that specify feature structures for the constituents of the rules
  * unification operations that express constraints on those constituents
* From a grammatical point of view, these attachments will accomplish the follw
  * associate complex feature structures with
    both lexical items and instances of grammatical categories
  * guide the composition of feature structures for larger constituents
    based on the feature structures of their component parts
  * enforce compatibility constraints between specified parts of constructions
* notation based on the PATR-II system described in Shieber (1986):
* two styles of constraints
  1. the value found at the end of the given path
  2. the values found at the end of the two given paths must be unifiable

      S → NP VP
      <NP NUMBER> = <VP NUMBER>

* in cases where there are two or more constituents of the same category,
  we will subscript the constituents to keep them straight
* the simple generative nature of context-free rules has fundamentally changed
  * CF: simple concatenation; an NP followed by a VP is an S
  * now concatenation must be accompanied by a successful unification
  * computational complexity?, generative power? will be discussed in Ch 15
* The following sections present applications to four linguistic phenomena:
  agreement, grammatical heads, subcategorization, and long-distance dependency

### 15.3.1 Agreement

* in This section, two main types of English agreement phenomena:
  subject-verb agreement and determiner-nominal agreement

(15.8)  This flight serves breakfast
(15.9)  Does this flight serve breakfast?
(15.10) Do these flights serve breakfast?

involves PERSON: make use of the AGREEMENT feature

      S → NP VP
      <NP AGREEMENT> = <VP AGREEMENT>

* yes-no-questions, the subject NP must agree with the auxiliary verb
  * main verb appears in a non-finite form

      S → Aux NP VP
      <Aux AGREEMENT> = <NP AGREEMENT>

* Agreement between determiners and nominals in noun phrases
  * NUMBER feature
  * the logical place to enforce this constraint is in the grammar rule that
    brings the parts together

      NP → Det Nominal
      <Det AGREEMENT>  = <Nominal AGREEMENT>
      <NP AGREEMENT>   = <Nominal AGREEMENT>
  * minek ide PERSON?

* how the constituents acquire values for their various agreement features
* constraints involve both lexical and non-lexical constituents
  * lexical constituents, Aux and Det, receive feature values from the lex

      Aux → do
      <Aux AGREEMENT NUMBER> = pl
      <Aux AGREEMENT PERSON> = 3rd

      Aux → does
      <Aux AGREEMENT NUMBER> = sg
      <Aux AGREEMENT PERSON> = 3rd504

      Det → this
      <Det AGREEMENT NUMBER> = sg

      Det → these
      <Det AGREEMENT NUMBER> = pl

* Returning to our first S rule, let us first consider the AGREEMENT for the VP

      Verb → serve
      <Verb AGREEMENT NUMBER> = pl

      Verb → serves
      <Verb AGREEMENT NUMBER> = sg
      <Verb AGREEMENT PERSON> = 3rd

      VP → Verb NP
      <VP AGREEMENT> = <Verb AGREEMENT>

* The same technique works for the remaining NP and Nominal categories

      Noun → flight
      <Noun AGREEMENT NUMBER> = sg

      Noun → flights
      <Noun AGREEMENT NUMBER> = pl

      Nominal → Noun
      <Nominal AGREEMENT> = <Noun AGREEMENT>

* Note that this section has only scratched the surface of the English agreemnt
  * other languages can be considerably more complex than English

### 15.3.2 Head Features

* preceding section: copying feature structures from children to their parents
* a much more general phenomenon in constraint-based grammars
* the features for most grammatical categories are copied from one of the
  children to the parent
  * child that provides the features is called the head of the phrase and
    the features copied are referred to as head features
* heads, first introduced in Sec. 12.4.4, play an important role

      VP → Verb NP
      <VP AGREEMENT> = <Verb AGREEMENT>

      NP → Det Nominal
      <Det AGREEMENT> = <Nominal AGREEMENT>
      <NP AGREEMENT> = <Nominal AGREEMENT>

      Nominal → Noun
      <Nominal AGREEMENT> = <Noun AGREEMENT>

* verb is the head of the verb phrase, the nominal is the head of the NP
* We can rewrite our rules to reflect these generalizations by
  placing the agreement feature structure under a HEAD feature and then
  copying that feature upward as in the following constraints

      VP → Verb NP
      <VP HEAD> = <Verb HEAD>

      NP → Det Nominal
      <NP HEAD> = <Nominal HEAD>
      <Det HEAD AGREEMENT> = <Nominal HEAD AGREEMENT>

utóbbi minek?

      Nominal → Noun
      <Nominal HEAD> = <Noun HEAD>

* Similarly, the lexical entries that introduce these features

      Noun → flights
      <Noun HEAD AGREEMENT NUMBER> = pl

      Verb → serves
      <Verb HEAD AGREEMENT NUMBER> = sg
      <Verb HEAD AGREEMENT PERSON> = 3rd

### 15.3.3 Subcategorization

* verbs can be picky about the patterns of arguments they will allow
* In Ch 12, we split the category of verb into multiple sub-categories
* categories were then used in the definition of the specific verb phrases

      VP → Verb-with-S-comp S
      Verb-with-S-comp → think

* undesirable proliferation of categories
* introduce feature structures to distinguish among the various verbs
* atomic feature called SUBCAT, with an appropriate value
* eg transitive version of _serves_ could be assigned the following FS in lex

      Verb → serves
      <Verb HEAD AGREEMENT NUMBER> = sg
      <Verb HEAD SUBCAT> = trans

* corresponding constraints to all the verb phrase rules in the grammar, as in

      VP → Verb
      <VP HEAD> = <Verb HEAD>
      <VP HEAD SUBCAT> = intrans

      VP → Verb NP
      <VP HEAD> = <Verb HEAD>
      <VP HEAD SUBCAT> = trans

      VP → Verb NP NP
      <VP HEAD> = <Verb HEAD>
      <VP HEAD SUBCAT> = ditrans

* requires unique symbols for each of the 50–100 verb phrase frames in English
  * unanalyzable SUBCAT symbols do not directly encode either the
    number or type of the arguments that the verb expects to take
* you must use a pointer to those verb phrase rules in the grammar
  that can accept the verb in question
* A more elegant solution: directly specify the order and category type of args

      Verb → serves
      <Verb HEAD AGREEMENT NUMBER> = sg
      <Verb HEAD SUBCAT FIRST CAT> = NP
      <Verb HEAD SUBCAT SECOND> = end

* the value of the SECOND feature indicates that this verb expects only one arg
* _leave Boston in the morning_, with two arguments, would have the following

      Verb → leaves
      <Verb HEAD AGREEMENT NUMBER> = sg
      <Verb HEAD SUBCAT FIRST CAT> = NP
      <Verb HEAD SUBCAT SECOND CAT> = PP
      <Verb HEAD SUBCAT THIRD> = end

* encoding a list with types defined in Sec. 15.6

      VP → Verb NP5

      <VP HEAD> = <Verb HEAD>
      <VP HEAD SUBCAT FIRST CAT> = <NP CAT>
      <VP HEAD SUBCAT SECOND> = end

* complex subcategorization frames, (eg, NP PP, NP NP, or NP S)
  * frames can be composed of many different phrasal types
* Fig 15.3.3 shows one short list of possible phrase types
  * from the FrameNet project (Johnson, 1999; Baker+ 1998)
  * special subjects like _there_ and _it,_ as well as for objects and comps
* eg VPto, which is subcategorized for by _want_ might be expressed as:

      Verb → want
      <Verb HEAD SUBCAT FIRST CAT> = VP
      <Verb HEAD SUBCAT FIRST FORM> = infinitive

* eg the two-complement _want_
  * two different notational possibilities
    * lists can be represented via an angle brackets notation `<` and `>`
    * represent the lexical entry as a single ORTH feature
* very large set of possible subcategorization frames
  * each verb allows many different subcategorization frames. Fig 15.4
* comprehensive subcategorization-frame tagsets exist, such as the
  * COMLEX set (Macleod+ 1998), which includes
    subcategorization frames for verbs, adjectives, and nouns, and the
  * ACQUILEX tagset of verb subcategorization frames (Sanfilippo, 1993)
  * other information about the complements, such as specifying the
    identity of the implicit subject in a lower verb phrase, ie control
    eg _Temmy promised Ruth to go_ vs _Temmy persuaded Ruth to go_
* info about the subcategorization frames for a verb can be
  partially predicted by the semantics of the verb
  * eg verbs of transfer (like _give, send, carry_) predictably take the
    two subcategorization frames NP NP and NP PP:
    * sent NP NP: _sent FAA Administrator James Busey a letter_
    * sent NP PP: _sent a letter to the chairman of the Armed Services_
* relationships between subcategorization frames across classes of verbs are
  called argument-structure alternations
  * will be discussed in Ch 19 when we discuss verb semantics
  * Ch 14: probabilities of the different subcategorization frames of each verb

#### Subcategorization in Other Parts of Speech

* subcategorization, or valence originally conceived for verbs
* but eg _Keep your seatbelt fastened while/during we are taking off/takeoff_
* adjectives and nouns also have subcategorization frames
  * adjectives _apparent, aware, and unimportant_; nouns _assumption, question_
    * _It was apparent [ `Sfin` that the kitchen was the only room. . . ]_
    * _It was apparent [ PP from the way she rested her hand over his]_
    * _aware [ `Sfin` he may have caused offense]_
    * _it is unimportant [ `Swheth` whether only a little bit is accepted]_
    * _the assumption [ `Sfin` that wasteful methods have been employed]_
    * _the question [ `Swheth` whether the authorities might have decided]_
    * See Macleod+ (1998) and Johnson (1999) for descriptions
* Verbs subcategorize for their subjects as well as their complements
  * eg _seem_ can take an `Sfin` as its subject

### 15.3.4 Long-Distance Dependencies (out of the VP)

* The model of subcategorization we have developed so far has two components
  * head word has a SUBCAT feature which contains a list of the complements
  * phrasal rules like the VP rule in (15.15) match up each expected complement
    in the SUBCAT list with an actual constituent
* but eg wh-non-subject-questions
  * _What cities does Continental service?_
  * _What flights do you have from Boston to Baltimore?_
  * _What time does that flight leave Atlanta?_

      S → Wh-NP Aux NP VP

* these require the
  * Aux and the NP to agree (since the NP is the subject)
  * Wh-NP should fill some subcategorization slot in the VP
* Which flight do you want me to have the travel agent book?
  * Melyik **járatra** akarod hogy **foglaltassak** az utazási ügynökkel?
* Many solutions in unification grammars involve keeping a gap list,
  * a feature GAP, which is passed up from phrase to phrase in the parse tree
  * filler (eg _which flight_ above) is put on the gap list, and must
    eventually be unified with the subcategorization frame of some verb
  * See Sag and Wasow (1999) for an explanation of such a strategy
    * plus many other complications that must be modeled in long-distance deps

## 15.4 Implementing unification algorithm and its required data structures 19

* unification operator takes 
  * input: two feature structures as input and
  * returns a single merged feature structure if successful, or a failure signal
* feature structures are represented as directed acyclic graphs (DAGs), where
  features are depicted as labels on directed edges, and
  feature values are either atomic symbols or DAGs.  As we will see, the
* implementation is recursive graph matching algorithm, suitably tailored to
  * loops through the features in one input and
    attempts to find a corresponding feature in the other. If all of the
  * recursion is needed for features that have feature structures as value
* rather than constructing a new feature structure with the unified information
  * destructively alters the arguments so that
    in the end they point to exactly the same information

### 15.4.1 Unification Data Structures

* destructive nature of this algorithm necessitates extensions to the DAGs
* additional edges, or fields. Specifically,
  * each feature structure = two fields: a content field and a pointer field
    * content field may be null or contain an ordinary feature structure
    * pointer field may be null or contain a pointer to another feature struct
  * If the pointer field of the DAG is null, then the content field of the DAG
    contains the actual feature structure to be processed.  If, on the other
    * else the destination of the pointer represents the actual FS

NUMBER sg ⊔ PERSON 3rd = [  NUMBER sg
                            PERSON 3rd ]

* unification is accomplished by changing some of the pointers from one
  structure to the other so that in the end they contain the same content. In
  * adding a PERSON feature to the first argument, and assigning it a value by
    filling its POINTER field with a pointer to the appropriate location in the
    second argument, as shown in Figure 15.7
* two arguments must be completely unified at the top level,
  future unifications involving one of the arguments
* set the POINTER field of the second argument to point at the first one. When
  this is done any future change to either argument will be immediately
  reflected in both. The result of this final change is shown in Figure 15.8
* 15.8-as ábrán rajta felejtették az alsó FS null pointerét

### 15.4.2 The Unification Algorithm

* pointer following process, often referred to as dereferencing
* As with all recursive algorithms, the next step is to test for the various
  base cases of the recursion before proceeding on to a recursive call
  1. The arguments are identical
    * the pointer of the first is set to the second and the second is returned
    * reason for pointer change: two arguments to be identical
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
  actual search strategy used in the parser
* associate unification constraints with the context-free rules of the grammar,
  and feature structures with the states of the search,
  any of the standard search algorithms described in Ch 13 can be used
* a fairly large range of possible implementation strategies
  * simply parse as we did before using the context-free components of the
    rules, and then build the feature structures for the resulting trees
    * filtering out those parses that contain unification failures
  * use the power of unification to reduce the size of the search space
    * integrating unification constraints directly into the Earley parsing
    * ill-formed structures to be eliminated as soon as they are proposed
    * only minimal changes to the basic Earley algorithm
  * then briefly consider an approach that moves even further from CF

### 13.4.2 The Earley Algorithm 447/474

* Earley algorithm (Earley, 1970) uses dynamic programming and top-down searc
  * In contrast with the bottom-up search implemented by the CKY algorithm
* core of the Earley algorithm is a single left-to-right pass
* fills a chart ie array that has N + 1 entries
  * For each word position in the sentence, the chart contains a
    list of states representing the partial parse trees
    * indexes represent the locations between the words in an input
  * Each possible subtree is represented only once and
    can thus be shared by all the parses that need it
* individual states in each chart entry contain three kinds of information:
  * a subtree corresponding to a single grammar rule,
  * information about the progress made in completing this subtree, and the
    * • within the right-hand side of a state’s grammar rule to indicate
    * Structure is called a dotted rule
  * position of the subtree with respect to the input

0 Book 1 that 2 flight 3

      S → • VP, [0, 0]
      NP → Det • Nominal, [1, 2]
      VP → V NP • , [0, 3]

* eg above
  * (1) represents a top-down prediction for this particular kind of S
  * (2) created at a later stage in the processing of this sentence
  * (3) with its dot to the right of all its two constituents, represents the
     successful discovery of a tree corresponding to a VP that spans the entire i
* The basic operation of an Earley parser is to march through the N +1 sets
  * At each step, one of the three operators described below is applied to stts
  * this results in the addition of new states
    to the end of either the current or the next set of states in the chart
* states are never removed and the algorithm
  never backtracks to a previous chart entry once it has moved on

#### Predictor

* representing top-down expectations generated during the parsing process
* applied to any state that has a non-terminal immediately to the right of •
* new states are placed into the same chart entry as the generating state
* They begin and end at the point in the input where the generating state ends

#### Scanner

* When a state has a part-of-speech category to the right of the dot
* examine the input and incorporate a state corresponding to the prediction
* when the state VP → • Verb NP, [0, 0] is processed, SCANNER comes
  * results in the creation of the new state Verb → book • , [0, 1]
* new state is then added to the following chart entry

#### Completer

* COMPLETER is applied to a state when its dot has reached the right end
* parser has successfully discovered a particular grammatical category
* advance, all previously created states that were looking for this grammatical
  category at this position in the input
* New states are then created by copying the older state, advancing the dot
* new state in the current chart entry
* when the state NP → Det Nominal • , [1, 3] is processed,
  COMPLETER looks for incomplete states ending at_1 and expecting an NP
  * finds the states `VP → Verb • NP, [0, 1]` and `VP → Verb • NP PP, [0, 1]`
  * new states to the chart:
    * VP → Verb NP • , [0, 3] /complete/ , and
    * VP → Verb NP • PP, [0, 3] /incomplete/

#### Retrieving Parse Trees from a Chart

* the representation of each state must be augmented with information about
  the completed states that generated its constituents
* can be gathered by making a simple change to the COMPLETER function
  * Recall that COMPLETER creates new states by advancing existing incomplete
    states when the constituent following the dot has been discovered
  * add a pointer to the older state onto a list of constituent-states for the
    new state

### 15.5.1 Integrating Unification into an Earley Parser 26

* two goals
  * richer representation for the constituents of the parse, and to
  * block entry into the chart of ill-formed constituents that violate unif
* original Earley scheme given on page 448 (ie 475)

S → NP VP
      <NP HEAD AGREEMENT> = <VP HEAD AGREEMENT>
      <S HEAD> = <VP HEAD>

* Converting these constraints into a feature structure
  * first creating top-level features for each of the parts of the CF rule,
    S , NP , and VP in this case
  * then add further components by following the path equations in the constrns
* states used to represent partial parses in the Earley chart
  * original states contain fields for
    * the context-free rule being used, the
    * position of the dot representing how much of the rule has been completed,
    *  positions of the beginning and end of the state, and a
    * list of other states that represent the completed sub-parts of the state
  * add a field to contain the DAG
    representing the feature structure corresponding to the state
    * PREDICTOR: DAG will simply be retrieved from the rule
      For example, when PREDICTOR uses the above S rule to enter a state
      * the feature structure given above
* altering the algorithm itself
  The most important:
  when COMPLETER creates a new state by the extension of a state
  * ie when a completed constituent has been added to the chart
  * task is to attempt to find, and extend, existing states in the chart that
    are looking for constituents that are compatible with the new one
* To be more specific, COMPLETER adds a new state into the chart by
  * finding an existing state whose • can be advanced by the newly completed
    state [ie] when the category of the constituent immediately following •
    matches the category of the newly completed constituent
    * now: unifying the feature structure associated with the newly completed
      state with the appropriate part of the feature structure being advanced
      * If this unification succeeds, then the DAG of
        the new state receives the unified structure and is entered
      * else no new state is entered into the chart
* The final change to the original algorithm: check for states already in chart
  * ENQUEUE function refused to enter into the chart any state that was
    identical to one already present in the chart
    * orig: “Identical” meant the same rule, with the same start and finish
      positions, and the same position of the •
    * avoid the infinite recursion problems associated with left-recursive ruls
  * prevent the wasteful addition of a state into the chart whose effect on the
    parse would be accomplished by an already existing state
    * ie prevent duplicating the work that will eventually be done by
      more general states already in the chart
  * eg  chart contains the following state,
    where the Dag places no constraints on the Det

  NP → • Det NP, [i, i], , Dag

  * parser wants to insert a new state into the chart that is identical to this
    one, with the exception that its DAG restricts the Det to be singular
  * subsumption: check whether a newly created state is subsumed by any old

#### The Need for Copying

* COPY DAG within the UNIFY-STATE procedure
* states in the chart they may be used again and again in derivations,
* not copying would have negative consequences regardless of whether the
  unification succeeds or fails
* eg _Show me morning flights._
  * When the word _me_ is read, the state representing the (uni)transitive verb
    phrase will be completed since its dot has moved to the end
  * we have already altered the DAG attached to the state representing _show_,
    as well as the one attached to the VP thereby ruining them
* can be quite expensive
* alternative techniques have been developed that attempt to minimize this cost
  (Pereira, 1985; Karttunen and Kay, 1985; Tomabechi, 1991; Kogure, 1990)
  * B Kiefer+ (1999b) and Penn and Munteanu (2003) describe a set of techniques

### 15.5.2 Unification-Based Parsing

* A more radical approach to using unification in parsing
* alternative way of denoting our augmented grammar rules

S → NP VP
      <NP HEAD AGREEMENT> = <VP HEAD AGREEMENT>
      <S HEAD> = <VP HEAD>

* change the way grammatical categories are specified
* place the categorical information about the parts of the rule in FS
  (Shieber, 1986)

      X_0 → X_1 X_2
      <X_0 CAT> = S
      <X_1 CAT> = NP
      <X_2 CAT> = VP
      <X_1 HEAD AGREEMENT> = <X_2 HEAD AGREEMENT>
      <X_0 HEAD> = <X_2 HEAD>

* Altering the Earley algorithm to deal with this notational change is trivial
  * Instead of seeking the categories of constituents in the CF components,
    it simply needs to look at the CAT feature in the DAG

      X_0 → X_1 X_2
      <X_0 CAT> = < X_1 CAT>
      <X_2 CAT> = PP

      X_0 → X_1 and X 2
      <X_1 CAT = < X_2 CAT>
      <X_0 CAT = < X_2 CAT>

* (1) generalize over eg NP → NP PP and VP → VP PP
  * any category can be followed by a prepositional phrase, and that the
* (2) generalize over eg `S → S and S`, `NP → NP and NP`, and so on
  * any constituent can be conjoined with a constituent of the same category
* not correct, or complete, accounts of the phenomena in question
* constituents with constrained, but unspecified, categories
* benefit: constituents that are not easily characterized using a synt cat
  * eg English HOW-MANY construction from the WSJ (Jurafsky, 1992)
    * _How early does it open?_
    * _How deep is her Greenness?_
    * _How papery are your profits?_
    * _How quickly we forget._
    * _How many of you can name three famous sporting Blanchards?_
  * lexical item or phrase that is rather hard to characterize syntactically
    * adjective, adverb, or some kind of quantified phrase (although not all)
    * semantics: a scalar concept

  `X_0 → X_1 X_2`
  `<X_1 ORTH> = <how>`
  `<X_2 SEM> = SCALAR>`

* A complete account of rules like this involves semantics, see Ch 17
  * not make any use of the notion of a syntactic category
* COMPLETER searches the chart based on the category of the constituent
  following the • in the existing state
  * trouble when there are no such categories to consult
* remedy: search the chart for states whose DAGs unify with the new DAG
  * PREDICTOR can be changed in a similar fashion by having it
    add states to the chart states whose X_0 DAG component can unify with the
    constituent following the • of the predicting state. Exercise 6

## 15.6 Types and Inheritance, and other extensions to constraint-based formlsm

> I am surprised that ancient and modern writers have not attributed greater
> importance to the laws of inheritance,,,
                              Alexis de Tocqueville, Democracy in America, 1840

* two problems that have led to extensions to the formalism
  1. place a constraint on what can be the value of a feature
    * eg NUMBER attribute can take only sg and pl as values
    * keep intransitive verb like _sneeze_ from unifying with a direct object
    * Functional Unification Grammar (FUG, Kay, 1979, 1984, 1985)
      * adding a special atom `none` which is not allowed to unify with anythng
    * Lexical Functional Grammar (LFG, Bresnan, 1982)
      * adding coherence conditions, when a feature should not be filled
    * Generalized Phrase Structure Grammar (GPSG, Gazdar+ 1985, 1988)
      * feature co-occurrence restrictions, to
        prevent, for example, nouns from having some verbal properties
  2. capture generalizations across feature structures
    * subcategorization frames for verbs in English
* solution: types
  1. Each feature structure is labeled by a type
  2. each type has appropriateness conditions expressing
    which features are appropriate for it and
    what types of values they take
  3. type hierarchy, in which more specific types
    inherit properties of abstract ones
  4. unification operation is modified to unify the types of FSs
     in addition to unifying the attributes and values
* Types come in two kinds: simple types (also called atomic), and complex
  * simple types: an atomic symbol like sg or pl
    * hierarchy:  multiple-inheritance (lattice. a kind of partial order)
    * Fig 15.13 shows the type hierarchy for agreement
    * the type of the kind of atomic object that can be the value of AGREE
    * the unification of any two types is
      the most-general type that is more specific than the two input types
      * legnagyobb közös osztó
    * The unification of two types which do not have a defined unifier
      * eg  `3rd ⊔ 1st = undefined`
      * it is also possible to explicitly represent this fail type using ⊥
        (Aı̈t-Kaci, 1984)
  * complex types
    * specify:
      * a set of features that are appropriate for that type
      * restrictions on the values of those features
        (expressed in terms of types)
      * equality constraints between the values
    * eg verb: just represents agreement and verbal morphology information
      * two appropriate features, AGREE and VFORM
      * type of the values of the two features
        * AGREE feature takes values of type agr defined in Fig 15.13, and
        * VFORM feature takes values of type vform >= finite, infinitive, gerund,
          base, present-participle, past-participle, and passive-participle
    * indicate the type at the top of the AVM or to the lower left of `[`
    * noun might be defined with the the VFORM feature:

      [ noun
      AGREE   agr ]

* Complex types are also part of the type hierarchy
  * Subtypes inherit
    all the features of their parents + the constraints on values
  * encode the hierarchical structure of the lexicon (Sanfilippo 1993),
    Fig 15.14 shows the subcategories of verbs which take sentential comp

### 15.6.1 Advanced: Extensions to Typing

* inheritance
  * mainly been used in lexical type hierarchies
  * encode generalizations and subregular exceptions to them
  * order-dependent?
    * In early versions of default unification the operation was order-dependent,
      * priority union operation (Kaplan, 1987)
    * More recent architectures are order-independent
      (Lascarides and Copestake, 1997; Young and Rounds, 1993),
      * related to Reiter’s default logic (Reiter, 1980)
* lexical rule (Jackendoff, 1975)
  * eg HPSG (Pollard and Sag, 1987, 1994) and LFG (Bresnan, 1982)
  * for capturing lexical generalizations
  * a reduced, hence more redundancy-free lexicon to be automatically expanded
  * See Pollard and Sag (1994) for examples,
    Carpenter (1991) on complexity issues, and
    Meurers and Minnen (1997) on efficient implementation.  Conversely, see
    Krieger and Nerbonne (1993) on using the type hierarchy to replace lex ruls
* Types to represent constituency. Instead of rules like

      NP → Det Nominal
      <Det AGREEMENT>  = <Nominal AGREEMENT>
      <NP AGREEMENT>   = <Nominal AGREEMENT>

* represent the whole phrase structure rule as a type
* represent constituents as features
  * feature called DTRS (“daughters”), whose value is a list of phrases
    (Sag and Wasow 1999)

### 15.6.2 Other Extensions to Unification

* path inequalities (Moshier, 1988; Carpenter, 1992; Carpenter & Penn, 1994)
* negation (Johnson, 1988, 1990),
* set-valued features (Pollard and Moshier, 1990), and
* disjunction (Kay, 1979; Kasper and Rounds, 1986)
* operation incorporated into feature structures OR in a separate metalanguage
  * descriptions may use negation and disjunction to describe a set of
    feature structures (ie, a certain feature must not contain a certain
    value, or may contain any of a set of values) but an
  * actual instance of a feature structure that meets the description would not
    have negated or disjoint values
* disambiguation. Much recent work in unification grammars has focused on
  * probabilistic augmentations.  See the History section

# Végszó helyett

* feature geometry (phonology, Kornai 2008 Fig 3.1)
* magyar NP (Kornai 1985, 1989), pl. _három kiló rohadt alma_
* Prolog
* Prószéky
  * HuMor,
  * MetaForfo. _I save it to the shop._ `Lementem a boltba.`
  * Anagramma

# Summary

# Bibliographical and Historical Notes

* distinctive features in linguistic theory comes originally from
  * phonology
    * Anderson (1985) credits Jakobson (1939) with being the first
    * Trubetskoi (1939) and others. The semantic use of features followed soon
  * in syntax: well established by the 1950s and popularized by Chomsky (1965)
* unification operation in linguistics was developed independently by
  Kay (1979) (feature structure unif) and Colmerauer (1970, 1975) (term unif)
  * Both were working in machine translation
  * combination operation should be reversible: both parsing and generation
  * Prolog
    * Colmerauer, F Didier, Robert Pasero, Philippe Roussel, and J Trudel
    * resolution principle of Robinson (1965)
    * natural language via Definite Clause Grammars was based on
      Colmerauer’s (1975) metamorphosis grammars, and was developed and named
  * Augmented Transition Network (ATN) grammars
