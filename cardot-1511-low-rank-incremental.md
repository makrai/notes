Online Principal Component Analysis in High Dimension: Which Algorithm to Choose
arXiv:1511.03688v1 [stat.ML] 11 Nov 2015
Hervé Cardot and David Degras

# abstract

* online techniques that do not require storing all data in memory are indispens
* Recursive algorithms that update the PCA with each new observation have been
  studied in various fields of research and found wide
  * applications in industrial monitoring, computer vision, astronomy, and
    latent semantic indexing
* This work provides guidance for selecting an online PCA algorithm in practice
  * We present the main approaches to online PCA,
    * perturbation techniques, incremental methods, and stochastic optimization,
    * compare their statistical accuracy, computation time, and memory requiremn
      * using artificial and real data
  * Extensions to missing data and to functional data are discussed
* All studied algorithms are available package onlinePCA on CRAN

# Intro

* [PCA] has found applications in fields [like]
  * latent semantic indexing (Zha and Simon, 1999),
* time complexity
