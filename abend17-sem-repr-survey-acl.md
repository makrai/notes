The State of the Art in Semantic Representation
Omri Abend and Ari Rappoport
2017 acl

# Abstract

* the achievements and the shortcomings of [Semantic representation schemes],
  * compare them with syntactic schemes, and clarify the
  * general goals of research on semantic representation

# 1 Intro

* proposals for semantic representations (SRT) and corpora, e.g
  * GMB (Basile+ 2012),
  * AMR (Banarescu+ 2013),
  * Universal Conceptual Cognitive Annotation (Abend and Rappoport, 2013b)
  * Universal Decompositional Semantics (UDS; White+ 2016)
* organization
  2. goals
  3. components
    * predicate-argument relations, discourse relations and logical structure
  4. concrete SRT schemes and annotated resources
  5. criteria for evaluation
  6. relation to syntax
* differences
  * formalism and interface with syntax
  * ability to abstract away from formal and syntactic variation
  * level of training [required for] annotators
  * cross-linguistic generality

# 2 Defining Semantic Representation

* should be paired with a method for extracting information from it that
  can be directly evaluated by humans
  * extraction process should be reliable and computationally efficient
* fundamental components
  * argument structure
  * Many other [discussed] in Section 3
* extra-textual criteria or applications
  * inference, as in
    * textual entailment (Dagan+ 2006) or
    * natural logic (Angeli and Manning, 2014)
  * supporting knowledge base querying
    (Zelle and Mooney, 1996; Zettlemoyer and Collins, 2005)
  * defining semantics through a different modality, for instance
    * images (Kiros+ 2014), or
    * embodied motor and perceptual schemas (Feldman+ 2010)
* We only lightly touch on VSMs in this survey
* cross-linguistic universality
  * languages [are close] in terms of their semantic content
    (Bar-Hillel, 1960; Fodor, 1975)
    * See Section 5 for further discussion

# 3 Semantic Content 78

* we focus on
  * meaning relationships between lexical items,
  * rather than the meaning of the lexical items themselves
* We also defer discussion of sentiment
* running example: _Although Ann was leaving, she gave the present to John._

## Events

* Events (sometimes called frames, propositions or scenes)
  * predicate (main relation, frame-evoking element)
  * arguments (participants, core elements) and
  * secondary relations (modifiers, non-core elements)
* ontology or a lexicon of _event types_ (also a predicate lexicon), which
  categorizes semantically similar events evoked by different lexical items
  e.g. FrameNet defines frames as schematized story fragments
  evoked by a set of conceptually similar predicates
* not be confused with events as defined in Information Extraction
  * event coreference (Humphreys+ 1997)
  * such as a political or financial event
* Richer Event Descriptions framework (RED; Ikuta+ 2014)

## Predicates and Arguments 79

* which _nominal and adjectival_ predicates are covered
  * PropBank (Palmer+ 2005) covers
    * verbs
    * recent versions also eventive nouns and multi-argument adjectives
  * FrameNet (Ruppenhofer+ 2016) covers all these, but also covers
    relational nouns that do not evoke an event, such as “president”
* arguments that appear outside sentence boundaries, or that
  * do not explicitly appear anywhere in the text
  (Gerber and Chai, 2010; Roth and Frank, 2015)

## Core and Non-core Arguments

* Dowty (2003)
* define the distinction [semantically rather than distributionally]
  * core: arguments whose meaning is predicate-specific and are
    necessary components of the described event
  * non-core: predicate-general
* FrameNet defines
  * core arguments as conceptually necessary components of a frame, that
    * make the frame unique and different from other frames, and
  * peripheral arguments
    * introduce additional, independent or distinct relations
    * e.g. time, place, manner, means and degree (Ruppenhofer+ 2016)

## Semantic Roles

* FrameNet
  * roles are shared across predicates that evoke the same frame type
    e.g. “leave” and “depart”
* PropBank
  * roles are verb-specific
  * role sets were extended by subsequent projects such as AMR
* VerbNet (Kipper+ 2008) and
  * subsequent projects (Bonial+ 2011; Schneider+ 2015)
  * a closed set of abstract semantic roles [for] all predicate arguments
    * such as AGENT, PATIENT and INSTRUMENT

