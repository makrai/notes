Predicting Neural Network Accuracy from Weights
T Unterthiner, Daniel Keysers, Sylvain Gelly, Olivier Bousquet, Ilya Tolstikhin

# Comments:

* Updated the Small CNN Zoo dataset:
  * reduced the maximal learning rate and got rid of multiple bad runs
  * Replaced all the experiments with the new numbers
  * Added MLP
  * Fixed typo in the abstract (R2 score instead of Kendall's tau)
  * Added several earlier related works to the literature

# Abstract

* the accuracy of a trained neural network can be predicted surprisingly well
  by looking only at its weights, without evaluating it on input data
  * We motivate this task and introduce a formal setting for it
  * Even when using simple statistics of the weights, the
    predictors are able to rank neural networks by their performance with very
    high accuracy (R2 score more than 0.98). Furthermore, the predictors are
  * can rank networks trained on different, unobserved datasets and with
    different architectures
* We release a collection of 120k convolutional neural networks on 4 datasets
