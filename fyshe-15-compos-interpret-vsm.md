Alona Fyshe, Leila Wehbe, Partha Talukdar, Brian Murphy, and Tom Mitchell
A Compositional and Interpretable Semantic Space
2015

# Abstract

phrasal meaning in an interpretable way

# 1 Introduction

* Neural network (NN) models are becoming increasingly popular
  * Socher+ 2012;
  * Hashimoto+ 2014;
  * Mikolov+ 2013;
  * Pennington+ 2014
* This paper: Compositional Non-negative Sparse Embedding

# 2 Method

# 2.1 Non-negative Sparse Embeddings

* `A ∈ R^{w×l}` that is sparse, non-negative, and represents word semantics
* D ∈ R^{l×c} : the encoding of corpus statistics in the latent space
* Though Equations 1-3 represent a non-convex system,
  when solving for `A` with D fixed (and vice versa) the loss function is convex
* Mairal+ break the problem into two alternating optimization steps
* `A` is found with a LARS implementation for lasso regression (Efron+ 2004)
* D is found via gradient descent
* (the final solution may not be globally optimal)

# 2.2 Compositional NNSE

* weighted addition composition function
  * maintains the convexity of the loss function,
  * In contrast, an element-wise multiplication, dilation or higher-order
    matrix composition function will lead to a non-convex optimization
* alternating direction method of multipliers (ADMM; Boyd, 2010)

# 3 Data and experiments

* We used the 1000 dependency SVD dimensions X

# 3.1 Phrase Vector Estimation

* two measures of accuracy: rank accuracy ->
  * median or
  * mean reciprocial (MRR)
    * often used to evaluate information retrieval tasks
      * (Kantor and Voorhees, 2000)
    * more emphasis on ranking items close to the top of the list, and
      * less on differences in ranking lower in the list
* As we will see, the rank accuracy of all models is very high (> 99%),
  * approaching the rank accuracy ceiling
* 3.1.1 Estimation Methods
  * two other previously studied composition methods:
    * weighted addition (w.add SVD ), and
    * lexfunc (Baroni and Zamparelli, 2010)
      * We solved with Matlab’s partial least squares implementation ...
        SIMPLS algorithm (Dejong, 1993)
      * Dinu+ (2013) used simple unregularized regression to estimate M
        We also replicated, worse
      * In addition, Baroni and Zamparelli use 300 SVD dimensions to estimate M
        We, for our dataset, using all 1000 dimensions: better
  * difference in performance could be due to
    * thresholding
    * training and tests sets to evenly distribute the phrases
* 3.1.2 Phrase Estimation Errors
  * we chose test phrases for which all 4 models are incorrect and
  * produce a different top ranked phrase; Mechanical Turk

# 3.2 Interpretability

* intruder = kakukktojás (lit. betolakodó)
* we selected
  * the top 5 scoring words in a particular dimension, as well as
  * a low scoring word from that same dimension such that the low scoring
  * word is also in the top 10th percentile of another dimension
* intruders detected is higher for CNNSE, but
* agreement amongst Mturk users is higher for NNSE,

### 3.2.2 Coherence of Phrase Representations
