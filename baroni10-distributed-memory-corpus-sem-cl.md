Marco Baroni, Alessandro Lenci
Distributional Memory: A General Framework for Corpus-Based Semantics
Computational Linguistics, Volume 36, Issue 4 December 2010 673–721

* we make publicly available from http://clic.cimec.unitn.it/dm
  * best DM model (TypeDM)
  * Perl scripts that perform the basic operations on the tensor and its
    derived vectors

# Abstract

* alternative to the “one task, one model” approach, the Distributional Memory
  * extracts ... set of weighted word-link-word tuples
    arranged into a third-order tensor
  * Different matrices are then generated from the tensor, and
    their rows and columns constitute natural spaces [for semantic problems]
* e.g. similarity judgments, synonyms, concept categorization,
  selectional preferences of verbs, analogy problems,
  classifying relations between word pairs,
  harvesting qualia structures with patterns or example pairs,
  typical properties of concepts, verb alternation classes
* Extensive empirical testing in all these domains

# 1 Introduction

* distributional hypothesis (Harris 1954; Miller and Charles 1991)
  * the degree of semantic similarity between two words (or other units)
    [is] a function of the degree of overlap among their linguistic contexts
  * the format of distributional representations greatly varies
    depending on the specific aspects of meaning they are designed to model
* Turney (2006b) calls
  * attributional similarity
    * taxonomic semantic relations such as synonymy, co-hyponymy, and hypernymy
    * Words like dog and puppy, for example, are attributionally similar
    * their meanings share a large number of attributes:
      They are animals, they bark, and so on
  * relational similarity
    * the property shared by pairs of words (e.g, dog–animal and car–vehicle)
      linked by similar semantic relations (e.g., hypernymy)
    * despite [that the words in the pairs are not] attributionally similar
      (e.g., dog is not similar to car, nor is animal to vehicle)
    * Turney [represents pairs] in the space of the 
      patterns that connect them in the corpus
    * Turney ... solving analogies and harvesting instances of relations
    * relation extraction algorithms
      (Hearst 1992, 1998; Girju, Badulescu, and Moldovan 2006;
      Pantel and Pennacchiotti 2006)
      also rely on relational similarity, and focus on
      learning one relation type at a time (e.g., finding parts)
* cognitive science and linguistics ... typically represent 
  concepts as clusters of properties (Jackendoff 1990; Murphy 2002)
  * noun properties known ... as qualia roles (Pustejovsky 1995), and
    * Cimiano and Wenderoth (2007) identify e.g. the constitutive parts
  * verb selectional preferences (Erk 2007),
    * productive semantic phenomena (eating topinambur = csicsóka)
  * argument alternations
    (Merlo and Stevenson 2001; Joanis, Stevenson, and James 2008),
  * event types (Zarcone and Lenci 2008), and so forth
  * “topical” relatedness between words
    * e.g. relation between dog and fidelity
    * Topical relatedness, addressed by DSMs based on _document_ distributions
      such as LSA (Landauer and Dumais 1997) and
      Topic Models (Griffiths, Steyvers, and Tenenbaum 2007), is
      not further discussed in this article
* applications in computational lexicography, especially for
  * automatic thesaurus construction (.. Kilgarriff+ 2004; Rapp 2004)
  * lexical semanticists[, provide synonymy] with more robust empirics
  * semi-automatic bootstrapping or extension of terminological repositories,
    computational lexicons (e.g., WordNet), and ontologies (.. Lenci 2010)
* in linguistics, for instance in the study of
  * semantic change (Sagi, Kaufmann, and Clark 2009),
  * lexical variation (Peirsman and Speelman 2009), and
  * multiword expressions (Alishahi and Stevenson 2008)
* [large differences between DSMs]
  * corpus-based models hold promise as large-scale simulations of
    how humans acquire and use conceptual and linguistic information
    (Landauer and Dumais 1997)
  * cognitive (neuro)science: humans resort to a single 
    semantic memory, a relatively stable long-term knowledge database,
    adapting the information stored there to the various tasks at hand
    (Murphy 2002; Rogers and McClelland 2004)
  * [positive example:] WordNet (Fellbaum 1998), 
    a single, general purpose network of semantic information that 
    has been adapted to all sorts of tasks, 
    many of them certainly not envisaged by the resource creators