## Co-reference and Anaphora

## Temporal Relations between events

* timestamping according to time expressions found in the text, or by
  predicting their relative order in time
* resources
  * TimeML, a specification language for temporal relations
    (Pustejovsky+ 2003)
  * TempEval series of shared tasks and annotated corpora
    (Verhagen+ 2009, 2010; UzZaman+ 2013)
* scripts
  * schematic, temporally ordered sequences of events associated with a certain
    scenario (Chambers and Jurafsky, 2008, 2009; Regneri+ 2010)
  * e.g.  going to a restaurant
* causal relations between events
  * applications, including planning and entailment
  * annotation schemes for causality and its sub-types
    (Mirza+ 2014; Dunietz+ 2015)
  * Mostafazadeh+ (2016) integrated causal and TimeML-style temporal
    relations into a unified representation
* internal temporal structure of events has been less frequently tackled
  * Moens and Steedman (1988) defined an ontology for the temporal components
    e.g. preparatory process (e.g., “climbing a mountain”), or its culmination
    (“reaching its top”)
* Statistical work on this topic is unfortunately scarce
  * aspectual classes (Siegel and McKeown, 2000; Palmer+ 2007;
    Friedrich+ 2016; White+ 2016), and
  * tense distinctions (Elson and McKeown, 2010)

## Spatial Relations 80

* cognitive theories of meaning (e.g., Langacker, 2008), and in
* geographical information systems or robotic navigation
* Spatial Role Labeling (Kordjamshidi+ 2012)
* SpaceEval (Pustejovsky+ 2015)
  * identification and classification of places, paths, directions and mo-
    tions, and their relative configuration

## Discourse Relations

* For example, the leaving and the giving events are sometimes related
  through `CONCESSION` _engedmény_, evoked by “although”
* [useful but overlooked for] summarization, machine translation and
  information extraction (Webber and Joshi, 2012)
* resources
  * Penn Discourse Treebank (PeDT; Miltsakaki+ 2004)
    * classifies the relations between [discourse units]
      * hierarchical, closed category set
      * high-level relation types like TEMPORAL , COMPARISON and CONTINGENCY and
      * finer-grained ones such as JUSTIFICATION and EXCEPTION
      * focuses on local discourse structure
  * RST Discourse Treebank (Carlson+ 2003)
    * more focus on higher-order discourse structures
    * deeper hierarchical structures than the PeDT’s
* discourse segmentation
  * e.g. segmentation of scientific papers into BACKGROUND and DISCUSSION
    (Liakata+ 2010)
  * See (Webber+ 2011) for a survey
* schemes, e.g., GMB and UCCA, supporting cross-sentence semantic relations

## Logical Structure

* quantification, negation, coordination and their associated scope
* applications that require
  * mapping text into an [executable] language, such as
    * a querying language (Zelle and Mooney, 1996; Zettlemoyer and Collins, 2005)
    * robot instructions (Artzi and Zettlemoyer, 2013)
  * recognizing entailment relations
    (Bos and Markert, 2005; Lewis and Steedman, 2013)

## Inference and Entailment

* approach[es]
  * Recognizing Textual Entailment (Dagan+ 2013), and
  * Natural Logic (van Eijck, 2005)
  * Manning (2006) for a discussion of [the annotation]
  * resources (e.g., Dagan+ 2006; Bowman+ 2015)

# 4 Semantic Schemes and Resources 81

## Semantic Role Labeling
* Semlink (Loper+ 2007) [links] PropBank, FrameNet, VerbNet and WordNet
* Preposition Supersenses project (Schneider+ 2015)
* review (Palmer+ 2010, 2013)
## AMR
* predicate-argument relations, including semantic roles (adapted from
  PropBank) that apply to a wide variety of predicates (including verbal,
  nominal and adjectival predicates), modifiers, co-reference, named entities
  and some time expressions
  * currently [no] relations above the sentence level
* English-centric, which results in an
  * occasional conflation of semantic phenomena [realized] similarly in English
  * difficulties [with invariance] across translations (Xue+ 2014)
## Universal Conceptual Cognitive Annotation (Abend and Rappoport 2013a,b)
* cross-linguistically applicable scheme for semantic annotation, building on
  typological theory, primarily on Basic Linguistic Theory (Dixon, 2010)
