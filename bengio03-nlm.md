Yoshua Bengio, Réjean Ducharme, Pascal Vincent, Christian Jauvin
A Neural Probabilistic Language Model
2003

# 1 Intro

* n-gram language model
 * back-off trigram models (Katz, 1987) or in
 * smoothed (or interpolated) trigram models (Jelinek and Mercer, 1980). So, in
* see Goodman (2001) for ... many tricks
* n-grams with n up to 5 (i.e. 4 words of context) have been reported, though,
  ... most predictions are made with a much shorter context
* organization
  1.2 related work on greater context and generalization over words
  2. A more formal presentation [of our model] will follow in Section 2, using
     an implementation of these ideas that relies on shared-parameter
     multi-layer neural networks. Another contribution of this paper concerns
     the challenge of training such very large neural networks (with millions
     of parameters) for very large data sets (with millions or tens of millions
     of examples)
  4. training such large-scale model is expensive but feasible, scales to large
     contexts, and yields good comparative results (Section 4)

# 1.1 Fighting the Curse of Dimensionality with Distributed Representations

* In a nutshell, the idea of the proposed approach can be summarized as
  * associate with each word in the vocabulary a distributed word feature vector
    (a real-valued vector in `R^m`),
  * express the joint probability function of word sequences
    in terms of the feature vectors of these words in the sequence, and
  * learn simultaneously the word feature vectors and
    the parameters of that probability function
* maximize the log-likelihood of the training data or a regularized criterion,
  eg by adding a weight decay penalty [i.e.] Like in ridge regression,
  the squared norm of the parameters is penalized
* feature vectors ... could be initialized using prior knowledge of semantic
  features

# 1.2 Relation to Previous Work

* The idea of using neural networks to model high-dimensional discrete
  distributions (Bengio and Bengio, 2000a,b)
* the (old) idea of learning a distributed representation for symbolic data,
  that was advocated in the early days of connectionism
  (Hinton, 1986, Elman, 1990)
* neural networks for language modeling is
  * not new either (Miikkulainen and Dyer, 1991)
  * character-[level LM based neural] text compression (Schmidhuber, 1996)
  * independently proposed by Xu and Rudnicky (2000), although
    experiments are with networks without hidden units and a single input word,
    which limit the model to essentially capturing unigram and bigram stat[s]
* similarities between words to obtain generalization from training sequences
  * clustering of the words
    (Brown+ 1992, Pereira+ 1993, Niesler+ 1998, Baker and McCallum, 1998)
    * word[s] associated deterministically or probabilistically with [classes],
  * comparisons in this paper include results obtained with class-based n-grams
    (Brown et al., 1992, Ney and Kneser, 1993, Niesler et al., 1998)
* vector-space representation for words has been well exploited
  * information retrieval (for example see work by Schutze, 1993)
  * on the basis of their probability of co-occurring in ... documents
    (Latent Semantic Indexing, see Deerwester et al., 1990)
  * We tried (unsuccessfully) using ... the first principal components of the
    co-occurrence frequencies of w with the words occurring in text around
  * exploited successfully by Bellegarda (1997) in the context of an n-gram
    based statistical language model, using LSI to dynamically identify the
    topic of discourse
* vector-space representation for symbols in the context of neural networks
  * in terms of a parameter sharing layer, (eg Riis and Krogh, 1996) for
    * secondary structure prediction, and for
    * text-to-speech mapping (Jensen and Riis, 2000)

# 2. A Neural Model

* R(θ) is a regularization term
  * in our experiments, R is a weight decay penalty applied only to the weights
    of the neural network and to the C matrix, not to the biases
* number of free parameters only scales linearly with `V` and the order `n`
* The scaling factor could be reduced to sub-linear if more sharing structure
  were introduced, eg using a
    * _time-delay neural network_ or a
    * _recurrent neural network_ (or a combination of both)
* optionally, direct connections from the word features to the output
  * optionally zero (no direct connections)
* ordinary hyperbolic tangent hidden layer
* Mixture of models. In our experiments (see Section 4) we have found improved
  performance by combining [ the neural network with ] an interpolated trigram
  model, either with a simple fixed weight of 0.5, a learned weight (maximum
  likelihood on the validation set) or a set of weights that are conditional on
  the frequency of the context (using the same procedure that combines trigram,
  bigram, and unigram in the interpolated trigram, which is a mixture)

