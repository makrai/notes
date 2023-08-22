The Break-Even Point on Optimization Trajectories of Deep Neural Networks
Stanislaw Jastrzebski, M Szymczak, S Fort, D Arpit, J Tabor, K Cho, K Geras
a spotlight at ICLR 2020 arXiv:2002.09572 [cs.LG]

# Abstract

* The early phase of training of deep neural networks is critical for their
  * we study how the hyperparameters of stochastic gradient descent (SGD) used
    in the early phase of training affect the rest of the optimization traject
* there is a "break-even" point on this trajectory,
  beyond which the curvature of the loss surface and noise in the gradient are
  implicitly regularized by SGD
* we demonstrate on multiple classification tasks that
  using a large learning rate in the initial phase of training
  * reduces the variance of the gradient, and
  * improves the conditioning of the covariance of gradients
* These effects are beneficial from the optimization perspective and
  become visible after the break-even point
  * using a low learning rate results in bad conditioning of the loss surface
    even for a neural network with batch normalization layers
    * we Complement prior work
* ie key properties of the loss surface are
  strongly influenced by SGD in the early phase of training
* future: studying the impact of the identified effects on generalization
