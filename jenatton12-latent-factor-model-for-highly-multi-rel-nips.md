Rodolphe Jenatton, Nicolas Le Roux, Antoine Bordes, and Guillaume Obozinski
A latent factor model for highly multi-relational data
NIPS 2012

The data set is available under an open-source license
https://everest.hds.utc.fr/doku.php?id=en:lfmnips12
i.e. cs.University of Technology of Compiègne
EVEREST: Learning high-level representations of sparse tensors
* see sec 8

# Abstract

* multi-relational data
  * such as social networks, movie preferences or knowledge bases
  * they describe multiple relations between entities
  * existing approaches tend to break down when the number of ... types grows
* In this paper, we propose a
  * method for modeling large multi-relational datasets,
    with possibly thousands of relations
  * [model] based on a bilinear structure, which
    captures various orders of interaction of the data, and also
    shares sparse latent factors across different relations
* [new SOTA] performance ... on standard tensor-factorization datasets
* an NLP application demonstrates our scalability
  * efficient and semantically meaningful verb representations

# 1 Intro

* Statistical Relational Learning (SRL, Getoor and Taska, The MIT Press, 2007)
  * e.g. Social networks, [recommender systems,] semantic web or bioinfo
* entities can be users in ... social networks or recommender systems, words in
  the case of lexical knowledge bases, or genes and proteins
* data is [represented as a] multi-relational graph [with] different types of
  edges between nodes
* difficulties
  * large number of relation types, some being significantly more represented
    than others and possibly concerning only subsets of entities
  * data is typically noisy and incomplete (missing or incorrect relationships,
    redundant entities)
  * large scale with up to millions of entities and billions of links
* our model
  * sparse distributed representation of relation types
  * handle data with a significantly larger number of relation types
    than was considered so far in the literature
  * ties or beats SOTA algorithms on various benchmarks of link prediction, a
    standard test-bed for SRL methods

# 2 Related work

* trying to model simultaneously a collection of relations
  which can themselves be similar
* relationships observed for each relation are extremely sparse
* RLA translates often into learning an embedding of the entities, which
  * corresponds algebraically to a matrix factorization problem
  * stacking the [relationship] matrices to be factorized and applying
    classical tensor factorization methods such as CANDECOMP/PARAFAC [25, 8]
  * applied successfully [8] and has inspired [] probabilistic formulations [4]
    [4] W. Chu and Z. Ghahramani
    Probabilistic models for incomplete multi-dimensional arrays
    Journal of Machine Learning Research Proceedings Track, 5:89–96, 2009
* share the common embedding or the entities across relations
  via collective matrix factorization as proposed in RESCAL [15] and [18, 23]
* latent class`:` the resulting model is
  * the classical stochastic blockmodel [26, 17]
    * [17] K. Nowicki and T. A. B. Snijders.
      Estimation and prediction for stochastic blockstructures.
      Journal of the American Statistical Association, 96(455):1077–1087, 2001.
    * [26] Y. J. Wang and G. Y. Wong.
      Stochastic blockmodels for directed graphs.
      Journal of the American Statistical Association, 82(397), 1987.
  * clustering-based approaches ... for multi-relational learning
    * [9] a non-parametric Bayesian extension of the stochastic blockmodel
      allowing to automatically infer the number of latent clusters
      9. C. Kemp, J. B. Tenenbaum, T. L. Griffiths, T. Yamada, and N. Ueda
        Learning systems of concepts with an infinite relational model
        AAAI 2006
    * [14, 28] allow entities to have a mixed clusters membership
      14. K. Miller, T. Griffiths, and M. Jordan
        Nonparametric latent feature models for link prediction
        NIPS 2009
      28. J. Zhu
        Max-margin nonparametric latent feature models for link prediction
        ICML 2012
    * [10] introduced clustering in Markov-Logic networks
      10. S. Kok and P. Domingos
        Statistical predicate invention
        ICML 2007
    * [24] used a non-parametric Bayesian clustering of entities embedding in a
      collective matrix factorization formulation
      24. I. Sutskever, R. Salakhutdinov, and J. Tenenbaum
        Modelling relational data using bayesian clustered tensor factorization
        NIPS 2009
    * [9, 24, 14, 28, 10] ... cluster not only entities but relations as well
* Semantic Matching Energy model (SME) of Bordes+ (2012) embeds relations as a
  vector from the same space as the entities

# 3 Relational data modeling

* This section is very short, just 9 lines
* entities have a unique representation shared between relation types

