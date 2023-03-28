A theory of lexical access in speech production
Willem J. M. Levelt, Ardi Roelofs, and Antje S. Meyer
BEHAVIORAL AND BRAIN SCIENCES (1999) 22, 1–75

#Abstract

* A comprehensive review of theory, model, and experiments is presented. The
* Preparing words in speech production is normally a fast and accurate process
  * We generate them two or three per second in fluent conversation; and
  * naming a clear picture of an object can easily be initiated within 600 msec
* The theory reviewed in this target article analyzes this
  process as staged and feedforward
  stages: conceptual preparation, through lexical selection, morphological and
  phonological encoding, phonetic encoding, and articulation itself
* In addition, the speaker exerts some degree of output control, by monitoring
* The core of the theory,
  ranging from lexical selection to the initiation of phonetic encoding, is
* computational model, called weaver++
* developed in interaction with reaction time experiments, particularly in
  picture naming or related word production paradigms, with the aim of
* handle some of the main observations in the domain of speech errors
* the theory opens new ways of approaching the cerebral organization of
  speech production by way of high-temporal-resolution imaging

# 1. An [aquisitional] introduction

* language aquisition: two basic ingredients of word production. On the one
  * notions of agency, interactancy, the temporal and causal structures of
    events, object permanence and location
    * first lexical concepts, concepts flagged by way of a verbal label
  * a repertoire of babbles, a set of syllabic articulatory gestures. These
    * around the seventh month
    * The child carefully attends to their acoustic manifestations
      * exercises in the repetition and concatenation of these syllabic patterns
      * more tuned to the mother tongue
        (De Boysson-Bardies & Vihman 1991; Elbers 1982)
      * protosyllabary, a core repository of speech motor patterns, meaningless
* connecting some particular babble to some particular lexical concept. The
  privileged babble auditorily resembles the word label
  * coupling of two initially independent systems: conceptual & articulatory mot
  * duality is never lost in the further maturation of our word production
* Between the ages of 1;6 and 2;6 the explosive growth of the lexicon
  * phonemization; words become generatively represented as concatenations of
    phonological segments (Elbers & Wijnen 1992; C. Levelt 1994)
  * words as a pattern of phonemes and as a metrical pattern. This more abstract
* [first] multiword sentences: word order is entirely dictated by semantics,
  * One popular choice is “agent first”; another one is “location last.”
  * by the age of 2;6, increasingly complicated semantic structures
  * system of lexical concepts restructured by a process of syntactization
    * Lexical concepts acquire syntactic category and subcategorization features
    * verbs: how their semantic arguments (such as agent or recipient) are to be
      mapped onto syntactic relations (such as subject or object)
    * nouns: syntactic agreement, such as gender, and so forth
    * closed class vocabulary, a relatively small set of frequently used func
  * by the age of 4 years
  * producing a word always involves the selection of the appropriate lemma
* four-tiered processing device: from a lexical concept to its lemma,
  phonological code and phonetic-articulatory gesture
* still reflects the original duality in ontogenesis
* apparent from e.g. the tip-of-the-tongue state (Levelt 1993)

# 2. Scope of the theory

* In the following, we will
  * this word producing system as we conceive it
  * four levels of processing involved in the theory:
    * the activation of lexical concepts
    * the selection of lemmas
    * the morphological and phonological encoding of a word in its prosodic context
    * the word’s phonetic encoding
* not cover the word’s articulation. Its domain extends no further than the
* being extended to lexical access in various syntactic contexts (Meyer 1996)
  the present paper is limited to the production of isolated prosodic words
* pioneers of word production research:
  Vicky Fromkin, Merrill Garrett, Stephanie Shattuck-Hufnagel, and Gary Dell
  * see Levelt (1989) for a comprehensive and therefore more balanced review of
    modern contributions to the theory of lexical access
  * difference:
    * classical: basing on speech errors, spontaneous or induced,
    * we: reaction time (RT) research. We believed this to be a necessary
    * test cannot lie in how they account for infrequent derailments of the
      process but rather must lie in how they deal with the normal process
    * object naming: 1/4 of an adult’s lexicon consists of names for objects
    * an ideal procedure for analyzing the time course of a mental process
