A La Carte Embedding: Cheap but Effective Induction of Semantic Feature Vectors
Mikhail Khodak, Nikunj Saunshi, Yingyu Liang, Tengyu Ma, B Stewart, S Arora
ACL 2018 arXiv:1805.05388 [cs.CL]

# Abstract

* Motivations like domain adaptation, transfer learning, and feature learning
* embeddings for rare or unseen words, n-grams, synsets, and textual feats
* we: a simple and general alternative to the usual word2vec-based approaches
  * based upon recent theoretical results for GloVe-like embeddings. Our method
  * linear transformation that is efficiently learnable using pretrained vecs
    and linear regression
    * applicable on the fly when a new text feature or rare word is encountered,
      even if only a single usage example is available
  * We introduce a new dataset showing how the a la carte method
  * method requires fewer examples of words in context to learn high-qual embed
  * SOTA results on a nonce task and some unsupervised document classific tasks

# 1 Intro

* from subword elements to n-grams to sentences
  (Bojanowski+ 2016; Poliak+ 2017; Kiros+ 2015). However, the performance of
* problems
  * eg
    * small corpus settings (Adams+ 2017) or when embedding
    * sparse, low-frequency features (Lazaridou+ 2017)
  * Attempts to address these issues often involve
    * task-specific approaches
      (Rothe and Schütze, 2015; Iacobacci+ 2015; Pagliardini+ 2018) or
    * extensively tuning existing architectures such as skip-gram
      (Poliak+ 2017; Herbelot and Baroni, 2017)

* induce embeddings for only those features (eg bigrams or synsets) needed by
  the downstream task,
  * For computational efficiency it is desirable that methods be able to
* we: à la carte embedding, a method which
  * bootstraps existing high-quality word vectors to learn a feature
    representation in the same semantic space via a
  * linear transformation of the average word embeddings in the feature’s
    available contexts
  * a shallow extension of the distributional hypothesis (Harris, 1954), “a
    feature is characterized by the words in its context,” rather than the
    computationally more-expensive “a feature is characterized by the features
    in its context” that has been used implicitly by past work
    (Rothe and Schütze, 2015; Logeswaran and Lee, 2018)
  * can learn faithful word embeddings from single examples and feature vectors
    improving performance on important downstream tasks. Furthermore, the
  * resource-efficient, needing only pretrained embeddings of common words and
    the text corpus used to train them, and
  * easy to implement and compute via vector addition and linear regression
* experiments: we illustrate these benefits through several applications:
  * Embeddings of rare words: we introduce a dataset1 for few-shot learning of
    word vectors and achieve SOTA results on the task of representing unseen
    words using only the definition (Herbelot and Baroni, 2017)
  * Synset embeddings: we show how the method can be applied to
    learn more finegrained lexico-semantic representations and give evidence of
    * useful for standard word-sense disambiguation tasks
      (Navigli+ 2013; Moro and Navigli, 2015)
  * n-gram embeddings: we build seven million n-gram embeddings from large
    text corpora and use them
    to construct document embeddings that are competitive with unsupervised
    deep learning approaches when evaluated on linear text classification
* compete well with recent deep neural representations; this provides further
  * simple methods can outperform modern deep learning on many NLP benchmarks
    (Arora+ 2017; Mu and Viswanath, 2018; Arora+ 2018a,b; Pagliardini+ 2018)

# 3 Method Specification

## 3.1 A Linear Approach

* hE the set of all word vectors is seen to share a few common directions
  * Simple addition amplifies the component in these directions, at the expense
    of less common directions that presumably carry more “signal.”
  * Stop-word removal can help (Lazaridou+ 2017; Herbelot and Baroni, 2017)
    * hE content-words also have significant components in the same direction
  * remove the top one or top few principal components, from  either/or
    * the word embeddings themselves (Mu and Viswanath, 2018) or from
    * their summations (Arora+ 2017)
    * hE this approach is liable to either not remove enough noise or cause too
      much information loss without careful tuning (c.f. Figure 1)
* Figure 1: Change in Embedding Norm under Transform
  * ratio of embedding norms after transformation as a function of word count
  * While All-but-the-Top tends to affect only very frequent words,
    à la carte learns to remove components even from less common words

## 3.2 Practical Details

* When we do not have many embeddings we can still
  give more importance to words with better embeddings
  via a function such as α(c) = log c, which we use in Section 5.1
