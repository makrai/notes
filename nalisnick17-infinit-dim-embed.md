Eric T. Nalisnick, Sachin Ravi
Learning the Dimensionality of Word Embeddings
egy korábbi, részben bővebb változat megjelent a 2016-os ICLR-en
_Infinite dimensional word embeddings_ címen
Az új címen csak egy változat van

https://github.com/enalisnick/infiniteWordEmbeddings

#Abstract

* Our [models]
  * Stochastic Dimensionality Skip-Gram (SD-SG) and
  * Stochastic Dimensionality Continuous Bag-of-Words (SD-CBOW) are
  * nonparametric analogs of ... ‘word2vec’ models. Vector dimensionality is
  * employing techniques used by Côté & Larochelle (2016) to define
    an RBM with an infinite number of hidden units
* We show qualitatively and quantitatively that the SD-SG and SD-CBOW are
  competitive with their fixed-dimension counterparts while
  providing a distribution over embedding dimensionalities, which offers a
  window into how semantics distribute across dimensions

#1 Introduction

* One flaw [of embeddings] is that the vectors, since their dimensionality is
  fixed across the vocabulary, do not accurately reflect each word’s semantic
  complexity. For instance, the meaning of the word _race_ varies with context
  (ex: car race vs biological race), but the meaning of _regatta_ is rather
  specific and invariant
* we describe
  * Infinite Skip-Gram (iSG)
  * log-bilinear energy-based model
    * the same mathematical tools that allow the definition of an
      Infinite Restricted Boltzmann Machine (Cˆot ́e & Larochelle, 2015)
  * defines a joint distribution over a word vector, a context vector, and
    their dimensionality,
  * captures specificity, polysemy, and homonymy
    without explicit definition of such concepts within the model

#2 Fixed Dimension Word Embeddings

* negative sampling
  * Mikolov+ (2013), which
    * incorporates logistic regression to discriminate the true context word
      from the samples
  * Huang+ (2013) have
    * used the negative samples directly in the normalizing sum, as we do

#3 Infinite skip-gram p13

* params
  * `a`
    * necessary for defining a convergent geometric series and
    * controls the model’s growing behavior

##3.1 A Finite partition function

* two key properties
  * first proposed by Côté & Larochelle (2015)
  * to define a Restricted Boltzmann Machine
    * with an infinite number of hidden units (iRBM)
    * Sparsity penalty: The L2 penalty incorporated ..
      * all w and c vectors are initialized to have a finite number of non-zero
        elements
  * Per-dimension constant penalty

##3.2 Learning

* − log p(c_k |w_i) /le E_{z|w} − log p(c_k |w_i , z)
* z ˆ ∼ p(z|w) for learning
* if a z ˆ value greater than the current value of l is sampled,
  * we set z ˆ = l + 1,
* p(c k |w i , z ˆ m) can be computed with negative sampling
  * marginalize only over the context words in the current window

##3.3 Prediction, similarities, and disambiguation

* predicting context words,
  * where l is the max dimension expanded to during learning
* similarities
  * no cosine similarity
    * Vector length encodes semantics (correlating with word specificity), and
      angular distance destroys this information. The expected inner product is
      a better choice
  * asymmetric version
  * taking the inner product between input and context vectors (w i T c j)
    yields qualitatively similar results
* inferring word `w_i` ’s senses
  * distribution over dimensionalities: `p(z|w_i)`
  * we can isolate one of these modes by
    * summing over a subset of the vocabulary
      * that places probability on the same or nearby dimensions
    * This is essentially what is done during training by
      * summing over the current context only when computing p(z|w i)
    * modulating similarities scores
      * computing p(z|w = ‘net’) by summing over selected sports-related words
        and using the approximate distribution in sim iSG i, retrieves football
        as net’s nearest neighbor. Yet, when technology-related words are
        summed over, www is the nearest neighbor

#4 Related work

