Semantic Role Labeling
Martha Palmer, Daniel Gildea, and Nianwen Xue
2010

* organization
  1. linguistic background
    definition of semantic roles and the controversies surrounding them
  2. structured lexicons such as FrameNet, VerbNet and the PropBank Frame Files
    * provide the basis for large scale semantic annotation of corpora
    * facilitated the development of automatic semantic role labeling systems
      based on supervised machine learning techniques
  3. supervised and unsupervised ML
    * feature choices
    * specific systems
    * closer integration of the syntactic parsing task
    * granularity of the semantic roles [influences] system performance
  4. other languages, using Chinese as the primary example
    * techniques for projecting English role labels onto _parallel corpora_

# Preface

* semantic relations and predicate-argument structure
* systematically defined resources for semantic structures has enabled the
  creation of large corpora annotated according to these standards, and
  automatic systems trained using the resulting data

# 1 Semantic Roles 1

## 1.1 Introduction 1

* _John threw a ball to Mary in the park_ should result in the identification of
  * a throwing event involving
  * John as the Agent or Causer of the event,
  * Mary as the Recipient and the
  * ball as the item being thrown. The
  * location of the throwing event
* linguists for decades
    * mapping from the syntactic analysis of the sentence
      to the underlying predicate argument structures
    * also known as Linking Theory
* alternations
  * John broke the window/The window broke
  * the same semantic role (or conceptual relation) in both sentences
    It would typically be labeled as the Patient,
  * does not occur with every transitive (binary) verb (see Example 2), it is
    not easily predictable
* This book ... describes the
  * motivations behind the annotations, and then it
  * techniques for developing automated systems

## 1.2 Linguistic Background 2

* Case Grammar
  * Fillmore’s seminal paper on “deep” cases as
    semantically typed verb arguments (Fillmore, 1968)
  * debate over the evidence for the existence of semantic roles
* types of nouns with different types of cases,
  Agentive and Dative roles are most likely to be of type `+animate`
* number and type of roles associated with a verb
* obligatory/optional
* linguistic tests for determining whether or not two noun phrases have the
  same case assignments. For instance, a conjunction
* If the same verb sense can have alternative role assignments that account
  for the differences between _Mother is cooking the potatoes/The potatoes are
  cooking/Mother is cooking_, then fewer [would?] types are needed for
  describing the lexicon
* _like_ and _please_ can be considered semantically equivalent,
  distinguished only by their preferred mappings
* commonalities between the Agentive cases and the Objective cases of actions
  such as hitting, breaking, and cutting
* distinguishing between [individual roles]
  * the Agent and the Patient ... is reasonably straightforward
    * Agent is the initiator of the action, the doer, and can typically be
      * acting deliberately or on purpose
      * The question What did X do? can be applied, with X being the Agent. The
      * non-volitional Causes
    * Patient, on the other hand, is being acted upon. It is likely to
      * change state as a result of the Agent’s actions.  The questions
      * What happened to Y? or What did X do to Y?  would apply
    * (Jackendoff, 1972)
  * Patients and Themes
* correspondence to syntactic constituents
  * `[Agt sy] sell [sg] [to sy] [for sg]`
  * which is the theme, az áru vagy a fizetség?
* approaches.. explained in more detail below
  * Gruber (1965) and Jackendoff
    * semantic roles as _arguments to underlying conceptual predicates_
    * as in Jackendoff ’s influential theory of Lexical Conceptual Structures
      (Jackendoff, 1972, 1983)
  * Prototypical Agents and Patients so that
    each one covers a range of different semantic role types (Dowty, 1991)
  * Levin (1993): syntactic verb classes
    * related to the same commonalities semantic roles were intended to capture
  * Frame Elements (Fillmore, 1985)

## 1.3 More Elaborated Frameworks 7

## 1.3.1 Lexical Conceptual Structures

