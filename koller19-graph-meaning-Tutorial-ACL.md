Graph-Based Meaning Representations: Design and Processing
Alexander Koller, Stephan Oepen, Weiwei Sun
Tutorial at ACL 2019

https://github.com/cfmrp/tutorial

# 1 Tutorial Content and Relevance

* Participants will be enabled to
  * identify genuine content differences between frameworks
  * tease apart more superficial variation,
    for example in terminology or packaging
* processing techniques for semantic graphs will be reviewed
  * against a highlevel inventory of families of approaches
  * codependencies with specific graph flavors or frameworks, on
  * worst-case and typical time and space complexity
  * guarantees (if any) on the wellformedness and correctness
* we embrace a broader perspective on semantic parsing
  * as it has come to be viewed commonly in recent years
  * that aim to be application~ and domain-independent, i.e. seek to provide
    a reusable intermediate layer of interpretation that captures, in suitably
    abstract form, relevant constraints that the linguistic signal imposes on
    interpretation

# 2 Semantic Graph Banks

* we will give a systematic overview of the available semantic graph banks
* with respect to
  * the facets of natural language meaning they aim to represent
  * some/other graph banks
    * focus on predicate–argument structure,
      perhaps with some extensions for polarity or tense, whereas others
    * capture (some) scopal phenomena
    * most graph banks do not have a precisely defined model theory
      in the sense of classical linguistic semantics, 
      * nL there are underlying intuitions about what the nodes of the gra mean
      (individual entities and eventualities in the world vs.
      more abstract objects
      to which statements about scope and presupposition can attach)
  * the relationship between the tokens of the sentence and the nodes
    (called anchoring of graph fragments onto input sub-strings)
    * follow Kuhlmann and Oepen (2016)
    * three flavors which by degree of anchoring we will call type (0)..(2)

## 2.0 bi-lexical dependency graphs

* Type (0) The strongest form of anchoring
* graph nodes injectively correspond to surface lexical units (tokens). In
  * each node is directly linked to a specific token (conversely, there may be
    semantically empty tokens), and the
    nodes inherit the linear order of their corresponding tokens
* popularized by Sem Dependency Parsing (SDP) tasks at the SemEval 14--16
  (Oepen+ 2014, 2015; Che+ 2016)
* e.g
  * CCG word–word dependencies (CCD; Hockenmaier and Steedman, 2007),
  * Enju Predicate– Argument Structures (PAS; Miyao and Tsujii, 2008),
  * DELPH-IN MRS Bi-Lexical Dependencies (DM; Ivanova+ 2012) and
  * Prague Semantic Dependencies
    (PSD; a simplification of the tecto-grammatical structures of Hajič+ 2012)

## type 1

* relaxing the correspondence relations between nodes and tokens, while
  still explicitly annotating the
  correspondence between nodes and parts of the sentence
* may align nodes with subtoken or multi-token sequences,
  e.g. (derivational) affixes or phrasal constructions
* may allow multiple nodes to correspond to overlapping spans,
  enabling lexical decomposition (e.g. of causatives or comparatives)
* e.g
  * Universal Conceptual Cognitive Annotation (UCCA; Abend and Rappoport, 2013
    featured in a SemEval 2019 task) and
  * two variants of ‘reducing’ the underspecified logical forms of Flickinger
    (2000) and Copestake+ (2005) into directed graphs, viz
    * Elementary Dependency Structures (EDS; Oepen and Lønning, 2006) and
    * Dependency Minimal Recursion Semantics (DMRS; Copestake, 2009)
* All three frameworks as target representations in recent parsing research
  (e.g. Buys and Blunsom, 2017; Chen+ 2018; Hershcovich+ 2018)

## Abstract Meaning Representation (AMR; Banarescu+ 2013)

* unanchored, in that the correspondence is not explicitly annotated
* deliberately backgrounds notions of compositionality and derivation
* frequently invokes lexical decomposition and
  represents some implicitly expressed elements of meaning, such that AMR
  ‘abstract’ furthest from the surface signal
* first general release of an AMR graph bank in 2014
* subject of SemEval 2016 and 2017 (May, 2016; May and Priyadarshi, 2017)

# Processing Semantic Graphs

* a dizzying array of different semantic parsing algorithms, and it is a
* Different approaches are more or less effective for different flavors
* we organize the graph-based sem parsing landscape along three dimensions