* we believe that the lack of generalization in corpus-based semantics stems
  from the choice of representing co-occurrence statistics directly as
  matrices [i.e.] binary relations between target items and their contexts
  * DM represents corpus-extracted co-occurrences as a third-order tensor, a
  * word–link–word tuples. Matrices are then generated from the tensor

# 2. Modeling Co-occurrence in Distributional Semantics 4

* unstructured DSMs: not use the linguistic structure of texts
* structured DSMs, co-occurrence statistics are ...  corpus-derived triples:
    * word pairs and the
      * parser-extracted syntactic relation or
      * lexico-syntactic pattern that links them (..Rothenhäusler & Schütze 09)
      * Sketch Engine “word sketches”: two words linked by a grammatical rel
        (Kilgarriff+ 2004). 
        The number of shared triples is used to measure the attributional sim
  * more sparse (because there are more triples than pairs)
* DM is built upon the structured DSM idea
* Structured DSMs extract a much richer array of distributional information
  * but they still represent it [as] two-way matrix,
    either by dropping one element from the tuple (Padó and Lapata 2007) or,
    more commonly, by concatenating two elements
* debate in DSMs so far
  * context choice
    e.g. lexical collocates vs. documents (Sahlgren 2006; Turney & Pantel 2010)
  * structured contexts (Padó and Lapata 2007; Rothenhäusler and Schütze 2009)
* DM: the core geometrical structure ... is a three-way object
  * semantic spaces are then generated [through] tensor matricization
    * produces both familiar spaces, similar to those commonly used ... and
      other less known distributional spaces, which will yet prove useful
    * all these different semantic spaces are now alternative views of the same
      underlying ... distributional memory, harvested only once from the corpus
    * turned into a general purpose resource for semantic modeling
  * allows distributional information to be represented in a [symbolic] way
    * similar to other types of knowledge in linguistics, cog science, and AI,
      * semantic and conceptual knowledge is represented in terms of 
        symbolic structures built around typed relations between elements
      * synsets, concepts, properties, and so forth: customary in lex

# 3 The Distributional Memory framework 6

## 3.1 Weighted Tuple Structures

* weighted distributional tuples that 
  * encode ... typed co-occurrence relations among words. Let W 1 and W 2 be
  * L is a set of strings representing syntagmatic co-occurrence links between
    words in a text. T ⊆ W 1 × L × W 2 is a set of corpus-derived tuples t =  w
  * e.g. `<marine, use, bomb>`  encodes [a] piece of distributional information
  * _use_ specifies the type of the syntagmatic link between [the two] words.
* In this article, we make the further assumption that W 1 = W 2 . This is a
* we enforce an inverse link constraint such that for any link l in L,
* matricization process described in Section 3.3 to 
  generate exactly four distinct vector spaces that, as we discuss there, are
* See Section 6.6 of Turney (2006b) for a discussion of similar assumptions.
  Turney, Peter (CL 2006) Similarity of semantic relations
* in the general formalism, 
  * W 2 could be a larger set of “relata” including 
    documents, morphological features, or even visual features
  * inverse link constraint might not be appropriate, for example, if 
    * asymmetric association measure, or if 
    * we are only interested in one direction of certain grammatical relations.

## 3.2 Labeled tensors 8

* a fiber [in higher order tensors] is obtained by fixing the values of all
  indices but one
  * A mode-n fiber is a fiber where only the n-th index has not been fixed. For

## 3.3 Labeled tensor matricization 9

