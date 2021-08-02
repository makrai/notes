Learn The Big Picture: Representation Learning for Clustering 
Sumanta Kashyapi, Laura Dietz
ACL | IJCNLP | RepL4NLP 2021

# Abstract

* supervised models for text clustering find it difficult to directly optimize
  for clustering results. This is 
  * because clustering is a discrete process and it is 
    difficult to estimate meaningful gradient of any discrete function that can
  * so supervised clustering algorithms indirectly optimize for some continuous
    function that approximates the clustering process. 
* We propose a scalable training strategy that directly optimizes for a discrete
  clustering metric
  * We train a BERT-based embedding model using our method and 
  * evaluate it on two publicly available datasets
  * our method outperforms another BERT-based embedding model employing Triplet
    loss and other unsupervised baselines
