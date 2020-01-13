A simple but tough-to-beat baseline for sentence embeddings
Sanjeev Arora, Yingyu Liang, Tengyu Ma
ICLR 2017

# Abstract

* completely unsupervised sentence embedding
* represent the sentence by a weighted average of the word vectors, and
  then modify them a bit using PCA/SVD
* improves performance by about 10% to 30% in textual similarity tasks, and
  beats sophisticated supervised methods
  including RNN’s and LSTM’s [and] Wieting+ (ICLR 16)
* theoretical explanation ... using a latent variable generative model
  * a simple extension of the model in Arora+ (TACL’16)
    with new “smoothing” terms that allow for words occurring out of context,
    as well as high probabilities for words like _and, not_ in all contexts

# 1 Intro

* embeddings that capture the semantics of word sequences
  * Iyyer+ 2015 Deep unordered composition ...  for text classification
  * Le & Mikolov, 2014
  * Kiros+ NIPS 2015 Skip-thought vectors
  * Socher+ 2011 ... recursive autoencoders for paraphrase detection
  * Blunsom+ ACL 2014 A convolutional neural network for modelling sentences
  * Tai+ 2015 ... from tree-structured long short-term memory networks
  * Wang+ 2016 Conceptual sentence embeddings based on attention model
* Wieting+ (2016) learned general-purpose, paraphrastic sentence embeds
  * starting with standard word embeddings and
    modifying them based on supervision from the Paraphrase pairs dataset
  * training a simple word averaging model
  * good initialization for textual classification tasks
  * supervision from the paraphrase dataset seems crucial
* Here we give a new sentence embedding method that is embarrassingly simple:
  * compute the weighted average of the word vectors in the sentence
  * remove the projections of the average vectors on their first principal
    component (“common component removal”)
  * weight of a word w is `a/(a + p(w))` with `a` being a parameter
    * smooth inverse frequency (SIF)
    * fixed to 10^-3 in the textual similarity tasks
  * beats some sophisticated supervised methods tested in Wieting+ (2016),
    including some RNN and LSTM models
  * well-suited for domain adaptation settings
* highly reminiscent of TF-IDF (Sparck Jones, 1972; Robertson, 2004)
  if one treats a “sentence” as a “document” and make[s]
  the ... assumption that the sentence doesn’t typically contain repeated words
  * related idea [is] removing frequent words from the vocabulary
* theoretical justification for the reweighting using a generative model
  * simple modification for the Random Walk on Discourses model (Arora+ 2016)
  * modif[ication] motivated by [that
    word embedding methods give] large vectors to frequent words
* better (by a few percent points) than traditional TF-IDF
* CBOW also
  * does not use simple average of word vectors, as misleadingly suggested
  * implementation shows it implicitly uses a weighted average
    * different from TF-IDF
    * quite similar ... to ours (See Section 3.1.)

# 2 Related work

## Word embeddings

* two approaches
  * from neural network[s] or by low rank approximation of co-occurrence stats
  * closely related
    * Levy & Goldberg, 2014
    * Hashimoto+ 2016 Word embeddings as metric recovery in semantic spaces
    * Arora+ 2016 A latent variable model approach to PMI-based word embeddings
      * [the sentence vector in this paper] can be seen as approximate
        inference of the latent variables in their generative model

## Phrase/Sentence/Paragraph embeddings

* Mitchell & Lapata, 2008; 2010; Blacoe & Lapata, 2012
  * coordinate-wise multiplication of the vectors performed very well
    among the binary operations studied
* Unweighted averaging is also found to do well (Mikolov+ 2013a)
* recursive neural networks (RNNs) defined on the parse tree
  * with supervision (Socher+ 2011) or
  * without (Socher+ 2014)
* RNNs [For example, the skip-gram model] is extended
* In Le & Mikolov, (2014) each paragraph ... have a latent paragraph vector,
  which influences the distribution of the words in the paragraph
* Skip-thought (Kiros+ 2015) tries to reconstruct the surrounding sentences
  * treats the hidden parameters as their vector representations
* LSTM ... for modeling sentences (Tai+ 2015)
* convolution neural networks, such as (Blunsom+ 2014)
  * do well in sentiment prediction and classification tasks
* The directed inspiration for our work is (Wieting+ 2016) which learned
  paraphrastic sentence embeddings by using simple word averaging and also
  updating standard word embeddings based on supervision from paraphrase pairs;
  the supervision being used for both initialization and training

# 3 A simple method for sentence embedding 3

* We briefly recall the latent variable generative model (Arora+ 2016)
  * sentence embedding as ... a MAP estimate of the discourse vectors
  * the MAP estimate of `c_s` is —up to multiplication by scalar—
    the average of the embeddings of the words in the sentence
* we [add] two types of “smoothing term[s]”
  * [to account for that some frequent] words occur out of context
  * an additive term αp(w) in the log-linear model
  * a common discourse vector `c_0 ∈ R^d` [for function words]
