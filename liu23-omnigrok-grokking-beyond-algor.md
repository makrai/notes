Omnigrok: Grokking Beyond Algorithmic Data
Ziming Liu, Eric J Michaud, Max Tegmark
2023 ICLR 2023 notable top 25%

# Keywords

grokking, loss landscape, neural dynamics, representation learning, init

# TL;DR

* understand grokking through the lens of neural loss landscapes, and show
  grokking can occur for various datasets beyond algorithmic datasets.

# Abstract

* Grokking, the unusual,elusive phenomenon for algorithmic datasets where
  generalization happens long after overfitting the training data
* We aim to understand grokking by analyzing the loss landscapes of NNs,
  * the mismatch between training and test losses as the cause for grokking. We
  * "LU mechanism": training and test losses (against model weight norm)
    typically resemble "L" and "U", respectively
* This simple mechanism can nicely explain many aspects of grokking:
  data size dependence, weight decay dependence, the emergence of
  representations, etc.
* Guided by the intuitive picture, we are able to
  induce grokking on tasks involving images, language and molecules
  * nL the grokking signals are sometimes less dramatic
* We attribute the dramatic nature of grokking for algorithmic datasets to
  representation learning.
