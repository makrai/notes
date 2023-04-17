An Empirical Study of Example Forgetting during Deep Neural Network Learning
Mariya Toneva, A Sordoni, R Tachet des Combes, A Trischler, Y Bengio, GJ Gordon
ICLR 2019 arXiv:1812.05159 [cs.LG]

* Inspired by the phenomenon of catastrophic forgetting
* we investigate the learning dynamics of neural networks as they train on
  single classification tasks. Our goal is to understand
* whether a related phenomenon occurs when data does not undergo a clear
  distributional shift
  * define a _forgetting event_ to have occurred when
    an individual training example transitions from being classified correctly
    to incorrectly over the course of learning
* several benchmark data sets, we find that:
  * certain examples are forgotten with high frequency, and some not at all;
  * a data set's (un)forgettable examples generalize across neural archits
  * based on forgetting dynamics,
    a significant fraction of examples can be omitted from the training data
    while still maintaining SOTA generalization performance
