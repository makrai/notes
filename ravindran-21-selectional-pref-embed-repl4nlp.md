Syntagmatic Word Embeddings for Unsupervised Learning of Selectional Prefs
Renjith P. Ravindran, Akshay Badola, Narayana Kavi Murthy
ACL 2021 | IJCNLP | RepL4NLP

https://github.com/renjithravindran/ spvec

# Abstract

* Selectional Preference (SP) has generally required a parsed corpus
* We extend the general word embedding technique with directional word context
  windows giving word representations that better capture syntagmatic relations
* We test on the SP-10K dataset and demonstrate that
  * syntagmatic embeddings outperform the paradigmatic embeddings
  * We also evaluate supervised version of these embeddings and show that
    unsupervised syntagmatic embeddings can be as good as supervised
    embeddings. We also make available the source code of our implementation

# 1 Introduction

* Selectional Preference (SP, Wilks, 1975) encodes the syntagmatic relatedness
  * Relations between words are either syntagmatic or paradigmatic (de
    Saussure, 1916). Two words are said to be
    * paradigmatically related if one word can replace the other in a sentence
    * Syntagmatic relations are between syntactically related co-occurring
  * Such word relations encode both syntactic and semantic aspects of words
  * Common SP relations include ‘adjective-noun’, ‘subject-verb’, ‘verb-object’
  * applications
    * sense disambiguation (Resnik, 1997),
    * semantic role classification (Zapirain+ 2013),
    * co-reference resolution (Hobbs, 1978; Zhang+ 2019c),
* A computational method to induce SP from instances of syntactically related
  * Resnik (1996) made use of ontological classes obtained from WordNet
  * Rooth+ (1999) learning the classes from the corpus itself using EM
  * Erk (2007) via co-occurrence similarity between seen and unseen words
* usually evaluated using the Pseudo-word Disambiguation task (Van de Cruys 14)
  * identification of the more probable dependent word, from a less probable
* Zhang+ (2019b): SP-10K, a dataset for SP evaluation across 5 syntactic rels
  * 10,000 items each with a human-annotated plausibility score.  SP-10K
  * measures the correlation between a model’s SP score for a given word pair
    and the average human score
* current SOTA on SP-10K is Multiplex Word Embeddings (Zhang+ 2019a) It is
  * a negative sampling based word embedding model,
  * improves over D-embeddings (Levy and Goldberg, 2014a) which is a supervised
* We do this by taking directional (left/right) word context windows
  * gives two embeddings per word, one of its left and right context each
  * allows us to approximate syntactic relations with directions
  * relations that happen to the left of a word are captured by the left embed
  * the cosine similarity between the right embedding of a word and
    left embedding of another word indicates
    how likely the two are to be syntagmatically related
* contributions
  * a simple and effective method to capture selectional preference
  * Demonstrate that syntagmatic embeddings are superior to paradigmatic
  * We also show that our unsupervised syntagmatic representations can be
    as good as their supervised counterparts, therefore showing that
    a good range of SP info can be learned even without a dep-parsed corpus

# 4 Discussion

* why did the supervised models not have a bigger advantage? We can hypothesize
  * words that are not directly related by a dependency relation but are in the
    vicinity of a target word make substantial contribution to the semantics
  * low-rank embedding process is as good at removing noise as a dependency
* amod and dobj relations do benefit from supervision, although it is minor
* window-size on each of the dependency relation, may help us to better
  * amod relation is maximized with a window-size of 1, but the
    dependency results are of window-size 3. Certainly, the excess window-size
  * dobj relation which is maximized in the unsupervised model at 4 also
  * case of nsubj relation does not fit this reasoning
    * nsubj is maximized in the unsupervised model at a window-size of 2, but
      even at window-size 3 it improves over the supervised model. Here we may
* in selectional preference and syntagmatic embeddings, weighted factorisation
  may be detrimental
* appropriate co-occurrence term-weights are crucial for the performance
* log is also valuable for learning selectional preference.  Here we have
  tested our syntagmatic embeddings only on English, but it should be directly

# 5 Related Work

* Syntagmatic/paradigmatic representations: Rapp (2002); Sahlgren (2006) viewed
  * syntagmatic representations as firstorder word co-occurrence statistics, and
    * word-document co-occurrence matrix
  * paradigmatic representations as second-order statistics
    * word-word cooccurrence matrix
* First-order models represent words using text units in which they appear
* the evaluation datasets they used for first-order models were a mix of
  (mostly) paradigmatic and syntagmatic relations, and not purely syntagmatic
* large-scale study by Lapesa+ (2014) showed that
  * fine-tuned second-order statistics can capture both syntagmatic and paradigm
  * Different parametrisations, mainly window size and dimensionality
* The notion of syntagmatic representation explored in our work is adapted from
  Schütze and Pedersen (1993), in which the
  * syntagmatic representation is introduced qualitatively without resorting to