* RT studies of word production began with the seminal studies of Oldfield and
* error patterns as well as for production latencies. First efforts in that
  direction will be discussed in section 10
* we do not claim completeness: tentative to closed class words
* the theory generates new, nontrivial, but testable predictions
* we will indicate such possible extensions when appropriate

# 3. The theory in outline 3

## 3.1. Processing stages

* Each stage produces its own characteristic output representation. These are,
  respectively, lexical concepts, lemmas, morphemes, phonological words, and
  phonetic gestural scores (which are executed during articulation)
* whether these stages overlap in time or are strictly sequential
  * In the following it will be a recurring issue

### 3.1.1. Conceptual preparation. All open class words and most closed class

* “female elephant,”: there is no unitary lexical concept available
* no one-to-one mapping of notions onto messages (Bierwisch & Schreuder 1992)
* there are multiple ways to refer to the same object
  * e.g. “animal,” “horse,” “mare,” [kanca]. This is called perspective taking
  * mediated by
    * pragmatic, context-dependent considerations
    * semantic causes of activation modeled by way of a conceptual network
      (Roelofs 1992a; 1992b), to which we will return in sections 3.2 and 4.1
* The top level in Figure 2 represents a fragment of this network
  * concept node, escort(x, y), which stands for the meaning of the verb
  * links to other concept nodes, such as accompany (x, y)
  * links are labeled, in this case, `is-to`
  * concepts will spread their activation via such links to semantically related
  * SA is at the core of our theory of lexical selection, as developed by
    Roelofs (1992a)
* nondecompositional character: Lexical concepts are not represented by sets of
  semantic features because that creates a host of counterintuitive problems
  * hyperonym problem.  When a word’s semantic features are active, then the
    feature sets for all of its hyperonyms or superordinates are active. Still,
    * no evidence that speakers tend to produce hyperonyms of intended target
  * no semantic complexity effect
    * words with more complex feature sets are not harder to access
* activation is also measurably sensitive to the auditory or visual word input
  * exploited in many of our experiments with a visual or auditory distractor
* Finally, Dennett (1991) suggested a pandemonium-like spontaneous activation of
  words in the speaker’s mind.
  * Although not modeled yet, there are three ways to implement such a mechanism
    * add spontaneous, statistical activation to lexical concepts
    * do the same at the level of lemmas, whose activation can be spread back to
    * spontaneous activation of word forms; their resulting morphophonological
      encoding would then feed back as internal speech and activate the concepts

### 3.1.2. Lexical selection

* retrieving a word, or more specifically a lemma, from the mental lexicon,
  given a lexical concept to be expressed
* two or three words per second from a lexicon that contains tens of thousands
  * errors of lexical selection occur in the one per one thousand range
* Roelofs (1992a) modeled this process by attaching a layer of lemma nodes to
  * one lemma node for each lexical concept.  An active lexical
  * concept spreads some of its activation to “its” lemma node, and
  * lemma selection is a statistical mechanism, favors the highest activated
  * theory does allow for the selection of function words on purely syntactic
  * retrieving the lemma `escort` will make available that this is a transitive
    verb [node V t (x, y)] with two argument positions (x and y),
* Many lemmas have so-called diacritic parameters that have to be set
  * e.g. features for number, person, tense, and mood (see Fig. 2)
  * values of these features will in part derive from the
    * conceptual representation
      * tense: the relevant temporal properties of the state of affairs being
      * need not have any communicative function.  Still, this extra bit of
    * grammatical encoding.  A verb’s number feature is set by agreement
      (see Bock & Levelt 1994; Bock & Miller 1991; and Levelt 1989 for details)

## 3.2. General design properties 6

##3.2.1. Network structure

* an essentially feedforward activation-spreading network
* Roelofs (1992a; 1993; 1994; 1996a; 1996b; 1997c) instantiated the basic
  assumptions of the theory in a computational model that covers the stages from
  lexical selection to syllabary access. the full model is called weaver++
* weaver++ integrates
  a spreading–activation-based network with a parallel
  object-oriented production system,
  in the tradition of Collins and Loftus (1975)
