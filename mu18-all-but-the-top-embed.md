Jiaqi Mu, Suma Bhat, Pramod Viswanath
All-but-the-Top: Simple and Effective Postprocessing for Word Representations
ICLR, 2018

# Abstract

* eliminate the common mean vector and a few top dominating directions
* empirically validated on a variety of
  * tasks
    * lexical-level intrinsic tasks
      (word similarity, concept categorization, word analogy) and
    * sentence-level (semantic textural similarity and text classification)
  * representation methods and hyperparameter choices in multiple languages

# 1 Intro

* A variety of [word embedding] approaches have been proposed in recent years
  * Collobert+ (2011); Turian+ (2010) semi-supervised learning by jointly
    training the language model and downstream applications
  * Bengio+ (2003); Mikolov+ (2010); Huang+ (2012) in a neural network LM
  * Mikolov+ (2013); Mnih & Hinton (2007) by log-linear models
  * and Dhillon+ (2012); Pennington+ (2014); Levy & Goldberg (2014);
    Stratos+ (2015); Arora+ (2016) by producing a low-dimensional
    representation of the cooccurrence statistics
* performance of several of the recent methods is roughly
  similar on a variety of intrinsic and extrinsic evaluation testbeds
* Every representation we tested, in many languages, has the following props
  * The word representations have non-zero mean – indeed, word vectors share a
    large common vector (with norm up to a half of the average norm of a word)
  * After removing the common mean vector, the representations are far from
    isotropic – indeed, much of the energy of most word vectors is contained in
    a very low dimensional subspace (say, 8 dimensions out of 300)
* eliminate [the common vector and the dominating direction] by:
  * removing the nonzero mean vector from all word vectors,
  * projecting the representations away from the dominating D [db] directions,
  * [the number of dims to remove] D depends on the
    * representations (for example, the dimension of the representation, the
      training methods and their specific hyperparameters, the training corpus)
    * and also depends on the downstream applications
    * rule of thumb of choosing D around d/100, where d is the dimension of the
      * works uniformly well across languages, representations and test scenars
* tasks:
  * word similarity task ... on seven different datasets, on average by 1.7%;
  * concept categorization task [by] clusters of word representations
    * three different datasets, by 2.8%, 4.5% and 4.3%;
  * word analogy task tests the extent to which the difference of two
    (by 0.5% on semantic analogies, 0.2% on syntactic analogies and
    0.4% in total). Since part of the dominant components are inherently
* Extrinsic evaluations provide a way to test the goodness of representations
  * semantic textual similarity task – where
    * we represent a sentence by its averaged word vectors and score the
    * cosine similarity between the corresponding sentence representation
    * over 21 different datasets (average improvement of 4%)
* supervised learning, especially in conjunction with neural network
  * text classification task using
    a well established CNN classifier (Kim, 2014) and
    RNN classifiers: with vanilla RNN, GRU (Chung+ 2015) and LSTM Greff+ (2016)
  * two different pre-trained word vectors, five datasets and four archits
    * performance ... improves on a majority of instances (34 out of 40) by a
      good margin (2.85% on average)

## Related Work. Our work is directly related to word representation

* in NLP
  * centering the mean (Sahlgren+ 2016)  and
  * nulling away only the first principal component (Arora+ 2017))
    * Arora compute the principal component on the sentence level
    * i.e. specific [to the] semantic textual similarity dataset, then extract
    * our dominating vectors are over the entire vocabulary of the language
* More generally, the idea of removing the top principal components
  * positive-valued, high-dimensional [>>300] data matrix analysis
    * Bullinaria & Levy (2012) posits that the PCA of the cooccurrence matrix
      are corrupted by information other than lexical semantics, thus
      heuristically justifying the removal of the top principal components. A
    * [in] population matrix analysis (Price+ 2006): entries are all positive

## [End of Intro]

* We posit that the postprocessing operation makes the representations [better]
  * stronger self-normalization properties
  * discussed in detail in Section 2 and Appendix A

# 2 Postprocessing

## Angular Asymmetry of Representations

* understanding of word representations involves either
  * PMI-based: 
    word2vec (Mikolov+ 10; Levy & Goldberg, 14) and GloVe (Pennington+ 14)
    * probabilistic i.e. generative: Arora+ 2016
  * CCA-based spectral factorization approaches
    * have long been understood from a probabilistic (i.e., generative) view
      (Browne, 1979; Hotelling, 1936) and
    * recently in the NLP context (Stratos+ 2015), a corresponding effort for
      the PMI-based methods has only recently been conducted in an inspired
      work 
* [if] the word vectors are angularly uniform (“isotropic"), 
  the family of PMI-based word representations can be explained under the
  RAND-WALK model in terms of the maximum likelihood rule. Our observation that
  * isotropy conditions are relaxed in Section 2.2 of (Arora+ 2016), but the
    match with the spectral properties observed in Figure 1 is not immediate
* This contradiction is explicitly resloved by relaxing the constraints on the
  word vectors to directly fit the observed spectral properties. The 
  * relaxed conditions are: the word vectors should be isotropic around a point
    (whose distance to the origin is a small fraction of the average norm of
    word vectors) lying on a low dimensional subspace. Our main result is to
  * [then] maximum likelihood rule continues to be close to the PMI-based
    spectral factorization methods.  
  * RAND-WALK, explored in detail in Appendix A: A brief summary and the
    mathematical connection between our work and theirs

# Appendix: All-but-the-Top: Simple and Effective postprocessing for Word

## A Angular asymmetry of representations

## B Neural networks learn to postprocess 14

## C Experiments on various representations 16

### C.2 Multilingual generalization

* word similarity task with the original and the processed TSCCA word
  representations in German and Spanish on three German similarity datasets
  *  D = 2 for both German and Spanish
