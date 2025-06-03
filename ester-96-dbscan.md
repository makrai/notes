Ester, Martin; Kriegel, Hans-Peter; Sander, Jörg; Xu, Xiaowei
A density-based algorithm for discovering clusters
  in large spatial databases with noise
1996 KDD

# Wikipedia

* points are classified as core points, (density-)reachable points and outliers
* algorithm: the abstract one is memory-critical
* Parameter estimation
  * Ideally, ... ε is given by the problem to solve (e.g. a physical distance),
    and minPts is then the desired minimum cluster size.[a]
  * minPts
    * As a rule of thumb, a minimum minPts can be derived from the number of
      dimensions D in the data set, as minPts ≥ D + 1
    * As a rule of thumb, minPts = 2·dim can be used,[6] but it may be necessary
    * larger values for very large data, for noisy data or for data that contains
      many duplicates.[5]
  * ε:
    * [givep minPts], ... ε can then be chosen by using a k-distance graph,
      plotting the distance to the k = minPts-1 nearest neighbor ordered from
      the largest to the smallest value.[5] Good values of ε are where this
      plot shows an "elbow":[1][6][5]
    * [if] too small, a large part of the data will not be clustered; whereas
      for a too high value of ε, clusters will merge ... in the same cluster
    * small values of ε are preferable,[5] and as a rule of thumb only a small
      fraction of points should be within this distance of each other
    * OPTICS plot can be used to choose ε,[5] but then the OPTICS algorithm
      itself can be used to cluster the data
  * Distance function:
    * The choice ... is tightly coupled to the choice of ε
* OPTICS can be seen as a generalization of DBSCAN that replaces the ε
  parameter with a maximum value that mostly affects performance. MinPts then
  essentially becomes the minimum cluster size to find. While the algorithm is
  much easier to parameterize than DBSCAN, the results are a bit more difficult
  to use, as it will usually produce a hierarchical clustering instead of the
  simple data partitioning that DBSCAN produces
* sklearn ... uses ball trees and kd-trees to determine the neighborhood[s]
  *  possibility to use custom metrics is retained; for details, see NearestNeighbors