* three strata of nodes in the network
  * conceptual stratum: concept nodes and labeled conceptual links
    * A subset of these concepts consists of lexical concepts
      * have links to lemma nodes in the next stratum
    * nodes: Each lexical concept is represented by an independent node
    * links specify conceptual relations, for example, between a concept and its
      superordinates, such as is-to-accompany(x, y)
    * A word’s sense: the total of the lexical concept’s labeled links to others
    * conceptual stratum is highly specific to this model,
    * no deep ontological claims about “network semantics” are intended
    * active, nondecomposed lexical concepts
  * lemma nodes, such as escort;
    * syntactic property nodes, such as V t (x, y); and labeled links in between
    * content word or function word, is represented by a lemma node
    * syntax is represented by the labeled links from lemma to the syntax nodes
    * Lemma nodes have diacritics, which are slots for the specification of free
      * person, number, mood, or tense, that are
        valued during the process of grammatical encoding
      * More generally, the lemma stratum is linked to a set of procedures for
        grammatical encoding (not discussed herein)
  * word-form stratum: morpheme nodes and segment nodes
    * Each morpheme node is linked to the relevant segment nodes
    * links to segments are numbered (see Fig. 2)
    * segments linked to escort are also involved in the spellout of other word
    * links between segments and syllable program nodes: possible syllabificat
      * prosody, the stress pattern across syllables. Related to this
      * procedures that generate a phonological word’s syllabification, given
* What is a “lexical entry” in this network structure?
  * an item in the mental lexicon, consisting of a lemma, its lexical concept
    (if any), and its morphemes (one or more) with their segmental and metrical
    properties

##3.2.2. Competition but no inhibition

* no inhibitory links in the network, either within or between strata
* the state of activation of nontarget nodes does affect the latency of target
  node selection, following a simple mathematical rule (see Appendix)

##3.2.3. Binding

* [i.e. melyik hova?]
* e.g.
  * _Pages escort kings_, at some time the lemmas page and king will be
    * prevent the speaker from erroneously producing Kings escort pages? The
  * Similarly the segments of the word forms ⬍king⬎ and ⬍page⬎ are spelled out
    * How to prevent the speaker from erroneously producing Cages escort pings?
* In most existing models of word access (in particular Dell 1988 and + 1993),
  the binding problem is solved by timing
  * the “intended” element is the most activated one at the crucial moment
* Our solution (Roelofs 1992a; 1993; 1996b; 1997c) is a different one
  * follows Bobrow and Winograd’s (1977) “procedural attachment to nodes”
  * Each node has a procedure attached to it that checks whether the node, when
    active, links up to the appropriate active node one level up
  * We will call this “binding-by-checking” as opposed to “binding-by-timing.”
  * A major reason for implementing binding-by-checking is the recurrent finding
    * during picture naming, distractor stimuli hardly ever induce speech errors
      When the speaker names the picture of a king, and simultaneously hears the
      distractor word page, he or she will produce
      neither the semantic error page, nor the phonological error ping, although
      * more easily handled by binding-by-checking than binding-by-timing

##3.2.4. Relations to the speech perception network

* traditionally an important issue in speech and language processing
  (Liberman 1996): Are words produced and perceived by the same mechanism?
* feedforward assumption for our form stratum implies that form perception and
  production cannot be achieved by the same network
* some technical, though realistic, assumptions about the way in which
  distractor stimuli affect our production network (Roelofs+ 1996). They are as

##3.2.5. Ockham’s razor. Both the design of our theory and the computational

* neither parallel processing nor feedback between lexical selection and form
* no free cascading of activation through the lexical network; there are
* no inhibitory connections in the network; weaver++’s few parameters were fixed
* We wanted theory and model to be maximally vulnerable. For a theory to be

# 4. Conceptual preparation 8

## 4.1. Lexical concepts as output

* the terminal vocabulary [i.e. the inventory of lexical concepts] is, to some
  extent, language specific (Levelt 1989; Slobin 1987). From lifelong
* theory of lexical access is not well developed for this initial stage of
  conceptual preparation (but see sect.  4.2)
* assumptions have to be made about the output of conceptual preparation
  * Why have we opted for lexical concepts as the terminal vocabulary of
    conceptual preparation?
* classical and controversial issue whether the terminal conceptual vocabulary
  is a set of lexical concepts or the set of primitive conceptual features
  * explicitly the intended lexical concepts (see Fodor+ 1980) <~ we
  * primitive conceptual features that make up these concepts
    (see, e.g., Bierwisch & Schreuder 1992; Goldman 1975;
    Miller & Johnson-Laird 1976; Morton 1969)
