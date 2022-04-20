Context-Dependent Pre-Trained Deep Neural Networks for Large-Vocabulary Speech
George E. Dahl, Dong Yu, Li Deng, and Alex Acero
IEEE Transactions on audio, speech, and language processing, vol. 20 Jan 2012

# Abstract

* We propose a novel context-dependent (CD) model for
  large-vocabulary speech recognition (LVSR) that leverages recent advances in
  * deep belief networks for phone recognition. We describe
  * pre-trained deep neural network hidden Markov model (DNN-HMM) hybrid archit
  * DNN to produce a distribution over senones (tied triphone states) as its
  * The deep belief network pre-training algorithm is a
    * robust and often helpful way to initialize deep neural networks
      generatively that can aid in optimization and reduce generalization error
* we analyze the effects of various modeling choices on performance.
* Experiments on a challenging business search dataset demonstrate that
  * significantly outperform the conventional context-dependent (GMM)-HMMs,
  * absolute sentence accuracy improvement of 5.8% and 9.2% (or relative error
    reduction of 16.0% and 23.2%) over the CD-GMM-HMMs trained using the
    minimum phone error rate (MPE) and maximum-likelihood (ML) criteria, resp

# 1 Intro

* The deep belief net training algorithm suggested in [24] 
  * semi-supervised approach using deep models
  * initializes the weights of each layer individually in a purely unsupervised
    * ie acoustic data with no transcriptions of any kind.
  * fine-tunes the entire network using labeled data. This

# 5 Conclusion and future

* future
  * parallelize training not just at the matrix arithmetic level. Finding new
    * may require a better theoretical understanding of deep learning.
* speaker and environment adaptation algorithms for DNNHMMs
  * ideally ones that are completely unsupervised and integrated with the
    pre-training phase
  * Inspiration for such algorithms may come from the
    * ANN-HMM literature [72,73] or the many successful
    * adaptation techniques developed in the past decades for GMM-HMMs
      * MLLR [74], MAP [75], joint compensation of distortions [76],
        variable parameter HMMs [77]).  Third, the training in this study used
* the embedded Viterbi algorithm is not optimal. We believe additional
  * optimizing an objective function based on the full sequence, as we have
    already demonstrated on the TIMIT dataset with some success [31].  In
* treatment of the time dimension of speech
  * by DNN-HMM and GMM-HMMs alike as a very crude way of dealing with the
  * The weaknesses in how HMMs deal with the temporal dimension of speech
    inputs have been analyzed in detail in [78]–[81].  There is a vast space to
  * insights gained from temporal-centric generative modeling research in
    neural networks and in speech (e.g., [2], [47], [82], and [83]). Finally,
* Gaussian RBMs can learn an initial distributed representation of their input,
  * hE they still produce a diagonal covariance Gaussian for the conditional
    distribution over the input space given the latent state (as diagonal
    covariance GMMs also do)
  * A more powerful first layer model, namely the
    mean-covariance restricted Boltzmann machine [84] significantly enhanced
    the performance of context-independent DNN-HMMs for phone recognition [32].