* The sentence embedding will be [the max likelihood estimate for] `c_s`
  * [which] is approximately a weighted average of the vectors of the words
  * To estimate `c_s`, we estimate the direction `c_0`
    by computing the first principal component of `c̃_s`s for a set of sentences
    * without centralizing c̃ s
    * [i.e.] the final sentence embedding is obtained by subtracting the
      projection of `c̃_s`s to their first principal component
* summarized in Algorithm 1

## Connection to subsampling probabilities in word2vec

* Word2vec (Mikolov+ 2013b) uses a sub-sampling technique which downsamples
  word w with probability proportional to 1/\sqrt(p(w))
  * speeds up the training but also
  * learns more regular word representations.  Here we explain that this
  * corresponds to an implicit reweighting of the word vectors in the model and
    therefore the statistical benefit should be of no surprise
* without the sub-sampling trick, the update direction is [a] (very) biased
  estimator of the gradient
* the weighting q(w_i) closely tracks our weighting scheme a/(a + p(w)) when
  using parameter a = 10 −4 ; see Figure 1 for an illustration

# 4 Experiments 6

## 4.1 Textual similarity tasks

### Datasets

* 22 textual similarity datasets ... from SemEval
  semantic textual similarity (STS) tasks (12-15) (Agirre+ 12; 13; 14; 15),
  SemEval 2015 Twitter task (Xu+ 2015), and the
  SemEval 2014 Semantic Relatedness task (Marelli+ 2014)

### Experimental settings

1. Unsupervised
  * skip-thought vectors (Kiros+ 2015),
  * avg-GloVe denotes the unweighted average of the GloVe vectors, and
  * tfidf-GloVe denotes the weighted average of GloVe vectors
2. Semi-supervised: avg-PSL ... uses the unweighted average of the
   PARAGRAM-SL999 (PSL) word vectors from (Wieting+ 2015)
  * word vectors are trained using labeled data, but the
    sentence embedding are computed by unweighted average without training
3. Supervised: PP, PP-proj., DAN, RNN, iRNN, LSTM (o.g.), LSTM (no)
  * initialized with PSL word vectors and then trained on the PPDB dataset
  * PP and PP-proj. are proposed in (Wieting+ 2016).  The first
    * average of the word vectors + linear _proj_ection. The
    * word vectors are updated during the training
  * DAN denotes the deep averaging network of (Iyyer+ 2015)
  * RNN denotes the classical recurrent neural network, and
    iRNN denotes a variant with the activation being the identity, and the
    weight matrices initialized to identity. The
  * LSTM is the version from (Gers+ 2002),
    either with output gates (denoted as LSTM(o.g.)) or without (... LSTM (no))

* The weighting parameter a is fixed to 10^-3

### Effect of weighting parameter on performance

* We study the sensitivity of our method to the 
  * weighting parameter `a`, the
  * method for computing word vectors, and the
  * estimated word probabilities p(w)
* three types of word vectors (PSL, GloVe, and SN) on the STS 2012 tasks
  * SN vectors are trained on the enwiki dataset (Wikimedia, 2012) using the
    method in (Arora+ 2016), while
* Best performance occurs from a = 10^-3 to a = 10^-4 
* performance is almost the same for all four settings [of p(w)]
* our method can be applied on different types of word vectors
  trained on different corpora also suggests [the]
  [method] should be useful across different domains
  * important for [semi-]supervised methods
    * the unlabeled data available may be collected in a different domain

## 4.2 Supervised tasks

* three tasks: the
  * SICK similarity task, the
  * SICK entailment task, and the
  * Stanford Sentiment Treebank (SST) binary classification task (Socher+ 2013)
* Setup of supervised tasks mostly follow Wieting+ (2016)
  * linear projection followed by the classifier in (Kiros+ 2015). The linear
    projection maps the sentence embeddings into 2400 dimension (the same as
    the skip-thought vectors), and is learned during the training
* We compare our method to
  * PP, DAN, RNN, and LSTM, which are the methods used in Section 4.1. We also
  * the skip-thought vectors (with improved training in (Lei Ba+ 2016))

### Results

* The advantage is not as significant as in the textual similarity tasks
* our method doesn’t outperform RNN’s and LSTM’s for sentiment tasks because
  1. the distributional hypothesis [has] limitations for capturing sentiment
    * the “antonym problem”,
    * better word embeddings for sentiment analysis (Maas+ 2011)
  2. [we downweight] words like “not” that may be important for sentiment
    * design weighting scheme (or learn weights) for this specific task

## 4.3 The effect of the order of words in sentences

* is word order not important in these benchmarks?
* We trained and tested RNN/LSTM on the supervised tasks where the
  words in each sentence are randomly shuffled
  * performance drops noticeably
  * future direction is to explore ... some ensemble idea

# Appendix A details of experimental setting 13

## Unsupervised task: textual similarity

### The competitors

### Detailed experimental results

### Effects of smooth inverse frequency and common component removal ... separat

## Supervised tasks

## Additional supervised tasks
