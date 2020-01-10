Tomas Mikolov, Kai Chen, Greg Corrado, Jeffrey Dean
Google Inc., Mountain View, CA
Efficient estimation of word representations in vector space
International Conference on Learning Representations (2013)

#1 Introduction

#1.2 Previous work

* Representation of words as continuous vectors has a long history [17, 6]

#1.1 Goals of the paper

* vector(”King”) - vector(”Man”) + vector(”Woman”) results in a vector that is
  closest to the vector representation of the word Queen [14].

#2. Model Architectures

* models for estimating continuous representations of words 
  * Latent Semantic Analysis (LSA) and 
  * Latent Dirichlet Allocation (LDA). In 
* neural network architectures ... better than LSA for 
  * preserving linear regularities among words [14]; 
  * computational [cost] on large data sets.

#2.1 Feedforward Neural Net Language Model (NNLM)

* The probabilistic feedforward neural network language model (Bengio+ 03)
* A szónak veszi a feltételes valségét, tehát 
  csak a kontextus szavak helyett van vektor.
* solutions to reduce the number of parameters
  * hierarchical softmax where 
    the vocabulary is represented as a Huffman binary tree
    
#2.2 Recurrent Neural Net Language Model (RNNLM)

* recurrent matrix that connects hidden layer to itself, using 
  time-delayed connections 

#3 New Log-linear Models

#3.1 Continuous Bag-of-Words Model

* the projection layer is shared for all words (not just the projection
  matrix); thus, all words get projected into the same position (their vectors
  are averaged)
* we also use words from the future

#3.2 Continuous Skip-gram Model

* nem teljesen világos, hogy mi a feladat

#5 Examples of the Learned Relationships

* Another way to improve accuracy is to provide more than one example of the
  relationship
* selecting out-of-the-list words... -- nem értem

#6 Conclusion

* In the future, it would be interesting to 
  compare our techniques to Latent Relational Analysis [19]

# References

* [19] T. Mikolov. Statistical Language Models based on Neural Networks.
* PhD thesis, Brno Univer-
