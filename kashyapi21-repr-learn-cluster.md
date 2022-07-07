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
  * Semi-supervised clustering approaches (Basu+ 2002) cast the clustering
    problem into binary classification by learning pairwise constraints
    extracted from the available training examples: must-links for sample pairs
    sharing the same cluster and cannot-links for different clusters
  * hE, if there are small clusters: only a few must-links
    * highly unbalanced training data
    * => trained model is biased towards predicitng cannot-links
  * triplet-based constraints (Dor+ 2018) that combine
    a positive and a negative sample in a single triplet, mitigate such bias
  * hE, the sample complexity (Bartlett, 1998) grows more rapidly
    * samples complexity: number of samples required to cover all interactions
* the optimization criterion does not always correspond with quality
* we hypothesize the following:
  1. Instead of learning to solve some approximation of the clustering problem,
     we need to directly optimize for a clustering evaluation metric
  2. Instead of sample-pairs in case of pairwise constraints or triplets in
     case of Triplet-loss, we can
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
