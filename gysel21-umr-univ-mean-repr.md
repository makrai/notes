Designing a Uniform Meaning Representation for Natural Language
JEL Van Gysel, M Vigus, J Chun, K Lai, S Moeller, J Yao, T O’Gorman, A Cowell,
  W Croft, C Huang, J Hajič, JH Martin, S Oepen, M Palmer, J Pustejovsky,
  R Vallejos, N Xue
KI Künstliche Intelligenz (2021) 35:343–360

# 2 Four desiderata that guide the design of UMR

## Scalability/learnability

* needs to be
  * intuitive so that it does not put too many constraints on the annotators
  * a formal object such as a tree or a graph that is easy to manipulate

## Supporting similarity-based lexical inference

* the same meaning can be expressed through different morphosyntactic constrs
  * should be repred in the same way
  * abstract away from the morphosyntactic variations,
* ambiguous
  * disambiguate the senses of a word or phrase, and
  * resolve references of referring expressions
    such as proper nouns and pronouns

## Supporting logical inference

* the primary goal for classical meaning representations, which aim to be
  easily translatable to logical form—typically first-order logic
  * Logical systems allow new statements to be inferred from known facts
* quantification, negation, tense and aspect, and modality
* First-order logic formalisms in grounded semantic parsing
  * parse natural language queries into first-order logic-based meaning reprs
  * can be executed against knowledge bases [16, 17, 35, 46, 49, 64, 81]
* canonicalize referring exprs ~> they can be grounded to external knowl bases

## Cross-linguistic plausibility and portability: uniform across languages

* morphosyntax
  (eg constituent order, degree of inflectional synthesis of the verb)
* grammaticalization of different ways of dividing up conceptual space [75],
* different morphosemantic mappings between concepts and words

# 3 overview of Abstract Meaning Representation that serves as the starting

# 4 UMR sentence-level extensions to AMR

# 5 document-level extensions

# 6 cross-linguistic diversity
  in linguistic distinctions and in mapping words to UMR concepts

# 7 minority languages 9

* that face cultural and technological challenges and lack of foundat resources
* we actively develop tools to support UMR annotation, we present

# 8 experiments that show they can be annotated reliably

# 9 how UMR is related to existing meaning representations 12

* how they address each aspect of our four desiderata
* we discuss the design choices of UMR in relation to five meaning reprs:
  * Abstract Meaning Representation (AMR) [6],
  * Discourse Representation Structures (DRS) [13, 44],
  * the tectogrammatical layer of the Prague Dependency TreeBank (PDT) [37,
    38],
  * Minimal Recursion Semantics (MRS) [21], and
  * Universal Conceptual Cognitive Annotation (UCCA) [1]
* These five meaning representations are selected as a basis for comparison
  because they
  * have all been deployed in large-scale annotation projects;
  * all provide some degree of abstraction from surface text spans, and
  * provide a complete meaning representation for at least the sentence if not
* These requirements preclude from consideration partial meaning reprs such as
  * semantic role labeling frameworks like FrameNet [5] and Propbank [59] where

## Abstract Meaning Representation (AMR) [6]

* represents sentence meanings as single-rooted, directed, and acyclic graphs
* nodes are concepts and the edges are relations. AMR
* concepts include word sense-disambiguated verbal and nominal predicates,
  entities (eg “person”) and relations (eg“have-org-role-91”), or simple
  lemmas
* relations include Propbank style semantic roles (eg “Arg0”), general semantic
  relations (“:degree”), discourse relations (eg “:condition”), etc

## Discourse Representation Theory (DRT) [44] proposes a

* discourse-level meaning representation for an entire text that
* can be easily translated into logical form
* The Groningen Meaning Bank (GMB) [13] is a large data set annotated with
  DRS that makes use of
  * word senses from the WordNet, semantics roles from VerbNet, and
  * rhetorical relations from SDRT [3] and
  * puts the theoretical foundation of DRT into practice. The GMB is produced
  * associating Combinatory Categorial Grammar (CCG) parses [72] with semantic
    forms
    * Semantic forms of the entire sentence can be constructed from primitive
      semantic forms associated with lexical entries in the CCG lexicon
