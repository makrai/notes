Michael Ringgaard, Rahul Gupta, Fernando C. N. Pereira
SLING: A framework for frame semantic parsing
arXiv:1710.07032 [cs.CL]

# Abstract

* transition-based, neural-network parsing with
  * bidirectional LSTM input encoding and a
  * Transition Based Recurrent Unit (TBRU) for output decoding
  * trained end-to-end using only the text tokens as input
    * transition system has been designed to output frame graphs directly
      without any intervening symbolic representation
  * efficient and scalable frame store implementation as well as a
  * neural network JIT compiler for fast inference during parsing

# 1 Intro

* Transition-based parsing is
  * often associated with dependency parsing, but
  * [here] a specialized transition system that outputs frame graphs
* We use a recurrent feed-forward unit for predicting the actions
  * hidden activations from predicting each transition step are fed back
  * biLSTM encodes the input into a sequence of vectors (Figure 1)
  * implemented using DRAGNN (Kong+ 2017) and TensorFlow (Abadi+ 2016)
* organization
  2. frame semantics, the linguistic theory that inspired SLING, as well as
    * SLING frame store, a C++ framework for representing and storing sem fs
  4. frame-semantics-oriented attention mechanism
  5. transition system used for producing frame graphs
  6. features used by the parser
  7. and 8. experiments on OntoNotes
  9. fast parser runtime