* parameter-expanded embeddings without explicit linguistic motivations
  * Vilnis & McCallum (2014)
    * represent each word with a multivariate Gaussian distribution
      * mean parameter serves much like a traditional vector representation
      * covariance parameter’s ability to elegantly capture word specificity
        * specific words have small covariances, vague words have large
  * tensors to incorporate meta-data into the embedding (Kiros+ 2014)
  * Pennington+ (2014)
* polysemy and homonymy
  * two categories:
    * number of word senses are learned a priori to vectors
      * Huang+ (2012) and Reisinger & Mooney (2010)
        * cluster all observed context windows
      * Chen+ (2014)
        * leverage WordNet to learn senses
        * after training a traditional Skip-Gram model
    * senses and vectors are learned jointly
      * Neelakantan+ (2015),
        * estimate an input word’s cluster membership 
          from the current value of the context representations
        * also describe a nonparametric variant (NP-MSSG) that
          * creates a new cluster if an observed context is sufficiently
            different from existing clusters
      * Tian+ (2014), and
        * Word sense is defined as a latent variable indexing a fixed number of
          independent vector representations for a given word
        * Expectation-Maximization (EM) is used for learning
      * Bartunov+ (2015)’s AdaGram model
        * an infinite dimensional extension of Tian+ (2014)
        * uses the Dirichlet Process from Bayesian Nonparametrics to define an
          infinite number of vectors for each word
* Our iSG ... differentiates itself from previous work in the following ways
  * The latent variable models mentioned learn multiple independent vectors of
    fixed dimensionality, enabling a costly replication of the full vocabulary
    embedding matrix

#5 Evaluation

[old version of the paper]

##5.1 Qualitative results

* one billion word subset of Wikipedia (6/29/08 snapshot)
* Three SG models with dimensionalities 100, 300, and 500 were trained
* Nine iSG models were trained using
  * combinations of
    * a = {1.1, 1.075, 1.05} and
    * λ = {1 × 10 −4 , 1 × 10 −6 , 1 × 10 −8 },
  * each taking approximately
    * twelve hours on a c3.8XL Amazon EC2 instance using thirty threads
* The same
  * learning rate (α = 0.05),
  * decay schedule for α (Word2Vec default),
  * number of negative samples (5),
  * context window size (10), and
  * number of training epochs (1) were used for SG and iSG
* iSG dimensions:
  * initialized to two, produced ... lengths ranging from 275 to 536
* We attempted to use AdaGrad, but ... it made vectors grow to extreme lengths

###5.1.1 Nearest neighbors

* iSG columns: which part of the vocab is used for marginalization
  * to compute the expected inner product
  * 1: full
  * 2,3: to surface different senses of each word
* mondja ő:
  * SG only captures one meaning in its representation. Conversely, iSG was
    able to capture various meanings,

###5.1.2 Modes of meaning

##5.2 Experiment: context prediction

[new version of the paper]

##Quantitative Evaluation. 

* We test each model’s ability to rank word pairs according to ...  similarity
  * WordSim353 (Finkelstein+ 2001) and MEN (Bruni+ 2014). As is
* SD-SG and SDCBOW perform better than their 50 dimensional counterparts but
  worse than their 200 dimensional counterparts. 
  All scores are ... separated by no more than 0.1.

##Qualitative Evaluation. 

* distributions over vector dimensionalities. Subfigure (b) of Figure 1 shows
  * the distribution is long-tailed, and vague words occupy the tail while
  * e.g. _photon_ has an expected dimensionality of 19 while the homograph 
    _race_ has 150. Note that 
  * expected dimensionality correlates with word frequency ... but does not
    follow it strictly. For instance, the word _william_
* we plot the quantity p(z|w) for two homographs, race (c) and player (d), as
  * the distribution does indeed have at least two modes: 
  * [semantic field] determined by computing nearest neighbors 
    with that dimension as a cutoff
    1. at around 70 dimensions represents car racing, as 
    2. at around 100 dimensions encodes the anthropological meaning
