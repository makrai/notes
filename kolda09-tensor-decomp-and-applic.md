Tensor Decompositions and Applications
Tamara G. Kolda and Brett W. Bader
2009 SIAM REVIEW


# Abstract

* applications in psychometrics, chemometrics, signal processing, numerical
  linear algebra, computer vision, numerical analysis, data mining,
  neuroscience, graph analysis, and elsewhere
* Two particular tensor decompositions [are] higher-order extensions of SVD
  * CANDECOMP/PARAFAC (CP) decomposes a tensor as a sum of rank-one tensors,
  * Tucker decomposition is a higher-order form of PCA
  * other tensor decompositions, including INDSCAL, PARAFAC2, CANDELINC,
    DEDICOM, and PARATUCK2 as well as nonnegative variants of all of the above
* The N-way Toolbox, Tensor Toolbox, and Multilinear Engine are ... packages

# 1 Intro

* history
 * Tensor decompositions originated with Hitchcock in 1927 [105, 106]
 * the idea of a multiway model is attributed to Cattell in 1944 [40, 41]
 * scant attention until [work in psychometrics]
   (Tucker 1963+; Carroll and Chang 1970; Harshman 1970)
 * in chemometrics, Appellof and Davidson (1981) [were] the first
 * decompositions of bilinear forms in the field of algebraic complexity
   (Knuth 1997), applications like the Strassen matrix multiplication

# 2 notation and common operations

* pointers to other papers that discuss notation

## 2.6. Matrix Kronecker, Khatri–Rao, and Hadamard Products

# 3 CP decomposition 9

* history: invented more times
  * Hitchcock (1927) proposed the idea of the polyadic form of a tensor, i.e.,
  * Cattell (1944) proposed ... multiple axes for analysis
  * 1970
    * CANDECOMP (canonical decomposition, Carroll and Chang), and
    * PARAFAC (parallel factors, Harshman).  We refer to the CANDECOMP/PARAFAC
      decomposition as CP, per Kiers [122].  [166] independently
      discovered CP
  * in brain imaging (Möcks 1988), the topographic components model.  Table 3.1
* slicewise expressions [of tensor decomposition] do not easily extend beyond
  three dimensions

## 3.1. Tensor Rank 10

* the rank of a real-valued tensor may actually be different over R and C
* maximum and typical ranks
  * maximum rank is defined as the largest attainable rank, whereas the
  * typical rank is any rank that occurs with probability greater than zero
  * For ... matrices, the [two] ranks are identical and equal to min{I, J}
  * For tensors, the two ranks may be different.  Moreover,
    * over R, there may be more than one typical rank, whereas
    * there is always only one typical rank over C
  * See also the concept of border rank discussed in section 3.3

## 3.2. Uniqueness 13

* De Lathauwer [55] has looked at
  * methods to determine the rank of a tensor and the
  * when a given CP decomposition is unique
    deterministically or generically (i.e., with probability one)

## 3.3. Low-Rank Approximations and the Border Rank 14

* the components of the best rank-k model may not be solved for sequentially
* degenerate if it may be approximated arbitrarily well by a factorization of
  lower rank
  * the magnitude of some terms in the decomposition go to infinity but have
    opposite sign
  * the set of tensors of a given size that do not have a best rank-k
    approximation has positive volume ... for at least some values of k
  * [in] the case of ... size I × J × 3 with two typical ranks[,] in most cases
    the higher ranks can be approximated arbitrarily well by a lower-rank
* border rank (Bini 1979), ... the minimum number of rank-one tensors p16
  that are sufficient to approximate the given tensor with arbitrarily small
  nonzero error

## 3.4. Computing the CP Decomposition 17

* there is no finite algorithm for determining the rank of a tensor [143, 101];
* how to choose the number of rank-one components. Most procedures fit multiple
  CP decompositions with different numbers of components until one is “good.”
* there is no perfect procedure for fitting CP for a given number of [comps]
* consistency diagnostic called CORCONDIA to compare different numbers of
  components (Bro and Kiers 2003)
* alternating least squares (ALS) method (Carroll & Chang 1970; Harshman 1970)
  * simple to understand and implement, but can take many iterations
  * not guaranteed to converge to a global minimum or even a stationary point
