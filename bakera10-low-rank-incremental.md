Online Principal Component Analysis in High Dimension:
Which Algorithm to Choose?
arXiv:1511.03688v1 [stat.ML] 11 Nov 2015
Hervé Cardot (a) and David Degras (b)

# abstract

* In the current context of data explosion, online techniques that do not
  require storing all data in memory are indispensable to routinely perform
  tasks like principal component analysis (PCA). Recursive algorithms that
  update the PCA with each new observation have been studied in various fields
  of research and found wide applications in industrial monitoring, computer
  vision, astronomy, and latent semantic indexing, among others.  
* This work provides guidance for selecting an online PCA algorithm in
  practice.  We present the main approaches to online PCA, namely, perturbation
  techniques, incremental methods, and stochastic optimization, and compare
  their statistical accuracy, computation time, and memory requirements using
  artificial and real data.  Extensions to missing data and to functional data
  are discussed. All studied algorithms are available package onlinePCA on
  CRAN.

# Intro

* [PCA] has found applications in fields [like] 
  * latent semantic indexing (Zha and Simon, 1999),
* time complexity
