On The Power of Curriculum Learning in Training Deep Networks
Guy Hacohen, Daphna Weinshall
ICML 2019 arXiv:1904.03626 [cs.LG]

* specifically CNNs trained for image recognition. To employ curriculum
* 2 problems:
  1. sort the training examples by difficulty;
  2. compute a series of mini-batches that exhibit an increasing level of diffic
* We address challenge
  1. two methods:
    * transfer learning from some competitive "teacher" network, and
    * bootstrapping. In our
    * empirical evaluation, both methods show similar benefits
      in terms of increased learning speed and improved final performance on
  2. by investigating different pacing functions to guide the sampling. The
    * empirical investigation variety of network architectures,
      using images from CIFAR-10, CIFAR-100 and subsets of ImageNet. We
* a novel theoretical analysis of curriculum learning, where we show
  * it effectively modifies the optimization landscape
  * we define the concept of an ideal curriculum, and show that
    * it does not change the corresponding global minimum of the optim funct,
      under mild conditions
