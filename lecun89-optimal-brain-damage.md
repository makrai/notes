Optimal Brain Damage
Yann Le Cun, John S. Denker and Sara A. Sol1a

#ABSTRACT

We have used information-theoretic ideas to derive a class of practical and
nearly optimal schemes for adapting the size of a neural network. By removing
unimportant weights from a network, several improvements can be expected:
better generalization, fewer training examples required, and improved speed of
learning and/or classification. The basic idea is to use second-derivative
information to make a tradeoff between network complexity and training set
error. Experiments confirm the usefulness of the methods on a real-world
application.

#

* several network minimization schemes have been implemented using
  * non-proportional weight decay (Rumelhart, 1988; Chauvin, 1989; Hanson and
  Pratt, 1989), or 
  * "gating coefficients" (Mozer and Smolensky, 1989).
* this paper is to move beyond the approximation that "magnitude equals
  saliency" , and propose a theoretically justified saliency measure.  599600
  Le Cun, Denker and Solla Our technique uses the second derivative of the
  objective function with respect to the parameters to compute the saliencies.
