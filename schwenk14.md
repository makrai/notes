Holger Schwenk, Fethi Bougares, Loïc Barrault
Efficient Training Strategies for Deep Neural Network Language Models
NIPS workshop on Deep Learning and Representation Learning 2014

# 1 Introduction

* optimal training can have an important impact on the performance,
  * [3] Yoshua Bengio
    Practical recommendations for gradient-based training of deep architectures
    In Neural Networks: Tricks of the Trade, Second Edition.  Springer, 2012
  * [12] Yann LeCun, L ́eon Bouttou, Genevi`eve B. Orr, and Klaus-Robert Muller
    Efficient backprop
    In Neural Networks: Tricks of the trade.  Springer, 1998

# 2 Continuous space language models

* Usually one tanh hidden
* In this paper, we will investigate much deeper architectures
* Training is performed with standard back-prop minimizing a cross-entropy
  error and a weight decay regularizer
* [high] complexity ... because of the high dimension of the output layer
* the complexity only slightly increases for longer context windows
* LSTM were also used for language modeling, e.g. [26]
  * [26] Martin Sundermeyer, Ralf Schl ̈uter, and Hermann Ney. LSTM neural
    networks for language modeling. In Interspeech, 2012
* From our point of view, it is still an open question whether these recurrent
  architectures outperform feed-forward networks
* we investigate [only] feed-forward architectures