* theoretical and empirical arguments for this assumption of chunked retrieval
  * reviewed extensively (Roelofs 1992b; 1993; 1996a; and, especially, 1997a)
  * Any representation makes some information explicit at the expense of
    information that is left in the background.
  * chunks prevent the hyperonym problem from arising (see Roelofs 1996a; 1997a)

## 4.2. Perspective taking

* spatial
  * Any state of affairs can be expressed in many different ways. Take the
    e.g. _I see a chair with a ball to the left of it_ and
    _I see a chair with a ball to the right of it_ Hence one can use the
  * deictic perspective is a three-term relation between the speaker as origin,
    the relatum (chair), and the referent (ball).  However, right of results
  * “intrinsic perspective,” a two-term relation in which the relatum (chair) is
    the origin and the referent (ball) relates to the intrinsic right side of
    the referent
  * aspects of the scene and the communicative situation make the speaker opt
    for one perspective (see Levelt, 1989, 1996, for reviews and experiments)
* picture naming.  Should the object be referred to as an animal, a horse, or a
  * tacit agreement to use basic level terms (Rosch+ 1976). Whatever the

# 5. Lexical selection 9

## 5.1. Algorithm for lemma retrieval

* lemmas are retrieved in a conceptually nondecomposed way
  * escort(x, y) instead of features such as is-to-accompany(x, y)
* Retrieval starts by enhancing the level of activation of the concept node
* Activation then spreads through the network, each node sending a proportion of
* The most highly activated lemma node is selected when verification allows
* e.g. `escort` and `accompany` will be activated.  The escort node will be the
  most highly activated node, because it receives a full proportion of
  `escort(x, y)`’s activation, whereas accompany and other lemma nodes receive
  only a proportion of a proportion. Upon verification of the link between the
  lemma node of escort and escort(x, y), this lemma node will be selected. The
* function words also involves lemma selection
  * Various routes of lemma activation are open here
    * just the way described for selecting escort, because they can be used to
      express semantic content e.g.  prepositions, such as up or in
    * prepositions can also function as parts of particle verbs (as in look up,)
      * In section 5.3 we will discuss how such particles are accessed
    * as part of a syntactic procedure
    * Here we will not discuss this “indirect election” of lemmas (Levelt, 1989)
* The equations that formalize weaver++ are given by Roelofs (1992a; 1992b;)
  * Appendix gives an overview of the selection algorithm.  There are simple
    equations for the activation dynamics and the instantaneous selection
    probability of a lemma node, that is, the hazard rate of the lemma retrieval
  * idea: for any smallest time interval, given that the selection conditions
    are satisfied, the selection probability of a lemma node equals the
    ratio of its activation to that of all the other lemma nodes (Luce rat)
  * the expectation of the retrieval time can be computed

## 5.2. Empirical RT support 9

## 5.3. Accessing morphologically complex words 12

## 5.3.1. Historical morpheme boundary: re + plicate.  This is not any more

## 5.3.2. The single-lemma-multiple-morpheme case. escort+ing

## 5.3.3. The single-concept-multiple-lemma, e.g. particle verbs

* Some experimental evidence on the encoding of particle verbs will be presented
  in section 6.4.4
* idioms. The production of “kick the bucket” probably derives from activating
  a single, whole lexical concept, which in turn selects for multiple lemmas
  (Everaerd et al. 1995).

## 5.3.4. The multiple-concept case, includes all derivational new formations

* numbers. At the conceptual level the number 1,007 is probably a complex concep

## 5.3.5. Singular~ and plural-dominant nouns. In an as yet unpublished study,

* An example is “eye,” with eyes more frequent than eye
* two properties, one of them remarkable
  * small but significant longer latency for plurals than for singulars. That
    was expected, because of greater morphological complexity. The remarkable
  * plural dominant singulars and the plural dominant plurals were signif slower
* for plural dominants, there are probably two different lexical concepts
  * “eyes” has the stronger connotation of “gaze.” And similar shades of meaning
    variation exist between “ears” and “ear,” “parents” and “parent,” etc. This
