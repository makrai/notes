Visualisation and 'Diagnostic Classifiers' Reveal
  how Recurrent and Recursive Neural Networks Process Hierarchical Structure
Dieuwke Hupkes, Willem Zuidema
IJCAI 2018

* we define the artificial task of processing nested arithmetic expressions, and
* simple recurrent networks cannot find a generalising solution to this task,
* gated recurrent neural networks perform surprisingly well:
  predict the outcome of the arithmetic expressions with high accuracy, although
  performance deteriorates somewhat with increasing length.
* diagnostic classification: simple neural classifiers are used to test
  sequences of predictions about features of the hidden state representations at
  each time step
* indicate that the networks follow a strategy similar to our hypothesised
  ‘cumulative strategy’, which explains the high accuracy of the network on
  novel expressions, the generalisation to longer expressions than seen in
  training, and the mild deterioration with increasing length
  * We test multiple hypotheses on the information that is encoded and processed
