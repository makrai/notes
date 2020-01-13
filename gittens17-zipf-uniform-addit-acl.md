Skip-Gram – Zipf + Uniform = Vector Additivity
Alex Gittens, Dimitris Achlioptas, Michael W. Mahoney
2017 ACL

* interpretation by [Abigail See](http://www.abigailsee.com/2017/08/30/four-deep-learning-trends-from-acl-2017-part-1.html)
  * skip-gram model have additive structure [if] the words are uniformly
    distributed

# Abstract

* theoretical justification for ... additive compositionality in ... Skip-Gram
* connection between the Skip-Gram model and the
  Sufficient Dimensionality Reduction (SDR) framework of Globerson and Tishby:
  * symbol frequencies

# 1 Intro

* history
  * co-occurrences are reweighed to
    * suppress the effect of more frequent words (Rohde et al., 2006) and/or to
    * emphasize pairs of words whose co-occurrence frequency maximally deviates
      from the independence assumption (Church and Hanks, 1990)
  * Mikolov+ main departure from Bengio+ (2003) was to follow the 
    * suggestion of Mnih and Hinton, (2007) and tradeaway the expressive
    * scalability ... afforded by ... log-linear models.
* mathematically-flavored explanations (Paperno and Baroni, 2016)), the only
* rigorous theoretical understanding of this phenomenon is (
  * Arora et al., (2016)
    * factorizing the so-called PMI matrix, and that algebraic operations on
    * can be used to solve analogies, 
    * conditions on the process that generated the training corpus.
* we
  * Sufficient Dimensionality Reduction model of (Globerson and Tishby, 2003)
  * word vectors learned by Skip-Gram are information-theoretically optimal.
  * the context word c in the Skip-Gram model essentially serves the role that
    the discourse vector does in the PMI model of (Arora et al., 2016): the 
  * exact non-linear composition operator when no assumptions are made on the
    context word. 
  * When an analogous assumption to that of (Arora et al., 2016) is made, that
    the context words are uniformly distributed, we prove that the composition
    operator reduces to vector addition.
  * the learned context embeddings and target embeddings preserve the maximal
    amount of mutual information between any pair of random variables X and Y
    consistent with the observed co-occurence matrix ... (in a min-max sense,
    since there are many ways of coupling X and Y , each of which may have
    different amounts of mutual information)

# 2 Compositionality of Skip-Gram

* Minimizing the angle has been empirically successful at capturing composition
  in multiple loglinear word models . One way to understand the success of this
* explanation: 
  * recall that each word c is characterized by a categorical distribution over
    all other words w, as stated in (1). The 
  * peaks of this categorical distribution are ... the words with which c
    co-occurs most often

# 3 Skip-Gram learns a Sufficient Dimensionality Reduction Model

* SDR model 
  * learns optimal embeddings for discrete random variables X and Y without
    assuming any parametric form on the distributions of X and Y , and it is
  * useful in ... information retrieval, document classification, and
    association analysis (Globerson and Tishby, 2003)
  * obtained by learning the parameters of an exponentially parameterized
    distribution. In Theorem 3 below, we show that if a 
  * Skip-Gram model [ can be ] modified (by adding ... information on word
    frequencies) to obtain the parameters of an SDR model.
  * the original algorithm of (Globerson and Tishby, 2003) for learning SDR
    embeddings is expensive, as it involves information projections.
  * applications in network science (Grover and Leskovec, 2016), proteinomics
    (Asgari and Mofrad, 2015), and other fields.
* Lemma 2: Skip-Gram optimizes a KL Divergence
