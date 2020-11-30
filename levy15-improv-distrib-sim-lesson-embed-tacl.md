Omer Levy, Yoav Goldberg, and Ido Dagan
Improving Distributional Similarity with Lessons Learned from Word Embeddings
2015

# Abstract

* We reveal that much of the performance gains of word embeddings are
  due to certain system design choices and hyperparameter optimizations

# 1 Introduction

* Baroni+ (2014) conducts a set of systematic experiments
  comparing word2vec embeddings to the more traditional distributional methods,
  such as pointwise mutual information (PMI) matrices
* comprehensive surveys (Turney and Pantel 2010; Baroni and Lenci 2010)
* hyperparameters
* In this work, we make these hyperparameters explicit, and show how they can
  be adapted and transferred into the traditional count-based approach
* changing the setting of a single hyperparameter yields a greater increase in
  performance
  than switching to a better algorithm or training on a larger corpus

# 2 Background

* For historical reasons, we refer to
  * “count-based” (PPMI and SVD) and
  * “neural” or “prediction-based” (SGNS and GloVe)
* Notation
  * All vectors are normalized to unit length
    before they are used for similarity calculation
* Contexts (of word w)
  * words surrounding it in an L-sized window
  * other definitions of contexts have been studied
    (Padó and Lapata, 2007; Baroni and Lenci, 2010; Levy and Goldberg, 2014a)
  * this work focuses on fixed-window bag-of-words contexts

# 2.1 Explicit Representations (PPMI Matrix)

* pointwise mutual information (PMI, Church and Hanks, 1990)
  * log 0 = ? -> positive PMI
* bias towards infrequent events (Turney and Pantel, 2010)
* widely regarded as state-ofthe-art

# 2.2 Singular Value Decomposition (SVD)

* A common method of [dimensionality reduction] is
  truncated Singular Value Decomposition (SVD), which
  * finds the optimal rank d factorization with respect to `L_2` loss
    (Eckart and Young, 1936)
  * popularized in NLP via Latent Semantic Analysis (LSA, Deerwester+ 1990)
* M = U · Σ · V
  * where U and V are orthonormal and Σ is a diagonal matrix of eigenvalues
* representations,
  * W^SVD = U d · Σ d   word
  * C^SVD = V d         context

# 2.3 Skip-Grams with Negative Sampling (SGNS)

* SGNS as Implicit Matrix Factorization (Levy and Golberg 2014c)
* w · c = PMI(w, c) − log k
* loss function is
  * not based on `L_2`
  * much less sensitive to extreme and infinite values
    * due to a sigmoid function surrounding w  · c
  * weighted => rare (w, c) pairs affect the objective much less

# 2.4 Global Vectors (GloVe)

* w · c + b_w + b_c = log (#(w, c))
* If we were to fix
  ```
  b_w = log #(w) and
  b_c = log #(c),
  ```
  this would be almost equivalent to
  factorizing the PMI matrix shifted by log(|D|)
* However, GloVe learns these parameters, giving
  an extra degree of freedom over SVD and SGNS
* The model is fit to minimize a weighted least square loss,
  * giving more weight to frequent (w, c) pairs

# 3 Transferable Hyperparameters

* [from] word2vec and GloVe to count-based methods

# 3.1 Pre-processing Hyperparameters

* Dynamic Context Window (dyn)
  * words can be weighted according to their distance from the focus word
  * in traditional count-based methods less common,
    [but] also explored, e.g. (Sahlgren, 2006)
  * GloVe 1, 1/2, 1/3,
  * word2vec w/w, w-1/w,
  * dynamic
    * word2vec implements its weighting scheme
      by uniformly sampling the actual window size between 1 and L
* Subsampling (sub)
  * diluting very frequent words
  * Mikolov+ (2013a) randomly removes words that are more frequent
    than some threshold t
  * Following ... Mikolov+ (2013a), we use t = 10^{−5}
    * word2vec’s code q implements a slightly different formula
    * We followed the formula presented in the original paper
     (equation 2)
  * “dirty” subsampling
    * in word2vec ... the removal of tokens is done before the corpus is
     processed into word-context pairs
  * [we found the impact of dirty and clean comparable, and report dirty]
* Deleting Rare Words (del)
  * word2vec removes these tokens ... before creating context windows
  * preliminary experiments showed that [the effect of this] was small

# 3.2 Association Metric Hyperparameters

* Shifted PMI (neg)
  * SPPMI(w, c) = max(PMI(w, c) − log(k), 0)
  * k has two distinct functions
    1. to better estimate the distribution of negative examples;
      a higher k means more data and better estimation
    2. the probability of observing a positive example
      * a higher k means that negative examples are more probable
    * Shifted PPMI captures only the second aspect of k (a prior)
    * We experiment with three values of k: 1, 5, 15
* Context Distribution Smoothing (cds=.75)
  * In word2vec, negative examples (contexts) are sampled according to a
    smoothed unigram distribution
  * Like other smoothing techniques
    (Pantel and Lin, 2002; Turney and Littman, 2003)
  * smoothing alleviates PMI’s bias towards rare words

# 3.3 Post-processing Hyperparameters

* Adding Context Vectors (w+c)
  * originally motivated as an ensemble method
  * Here, we provide a different interpretation of its effect
    * adds first-order similarity terms to the second-order similarity function
  * second-order similarity (w x · w y , c x · c y )
    * the extent to which the two words are replaceable
      based on their tendencies to appear in similar contexts, and are
    * the manifestation of Harris’s (1954) distributional hypothesis
  * first-order similarity (w ∗ · c ∗ )
    * the tendency of one word to appear in the context of the other
  * do not apply to PPMI
* Eigenvalue Weighting (eig)
  * in the SVD-based factorization
    * the context matrix `C_SVD` is orthonormal while
    * the word matrix `W_SVD` is not
  * the factorization ... by SGNS’s ... is much more “symmetric”
    * neither `W_W2V` nor `C_W2V` is orthonormal
    * no ... bias ... to either of the matrices in the training objective
  * symmetry can be achieved in SVD
    * weighting the eigenvalue matrix `Σ_d` with the exponent p
    * significant effect on performance, and should be tuned
      (Bullinaria and Levy, 2012; Turney, 2012)
* Vector Normalization (nrm)
  * +/normalize rows/columns
  * +row -column is superior

# 4 Experimental Setup

# 5 Results

# 5.1 Hyperparameters vs Algorithms
# 5.2 Hyperparameters vs Big Data
# 5.3 Re-evaluating Prior Claims
# 5.4 Comparison with CBOW
* cannot be easily expressed as a factorization

# 6 Hyperparameter Analysis

# 6.1 Harmful Configurations
# 6.2 Beneficial Configurations

# 7 Practical Recommendations