* Building on ideas about semantics first expounded by Gruber (1965),
  Jackendoff elaborated significantly on the notion of cases by treating them
  as arguments to a set of _primitive conceptual predicates_ such as:
  GO, BE, STAY, LET, CAUSE (Jackendoff, 1972, 1983)
  * GO can be used to describe changes of location/possession/state,
    * any situation where both a “before state” and a different “after state”
      can be defined. The basic GO predicate takes
    * three arguments, the object undergoing the change and the before and
      after locations, possessors, or states
  * later versions:
    * subtypes of primitive predicates
    * More information can be added, e.g., the manner of motion in (7) could be
      represented by adding a predicate: MANNER:
  * CAUSE predicate, which takes the Agent
  * Jackendoff ’s intent was never to provide detailed representations of all
    of meaning but, instead, to focus on fundamental concepts that had special
    relevance to the _mapping_ between syntax and semantics [e.g.] Causation
  * a mapping between an ordered list of semantic roles (a thematic hierarchy)
    and an ordered list of syntactic constituents (Jackendoff, 1992)
  * extending this approach to all of the verbs in multiple languages and, in
    particular, to more abstract verbs, has proved daunting [csüggesztő]

## 1.3.2 Proto-Roles 7

* Dowty (1991) took an approach, borrowing from prototype theory
* every Agent may not be a sentient being that volitionally causes a change of
  state in another participant, we can all recognize this as a prototypical
  Agent, and most Agents will participate in this set of characteristics to
  varying degrees
  * a set of likely Proto-Agent Properties and Proto-Patient Properties,
* there could be times when the number of entailments for each semantic role
  would be similar, and he predicted that in such cases, the likely result
  would be syntactic alternations,
  * spray/load alternation as discussed in the paragraph ... Incremental Themes
  * Psychological predicates

## 1.3.3 Levin’s Verb Classes and Alternations

* syntactic variations are a direct reflection of the underlying semantics
  * transitive/intransitive alternation called the causative/inchoative
  * middle construction
  * conative _cut at_
* lemma coverage and sense coverage. Even with 3100 verbs, the lemma coverage
  is limited. Only half of the 3000 verb lemmas in the Penn Treebank, a one
  million word corpus of Wall Street Journal articles, are included in the
  classes. WordNet has well over 8000 verb lemmas. For the verbs that are
  present, although one or two basic senses are usually covered,
* that the entire range of frames for a particular class will appear at least
  once or twice for every verb in the class. However, this rarely happens in a
  single corpus
* listing of a verb in more than one class (many verbs are in three or even
  four classes) is left open to interpretation. It can indicate that more than
  one sense of the verb is involved, in which case they might be homonyms
  (completely unrelated senses, such as draw a picture versus draw water from
  the well ) or polysemes (related senses). If related, is one sense more
  general
* approaches for automatically inducing verb frames and verb classes
  with varying degrees of success (Schulte im Walde, 2009)
* the original classes have been extended and made available on-line in VerbNet

## 1.3.4 Frame Semantics 18

* Frame Semantics (Fillmore, 1985, 1982; Fillmore+ 2002) and is embodied
  in FrameNet, a lexical resource which currently has entries for 10,000
  lexical units (senses of a lemma) associated with at least 958 distinct
  frames and 2,500 Frame Elements. Annotated example sentences have been
  provided for up to 6800 lexical units (Baker+ 1998; Johnson+ 2001). FrameNet
  is described in more detail in the next chapter
* This introduction to linguistic theories about semantic representations ends
  where it began, with Charles Fillmore. Having thought deeply about the
  limitations of case theory and building on the notion of Frames as used for
  Knowledge Representation in Artificial Intelligence (Minsky, 1975),
* details of the event being described
* semantic frames but without restricting himself to a small vocabulary of
  primitives

# 2 Available Lexical Resources 21

* differing goals, and yet are surprisingly compatible. They 
* differ primarily in the granularity of the semantic role labels. 
* PropBank uses very generic labels such as Arg0,
* VerbNet
  * several alternative syntactic frames and a set of semantic predicates,
  * marks the PropBank Arg0 as an Agent and the Arg1 as a Theme
* [in the _approve_ example], FrameNet labels them as Grantor and Action
* can be seen as complementary

## 2.1 FrameNet 21

* Based on Filmore’s Frame Semantics,
* [frames] describe
  a particular situation or event along with its participants
* semantic roles are called Frame Elements (FE)
  * defined for each semantic frame, and
* The predicate ... is called Lexical Unit (LU)
  * all LUs in a semantic frame share the same set of semantic roles
