Vatsal Sharan, Gregory Valiant
Guaranteed Tensor Decomposition via Orthogonalized Alternating Least Squares
[aka Orthogonalized ALS:
  A Theoretically Principled Tensor Decomposition Algorithm for Practical Use]
ICML 2017

#http://web.stanford.edu/~vsharan/orth-als.html

* In practice, we have also observed that
  * it is sometimes useful to orthogonalize the factor estimates for a few
    iterations, and then continue with standard ALS
  * when factors have a high correlation with each other,
    such as in low-dimensional settings
  * Our advice to practitioners would be try Hybrid-ALS first before the fully
    orthogonalized Orth-ALS, and then tune the number of steps for which
    orthogonalization takes place to get the best results

#Abstract

* The popular Alternating Least Squares (ALS) algorithm for tensor decomp
  * efficient and easy to implement, but
  * often converges to poor local optima
    * particularly when the weights of the factors are non-uniform
* We propose a modification of the ALS approach that is
  * as efficient as standard ALS, but
  * provably recovers the true factors with random initialization
    under standard incoherence assumptions on the factors
* We demonstrate the significant practical superiority of our approach over
  * synthetic data—including tensor factorization on exact, noisy and
    over-complete tensors, as well as tensor completion—and for computing
  * word embeddings from a third-order word tri-occurrence tensor

#Introduction

* tensor methods have become ... incredibly useful
  * topic modeling (Anandkumar+ 2012),
  * mixtures of Gaussians (Ge+ 2015),
  * community detection (Anandkumar+ 2014a),
  * graphical models with guarantees via the method of moments
    (Anandkumar+ 2014b; Chaganty and Liang, 2014) and
  * reinforcement learning (Azizzadenesheli+ 2016)
* [what] enables these applications is ... uniqueness (Kruskal, 1977)
  * decomposition here refers to the most commonly used CANDECOMP/PARAFAC or CP
* high order dependencies [e.g.] in natural language processing or genomic[s]
* we require ... efficient algorithms
  * scaling to large (and possibly sparse) tensors, and
  * robust to noise and deviations from the idealized “low-rank” assumptions
* Early [algorithms] from the 1970’s (Leurgans+ 1993; Harshman, 1970)
  * provided that the factor matrices are full rank
  * very sensitive to noise in the tensor, not scale well for sparse
* [other] algorithms
  * have strong ... guarantees but are computationally expensive [or]
  * efficient to implement, but [fail] in many natural settings
    * Alternating Least Squares (ALS) algorithm
* we propose ... Orthogonalized Alternating Least Squares (Orth-ALS) which
  * periodically “orthogonalize” the estimates of the factors
  * prevents multiple recovered factors from “chasing after” the same [factors]
* We also applied Orth-ALS to a large 3-tensor of word co-occurrences to
  compute “word embeddings”
  * significantly better than that produced by standard ALS, as we quantify via
    * analogy tasks (i.e. “puppy is to dog as kitten is to ?”) and
    * semantic word-similarity tasks
* [theoretical guarantees]
  * [under the] incoherence property
    [i.e.] the factors ... having small correlation with each other), which is
    * satisfied by random tensors with rank k = o(d^0.25)
    * significantly worse than [that] for polynomial-time algorithms (Ma+ 2016)
    * [enough for NLP, where] the rank of the recovered tensor is typically
      significantly sublinear in the dimensionality of the space
  * we also improve the known guarantees for ... the tensor power method
* organized as follows
  2. related work, the ALS algorithm and tensor power
    * the shortcomings of both algorithms,
      particularly for tensors with non-uniform factor weights
  3. notation
  4. Orth-ALS, and ... the convergence guarantees
    4.2 convergence results for the tensor power method
  5. experimental results, on both synthetic data and the NLP tasks
  6. we illustrate our proof techniques for the special case of orthogonal
     tensors

#2 Background and Related Work

#2.1. tensor decomposition

* three families of algorithms [distinct from alternating minimization
  approaches] and the tensor power method
  * guaranteed decomposition of orthogonal tensors
    (Anandkumar+ 2014b; Kolda and Mayo 2011; Comon+ 2009; Zhang and Golub 2001)
  * guaranteed recovery of non-orthogonal tensors using algorithms for
    orthogonal tensors requires converting the tensor into an orthogonal form
    (known as whitening) which is 
    * ill conditioned in high dimensions (Le+ 2011; Souloumiac, 2009), and is
    * computationally the most expensive step (Huang+ 2013). Another very
  * simultaneous diagonalization and higher order SVD 
    (Colombo and Vlassis, 2016; Kuleshov+ 2015; De Lathauwer, 2006) but these
    * not as computationally efficient as alternating minimization
  * sum-of-squares approach 
    (Ma+ 2016; Hopkins+ 2016; Tang and Shah, 2015; Ge and Ma, 2015)
    * can decompose highly overcomplete random tensors of rank up to o(d^1.5)
    * these results ... are unfortunately not practical
