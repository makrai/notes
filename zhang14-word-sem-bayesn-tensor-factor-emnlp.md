Word Semantic Representations using Bayesian Probabilistic Tensor Factorization
Jingwei Zhang, Jeremy Salwen, Michael Glass, Alfio Gliozzo
EMNLP 2014

# Abstract

* Many forms of word relatedness have been developed
* We
  * synthesizing a single word vector representation and
    per-perspective linear transformations
  * can combine manually created semantic resources with neural word embeddings
    to separate synonyms and antonyms
  * generalizing to words outside the vocabulary of any particular perspective
* evaluated the word embeddings with GRE antonym questions, SOTA

# 1 Introduction

* word relatedness [whose] information does not lie in word distributions
  * eg antonyms [vs] synonyms
    * distribution of antonymous words are close (Mohammad+ 2013)
    * [there are] differences (Scheible+ 2013)
* In this work, we propose a Bayesian tensor factorization model (BPTF)
  * input is a set of word by word matrices, which may be sparse[,] as slices,
  * given any two words and any trained relatedness perspective,
    we can create or re-create the pair-wise word relatedness with
    regularization via per-perspective linear transformation
* different perspectives
  * eg LSA for topic relatedness, ISA relation and YAGO type
  * BPTF [can combine] the advantages [of] distributional models and lexicons
* We evaluate our model on distinguishing synonyms and antonyms
  * Lin & Zhao 03; Turney 08; Mohammad+ 08; Mohammad+ 13; Yih+ 12; Chang+ 13
  * GRE antonym questions (Mohammad+ 2008) as a benchmark
  * [method:] finding the most contrasting choice
    according to the created or recreated synonym / antonym word relatedness
  * The result achieves state-of-the-art performance

# 2 Related work

## 2.1 word vector representations

* Yih+ (2012) apply polarity inducing latent semantic analysis (PILSA)
  * treat each entry of a thesaurus as a document
    giving synonyms positive term counts, and antonyms negative term counts,
    and preform LSA on the signed TF-IDF matrix In this way,
    * antonyms [will have cosine similarities close to] minus one
* Chang+ (2013) introduced Multi-Relational LSA (MRLSA)
  * Tucker decomposition over a three-way tensor
  * k-th slice of tensor W is approximated by `W_{::k} = U S_{::k} V^T`
    * U != V [can] capture asymmetric relations, but
      this flexibility is a detriment for symmetric relatedness
  * performance depends on the quality of th[e] pivot [i.e. synonym] slice
  * not flexible enough to treat the unknown entries
  * our method of BPTF is well suited to symmetric relations with many unknown
    relatedness entries

## 2.2 BPTF Model

* Bayesian Probabilistic Matrix Factorization (Salakhutdinov and Mnih 2008)
  * as a collaborative filtering algorithm
* Bayesian Probabilistic Tensor Factorization (Xiong+ 2010, BPTF) model
  * incorporate temporal factors.  They modeled latent feature vector for users
  * trained efficiently using Markov chain Monte Carlo methods

## 2.3 Antonomy Detection

* Lin and Zhao (2003) looking for pre-identified phrases in corpus
* Turney (2008) transforming antonym pairs into analogy relations
* Mohammad+ (2008; 2013) use affix patterns (eg “un-”, “in-” and “im-”)
* Yih+ (2012) and Chang+ (2013)

# 3 BPTF model and the sampling method

## 3.1 The Bayesian Probabilistic Tensor Factorization Model

* Our model is
  * a variation of the BPMF model (Salakhutdinov and Mnih, 2008)
  * similar to the temporal BPTF model (Xiong+ 2010)
* We assume the relatedness `R_ijk` to be Gaussian,

# 4 experimental evaluation and results

* antonym questions
* limitations [of thesauri]
  1. only contains antonym pairs with a strong contrast
  2. vocabulary is limited
* treat the thesaurus data as the first slice, and the
  distributional similarities as the second slice, then
  * use relatedness on the first slice to answer antonym questions

## 4.1 The GRE Antonym Questions

* There are several publicly available test datasets to measure the correctness
  of our word embeddings
* In order to be able to compare with previous works, we follow the widely-used
  GRE test dataset provided by (Mohammad+ 2008), which has a
  * development set (162 questions) and a test set (950 questions).  The GRE
  * good benchmark because the words are relatively rare
    (19% of the test are not in the top 50,000 most frequent words)
    from
    Google Books (Goldberg and Orwant, 2013)), thus it is hard to lookup
    answers from a thesaurus directly with high recall.  Below is an example of
    the GRE antonym question:
    * eg adulterate:
    1. renounce 1. forbid 1. purify 1. criticize 1. correct
    The goal is to choose the most opposite word (purify)

## 4.3 Tests

* We first train on a tensor from a subset consisting of words with antonym
  entries, then add all other words using the out-of-vocabulary method
  described in Section 3
* We choose the vector length D = 40, the burn-in period starting from the 30
  * Note that Yih+ (2012) use a vector length of 300

## 4.4 Results

* WordNet records less antonym relations for nouns, verbs and adverbs, while
  the GRE antonym questions has a large coverage of them

# 5 conclusion and future work

* future works
  1. additional perspective slices include LSA for topic relatedness, and
     corpus occurrences in engineered or induced semantic patterns
  2. apply the method to other [relations than antonymy]
    * vectors generated from many kinds of perspectives would improve
  3. information contained in the vectors V i and P k [should] be explored
    * the dot product of perspective vectors [should measure] correlation
      between perspectives
  4. asymmetric word relatedness