* argument structures of various types and relations
* not include semantic role information
* across languages (Sulem+ 2015)
* distinguishes between primary and aspectual verbs e.g. _happen to_
* support for annotation by non-experts
## Universal Decompositional Semantics (White+ 2016)
* semantic role annotation, word senses and aspectual classes
  (e.g., +/- realis)
* distinctions  collected through crowd-sourcing
* feature bundles e.g. +VOLITION and +AWARENESS , rather than AGENT
## The Prague Dependency Treebank (PDT) Tectogrammatical Layer (PDT-TL)
* Sgall, (1992); Böhmová+ (2003)
* argument structure (including semantic roles), tense, ellipsis, topic/focus,
  co-reference, word sense disambiguation and local discourse information
## CCG-based Schemes. CCG (Steedman, 2000)
* [in] semantic tasks (Zettlemoyer and Collins, 2005, 2007; Kwiatkowski+ 2010;
  Artzi and Zettlemoyer, 2013)
* associating CCG with semantic forms
  * Boxer (Bos, 2008) and GMB, which builds on Boxer,
    use Discourse Representation Structures (Kamp and Reyle, 1993), while
  * Lewis and Steedman (2013) used Davidsonian-style λ-expressions [with]
    discourse information
## HPSG-based Schemes
* Pollard and Sag, (1994)
* feature bundles
* commonly use the Minimal Recursion Semantics (Copestake+ 2005)
* Annotated corpora and manually crafted grammars exist for multiple languages
  (Flickinger, 2002; Oepen+ 2004; Bender and Flickinger, 2005)
* Broad-coverage Semantic Dependency Parsing shared task and corpora
  (Oepen+ 2014, 2015)
## OntoNotes
* multiple inter-linked layers of annotation, borrowed from different schemes

# 5 Evaluation

* Human evaluation
  * ideally carried out by asking annotators to make some semantic prediction
    or annotation according to pre-specified guidelines, and to
    compare this to the information extracted from the SRT
  * Question Answering SRL (QASRL; He+ 2015) is an SRL scheme which
    * solicits nonexperts to answer mostly wh-questions,
      converting their output to an SRL annotation
    * Hartshorne+ (2013) and Reisinger+ (2015)
      elicit _semantic role features_ e.g. volitional [by crowdsourcing]
      in order to evaluate proposals for semantic role sets
    * Joshua K. Hartshorne, Claire Bonial, and Martha Palmer
      2013 emnlp
      The VerbCorner project:
        Toward an empirically-based semantic decomposition of verbs
* task-based evaluation
  * Many semantic representations in NLP are defined [for] an application
  * AMR: machine translation, a natural application
  * QA to evaluate semantic parsing into knowledge-base queries
  * invariance across paraphrases or translation pairs
    (Xue+ 2014; Sulem+ 2015)
* agreement between annotators
  * where semantic schemes are induced through manual annotation
  * Measures include the
    * SMATCH measure for AMR (Cai and Knight, 2013), and the
    * PARSEVAL F-score (Black+ 1991) adapted for DAGs for UCCA
  * background and training [of] annotators

## Universality

* BabelNet (Ehrmann+ 2014), UBY (Gurevych+ 2012) and Open Multilingual Wordnet
* SRL schemes and AMR studied for their cross-linguistic applicability
  (Padó and Lapata, 2009; Sun+ 2010; Xue+ 2014)
* PropBank and FrameNet translated to multiple languages
  (Akbik+ 2016; Hartmann and Gurevych, 2013)
* SRT schemes [that have] cross-linguistical applicability as main criteria
  * e.g. UCCA, and the LinGO Grammar Matrix (Bender and Flickinger, 2005),
  * both of which draw on typological theory

# 6 Syntax and Semantics

## 6.1 Syntactic and Semantic Generalization

* Syntactic distinctions are generally guided by a combination of semantic and
  distributional considerations, where emphasis varies across schemes
* Distributional considerations [in] Universal Dependencies dependency type
  * e.g. _John, my brother_, _John, who is my brother_

## 6.2 The Syntax-Semantics Interface

* closed set of combinations or open set of constructions

# 7 Conclusion
