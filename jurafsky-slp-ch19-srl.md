in Speech and Language Processing. Daniel Jurafsky & James H. Martin.
Draft of December 29, 2021.

# 19 Semantic Role Labeling

> “Who, What, Where, When, With what, Why, How”
  The seven circumstances, associated with Hermagoras and Aristotle (Sloan, 2010)

* Sometime between the 7th and 4th centuries BCE, the Indian grammarian Pānini 1
  wrote a famous treatise on Sanskrit grammar, the Astādhyāyı̄ (‘8 books’), a
  * in the form of 3959 sutras, each very efficiently (since it had to be
    memorized!) expressing part of a formal rule system that
    brilliantly prefigured modern mechanisms of formal language theory (Penn and
    Kiparsky, 2012)
  * One set of rules describes the kārakas,
    semantic relationships between a verb and noun arguments,
    roles like agent, instrument, or destination.
  * the linguistic realization of events and their participants
    * question “Who did what to whom” (and perhaps also “when and where”) is
  * a central question of natural language processing.
* eg task of understanding text about a purchase of stock by XYZ Corporation.
  * event and participants can be described by a wide variety of surface forms.
    * event can be described by a verb (sold, bought) or a noun (purchase), and
    * XYZ Corp can be the syntactic subject (of bought), the indirect object (of
      sold), or in a genitive or noun compound relation (with the noun purchase)
* In this chapter we introduce
  a level of representation that captures the commonality between these sents:
  there was a purchase event, the participants were XYZ Corp and some stock, and
  XYZ Corp was the buyer. These
  * shallow semantic representations , semantic roles, express
  * the role that arguments of a predicate take in the event, codified in
  * databases like PropBank and FrameNet. We’ll introduce
  * semantic role labeling, the task of assigning roles to spans in sentences,
  * selectional restrictions, the preferences of predicates about their args,

## 19.1 Semantic Roles

* neo-Davidsonian event representation of these two sentences would be
  * how in Chapter 15 we represented the meaning of arguments for sentences 
  (19.1) Sasha broke the window.
  (19.2) Pat opened the door.

∃e, x, y Breaking(e) ∧ Breaker(e, Sasha) ∧ BrokenT hing(e, y) ∧ Window(y)
∃e, x, y Opening(e) ∧ Opener(e, Pat) ∧ OpenedT hing(e, y) ∧ Door(y)
  * the roles of the subjects of the verbs break and open are Breaker and Opener
  * These deep roles are specific to each event; Breaking events have Breakers,
  * for sem processing
    eg answer questions, perform inferences, or do any further kinds of semantic
    * need to know eg Breakers are both volitional actors, often animate, causer
* Thematic roles capture this semantic commonality between Breakers and Openers.
  * the subjects of both these verbs are agents.  Thus,
    * AGENT represents an abstract idea such as volitional causation.  Similarly,
  * the direct objects of both these verbs, BrokenThing and OpenedThing; theme
    * prototypically inanimate objects that are affected in some way by the acti
  * Some commonly used thematic roles with their definitions.
    AGENT        The volitional causer of an event
    EXPERIENCER  The experiencer of an event
    FORCE        The non-volitional causer of the event
    THEME        The participant most directly affected by an event
    RESULT       The end product of an event
    CONTENT      The proposition or content of a propositional event
    INSTRUMENT   An instrument used in an event
    BENEFICIARY  The beneficiary of an event
    SOURCE       The origin of the object of a transfer event
    GOAL         The destination of an object of a transfer event
  * modern formulation is due to Fillmore (1968) and Gruber (1965). Although
    * no universally agreed-upon set of roles,
    * Figs. 19.1 and 19.2 list some thematic roles that have been used in comp
    * We’ll use the general term semantic roles for both small and large sets

## 19.2 Diathesis Alternations

* The main reason computational systems use semantic roles
  shallow meaning representation that can let us make simple inferences that
  aren’t possible from the pure surface string, or even from the parse tree. To
  * QA, MT
* Semantic roles thus help generalize over different surface realizations of
  eg AGENT is often realized as the subject of the sentence, in other cases the
  THEME can be the subject. Consider these possible realizations of the thematic
  arguments of the verb break: 
(19.3) John broke the window.
  AGENT THEME 
(19.4)   John broke the window with a rock.
  AGENT THEME INSTRUMENT 
(19.5)   The rock broke the window.  
  INSTRUMENT THEME 
(19.6)   The window broke.  
  THEME 
(19.7)   The window was broken by John.  
  THEME AGENT
* break has (at least) the possible arguments AGENT , and INSTRUMENT .
* thematic grid, θ -grid, or case frame
  * The set of thematic role arguments taken by a verb 
    . We can see that there are (among others) the following possibilities for
    the realization of these arguments of break:
  AGENT /Subject, THEME /Object
  AGENT /Subject, THEME /Object, INSTRUMENT /PPwith
  INSTRUMENT /Subject, THEME /Object
  THEME /Subject
