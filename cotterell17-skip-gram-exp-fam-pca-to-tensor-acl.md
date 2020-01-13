Ryan Cotterell, Adam Poliak, Benjamin Van Durme, Jason Eisner
Explaining and Generalizing Skip-Gram through Exponential Family PCA
ACL 2017

The code ... is available at https://github.com/azpoliak/skip-gram-tensor

# Abstract

* [We] generalize the skip-gram model to tensor factorization
* lets us train embeddings through richer higher-order coocurrences, e.g.,
  triples that include positional information (to incorporate syntax) or
  morphological information (to share parameters across related words)
* We experiment on 40 languages

# 1 Introduction

* we embed n-tuples rather than pairs, ... to escape the bag-of-words
* we [interpret] the skip-gram model (Mikolov+ 2013)
  * as an application of exponential-family PCA (EPCA) (Collins+ 2001) to an
    integer matrix of coocurrence counts
  * skipgram with NS is the factorization of a (shifted) PPMI mx (Levy& 2014b)
    * We show the skip-gram objective is just EPCA factorization
* By extending EPCA factorization from matrices to tensors, we can consider
  * positional and morphological content in the model by factorizing a
    positional tensor and morphology tensor

# 2 Matrix Factorization: how skip-gram is an example of EPCA

* the optimal values of C and W [in PCA] can be regarded as the max-likelihood
  parameter estimates for the Gaussian graphical model drawn in Figure 1a
  * Roweis (1997) and Tipping and Bishop (1999) observed
  * the observed column vector `x_j` equals `C ^T x_w` plus Gaussian noise,
    specifically `x_j ∼ N(C ^T x_w, I)`
  * Equation (2) is this model’s negated log-likelihood (plus a constant). 3
* [footnote:] `c_i` and `w_j` vectors are themselves drawn from some prior
  * Specifying this prior defines a MAP estimate of C and W
  * If [the prior is] a spherical Gaussian with mean 0 ∈ R d,
    the MAP estimate corresponds to minimizing (2) plus an `L_2` regularizer,
    that is, a multiple of `||C||_F^2 + ||W ||_F^2`
  * We do indeed regularize in this way [tuning the multiplier on a] dev set
  * However, regularization has only minor effects with large training corpora,
    and is not in the original word2vec implementation of skip-gram
* counts ... are always non-negative integers, so
  it is peculiar to model `x_j` as ... drawn from a Gaussian (Hofmann 1999)
* EPCA is a generalization of PCA, in which the observation `x_j` can be drawn
  according to any exponential-family distribution (log-linear distribution)
  * [supposes] that each `x_j` was drawn from a multinomial, more appropriate
* skip-gram is precisely multinomial EPCA
  with the canonical link function (Mohamed, 2011), which
  generates `x_j`k from a multinomial with log-linear parameterization

## 2.1 Related work

* Levy and Goldberg (2014b) ... argued that skipgram estimation _by negative
  sampling_ implicitly factorizes a shifted matrix of positive empirical PMI
  * We instead regard the skip-gram objective itself as [EPCA] factorization
* pLSI (Hofmann, 1999) similarly factors an unknown matrix of multinomial probs
  * which is multinomial EPCA with the identity link function
  * our unknown matrix holds ... shifted log-probabilities, not probabilities
* EPCA interpretation applies equally well to ... hierarchical softmax (Morin&)
* avenues of future research using
  Bayesian (Mohamed+ 2008) and maximum-margin (Srebro+ 2004) extensions to EPCA

# 3 Tensor Factorization

* We focus on the polyadic decomposition (Hitchcock, 1927)
* [Now], the new matrix `R ∈ R^{d×n_3}` embeds types of context--word relations
* The tensor X can be regarded as a collection of
  which context words i are related to word j by relation k
* third-order EPCA
  * each fiber of X is viewed as being generated from a Gaussian all at once
  * Our higher-order skip-gram (HOSG) replaces this Gaussian with a multinomial
* Note that ... our embedding matrices
  * must predict which words are related to word j by relation k
  * not probabilistically modeling how often word j participates in relation k
    in the first place (nor how often word j occurs overall)
  * future would be to extend the generative model to predict these facts also
    * this weakens the pedagogical connection to EPCA
* We locally optimize the [embeddings] through stochastic gradient ascent
  [with] negative sampling
* HOSG is a bit slower to train than skip-gram, since X yields up to `n^3`
  times as many summands as X (but `<< n^3` in practice, as X is often sparse)

# 4 Two Tensors for Word Embedding

* first version increases the number of parameters (giving more expressivity)
* second version decreases the number of parameters (giving better smoothing)

## 4.1 Positional Tensor

## 4.2 Compositional Morphology Tensor

* We decompose each [focus] word into a lemma j and a morphological tag k
  * contexts i are still full words
  * If one wanted to extend the model to decompose the context words i as well,
    we see at least four approaches
* Our model is ... a version of [skipgram] that parameterizes the embedding of
  the word _ran_ as a Hadamard product [of] RUN and `t`
  * similar to the work of Cotterell+ (2016),
    who parameterized word embeddings as a sum w j + r k

# 5 Experiments

## 5.1 Experiment 1: Positional Tensor

## 5.2 Experiment 2: Morphology Tensor

* We expect ... lemma embeddings to be predictive of human judgments of lemma
  similarity
* We evaluate using standard datasets on ... French, Italian, German and en
* Note we did not compare to a baseline that simply embeds lemmas rather than
  words (equivalent to fixing r k = 1)

# 6 Related Work

* tensor
  * Similarly [to Van de Cruys+ (2013),] Hashimoto and Tsuruoka (2015) use an
    implicit tensor factorization method to learn embeddings
    for transitive verb phrases
  * in semantic-based NLP tasks
    * Lei+ (2015) explicitly factorize a tensor based on feature vectors for
      predicting semantic roles
    * Chang+ (2014) use tensor factorization to create knowledge base
      embeddings optimized for relation extraction
    * See Bouchard+ (2015) for a large bibliography
* Yatbaz+ (2012) incorporates morphological and orthographic features into vecs
* Cotterell and Schütze (2015) consider a multi-task set-up to force
  morphological information into embeddings
* Cotterell and Schütze (2017) jointly morphologically segment and embed words
* Levy and Goldberg (2014a) derive contexts based on dependency relations
* PPDB (Ganitkevitch+ 2013) employs
  a mixed bag of words, parts of speech, and syntax
* Rastogi+ (2015) represent
  word contexts, morphology, semantic frame relations,
  syntactic dependency relations, and multilingual bitext counts
  each as separate matrices, combined via GCCA
* Schwartz+ (2016) derived embeddings based on Hearst patterns (Hearst, 1992)
* Ling+ (2015) learn position-specific word embeddings (§4.1)
  * not factor them as `w_j \odot r_k` to share parameters
  * (we did not compare empirically to this)
* Poliak+ (2017) also create positional word embeddings
* Our research direction is orthogonal to these efforts in that we provide a
  general purpose procedure for all sorts of higher-order coocurrence

# 7 Conclusion
