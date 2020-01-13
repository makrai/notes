Dropout: A Simple Way to Prevent Neural Networks from Overfitting
Nitish Srivastava, Geoffrey Hinton, Alex Krizhevsky, Ilya Sutskever, 
  Ruslan Salakhutdinov
Journal of Machine Learning Research 15 (2014)

# Abstract

* At test time, it is easy to approximate the effect of averaging the
  predictions of all these thinned networks by simply using a single unthinned
  network that has smaller weights.
* We show [improvement] in vision, speech recognition, document classification
  and computational biology, obtaining state-of-the-art results on many
  benchmark data sets.

# 1 Introduction

* regularization: 
  * L1 and L2 regularization and soft weight sharing (Nowlan and Hinton, 1992).
* With unlimited computation, the best way to “regularize” a fixed-sized model
  is to average the predictions of all possible settings of the parameters,
  weighting each setting by its posterior probability given the training data.
  This can sometimes be approximated quite well for simple or small models
  (Xiong et al., 2011; Salakhutdinov and Mnih, 2008)
* dropout
  * `p` can be chosen using a validation set or can simply be set at 0.5, which
    seems to be close to optimal for a wide range of networks and tasks. For
    the input units, however, the optimal probability of retention is usually
    closer to 1 than to 0.5.
  * If a unit is retained with probability p during training, the outgoing
    weights of that unit are multiplied by p at test time as shown in Figure 2.
    This ensures that for any hidden unit the expected output (under the
    distribution used to drop units at training time) is the same as the actual
    output at test time.
* In this paper, we introduce the dropout Restricted Boltzmann Machine model
* structured as follows. 
  * Section 2 describes the motivation for this idea.  
  * Section 3 describes relevant previous work. 
  * Section 4 formally describes the dropout model.  
  * Section 5 gives an algorithm for training dropout networks.  In 
  * Section 6, we present our experimental results where we apply dropout to
    problems in different domains and compare it with other forms of
    regularization and model combination. 
  * Section 7 analyzes the effect of dropout on different properties of a
    neural network and describes how dropout interacts with the network’s
    hyperparameters. 
  * Section 8 describes the Dropout RBM model. In 
  * Section 9 we explore the idea of marginalizing dropout. In 
  * Appendix A, we present a practical guide for training dropout nets. This
    includes a detailed analysis of the practical considerations involved in
    choosing hyperparameters when training dropout networks.

# 2 Motivation

A motivation for dropout comes from a theory of the role of sex in evolution
(Livnat et al., 2010).

# 5 Learning Dropout Nets

## 5.1 Backpropagation

* The only difference is that for each training case in a mini-batch, we sample
  a thinned network by dropping out units.

# 6 Experimental Results

* MNIST: A standard toy data set of handwritten digits.
* TIMIT: A standard speech benchmark for clean speech recognition.
* CIFAR-10 and CIFAR-100: Tiny natural images (Krizhevsky, 2009).
* Street View House Numbers data set (SVHN): 
  * Images of house numbers collected by Google Street View
* ImageNet: A large collection of natural images.
* Reuters-RCV1: A collection of Reuters newswire articles.  
* Alternative Splicing data set: 
  * RNA features for predicting alternative gene splicing 

# 7 Salient Features

* how dropout affects the sparsity of hidden unit activations.
* how the advantages obtained from dropout vary with the 
  * probability of retaining units, 
  * size of the network and the 
  * size of the training set.

# 9 Marginalizing Dropout

* deterministic versions of dropout

# 10 Multiplicative Gaussian Noise

* Dropout involves multiplying hidden activations by Bernoulli distributed
  random variables which take the value 1 with probability p and 0 otherwise.
  This idea can be generalized by multiplying the activations with random
  variables drawn from other distributions. We recently discovered that
  multiplying by a random variable drawn from N (1, 1) works just as well, or
  perhaps better than using Bernoulli noise.

# 11 Conclustion

* A dropout network typically takes 2-3 times longer to train
* one way to obtain some of the benefits of dropout without stochasticity is
  to marginalize the noise to obtain a regularizer that does the same thing as
  the dropout procedure, in expectation
  * for linear regression this regularizer is a modified form of L2
    regularization. 
  * For more complicated models, it is not obvious how to obtain an equivalent
    regularizer. 
* Speeding up dropout is an interesting direction for future work.
