Eric Bailey, Charles Meyer, and Shuchin Aeron
Word Embeddings via Tensor Factorization, arXiv
Learning semantic word respresentations via tensor factorization, openreview
rejected from iclr 2018

https://openreview.net/forum?id=B1kIr-WRb

https://github.com/popcorncolonel/tensor_decomp_embedding
* A generic framework for online CP decomposition implemented in TensorFlow can
  be found in `tensor_decomp.py`.
  Included is also Joint Symmetric CP Decomposition, described in the paper

# Abstract

* we modify the performance metrics for the
  Outlier Detection (Camacho-Collados and Navigli 2016) task
* representations for each meaning of a polysemous word by multiplying vectors

# 1 Intro

* embeddings may encode [analogy] in a nonlinear way
  (S Jastrzebski, Lesniak, and Czarnecki 2017)
  * there is no single “best word embedding” ... – different embeddings encode
    different types of information, and thus should be used where they shine
* embeddings are given by a low-rank factor of [the co-occurrence] matrix
  * non-negative sparse embedding (Murphy, Talukdar, and Mitchell 2012)
  * LexVec [Salle, Villavicencio, and Idiart ACL 2016]
    Matrix factorization using window sampling and negative sampling for [word]
* tensors containing [co-occurrences of more than two words]

# 2 Related work

* overview of tensor factorization methods is given in Kolda and Bader (2009)
  * it may be NP-hard to obtain these factorizations in general
* factorization of tensors ... applied to NLP
  * semantic compositionality (T Van de Cruys, Poibeau, and Korhonen 2013)
  * Word semantic representations
    using bayesian probabilistic tensor factorization (Zhang+ 2014)
  * non-negative ... for selectional preference induction (Van de Cruys 2009)
  * generic word embedding [from] symmetric tensors (Sharan & Valiant 17)
    * Orthogonal-ALS, we don’t consider it
    * under incoherency assumptions on the factors
    * results were not evaluated [from the NLP persective]
* latent space disambig, nem a cikkből
  * Latent semantic word sense induction and disambiguation
    T Van de Cruys, M Apidianaki (acl 2011, cited by 45)
  * Quantitative methods for identifying systematic polysemy classes
    L Vieu, E Jezek, T Van de Cruys (2015 cited by 1)
* our work uses symmetric factorization of symmetric tensors
  * Theoretical foundations (Comon+ 2008)
  * we are [seeking a] real symmetric rank-R approximation to the symmetric tns
    * little is known about [the existence of best rank-R] approximation
    * may not exist in general, especially over R (Qi+ 2017)
  * while nonnegative [instead of symmetric] is a well-posed problem
    (Lim & Comon 2009a, Qi+ 2016)

# Mathematical preliminaries

## Pointwise Mutual Information

* In this paper
  * context window ... irrespective of [word] order
  * 3-way PPMI tensors

## Tensor factorization

* CP Decomposition
  * gives rise to a meaningful interpretation of the element-wise product be-
    tween vectors in our word embeddings
* symmetric CP decomposition of nonnegative tensors
  * a szuperszimmetria nem a PPMI tulajdonsága, ahogy írja, hanem
    azért van, mert náluk minden tengely a szókincs
* leaving the study of other tensor decompositions to future
  e.g. Tensor Train or HOSVD (aka Tucker. Oseledets 2011; Kolda and Bader 2009)

# Why factorize the third moment [i.e. third order co-occurrences]?

1. how embedding vectors cluster
  * For identifying the clusters of a planted partition model
    * such as the Stochastic Block Model (SBM),
    * the spectral factorization of node interactions
      completely derived from pair-wise interactions
      is sufficient for discovering the disjoint clusters
      * Mikhail Belkin and Partha Niyogi.
        Laplacian eigenmaps and spectral techniques for embedding and clust
        NIPS 2001
      * F Krzakala+ 2013 Spectral redemption: clustering sparse networks
      * Spielman FOCS 2007 Spectral Graph Theory and its Applications
  * polysemous words belong to multiple ... clusters (Foulds arXiv 17)
    James R. Foulds. Mixed membership word embeddings for comp soc science
    * necessitate the assumption of a Mixed Membership (MM) model
    * factorizing the third moment provably recovers the parameters of
      planted Mixed Membership-SBM model (Anandkumar+ 2013)
      in a way that [pair-wise interactions] cannot
  * Gaussian mixture models for capturing polysemy in word embeddings
    (Athiwaratkun & Wilson 2017)
    * factorizing the third moments can provably
      identify the isotropic Gaussian mixture models (Anandkumar+ 2014)