## Decoding strategy

* include
  * factorization-based methods, which
    * factorize the score of a graph into parts for smaller substrings and
    * apply dynamic programming to search for the best graph, as well as
  * transition-based methods, which learn to make
    * individual parsing decisions for each token in the sentence. Some
  * neural techniques also [ use ] an encoder-decoder architecture, as in NMT

## Compositionality

* whether the representations are constructed compositionally. Some
* standard linguistic assumption:  graphs have a latent compositional struct
* Others are more agnostic and simply predict the edges of the target graph

## Structural information

* model the target graph directly, or use probability models that
  * e.g. a syntactic derivation tree or a term over a graph algebra
* tree-based models go together well with compositional models

# 4 Tutorial Structure

1. Linguistic Foundations: Layers of Sentence Meaning
2. Formal Foundations: Labeled Directed Graphs
3. Meaning Representation Frameworks and Graph Banks
  * Bi-Lexical semantic dependencies (Hockenmaier and Steedman, 2007;
    Miyao and Tsujii, 2008; Hajič+ 2012; Ivanova+ 2012; Che+ 2016)
  * Universal Conceptual Cognitive Annotation
    (UCCA; Abend and Rappoport, 2013)
  * Graph-Based Minimal Recursion Semantics
    (EDS and DMRS; Oepen and Lønning, 2006; Copestake, 2009)
  * Abstract Meaning Representation (AMR; Banarescu+ 2013)
  * Non-Graph Representations: Discourse Representation Structures
    (DRS Basile+ 2012)
  * Contrastive review of selected examples across frameworks
  * Availability of training and evaluation data; shared tasks
    state-of-the-art empirical results
4. Parsing into Semantic Graphs
  * Parser evaluation: quantifying semantic graph similarity;
  * Parsing sub-tasks: segmentation, concept identification, relation
    detection, structural validation
  * Composition-based methods (Callmeier, 2000; Bos+ 2004; Artzi+ 2015
    Groschwitz+ 2018; Lindemann+ 2019; Chen+ 2018)
  * Transition-based methods (Sagae and Tsujii, 2008; Wang+ 2015; Buys and
    Blunsom, 2017; Hershcovich+ 2017)
  * Translation-based methods
    (Konstas+ 2017; Peng+ 2018; Stanovsky and Dagan, 2018)
  * Cross-framework parsing and multi-task learning
    (Peng+ 2017; Hershcovich+ 2018; Stanovsky and Dagan, 2018)
  * Cross-lingual parsing methods
    (Evang and Bos, 2016; Damonte and Cohen, 2018; Zhang+ 2018)
  * Contrastive discussion across frameworks, approaches, and languages
5. Outlook: Applications of Semantic Graphs

# Presenters

## Alexander Koller

* PhD in 2004, with a thesis on underspecified processing of semantic
  ambiguities using graph-based representations
* parsing, generation, the expressive capacity of representation formalisms for
  natural language, and semantics. Within semantics, he has published
  extensively on semantic parsing using both grammar-based and neural
  approaches. His most recent work in this field (Groschwitz+ 2018)
  achieved state-of-the-art semantic parsing accuracy for AMR using neural
  supertagging and dependency in the context of a compositional model

## Stephan Oepen

* studied Linguistics, German and Russian Philology, Computer Science, and
  Computational Linguistics at Berlin, Volgograd, and Saarbrücken. He has
* constraint-based parsing and realization, on the design of broad-coverage
  meaning representations and the syntax–semantics interface, and on the use of
  syntactico-semantic structure in natural language understanding applications
  He has been a co-developer of the LinGO English Resource Grammar (ERG) since
  the mid-1990s, has helped create the Redwoods Treebank of
  scope-underspecified MRS meaning representations, and has chaired two SemEval
  tasks on Semantic Dependency Parsing as well as the First Shared Task on
  Cross-Framework Meaning Representation Parsing (MRP) at CoNLL 2019

# Weiwei Sun

* symbolic and statistical parsing, with a special focus on parsing into
  semantic graphs of various flavors. She has repeatedly chaired teams that
  have submitted top-performing systems to recent SemEval shared tasks and has
  continuously advanced both the state of the art in semantic parsing in
  terms of empirical results and the understanding of how design decisions in
  different schools of linguistic graph representations impact formal and
  algorithmic complexity
