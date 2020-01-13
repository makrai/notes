Seungil You, David Ding, Kevin Canini, Jan Pfeifer, Maya Gupta
Deep Lattice Networks and Partial Monotonic Functions
NIPS 2017

Ruder: Injecting additional prior knowledge into word embeddings such as
monotonicity

# Abstract

* We propose learning deep models that are
  * monotonic with respect to a user-specified set of inputs by
  * alternating layers of linear embeddings, ensembles of lattices, and
    calibrators (piecewise linear functions)
* Experiments on benchmark and real-world datasets show that six-layer
  SOTA for classification and regression with monotonicity guarantees

# 1 Intro

* For example, if one is predicting whether to give someone else a loan, we
  expect and would like to constrain the prediction to be monotonically
  increasing with respect to the applicant’s income