* Frame Elements
  * fine-grained semantic role labels
  * e.g. for the Apply-heat Frame include a
    Cook, Food, and a Heating Instrument
  * a frame can also have adjectives and nouns such as nominalizations
  * classified in terms of how central they are, with three levels
    * core (conceptually necessary for the Frame, roughly similar to
      syntactically obligatory),
    * peripheral (such as time and place; roughly similar to adjuncts) and
    * extra-thematic (not specific to the frame and not standard adjuncts but
      situating the frame with respect to a broader context)
* Lexical items are grouped together
  * without consideration of similarity of syntactic behavior
* rich, idiosyncratic descriptions
* overlaps between [Levin class and] FrameNet frame
  * explored in more detail by Baker and Ruppenhofer (2002)
* e.g. _buy_ and _sell_ both belong to the semantic frame `Commerce_buy`, which
  involves a Buyer and Seller exchanging Money and Goods
  * Buyer and Goods are core FEs for this frame while
  * Seller and Money are Non-Core FEs
    * Other Non-Core FEs include but are not limited to
      * Duration, the length of time the Goods are in the Buyer’s possession,
      * Manner
      * Means
      * Place, the location where the transaction occurs,
      * Rate, and
      * Unit, the unit of measure for the Goods

## 2.2 VerbNet 22

* Dang+ 1998; Kipper+ 2000; Kipper Schuler, 2005;
  Kipper+ 2008
* between PropBank and FrameNet
  * midway [in] lexical specificity, and it is
  * closer to PropBank in its close ties to syntactic structure
* hierarchically arranged verb classes, inspired by and
  * extended from the Levin classes
    * Levin classes have 240 classes, with
      47 top level classes and 193 second and third level
    * original Levin classes constitute the first few levels in the
      hierarchy, with each class subsequently refined
    * VerbNet has added almost 1000 lemmas as well as over 200 more classes
      There is now a 4th level of classes and several additional classes at
      the other 3 levels. VerbNet adds to each Levin class an
* abstract representation of the syntactic frames with explicit
  correspondences between syntactic positions and the semantic roles
  * Agent REL Patient, or Patient REL _into pieces_ for break
* argument list consists of
  * semantic roles
    * 24 in total: Agent, Patient, Theme, Experiencer, etc
    * complete list http://verbs.colorado.edu/ ̃mpalmer/projects/verbnet.html
  * selectional restrictions on the arguments that are expressed using
    * binary predicates.  The semantic predicates
    * describe the participants during _stages of the event_
* class-specific interpretations of the semantic roles
* 3,965 verb lexemes with 471 classes
* links to similar entries in WordNet, OntoNotes groupings, FrameNet, and
  PropBank
* coherent syntactic and semantic characterization of the classes, which will
  facilitate the acquisition of new class members

### Syntactic Frames

* Each VerbNet class contains a set of ... syntactic frames
* constructions such as transitive, intransitive, prepositional phrases,
  resultatives, and a large set of diathesis alternations listed by Levin
* semantic roles (such as Agent, Theme, and Location), the verb, and
* other lexical items ... required for a ... construction or alternation
* Semantic restrictions (such as animate, human , and organization )
  * 36 semantic types are taken originally from the EuroWordNet Interlingua,
  * typically encompass literal meanings rather than metaphorical ones and
  * preferences rather than as hard constraints
* which prepositions are allowed
* syntactic nature of the constituent
  * NP, PP, sentential complements (finite and nonfinite)

### Semantic Predicates

* denote the relations between participants and events
* a conjunction of semantic predicates, such as motion, contact or cause
* START(e), END(e) or DURING(e) arguments to
  * indicate that the semantic predicate is in force either at the START..
* Version 3.0 of VerbNet has 94 distinct semantic predicates
* effort is currently underway to
  * link the verb classes to the Omega ontology (Philpot+ 2005) and to
  * create upper level nodes (Palmer+ 2009)

## 2.3 PropBank 24

* NomBank, as a companion to PropBank, provides corresponding semantic role
  labels for _noun_ predicates (Meyers+ 2004)
* an annotated corpus to be used as training data
* first PropBank release consists of 1M words of the Wall Street Journal
* semantic role labels are purposely chosen to be quite
  * generic and theory neutral, Arg0, Arg1, etc
  * same semantic role across syntactic variations
