Magnus Sahlgren
The Word-Space Model
  Using distributional analysis to represent syntagmatic and paradigmatic
  relations between words in high-dimensional vector spaces
PhD 2006

# Abstract

* three main theoretical cornerstones of the word-space model
  * geometric metaphor of meaning, the
  * distributional methodology, and the
  * structuralist meaning theory
* two different types of relations between words
  * syntagmatic or paradigmatic relations
  * depending on how the distributional patterns of words are used to
    accumulate word spaces

## 1.5 road map

* chapters
  2. what the word-space model is,
  3. and 4. how it is produced, and
  5. to 15. what kind of semantic information it contains
  16. summarizes and concludes the dissertation
* four different parts
  1. theoretical background, (Chapters 2 to 4)
  2. my main contribution
  3. foreground, experiments (Chapters 8 to 14)
  4. concludes the text
* the main contribution of this dissertation is theoretical

## 3.3 A brief history of context vectors

* Osgood’s feature-space approach was the major influence for early
  connectionist research that used distributed representations of meaning
  (Smith & Medin, 1981; Cottrell & Small, 1983; Small+ 1988)
* One of the most influential heirs is Waltz & Pollack (1985), who used
  * micro-features to represent the meaning of words
    * distinctive pairs such as _animate-inanimate_ and _edible-inedible,_
      (on the order of a thousand) were represented as a vector
* Stephen Gallant, who introduced the term _context vector_ to describe the
  feature-space representations (Gallant, 1991a, 1991b)
  * manually derived features, such as _human, man, machine,_ etc. A
  * still used in cognitive science, by, e.g., Gärdenfors (2000)
    under the term conceptual spaces
* automatic methods to construct feature spaces
  * dynamic context vectors computed from the contexts (Gallant 1991b)
    * algorithm can be described as a two-step operation (Gallant, 2000):
      1. A context vector is initialized for each word as a normalized random v
      2. in several passes through the corpus, the context vectors are changed
         to be more like the context vectors of the surrounding words
         * method resembling Kohonen’s Self-Organizing Maps (Kohonen, 1995)
    * used for
      * word-sense disambiguation, by comparing them to the manually defined
        ones (Gallant, 1991b), and for
      * information retrieval, by defining document vectors as the weighted sum
        of the context vectors of the constituent words (Gallant, 1991a, 2000)
  * Other early attempts at deriving context vectors automatically
    * Wilks+ (1990), Schütze (1992), Pereira+ (1993), and Niwa & Nitta (1994)
    * most influential has been Hinrich Schütze (1992, 1993), who builds
      context vectors (which he calls _term vectors_ or _word vectors_)
      * co-occurrence counts are collected in a words-by-words matrix

## 3.5 Similarity in mathematical terms 41

* Minkowski metric `l`-metrika
* Widdows (2004) points out, these measures are not ideal to use for word-space
  * the scalar product favors frequent words
  * Minkowski metrics have the opposite problem: frequent words will be far
* solution to this problem is to factor out the effects of vector length

## 4.5 Hyperspace Analogue to Language 49

* the Hyperspace Analogue to Language (HAL, Lund+ 1995)
  * developed specifically for word-space research, and
  * explicitly influenced by Schütze’s paper from 1992
* words-by-words co-occurrence matrix, which is populated with co-occurrences
  * directional context window 10 words wide
  * weighted with the distance between the words
* Each row–column pair (i.e. the left and right-context co-occurrences) is then
  concatenated to produce a very-high-dimensional context vector
* dimensionality reduction
  * only if such very-high-dimensional vectors are too costly (Burgess+ 1998)
  * discarding the elements with lowest variance, leaving only 100 to 200
* normalization of the vectors to unit length;
* a Minkowski metric to compute vector similarities

## 4.6 Random Indexing

* Random Indexing (RI, Kanerva+ 2000; Karlgren & Sahlgren, 2001; Sahlgren, 2005)
  * developed at the Swedish Institute of Computer Science (SICS)
  * based on sparse distributed memory (Kanerva, 1988)
  * motivated first and foremost by the problem of high dimensionality
    * the problem of initially having to collect a potentially huge mx
    * RI removes the need for the huge co-occurrence matrix
* incrementally accumulates context vectors, which
  * can then, if needed, be assembled into a co-occurrence matrix
  * either words-by-documents and a words-by-words co-occurrence matrix
