Robust Incremental Neural Semantic Graph Parsing
Jan Buys, Phil Blunsom
ACL 2017

Code, models & data prepar scripts: https://github.com/janmbuys/DeepDeepParser

# Abstract

* Parsing sentences to linguistically-expressive semantic representations is a
* hE statistical parsing has focused almost exclusively on
  bilexical dependencies or domain-specific logical forms
* We propose a neural encoder-decoder transition-based parser which is the
  first full-coverage semantic graph parser for Minimal Recursion Semantics
* architecture: stack-based embedding features, predicting graphs jointly
  with unlexicalized predicates and their token alignments. Our parser is
* more accurate than attention-based baselines on
  * MRS, and
  * an additional Abstract Meaning Representation (AMR) benchmark, and
* GPU batch processing makes it an order of magnitude faster than a
  high-precision grammar-based parser. Further, the
* 86.69% Smatch score of our MRS parser is higher than the upper-bound on AMR

# 1 Intro

* sem parse
  * can be used for query execution, inference and reasoning
  * end-to-end models have outperformed traditional pipeline approaches,
    predicting syntactic or semantic structure as intermediate steps, on tasks
    * sentiment analysis & sem relatedness (Le and Mikolov 2014; Kiros+ 2015)
    * question answering (Hermann+, 2015) and
    * textual entailment (Rocktäschel+, 2015)
* hE the linguistic structure used in applications has predominantly been
  shallow, restricted to bilexical dependencies or trees
* robust parsing into linguistically deep representations
  * Minimal Recursion Semantics (MRS, Copestake+, 1995, 2005), which
    serves as the semantic representation of the English Resource Grammar (ERG)
    (Flickinger, 2000)
  * Existing parsers for full MRS (as opposed to bilexical semantic graphs
    derived from, but simplifying MRS) are grammar-based, performing
    disambiguation with a maximum entropy model (Toutanova+, 2005; Zhang+,
    2007)
    * high precision but incomplete coverage
* Our main contribution is to develop a fast and robust parser for full
  MRS-based semantic graphs
* We exploit the power of global conditioning enabled by deep learning to
  predict linguistically deep graphs incrementally
  * model has no access to the underlying ERG or syntactic structures
    from which the MRS analyses were originally derived
  * We develop parsers for two graph-based conversions of MRS,
    * Elementary Dependency Structure (EDS, Oepen and Lønning, 2006) and
    * Dependency MRS (DMRS, Copestake, 2009), of which the latter is
      * inter-convertible with MRS
* Abstract Meaning Representation (AMR, Banarescu+, 2013)
  * a graph-based semantic representation that shares the goals of MRS
  * differences
    * which linguistic phenomena are annotated,
    * MRS is a compositional representation explicitly coupled with the
      syntactic structure of the sentence, while
      * AMR does not assume compositionality or alignment with the sentence
        structure
  * AMR parsers (Flanigan+, 2014; Wang+, 2015b; Artzi+, 2015; Damonte+, 2017),
  * hE low inter-annotator agreement places on upper bound of 83% F1 on
    expected parser performance (Banarescu+, 2013)
  * We apply our model to AMR parsing by introducing structure that is present
    explicitly in MRS but not in AMR (Buys and Blunsom, 2017)
* Parsers based on RNNs have achieved SOTA performance for
  * dependency parsing (Dyer+, 2015; Kiperwasser and Goldberg, 2016) and
    constituency parsing (Vinyals+, 2015b; Dyer+, 2016; Cross and Huang, 2016b)
  * One of the main reasons for the prevalence of bilexical dependencies and
    tree-based representations is that they can be parsed with efficient and
    well-understood algorithms
  * nL RNNs can make predictions conditioned on unbounded contexts
    * this enables us to predict more complex structures
      without increasing algorithmic complexity
    * we show how to perform linguistically deep parsing with RNNs
* Our parser is based on a transition system for semantic graphs
  * novel: instead of generating arcs over an ordered, fixed set of nodes (the
    words in the sentence), we generate the nodes and their alignments jointly
    with the transition actions
* We use a graph-based variant of the arc-eager transition-system
  * sentence is encoded with a bidirectional RNN
  * prediction of the transition sequence
    * as a graph linearization, can be predicted with any encoder-decoder
    * we show that using hard attention, pointer network and conditioning
      explicitly on stack-based features improves performance
    * In order to deal with data sparsity
      candidate lemmas are predicted as a pre-processing step, so that the
      => RNN decoder predicts unlexicalized node labels
* evaluation on DMRS, EDS and AMR graphs
  * performance improves from 79.68% to 84.16% F1 over an attention-based
    encoder-decoder baseline. Although our parser is
  * less accurate that a high-precision grammar-based parser on a test set of
    sentences parsable by that grammar
  * speed: incremental prediction and GPU batch processing enables it to parse
    529 tokens per second, against 7 tokens per second for the grammar-based
  * On AMR parsing our model obtains 60.11% Smatch

# 2 Meaning Representations

* We define a common framework for semantic graphs in which we can place both
  MRS-based graph representations (DMRS and EDS) and AMR. Sentence meaning is
  * rooted, labelled, connected, directed graphs (Kuhlmann and Oepen, 2016)
  * eg fig 1
  * Node labels are referred to as predicates (concepts in AMR) and
  * edge labels as arguments (AMR relations)
  * constants, a special type of node modifiers, are used to denote the string
    values of named entities and numbers (including date and time expressions)
  * Every node is aligned to a token or a continuous span of tokens in the sent
* Minimal Recursion Semantics (MRS) is a framework for computational semantics
  * can be used for parsing or generation (Copestake+, 2005)
  * Instances and eventualities are represented with logical variables
  * arguments labels from a small, fixed set of roles
  * Arguments are either logical variables or handles,
    * handles: designated formalism-internal variables
    * Handle equality constraints support scope underspecification; multiple
      scope-resolved logical representations can be derived from one MRS
* A predicate corresponds to its intrinsic argument
  * Quantification is expressed through predicates that bound instance
    variables, rather than through logical operators such as ∃ or ∀
  * MRS was designed to be integrated with feature-based grammars eg HPSG/LFG
  * MRS has been implement the English Resource Grammar (ERG, Flickinger,
    2000), a broad-coverage high-precision HPSG grammar
* Oepen and Lønning (2006) proposed Elementary Dependency Structure (EDS),
  * a conversion of MRS to variable-free dependency graphs which
    drops scope underspecification
  * Dependency MRS (DMRS, Copestake 2009) extended this conversion to avoid
    information loss, primarily through richer edge labels
    * can be converted back to the original MRS, or used directly in MRS-based
      applications (Copestake+, 2016)
  * We: the empirical performance of parsers for both EDS and DMRS
    * while EDS is more interpretable as an independent semantic graph
      representation, DMRS can be related back to underspecified logical forms
  * A bilexical simplification of EDS has previously been used for semantic
    dependency parsing (Oepen+, 2014, 2015). Figure 1 illustrates an EDS graph
* MRS makes an explicit distinction between surface and abstract predicates
  * surface predicates are prefixed by an underscore
  * Surface predicates: lemma + coarse POS tag + optional sense label
* anchoring
  * Predicates absent from the ERG lexicon are represented by their surface
    forms and POS tags
  * We convert the character-level predicate spans given by MRS to token-level
    spans for parsing purposes, but the representation does not require gold
  * Surface predicates usually align with the span of the token(s)
  * abstract predicates can span longer segments
  * In full MRS every predicate is annotated with a set of morphosynt features,
    * we do not currently model these features
* AMR (Banarescu+, 2013) graphs can be represented in the same framework,