* techniques for improving the efficiency of ALS [220, 221]
  * improving ALS with line searches (Rajih and Comon 2005; Nion+ 2008)
  * Tikhonov regularization (Navasca+ 2008)
  * Faber, Bro, and Hopke [78] compare ALS with six different methods
    * alternating slice-wise diagonalization (ASD) method [110] is [fast]
    * [ASD is superior]
  * Tomasi and Bro [223] compare ALS and ASD to four [plus three] methods
    * apply Tucker-based compression (see section 4 and section 5.3) and
      then compute a CP decomposition of the reduced array; see [30].
    * damped Gauss–Newton (dGN) and a variant called PMF3 by Paatero [178]
    * Both dGN and PMF3 optimize all factor matrices simultaneously.
    * ASD is deemed to be inferior to other alternating-type methods
  * Derivative-based methods (dGN and PMF3) are
    * generally superior to ALS in terms of their convergence properties but
    * more expensive in both memory and time

## 3.5. Applications of CP 19

* connection to tensor rank and tensor border rank, conditions for uniqueness,
  algorithms and computational issues, and applications

# 4 Tucker decomposition [aka. HOSVD] 20

* relationship to compression, the notion of n-rank, algorithms and
  computational issues, and applications
* introduced by Tucker (1963) and refined in subsequent articles
* the factor matrices (which are usually orthogonal) and
  can be thought of as the principal components in each mode
* the core tensor[']s entries show the level of interaction between the
  different components
* In some cases, the storage for the decomposed version of the tensor can be
  significantly smaller than for the original tensor; see Bader and Kolda [17]
* CP can be viewed as a special case of Tucker
  where the core tensor is superdiagonal and P = Q = R
* Two important variations of the decomposition are also worth noting here
  * Tucker2 ... sets one of the factor matrices to be the identity matrix
  * Tucker1 decomposition [226] sets two of the factor matrices to be I
    * equivalent to standard two-dimensional PCA, since X (1) = AG (1)
  * These concepts extend easily to the N-way case
    * we can set any subset of the factor matrices to the identity matrix
* choosing between CP and the different Tucker models in the three-way case
  * Ceulemans and Kiers (2006) discuss methods for
    choosing between CP and the different Tucker models in the three-way case
    * [42] E. Ceulemans and H. A. L. Kiers,
      Selecting among three-mode principal component models of different types
      and complexities: A numerical convex hull based method,
      British J.  Math. Statist. Psych., 59 (2006), pp. 133–150.

## 4.1. The n-Rank 22

## 4.2. Computing the Tucker Decomposition 22

## 4.3. Lack of Uniqueness and Methods to Overcome It 25

## 4.4. Applications of Tucker

* Kiers and Van Mechelen (2001) ... is a good introduction
  * when to use three-way techniques rather than two-way (based on an ANOVA)
  * how to preprocess the data
  * choosing the rank ... and an appropriate rotation
  * methods for presenting the results
* Liu+ (2005) applied Tucker to create a tensor space model,
  * analogous to the well-known vector space model in text analysis.
  * N. Liu, B. Zhang, J. Yan, Z. Chen, W. Liu, F. Bai, and L. Chien,
    Text representation: From vector to tensor
    ICDM 2005
* J. Sun+  [209, 210]
  * dynamically updating a Tucker approximation, with
    applications ranging from text analysis to environmental and network model
  * [209] J. Sun, S. Papadimitriou, and P. S. Yu,
    Window-based tensor analysis on high-dimensional and multi-aspect streams, in
    ICDM 2006
  * [210] J. Sun, D. Tao, and C. Faloutsos,
    Beyond streams and graphs: Dynamic tensor analysis, in
    KDD 2006

# 5 other decompositions 26

* including INDSCAL [38], PARAFAC2 [92], CANDELINC [39], DEDICOM [93], and
  PARATUCK2 [100], and their applications

# 6 software for tensor computations

# 7 Discussion 36

* There is a flurry of current research on ... better methods for determining
  typical and maximal tensor ranks
* preparing the data for processing; see, e.g., [36]
  * Bro and Smilde (2003) Centering and scaling in component analysis,
* missing data, especially systematically missing data
  * in PARAFAC (Tomasi and Bro 2005)
  * Kiers, (1997) Weighted least squares fitting