* two-step operation:
  1. Each context in the text is assigned a unique and randomly generated
     representation called an index vector. In RI, these index vectors are
    * sparse, high-dimensional, and ternary
    * Each word also has an initially empty context vector of the same
      dimensionality r as the index vectors
  2. The context vectors are then accumulated by advancing through the text one
     word token at a time, and adding the context’s r-dimensional index
     vector(s) to the word’s r-dimensional context vector

# 6 Rethinking the distributional hypothesis 65

* the distributional hypothesis, as motivated by the works of Zellig Harris
  * states that differences of meaning correlate with differences of
    distribution, but he
  * neither specifies what kind of distributional information we should look
    for, nor what kind of meaning differences it mediates

## 6.1 The origin of differences: Saussure

## 6.2 Syntagma and paradigm 60

* Syntagmatic relations concern positioning, and
  * Greek word _suntag-matikos,_ which means arranged, or put in order. The
  * relate entities that co-occur in the text; it is a relation in praesentia
  * a linear one, and applies to linguistic entities that occur in
    sequential combinations
  * combinatorial relations, which means that
    words that enter into such relations can be combined with each other. A
    syntagm is such an ordered combination of linguistic entities. For
  * written words are syntagms of letters, sentences are syntagms of words
* Paradigmatic relations, on the other hand, concern substitution, and
  * Greek word _paradeigmatikos,_ which means serving as a model
    * Saussure himself never used the word _paradigmatique._
    * According to Harris (2001), it was Hjelmslev who coined the term
    * as a substitute for Saussure’s _rapports jelentések associatifs_
  * relates entities that do not co-occur in the text; it is a relation in
    absentia
  * hold between linguistic entities that occur in the same context but not at
    the same time
  * A paradigm is thus a set of such substitutable entities
* usually depicted as orthogonal axes in a 2-dimensional grid

## 6.3 A Saussurian refinement

* Although Harris was arguably more directly influenced by the works of
  Bloomfield than of Saussure, the latter’s structuralist legacy is
  foundational for both Bloomfield’s and Harris’ theories
* A Saussurian refinement of the distributional hypothesis
  * clarifies the semantic pretensions igény of the word-space model, but it
  * elucidates megmagyarázza the distributional methodology
  * A word-space model accumulated from
    * co-occurrence information contains syntagmatic relations between words
    * information about shared neighbors contains paradigmatic relations

## 7 Syntagmatic and paradigmatic uses of context 71

* very few studies have investigated the effects of using different contexts
* other word-space parameters have been meticulously scrutinized
  * Nakov+ (2001), who studied different weighting schemes in LSA;
  * Bingham and Mannila (2001) different dimensionality-reduction techniques
  * Weeds+ (2004), who studied different similarity measures
  * The only previous investigation of different contexts is by Lavelli+ (2004)
* different word-space algorithms use different contexts
  * e.g
    * LSA uses a words-by-documents matrix,
    * HAL uses a directional words-by-words matrix, and
    * RI can be used to approximate both of these representations
  * Despite their difference, most wordspace implementations
    arrive at the same kind of meaning representations
* syntagmatic and paradigmatic relations between words should be discoverable
  by using co-occurrence information and
  information about shared neighbors, respectively
  * a qualitative comparison between these different uses of context should be
    able to divulge this difference by empirical investigation
* this chapter:
  what these different uses of context entail, what their differences are, and
  how they can be used to build word spaces

## 7.1 Syntagmatic uses of context 72

can be characterized by the size of the context region

## 7.2 The context region

* word-space algorithms that prefer a syntagmatic use of context, such as LSA,
  hail from the information retrieval community, where a document is a natural
  context of a word
* “document” in the sense of a topical unit is an artificial notion that
  hardly exists elsewhere;
  * before the advent of library science, the idea that the content of a text
    could be expressed with a few index terms must have seemed strange
  * In the “real” world, content is something we reason about, associate to,
    and compare
  * In the world beyond information-retrieval,
    text is a continuous flow where topics intertwine and overlap and
    the notion of a “document” is at best an arbitrary choice
  * In a whole document nearly every term can co-occur with every other
* a better context would be a clause or a sentence,
  since they seem to be linguistic universals
  * used by Rubenstein & Goodenough 65, Miller & Charles 91, and Leacock+ 96
* a small context region
  * very few words — basically only collocations — co-occur often there
  * the majority of terms never co-occur (Picard 1999)
  * The smaller the context regions, the worse the sparse-data problem