* ideas such as
  * sketching (Song+ 2016; Wang+ 2015b) and
  * contraction of tensor problems to matrix problems (Shah+ 2015)
  * speedup ALS via sampling and randomized least squares
    (Battaglino+ 2017; Cheng+ 2016; Papalexakis+ 2012)

#2.2. ALS algorithm

#2.3. The tensor power method

#3 Notation

* Though all algorithms in the paper extend to asymmetric tensors, 
  we prove convergence results under the symmetric setting where A = B = C.

#4 The Algorithm: Orthogonalized Alternating Least Squares (OrthALS) 5

* combines the 
  * computational benefits of standard ALS and the 
  * provable recovery of the tensor power method, while 
  * avoiding the difficulties faced by both 
    when factors have different weights. Orth-ALS is a simple modification of
* intuition for why the orthogonalization makes sense, let us 
  * consider the more intuitive matrix factorization problem, where the 
    goal is to compute the eigenvectors of a matrix.  
  * Subspace iteration is a straightforward extension of the matrix power
    method to recover all eigenvectors at once. In subspace iteration, 
  * the matrix of eigenvector estimates is orthogonalized 
    before each power method step ..., because 
    otherwise all the vectors would converge to the dominant eigenvector. 
* For the case of tensors, the vectors would not all necessarily converge to
  the dominant factor if the initialization is good, but with high probability
  [many factors driven] towards the larger weight factors.  The
  orthogonalization step is a natural modification which forces the estimates
  to converge to different factors, even if some factors are much larger than
  the others.  It is worth stressing that the orthogonalization step 
* does not force the final recovered factors to be orthogonal (because the ALS
  step follows the orthogonalization step) and in general the factors
  * essential for accurately recovering the factors
* orthogonalization step does not add to the computational cost 
  as the least squares updates in step 4-6 of Algorithm 1 involve an extra
  pseudoinverse term for standard ALS, which evaluates to identity for Orth-ALS
  and does not have to be computed. The cost of [both] is O(k 2 d),

###Variants of Orthogonalized ALS

* Hybrid-ALS
  * Particularly for low-dimensional settings, in practice we found that 
    it is useful to carry out orthogonalization for a few steps and then
    continue with standard ALS updates until convergence 
  * Our advice to practitioners would be try Hybrid-ALS first before the fully
    orthogonalized Orth-ALS, and then 
    tune the number of steps for which orthogonalization takes place
    
##4.1 Performance Guarantees

#5 Experiments 7

* We compare the performance
  * of Orth-ALS, standard ALS (with random and SVD initialization),
    the tensor power method, and the classical eigen-decomposition approach
  * on low rank tensor recovery in a few different parameter regimes,
    on an overcomplete tensor decomposition task and
    a tensor completion task
* factorization of Orth-ALS [vs] standard ALS on a large real-world tensor of
  word tri-occurrence based on the 1.5 billion word English Wikipedia corpus

##5.2 Learning Word Embeddings via Tensor Factorization 11

###Methodology

* English Wikipedia as our corpus, with 1.5 billion words
* word co-occurrence tensor T of the 10,000 most frequent words, where the
  entry `T_ijk` denotes the number of [co-occurrences]
  * window lengths, w = 3 and w = 5. Before factoring the tensor,
* we apply the non-linear element-wise scaling f (x) = log(1 + x)
  * perform well in practice for co-occurrence matrices (Pennington+ 2014)
* we recover a rank 100 approximation of the tensor using Orth-ALS or ALS
* We concatenate the (three) recovered factor matrices into one matrix and
  normalize the rows
* We also evaluated the performance of matrix SVD based methods on the task
  * same [window size and] non-linear element-wise scaling and
  * rank 100 SVD, and set the word embeddings to be the singular vectors after
    row normalization
* implementation details
  * run on a cluster with 8 cores and 48 GB of RAM memory per core
  * Most of the run-time was spent in reading the tensor, the
  * runtime for Orth-ALS was around 80 minutes, with 60 minutes [for reading]
  * we use an optimized ALS solver for sparse tensors (Smith and Karypis; 2015)
    which also has an efficient parallel implementation

###Evaluation: Similarity and Analogy Tasks

* word similarity tasks (Bruni+ 2012; Finkelstein+ 2001)
  * the objective is to maximize the correlation between the similarity scores
* The word analogy tasks (Mikolov+ 2013a;c)

###Results. The performances are summarized in the Table 1

* The use of Orth-ALS rather than standard ALS leads to significant improvement
* matrix SVD method still outperforms the tensor based methods
* We believe [in improvements]
  * better renormalization, additional data, or
    some other tensor rather than the symmetric tri-occurrence tensor or
  * a combination of tensor and matrix based methods
* Alternatively, it is possible that natural language does not contain
  sufficiently rich higher-order dependencies among words that appear close
  together, beyond the [2-mode] structure
* Or [the two tasks we evaluated on] do not require this higher order

#6 Proof Overview: the Orthogonal Tensor Case 12

#7 Conclusion 18

* future work would be 
  * other tensor-related tasks, such as tensor completion
  * more application-specific domains, such as natural language processing

#Appendix 21
