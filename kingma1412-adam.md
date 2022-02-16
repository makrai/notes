Adam: A Method for Stochastic Optimization
Diederik P. Kingma, Jimmy Ba
ICLR 2015 arXiv:1412.6980 [cs.LG]

* We introduce Adam, an algorithm for
  firstorder gradient-based optimization of stochastic objective functions,
  based on adaptive estimates of lowerorder moments. The method is
  straightforward to implement, is computationally efficient, has little memory
  requirements, is invariant to diagonal rescaling of the gradients, and is
  well suited for problems that are large in terms of data and/or parameters
* appropriate for nonstationary objectives and problems with very noisy
  and/or sparse gradients
* hyperparameters have intuitive interpretations and typically require
  little tuning
* connections to related algorithms, on which Adam was inspired, are discussed
* We also analyze the theoretical convergence properties of the algorithm and
  provide a regret bound on the convergence rate that is
  comparable to the best known results under the online convex optimization
  framework
* Empirical results demonstrate that Adam works well in practice and
  compares favorably to other stochastic optimization methods
* AdaMax, a variant of Adam based on the infinity norm

# 1 Intro

* Stochastic gradientbased optimization is of core practical importance in
  * optimization of some scalar parameter ized objective function requiring
  * If the function is differentiable w.r.t. its parameters, gradient descent
    * efficient, since the computation of first-order partial derivatives
      w.r.t. all the parameters is of the same computational complexity as just
      evaluating the function
  * Often, objective functions are stochastic.  For example, many objective
    * a sum of subfunctions evaluated at different subsamples of data; in this
    * optimization can be made more efficient by taking gradient steps w.r.t
      individual subfunctions, i.e. stochastic gradient descent (SGD) or ascent
    * SGD is efficient and effective optimization method that was
      * central in many machine learning success stories, such as recent
        advances in learning (Deng+ 2013; Krizhevsky+ 2012; Hinton &
        Salakhutdinov, 2006; Hinton+ 2012a; Graves+ 2013)
  * other sources of noise than data subsampling,
    such as dropout (Hinton+ 2012b) regularization. For all such noisy
  => efficient stochastic optimization techniques are required. The focus of
* this paper: optimization of
  stochastic objectives with high-dimensional parameters spaces. In these
  * higher-order optimization methods are ill-suited, and discussion in this
  * we restricted to first-order methods.  We propose
* Adam, a method for efficient stochastic optimization that
  * only requires first-order gradients with little memory requirement. The
  * computes individual adaptive learning rates for different parameters
    from estimates of first and second moments of the gradients;
  * the name Adam is derived from adaptive moment estimation. Our method is
  * designed to combine the advantages of two recently popular methods:
    * AdaGrad (Duchi+ 2011), which works well with sparse gradients, and
    * RMSProp (Tieleman & Hinton, 2012), which
      works well in online and non-stationary settings
    * important connections to these and other stochastic optimization methods
      are clarified in section 5. Some of Adam’s
  * advantages are that
    * the magnitudes of parameter updates are
      invariant to rescaling of the gradient,
    * its stepsizes are approximately bounded by the stepsize hyperparameter,
    * it does not require a stationary objective,
    * it works with sparse gradients,
    * and it naturally performs a form of step size annealing
* Overall, we show that Adam is a versatile algorithm that scales to
  large-scale high-dimensional machine learning problems

# 2 the algorithm and the properties of its update rule. Section 3 explains our

* the hyper-parameters β 1 , β 2 ∈ [0, 1) control the exponential decay rates
  of these moving averages.

# 3 initialization bias correction technique, and section 4 provides a

# 4 theoretical analysis of Adam’s convergence in online convex programming.

# 5 Related work: RMSProp, AdaGrad

## AdaGrad

* AdaGrad corresponds to a infinitesimally close to \beta 1 = 0, infinitesimal
  (1-\beta_2), and a replacement of \alpha with an annealed version

# 6 Empirically, our method consistently outperforms other methods for a
variety of models and datasets, as shown in section 6