* many verbs allow their thematic roles to be realized in various syntactic posz 
  eg verbs like give can realize the THEME and GOAL arguments in two ways: 
  a.  Doris gave the book to Cary.  
      AGENT THEME GOAL
  b.  Doris gave Cary the book.  
      AGENT GOAL THEME 
* verb alternations or diathesis alternations
  * multiple argument structure realizations 
  * eg break can take AGENT , or THEME as subject, and
  * give can realize its THEME and GOAL in either order): the dative alternation
  * occur with particular semantic classes of verbs, 
  * eg dat alter
    “verbs of future having” (advance, allocate, offer, owe),
    “send verbs” (forward, hand, mail),
    “verbs of throwing” (kick, pass, throw), and so on. 
* Levin (1993) lists for
  * 3100 English verbs
  * the semantic classes (47 high-level classes, divided into 193 more specific)
  * various alternations in which they participate. These lists of verb classes
  * incorporated into the online resource VerbNet (Kipper+ 2000), which
    links each verb to both WordNet and FrameNet entries.

## 19.3 Semantic Roles: Problems with Thematic Roles

* no standard set of roles and formal definition of roles like AGENT, THEME, INS
  * often need to fragment a role like AGENT or THEME into many specific roles.
    Levin and Rappaport Hovav (2005) summarize a number of such cases, such as
    * two kinds of INSTRUMENTS ,
      * intermediary instruments that can appear as subjects and
      * enabling instruments that cannot: 
        (19.9)  a. The cook opened the jar with the new gadget.
                b. The new gadget opened the jar.
        (19.10) a. Shelly ate the sliced banana with a fork.
                b. *The fork ate the sliced banana.
* sometimes we’d like to reason about and generalize across semantic roles, but
  the finite discrete lists of roles don’t let us do this.
* define the thematic roles
  * most cases of eg AGENTS are animate, volitional, sentient, causal, but any
    individual noun phrase might not exhibit all of these properties.
* alternative semantic role models that use either many fewer or many more roles
  * generalized semantic roles that abstract over the specific thematic roles.
    * For example, PROTO AGENT and PROTO PATIENT are generalized roles that
    * defined
      * not by necessary and sufficient conditions, but rather
      * by a set of heuristic features that accompany more agent/pat-like meangs
    * agent-like properties (volitionally involved in the event, causing
      an event or a change of state in another participant, being sentient or
      intentionally involved, moving)
    * the more an argument displays them, the greater the likelihood that the
      argument can be labeled a PROTO AGENT .
    * patient-like the properties (undergoing change of state, causally
      affected by another participant, stationary relative to other
      participants, etc.), the greater the likelihood that the argument can
  * semantic roles that are specific to a particular verb or a particular
    group of semantically related verbs or nouns.  
* In the next two sections; two commonly used lexical resources that make use of
  these alternative versions of semantic roles
  * PropBank uses both proto-roles and verb-specific semantic roles
  * FrameNet 
    * semantic roles that are specific to a general semantic idea called a frame

## 19.4 The Proposition Bank

* sentences annotated with semantic roles. The
  * English PropBank labels all the sentences in the Penn TreeBank; the
  * Chinese PropBank labels sentences in the Penn Chinese TreeBank. Because of
  * sem roles in PropBank are defined with respect to an individual verb sense.
* Each sense of each verb thus has a specific set of roles, which are given only
  * Arg0, Arg1, Arg2, and so on
  * In general, Arg0 represents the PROTO AGENT , and Arg1, the PROTO PATIENT .
  * The semantics of the other roles are less consistent, often spec for each V
    * nL there are some generalization
      * the Arg2 is often the benefactive, instrument, attribute, or end state,
        the Arg3 the start point, benefactive, instrument, or attribute, and the
        Arg4 the end point.
* eg some simplified PropBank entries for one sense each of agree & fall
  * PropBank entries are called frame files; note that the
  * definitions in the frame file for each role (“Other entity agreeing”)
    (“Extent, amount fallen”) are informal glosses intended to be read by humans,
  (19.11) agree.01 
        Arg0: Agreer 
        Arg1: Proposition 
        Arg2: Other entity agreeing 
        Ex1: [ Arg0 The group] agreed [ Arg1 it wouldn’t make an offer].
        Ex2: [ ArgM-TMP Usually] [ Arg0 John] agrees [ Arg2 with Mary] [ Arg1 o]
  (19.12) fall.01 
        Arg1: Logical subject, patient, thing falling
        Arg2: Extent, amount fallen
        Arg3: start point
        Arg4: end point, end state of arg1
        Ex1: [ Arg1 Sales] fell [ Arg4 to $25 million] [ Arg3 from $27 million].
        Ex2: [ Arg1 The average junk bond] fell [ Arg2 by 4.2%].
    * Note that there is no Arg0 role for fall,
      because the normal subject of fall is a proto-pat