* explaination
  * eye and eyes will always be coactivated, whichever is the target. As a
  * both lemmas eye and eyes will receive activation, whichever is the target
  * long selection latencies because of competition between active lemmas. This
  * nose: there is no competitor there.  In conclusion, the generation of

## 5.4. Accessing lexical syntax and the indispensability of the lemma level 14

* what evidence do we have that lemma and word form access are really distinct

## 5.4.1. Tip-of-the-tongue states. Recent evidence supporting the distinction

* Italian speakers in tip-of-thetongue states most of the time know the gender
  of the word, a crucial syntactic property in the generation of utterances
  (Vigliocco+ 1997). However, they know the form of the word only partially or
* same has been shown for an Italian anomic [aphasic] patient (Badecker+ 1995),
  * French anomic patients (Henaff Gonon+ 1989).  This shows that lemma access

## 5.4.2. Agreement in producing phrases. A further argument for the existence

* gender priming studies.  Schriefers (1993) asked Dutch participants to
  describe colored pictured objects using phrases. For example, they had to say
  de groene tafel (“the green table”) or groene tafel (“green table”). In Dutch,
* On the pictured objects, written distractor words were superimposed that were
* gender congruency effect only obtained when agreement has to be computed, that
  (Jescheniak 1994)

## 5.4.3. A short-lived frequency effect in accessing gender. A further argument

* Dutch participants had to decide on the gender of a picture’s name
* faster for highfrequency words than for low-frequency ones. The effect
* quickly disappeared over repetitions,
  contrary to a “robust” frequency effect obtained in naming the pictures
* gender and form properties of the word bear markedly different relations to
  word frequency

## 5.4.4. Lateralized readiness potentials

* participants named pictures.  On the critical trials, a gender/segment
  classification task was to be performed before naming, which made it possible
* lateralized readiness potentials (LRPs; see Coles+ 1988; Coles 1989). This
* push-button response with the left or right hand and a go–no go decision. In
  * left or right-hand response was determined by the grammatical gender of the
  * whether to carry out the response was determined by the first segment ?=b
* LRPs show whether the participants prepared for pushing the correct button not
  * When gender determined the response hand and the segment determined whether
    to respond, the LRP showed preparation for the response hand on both the go
  * reversed: LRP showed no preparation on the no-go trials
* you can access a lemma property, gender, and halt there before word form
  * reverse is not possible

## 5.4.5. [summary] Evidence from speech errors. The findings discussed so far

* A lemma level of word encoding explains semantic interference effects in the
  picture–word interference paradigm, findings on tip-of-the-tongue states,
  gender congruency effects in computing agreement, specific frequency effects
  in accessing gender information, and event related potentials in accessing
  lexical properties of picture names
* Although our theory has (mostly) been built upon such latency data, this
  section would not be complete without referring to the classical empirical
  support from speech errors
* different distribution of word and segment exchanges
  * Word exchanges, such as the exchange of _roof_ and _list_ in we completely
    forgot to add the list to the roof (from Garrett 1980), typically concern
    elements from different phrases and of the same syntactic category (here,
  * segment exchanges, such as rack pat for pack rat (from Garrett 1988),
    concern elements from the same phrase and do not respect syntactic category
* a morphological level of form encoding that is distinct from a lemma level
  with morphosyntactic parameters
  * Some morphemic errors appear to concern the lemma level, whereas others
    involve the form level (see, e.g., Dell 1986; Garrett 1975; 1980; 1988). For
  * e.g. _how many pies does it take to make an apple?_ (from Garrett 1988), the
    * plurality of apple is stranded, that is, it is realized on pie. Thus, the
    * distributional properties of these morpheme exchanges are similar to those
      of whole-word exchanges
      * occur at the same level of processing, namely, when lemmas in a
        developing syntactic structure trade places. By contrast, the exchanging
  * _slicely thinned_ (from Stemberger 1985) belong to different syntactic
    * segment exchanges. This suggests that this second type of morpheme error
    * the level at which morphemes and segments are retrieved and the
      morphophonological form of the utterance is constructed

# 6. Morphological and phonological encoding 15

# 7. Phonetic encoding 31

# 8. Articulation

# 9. Self-monitoring 33

# 10. Speech errors 34

# 11. Prospects for brain imaging 35

# 12. Conclusions 36

# Open Peer Commentary 38