# 3. Parallel Implementation 7

* the amount of computation required for obtaining the output probabilities
  ... require the computation of the probabilities for all the words
* We have explored parallelization on two types of platforms:
  * shared-memory processor machines ... Data-Parallel Processing
    * asynchronous implementation where each processor can write at any time
  * Linux clusters with a fast network ... Parameter-Parallel Processing
    * see 3.2

# 3.2 Parameter-Parallel Processing

* parallelize across the parameters, in particular the parameters of the
  output units, because that is where the vast majority of the computation
  is taking place, in our architecture
* Each CPU is responsible for ... the unnormalized probability for a subset
  of the outputs, and performs the updates for the corresponding output
* The CPUs essentially need to communicate two informations:
  1. the normalization factor of the output softmax, and
  2. the gradients on the hidden layer `a` and word feature layer `x`
* On clusters with a slow network, it might be possible to ... communications
  every K examples (a mini-batch) rather than for each example
  * batch gradient descent is generally much slower than stochastic gradient
    descent (LeCun et al., 1998)

# 4. Experimental Results 11

* Brown corpus and Associated Press (AP)
* different preprocessing
* learning rate

## 4.2 Results

* number of epochs
* weight decay penalty
* direct connections from input to output
  * better generalization can be obtained _without_ the direct input-to-output
    connections, at the cost of longer training
* neural network was able to take advantage of more context (on Brown, going
  from 2 words of context to 4 words brought improvements to the neural
  network, not to the n-grams)

# 5. Extensions and Future Work

## 5.1 An Energy Minimization Network

* A variant of the above neural network can be interpreted as an energy
  minimization model following Hinton’s ... products of experts (Hinton, 2000)
* In the variant described here, the _output_ word is also [a] feature vector
* The network
  * takes in input a sub-sequence of words (mapped to their feature vectors)
  * outputs an energy function E which is
    * low when the words form a likely sub-sequence, high when it is unlikely
* In the products-of-experts framework,
  the hidden units can be seen as the experts
* extensions of the ... Maximum Entropy models (Berger et al., 1996)
  but where the basis functions (or “features”, here the hidden activations)
  are learned by penalized maximum likelihood
  at the same time as the parameters of the features linear combination,
  instead of ... in an outer loop, with greedy feature subset selection methods
* [our experiments]
  * implemented and experimented with the above architecture, and have
  * developed a speed-up technique for the neural network training,
    * based on importance sampling and
    * yielding a 100-fold speed-up (Bengio and Senécal, 2003)
* guess an initial feature vector for [OOV words], by taking
  * a weighted convex combination of the feature vectors of other words that
    could have occurred in the same context,
    with weights proportional to their conditional probability
  * This feature vector C(i) can then be used in the input context part
    when we try to predict the probabilities of words that follow word i

## 5.2 Other Future Work

1. Decomposing the network in sub-networks
  * [eg] using a clustering of the words
  * Training many smaller networks should be easier and faster
2. "hierarchical softmax"
3. Propagating gradients only from a subset of the output words. It could be
   * the words that are conditionally most likely (based on a faster model such
     as a trigram, see Schwenk and Gauvain, 2002, for an application)
   * a subset of the words for which the trigram has been found to perform
     poorly
   * [in] a speech recognizer, ... only the scores (unnormalized probabilities)
     of the acoustically ambiguous words need to be computed
   * See also Bengio and Senécal (2003) for a new accelerated training method
     using importance sampling to select the words
4. Introducing a-priori knowledge. Several forms of such knowledge could be
   * semantic information (eg from WordNet, see Fellbaum, 1998), low-level
   * parts-of-speech), and high-level grammatical information, eg
   * coupling the model to a stochastic grammar, as suggested in Bengio (2002)
   * longer term context could be captured by introducing more structure and
     parameter sharing ..., eg using time-delay or recurrent neural networks
    * see work already done by Schwenk and Gauvain (2002) ... in speech
5. Interpreting (and possibly using) the word feature representation
6. Polysemous words

# Acknowledgments

* The authors would like to thank Léon Bottou, Yann Le Cun and Geoffrey Hinton
