MuFuRU: The Multi-Function Recurrent Unit
arXiv:1606.03002v1 [cs.NE] 9 Jun 2016
Dirk Weissenborn, Tim Rocktäschel

# Abstract

* Our experiments demonstrate that the additional functionality helps in
  different sequence modeling tasks, including the evaluation of propositional
  logic formulae, language modeling and sentiment analysis

# Intro

* Recurrent neural networks (RNNs)
  * Impressive results were achieved for tasks that involve text, such as
    * language modeling [12], machine translation [17], sentiment analysis [18],
      document-level question answering [7] or recognizing textual entailm [14]
  * additional functionality like attention [1] or external memory [5, 16]
* Though different extensions and variations to GRUs and LSTMs [6, 9],
  none of them outperform standard GRUs or LSTMs significantly
* organization
  * existing commonly-used RNN architectures and
    the Multiple-Function RecurrentUnit (Sections 2 and 3),
  * we demonstrate that MuFuRUs can learn logical expressions
  * we show that MuFuRU outperforms a standard GRU baseline
    on language modeling and sentiment analysis (Sections 4.2 and 4.3) where it
    approaches SOTA results without hyper-parameter tuning