* the semantic representation of a sentence is constructed as its CCG tree is
* multiling: Parallel Meaning Bank (PMB) [2] is a more recent effort to extends
  GMB annotation to multiple languages to create
  * a parallel corpus annotated with DRS

## The tectogrammatical layer of the Prague Dependency TreeBank (PDT) [37, 38]

* covers many of the same semantic distinctions covered by AMR such as the
  argument structure (semantic roles, called “functors” in PDT), word senses,
  coreference, and intra~ and inter-sentential discourse relations. Additionally
* also annotates tense, modalities, and a host of other “semantic” node
  attributes, bridging and textual coreference as well as topic/focus
  (information structure) which are not part of AMR annotation. PDT uses a
* multi-layered annotation framework where
  the tectogrammatical layer is explicitly linked by individual node references
  to the other (lower) layers of linguistic analysis

## Minimal Recursion Semantics (MRS) [21] is

* a sentence-level meaning representation that
  also focuses on representing
  * predicate-argument structure,
  * sense distinctions where they are grammaticalized,
  * logical semantic phenomena
    such as quantification and operator-like scopal predicates, and
  * tense, aspect, modality etc. as determined by morphosyntax. MRS
* emphasizes semantic compositionality [9, 20], and
* full representations are typically derived in conjunction with grammar-based
  parsers, eg the English Resource Grammar (ERG) [33]

## Universal Conceptual Cognitive Annotation (UCCA) [1]

* has a foundational layer that focuses on the predicate-argument structure
  * text as a collection of scenes, and
  * each scene contains
    * a main relation (a state or process) that is the anchor of the scene, as
    * participants of the relation. As it currently stands, UCCA does
* not annotate word senses, named entities, relations as AMR does, nor does it
  annotate tense, aspect, modality, and quantification scope like MRS
* multi-layered design like PDT that allows extensions, and there is ongoing
  research to add coreference annotation to UCCA [60]

---

* We compare UMR with these existing meaning representations
  * against the four desiderata we have outlined in Sect. 2, as well as
  * whether they support discourse-level semantic processing

## 9.3 Achieving Cross‑Linguistic Uniformity

* must provide mechanisms for abstracting away from language-specific
  morphosyntax without losing semantic information. An advantage of
* AMR already abstracts away from constituent order which varies widely across
  languages. This has been shown to make AMR more portable across languages,
  * Chinese and Czech [47, 48, 85]
* UCCA, by intentionally attempting to annotate semantic relations that are
  indifferent to syntactic relations, have also proved to be readily portable
  to other languages [43]
* Similarly, DRS, MRS, and PDT have all been annotated in multilingual contexts
  [2, 39, 51], and have all demonstrated some level of cross-lingual validity
* UMR is the first to explicitly take low-resource languages into account and
  is general enough to eventually encompass the range of variation exhibited
  by the world’s roughly 7000 languages
* Unlike Interlingua [29, 30, 42, 56], UMR does not aim to build a common
  cross-linguistic vocabulary for all concepts
* UMR aims to factor out what is common for all languages roughly, it proposes
  * use of language-specific lexical databases and Propbank-style frame files,
  * cross-linguistically portable annotation layers for “grammatical” semantics
    such as aspect and modality. UMR thus uses
* ie UMR uses a combination of
  * language-specific (concrete, lexical) concepts and a
  * shared inventory of (abstract, grammatical) concepts, features, and
    relations for all languages
    * expected to have a manageable vocabulary size of a few hundred items
  * based on cross-linguistic typological research from the last six decades,
    UMR can represent robust cross-linguistic commonalities in a uniform manner
    while allowing for cross-linguistic variation

# 10 conclude 15
