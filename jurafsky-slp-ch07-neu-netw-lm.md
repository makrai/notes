Speech and Language Processing. Daniel Jurafsky & James H. Martin
Draft of December 29, 2021

# 7 Neural Networks and Neural Language Models

* called neural because their origins lie in
  * the McCulloch-Pitts neuron (McCulloch and Pitts, 1943),
    * a simplified model of the human neuron as a kind of computing element that
      could be described in terms of propositional logic
  * modern use in NLP no longer draws on these early biological inspirations
* a network of small computing units, each of which takes a vector of input
  values and produces a single output value
* In this chapter we introduce the neural net applied to classification. The
  * feedforward network because the computation proceeds iteratively from one
    layer of units to the next. The use of modern neural nets is often called
  * deep learning, because modern networks are often deep (have many layers)
* much of the same mathematics as logistic regression. But neural networks are a
  more powerful classifier than logistic regression, and indeed
  * a minimal neural network (technically one with a single ‘hidden layer’) can
    be shown to learn any function
* feature learning
  * logistic regression, we applied the regression classifier to many different
    tasks by developing many rich kinds of feature templates based on domain
  * with neural networks, it is more common to avoid most uses of rich hand-
    derived features, instead building neural networks that
  * take raw words as inputs and learn to induce features as part of the process
  * We saw examples of this kind of representation learning for embeddings in 6
  * very deep nets are particularly good at representation learning. For that
    * the right tool for large scale problems that offer sufficient data to
* In this chapter we’ll introduce
  * feedforward networks as classifiers, and also
  * apply them to the simple task of language modeling: assigning probabilities
* subsequent chapters we’ll introduce many other aspects of neural models, such
  9. recurrent neural networks and the Transformer (Chapter 9),
  11. contextual embeddings like BERT (Chapter 11), and
  10. encoder-decoder models and attention (Chapter 10)
