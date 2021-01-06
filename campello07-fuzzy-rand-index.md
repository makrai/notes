A fuzzy extension of the Rand index and other related indexes for clustering and classification assessment
R.J.G.B.Campello
Pattern Recognition Letters Volume 28, Issue 7, May 2007, Pages 833-841

* A fuzzy extension of the Rand index [Rand 1971] is introduced in this paper.
* Rand index is a traditional criterion for assessment and comparison of
  different results provided by classifiers and clustering algorithms. It is
  able to measure the quality of different hard partitions of a data set from a
  classification perspective, including partitions with different numbers of
* extended here by making it able to evaluate a fuzzy partition of a data set –
  – against a reference hard partition that encodes the actual (known) classes.
* theoretical formulation based on formal concepts from the fuzzy set theory is
  derived and used as a basis for the mathematical interpretation of the Fuzzy
  Rand Index proposed. The 
* fuzzy counterparts of five related indexes also derived from this formulation.  
  * Adjusted Rand Index of Hubert and Arabie, the 
  * Jaccard coefficient, the
  * Minkowski measure, the 
  * Fowlkes–Mallows Index, and the 
  * Γ statistics, are 

# Intro

* Cluster validity measures exist that are very useful in practice as
  quantitative criteria for evaluating the quality of clustering partitions
  (e.g., see (Halkidi+ 2001) and references therein). These measures are
  important, for instance, to the estimation of the number of clusters in
  n-dimensional data sets, where visual inspection is prohibitive for “large” n
  (Bezdek and Pal, 1998). However, it is well-known that different measures may
  perform differently in different scenarios (Pal and Bezdek, 1995, Campello and
  Hruschka, 2006
* Rand index proposed by Rand (1971). This index, which will be 
  * described in details in Section 2, 
  * deals primarily with pairs of data objects and 
    uses two different types of inconsistent classifications as well as two
    different types of consistent classifications, rather than the concepts of
    misclassification and correct classification only. The Rand index, as it was
* fuzzy clustering
  * most data sets comprise ill-delineated subsets that cannot be adequately
  * categories that overlap with each other to some degree. In these cases, the
  * fuzzy clusters to which all the data objects belong to some degree 
    (Bezdek, 1981, Höppner+ 1999). 
  * These algorithms have been shown to be one of the most successful approaches
    to data-driven design of fuzzy and neuro-fuzzy systems, namely, 
    models, predictors, controllers and classifiers 
    (Kosko, 1997, Babuška, 1998, Höppner+ 1999, Dumitrescu+ 2000). When applied
* A fuzzy extension of the Rand index, hereafter called Fuzzy Rand Index, is
  * obtained by 
    * rewriting the original formulation of the Rand index in a fully equivalent
      form by using basic concepts from the set theory. This equivalent
    * extended to the fuzzy domain by using analogous concepts from the fuzzy
      set theory (Pedrycz and Gomide, 1998, Zimmermann, 2001).
* Rand index has some shortcomings that will be further discussed in Section 3.3
  * have biases that may make its results to be misleading in particular
    application scenarios. Fortunately, 
  * there is a family of other external indexes that can be used in order to get
    * the Jaccard coefficient (Halkidi+ 2001)
    * the Minkowski measure (Jiang+ 2004)
    * the Fowlkes–Mallows index (Fowlkes and Mallows, 1983)
    * and the Γ statistics (Jain and Dubes, 1988).
  * these are closely related to the Rand index in that they 
    * can be constructed from the same building blocks based on pairwise
      comparisons of data objects. For this reason, the same set-theoretic
      formulation will also be used in the present paper to derive fuzzy
      extensions of these related indexes in a unified fashion.


# 2 the original Rand index

* Rand index is defined as a+d / a+b+c+d 
  (Rand, 1971, Jain and Dubes, 1988, Everitt+ 2001)
* Number of pairs of data objects belonging to...  
  * a: the same class in R and to the same cluster in Q.
  * b: the same class in R and to different clusters in Q.
  * c: different classes in R and to the same cluster in Q.
  * d: different classes in R and to different clusters in Q.  
  * `a` and d are measures of consistent classifications (agreements), whereas
  * b and c are measures of inconsistent classifications (disagreements).  
* Note that: 
  * ω ∈  [0, 1]; 
  * ω = 0 iff Q is completely inconsistent, i.e., a = d = 0; and 
  * ω = 1 iff the partition under evaluation matches exactly the

# 3 the proposed fuzzy extension of this index

## 3.1 the Rand index is rewritten by using basic concepts from the set theory

## 3.2 a Fuzzy Rand Index is derived by using concepts from the fuzzy set theory

## 3.3 The fuzzy counterparts of five related indexes are derived

* Rand index is that it is not corrected for chance, that is, 
  its expected value is not zero when comparing random partitions. Correcting an
* Adjusted Rand Index (Hubert and Arabie, 1985):(16) 
  * corrected for chance under the assumption that the number of groups
    (classes/clusters) in both partitions R and Q to be compared is the same.  
* Rand index is that it gives the same importance to both the agreement terms   
  * no difference between pairs of objects that are joined or separated in both
    (Saporta and Youness, 2002, Youness and Saporta, 2004).
  * d may dominate the other three terms (a, b, and c), thus causing the Rand
    (Sharan and Shamir, 2000, Jiang+ 2004). This situation gets
  *  particularly critical as the number of classes/clusters increases, since
     the value of the index tends to increase too (Fowlkes and Mallows, 1983,
     Wallace, 1983, Everitt+ 2001). An interesting example is described in
     (Pantel, 2003, p. 67).
* removal of term d from the original Rand index in Eq. (4) results in the
  so-called Jaccard coefficient, given by (Jain and Dubes, 1988, Halkidi+ 2001)
  * An interesting interpretation of the differences between these two indexes
    arises when d is viewed as a “neutral” term – counting pairs of objects that
    are not clearly indicative either of similarity or of inconsistency – in
* Fowlkes–Mallows index (Fowlkes and Mallows, 1983, Jain and Dubes, 1988) and
  * a non-linear modification of the Jaccard coefficient that also keeps
    normality (i.e., ωF ∈ [0, 1]). 
* Minkowski measure (Sharan and Shamir, 2000, Jiang+ 2004), respectively. The
  * the lower its value the better the matching between the partitions (ωM = 0
  * the "proportion" of disagreements between the partitions to the total
    number of pairs of objects in the same class of the reference partition.
* Γ statistics, given by (Jain and Dubes, 1988):(20)
  * Γ ∈ [−1, 1]
* Some of the above-mentioned indexes, 
  * namely, the Adjusted Rand Index, the Jaccard coefficient, and the
    Fowlkes–Mallows index, have been 
  * experimentally shown in Denoeud+ (2005) from a statistical perspective, to
    be more effective than the original Rand index in measuring the closeness
    between two partitions. As a referential measure of closeness, the authors
    adopted the minimum number of transfers of objects between groups needed to
    turn one of the partitions into the other one (called transfer distance),
  
## 3.4 An algorithm for computing these fuzzy indexes

## 3.5 example and the corresponding discussions

# 4 conclusions and some perspectives for future work