* The PropBank semantic roles can be useful in recovering shallow semantic info
  * eg _increase_
  (19.13) increase.01 “go up incrementally” 
        Arg0: causer of increase 
        Arg1: thing increasing 
        Arg2: amount increased by, EXT, or MNR 
        Arg3: start point 
        Arg4: end point
* A PropBank semantic role labeling would allow us to
  infer the commonality in the event structures of the following three examples,
  * in each case Big Fruit Co. is the AGENT and the price of bananas is THEME ,
    (19.14) [ Arg0 Big Fruit Co. ] increased [ Arg1 the price of bananas].
    (19.15) [ Arg1 The price of bananas] was increased again [ Arg0 by Big Frui]
    (19.16) [ Arg1 The price of bananas] increased [ Arg2 5%].
* non-numbered arguments called ArgMs, (ArgM-TMP, ArgM-LOC, etc.) which
  * modification or adjunct meanings. These are
  * relatively stable across predicates, so aren’t listed with each frame file.
  * Data labeled with these modifiers can be helpful in training systems to
    detect temporal, location, or directional modification across predicates.
    TMPq	when?
    LOCq	where?
    DIRq	where to/from?
    MNRq	how?
    PRP/CAUq	why?
    REC   eg themselves, each other
    ADVq	miscellaneous
    PRDq	secondary predication
* NomBank (Meyers+ 2004) adds annotations to noun predicates
  * _Apple’s agreement with IBM_ would be labeled with Apple as the Arg0 and IBM

## 19.5 FrameNet

* make inferences in many more situations, across different verbs, and also
  between verbs and nouns
  * eg extract the similarity among these three sentences:
    (19.17) [ Arg1 The price of bananas] increased [ Arg2 5%].
    (19.18) [ Arg1 The price of bananas] rose [ Arg2 5%].
    (19.19) There has been a [ Arg2 5%] rise [ Arg1 in the price of bananas].
  * the second example uses the different verb rise, and the
    third example uses the noun rather than the verb rise. We’d like a system to
* The FrameNet project is another semantic-role-labeling project that attempts
  (Baker+ 1998, Fillmore+ 2003, Fillmore and Baker 2009, Ruppenhofer+ 2016).
  * roles in the FrameNet project are specific (not to invid V but) to a frame.
  * frame? 
    eg set of words:
    reservation, flight, travel, buy, price, cost, fare, rates, meal, plane
  * There are many individual lexical relations of hyponymy, synonymy, and so on
    between many of the words in this list. The resulting set of
  * these relations do not, however, add up to a complete account of how these
    words are related
  * They are clearly all defined with respect to a coherent chunk of
    common-sense background information concerning air travel.
  * frame = the holistic background knowledge that unites these words a frame
    (Fillmore, 1985)
  * idea is widespread in artificial intelligence and cognitive science, where
    besides frame we see related works like ac
    * model (Johnson-Laird, 1983), or even
    * script (Schank and Abelson, 1977).
* A frame in FrameNet is a background knowledge structure that defines
  * frame elements: a set of frame-specific semantic roles, called , and
  * a set of predicates that use these roles
  * Each word evokes a frame and profiles some aspect of the frame and its FEs
  * The FrameNet dataset includes a set of
    frames and frame elements, the lexical units associated with each frame, and
    a set of labeled example sentences. 
    eg `change position on a scale` frame is defined as follows:
> This frame consists of words that indicate the change of an Item’s position
> on a scale (the Attribute) from a starting point (Initial value) to an end
> point (Final value).
* semantic roles (frame elements) in the frame are defined as in Fig. 19.3. Note
  * core roles, which are frame specific, and
  * non-core roles, which are more like the Arg-M arguments in PropBank
    (time, location, etc) 
(19.20) `[_ITEM Oil] rose [_ATTRIBUTE in price] [_DIFFERENCE by 2%].`
(19.21) `[_ITEM It] has increased [_FINAL STATE to having them 1 day a month].`
(19.22) `[_ITEM Microsoft shares] fell [_FINAL VALUE to 7 5/8].`
(19.23) `[_ITEM Colon cancer incidence] fell [_DIFF by 50%] [_GROUP among men].`
(19.24) `a steady increase [_INITIAL VALUE from 9.5] [_FINAL VALUE to 14.3]
                                                           [_ITEM in dividends]`
(19.25) `a [_DIFFERENCE 5%] [_ITEM dividend] increase...`

