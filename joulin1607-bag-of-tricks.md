Bag of Tricks for Efficient Text Classification
Armand Joulin, Edouard Grave, Piotr Bojanowski, and Tomas Mikolov

# Három cikk és egy repó

|skip-gramwi	  |arxiv/1607.04606|Enriching Word Vectors|szovektorokrol	       |
|fastText	      |arxiv/1607.01759|Bag of trick for Effic|az osztalyozásról	   |
|RNN (ICLR 2016)|arxiv/1511.06303|Alternative structures|modellek tomoriteserol|

https://github.com/facebookresearch/fastText
https://github.com/facebook/Conditional-character-based-RNN

# Abstract

* often on par with deep learning classifiers in terms of accuracy, and many
  orders of magnitude faster

# Intro

* Text classification
  * applications, such as web search, information retrieval, ranking and
    document classification (Deerwester+ 1990; Pang and Lee, 2008)
  * neural networks (Kim, 2014; Zhang and LeCun, 2015; Conneau+ 2016)
  * linear classifiers are often considered as strong baselines
    * (Joachims, 1998; McCallum and Nigam, 1998; Fan+ 2008)
    * SOTA performances if the right features are used (Wang and Manning, 2012).
    * scale to very large corpus (Agarwal+ 2014)
* we
  * linear models with a rank constraint and a fast loss approximation
  * evaluate the quality of our approach fastText 1 on two different tasks,
    * tag prediction and sentiment analysis

# 2 Model architecture

* baseline for sentence classification is to
  * represent sentences as bag of words (BoW) and train a
  * linear classifier: logistic regression or an SVM (Joachims, 1998; Fan+ 2008)
    * do not share parameters among features and classes
    * limitation when there are many classes
  * solutions to this problem are to
    * factorize the linear classifier into low rank matrices 
      (Schutze, 1992; Mikolov+ 2013) or
    * multilayer neural networks (Collobert and Weston, 2008; Zhang+ 2015)
* model with rank constraint
  * first weight matrix A is a look-up table over the words
  * word representations are then averaged into a text representation
  * fed to a linear classifier
  * similar to the cbow model of Mikolov+ (2013)
    * the middle word is replaced by a label
    * softmax function f to compute the probability [of] classes
    * minimizing the negative loglikelihood over the classes
  * trained asynchronously on multiple CPUs using stochastic gradient descent
    and a linearly decaying learning rate

## Hierarchical softmax

## N-gram features

* bag of n-grams as additional features to capture some partial information
  about the local word order. This is very efficient in practice while
  achieving comparable results to methods that explicitly use the order
  (Wang and Manning, 2012).  We maintain a fast and memory efficient mapping of
  the n-grams by using the hashing trick (Weinberger+ 2009) with the
  same hashing function as in Mikolov+ (2011)

# 3 Experiments

## 3.1 Sentiment analysis

## 3.2 Tag prediction

* YFCC100M dataset (Thomee+ 2016) which consists of almost
  * 100M images with captions, titles and tags. We focus on
  * predicting the tags according to the title and caption
* We also compare with Tagspace (Weston+ 2014), which is a tag
  prediction model similar to ours, but based on the Wsabie model of Weston et
  al. (2011)

# Discussion and conclusion

* Although deep neural networks have in theory much higher repr power, 
  it is not clear if simple text classification problems such as sentiment
  analysis are the right ones to evaluate them
