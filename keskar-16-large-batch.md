On Large-Batch Training for Deep Learning: Generalization Gap and Sharp Minima
Nitish Shirish Keskar, Dheevatsa Mudigere, Jorge Nocedal, Mikhail Smelyanskiy, Ping Tak Peter Tang
ICLR 2017 conference homepage

TL;DR: We present numerical evidence for the argument that if deep networks are
trained using large (mini-)batches, they converge to sharp minimizers, and
these minimizers have poor generalization properties

# Abstract

* The stochastic gradient descent (SGD) method and its variants are algorithms
  * operate in a small-batch regime wherein a fraction of the training data,
    say 32--512 data points, is sampled to compute an approximation to the
    gradient
* It has been observed in practice that
  when using a larger batch there is a degradation in the quality of the model,
  as measured by its ability to generalize
* We investigate the cause for this generalization drop in the large-batch
  regime and present
  * numerical evidence that supports the view that large-batch methods tend to
    converge to sharp minimizers of the training and testing functions---and as
    * sharp minima lead to poorer generalization
  * In contrast, small-batch methods consistently converge to flat minimizers,
    and our experiments support a commonly held view that
    this is due to the inherent noise in the gradient estimation
* We  discuss several strategies to attempt to help large-batch methods
  eliminate this generalization gap
