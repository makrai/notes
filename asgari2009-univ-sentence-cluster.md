Covid-Transformer: Detecting Trending Topics on Twitter
  Using Universal Sentence Encoder
Meysam Asgari-Chenaghlu, Narjes Nikzad-Khasmakhi, Shervin Minaee
arXiv:2009.03947

# Abstract

* detect the trending topics and major concerns of people on Twitter
* We used universal sentence encoder in order to derive the semantic repr & sim
  * K-means clustering algorithm to group similar tweets (in semantic sense)
  * cluster summary is obtained using a text summarization algorithm based on
    deep learning, which can uncover the underlying topics of each cluster
    * TextRank summarization technique [20, 21] is applied on the clusters
* our model can detect very informative topics
* Experimental results show superiority of our proposed approach to other
  baselines, including TF-IDF, and latent Dirichlet allocation (LDA)

# 1 Introduction

* Ideally different clusters contain different semantic topics
* Compared to the classical models for topic modeling (such latent Dirichlet a)
  * this work better by first representing a sentence-level embedding
    rather than considering words similarity (as used in LDA)

# 2 details of the proposed algorithm

## 2.2 Tweets Clustering

* Different clustering algorithms can be used for this purpose, such as
  K-means, spectral clustering, mean-shift, Density-Based Spatial Clustering
  (DBSC)
* We use K-means clustering algorithm here, for its simplicity, speed, and the
  ability to pre-define the number of clusters

## 2.3 Cluster summarization

* centroid of each cluster
  * should contain the average embedding (therefore the average topic/concept)
  * not necessarily capture all topics of that cluster. But it could serve as a
    simple baseline
  * we use a text summarization technique to provide a meaningful and sensible
    * TextRank summarization framework

# 3 dataset used in our experiments

# 4 experimental analysis of the proposed algorithm

in terms of detected topics, trending words in each topic cluster, and
sentence representation similarity

# 5 concluded
