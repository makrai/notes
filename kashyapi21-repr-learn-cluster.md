Learn The Big Picture: Representation Learning for Clustering
Sumanta Kashyapi, Laura Dietz
ACL | IJCNLP | RepL4NLP 2021

# Abstract

* supervised models for text clustering
  * difficult to directly optimize for clustering
  * because clustering is a discrete process 
    * it is difficult to estimate meaningful gradient of a discrete function
  * so supervised clustering algorithms indirectly optimize for
    some continuous function that approximates the clustering process
* We propose a scalable training strategy that
  directly optimizes for a discrete clustering metric
  * We train a BERT-based embedding model using our method and
  * evaluate it on two publicly available datasets
  * our method outperforms
    * another BERT-based embedding model employing Triplet loss and
    * other unsupervised baselines

# 1 Intro

* Text clustering finds its application in a wide range of tasks
  * cluster-based information retrieval (Cutting+ 2017; Mei and Chen, 2014),
  * representation of search results (Scaiella+ 12; Navigli and Crisafulli 10),
  * opinions (Tsirakis+ 17)
* texts of different granularities (eg words, sentences, passages, articles)
* all of them represent the documents in form of vectors and then vector sim
* typically employed in an unsupervised setting
  * nL semi-supervised deep learning models have been proposed recently
  * formulated as a representation space learning problem (Yang+ 2017)
  * hE training not directly optimizes for a clustering evaluation metric
    * training optimizes for a different criterion
      that approximates the global clustering error
  * Semi-supervised clustering approaches (Basu+ 2002)
    * clustering cast as binary classification by learning
      pairwise constraints extracted from the available training examples:
      must-links for sample pairs sharing the same cluster and
      cannot-links for different clusters
  * hE, if there are small clusters: only a few must-links
    * highly unbalanced training data
    * => trained model is biased towards predicitng cannot-links
  * triplet-based constraints (Dor+ 2018) combine
    a positive and a negative sample in a single triplet, mitigate such bias
  * hE, the sample complexity (Bartlett, 1998) grows more rapidly
    * samples complexity: number of samples required to cover all interactions
* the optimization criterion does not always correspond with quality
* we hypothesize the following:
  1. Instead of learning to solve some approximation of the clustering problem,
     we need to directly optimize for a clustering evaluation metric
  2. Instead of sample-pairs in case of pairwise constraints 
    or triplets in case of Triplet-loss, we can
    make efficient and scalable use of the available training data by
    presenting all interactions between a set of data points
    as a single clustering sample
    * neither suffers from unbalanced data nor from sample complexity
* we propose an alternative training strategy that directly
  * draws its supervision signal from an evaluation metric that measures
    clustering quality to train a representation model for text documents
    * During training, it consumes a complete clustering example of a set of
      data points as a single training sample in form of an interaction matrix
  * we experiment with clustering datasets containing numerous small clustering
    examples instead of a single instance of a large clustering problem
* It is challenging to derive training signals directly from the clustering
  ground truth or a clustering evaluation metric
  because the clustering process is discrete
  * ie a function that estimates the clustering quality of a random partition
    of the input data is not continuous and hence non-differentiable
  * most supervised algorithms rely on gradient-based optimization algorithms,
    => it is difficult for them to orchestrate a useful training process
  * So far some continuous approximation of the clustering problem is used
    as discussed earlier to bypass the core optimization issue
* gradient approximation method, blackbox backpropagation (Vlastelica+ 2019)
  for combinatorial problems that finds solution in a discrete space
  * We leverage their findings by molding the clustering problem into a
    combinatorial problem.  This allows us to derive meaningful gradients
* We empirically show that
  our method is more efficient in terms of training time and utilizing
  available training examples when compared to existing supervised clustering
  * better clustering results than other strong baseline models

# 4 Experimental Results

## 3.1 Datasets

* To evaluate our proposed approach, we use two publicly available datasets:
  * 20 newsgroups (20NG 2 ) and TREC Complex Answer Retrieval (CAR 3 )
* As discussed earlier, for our proposed method, each training example consists
  of the ideal clustering of a set of documents. To produce enough such
  training samples, we choose to train and evaluate on multiple smaller
  clustering instances instead of a single but large clustering instance. We
  note that it will not make any difference in the way our baseline model is
  trained because they consume the training data in form of triples (SBERT
  Triplet), as long as we ensure that all models are trained on the same set of
  clustering examples. We take the following approach to construct such
  clustering benchmarks from the datasets (detailed statistics are presented in
  Table 2):

### 20NG dataset is a widely used public collection of 18846 documents

* docs categorized into any one of twenty topics
* To convert this to a clustering benchmark, both train and test split of 20NG
  dataset is randomly grouped into sets of 50 documents along with their topic
  labels, resulting in 226 and 150 clustering instances respectively. Each set
  of 50 documents represents a single instance of clustering problem.

### CAR dataset (version 2.0 year 1) is

* a large collection of Wikipedia articles
* Each article consists of text passages about a topic, segmented into
  hierarchical subtopics using sections
* train/test split: we use train.v2.0 as train split (CAR train) and
  `benchmarkY1test` as test split (CAR test)
* This dataset is originally designed for a passage retrieval task where
  passages in CAR articles are relevant for different sections under the over-
  arching topic of the article. This relevance information is part of the
  dataset in form of the ground truth. We assume that all relevant passages for
  an article are already retrieved and our focus is to cluster these passages.
  So each article is a separate clustering problem where our task is to cluster
  all the passages of the article such that passages from same sections in the
  original article share the same cluster. We treat the section label under
  which a passage appears as the clustering label of the passage.

* Section labels in CAR dataset are hierarchical.  This provides an opportunity
  to evaluate our clustering models under different levels of granularity
  * eg As depicted in Figure 2, passages p 6 and p 7 in article COVID 19 belong
    to the sections Cause and Cause/Transmission respectively
    * For a coarse-grained view of the clustering, we consider p 6 , p 7 under
      the same topic cluster Cause
    * for fine-grained clustering we have to consider p 6 , p 7 under separate
      subtopic clusters
  * The CAR dataset provides both in form of top-level (coarse) and
    hierarchical (fine-grained) benchmarks. We train and evaluate our models on
    both flavors of the dataset.

## 4.2 evaluation paradigm and present 

## 4.3 experimental results that demonstrate efficacy of the representation