* lexicon which lists, for each broad meaning of each annotated verb, its
  * Frameset, i.e., the possible arguments in the predicate and their
    * labels (its “roleset”) and all possible
    * syntactic realizations. This lexical resource is used as
  * a set of verb-specific guidelines by the annotators
  * similar in nature to FrameNet and VerbNet although ... more coarse-grained
  * more focused on literal meaning than FrameNet
    * less attention to clearly marking
      metaphorical usages and support verb constructions
* defines semantic roles on a verb by verb basis
  * Arg0 is generally ... a prototypical Agent (Dowty, 1991) while
  * Arg1 is a prototypical Patient or Theme
  * No consistent generalizations ... for the higher numbered arguments
    * effort was made to consistently define roles across members of VerbNet
      classes
    * Arg2 ... can be beneficiary, goal, source, extent or cause
  * several more general ArgM (Argument Modifier) roles
    * can apply to any verb, and which are
    * similar to adjuncts
    * e.g.  LOCation, EXTent, ADVerbial, CAUse, TeMPoral, MaNneR, and
      DIRection, among others
  * high inter-annotator agreement
* A set of roles or a roleset corresponds to a distinct usage of a verb. It is
  associated with a set of syntactic frames indicating allowable syntactic
  variations in the expression of that set of roles, the Frameset
* polysemous verb may have more than one Frameset
  * when the differences in meaning are distinct enough to require different
    sets of roles, one set for each Frameset
* verb-specific descriptor field for each role, such as _baker_ for `Arg0`
  * for use during annotation and as documentation, [no] theoretical standing
  * Frame File ... the collection of Frameset entries for a verb
* neutral, generic labels facilitate mapping between PropBank and other more
  fine-grained resources such VerbNet and FrameNet, as well as
  Lexical-Conceptual Structure or Prague Tectogrammatics (Rambow+ 2003)
* most role-sets have two to four numbered roles
  * six can appear, in particular for certain verbs of motion
* lacks
  * selectional restrictions, verb semantics, and inter-verb relationships
* mapping between VerbNet and PropBank, and between VerbNet and FrameNet

### 2.3.1 Limitations to a Verb-Specific Approach

* adventages of [inter-verb] labels
* make inferences and generalizations based on role labels
* encoded meaning is associated with each tag,
* training automatic semantic role labeling (SRL) systems
  * Researchers using PropBank as training data for the most part ignore the
    “verb-specific” nature of the labels, and instead build a single model for
    each numbered argument
    * Arg0/Arg1 ... constitute 85% of the arguments
    * ArgMs are also labeled quite consistently
    * arguments Arg2-Arg5 are highly overloaded, and performance drops
      significantly on them
* genre-specific nature of the training corpus

## 2.4 Semlink . 27

* type to type mappings between PropBank and VerbNet have been made, as well as
  between VerbNet and FrameNet. These mappings have been used to leverage a
  mapping of the PropBank annotated instances to the relevant VerbNet classes
  and semantic role labels. Efforts to extend this instance mapping to FrameNet
  are underway. This project is called Semlink

### 2.4.1 Hierarchy of Thematic Roles

* hierarchical organization of all Agent-like (or Patient-like, or Goal-like,
  etc.) VerbNet roles and FrameNet Elements

## 2.5 Summary . 28

# 3 Machine Learning for Semantic Role Labeling . 31

## 3.1 Identification and Classification . 31

## 3.2 Features Used for Classification . 33

### 3.2.1 Phrase Type 33

### 3.2.2 Governing Category

### 3.2.3 Parse Tree Path

### 3.2.4 Position

### 3.2.5 Voice 40

### 3.2.6 Head Word 40

### 3.2.7 Subcategorization

### 3.2.8 Argument Set

### 3.2.9 Features Introduced in Later Systems

## 3.3 Choice of Machine Learning Method . 43

### 3.3.1 Feature Combinations

## 3.4 Joint Inference . 44

### 3.4.1 Reranking 44

### 3.4.2 Viterbi Search 45

### 3.4.3 Integer Linear Programming

## 3.5 Impact of Parsing .46

### 3.5.1 Integrated Parsing and SRL 46

### 3.5.2 Choice of Syntactic Representation

### 3.5.3 Combining Parsers

## 3.6 Evaluation . 49

## 3.7 Genre . 50

## 3.8 Choice of Resources and Combination of Resources . 50

