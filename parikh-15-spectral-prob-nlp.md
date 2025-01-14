Spectral Probabilistic Modeling and Applications to Natural Language Processing
Ankur Parikh
2015 Doctoral Thesis

# Abstract

* Probabilistic modeling with latent variables is a powerful paradigm
  * applications: language processing, text mining, and computational biology
  * substantially increases representation power
  * hE learning and modeling can become considerably more complicated
  * non-identifiability issues, nonconvex optimization problem
* In this thesis, we propose to tackle these problems through the lens of
  linear/multi-linear algebra. Viewing latent variable models from this
  perspective allows us to approach key problems such as
  * structure learning and parameter learning using
    tools such as matrix/tensor decompositions, inversion, and additive metrics
  * theoretical and practical advantages
  * eg our spectral parameter learning methods for latent trees and junction
    trees are provably consistent, local-optima-free, and 1-2 orders of
    magnitude faster than EM for large sample sizes
* we focus on applications in Natural Language Processing, using our insights
  * Our method for unsupervised parsing is
    the first algo that has both theoretical guarantees and is also practical
    * performing favorably to the CCM method of Klein and Manning
  * we devel power low rank ensembles
    * a framework for LM that generalizes n-gram techniques to non-integer n.
    * consistently outperforms SOTA Kneser Ney baselines and can
    * train on billion-word datasets in a few hours