## 7.3 Paradigmatic uses of context 74

* need not only consist of words that share the same immediately preceding or
  succeeding neighbor or neighbors
* three parameters of the characterization of paradigmatic contexts
  1. The size of the context region
  2. The position of the words within the context region
  3. The direction in which the context region is extended

## 7.4 The context window

* most researches favor the use of statically-sized context windows
  * _focus word_ to refer to the word in the middle of the context window
  * The context window is normally advanced one word at a time
    * a so-called sliding context window
* position: imagine that we would like to exclude the arbitrary modifiers
* weight the positions in the context window more finely
  * see Section 8.5
* size: how many words to the left and to the right should we count?
  * Schütze (1992) uses a window size of 1~000 characters
    * a few long words are possibly better than many short words,
      which tend to be high-frequency function words
  * Yarowsky (1992) uses 100 words, while Gale+ (1994) uses 50+50 words
    for “broad topic classification”
  * Schütze (1998) uses a 50-word window, whereas Schütze & Pedersen (1997) 40
  * Niwa & Nitta (1994) uses a 10+10-sized window
  * HAL algorithm uses a directional 10-word window
  * Black+ (1988) uses narrow windows spanning 3–6 words,
  * Church & Hanks (1989) used 5 words, and
  * Dagan+ (1993) uses a window spanning 3 words, when ignoring function words
* evidence for the feasibility of using a fairly small context window
  * Kaplan (1955) asked people to identify the sense of a polysemous word
  * They were almost always able to do so when shown a 2+2-sized context
    * replicated with the same result by Choueka & Lusignan (1985)
  * Karlgren & Sahlgren (2001) use a narrow context window for semantics
* a példában látszik:
  * syntagmatic: context = sentence
  * paradigmatic: context = word

## 7.5 What is the difference? 77

* Schütze & Pedersen (1997) argue that a paradigmatic small window context
  is both quantitatively and qualitatively better
* Picard (1999) observes that a syntagmatic use of context can only be used for
  very frequent words, while a paradigmatic use may be applied for all words
* syntagmatic use of context favor statistical dimensionality-reduction
  * smooths the original co-occurrence counts. As we saw in Section 4.4,
  * alleviates the problem with data sparseness. Furthermore, it
  * grouping together words that occur in similar contexts —
    i.e. it approximates paradigmatic relations
  * “poor man’s” paradigmatic relations. This is a very useful tactic
* Schütze (1992): it is unnecessary to apply SVD when using paradigmatic
  contexts, since they are already dense, and contain paradigmatic rels

## 7.6 And what about linguistics?

* linguistic sophistication in the use of contexts
* HAL includes at least word order into the directional co-occurrence
  * thrown away in the final stages of the algorithm
    when the row and column vectors are concatenated
* The only experiment I am aware of that exploits the directional information
  in a words-by-words co-occurrence mx is Schütze & Pedersen (1993), see 15.6
* decrease in performance because adding part-of-speech information
  * increases the number of unique words in the data, thus
    aggravating the sparse-data problem
  * In Karlgren & Sahlgren (2001) RI on a synonym test
    * adding POS decreased the performance for all sizes but a minimal 1+1
  * Wiemer-Hastings & Zipitria (2001) LSA
  * Widdows (2003) when enriching the WordNet taxonomy
    * POS improves the representation for common nouns, but
      not for proper nouns or verbs
* Padó & Lapata (2003) uses syntactically parsed data to build contexts
  * inspired by the works of Strzalkowski (1994) and Lin (1997, 1998a, 1998b)
* Hindle (1990) used predicate–argument structure
  to determine the similarity of nouns;
* Hearst (1992), who extracted hyponyms by using lexical–syntactic templates;
* Ruge (1992), who used head–modifier relations for extracting similar words;
* Grefenstette (1992a, 1992b, 1993) used syntactic context to measure
  similarity between words

# 8 Experiment setup 83

the data, the preprocessing, the transformation and weighting schemes, the
word-space implementation, the software, the tests, and the evaluation metrics

## 8.1 Data

* Touchstone Applied Science Associates (TASA) corpus, 1 which consists of
  * high-school level English texts on a number of different topics such as
  * divided into sections spanning approximately 150 words. This means that
  * I can use both sentences and sections for the syntagmatic uses
  * small enough to avoid dimensionality reduction for most experiments
