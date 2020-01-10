De-Conflated Semantic Representations
Mohammad Taher Pilehvar and Nigel Collier
EMNLP 2016

#Abstract

* sense representations are either
  * not linked to any sense inventory or are
  * unreliable for infrequent word _senses_. We propose a technique that
* evaluations on six datasets across two semantic similarity tasks and report
  state-of-the-art results on most of them

#1 Introduction

* Knowledge-based techniques ... either
  * use sense definitions and employ Word Sense Disambiguation (WSD) to gather
    sense-specific contexts (Chen et al., 2014; Iacobacci et al., 2015) or
  * take advantage of the properties of WordNet, such as synonymy and direct
    semantic relations (Rothe and Schütze, 2015).  However, the non-optimal WSD
* We propose a technique that
  de-conflates a given word representation into its ... sense representations
  by exploiting ... knowledge from the semantic network of WordNet
* advantages in comparison to the past work
  1. linked to the WordNet sense inventory and, accordingly,
    the number of senses for a word ... matches that defined by WordNet;
  1. accurate ... even for word senses that are infrequent in generic text
  1. our methodology involves only minimal parameter tuning and
    can be [ applied to any ]  semantic network and to any [embedding]
* tasks:
  * word similarity (both in-context and in-isolation) and
  * cross-level semantic similarity. Experimental results show that the
  * six datasets, outperforming the recent state of the art on most of them

#2 De-Conflated Representations

Preliminaries. Our proposed approach
* takes a set of pre-trained word representations and 
  uses the graph structure of a semantic lexical resource in order to
  de-conflate the representations into those of word senses

##2.1 Overview of the approach

* The gist of our approach lies in its computation of
  a list of sense biasing words for a given word sense. To this end, we first
  1. extract a list of most representative words that ... pinpoint
     the semantics of individual synsets (§2.2)
  2. placing the senses in the proximity of their corresponding sense biasing
     words (§2.3)

##2.2 Determining sense biasing words

* we use the Personalized PageRank (Haveliwala, 2002, PPR) algorithm which
  * has been extensively used by several NLP applications (
    * Yeh+ wsh 2009 WikiWalk: Random walks on Wikipedia for semantic reledness
    * Niemann and Gurevych, 2011 ... alignment of Wikipedia and Wordnet
    * Agirre et al., 2014 kb-ed wsd
  * represent ... WordNet as a row-stochastic transition matrix
  * M is synsets x synsets
  * cell M ij of M is set to the inverse of the degree of i if there is a
    semantic relationship between synsets i and j and to zero otherwise
  * We compute the PPR distribution for a target synset
    [i.e.] semantic relatedness between y i and y t . We use this notion and
  * [to] retrieve a list of most semantically-related words to y t _..._

##2.3 Learning sense representations

* similar to the frameworks of
  * Das and Smith (acl 2011)
    Semi-supervised frame-semantic parsing for unknown predicates
  * Faruqui et al. (naacl 2015) Retrofitting word vectors to semantic lexicons
  * though being convex, is usually solved for efficiency reasons by an
    iterative method proposed by Bengio et al. (2007)
    Following these works, we
* \delta ... is essentially an exponential decay function that gives more
  importance to the top-ranking biasing words for s i .  The hyperparameter α
* [e.g. _digit_:] dominance (Sanderson and Van Rijsbergen, 1999) of [the
  numerical] sense in the general-domain corpus on which the word embeddings in
  our experiments were trained (cf. §3.1). However, upon de-conflation, the
  emerging anatomical sense

#3 Experiments

The YP-130 dataset focuses on verb similarity, whereas 
SimLex999 contains verbs and adjectives and 
MEN-3K has word pairs with different parts of speech (e.g., a noun compared to
a verb). 
The results we obtain on these datasets exhibit the reliability of our approach
in modeling non-nominal word senses.

###3.2.2 Discussion

* the SimLex-999 dataset is different from our other word similarity benchmarks
  in that it assigns relatively low scores to _antonymous_ pairs
* tweaking the similarity scale of our system in a way that it diminishes the
  similarity scores between antonyms can result in significant performance
  improvement on this dataset. To this end, we performed an experiment 
  * in which the similarity of [antonyms] was simply divided by five 

##Cross-Level semantic similarity

* SemEval-2014 task on Cross-Level Semantic Similarity (Jurgens+ 2014, CLSS).
  The _word to sense_ similarity subtask of this task, with 500 instances
* For a word sense s and a word w, we compute the similarity score according to
  * most similar sense of w (MaxSim), the 
  * average similarity of s to individual senses of w (AvgSim), the direct
  * when [w] is modeled as its word representation (Sense-to-Word or S2W) or
  * centroid of its senses’ representations ([ aggregated word senses ] S2A).
* we can only compare against the publicly-available sense representations
  (Iacobacci+ 2015, Rothe & Schütze 2015, Pilehvar & Navigli 2015 & Chen+ 2014)
  which are linked to the WordNet sense inventory

#4 Related Work

* two main branches
* knowledge from external sense inventories for learning sense[s]
  * Chen et al. (2014), Jauhar et al. (2015) and Rothe and Schütze (2015),
  * Chen et al. (2014) uses the content words in the definition of a word
    sense and WSD. However, the sole usage of glosses as
    sense-distinguishing contexts and the non-optimal WSD make the approach
    inaccurate, particularly for highly polysemous words with similar
    senses and for word senses with short definitions. Similarly, 
  * Rothe and Schütze (2015) use [synsets] along with a small set of semantic
    relations. This significantly hampers the reliability of the technique in
    * [low] coverage (discussed further in §3.3.1). Our approach

    improves over these works by exploiting deep knowledge from the semantic
    network of WordNet, coupled with an effective training approach. 
  * ADW (Pilehvar and Navigli, 2015) is another WordNet-based approach which
    ... obtains interpretable sense representations. Other work in this
  * SensEmbed (Iacobacci et al., 2015) ...  first disambiguates words in a
    given corpus with the help of a knowledge-based WSD system and then uses
    the generated sense-annotated corpus as training data for Word2vec.  
  * Nasari (Camacho-Collados et al., 2015; Camacho-Collados et al., 2016) 
    * based on the BabelNet sense inventory (Navigli and Ponzetto, 2012).
    * combines structural knowledge from the semantic network of
    BabelNet with corpus statistics derived from Wikipedia
    * only nouns
* cluster the contexts in which a word appears
  * [the number of senses] can range from monosemous to highly ambiguous with
   dozens of associated meanings (McCarthy et al., 2016)
  * Diana McCarthy, Marianna Apidianaki, and Katrin Erk. CL 2016. 
    Word sense clustering and clusterability
