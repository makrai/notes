Tomas Mikolov, Ilya Sutskever, Kai Chen, Greg Corrado, and Jeffrey Dean
Google Inc.
NIPS 2013
Distributed Representations of Words and Phrases and their Compositionality

# Abstract

* The recently introduced continuous Skip-gram model
* In this paper we present several extensions
  1. subsampling of the frequent words
  2.  _negative sampling_
    * a simple alternative to the hierarchical softmax
  3. phrases
    * finding phrases
    * vector representations for millions of _phrases_

# 1 Introduction

* earl[y] use of word representations dates back to Rumelhart+ (1986) 
* applied to 
  * statistical language modeling with ... success (Bengio+ 03) . The
  * automatic speech recognition and machine translation [14, 7], and 
  * a wide range of NLP tasks [2, 20, 15, 3, 18, 19, 9].
* Unlike most of the previously used neural network ...  word vectors, training
  of the Skipgram model ... does not involve dense matrix multiplications
1. subsampling of frequent words
  * speedup
  * improves accuracy of the representations of less frequent words
2. a simplified variant of Noise Contrastive Estimation (NCE) [4]
  * faster training and better vector representations for frequent words
3. idiomatic
  * a test set of analogical reasoning tasks that contains 
    both words and phrases
  * vec(“Russia”) + vec(“river”) is close to vec(“Volga River”), and
  * vec(“Germany”) + vec(“capital”) is close to vec(“Berlin”).

# 2 The Skip-gram Model

## 2.1 Hierarchical Softmax

* a binary tree representation of the output layer with the 
  W words as its leaves and, 
  for each node, explicitly represents the relative probabilities of its child
  nodes. 
  These define a random walk that assigns probabilities to words
* one representation vw for each word w and one representation vn′ for every
  inner node n of the binary tree
* we use a binary Huffman tree

## 2.2 Negative Sampling

* Noise Contrastive Estimation (NCE), which was 
  * introduced by Gutmann and Hyvarinen [4] and 
  * applied to language modeling by Mnih and Teh [11]
* similar to hinge loss used by Collobert and Weston [2]
  * A unified architecture for natural language processing 2008
* noise distribution
  * unigram distribution U(w) raised to the 3/4rd power

## 2.3 Subsampling of Frequent Words

* the most frequent words ... usually provide less information
* each word w_i in the training set is discarded with probability ...

# 3 Empirical Results

* az utolsó bekezdésben a linearitásról

# 4 Learning Phrases

4.1 Phrase Skip-Gram Results

# 5 Additive Compositionality 

# 6 Comparison to Published Word Representations

# 7 Conclusion

* The choice of ... the hyper-parameter selection is a task specific decision
* most crucial decisions that affect the performance are the choice of 
  * the model architecture, 
  * the size of the vectors, 
  * the subsampling rate, and 
    * nem találtam semmi érdemit
  * the size of the training window 