## 3.9 Unsupervised and Partially Supervised Approaches . 51

# 4 A Cross-Lingual Perspective . 53

1. different styles of semantic role annotation ... across languages
  * semantic role projection, the task of
    automatically transferring semantic roles from one language to another
2. semantic role alignment
  * aligning predicate-argument structures in parallel data
  * prerequisite ... is that semantic role annotation exists in both languages
3. semantic role adaptation
  * similarities and differences in semantic role labeling from a
    cross-linguistic perspective
  * focused on Chinese,
* semantically annotated resources already exist for
  * Chinese (Xue and Palmer, 2009)
  * Czech (Böhmová+ 2003)
  * Japanese (Lida+ 2007; Ohara, 2008)
  * German (Burchardt+ 2006)
  * Catalan and Spanish (Taulé+ 2008)
  * pilot annotation has also been performed for
    * Arabic (Palmer+ 2008) and
    * Korean (Palmer+ 2006)
* SRL systems are starting to be developed using these linguistic resources
  (Xue, 2008; Surdeanu+ 2008; Diab+ 2008)
* labels ... vary from project to project, as discussed in Chapter 2
  * three broad categories:
    * Propbank-style roles,
    * FrameNet-style roles, and
    * roles ... based on the linguistic traditions of a particular language
* Propbank-type labels
  * Chinese Propbank (Xue and Palmer, 2009)
  * Korean Propbank (Palmer+ 2006)
  * Pilot Arabic Propbank (Palmer+ 2008)
  * AnCora (Taulé+ 2008) for Catalan and Spanish
* FrameNet-style labels
  * languages
    * SALSA Project for German (Burchardt+ 2006), the
    * Japanese FrameNet Project (Ohara, 2008), and the
    * Spanish FrameNet Project (Subirats and Petruck, 2003)
* Prague Dependency Treebank (PDT) (Böhmová+ 2003)
  * inner participants and free modifications
    * Inner participants are roughly core arguments while
      * can modify a given verb only once (except for the case of coordination)
      * modify a more or less closed class of verbs that can be listed
      * roles
        * Actor, Patient, Addressee, Origo, and Effect for verbal predicates
        * MAT for nominal predicates
          * material, partitive
          * represents an adnominal argument denoting the content (people, things,
            substance etc.) of a container expressed by the governing noun
    * free modifications are roughly adjunctive arguments
      * can modify any word (if it is not excluded for semantic reason)
      * can modify a particular verb (word) more than once
        (Mikulová+ 2006)
      * temporal, locative/directional, manner, and other kinds of adverbials
* Japanese linguistic traditions
  * Kyoto University Text Corpus 1 (Kawahara+ 2002) and the
  * NAIST Text Corpus (Lida+ 2007)
  * the two corpora differ in the annotation of specific ...  constructions
  * [in Japanese,] close association between the grammatical cases and
    the semantic roles
  * label the arguments based on their grammatical case
    * nominative (GA), accusative (O) and dative (NI) cases
  * Japanese SRL is not as simple
    * markers are routinely dropped
    * word order is ... less rigid
* constituent vs dependency
  * Propbank and FrameNet both assign semantic roles to constituents
  * Czech and Japanese are assigned to words directly

## 4.1 Semantic Role Projection .56

* project semantic role annotation from a resource-rich language
* there has to be parallel data, word-aligned
* constituent-based
  * either with a full syntactic parser or a non-recursive syntactic chunker
* Johansson and Nugues (2006) took semantic role projection a step further in
  their work on Swedish
* assumptions that have yet to be verified
  1. the SRL framework in the source language is also meaningful in the target
  2. a predicate [is always translated into a predicate with the same] roles

## 4.2 Semantic Role Alignment . 59

* As semantically annotated corpora become available in multiple languages
  * how consistent the semantic annotation is across languages
  * all semantic role annotation ... targets the predicate-argument structure,
  * predicate in the source language may be translated into multiple predicates
* potential application in Machine Translation and other NLP systems

## 4.3 Language-(In)Dependent Semantic Role Labeling . 61

* how semantic role labeling techniques developed for one language can be
  adapted for use in another language
* language (in)dependence of semantic role labeling techniques
  * often used as a measure [of] superiority of language processing techniques
* [drawing from Chinese SRL, we show that SRL systems] need to incorporate
  language-specific features
