Automatic language identification using deep neural networks
Ignacio Lopez-Moreno, Javier Gonzalez-Dominguez, Oldrich Plchot, 
  David Martinez, Joaquin Gonzalez-Rodriguez, Pedro Moreno
2014

#Abstract


we 
  * adapt [feed-forward] DNNs to the problem of identifying the language of a
    given spoken utterance from short-term acoustic features
  * compared to state-of-the-art i-vector based acoustic systems on two
    different datasets: Google 5M LID corpus and NIST LRE 2009
  * show how LID can largely benefit from using DNNs, 
    * especially when a large amount of training data is available
    * relative improvements up to 70%, in `C_avg` , over the baseline system.

# 1 Intro

nowadays, state-of-the-art 
i-vector extractors as a front-end 
  followed by diverse classification mechanisms
    [8] N. Dehak, P. A. Torres-Carrasquillo, D. A. Reynolds, and Reda Dehak,
    “Language Recognition via i-vectors and Dimensionality Reduction.,” 
    in INTERSPEECH.  2011, pp. 857–860, ISCA.
    [9] D. Martinez, O. Plchot, L. Burget, Ondrej Glembek, and Pavel Matejka,
    “Language Recognition in iVectors Space.,” in 
    INTERSPEECH. 2011, pp.  861–864, ISCA.
previous works on neural networks applied to LID report results using 
  shallow architectures [10][11] or 
    [10] R.A. Cole, J.W.T. Inouye, Y.K. Muthusamy, and M. Gopalakrishnan,
    “Language identification with neural networks: a feasibility study,” in
    Communications, Computers and Signal Processing, 1989
    [11] M. Leena, K. Srinivasa Rao, and B. Yegnanarayana,
    “Neural network classifiers for language identification 
      using phonotactic and prosodic features,” in 
      Intelligent Sensing and Information Processing, 2005
  convolutional neural networks [12], in 
    [12] G. Montavon, 
    “Deep learning for spoken language identification,” in 
    NIPS workshop on Deep Learning for Speech ... 2009.
this study, we propose the use of deep neural networks (DNNs)

#2

##i-vector based baseline systems,

* sharing i-vectors as the same starting point, differ in the type of back-end
* 39 PLP (13 + ∆ + ∆∆) feature vectors extracted 5374with a 10ms frame rate...
* standard recipe described in [17] to obtain i-vectors
  * Universal Background Model (UBM) with 1024 components and a 
  * 400-dimensional total variability subspace 
    * initialized by PCA and refined by 10 iterations of EM
* we filtered-out silence frames by using energy-based VAD
* classification
  * as a discriminative approach, ... linear Logistic Regression (LR)
  * two generative approaches were tested, 
    * LDA followed by cosine distance (LDA CD), and a 
    * Gaussian modelling to fit the i-vectors of each language, with 
      * one (1G) or two components with and without tied covariances (2G_TC,
        2G). We also explored the effect of using a 
      * single shared covariance across the languages (1G_SC) vs.
        per-language covariances. For further details about this approach, see
        [9].

##2.2 the proposed DNN architecture

* a fully connected feed-forward neural network [18]. The hidden layers
  contain units with rectified linear activation functions.
* works at frame level, using the same features as the baseline (39 PLP)
* ...