* Core Roles 
  ATTRIBUTE     The ATTRIBUTE is a scalar property that the ITEM possesses.
  DIFFERENCE    The distance by which an ITEM changes its position on the scale.
  FINAL STATE   A description that presents the ITEM ’s state after the change in
                the ATTRIBUTE ’s value as an independent predication.
  FINAL VALUE   The position on the scale where the ITEM ends up.
  INITIAL STATE A description that presents the ITEM ’s state before the change in
                the ATTRIBUTE ’s value as an independent predication.
  INITIAL VALUE The initial position on the scale from which the ITEM moves away.  
  ITEM          The entity that has a position on the scale.  
  VALUE RANGE   A portion of the scale, typically identified by its end points,
                along which the values of the ATTRIBUTE fluctuate.
* Some Non-Core Roles
  DURATION The length of time over which the change takes place.  
  SPEED The rate of change of the VALUE .
  GROUP The GROUP in which an ITEM changes the value of an ATTRIBUTE in a specified way.
* words 
  VERBS: advance climb decline decrease diminish dip double drop dwindle edge..
  NOUNS: decline decrease escalation explosion fall fluctuation gain growth hike..
  ADVERBS: increasingly
* codes relationships between frames,
  * allowing frames to inherit from each other, or representing relations between
  * or eg causation
  * generalizations among frame elements in different frames can be representing
    by inheritance as well)
  * Thus, there is a Cause change of position on a scale frame that is
    linked to the Change of position on a scale frame by the cause relation, but
  * Cause... adds an AGENT role and is used for causative examples such as the
    (19.26) [_AGENT They] raised [_ITEM the price of their soda] [_DIFF by 2%].
  * would allow an understanding system to extract the common event semantics of
    all the verbal and nominal causative and non-causative usages.
* FrameNets have also been developed for many other languages including
  Spanish, German, Japanese, Portuguese, Italian, and Chinese

## 19.6 Semantic Role Labeling

* automatically finding the sem roles of each argument of each pred in a sent
* Current approaches are based on supervised machine learning,
  * often using the FrameNet and PropBank resources to specify
    what counts as a predicate, define the set of roles used in the task, and
    provide training and test sets
  * FrameNet (19.27) employs many frame-specific frame elements as roles, while
  * PropBank (19.28) uses a smaller number of numbered argument labels that can
    be interpreted as verb-specific labels, along with the more general ARGM
    labels. Some examples:
  (19.27)
  [You] can’t [blame] [the program] [for being unable to identify it]
  COGNIZER    TARGET  EVALUEE       REASON
  [The San Francisco Examiner] issued [a special edition] [yesterday]
  ARG 0                        TARGET ARG 1               ARGM-TMP

### 19.6.1 A Feature-based Algorithm for Semantic Role Labeling

* Feature-based algorithms—from the very earliest systems like (Simmons, 1973)—
  * begin by parsing, using broad-coverage parsers to assign a parse to the input string.
  * The parse is then traversed to find all words that are predicates.
  * For each of these predicates,
    the algorithm examines each node in the parse tree and uses
    supervised classification to decide the semantic role (if any) it plays for
  * training set such as PropBank or FrameNet
  * a feature vector is extracted for each node, using
    * feature templates described in the next subsection
  * A 1-of-N classifier is then trained to predict a semantic role for each
    * N is the number of potential semantic roles plus an extra NONE role for no
    * Any standard classification algorithms can be used
* task can be broken down into multiple steps:
  1. Pruning: Since only a small number of the constituents are arguments of any
    * simple heuristics to prune unlikely constituents.
  2. Identification: a binary classification of each node as an arg or a NONE
  3. Classification: a 1-of-N classification of all the args
  * may lead to
    * better use of features (different features may be useful for the 2 tasks)
    * computational efficiency

#### Global Optimization

