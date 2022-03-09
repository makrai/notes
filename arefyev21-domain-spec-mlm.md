NB-MLM: Efficient Domain Adaptation of Masked Language Models for Sentiment Analysis
Nikolay Arefyev, Dmitrii Kharchev, Artem Shelmanov
EMNLP 2021

     nvanva/nb-mlm

# Abstract

* Masked Language Models (MLM) are
  * pre-trained on massive datasets, the
  * domain or task adaptation
    * several GPU days
  * fine-tuning for the final task
    * several GPU hours
* domain adaptation
  * additional training on domain or task-specific data improves performance
  * performed for each domain or task individually and is still rather slow,
* the standard MLM objective leads to inefficiency for adaptation step because
  * mostly learns to predict the most frequent words, which are not necessarily
* We propose a technique for more efficient adaptation that
  focuses on predicting words with large weights of the Naive Bayes classifier
  trained for the task at hand, which are likely more relevant than the most
  * faster adaptation and better final performance for sentiment analysis

# 1 Intro

* called the domain or task adaptation, depending on the degree of similarity
  of the data for adaptation to the target dataset. While initial pre-
* We evaluate the proposed method on two datasets for sentiment analysis. It is
  * an excellent playground for the comparison of adaptation methods due to the
    large amount of labeled and unlabeled user reviews of different products
    available. In particular, we consider the task of classifying the binary
    sentiment polarity of a given review. Our experiments

# 4 Experiments and Results 3

* To show that NB-MLM can obtain results similar to Uniform MLM in a much
  shorter time, we also report the results of short adaptation with the
  duration reduced to 4K steps on Amazon, 20 epochs on IMDB, & 6 epochs on Yelp
* same words masked in each example at each epoch.  For domain adaptation, only
  one epoch of training is done on a large dataset, hence, smaller temperatures
  perform better.
* Figure 2 shows how the final classification accuracy improves
  * significantly helps for domain adaptation on IMDB
  * For task adaptation, the difference is much smaller and fits into 2 std
  * on average, the NBMLM seems to provide a consistent improvement throughout
    the adaptation
  * Yelp: the improvements from NB-MLM are also small but consistent.
