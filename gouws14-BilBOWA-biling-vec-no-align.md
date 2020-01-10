Stephan Gouws, Yoshua Bengio, Greg Corrado
BilBOWA: Fast Bilingual Distributed Representations without Word Alignments
2014

#Abstract

* We introduce BilBOWA ("Bilingual Bag-of-Words without Alignments"),
* computationally-efficient model for learning
  bilingual distributed representations of words
* trains directly on
  * monolingual data and
  * smaller set of raw text sentence-aligned data
* novel sampled bag-of-words cross-lingual objective
  * regularize two noise-contrastive language models
* outperforms state-of-the-art methods on
  * cross-lingual document classification task as well as
  * lexical translation task on the WMT11 data
* code will be made available as part of the open-source word2vec toolkit

#1 Introduction

* [similar words] are represented using similar vectorial representations
* transferring the limited label information
  * from high-resource to low-resource languages
* effective for
  * document classification [12]
    * outperforming a strong machine-translation baseline
  * named-entity recognition and machine translation [21, 15]
* high computational cost
  * word-alignment step over sentence-aligned data
    * to obtain the word translation-pair co-occurrence frequencies
    * a word-alignment step prior to training to learn the alignment matrix A
      * Giza++ [17] or FastAlign [8] and training HMM word-alignment models
  * two NLMs are trained jointly, with an
    * [new] regularization term
      penalizes distances between high-frequency translation pairs
  * training times on the order of weeks

#2 Approaches to Learning Cross-lingual Word Embeddings

* problem with Faruqui: considers only one translation per word,
* different approach is to leverage sentence-aligned
  * Hermann et al. [11]
    * fast due to the noise-contrastive training
* joint mono and bi
  * Klementiev et al
    * extremely slow to train
      [stems both from the] monolingual and cross-lingual objectives
      * [the monolingual objective is] a standard neural model
        * the output softmax layer grows with the output vocabulary
      * [the] cross-lingual objective
        considers the interactions between all pairs of words at each ... step

#3 Joint-training Challenges

* in (4), A ~ alignment frequency

#4 The Model

* primary challenges with existing bilingual embedding models
  * computational complexity
    * expensive softmax or an expensive regularization term, or both
  * perhaps even more importantly, the strong domain bias
* BilBOWA
  * monolingual training: noise-contrastive objective
    * replace the standard softmax objective
    *  [scales] independently of the vocabulary size
  * cross-lingual objective
    * sampled, bag-of-words sentence-aligned data
    * voids the need for estimating word alignments
    * computation ... reduces to only the words in the observed sample
    * compared to considering the O(V^2)

##4.1 Learning Monolingual Features: A Bag-of-words Language Modelling Objective

* noise-contrastive approach
  * introduced by Collobert and Weston [6]
    * scores were computed on sequences of words
  * Mikolov et al. [15]
    * bag-of-word representations of contexts in their
      * continuous bag-of-words (CBOW) and
      * skipgram models trained using the negative sampling
    * Any of these objectives ... could be used in our architecture
  * we opted for the skipgram model trained using negative sampling

##4.2 Learning Cross-lingual Features: The Ω term

* először hülyén mondja el
  * We ... make a naive assumption ... that each observed en word
  * can potentially align with each observed fr word
    * (i.e. we assume a uniform word alignment model),
    * for each word in the observed sentence pairs
* In other words,
  * the BilBOWA-loss minimizes a sampled L 2 -loss between the
  * bag-of-words sentence vectors of the parallel corpus
* On its own, this objective is degenerate
* coupled as a regularizer with the monolingual losses, we find that it works well

##4.3 Subsampling for better results

* Eqn 9 overregularizes the frequent words. A simple solution to this is to
* subsample words from the parallel sentences according to their unigram
* frequencies of occurrence, effectively flattening the unigram distribution
* to a uniform distribution

#5 Implementation and Training Details

* asynchronous access of parameters shared by the the monolingual and..
  * arról szól, hogy miért nem kell szinkronizálni
* biling negative sampling objectives
  * there exist efficient algorithms for sampling from a multinomial
    * in O(1) with O(V) setup cost [20],

#6 Experiments

##6.2 WMT11 Word Translation

* the word translation task
  * used by Mikolov et al. (2013 Ex) using the publicly-available WMT11 data

#7 Conclusion