* The classification algorithm above classifies each argument separately (‘loc')
  * simplifying assumption; each argument of a predicate labeled independently.
    * This assumption is false; there are interactions between arguments that
    * eg constituents in FrameNet and PropBank are non-overlapping. More
    * PropBank does not allow multiple identical arguments; two constituents of
* add a fourth step to deal with global consistency across the labels in a
  * local classifiers can return a list of possible labels associated with probs
  * a second-pass Viterbi decoding or re-ranking approach can be used to choose
  * Integer linear programming (ILP) is another common way to choose a solution

#### Features for Semantic Role Labeling

* Most systems use some generalization of the core set of features introduced by
  Gildea and Jurafsky (2000). Common basic features templates (demonstrated on
  the NP-SBJ constituent The San Francisco Examiner in Fig. 19.5) include:
  * The governing predicate, in this case the verb _issued_. The predicate is a
    crucial feature since labels are defined only with respect to a partic pred
  * The phrase type of the constituent, in this case, NP (or NP-SBJ).
    * Some semantic roles tend to appear as NPs, others as S or PP, and so on.
  * The headword of the constituent, _Examiner_
    * can be computed with standard head rules, eg those given in Chapter 12 in
    * Certain headwords (e.g., pronouns) place strong constraints on their role
  * The headword part of speech of the constituent, NNP.
  * The path in the parse tree from the constituent to the predicate. This path
    * Following Gildea and Jurafsky (2000), we can use a simple
      linear representation of the path, NP↑S↓VP↓VBD.  ↑ and ↓ represent upward
    * a compact representation of many kinds of grammatical function
      relationships between the constituent and the predicate.
  * The voice of the clause in which the constituent appears, in this case, acti
  * The binary linear position of the constituent with respect to the predicate,
    either before or after.
  * The subcategorization of the predicate,
    the set of expected arguments that appear in the verb phrase
    * We can extract this information 
      from the phrasestructure rule that expands the immediate parent of pred;
      VP → VBD NP PP for the predicate in Fig. 19.5.
  * The named entity type of the constituent.
  * The first words and the last word of the constituent.
* Other features are often used in addition, such as
  sets of n-grams inside the constituent, or
  more complex versions of the path features (the upward or downward halves, or
  whether particular nodes occur in the path).
* dependency parses instead of constituency parses as the basis of features, 
  eg using dependency parse paths instead of constituency paths.

### 19.6.2 A Neural Algorithm for Semantic Role Labeling

* as a sequence labeling task like namedentity recognition, using the BIO
* Let’s assume that we are given the predicate and
  the task is just detecting and labeling spans. Recall that with
  * BIO tagging, we have a begin and end tag for each possible role (B ARG 0)
    plus an outside tag O
* The input sentence is followed by [SEP] and an extra input for the predicate,
  * outputs are concatenated to an indicator variable which is 1 for the
    predicate and 0 for all other words
    * After He+ (2017) and Shi and Lin (2019).
* As with all the taggers, the goal is to compute the highest prob tag seq ŷ,
  `ŷ = argmax_{y∈T} P(y|w)`
* a standard algorithm from He+ (2017). Here
  * each input word is mapped to pretrained embeddings, and then
  * each token is concatenated with the predicate embedding and then
    passed through a feedforward network with a softmax which
    outputs a distribution over each SRL label. 
  * decoding, a CRF layer __can__ be used instead of the MLP layer
    on top of the biLSTM output to do global inference, 
    * hE, in practice this doesn’t seem to provide much benefit

### 19.6.3 Evaluation of Semantic Role Labeling

* standard is to require that each argument label must be
  assigned to the exactly correct word sequence or parse constituent, and
  then compute precision, recall, and F-measure
* Identification and classification can also be evaluated separately
* Two common datasets used for evaluation are
  CoNLL-2005 (Carreras and Màrquez, 2005) and CoNLL-2012 (Pradhan+ 2013)

## 19.7 Selectional Restrictions

* another way to represent the relationship between predicates and arguments. A
* selectional restriction is
  a semantic type constraint that a verb imposes on the kind of concepts that
  are allowed to fill its argument roles. Consider the two meanings associated
  (19.29) I want to eat someplace nearby.
  * two possible parses and semantic interpretations for this sentence. In the
    * sensible interpretation, eat is intransitive and 
      _someplace nearby_ is an adjunct that gives the location of the eating
    * speaker-as-Godzilla interpretation, eat is transitive and 
      _someplace nearby_ is the direct object and the THEME of the eating, like
* Selectional restrictions are associated with senses, not entire lexemes. We
  (19.31) The restaurant serves green-lipped mussels.
    `szolgálnak fel` offer food
  (19.32) Which airlines serve Denver?
    `kínál járatokat -bAn`, provides a commercial service (somewhere)
* Selectional restrictions vary widely in their specificity. The verb 
  eg _imagine_:
    * strict requirements on its AGENT role (animate)
    * very few semantic requirements on its THEME role. A verb like
  * diagonalize, on the other hand, places a
    * very specific constraint on the filler of its THEME role: it has to be mx
  * _odorless_ are restricted to concepts that could possess an odor: (19.33) In
* the set of concepts we need to represent selectional restrictions (being a
  matrix, being able to possess an odor, etc) is quite open ended.
* This distinguishes selectional restrictions from other lexical features 
  like parts-of-speech, which are quite limited in number

### 19.7.1 Representing Selectional Restrictions

* extend the event representation of Chapter 15
  * the neo-Davidsonian representation of an event consists of
    a single variable that stands for the event,
    a predicate denoting the kind of event, and
    variables and relations for the event roles
  * Ignoring the issue of the λ -structures and
    using thematic roles rather than deep event roles,
    the semantic contribution of a verb like eat might look like the following:
    ∃e, x, y Eating(e) ∧ Agent(e, x) ∧ T heme(e, y)
* To stipulate the selectional restriction that y must be something edible, we
  * add a new term to that effect: ∃e, x, y Eating(e) ∧ ... ∧ EdibleT hing(y)
  * When a phrase like ate a hamburger is encountered: ∧= Hamburger(y)
  * membership of y in the category EdibleThing and Hamburger is consistent
    * assuming a reasonable set of facts in the knowledge base.
  * the representation for a phrase such as _ate a takeoff_ would be ill-formed
    * takeoff is event-like, inconsistent with membership in EdibleThing.
* two problems with its direct use. First, using
  * FOL to perform the simple task of enforcing selectional restrictions is
    overkill (computational cost) The second problem is that this approach
  * presupposes a large, logical knowledge base of facts about the concepts  
    * such common-sense knowledge bases are being developed,
      none currently have the kind of coverage necessary to the task 
* Evidence from WordNet that hamburgers are edible.
  Sense 1 hamburger, beefburger --
  (a fried cake of minced beef served on a bun)
  => sandwich => snack food => dish => nutriment, nourishment, nutrition, ...  =>
  food, nutrient => substance => matter => physical entity => entity
* WordNet synsets offer A more practical approach to state selectional restricts
  * Each predicate simply specifies a WordNet synset as the
    selectional restriction on each of its arguments
  * A meaning representation is well-formed
    if the role filler word is a hyponym (subordinate) of this synset.
* eg _ate a hamburger_ example, for instance, we could set the selectional
  * THEME role of the verb eat to the synset {food, nutrient}, glossed as any
  * chain of hypernyms shown in Fig.  19.7 reveals that hamburgers are food.
* We can apply this approach to the THEME roles of the verbs imagine, lift, and
  * imagine’s THEME to the synset {entity}, lift’s THEME to {physical entity},
  * diagonalize to {matrix}. This arrangement correctly permits imagine a

### 19.7.2 Selectional Preferences

* In the earliest implementations,
  selectional restrictions were strict constra (Katz and Fodor 1963, Hirst 1987)
  eg _eat_ might require that its THEME argument be [+FOOD]
  * Early word sense disambiguation systems used this idea to rule out senses
    that violated the selectional restrictions of their governing predicates.
* Very quickly, however, it became clear that these
  selectional restrictions were better represented as preferences 
  (Wilks 1975b, Wilks 1975a)
  * selectional restriction violations  often occur in well-formed sentences,
    eg because
    they are negated (19.36), or because selectional restrictions are overstated
(19.36) But it fell apart in 1931, perhaps because people realized you can’t eat
  gold for lunch if you’re hungry.
(19.37) In his two championship trials, Mr. Kulkarni ate glass on an empty
  stomach, accompanied only by water and tea.

#### Selectional Association

* One of the most influential models for ~ is by Resnik (1993)
  * selectional preference strength as
    the general amount of information that a predicate tells us about the
    semantic class of its arguments
  * eg _eat_ tells us a lot about the semantic class of its direct objects,
    * _be_, by contrast, tells us less about its direct objects. The selectional
  := the difference in information between the distributions P(c) and P(c|v)
    c = semantic classes P(c) (how likely is it that DO \in c)
    * can be quantified by relative entropy = the Kullback-Leibler div D(P||Q)
      (Kullback and Leibler, 1951).
  `D(P||Q) = \sum P(x) log_2 P(x)/Q(x)` (19.38)
* `\sum_c`
  * The selectional preference S R (v) uses the KL divergence to express
    how much information, in bits, the verb v expresses
    about the possible semantic class of its argument.
    S_R(v) = D(P(c|v)||P(c)) = \sum_c P(c|v) \log P(c|v)/P(c)
* the selectional association of a particular class and verb as
  the relative contribution of that class to the general selectional preference
  of the verb:
  A R (v, c) = 1/S_R(v) P(c|v) \log P(c|v)/P(c) (19.40)
* estimates the probabilities for these associations by parsing a corpus,
  * counting all the times each predicate occurs with each argument word, and
    assuming that each arg word is a partial observation of all the WordNet
    concepts containing the word
* The following table from Resnik (1996) shows some sample high and low
  selectional associations for verbs and
  some WordNet semantic classes of their direct objects.

#### Selectional Preference via Conditional Probability

* the conditional probability of an argument word given a predicate verb,
  directly modeling the strength of association of one verb (predicate) with one
  noun (argument).
  * can be computed by parsing a very large corpus (billions of words), and
  * how often a given verb occurs with a given noun __in a given relation__
    probability P(n|v, r) (Brockmann and Lapata 2003, Keller and Lapata 2003)
* The inverse probability P(v|n, r) was found to have better performance
  in some cases (Brockmann and Lapata, 2003):
* An even simpler approach is to use the simple
  log co-occurrence frequency of the predicate with the argument
  log count(v, n, r) instead of conditional probability; this seems to do
  * better for extracting preferences for syntactic subjects rather than objects
    (Brockmann and Lapata, 2003)

#### Evaluating Selectional Preferences

* pseudowords (Gale+ 1992, Schütze 1992). A pseudoword is an artificial word
  * created by concatenating a test word in some context (say banana) with a
    confounder word (say door) to create banana-door)
  * The task of the system is to identify which of the two words is the original
  * eg eval  on the relationship between a verb and a direct object
  * we take a test corpus and select all verb tokens
  * For each verb token (say drive) we select the direct object (e.g., car),
    concatenated with a confounder word the noun with the frequency closest to
    the original (say house), to make car/house).
  * selectional preference model to choose which of car and house are more prefd
    (Chambers and Jurafsky, 2010)