* The simplest case is mode-n matricization, which 
  * Kolda 09: In this review, we consider only the special case of mode-n
    matricization because it is the only form relevant to our discussion. A
    more general treatment of matricization can be found in Kolda [134].
    * [134] TG Kolda , Multilinear Operators for Higher-Order Decompositions,
      2006 Tech. Report SAND2006-2081, Sandia National Laboratories
  * arranges the mode-n fibers to be the columns of the resulting matrix (where
* In DM, matricization is applied to [get] matrices whose row and column vector
  spaces correspond to the linguistic objects we want to study; that is, the
  * outcome of matricization must be labeled matrices. Therefore, 
  * we must ... determine the labels of the [fibre] index
  * use the [tuple] formed by the labels of the [N-1] index elements that are
    fixed.  Specifically, each mode-n fiber of a tensor X λ is labeled with the
* Under the assumption that W 1 = W 2 and the inverse link constraint, 
  matricizing the [labeled third-order tensor X λ yields only] the following
  four distinct semantic vector spaces:
  * word by link–word (W 1 × LW 2 )
    * words x features such as  use, gun  or  own, book  
    * we can measure the similarity of words to each other, in order to tackle
      attributional similarity tasks such as 
      synonym detection or concept categorization
  * word–word by link (W 1 W 2 × L)
    * represent word pairs in a space whose dimensions are links, and it can be
      used to measure relational similarity among different pairs
    * vector of /sergeant, gun/ is highly similar to that of /teacher, book/
  * The other two [spaces] look less familiar, [but subsume] interesting sem
  * word–link by word (W 1 L × W 2 )
    * capture different verb classes based on the argument alternations
    * We will show in Section 6.3 how
    * e.g. the object slot of kill is similar to the subject slot of die
    * generalizing from similar observations, that [this slot] is a theme
  * link by word–word (L × W 1 W 2 ) 
    * The usefulness of this will of course depend on what the links are
    * We will illustrate in Section 6.4 one function of this space, namely, to
    * feature selection: picking links that can then be used to determine a
      meaningful subspace of the W 1 W 2 × L space.  
* possible uses we can make of the labeled tensor. In 
  * Direct matricization [above]
  * Section 6.5: smoothing through tensor decomposition. Other possibilities,
  * graph-based algorithms operating ... on the graph defined by the tensor
    (Baroni and Lenci 2009), or 
  * deriving unstructured semantic spaces ... by removing one of the indices,

# 4 Related work 12

* other unified approaches
* We will point out connections to related research specific to the various
  tasks in the sections devoted to describing their reinterpretation in DM
* we briefly discuss two other studies that explicitly advocate a uniform
  + one article that, like us, proposes a tensor-based formalization of
    corpus-extracted triples. See Turney and Pantel (2010) for a very recent
* Padó and Lapata (2007), partly inspired by Lowe (2001), have proposed an
  * a corpus-based semantic model is characterized by
    1. a set of functions to extract statistics from the corpus,
    1. construction of the basis-by-target-elements co-occurrence matrix, and
    1. a similarity function operating on the matrix
  * Our focus is entirely on the second aspect
  * Padó and Lapata (2007) is designed only to address ... attributional sim
* Turney (2008) shares with DM the goal of unifying attributional and rel sim
  * tasks that are traditionally solved with an attributional similarity
    can be recast as relational similarity tasks
  * e.g. what the typical patterns are that connect synonym pairs
  * uses a single generic algorithm, but must go back to the corpus [each task]
  * extracting features from the corpus requires [much] NLP know-how, whereas
    DM representation of distributional data as weighted triples is
    more akin to other standard knowledge representation formats: typed rels
    * familiar to most computer and cognitive scientists
  * At a more abstract level, DM and [Turney] differ in the
    strategy with which unification in distributional semantics is pursued
    * Turney’s approach amounts to picking a [source] task and
      reinterpreting other tasks as its particular instances
    * i.e. attributional sim is a subtype of relational
  * [Turney’s focus] is on dimensionality reduction applied to tensors, and the
* higher-order [language] tensor dimensionality reduction [aka. decomposition]
  * Turney (2007) and Van de Cruys (2009)
    can be applied to the DM tensors before matricization
    We present a pilot study in this direction in Section 6.5

# 5 Implementations of the DM framework 14

## 5.1 Extraction of Weighted Tuple Structures from Corpora

* we experiment with three different DM models, corresponding to different ways
  * All models are based on ... word–link–word tuples from a dependency parse
* corpus ... contains about 2.83 billion tokens <~ ukWaC, Wikipedia, etc
* approximately the top 20,000 most frequent nouns and top 5,000 Vs and ADJs
  * augmenting the list with lemmas that we found in [the] standard test sets,

### DepDM

* only lexicalized links are prepositions)
* noun–verb, noun–noun, and adjective–noun links
* For each link, we also extract its inverse (this holds for all our DM models)
* weights [i.e. scoring function is] Local Mutual Information (LMI) computed on
  * an approximation to the log-likelihood ratio measure that has been shown to
    be a very effective weighting scheme for sparse frequency counts
    (Dunning 1993; Padó and Lapata 2007)
  * can also be interpreted as the dominant term of average MI or as
  * a heuristic variant of pointwise MI to
    avoid its bias towards overestimating the significance of low frequency
    events, and it is
  * nearly identical to the Poisson–Stirling measure (Evert 2005)
  * does not require keeping track of the full 2 × 2 × 2 contingency table,
    which is the case for the log-likelihood ratio

  * negative weights ... are raised to 0
    * Following standard practice (Bullinaria and Levy 2007),
  * non-zero tuples [is about 110M, including] inverses. 30, K × 796 × 30, K

