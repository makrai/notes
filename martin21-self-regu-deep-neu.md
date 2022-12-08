Implicit Self-Regularization in Deep Neural Networks:
  Evidence from Random Matrix Theory and Implications for Learning
Charles H. Martin, Michael W. Mahoney
Journal of ML Research 22(165):1−73, 2021

# Abstract

* we apply Random Matrix Theory (RMT) to analyze the weight matrices of DNNs,
* which network
  * production quality, pre-trained models such as AlexNet and Inception
  * smaller models trained from scratch, eg LeNet5 and a miniature-AlexNet
* Empirical and theoretical results clearly indicate that
  the DNN training process itself implicitly implements a form of Self-Regu,
  implicitly sculpting a more regularized energy or penalty landscape
  * the empirical spectral density (ESD) of DNN layer matrices displays
    signatures of traditionally-regularized statistical models
    * without exogenously [~kívülről] specifying traditional forms of
      explicit regu eg Dropout or Weight Norm constraints
* we identify 5+1 Phases of Training,
  * Building on relatively recent results in RMT,
    most notably its extension to Universality classes of Heavy-Tailed mxs
  * phases corresponding to increasing amounts of Implicit Self-Regularization
  * during the training process as well as in the final learned DNNs
  * For smaller and/or older DNNs, this Implicit Self-Regularization is like
    traditional Tikhonov regularization, in that
    there is a “size scale” separating signal from noise
  * For SOTA DNNs, however, we identify a novel form of
    Heavy-Tailed Self-Regularization,
    similar to the self-organization seen in the statistical physics of
    disordered systems (such as classical models of actual neural activity)
    * results from correlations arising at all size scales, which for DNNs
      arises implicitly due to the training process itself
    * can depend strongly on the many knobs of the training process
    * we can cause a small model to exhibit all 5+1 phases of training simply
      by changing the batch size

# 1 Introduction

## 1.1 A historical perspective

* optimization and learning theory cannot explain and predict the properties of
  NNs; not a new phenomenon
  * From the earlies: suspected that VC theory did not apply to these systems
  * Vapnik+ (1994) said
    * VC theory is derived for methods that minimize the empirical risk
    * hE, multilayer nets cannot be viewed as minimizing the empirical risk
      over the entire set of functions implementable by the network
  * It was originally assumed that local minima in the energy/loss surface were
    responsible for the inability of VC theory to describe NNs (Vapnik+ 1994),
    * getting trapped in local minima during training limited the number of
      possible functions realizable by the network
  * soon realized that the presence of local minima in the energy function was
    not a problem in practice (LeCun+ 1998; Duda+ 2001)
    * More recently, this fact has been rediscovered
      (Pascanu+ 2014; Dauphin+ 2014; Goodfellow+ 2014; Soudry and Hoffer, 2017)
  * there were other theories of generalization based on statistical mechanics
    (Seung+ 1992; Watkin+ 1993; Haussler+ 1996; Engel and den Broeck, 2001),
    * fell out of favor in the ML/NN communities for technical and non-tech rea
  * VC theory and related techniques continued to remain popular, in spite of
    their obvious problems.  See Appendix A.1 for additional motivation
* from the Appendix
    * Choromanska+ (2014) suggested that
      the Energy/optimization Landscape of modern DNNs resembles the Energy
      Landscape of a zero-temperature Gaussian Spin Glass; and empirical result
    * Martin and Mahoney: the Spin Glass analogy may be useful to understand
      severe overtraining versus the inability to overtrain in modern DNNs
      (Martin and Mahoney, 2017)
  * non-neu regularization can be either explicit or implicit
    * explicit, it involves making the loss function L “nicer” or “smoother” or
      “more well-defined”
      by adding an explicit capacity control term directly to the loss, ie
      by considering a modified objective of the form L(W) + αkW k
      * we tune the regularization parameter α by cross validation
    * implicit, we instead have some adjustable operational procedure
      like early stopping of an iterative algorithm or truncating small entries
      * implicit regularization in a broader context, see Mahoney (2012)
    * relate the two: Mahoney and Orecchia (2011); Perry and Mahoney (2011);
      Gleich and Mahoney (2014)
  * hE, DNNs have many adjustable “knobs and switches,” indep of the params
    * nearly anything that improves generalization is called regularization,
    * Kukačka+ (2017) presents a taxonomy of over 50 different regu techniques
    * The most common include
      * ML like Weight Norm regularization,
      * “tricks of the trade” like early stopping & decreasing the batch size,
      * DNN-specific methods like Batch Normalization and Dropout
    * Evaluating and comparing these methods is challenging
      * in part since they are often constrained by systems or other
        not-traditionally-ML considerations
      * Deep Learning avoids cross validation (since there are too many params)
        and instead it simply drives training error to zero (followed by
        subsequent fiddling of knobs and switches)
        * test information can still leak into the training process (indeed,
          perhaps even more severely for DNNs than traditional ML methods)
* two related questions
  * Theoretical: Why is regularization in deep learning seemingly quite
    different than regularization in other areas of ML; and
    what is the right theoretical framework to investigate regu for DNNs?
  * Practical: How can one control and adjust, in a theoretically-principled
    way, the many knobs and switches that exist in modern DNN systems,
    eg to train these models efficiently and effectively,
    to monitor their effects on the global Energy Landscape, etc.?
