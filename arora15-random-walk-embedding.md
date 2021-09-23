Sanjeev Arora, Yuanzhi Li, Yingyu Liang, Tengyu Ma, Andrej Risteski
RAND-WALK: A latent variable generative model approach to word embeddings
TACL 2016

* Ebben a fájlban a http://arxiv.org/abs/1502.03520v3 cikk több verziója is ki
  van jegyzetelve

# A cikk címe
* v1--3
  * Random Walks on Context Spaces:
    Towards an Explanation of the Mysteries of Semantic Word Embeddings
* v4
  * Random walks on discourse spaces:
    a new generative language model
    with applications to semantic word embeddings
* v5  TACL 2016
  * RAND-WALK: A Latent Variable Model Approach to Word Embeddings
* van v7 is

# Abstract

* Semantic word embeddings are created by diverse methods such as
  * Latent Semantic Analysis (LSA),
  * generative text models such as topic models,
  * matrix factorization, 
  * neural nets, and
  * energy-based models
* Many methods use nonlinear operations on co-occurrence statistics
  * such as Pairwise Mutual Information
* Often a generative model can help provide theoretical insight
  * there appears to be no such model to “explain” the above nonlinear models
  * e.g. no generative model for the usual (dimension-restricted) PMI model
* This paper gives a new generative model,
  * a dynamic version of the loglinear topic model of Mnih and Hinton (2007)
  * use the prior to compute closed form expressions for word statistics
  * an explanation for
    * nonlinear models like PMI, word2vec, and GloVe, as well as
    * some hyperparameter choices
    * linear algebraic structure that allows solution of word analogies,
  * Experimental support
    * latent word vectors are fairly uniformly dispersed (“isotropic”)

# 1 Introduction

* co-occurrence statistics. Reweighting heuristics is dimension reduction
  (Deerwester+ 1990)
  * Some are nonlinear; e.g., taking the
    * square root of co-occurrence counts (Rohde+ 2006), or the
    * logarithm, or
    * the related pairwise mutual information (PMI, Church and Hanks, 1990)
  * Vector Space Models, surveyed in (Turney+ 2010)
* Neural network language models
  (Hinton, 1986; Rumelhart+ 1988; Bengio+ 2006; Collobert and Weston, 2008)
  * —nonlinear and nonconvex—
  * word2vec, a family of energy based models in (Mikolov+ 2013b;c)
  * linear structure despite being produced via nonlinear methods
* Another approach to word embeddings uses latent variable probabilistic models
  * Latent Dirichlet Allocation (LDA) and
    * evolved out of efforts in the 1990s to provide a generative model that
    * “explains” the success of older vector space methods like
      * Latent Semantic Indexing
        * (Papadimitriou+ 1998; Hofmann, 1999)
  * its more complicated variants (see the survey Blei, (2012)), and
  * some neurally inspired nonlinear models (Mnih and Hinton, 2007; Maas+ 2011)
* v4-ig ez is volt:
  * A flurry of subsequent work
    * noise-contrastive estimation (Mnih and Kavukcuoglu, 2013),
    * a specific weighted least squares model that trains on the logarithm of
      word-word co-occurrence counts (Pennington+ 2014), and
    * large-dimensional embeddings that explicitly encode co-occurrence
      statistics (Levy and Goldberg, 2014a)
* no corresponding latent variable generative model “explanation”
  for the PMI family of models:
  * in other words, what is a latent variable model
    * whose maximum likelihood (MLE) solutions approximate those of the PMI
    * `\langle v_w , v_{w'} \rangle ≈ PMI(w, w')`                         (1.1)
  * Levy and Goldberg (2014b) argue that
    * if there were no dimension constraint
    * solutions of skip-gram with negative sampling would satisfy (1.1)
    * provided the right hand side were replaced by PMI(w, w_0 ) − β
      for some scalar β
    * However,
      * skip-gram is a discriminative model (due to use of negative sampling),
        not generative
      * their argument only applies to very high dimensions
      * but low-dimensional embedding are used in analogy solving
* The current paper
  * a probabilistic model of text generation that
    * augments the loglinear topic model of Mnih and Hinton (2007) with
      dynamics, in the form of a random walk over a latent discourse space
  * analytically derive—using the model priors—a closed-form expression that
    directly explains (1.1)
* oragnization
  3. a rigorous explanation for models such as word2vec and GloVe, including
     the hyperparameter choices for the latter
  5. good empirical fit
  4. mathematical explanation for "relations = lines"
  * syntactic vs semantic
    * somewhat insensitive to local word order in a sentence, and
    * better at capturing semantic relations than syntactic ones
    * (see Section 5)

## 1.2 Benefits of generative approach