### LexDM

* idea: the lexical material connecting two words is very informative about rel
  (Hearst 1992; Pantel and Pennacchiotti 2006; Turney 2006b)
  * LexDM contains complex links: pattern +suffix
  * suffix is in turn formed by [the feats of w1 and w2] separated by a +
  * features: their
    * POS and morphological features (number for nouns, number and tense for V)
    * presence of an article (further specified with its definiteness value)
  * presence of adjectives/adverbs, modals, and auxiliaries for verbs, etc
    * If the adjective (adverb) [is] high frequency, the suffix string contains
      the adjective (adverb) itself, otherwise only its POS

### TypeDM

* idea, motivated and tested by Baroni+ (2010)— but
  * see also Davidov and Rappoport (2008a, 2008b) for a related method—that
  * what matters is ... the variety of surface forms that express a relation
  * e.g. fat, of^{-1}, land (a figurative expression) is much more common than
    the semantically more informative  fat, of^{-1}, animal
  * different surface realizations
    * land: only three of them
      (the fat of the land, the fat of the ADJ land, and the ADJ fat of the l)
    * _animal_ has nine realizations (a fat of the animal, the fat of the...)

### To sum up, the three DM instance models

* differ in the
  degree of lexicalization of the link set, and/or in the
  scoring function
* LexDM is a heavily lexicalized model, contrasting with
* DepDM, which has a minimum degree of lexicalization, and consequently the
* TypeDM [is] middle level both for the kind and the number of links
* lexical information encoded in the
  * LexDM suffixes:  generate different links,
  * TypeDM: different counting scheme as part of a different scoring function

## 5.2 Semantic Vector Manipulation

* Vector length and normalization. The length of a vector v with dimensions v
* Cosine. We measure the similarity of two vectors x and y by the cosine
  * Other similarity measures, such as Lin’s measure (Lin 1998b), work better
    than the cosine in some tasks (Curran and Moens 2002; Padó and Lapata 2007)
  * cosine is the most natural similarity measure in the geometric formalism
* Vector sum. Two or more vectors are summed in the obvious way, by adding
  * We always normalize the vectors before summing
  * We refer to it as the centroid of the vectors
* Projection onto a subspace. It is sometimes useful to measure length
* e.g. the  subspace in which only dimensions such as `<obj, sing>` have non-0

# 6 Sem Experiments 18

* alternatives are conceivable [with respect to space selection and operations]
  * Turney (2008) models synonymy detection with a DSM that closely resembles
    our W 1 W 2 × L space, whereas we tackle this task under the more standard
    W 1 × L W 2 view.  It is an open question whether there are principled ways
* Most experiments report global (micro-averaged) test set accuracy (alone, or
  combined with other measures) to assess the performance of the algorithms.

## 6.1 The W 1 ×LW 2 Space 20

## 6.2 The W 1 W 2 ×L Space 27

## 6.3 The W 1 L×W 2 Space 34

## 6.4 The L×W 1 W 2 Space 37

## 6.5 Smoothing by Tensor Decomposition 39

# 7 Conclusion 41

* [requirements for a] general framework for distributional semantics
 1. [unified representation of corpus-derived data] to capture diff aspects
 1. common representation to address a large battery of semantic experiments,
    achieving a performance at least comparable to that of state-of-art, task-
1. unified representation
  * semantic problems that do not fall into the attributional or the relational
    paradigm (group verbs by alternations, Hearst patterns for a rel)
  * [some] tasks can be reframed in terms of our four semantic spaces using
    geometric operations such as centroid computations and projection
    * This was the case for selectional preferences,
      pattern~ and example-based relation extraction (illustrated by qualia), &
      generating typical properties of concepts
2. [performance on] a large battery of semantic experiments
  * in nearly all test sets our best implementation of DM (TypeDM) is \ge SOTA
  * often towards (or at) the top of the state-ofthe-art ranking
  * Where other models outperform TypeDM by a large margin, there are reasons
    * rivals have been trained on much larger corpora, or they rely on
      special knowledge resources, or on sophisticated machine learning algos
