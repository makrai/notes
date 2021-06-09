* Yang Liu, Zhiyuan Liu, Tat-Seng Chua, Maosong Sun
* Topical Word Embeddings
* AAAI 2015

https://github.com/largelymfs/topical_word_embeddings

# Abstract

* word ambiguity
* we
  * employ latent topic models to assign topics for each word in the text
  * learn topical word embeddings (TWE) based on both words and their topics
  * can measure contextual word similarity
  * build document representations
    * more expressive than some ... latent topic models
* experiments, we evaluate the TWE models on two tasks,
  * contextual word similarity and text classification
* our models
  * especially the simplest TWE-1
  * outperform ... multi-prototype version on contextual word similarity, and
  * exceed latent topic models and other representative document models
    * on text classification

# 1 Intro

* problem with Huang+ (2012)
    * ignore complicated correlations among ... contexts
    * contexts of a word are divided into clusters with no overlaps.
      * In reality, a word’s several senses may correlate with each other, and
        there is not clear semantic boundary between them
* this paper: _topical word_ = a word taking a specific topic as context
* We employ
    * latent Dirichlet allocation (LDA)
        * Blei, Ng, and Jordan (2003)
        * to obtain word topics, and
    * collapsed Gibbs sampling (Griffiths and Steyvers 2004) to
        * iteratively assign latent topics for each word token
    * In this way, ... each word token `w_i` will be
      * discriminated into a specific topic `z_i`
* three TWE models
  * TWE-1 performs the best in both tasks
    * For each target word with its topic `w_i, z_i`

L(D) = 1/M \sum_{i=1}^M \sum_{c=-k..-1,1..k}
                                   log Pr(w_{i+c} | w_i) + log Pr(w_{i+c} |z_i)

    * algo
        * We regard each topic as a pseudo word, and
        * learn topic embeddings and word embeddings separately
        * we get topical word embedding ... by concatenating the embeddings
    * Contextual Word Embedding = inference
        * AvgSimC, MaxSimC
* TWE-2
    * in TWE-2, each word-topic pair w, z have their own parameters
        * L(D) = 1/M \sum \sum log Pr(w_{i+c}, z_{i+c} | w_i, z_i)
* TWE-3
    * TWE-2 ... may suffer from ... sparsity issue
    * TWE-3 to provide a tradeoff between discrimination and sparsity
        * the parameters of each word embedding w and topic embedding z is
        * shared over all word-topic pairs hw, zi;
        * the length of word vectors |w| is not necessarily the same as
            * the length of topic vectors |z|
  * TWE-1 vs TWE-3:
      1: a szavak és a topikok egymástól függetlenül hatnak a szóra
      2: a (szó, téma) párok alkotják a szókincset
      3: a szó és a témavektor konkatenáltja reprezentál egy szót

# 2 Our Models

## 2.4 Optimization and Parameter Estimation

* similar optimization scheme as that of Skip-Gram used in (Mikolov+ 13)
  SGD + back-propagation
* Initialization is important for learning TWE models.
  * In TWE-1, we first learn word embeddings using Skip-Gram.  Afterwards, we
    initialize each topic vector with the average over all words assigned to
    this topics, and learn topic embed- dings while keeping word embeddings
    unchanged

# 3 Experiments

## Contextual Word Similarity

* settings
  * topic assignments with LDA
    * # topics T = 400 (gibbsLDA default is 100)
    * # iterations I = 50
* Skip-Gram and TWE models, we set
  * window size as 5 and the
  * dimensions of both word embeddings and topic embeddings as K = 400.
  * For TWE-1 and TWE-3, we obtain topical word embeddings via concatenation
    over corresponding word embeddings and topic embeddings


### Datasets and Experiment Setting
  * We use the dataset released by Huang+ (2012) for evaluation,
* train embedding
  * We select Wikipedia, the largest online knowledge base
    * the April 2010 dump also used by (Huang+ 2012)
* baselines including
  * C&W model (Collobert and Weston 2008),
  * TFIDF
    * including Pruned TFIDF and Pruned TFIDF-M
    * Reisinger and Mooney (2010)
    * represent words using context words
      * within 10-word windows, weighted by TFIDF
  * Huang’s model (Huang+ 2012),
  * Tian’s model
    * (Tian+ 2014),
      * Tian, F.; Dai, H.; Bian, J.; Gao, B.; Zhang, R.; Chen and Liu
      * A probabilistic model for learning multiprototype word embeds
      * COLING, 2014
    * compared to Huang’s model
      * comparable performance
      * Tian is more efficient
  * LDA and
      * LDA-S ... ignoring context
      * LDA-C regards the context sentence c
  * Skip-Gram

## Text Classification

* Datasets and Experiment Setting
  * 20NewsGroup
    * 20, 000 documents from 20 different newsgroups
  * We report macro-averaging precision, recall and F-measure for comparison
  * TWE models, we
    * learn topic models using LDA on the training set by setting the number of
      topics T = 80.  We further
    * learn topical word embeddings using the training set
      * dimensions of both word and topic embeddings as K = 400
    * regard document embedding vectors as document features and train a linear
      classifier using Liblinear (Fan+ 2008). We set the
  * baselines,
    * bag-of-words (BOW) model
    * LDA
    * Skip-Gram
    * and Paragraph Vector (PV) models (Le and Mikolov 2014)

# Future Work

* number of topics
  * LDA the topic number must be pre-defined
  * Crossvalidation can be used to find appropriate topic number but are
    time-consuming and impractical for large-scale data
  * non-parametric topic models (Teh+ 2006) for topical word embeddings