# 4 Model description

* This is the initial model considered in (Sutskever+ 2009)
  24. Sutskever, R. Salakhutdinov, and J. Tenenbaum
      Modelling relational data using bayesian clustered tensor factorization
      2009 NIPS
* matches the model considered in (Nickel+ 12) if
  the least-square loss is substituted to the logistic loss
  * [16] M. Nickel, V. Tresp, and H.-P. Kriegel
    Factorizing YAGO: scalable machine learning for linked data
    2012, 21st intl conf. on WWW
* We will refine this model in two ways
  1. redefining the term `η_ik^(j)` as a function `η_ik^(j) = E(s i, R j, o k)`
    taking into account the different orders of interactions between s i , o k
    and R j
  2. parameterizing the relations R j by latent “relational” factors that reduce
    the overall number of parameters of the model

## 4.2.Sharing parameters across relations through latent factors

* When learning a large number of relations, the number of observations for
  many relations can be quite small, leading to a risk of overfitting
  * Sutskever+ (2009) addressed this issue with a non-parametric Bayesian model
    inducing clustering of both relations and entities
  * SME [2] proposed to embed relations as vectors of R p , like entities
  * a general parameterization of the matrices R j in RESCAL [16],
  * we require that all R j decompose over a common set of _d_ rank one
    matrices {Θ r } 1≤r≤d representing some canonical relations: R j = d X α jr
* The combined effect of (a) the sparsity of the decomposition and (b) the fact
  that `d << n_r` leads to sharing parameters across relations
* Further, constraining `Θ_r` to be the outer product `u_r v_r^T` also speeds
  up all computations relying on linear algebra

# 5 Regularized formulation and optimization

# 6 Relation to other models 5

# 7 Application to multi-relational benchmarks

# 8 Learning semantic representations of verbs 6

## 8.1 Experimental setting

### Data

* 2,000,000 Wikipedia articles [filtered to] sentences for which the syntactic
  structure was (subject, verb, direct object) each term of the triplet being a
  single word from the WordNet lexicon [13]
  * Subjects and direct objects ended up being [30 k] single nouns
  * number of verbs is 4,547: this is much larger than for previously
  * 1 m + 20 k + 250 k relationships to build a training/validation/test set

### Practical training setup

* parameters ... optimized over the validation set
  * size p ∈ {25, 50, 100} of the representations,
  * the dimension d ∈ {50, 100, 200} of the latent decompositions (2),
  * the value of the regularization parameter λ as a fraction ... of n r × d,
  * the step-size in {0.1, 0.05, 0.01} and
  * the weighting of the negative triplets
  * we gradually increased the number of sampled negative verbs

## 8.2 Results 7

### Verb prediction

* how well we predict a relevant and meaningful verb given a pair (subject, DO)
  * metrics, namely, (1) the rank of the correct verb and (2) p@z
    * the minimum rank achieved over its set of synonyms obtained from WordNet
* compared with that of
  * SME [2], which was shown to scale well on ... large sets of relations, and
  * a bigram model, which estimates the probabilities of the pairs
* observation
  * representations (2) are sparse[, i.e.] dominated by few large values, the
    top 2% of the largest values of α account for about 25% of the l_1 norm

### Lexical similarity classification 8

* task of lexical similarity classification
  * described in Yang and Powers (2006) Verb sim on the taxonomy of wordnet
  * 130 pairs of verbs labeled by humans with a score in {0, 1, 2, 3, 4}

# 9 Conclusion

* handling large amounts of linked relations seems necessary
  to model the wealth of relations underlying the semantics of [the real world]
  * We ... using a shared representation of relations
    * entities have a unique representation shared between relation types, and
    * relation themselves decompose over latent “relational” factors
  * This new approach ties or beats SOTA models
    on both standard relational learning problems and an NLP task
  * a significant reduction of the number of parameters
  * scalable both with respect to the number of relations and the data samples
* relative importance of the various terms in our formulation
  * trigram term was
    * crucial in the tensor factorization problems
    * marginal role in the NLP experiment, where
      most of the information was contained in the bigram and unigram terms
* future
  * exploring the similarities of the relations through an analysis of the
    latent factors could provide some
    insight on the structures shared between different relation types
  * Performance might be improved by training on cleaner triplets, such as
    [11] A. Korhonen, Y. Krymolowski, and T. Briscoe
    A large subcategorization lexicon for NLP applications
    LREC, 2006