* alter: human preferences for a test set of verb-argument pairs, and
  have them rate their degree of plausibility. This is
  * usually done by using magnitude estimation, a technique from psychophysics,
    * subjects rate the plausibility of an argument proportional to a modulus
      item
  * selectional preference model can then be evaluated by its correlation with
    the human preferences (Keller and Lapata, 2003)

## 19.8 Primitive Decomposition of Predicates

* One way of thinking about the semantic roles is that
  they help us define the roles that arguments play in a decompositional way,
  based on finite lists of thematic roles (agent, patient, instrument,
  proto-agent, protopatient, etc.)
* This idea of
  decomposing meaning into sets of primitive semantic elements or features,
  called primitive decomposition or componential analysis, has
  focused particularly on predicates.
  (19.41) Jim killed his philodendron.
  (19.42) Jim did something to cause his philodendron to become not alive.
* truth-conditional (‘propositional semantics’) perspective from which
  these two sentences have the same meaning
  * represent the meaning of kill as:
  (19.43) KILL (x,y) ⇔ CAUSE (x, BECOME ( NOT ( ALIVE (y))))
  * using semantic primitives like do, cause, become not, and alive.
* one such set of potential semantic primitives has been used
  to account for some of the verbal alternations discussed in Section 19.2
  (Lakoff 1965, Dowty 1979)
  (19.44) John opened the door. ⇒ CAUSE (John, BECOME ( OPEN (door)))
  (19.45) The door opened. ⇒ BECOME ( OPEN (door))
  (19.46) The door is open. ⇒ OPEN (door)