2. further contextualizes the co-occurrence matrix

# Methodologies

## Computing the Symmetric CP Decomposition

* Even the sparse representation of the tensor takes [large  memory]
  * standard algorithms are infeasible for our uses, e.g.
    * successive rank-1 approximation (Wang & Qi 07; Mu, Hsu, and Goldfarb 15)
    * alternating least-squares (Kolda and Bader 2009)
* we will consider a stochastic online formulation
  similar to that of Maehara, Hayashi, and Kawarabayashi (2016)
  * [mini-batch setting] ... using small random subsets `M^t`
    of the nonzero tensor entries to update the decomposition at time `t`
  * Adam (Kingma and Ba 2014)
  * minibatch around 1,000 sentences
  * 1 epoch
  * negative samples
    * we also include a certain proportion of elements with zero PPMI
      similar to that of Salle, Villavicencio, and Idiart (2016)

## Joint Symmetric Rank-R CP Decomposition

* find the optimal order [i.e. shape?]
* we propose a novel joint tensor factorization problem
* input
  * the fixed rank `R` and
  * supersymmetric tensors `M_n` of different orders but whose
    axis lengths all equal |V|
  * Each tensor `M_n` is to be factorized via rank-R symmetric CP decomposition
    using a single |V| × R factor matrix U
* This problem is a specific instance of Coupled Tensor Decomposition
  * Acar, Kolda, and Dunlavy 2011; Naskovska and Haardt 2016
  * factorize multiple tensors using at least one factor matrix in common
    * supersymmetric (Comon, Qi, and Usevich 2015) ... blind source separation
* in our formulation the rank is fixed

## Shifted PMI

* the best shift we found for CP-S was a shift of α ≈ 3, whereas
* any nonzero shift for JCP-S resulted in a worse embedding across the board

## Computational notes

* nonnegative CP decomposition (Lim & Comon 2009b; Qi+ 2014)
  * well-posed
  * considering this nonnegative decomposition did not significantly change
    the results on down-stream tasks either for CP decomposition or Joint CP
  * We thus [only report results on the simpler] unrestricted CP decomposition

# Evaluation

* corpus of 10 million sentences gathered from Wikipedia
* Because of [small corpus], the results shown should be considered a proof
  of concept rather than an objective comparison to [SOTA] embeddings
* we use 300-dimensional [normalized] vectors (Mikolov+ 2013; Murphy+ 2012)

## Quantitative tasks

* Outlier Detection
* 3-way Outlier Detection
  * As our tensor-based embeddings encode higher order relationships
    [we] compute c(w) based on groups of 3 words
* Simple supervised tasks
  * observe the performance ... as training set size increases
    (Jastrzebski, Lesniak, and Czarnecki 2017)
    * commonly done in transfer learning evaluation
  1. [POS tagging] based solely on [the] word vector
  2. Sentiment analysis ...  as described by Schnabel+ (2015)
* Word similarity ... on the common MEN, MTurk, RW, and SimLex999 datasets
  (Bruni+ 2014; Radinsky+ 2011; Luong+ 2013; Hill+ 2015)
  For an overview of word similarity evaluation, see Schnabel+ (2015)

# Multiplicative compositionality

* [our] embeddings capture polysemy information
  ... through multiplicative compositionality [in unsup fashion]
* We demonstrate this property qualitatively and provide proper motivation
  * leaving automated utilization to future work
* `cos(u*v, z)` approximates PPMI(u, v, z)
* [neighbors in our models] are semantically related to the intended sense
  both for multiplicative and additive composition
  In contrast, for CBOW, only additive composition yields [good] vectors

# Conclusion

* Our key contributions
  1. Two novel tensor factorization based word embeddings [CP-S and JCP-S,]
    based on symmetric CP decomposition
  2. A novel joint symmetric tensor factorization problem
    * using a single rank-R factor matrix
    * allows for utilization of both second and third order co-occurrence[s]
  3. A new embedding evaluation metric
    * to measure amount of third order information
    * a 3-way analogue of Outlier Detection (Camacho-Collados & Navigli 2016)
  4. Word vector multiplicative compositionality for polysemous word[s]
