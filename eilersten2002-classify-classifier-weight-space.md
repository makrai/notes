Classifying the classifier: dissecting the weight space of neural networks
Gabriel Eilertsen, Daniel Jönsson, Timo Ropinski, Jonas Unger, Anders Ynnerman
ECAI 2020 arXiv:2002.05688 [cs.CV]

* This paper presents an empirical study on the weights of neural networks,
  * interpret each model as a point in a high-dimensional space --
    the neural weight space. To explore the complex structure of this space,
  * we sample from a diverse selection of training variations (dataset,
    optimization procedure, architecture, etc.) of neural network classifiers,
    and train a large number of models to represent the weight space. Then, we
  * a machine learning approach for analyzing and extracting information from
    this space
  * we train a number of novel deep meta-classifiers with the
    objective of classifying different properties of the training setup by
    identifying their footprints in the weight space.  Thus, the
    meta-classifiers probe for patterns induced by hyper-parameters, so that we
    can quantify how much, where, and when these are encoded through the
    optimization process
* a novel and complementary view for explainable AI, and we show how
  * reveal a great deal of information about the training setup and
    optimization, by only considering a small subset of randomly selected
    consecutive weights. To promote further research on the weight space,
* we release the neural weight space (NWS) dataset -- a collection of
  * 320K weight snapshots from 16K individually trained deep neural networks.
