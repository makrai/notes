Centering Similarity Measures to Reduce Hubs
Ikumi Suzuki Kazuo Hara Masashi Shimbo Marco Saerens Kenji Fukumizu
2013 emnlp

#Abstract

* We show analytically why hubs emerge and why they are suppressed by cen-
  tering, under a simple probabilistic model of data
* To further reduce hubs, we also move the origin more aggressively towards
  hubs, through weighted centering
* experimental results
  * (weighted) centering is effective ... in
    word sense disambiguation and document classification tasks

##1.2 Contrib

* by centering, ... their inner product and cosine are affected;
  see Section 3 for detail
* we propose to measure the similarity of objects by the inner product
  (not distance or cosine) in the centered feature space
* objects similar to the data centroid tend to become hubs (Radovanović+ 2010a)
* rrganization
  4. analyze why hubs emerge under a simple probabilistic model
    * why they are suppressed by centering
  5. multi-cluster data (Section 5)
    * Using both synthetic and real datasets
    * objects similar to the centroid also emerge as hubs
  6. weighted centering (Section 6)

#2 Related work

* approaches to improving kNN classification:
  * learning similarity/distance measures from training data (metric learning)
    (Weinberger and Saul, 2009; Qamar+ 2008),
  * weighting nearest neighbors ... (Chen+ 2009), and
  * neighborhood size selection (Wang+ 2006; Guo and Chakraborty, 2010)
  * none of these have addressed the reduction of hubs
* More recently
  * Mutual Proximity transformation
    * Schnitzer+ (2012)
    * rescales distance measures to decrease hubs in a dataset
  * kernels based on graph Laplacian
    * make all objects equally similar to the data centroid => reduce hubs
      (Suzuki+ 2012)
    * such kernels:
      * commute-time kernels (Saerens+ 2004) and the
      * regularized Laplacian
        (Chebotarev and Shamis, 1997; Smola and Kondor, 2003)
* In Section 7, we evaluate
  centering, Mutual Proximity, and Laplacian kernels in NLP tasks
  * centering is equally or even more effective
* Section 4 presents a theoretical justification for using centering
  * this kind of analysis is missing for the Laplacian kernels
  * [computation cost] For a dataset of n objects
    * Centering takes O(n^2) time to compute, whereas computing a
    * Laplacian-based kernel requires O(n^3) time for matrix inversion
    * Mutual Proximity also has a time complexity of O(n^2)

#3 Centering

* centering reduces hubs because it makes the length of the feature vector
  `x_cent` short for (hub) objects x that lie close to the data centroid x̄
  * since we measure object similarity by inner product

#4 Theoretical analysis

* why objects most similar to the centroid tend to be hubs
* Consider ... a distribution with a finite mean vector μ

#5 Hubs in multi-cluster data

* objects that are only slightly more similar to the data mean (centroid)
  may emerge as hubs
  * [demonstration] Using both synthetic and real datasets

##5.2 Real dataset

* Reuters Transcribed dataset
  * multi-class document classification dataset
  * ten classes, and each class roughly forms a cluster
* Figure 2

#6 Hubness weighted centering

* centering can be interpreted as an operation that
  shifts the origin towards hubs
* [hubness] weight of an object as the sum of the similarities (inner products)
  between the object and all objects
* parameter $\gamma$

#7 [NLP] Experiments

* word sense disambiguation (WSD) and document classification
* we also tested two recently proposed approaches to hub reduction:
  * transformation of the base similarity measure (in our case, K) by Mutual
    Proximity (Schnitzer+ 2012) 2 , and the
  * one (Suzuki+ 2012) based on graph Laplacian kernels. Since the
    Laplacian kernels are defined for graph nodes, we computed them by taking
    the cosine similarity matrix K as the weighted adjacency (affinity)
    matrix of a graph. For Laplacian kernels,
    * we computed both the
      * regularized Laplacian kernel (Chebotarev and Shamis, 1997; Smola and
        Kondor, 2003) with several parameter values, as well as the
      * commute-time kernel (Saerens+ 2004), but
      * present only the best results among these kernels

##7.1 WSD

* parameter tuning on the training data
  * neighborhood size k
    * leave-one-out cross validation within
  * γ in `K_weighted`
* we followed Radovanović+ (2010a) and counted `N_k(x)`, the number of
  times object x occurs in the kNN lists of other objects in the dataset

##7.2 Document classification

* Two multiclass document classification datasets were used:
  * Reuters Transcribed and Mini Newsgroups,

#Conclusion

* future work
  * class distribution in the dataset
