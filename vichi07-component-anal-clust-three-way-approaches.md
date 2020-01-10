Simultaneous Component and Clustering Models
  for Three-way Data: Within and Between Approaches
Maurizio Vichi, Roberto Rocci, and Henk A.L. Kiers
2007

#Abstract

* can be seen as the simultaneous version of
  two procedures based on the sequential application of k-means and Tucker2
* The two techniques, T3Clus and 3Fk-means
  compared theoretically and empirically by a simulation study. In the latter,
  * neither T3Clus nor 3Fk-means outperforms the other in every case. From
  * combine the two techniques in a unique general model, named CT3Clus, having
* simulation study follows to show the effectiveness of the proposal

#1 Intro

* three modes: units, variables and occasions. Large data sets of this kind are
* However,
  * for units it may often be more suitable to reduce dimensionality by means
    of a clustering methodology,
    [for variables and occasions,] a factorial reduction seems more appropriate
* each occasion of X actually induces a different multivariate clustering of
  units
  Therefore, a clustering of X must represent a consensus classification of
  those induced by each occasion
* methodologies for clustering [units of] three-way data
  * Least-Squares approach (Carroll & Arabie 83; Gordon and Vichi 98; Vichi 99)
  * Maximum Likelihood approach (Basford and McLachlan 1985;
    Hunt and Basford 1999) have been proposed
  * [both] without any reduction of variables and occasions which is necessary
* Simultaneous classification and reduction for multivariate data Bock (1987),
* T3Clus, a three-way extension of Bock’s model (Rocci and Vichi 2005)
* In this paper, [the new model 3Fk-means] is proposed to reduce [obj var occ]
  * centroids for objects and of
  * components for variables and occasions, respectively. It represents the
* extension for three-way data
  of the factorial k-means model proposed by Vichi and Kiers (2001). The new
  * fitted to data by using a Least-Squares approach. This model, together with

#2 establishes the notation.  Section 3 briefly describes

#3 two different sequential procedures (also called ‘tandem analyses’) to
obtain clustering and dimensionality reduction of variables and occasions by
means of k-means and Tucker2. Section 4 is devoted to presenting

#4 T3Clus and 3Fk-means for simultaneous classification and reduction, and
provides algorithms for these methods. A

#5 comparison of T3Clus and 3Fk-means, theoretical and simulation

#6 the combined version of T3Clus and 3Fk-means, termed CT3Clus(α)

#7 An ALS algorithm for fitting the combined version of T3Clus and 3Fk-means to

#8 simulation study to test the performance of the proposed method in

* recovering a true clustering structure, to
* sensitivity of the algorithm to the presence of local optima and
* test a criterion for automatic model selection. A

#9 final discussion