* giving some form of “unification” of existing methods
* brings more intepretability to word embeddings
  * how the different senses of a polysemous word (e.g., bank) reside in linear
    superposition within the word embedding (Arora+ 2016)
* low dimensionality of word embeddings plays a key theoretical role
  * unlike in previous papers where the model is
    * agnostic about the dimension of the embeddings, and the
    * superiority of low-dimensional embeddings is an empirical finding
      (starting with (Deerwester+ 1990))
  * our theoretical analysis
    * key assumption that the set of all word vectors
      (which are latent variables of the generative model) are
      spatially isotropic i.e. have no preferred direction in space
    * Having n vectors be isotropic in d dimensions requires d << n
  * to explain the emergence of the `relations = lines` phenomenon
    * earlier explanations have larger error than the difference between the
      best solution, and the second-best (Section 4)
    * “purification” effect of isotropy of low-dimensional word vectors
      mitigates the effect of the above approximation error
      * a theoretical explanation of that dimension reduction improves

# 2 The generative model p3

* The model treats corpus generation as a dynamic process
  * driven by the random walk of a discourse vector
    * The discourse vector `c_t` does a slow random walk
      * c_{t+1} is obtained from c_t by adding a small random vector
      * occasional big jumps in the random walk are allowed
  `Prw emitted at time t | c_t  ∝ exp(c_t , w)`                       (2.1)
* related
  * Mnih and Hinton (2007)
    * loglinear model, but without the random walk
  * linear chain CRF of Lafferty+ (2001) is more general
  * dynamic topic model of Blei and Lafferty (2006)
    * topic dynamics, but with a linear word production model
  * Belanger and Kakade (2015)
    * dynamic model for text using Kalman Filters
* The novelty here over such past works is a theoretical analysis
  * in the method of moments tradition (Hsu+ 2012; Cohen+ 2012)
* Inspecting (2.1) suggests word vectors need to have varying lengths,
  * to fit the empirical finding that word probabilities satisfy a power law
* Furthermore, we will assume isotropy
  * can be quantified in two ways
    * as a prior in the bayesian tradition, which says that the
      ensemble of word vectors consists of i.i.d draws generated by s · v̂,
      * v̂ is from the spherical Gaussian distribution, and
      * s is a scalar random variable explained below
    * a pair of deterministic conditions:
      1. for most c the sum \sum_w exp(\langle v_w , c \rangle)
         is close to some constant Z (Lemma 2.1)
      2. Singular values of the matrix of word vectors satisfy some properties
         stated before Theorem 4.1
      * verified empirically in Section 5.1
  * the deterministic isotropy condition implies self-normalization
    * the partition function Z c = w exp(hv w , ci),
      * which is the implied normalization in equation (2.1),
      * is concentrated around a single value Z
    * phenomenon called self-normalization in loglinear models, that has been
      * empirically observed and studied before (Andreas and Klein, 2014)
      * allows the normalization to be ignored, leading to speedups

# 3 Training objective and relationship to other models p7

* Objective for training with PMI
* Fitting to either of the objectives involve solving a version of Weighted SVD
  * which is NP-hard, but
  * empirically seems solvable in our setting via AdaGrad (Duchi+ 2011)
* Connection to GloVe
* Connection to word2vec (CBOW)

# 4 Explaining "relations = lines" p9

# 5 Experimental verification

# 5.1 Model verification

* we tested two counter-intuitive properties:
  * the concentration of the partition function Z c for different c
    * Concentration is also observed for especially GloVe and CBOW
  * the random-like behavior of the matrix of word embeddings
    * in terms of its singular values (see Theorem 4.1)
    * for GloVe, CBOW also
  * linear relation
    * between
      * the squared norms of our word vectors and
      * the logarithm of the word frequencies
    * Figure 2: nem tűnik lineárisnak
    * This correlation is much weaker for other types of word embeddings
      * word2vec and GloVe

# 5.2 Performance on analogy tasks

* semantic
  * performance comparable to state of art
* syntactic tasks,
  * bad

# 5.3 Verifying "relations = lines"

* csak a sajátjával hasonlítja őket
* Cheating solver for analogy testbeds
  * k-means clustering on all vectors presented among the questions
  * for each (a, b), estimate the relation direction by
    * taking the first singular vector of its cluster, and
    * substitute that for a − b in (5.1) when solving the analogy
* Non-cheating solver for analogy testbeds
  * finds the top 300 nearest neighbors of `a` and those of b, and then
  * finds among these neighbors the top k pairs (a_0 , b_0 )
    * so that the  a_0 − b_0 approximate a − b
  * uses these pairs to estimate the relation direction (via rank 1 SVD),
  * substitute this (corrected) estimate for a − b in (5.1)

# 6 Conclusions p15

* an optimization objective with essentially “no knobs to turn”,

# B Maximum likelihood estimator for co-occurrence p30
