Leland McInnes, John Healy, and Steve Astels
hdbscan: Hierarchical density based clustering
Journal of Open Source Software, 2017 2(11), 205, doi:10.21105/joss.00205

* HDBSCAN
  * Hierarchical Density-Based Spatial Clustering of Applications with Noise
    (Campello, Moulavi, and Sander 2013, Campello+ 2015)
* Performs DBSCAN over varying epsilon values and integrates the result to find
  a clustering that gives the best stability over epsilon
* clusters of varying densities (unlike DBSCAN)
* more robust to parameter selection
* support for
  * Robust Single Linkage clustering (Chaudhuri+ 14, Chaudhuri and Dasgupta 10),
  * GLOSH outlier detection (Campello+ 2015), and
  * tools for visualizing and exploring cluster structures
  * prediction and soft clustering is also available
