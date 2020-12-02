Felix Hill, Anna Korhonen, Kyunghyun Cho, Yoshua Bengio
Learning to Understand Phrases by Embedding the Dictionary
2016 arxiv

# ASSOC

* lstm pling real?

# Abstract

* using the definitions found in everyday dictionaries
* recurrent neural network
* applications
  * reverse dictionary
  * general-knowledge (crossword) question answerer

# 1 Introduction

* (a tall, long-necked, spotted ruminant of Africa)
* model
  * a recurrent neural network (RNN, Schmidhuber, 1989) with
    long-short-term memory (LSTM, Hochreiter and Schmidhuber, 1997)
  * Prior to training the RNN, [target lexical representations by] Word2Vec
* applications
  * reverse dictionary or concept finder (Zock and Bilac, 2004)
    * commercial systems,
  * recent work on multilingual embedding spaces (Gouws+ 2014),
  * general-knowledge crossword question answerer trained on both
    * dictionary definitions and
    * the opening sentences of Wikipedia articles,
    * customized commercial crossword solving tools,
* all of our code, training and evaluation sets + system demo published

# 2 Model Architecture

* RNN
  * achieved SOTA performance in
    * language modelling (Mikolov+ 2010)
    * image caption generation (Kiros+ 2014),
  * approach SOTA performance in
    * machine translation (Bahdanau+ 2015)
  * célszó fix word2vec, forrásszó tanulva

## 2.1 Long Short Term Memory

* A known limitation when training RNNs to read language using grad descent: 
  the error signal (gradient) on the training examples either vanishes or
  explodes as the number of time steps (sentence length) increases

## 2.2 Implementation Details

# 3 Reverse Dictionaries

# 4 General Knowledge (crossword) Question Answering

* outperforming commercial systems on questions containing more than four words

# 5 Conclustion

* future work
  * question-like language,
  * richer world knowledge
    * integration of an external memory module
      * promising approaches proposed in several recent papers on certain QA 
    * entailment tasks
      * Graves+ 2014;
         Alex Graves, Greg Wayne, and Ivo Danihelka
         Neural turing machines. arXiv preprint
         2014.  arXiv:1410.5401
      * Weston+ 2015
         Jason Weston, Antoine Bordes, Sumit Chopra, and Tomas Mikolov. 
         Towards AI-complete question answering: A set of prerequisite toy tasks
         2015.  In arXiv preprint arXiv:1502.05698
