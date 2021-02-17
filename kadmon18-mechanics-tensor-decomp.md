Jonathan Kadmon, Surya Ganguli
Statistical mechanics of low-rank tensor decomposition
https://arxiv.org/abs/1810.10065

https://github.com/ganguli-lab/tensorAMP

Kornai ajánlásával

# Abstract

* Low-rank tensor decomposition
* We
  * derive Bayesian approximate message passing (AMP) algorithms
  * reveals the existence of phase transitions between
    easy, hard and impossible inference regimes
    * the behavior of symmetric, cubic tensor decomposition
  * demonstrate that AMP significantly outperforms ALS in the presence of noise

# 1 Intro

* we derive and analyze an approximate message passing (AMP) algorithm
  for optimal Bayesian recovery of
  arbitrarily shaped, high-order low-rank tensors buried in noise
  * both out-performs ALS and admits an analytic theory of its performance
* AMP algorithms have a long history
  early work on the statistical physics of perceptron learning [7, 8]
  (see [9] for a review)
  * The term AMP was coined by Donoho+ in their work on compressed sensing [10]
  * approximates belief propagation in graphical models
  * rigorous analysis of AMP was carried out in [17]
  * For a rank-one matrix estimation problem, AMP was
    * first introduced and analyzed in [18]
    * extended ... by Krzakla and Zdeborova and collaborators [19, 20, 21, 22]
    * recently low-rank tensor decomposition through AMP was studied in [21],
    * analysis was limited to symmetric tensors
      which are then necessarily cubic in shape
* tensors that occur naturally
  * very different numbers of dimensions across modes, yielding
    highly irregularly shaped, non-cubic tensors with no symmetry properties
  * For example in
    * EEG studies ...  time, spatial scale, and electrodes [23].  In
    * fMRI studies the modes could span channels, time, and patients [24]. In
    * neurophysiological measurements ... neurons, time, and conditions [25] or
      neurons, time, and trials [3]. In
    * studies of visual cortex, modes could span neurons, time and stimuli [26]
* we
  * to bridge the gap between theory and experiment,
  * derive and analyze Bayes optimal AMP algorithms
    for arbitrarily shaped high order and low rank tensor decomposition
    with different priors for different tensor modes,
    reflecting their different measurement types
  * find that the low-rank decomposition problem admits two phase transitions
    separating three qualitatively different inference regimes:
    1. the easy regime at low noise where AMP works,
    1. the hard regime at intermediate noise where
      AMP fails but the ground truth tensor is still possible to recover, if
      not in a computationally tractable manner, and
    1. the impossible regime at high noise where
      it is believed no algorithm can recover the ground-truth low rank tensor
* theoretical perspective [to] symmetric cubic tensors in [21]
  * symmetric tensors, it was shown that
    the easy inference regime cannot exist,
    unless the prior over the low rank factor has non-zero mean
  * non-symmetric tensors, one tensor mode can have zero mean
    without destroying the existence of the easy regime,
    as long as the other modes have non-zero mean
  * the space of all possible tensor shapes, the hard regime has the largest
    width along the noise axis when the shape is cubic, thereby indicating that
    * tensor shape can have a strong effect on inference performance, and that
    * cubic tensors have highly non-generic properties
      in the space of all possible tensor shapes
* connections to the statistical mechanics literature
  * In practice, ... the prior or underlying rank of the tensors are not known

# 5 Summary

* our [AMP algorithms] can flexibly assign different priors to different
  modes of a high-order tensor, thereby enabling AMP to handle arbitrarily
  shaped high order tensors that actually occur in the wild