* eg provide metrics to characterize qualitatively different classes of
  learning behaviors, as predicted in recent work (Martin and Mahoney, 2017)

## 1.2 Overview of our approach

## 1.3 Summary of our results

* We analyze the distribution of eigenvalues,
  ie the Empirical Spectral Density (ESD), ρ N (λ),
  of the correlation matrix X = W T W associated with the layer weight matrix W
* In some/other cases,
  * the ESDs are very well-described by the Marchenko-Pastur (MP) distribution
  * the ESDs are well-described by the MP distribution, with the
    exception of one or more large eigenvalues that can be modeled by a
    Spiked-Covariance model (Malevergne and Sornette, 2002; Johnstone, 2001)
  * in cases—including nearly every current SOTA model we have examined—the
    ESDs are poorly-described by traditional RMT, and instead they are
    more consistent with Heavy-Tailed behavior seen in the statistical physics
    of disordered systems (Sornette, 2006; Bun+ 2017)
* we develop a practical theory of Implicit Self-Regularization in DNNs
  * an operational theory characterizing 5+1 phases of DNN training
  * To test and validate our theory, we consider two smaller models on CIFAR10

### Main Empirical Results

* evaluating empirically the ESDs (and related RMT-based statistics) for weight
  matrices for a suite of DNN models, thereby probing the Energy Landscapes
  * For older and/or smaller models, these results are
    consistent with implicit Self-Regularization that is Tikhonov-like; and
  * for modern SOTA models, these results suggest
    novel forms of Heavy-Tailed Self-Regularization
* Capacity Control Metrics
  * We study simple capacity control metrics, the Matrix Entropy, the
    linear algebraic or Hard Rank, and the Stable Rank
  * We also use RMT to define a new metric, the MP Soft Rank
  * These metrics track the amount of Self-Regularization
    * either during training or in a pre-trained DNN
* Self-Regularization in old/small models. The ESDs of older/smaller DNNs
  * models like LeNet5 and a toy MLP3 model
  * weak Self-Regularization,
    * well-modeled by a perturbative variant of MP theory, the
      Spiked-Covariance model
    * a small number of eigenvalues pull out from the random bulk, and thus
      the MP Soft Rank and Stable Rank both decrease
    * like explicit Tikhonov regularization, in that
      there is a “size scale” that cleanly separates “signal” from “noise,”
* Heavy-Tailed Self-Regularization. The ESDs of larger, modern DNN models
  * models including AlexNet and Inception and
    nearly every other large-scale model we have examined
  * deviate strongly from the common Gaussian-based MP model
    * in one of the very different Universality classes of Heavy-Tailed
      random matrix models. We call this Heavy-Tailed Self-Regularization
    * the MP Soft Rank vanishes, and the Stable Rank decreases, but
      the full Hard Rank is still retained
    * The ESD fully (or partially) Heavy-Tailed, but with finite support
    * no “size scale” (even in the theory) that separates “signal” vs “noise”

### Main Theoretical Results: an operational the-

### Evaluating the Theory using a smaller

### Main Methodological Contribution

### Remark. Subsequent to the dissemination of the initial technical report

* work motivated by our results
  * proved theorems (Dereziński+ 2019; Liao+ 2020; Theisen+ 2020;
    Hodgkinson and Mahoney, 2020; Lim+ 2021)
  * solved much more practical problems on SOTA DNNs, including:
    * “predicting trends in the quality of SOTA neural networks without access
      to training or testing data” (Martin+ 2020, 2021)
    * a post-mortem on a deep learning contest (Jiang+ 2020a,b),
      * identifying a Simpson’s paradox, and
      * interpreting the results in terms of the complementary roles of
        implicit scale metrics versus shape metrics (Martin and Mahoney, 2021)

## 1.4 Outline of the paper

# 2 Simple Capacity Metrics and Transitions during Backprop

2.1 Simple capacity control metrics
2.2 Empirical results: Capacity transitions while training . 9

# 3 Basic Random Matrix Theory (RMT)

3.1 Marchenko-Pastur (MP) theory for rectangular matrices
3.2 Heavy-Tailed extensions of MP theory
3.3 Eigenvector localization . 13

# 4 Empirical Results: ESDs for Existing, Pretrained

4.1 Example: LeNet5 (1998)
4.2 Example: AlexNet (2012)
4.3 Example: InceptionV3 (2014)
4.4 Empirical results for other pre-trained DNNs
4.5 Towards a theory of Self-Regularization DNNs

# 5 5+1 Phases of Regularized Training

5.1 Random-like
5.2 Bleeding-out
5.3 Bulk+Spikes
5.4 Bulk-decay
5.5 Heavy-Tailed
5.6 Rank-collapse

# 6 Empirical Results: Detailed Analysis on Smaller Models

6.1 Experimental setup
6.2 Baseline results
6.3 Some important implementational details
6.4 Effect of explicit regularization

# 7 Exhibiting the Phases by Varying the Batch Size 46

# 8 Discussion and Conclusion

8.1 Some immediate implications
8.2 Theoretical niceties, or Why RMT makes good sense here
8.3 Other practical implications . 50

# A Appendix

## A.1 More historical perspective

## A.2 Acronyms and notation

## A.3 Additional empirical results . 65

## A.4 Important implementation details
