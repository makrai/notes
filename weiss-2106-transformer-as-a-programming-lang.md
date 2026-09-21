On the Practical Computational Power of Finite Precision RNNs
  for Language Recognition
Gail Weiss, Yoav Goldberg, Eran Yahav
ACL 2018

# Abstract

* Recurrent Neural Networks (RNNs) are famously known to be Turing complete,
  * hE this relies on
    infinite precision in the states and unbounded computation time
* We consider the case of RNNs with
  finite precision whose computation time is linear in the input length.
  * Under these limitations, different RNN variants have different comput power
  * eg LSTM and the Elman-RNN with ReLU activation are strictly stronger
    than the RNN with a squashing activation and the GRU
  * because LSTMs and ReLU-RNNs can easily implement counting behavior. We show
  * empirically: the LSTM does indeed learn
    to effectively use the counting mechanism