* [unified repr:] one could [compare alternative DMs on] attributional tasks,
  and expect the best DM in these tasks to also be the best in relational tasks
* The final experiment of Section 6 briefly explored
  improving performance on some tasks by working directly on the tensor
  * tensor rank reduction for smoothing purposes) rather than on the matrices
    derived from it
* Parameter tuning is an important aspect in DSM development, with an
  often dramatic impact of parameter variation
  (Bullinaria and Levy 2007; Erk and Padó 2009)
* issues still open
* separating
  * corpus-based model building, the
  * multi-purpose long term distributional memory, and
  * different views of the memory data to accomplish different semantic tasks,
  * some general advantages follow
    * stable distributional resources
      * going back to the analogy with WordNet as a semantic multi-purpose rsrc
        If you want to improve performance of a WordNet-based system,
        you will probably not wait for its next release, but rather
        improve the algorithms that work on the existing WordNet graph
      * corpus-based resources for distributional semantics should be
        relatively stable, multi-purpose, large-scale databases
        only occasionally updated (because a better or larger corpus becomes
        available, a better parser, etc.)
      * given a certain task,
        much work can be done to exploit the DM optimally in the task
        e.g. attributional tasks could be raised by dimension re-weighting
        e.g. Zhitomirsky-Geffet and Dagan (2009)
      * [topic continued 9 lines bellow]
* sparseness in the W 1 W 2 × L space, we could
  treat the tensor as a graph and explore
  random walks and other graphical approaches that have been shown to
  “scale down” to relations in sparser data sets (Minkov and Cohen 2007, 2008)
  * our ... example of smoothing relational pairs with attributional neighbors,
  * combining different views of DM, and/or resorting to different (sub)spaces
    within the same view, as in our approach to selectional preferences
  * algorithmic way to mix and match the spaces as most appropriate to a task
* split for the role of supervision in DSMs
  * DM tensor from the corpus is most naturally framed as an unsupervised task,
    because the model will serve many different purposes.  On the other hand,
    supervision can be of great help in tuning the DM data to specific tasks
    (as we did, in a rather naive way, with the nearest centroid approach to
    most non-attributional tasks)
  * [topic continued in the last point of this note]
* [compositionality] construction of meaning for constituents > words
  * traditional domains of formal semantics, which is most interested in how
  * build new bridges between corpus-based semantics and symbolic models
    (Clark and Pulman 2007; Widdows 2008)
  * representing symbolic operations with distributed, vector-based data
    structures (Markman 1999)
  * avenues [in corpus-based semantics, and interesting synergies] with areas
    * neural systems (Smolensky 1990; Smolensky and Legendre 2006),
    * quantum information (Widdows and Peters 03; Aerts and Czachor 04;
      Widdows 04; Van Rijsbergen 04; Bruza and Cole 05; Hou and Song 09)
    * holographic models of memory (Jones and Mewhort 2007), and so on
    * distributional representations [sensitive to syntax] (Erk and Padó 2008)
* A multi-purpose, distributional semantic resource like DM can
  allow researchers to focus on the next steps of semantic modeling
  * modulating word meaning in context (Erk and Padó 2008; Mitchell and Lapata
    2008) and finding ways to
  * embed the distributional memory in complex
    NLP systems (e.g., for question answering or textual entailment) or even
    embodied agents and robots
* DM-style triples [in] semantic representation models
  (e.g., semantic networks) and knowledge-exchange formalisms such as RDF
  * integration of corpus-based information with other knowledge sources
  * dialogue [with] the computational neuro-cognitive community, where it is
    common to adopt triple-based representations of knowledge, and to use the
    same set of tuples to simulate various aspects of cognition
    * extended example of this approach, see Rogers and McClelland (2004). It
      would be relatively easy to use a DM model in lieu of their neural
      network, and use it to simulate the conceptual processes they reproduce
* [once more on the split]
  * acquisition phase (corpus-based tuple extraction and weighting), the
  * declarative structure at the core of semantic modeling (the DM), and the
  * procedural problem-solving components (possibly supervised for each sem ts)
  * in line with what is commonly assumed in
    cognitive science and formal linguistics, and we hope it will contribute to
    make corpus-based modeling a core part of the ongoing study of
    semantic knowledge in humans and machines

# Acknowledgments 45