* Chinese
  * morphology-poor
    * no systematic use of morphological case markers, which would be useful
      cues for SRL
      * makes it impractical to use the Japanese-style semantic role labels
    * benefit of impoverished morphology is that
      * verbs and their nominalizations share the same morphological and
        orthographical forms
  * larger number of verbs than English, and the tradeoff is that
    * Chinese verbs tend to be less polysemous
    * Chinese has so-called “stative verbs” that are generally translated into
      adjectives in English
    * smaller average verb frequency given a similar-sized corpus
      * data sparsity
        * class-based back-off
      * more uniform argument structure for verbs
  * words consist of characters rather than letters
    * characters are morphemes that can also be words themselves
    * Multi-character words are mostly compounds
    * verb components are sometimes incorporated arguments (e.g., 发 “hair” in 理发 “cut-hair”) or
    * [incorporations] have their own argument structures
      * e.g., if a verb has an incorporated object, it is unlikely that is will
        also have an external object
* syntactic constructions that do not have a close parallel in English, and
  they can be exploited to improve Chinese semantic role labeling
  * BA construction
    * a closed class of words POS-tagged BA
    * Syntactically, BA is treated as a light verb that takes a clausal
      complement, and the subject of the clausal complement tends to be Arg1
      instead of Arg0, different from a typical clause or sentence in Chinese
  * BEI construction is the Chinese passive construction
    * not marked by passive morphology (past participle)
    * a closed group of light verbs POS-tagged LB (for long BEI) and SB (for
      short BEI)
      * LB takes a clausal complement while
      * SB takes a verb phrase as a complement
    * the subject of NP is typically Arg1 rather Arg0

### 4.3.1 The Chinese PropBank 62

* developed in close association with the English Propbank
  (Palmer+ 2005)
* core and adjunctive arguments. The
  * core arguments are marked with predicate-specific semantic roles Arg0
  * adjunctive semantic roles are
    * listed in Table 4.1
    * Most ... are similar to those in the English Propbank, but
    * TPC is used to label topics
      * more of a semantic notion and is narrower
      * as a syntactic notion is mostly defined in structural terms
        * either be “base-generated” or
          * labeled TPC in the Chinese Propbank
        * moved to the topic position from its canonical position
          * a core argument to a predicate in the sentence and is labeled
            with a numbered argument
* labels are assigned to constituents
  * cases where
    * multiple constituents in a parse tree receive the same label
      * trace
      * discontinuous argument
    * Conversely, ... one constituent receives multiple semantic roles from
      different predicates

### 4.3.2 Semantic Role Labeling for Verbs

* Commonalities
  * stages:
    * pruning,
      * described in Chapter 3, turns out to be straightforward ... for Chinese
    * argument identification, and
    * argument classification
  * subcat
* Verb classes
  * Xue (2008) proposed a verb classification scheme based on three dimensions:
    the number of core arguments, the number of framesets, and syntactic
    alternation patterns.The
  * may or may not have any semantic standing
* word formation features
  * e.g. (“become”) in 建成 (“build-become”) adds another argument that is the
    result of 建 (“build”), which by itself does not take such an argument
  * Knowing the grammatical/semantic relation between the two components will
    help predict the arguments for the verb as a whole
  * features that represent word formation information (e.g., the head,
    modifier, object, or complement string of a verb) ... achieved modest
    gains
  * However, intuitively this is a promising avenue for further exploration
* syntactic chunks vs. full parses as input is a tradeoff
  * Results in the literature are inconclusive

### 4.3.3 Semantic Role Labeling for Nouns 70

* Compared with verbs, however, the distribution of the arguments for
  nominalized predicates is less uniform
* presence or absence of a support verb
  * most common scenario in which a support verb is present is when the
    nominalized predicate heads an NP that is the syntactic object of this
    support verb. In this case, the arguments can be found both inside and
    outside the NP headed by the nominalized predicate,
    * whether a verb is a support verb or not often depends on the context,
      * e.g.  _conduct_
  * [without] a support verb, generally all of its arguments are realized
    within the NP of which it is the head
* features
  * a support verb to a large extent determines whether or not the arguments of
    a nominalized predicate can occur outside the NP of which it is the head

### 4.3.4 Summary 75

# 5 Summary . 77
