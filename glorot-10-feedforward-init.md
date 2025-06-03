Understanding the difficulty of training deep feedforward neural networks
Xavier Glorot and Yoshua Bengio

# Abstract

* before 2006, deep multilayer neural networks were not successfully trained,
  since then several algorithms have been shown to successfully train them, with
  * superiority of deeper vs less deep architectures
  * All these results obtained with new initialization or training mechanisms
* we: why standard gradient descent from random initialization is so poor
  * influence of the non-linear activations functions. We find that
  * the logistic sigmoid activation is unsuited for deep networks with random
    initialization because of its mean value, which
    can drive especially the top hidden layer into saturation.  Surprisingly, we
    find that saturated units can move out of saturation by themselves, albeit
    slowly, and explaining the plateaus sometimes seen when training neural
  * how activations and gradients vary across layers and during training, with
    * training may be more difficult when the singular values of the Jacobian
      associated with each layer are far from 1. Based on these considerations,
  * new initialization scheme that brings substantially faster convergence