* I label the context regions that span approximately
  * 150 words large context regions
  * 12–17 words small context regions

## 8.2 Preprocessing

* morphological normalization

## 8.3 Frequency thresholding

* frequency thresholding for words with frequency less than 50
  * In Chapter 9, I use a frequency threshold of 20 instead, and
  * for the synonym test in Chapter 12 that only involves 400 words, I
    experiment with different frequency thresholds
    for both low-frequency and
    high-frequency words.  Frequency thresholding
* can be done either as a preprocessing step or by neglecting
  * I opt for the latter approach
  * non-indexed words in the context window will have weight 0
* For tests with a specified vocabulary ..., the frequency threshold does not
  apply to the context vectors for the test words

## 8.4 syntagmatic: Transformation of frequency counts

* I optimize in each particular task
* four different transformations for the syntagmatic uses of context
  * binary: the elements of the vectors are either 1 or 0
  * dampened, computed as log(tf + 1)
    * logarithms of the frequency of occurrence of the word in the context
  * tfidf, computed as log(tfidf + 1)
  * raw: the elements are the raw frequency of occurrence of the word
* notation for the parameters involved in syntagmatic uses of context
  * c is the context region (+ for large and − for small)
  * `a`

## 8.5 paradigmatic: Weighting of context windows

* two weighting schemes for the slots for the paradigmatic uses
  * Constant weighting over the window
  * Aggressive distance weighting according to the formula `2^{1−l}`
* these are extremes around other possibilities like
  * linear distance weighting where the weight decreases with some constant
  * 1/l where l is the distance to the focus word.  Figure 8.1

## 8.6 Word-space implementation

* no dimensionality reduction of the context vectors in these experiments
  * I do not want it to interfere with syntagmatic vs paradigmatic

## 8.7 Software

## 8.8 Tests

* different tests measure syntagmatic and paradigmatic relations to
  different degrees
  * syntagmatic and paradigmatic relations are not mutually exclusive
* Most of the following tests use some sort of lexical resource for comparison

## 8.9 Evaluation metrics

* in ch 10, 11, 13, and 14, I employ two different evaluation metrics
  * lax(h) and strict(h) settings
  * h defines the number of nearest neighbors extracted from the word space
  * lax setting: whether any of the word-space neighbors are good
  * strict setting means looking at all
* For the
  * thesaurus comparison and the association test, I use
    lax(1) and strict(h) evaluation, where h is the number of words listed
  * antonym test, which consists of word pairs, I use lax(10) and strict(1)
  * part-of-speech test, I use lax(1) and strict(10)

# 15 Analysis 127

* remains unclear to what extent the word spaces contain syntagmatic and
  paradigmatic information, and which parameters influence this distinction?
* In this chapter, I will further analyze the results
  1. take a closer look at the effects of the different parameters
  2. a comparative analysis of the performance of the different word spaces
  3. related research

## 15.1 The context region

|Test	        |Strict	|Lax	  |
|-------------|-------|-------|
|Thesaurus	  |large	|large	|
|Association	|small	|small	|
|Synonym	    |large	        |
|Antonym	    |large	|same	  |
|PoS	        |small	|large	|

## 15.2 Frequency transformations

* binary counts tend to produce good results for the small regions, whereas
  tfidf-transformations produce good results for the large context regions

## 15.3 The context window for the paradigmatic uses of context 130

* narrow windows seem optimal for thesaurus, synonym, and POS
* wider windows seem optimal for the association and antonym tests
* consistently over the evaluation metrics

## 15.4 Window weights for the paradigmatic uses of context

* weighting of the positions in the context windows is suboptimal for most

## 15.5 Comparison of contexts 131

* Table 15.6
  * the degree to which the relations are essential to the test (− and +), and
  * context that yields the best results in the strict evaluation settings

|Test	        |Relation (essnt?)|Context  |
|-------------|-----------------|---------|
|Thesaurus	  |both (−)	        |large	  |
|Association	|syntagmatic (+)	|small	  |
|Synonym	    |paradigmatic (+)	|narrow	  |
|Antonym	    |paradigmatic (−)	|wide	    |
|POS	        |paradigmatic (+)	|narrow	  |

* observation that
  * syntagmatic are more refined when the regions are smaller, while
  * paradigmatic representations are more refined the smaller the context

## 15.6 Related research 133

* Schütze & Pedersen (1993) compute syntagmatic and paradigmatic relations
  * paradigmatic similarity by comparing the left or the right vectors,
  * syntagmatic similarity by comparing the left and the right vectors
* Rapp (2002) experiments with techniques to extract paradigmatic and
  syntagmatic relations between words. He uses
  * narrow context windows for the paradigmatic relations, and a
  * log-likelihood ratio of co-occurrence for the syntagmatic relations
* argue for the supremacy of paradigmatic uses of context
  * Lavelli+ (2004), who compare what they call
    * document occurrence representation, dfitf (DOR) and
      * corresponds to syntagmatic contexts with normalized word type count
    * term co-occurrence representation, tfitf
      * corresponds to paradigmatic contexts whith the context window being an
        entire document, and again a of normalized word type count
    * compared in term categorization and term clustering
    * paradigmatic (TCOR) representations outperform the syntagmatic (DOR) ones
    * They also claim that the paradigmatic representations are more
      discriminative (as measured using a function based on mutual information)
  * Stiles (1961); Rubenstein & Goodenough (1965), Grefenstette (1992b), and
    Charles (2000)
* Both types of context usage are therefore equally well-motivated,
  both empirically and theoretically

## 15.7 The semantic continuum

* small context regions yield more syntagmatic word spaces, while
* narrow context windows yield more paradigmatic spaces

# 16 Conclusion 139

## 16.1 Flashbacks

* background-chapters discussed the underlying
  * theoretical assumptions
    (the geometric metaphor of meaning and the distributional hypothesis), the
  * methodology (the notion of context vectors), and the
  * most common implementations of word-space models (LSA, HAL and RI)
* setting the scene: syntagmatic vs paradigmatic
  * how to evaluate word spaces: we need a theory of meaning
  * the origins of the distributional paradigm (the Cours de linguistique...)
  * structuralist dichotomy of syntagma and paradigm
  * two corresponding types of uses of context for producing context vectors
* foreground-chapters
  * experiments demonstrating the
    differences between syntagmatic and paradigmatic uses of context
  9. the overlap between syntagmatic and paradigmatic word spaces
    * only a few percentage of the nearest neighbors occur in both types
  * The rest of the experiments compared  word-spaces to
    * the association test is the only test that primarily measures syntagmatic
      relations, while the other tests are primarily paradigmatic
    10. thesaurus entries: in which words with related(?) meanings are listed
    11. association norms
    12. a synonym test, percentage of correct answers
    13. a list of antonym pairs
    14. part-of-speech assignments
    * a consistent difference between word spaces produced through syntagmatic
      vs paradigmatic uses of context
  15. analyzed and scrutinized the results from the experiments, and also
      provided a brief review of related research

## 16.2 Summary of the results

* On the theoretical side, I have argued that the word-space model uses the
  * geometric metaphor of meaning as representational basis, and the
  * distributional methodology as discovery procedure

## 16.3 Answering the questions

* Is it at all possible to extract semantic knowledge by merely looking at
  usage data? Clearly: yes
* Does the word-space model constitute a complete model of the full spectrum of
  meaning, or does it only convey specific aspects of meaning?
  * complete, if what we mean by “meaning” is a structuralist dichotomy of
    syntagma and paradigm
  * if we believe that meaning is essentially referential, then no

## 16.4 Contributions

## 16.5 The word-space model revisited

* I feel obliged to discuss a few remaining concerns
* internal structure of the spaces: word spaces may have
  * a common internal structure that can be utilized to differentiate
    between different types of relations within the word space;
  * a discoverable “latent” dimensionality,
    * density measure introduced in Chapter 9 is one attempt at digging a bit
* handle phrase-, clause-, sentence-, paragraph-, document and text-meaning too
  * compositionality is not without controversy in the philosophy of language
  * word-space representations have been used for a number of tasks,
    including text categorization and information retrieval
    * by simply combining the context vectors of the words
  * we can simply use vector addition for producing centroid vectors
    * does not mean that it is the best possible way to proceed
    * it is surprising that such a blunt use of vector spaces actually works
* its flexibility and ability to continuously evolve when subjected to a
  continuous data flow

## 16.6 Beyond the linguistic frontier 142

* not a psychologically realistic model of human semantic processing
* it is arguable that humans also use extralinguistic context when learning,
  understanding, and using language
* the inability to reach beyond the limits of textuality is the single most
  disqualifying feature of the word-space model
  * perhaps most obvious with regards to the referential aspect of meaning
