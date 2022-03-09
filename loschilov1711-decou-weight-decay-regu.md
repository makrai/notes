AdamW: Decoupled Weight Decay Regularization
Ilya Loshchilov, Frank Hutter
ICLR 2019 arXiv:1711.05101 [cs.LG]

https://github.com/loshchil/AdamW-and-SGDW

* are L2 regularization and weight decay regularization equivalent
  * yes for standard stoch gradient descent (when rescaled by the learnin rate)
  * not the case for adaptive gradient algorithms, such as Adam, we demonstrate
* common implementations of these algorithms employ L2 regularization
  (often calling it "weight decay" in what may be misleading due to the
  inequivalence we expose),
* we propose a simple modification to
  recover the original formulation of weight decay regularization
  by _decoupling_ the weight decay from the optimization steps taken w.r.t. the
  loss function
* empirical evidence that our proposed modification
  * decouples the optimal choice of weight decay factor
    from the setting of the learning rate for both standard SGD and Adam and
  * substantially improves Adam's generalization performance, allowing it to
    compete with SGD with momentum on image classification datasets (on which
    it was previously typically outperformed by the latter)
* Our proposed decoupled weight decay has already been adopted by much research
  * community has implemented it in TensorFlow and PyTorch; the complete source
    code for our experiments is available at this https URL

# 1 Intro

* Adaptive gradient methods,
  * such as
    * AdaGrad (Duchi+ 2011)
    * RMSProp (Tieleman & Hinton, 2012)
    * Adam (Kingma & Ba, 2014) and most recently
    * AMSGrad (Reddi+ 2018) have become
  * a default method of choice for training feed-forward and recurrent networks
    (Xu+ 2015; Radford+ 2015)
* hE, image classification
  * popular datasets, such as CIFAR-10 and CIFAR-100 Krizhevsky (2009), are
  * SOTA results still obtained by applying SGD with momentum
    (Gastaldi, 2017; Cubuk+ 2018)
  * Wilson+ (2017) suggested that
    adaptive gradient methods do not generalize as well as SGD with momentum
    when tested on a diverse set of deep learning tasks,
    such as image classification, character-level language modeling and cons pr
  * Different hypotheses about the origins of this worse generalization have
    * sharp local minima (Keskar+ 2016; Dinh+ 2017) and
    * inherent problems of adaptive gradient methods (Wilson+ 2017). In this
* we: whether it is better to use L 2 regularization or weight decay regu
  to train deep neural networks with SGD and Adam. We show that
  * a major factor of the poor generalization of the most popular adaptive
    gradient method, Adam, is due to the fact that L 2 regularization is not
    nearly as effective for it as for SGD
* analysis of Adam leads to the following observations:
  * L 2 regularization and weight decay are not identical. The two techniques
    * can be made equivalent for SGD by a reparameterization of the weight
      decay factor based on the learning rate; however, as is often overlooked,
    * not the case for Adam
    * In particular, when combined with adaptive gradients,
      L 2 regularization leads to weights with large historic parameter and/or
      gradient amplitudes
      being regularized less than they would be when using weight decay.
  * L 2 regularization is not effective in Adam
    * One possible explanation why Adam and other adaptive gradient methods
      might be outperformed by SGD with momentum is that
      common deep learning libraries only implement L 2 regularization, not the
      original weight decay
    * Therefore, on tasks/datasets where the use of L 2 regularization is
      beneficial for SGD (e.g., on many popular image classification datasets),
      Adam leads to worse results than SGD with momentum (for which L 2
      regularization behaves as expected).
  * Weight decay is equally effective in both SGD and Adam
    * For SGD, it is equivalent to L 2 regularization, while for Adam it is not
  * Optimal weight decay
    depends on the total number of batch passes/weight updates
    * Our empirical analysis of SGD and Adam suggests that
      the larger the runtime/number of batch passes to be performed,
      the smaller the optimal weight decay.
  * Adam can substantially benefit from a scheduled learning rate multiplier.
    The fact that
    Adam is an adaptive gradient algorithm and as such adapts the learning rate
    for each parameter
    does not rule out the possibility to substantially improve its performance
    by using a global learning rate multiplier, scheduled,
    e.g., by cosine annealing.
* The main contribution of this paper is to
  improve regularization in Adam by decoupling the weight decay
  from the gradient-based update
  * comprehensive analysis, we show that
    Adam generalizes substantially better with decoupled weight decay than with
    L 2 regularization, achieving 15% relative improvement in test error (see
    Figures 2 and 3); this holds
    * true for various image recognition datasets (CIFAR-10 and ImageNet32x32),
      training budgets (ranging from 100 to 1800 epochs), and
      learning rate schedules (fixed, drop-step, and cosine annealing; Fig 1).
  * decoupled weight decay renders the optimal settings of the learning rate
    and the weight decay factor much more independent, thereby
    easing hyperparameter optimization (see Figure 2).
* The main motivation of this paper is to
  improve Adam to make it competitive w.r.t. SGD with momentum
  even for those problems where it did not use to be competitive
  * hope: practitioners do not need to switch between Adam and SGD anymore,
  * reduce the common issue of selecting
    dataset/task-specific training algorithms and their hyperparameters

# 2 Decoupling the weight decay from the gradient-based update

* In the weight decay described by Hanson & Pratt (1988), the weights θ decay
  exponentially as
θ t+1 = (1 − λ)θ t − α∇f t (θ t ),    (1)
  * where λ defines the rate of the weight decay per step and
    ∇f t (θ t ) is the t-th batch gradient to be multiplied by a
    learning rate α. For standard SGD, it is equivalent to standard L 2
    regularization:
