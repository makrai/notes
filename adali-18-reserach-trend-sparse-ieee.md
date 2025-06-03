È Lay Adali, H. Joel Trussell, Lars Kai Hansen, Vince D. Calhoun
The Dangers of Following Trends in Research:
  Sparsity and Other Examples of Hammers in Search of Nails
2018 IEEE

* In the past, maximum entropy was considered a goal for all estimators
  * it represented the most random solution that fits the data model
  * It worked especially for astronomical imaging
  * we now applying more a priori knowledge and
    enforcing additional physical constraints
* Another common trap is metrics that favors one method over another
  * eg signal-to-noise ratio, a peak-signal-to-noise ratio, average error, or
    maximum error
  * the characteristics of the applications should determine the choice
* a cycle of innovation trigger (Gartner 2015) that leads to a
  * peak of inflated expectations with a rapid slope followed by a
  * rapid downward trend down to a trough of disillusionment
  * gentle upward slope of enlightenment and a
  * plateau of productivity
    where most tools that were once big sources of excitement now reside
* sparsity
  * A current tool that is on the rise
  * including coding, compressive sensing, sparse learning/estimation,
    sparse factorizations, and of course deep nets
  * We will use sparsity as the major example in this Point of View article
  * we provide an overview on use of sparsity and then discuss
    a couple of specific problems

# II. Sparsity in signal processing and machine learning

* before the trend
	* reasons to favor sparsity
		* representation with as few variables as possible
		* Occam’s razor
	* In electrical engineering, sparsity forms the basis of source coding
		* data compression the elimination of statistical redundancy
		* also central to wavelet representations
	* fast implementations through easier representations
	* zeroing out small values when the signal-to-noise-ratio is low
	* in matrix and tensor factorizations, solutions can be made uniquely
		identifiable by imposing sparsity
* The recent emphasis on sparse solutions in matrix factorizations
  came with the popularization of convex optimization techniques
  through the use of the `l_1`-norm and its variants
  * introduced
    * to statistics by Tibshirani with Lasso and
    * to signal processing communities by Chen+ [3] with basis pursuit
      3.   S. S. Chen, D. L. Donoho, and M. A. Saunders,
        “Atomic decomposition by basis pursuit,”
        SIAM J. Sci. Comput., vol. 20, pp. 33–61, 1999.
* dictionary learning (dictL, Olshausen and Field 1996) [5], [6]
  * Following their introduction[,] the field experienced an explosion
  * inspiration came from mammalian vision[: in] the neural code at a
    given point, only a few objects are represented
  * Soon after, dictL and other matrix/tensor decompositions promoting sparsity
    for a wide array of applications,
    and in certain cases where sparsity is not beneficial nor appropriate
    * For example, Cardoso, in extraction of cosmic microwave background
* Sparsity provides an appealing description for eg the brain structure,
  * the often used assumptions of modular and small world structure have been
    challenged in recent work
* Next, we give examples of the other pitfalls

## A. Analysis of Functional Magnetic Resonance Imaging Data

* In the promotion of a new tool, one practice is
  identifying the **main competitor** for the given application domain and then
  questioning its assumptions and main premise
* ICA decomposes a given matrix into a mixing `A` and component `S`
	* as shown in Fig. 2
	* based on the assumption of independence of the sources, rows of S
		using, eg a likelihood cost
  * identifies maximally spatially independent, temporally coherent regions
    without constraining the temporal domain
	* rows of matrix `S` yield the functional networks, i.e.,
    regions defined by voxels showing temporally dependent neuronal activity
  * majority of voxel is background .. values near zero[:] sparsity
  * Infomax algorithm [9] for achieving ICA,
    the first algorithm applied to the problem [10]
    uses a fixed non-linearity favoring sparse distributions in the estimation
* dictL, on the other hand, works by imposing sparsity on the source while
  minimizing `‖ X − AS  ‖_F`
  * In its introduction for fMRI a number of incorrect statements are made,
    which propagated through subsequent publications from multiple groups
    * the voxels being dependent, hence violate the  assumption in ICA
    * ICA is highly sensitive to noise and artifacts
* another dangerous habit is the propagation of references without reading
  * [13] became a standard reference when promoting dictL for fMRI analysis

## B. Color Image Representation

* two [+1] common optimization approaches used with sparse problems
  1. obtains the sparsest solution that satisfies a modeling error constraint
  2. minimizes the modeling error given a required level of sparsity
  3. use a regularization parameter as a weighting factor between the
    error term and the sparsity term, usually through the `l_1`-norm

## C. Performance Comparisons

*	accuracy, computational speed, robustness, reproducibility,
  interpretability, ease of implementation, memory requirements
* For the fMRI analysis problem we discussed
  tradeoff between prediction accuracy and reproducibility as a function of
  the regularization parameter that controls the level of sparsity
  * often inadequately explored in the sparsity papers
* sensitivity of the method to the choice of the regularization parameter

# III. Discussion

* AlphaGo success is not only thanks to deep nets as reported in the media, but
  also Monte Carlo tree search procedure [20]
* leverage strengths of multiple methods