* asserts that
  a single state-like predicate associated with _open_ underlies all of these ex
  * meaning differences arises from the combination with CAUSE and BECOME .
* can explain the similarity between
  states and actions or causative and non-causative predicates, it
  still relies on having a large number of predicates like _open_
* More radical approaches choose to break down _open_ as well. One such approach
* verbal predicate decomposition that
  * played a role in early natural language systems is
  * conceptual dependency (CD), a set of
  * ten primitive predicates, shown in Fig. 19.8.  
  A TRANS The abstract transfer of possession or control from one entity to anot
  P TRANS The physical transfer of an object from one location to another
  M TRANS The transfer of mental concepts between entities or within an entity
  M BUILD The creation of new information within an entity
  PROPEL  The application of physical force to move an object
  MOVE    The integral movement of a body part by an animal
  INGEST  The taking in of a substance by an animal
  EXPEL   The expulsion of something from an animal
  SPEAK   The action of producing a sound
  ATTEND  The action of focusing a sense organ
* eg _brought_ is translated into the two primitives ATRANS and PTRANS to
  (19.47) The waiter brought Mary the check.18
  * the waiter 
    physically conveyed the check to Mary and passed control of it to her
  * also associates a fixed set of thematic roles with each primitive to
    represent the various participants in the action.
  ∃x, y Atrans(x) ∧ Actor(x,Waiter) ∧ Object(x,Check) ∧ To(x, Mary) ∧
        Ptrans(y) ∧ Actor(y,Waiter) ∧ Object(y,Check) ∧ To(y, Mary)

## 19.9 Summary

## Bibliographical and Historical Notes

* Although the idea of semantic roles dates back to Pān.ini, they were
  re-introduced into modern linguistics by
  Gruber (1965), Fillmore (1966) and Fillmore (1968)
  * Fillmore had become interested in argument structure by studying
    Lucien Tesnière’s groundbreaking Éléments de Syntaxe Structurale (1959) in
    * the term ‘dependency’ was introduced and
      the foundations were laid for dependency grammar. Following Tesnière’s
    * first referred to argument roles as actants (Fillmore, 1966) but
      quickly switched to the term case, (see Fillmore (2003)) and
      proposed a universal list of semantic roles or cases
      (Agent, Patient, Instrument, etc.), that could be taken on by the args of
      Verbs would be listed in the lexicon with their
      case frame, the list of obligatory (or optional) case arguments.
* The idea that semantic roles could provide an intermediate level of sem repr
  * could help map from syntactic parse structures to
    deeper, more fully-specified representations of meaning was
    quickly adopted in natural language processing, and
    systems for extracting case frames were created for
    machine translation (Wilks, 1973)
    * question-answering (Hendrix+ 1973)
    * spoken-language processing (Nash-Webber, 1975)
    * dialogue systems (Bobrow+ 1977)
