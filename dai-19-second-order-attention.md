Second-order attention network for single image super-resolution
T Dai, J Cai, Y Zhang, ST Xia
IEEE 2019

# Abstract

* Recently, deep convolutional neural networks (CNNs) have been widely explored
  in single image super-resolution (SISR) and obtained remarkable performance.
  * hE focus on wider or deeper architecture design,
  * neglecting to explore the feature correlations of intermediate layers,
* we propose a second-order attention network (SAN) for more powerful
  * feature expression and feature correlation learning. Specifically,
  * a novel trainable second-order channel attention (SOCA) module is deved
    * adaptively rescale the channel-wise features by using second-order
      feature statistics for more discriminative representations.
  * a non-locally enhanced residual group (NLRG) structure, which not only
    * incorporates non-local operations to capture long-distance spatial
      contextual information, but also contains
    * repeated local-source residual attention groups (LSRAG)
      to learn increasingly abstract feature representations.
* Experimental results demonstrate the
  * superiority of our SAN network over SOTA SISR methods in terms of
    both quantitative metrics and visual quality.

# 1. Introduction

* Single image super-resolution (SISR) [5] has recently received much
  * this inverse problem is ill-posed since multiple HR solutions can map to
    any LR input. Therefore, a great number of SR
* early methods:
  * interpolation-based [37] and
    * (eg bilinear and bicubic methods) are simple and efﬁcient but limited in applications
  * model-based [4]
    * powerful image priors eg non-local similarity prior [34] and sparsity [4]
    * ﬂexible to produce relative high-quality HR images, they still suffer
    * drawbacks:
      * such methods often involve a time-consuming optimization process;
      * the performance may degrade quickly when image statistics are biased from the image prior.
* Deep convolution neural networks (CNNs) have recently achieved
  unprecedented success in various problems [7, 25]
  * The powerful feature representation and end-to-end training paradigm of CNN
  * learn a mapping function from an interpolated or LR input to its
    corresponding HR output. By fully exploiting the image statics inherent in
  * SOTA results in SISR [2, 12, 14, 36, 39, 38]. Although considerable
  * limitations: most of CNN-based SR methods do
    * not make full use of the information from the original LR images, thereby
    * focus mainly on designing a deeper or wider network to learn more
      discriminative high-level features, while
      * rarely exploiting the inherent feature correlations in intermediate
        layers, thus hindering the representational ability of CNNs.  To
* we propose a deep secondorder attention network (SAN) for more powerful
  feature expression and feature correlation learning. Speciﬁcally, we a
  * second-order channel attention (SOCA) mechanism for better feature
    correlation learning. Our SOCA adaptively
  * learns feature inter-dependencies by exploiting second-order feature
    statistics instead of ﬁrst-order ones.
Such SOCA mechnism makes our network focus on more informative feature and
  * a non-locally enhanced residual group (NLRG) structure is presented to
    further incorporates nonlocal operations to capture long-distance spatial
    contextual information
  * By stacking the local-source residual attention groups (LSRAG) structure,
    we can exploit the information from the LR images and allow the abundant
    low-frequency information to be bypassed. As shown
* fig 1: more image details compared with other SOTA SR methods.
  * Extensive experiments on public datasets demonstrate the superiority of our
    SAN over SOTA methods in terms of both quantitive and visual quality.
  * second-order channel attention (SOCA) mechanism to
    adaptively rescale features by considering feature statistics higher than
    ﬁrst-order. Such SOCA mechanism allows our network to focus on more
    * an iterative method for covariance normalization to speed up the training
  * non-locally enhanced residual group (NLRG) structure to build a deep
    network, which
    * further incorporates non-local operations to capture spatial
      contextual information, and
  * share-source residual group structure to learn deep features. Besides, the
    * through sharesource skip connections could allow more abundant in-
      formation from the LR input to be bypassed and ease the training of the
