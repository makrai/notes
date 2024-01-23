VICReg: Variance-Invariance-Covariance Regularization for Self-Superv Learning
Adrien Bardes, Jean Ponce, Yann LeCun
ICLR 2022 Poster

tl;dr: Variance regularization prevents collapse in self-supervised repr learn

# Abstract

* Recent self-supervised methods for image representation learning
  maximize the agreement between embedding vectors produced by encoders fed
  with different views of the same image
* main challenge is to prevent a collapse ie constant or non-informative vecs
* We introduce VICReg (Variance-Invariance-Covariance Regularization)
  * explicitly avoids the collapse problem with
  * two regularizations terms applied to both embeddings separately:
    1. maintains the variance of each embedding dimension above a threshold,
    2. decorrelates each pair of variables. Unlike most other approaches
  * not require techniques such as weight sharing between the branches,
    batch normalization, feature-wise normalization, output quantization,
    stop gradient, memory banks, etc
* results on par with the SOTA on several downstream tasks. In addition, we
* stabilizes the training of other methods and leads to performance improv

# 1 Intro

* Self-supervised representation learning has made significant progress
  * almost reaching the performance of supervised baselines on many downstreams
  * Bachman+ (2019); Misra & Maaten (2020); He+ (2020); Tian+ (2020); Caron+
    (2020); Grill+ (2020); Chen & He (2020); Gidaris+ (2021); Zbontar+ (2021)
    * Ishan Misra and Laurens van der Maaten. CVPR, 2020
      Self-supervised learning of pretext-invariant representations
  * Several recent approaches rely on a
    joint embedding architecture in which
    two networks are trained to produce
    similar embeddings for different views of the same image
  * eg Siamese network architecture (Bromley+ 1994), where
    the two networks share the same weights
  * main challenge with joint embedding architectures is to prevent a collapse
    * ie the two branches ignore the inputs and produce identical and constant
  * two main approaches to preventing collapse:
    * contrastive methods and
    * information maximization methods
  * Contrastive 
    (Bromley+ 1994; Chopra+ 2005; He+ 2020; Hjelm+ 2019; Chen+ 2020a)
    * costly, require large batch sizes or memory banks, and use
      a loss that explicitly pushes the embeddings of dissimilar images away
    * require a mining procedure to search for offending dissimilar samples
      from a memory bank (He+ 2020) or from the current batch (Chen+ 2020a)
  * Quantization-based approaches (Caron+ 2020; 2018) force the embeddings of
    different samples to belong to different clusters on the unit sphere
    * Collapse is prevented by ensuring that the assignment of samples to
      clusters is as uniform as possible
    * A similarity term encourages the cluster assignment score vectors from
      the two branches to be similar
  * More recent methods not rely on contrastive samples or vector quantization,
    yet produce high-quality representations
    * eg BYOL (Grill+ 2020) and SimSiam (Chen & He 2020)
    * They exploit several tricks: batch-wise or feature-wise normalization, a
      "momentum encoder" in which the parameter vector of one branch is a
      low-pass-filtered version of the parameter vector of the other branch
      (Grill+ 2020; Richemond+ 2020), or a stop-gradient operation in one of
      the branches (Chen & He 2020)
    * not fully understood
      (the dynamics of learning in these methods, and how they avoid collapse)
    * theoretical and empirical studies point to the crucial importance of
      batch-wise or feature-wise normalization (Richemond+ 2020); Tian+ 2021)
      Finally, an alternative class of collapse prevention methods
  * maximizing the information content of the embedding
    (Zbontar+ 2021; Ermolov+ 2021)
    * decorrelating every pair of variables of the embedding vectors
    * indirectly maximizes the information content of the embedding vectors
    * two methods
      * The Barlow Twins method drives the normalized cross-correlation matrix
        of the two embeddings towards the identity (Zbontar+ 2021)
      * the Whitening-MSE method whitens and spreads out the embedding vectors
        on the unit sphere (Ermolov+ 2021)

* Table 4: Effect of incorporating variance and covariance regularization in
  different methods.  Top-1 ImageNet accuracy with the linear evaluation
  protocol after 100 pretraining epochs. For all methods, pretraining follows
  the architecture, the optimization and the data augmentation protocol of the
  original method using our reimplementation
  * ME: Momentum Encoder
  * SG: stop-gradient
  * PR: predictor
  * BN: Batch normalization layers
      after input and inner linear layers in the expander
  * No Reg: No additional regularization
  * Var Reg: Variance regularization
  * Var/Cov Reg: Variance and Covariance regularization
