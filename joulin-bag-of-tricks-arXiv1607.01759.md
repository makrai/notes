Bag of Tricks for Efficient Text Classification
Armand Joulin, Edouard Grave, Piotr Bojanowski, and Tomas Mikolov
Bag of Tricks for Efficient Text Classification

#Három cikk és egy repó

* gyuri9:50 AM
  * "Bag of Tricks for Efficient Text Classification" irja le az osztalyozást
  * az "Enriching Word Vectors with Subword Information" pedig a szovektorokrol
  * A harmadik cikk pedig a modellek tomoriteserol szol. (edited)

RNN (ICLR 2016) https://arxiv.org/abs/1511.06303    Alternative structures for
fastText        https://arxiv.org/abs/1607.01759    Bag of trick for Efficient
skip-gram       https://arxiv.org/abs/1607.04606    Enriching Word Vectors

#Abstract

often on par with deep learning classifiers in terms of accuracy, and many
orders of magnitude faster 

#Intro

* Text classification
  * applications, such as web search, information retrieval, ranking and
    document classification (Deerwester et al., 1990; Pang and Lee, 2008).
  * neural networks (Kim, 2014; Zhang and LeCun, 2015; Conneau et al., 2016).
  * linear classifiers are often considered as strong baselines 
    * (Joachims, 1998; McCallum and Nigam, 1998; Fan et al., 2008)
    * SOTA performances if the right features are used (Wang and Manning,
      2012).  They also have the potential to 
    * scale to very large corpus (Agarwal et al., 2014).
* we
  * linear models with a rank constraint and a fast loss approximation
  * evaluate the quality of our approach fastText 1 on two different tasks,
    * tag prediction and sentiment analysis.

#2 Model architecture

* baseline for sentence classification is to 
  * represent sentences as bag of words (BoW) and train a 
  * linear classifier, e.g., a logistic regression or an SVM (Joachims, 1998;
    Fan et al., 2008).  However, linear classifiers 
  * do not share parameters among features and classes
  * limitation when there are many classes
  * solutions to this problem are to 
    * factorize the linear classifier into low rank matrices (Schutze, 1992;
      Mikolov et al., 2013) or to use 
    * multilayer neural networks (Collobert and Weston, 2008; Zhang et al.,
      2015)
* model with rank constraint.  
  * first weight matrix A is a look-up table over the words
  * word representations are then averaged into a text representation, which is
  * fed to a linear classifier.
  * similar to the cbow model of Mikolov et al. (2013), where 
    * the middle word is replaced by a label. We use the 
    * softmax function f to compute the probability [of] classes
    * minimizing the negative loglikelihood over the classes
  * trained asynchronously on multiple CPUs using stochastic gradient descent
    and a linearly decaying learning rate.

##Hierarchical softmax

##N-gram features

* bag of n-grams as additional features to capture some partial information
  about the local word order. This is very efficient in practice while
  achieving comparable results to methods that explicitly use the order
  (Wang and Manning, 2012).  We maintain a fast and memory efficient mapping of
  the n-grams by using the hashing trick (Weinberger et al., 2009) with the
  same hashing function as in Mikolov et al. (2011)

#3 Experiments

##3.1 Sentiment analysis

##3.2 Tag prediction

* YFCC100M dataset (Thomee et al., 2016) which consists of almost 
  * 100M images with captions, titles and tags. We focus on 
  * predicting the tags according to the title and caption
* We also compare with Tagspace (Weston et al., 2014), which is a tag
  prediction model similar to ours, but based on the Wsabie model of Weston et
  al. (2011).

#Discussion and conclusion

* Although deep neural networks have in theory much higher representational
  power than shallow models, it is not clear if simple text classification
  problems such as sentiment analysis are the right ones to evaluate them.