* General-purpose semantic role labelers were developed
  * The earliest ones (Simmons, 1973)
    first parsed a sentence by means of an Augmented Transition Network parser.  
    * Each verb then had a set of rules specifying
      how the parse should be mapped to semantic roles
    * mainly made reference to grammatical functions (subject, object,
      complement of specific prepositions) but
    * also checked constituent internal features such as the animacy of head Ns
  * Later systems assigned roles from prebuilt parse trees, again by using
    dictionaries with verb-specific case frames (Levin 1977, Marcus 1980).
  * By 1977 case representation was widely used and taught in AI and NLP courses
    * described as a standard of natural language processing in the first
      edition of Winston’s 1977 textbook Artificial Intelligence.
* In the 1980s Fillmore proposed his model of frame semantics,
  later (2012) describing the intuition as follows: “The idea behind frame sem
  * speakers are aware of possibly quite complex situation types, packages of
    connected expectations, that
    go by various names—frames, schemas, scenarios, scripts, cultural
    narratives, memes—and the
  * words are understood with such frames as their presupposed background.”
  * The word frame seemed to be in the air for
    a suite of related notions proposed at about the same time
    by Minsky (1974), Hymes (1974), and Goffman (1974), as well as
  * related notions with other names like scripts (Schank and Abelson, 1975) and
    schemata (Bobrow and Norman, 1975) (see Tannen (1979) for a comparison).
* Fillmore was also influenced by the
  semantic field theorists and by a visit to the Yale AI lab where he took
  * lists of slots and fillers used by early information extraction systems like
    DeJong (1982) and Schank and Abelson (1977)
  * In the 1990s Fillmore drew on these insights to begin the FrameNet corpus
    annotation project.  
  At the same time
* Beth Levin drew on her early case frame dictionaries (Levin, 1977) to 
  * her book summarized sets of verb classes defined by shared argument real
    (Levin, 1993)
  * The VerbNet project built on this work (Kipper+ 2000), leading to the
    PropBank semantic-role-labeled corpus created by Palmer+ (2005).
* The combination of rich linguistic annotation and corpus-based approach in-
  stantiated in FrameNet and PropBank led to a revival of automatic SRL
  * on FrameNet (Gildea and Jurafsky, 2000) and then
  * on PropBank data (Gildea and Palmer, 2002, inter alia)
  * recast as one of supervised machine learning enabled by large and consis DBs
  * Many popular features used for role labeling are defined in
    Gildea and Jurafsky (2002), Surdeanu+ (2003), Xue and Palmer (2004),
    Pradhan+ (2005), Che+ (2009), and Zhao+ (2009)
  * dependency rather than constituency parses was
    introduced in the CoNLL-2008 shared task (Surdeanu+ 2008)
    * For surveys see Palmer+ (2010) and Màrquez+ (2008).
* neural approaches to semantic role labeling was pioneered by Collobert+ (2011)
  * a CRF on top of a convolutional net
  * Early work like Foland, Jr. and Martin (2015) focused on dependency features
  * Later work eschewed [avoid] syntactic features altogether
  * Zhou and Xu (2015) introduced the use of a stacked (6-8 layer) biLSTM
  * (He+ 2017) augment the biLSTM architecture with highway networks and also
    replace the CRF with A* decoding that
    make it possible to apply a wide variety of global constraints in SRL decod
* verbal or nominal predicate may have an implicit argument: one that
  appears only in a contextual sentence, or perhaps not at all and must be
  inferred
  eg _This house has a new owner. The __sale__ was finalized 10 days ago_ 
           ARG1
  * implicit argument detection (sometimes shortened as iSRL) was
  * introduced by Gerber and Chai (2010) and Ruppenhofer+ (2010)
  * See Do+ (2017) for more recent neural models.
* unsupervised approaches for semantic role labeling attempt to
  induce the set of semantic roles by clustering over arguments. The task was
  * pioneered by Riloff and Schmelzenbach (1998) and Swier and Stevenson (2004);
  * Grenager and Manning (2006), Titov and Klementiev (2012),
    Lang & Lapata (2014), Woodsend & Lapata (2015), & Titov & Khoddam (2014).
* connotation frames, which mark richer information about the argument 
  * mark the sentiment of the writer or reader toward the arguments (for example
  * eg survive: sympathy toward the subject he and negative sentiment to bombing
    * See Chapter 20 for more details.
* Selectional preference has been
  * widely studied beyond the selectional association models of Resnik (93, 96)
  * Methods have included clustering (Rooth+ 1999)
    * discriminative learning (Bergsma+ 2007)
    * topic models (Séaghdha 2010, Ritter+ 2010)
  * constraints can be expressed at the level of words or classes
    (Agirre and Martinez, 2001). Selectional preferences have also been
  * integrated into semantic role labeling (Erk 2007, Zapirain+ 2013, Do+ 2017)
