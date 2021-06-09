Tobias Schnabel, Igor Labutov, David Mimno, Thorsten Joachims
Evaluation methods for unsupervised word embeddings
2015

http://www.cs.cornell.edu/~schnabts/eval/

# Abstract

* Different evaluations result in different orderings of embedding methods,
  calling into question [whether] there is one single optimal [embedding]
* We present new evaluation techniques that directly compare embeddings

# 1 Intro

* extrinsic evaluation, ...  Examples include part-of-speech tagging and
  named-entity recognition (Pennington+ 2014)
* Intrinsic evaluations ... for syntactic or semantic relationships
  (Mikolov+ 2013a; Baroni+ 2014)
  * Query inventories have so far been collected opportunistically from
    * psycholinguistics, information retrieval (Finkelstein+ 2002), and
    * image analysis (Bruni+ 2014)
  * often ... dominated by specific types of queries, and
    poorly calibrated to corpus statistics
* this paper
  * three [evaluation criteria]: word relatedness, coherence, downstream
  * using different criteria results in different relative orderings
  * direct evaluation with real users [vs] pre-collected offline data
  * direct comparison of embeddings with respect to individual queries
    rather than overall summary scores
  * model~ and data-driven approach to constructing query inventories
    * words to be diverse with respect to their
      frequency, parts-of-speech and abstractness
  * we release a new frequency-calibrated query inventory [with] user judgments
  * word embeddings encode [surprising] information about word frequency
    * even in models that [have] parameters to compensate for frequency
    * casts doubt on the common practice of using the vanilla cosine similarity
  * a survey of evaluation methods, not a survey of embedding methods
    * example embeddings presented here were chosen as representative samples

# 2 Word embeddings

* motivated by a probabilistic prediction approach
  * CBOW ... of word2vec (Mikolov+ 2013a) and C&W embeddings (Collobert+ 2011)
  * predicting w from the context representations
* reconstruction approach
  * Hellinger PCA (Lebret and Collobert, 2014),
  * GloVe (Pennington+ 2014),
  * TSCCA (Dhillon+ 2012), Two step CCA: A ... spectral method
  * Sparse Random Projections (Li+ 2006) follow a
  * capture [much relevant information from the] co-occurrence matrix

# 3 Relatedness

* We begin with intrinsic evaluation of relatedness
* Section 3.1 introduces the list of datasets that is commonly used
  * we refer to this scenario as absolute intrinsic evaluation
* comparative intrinsic evaluation
  * we ask people directly for their preferences among different embeddings
  * we can achieve the same results as offline, absolute metrics

# 3.1 Absolute intrinsic evaluation

* the same datasets and tasks as Baroni+ (2014)
* we present results on all tasks[, but] we will mainly focus on relatedness
  * Relatedness
  * Analogy
  * Categorization
  * Selectional preference
    * how typical a noun is for a verb either as a subject or as an object
    * We follow the procedure that is outlined in Baroni+ (2014)
* design questions come up when designing reusable datasets

## Query inventory

* WordSim-353 dataset (Finkelstein+ 2002), for example,
  only tries to have word pairs with a diverse set of similarity scores
* MEN dataset (Bruni+ 2014) follows a similar strategy, but
  restricts queries to words that occur as annotations in an image dataset
* frequency important because
  * we want to test the quality of embeddings on rare words, and
  * it is related with distance in the embedding space as we show later

## Metric aggregation

* similar to ranking evaluation in Information Retrieval
* we usually cannot directly compare scores from different rankings
  (Aslam and Montague, 2001): not guaranteed to have the same ranges
* we have to decide whether (dog, cat) is more similar than (banana, apple)

## 3.3 Comparative intrinsic evaluation

TODO

# 4 Coherence

* In this novel coherence task we assess
  whether groups of words in a small neighborhood in the embedding space are
  mutually related
  * Previous[ly used] for qualitative evaluation using 2d visu (Turian+ 2010)
  * Similar to Chang+ (2009), we presented Turkers with four words,
    three of which are close neighbors and one of which is an “intruder”
  * intruder word to be the first word that had a frequency of avg ± 500
    starting at rank 100 of the list of nearest neighbors

# 5 Extrinsic Tasks

* Noun phrase chunking
  * we use a noun phrase chunking task similar to that used by Turian+ (2010)
    * conditional random field (CRF) model
* Sentiment classification
  * we use a ... dataset for binary sentiment classification by Maas+ (2011)
    The dataset contains 50K movie reviews with a balanced distribution
  * we generate ... the same bag-of-words [with multiplicity] features as
    Maas+ (2011)
  * LIBLINEAR logistic regression model (Fan+ 2008) with the default parameters

# 6 Discussion

* Word frequency information in the embedding space also affects cosine sim

# 8 Conclusion

* Factors such as
  * word frequency play a significant and previously unacknowledged role
* a novel Coherence [measure]
  * neighborhoods in the embedding space should be sem or syn related
* extrinsic evaluations,
  * although useful for highlighting specific aspects of embedding performance,
    should not be used as a proxy for generic quality
