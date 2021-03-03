Tim Van de Cruys, Thierry Poibeau, Anna Korhonen
A Tensor-based Factorization Model of Semantic Compositionality
naacl 2013

# Abstract

* compositionality is modeled as a multi-way interaction
  between latent factors, which are automatically constructed from corpus data
* We model the composition of `subject verb object` triples
  1. compute a latent factor model for nouns from standard co-occurrence data
  2. induce a latent model of three-way `subject verb object` interactions
* evaluated on a similarity task for transitive phrases
  * with modified mertric, it exceeds SOTA

# 1 Intro

* reconcile distributional semantics with the principle of compositionality
  * Mitchell and Lapata, 2008
  * Baroni and Zamparelli, emnlp 2010 Nouns are vectors, adjectives are mxs
  * Coecke+ Lambek 2010 Mathematical foundations for compos distri meang
    * a sentence vector is a function of the Kronecker product of its word vecs
    * greater interaction between the different word features
    * tested experimentally in Grefenstette and Sadrzadeh (2011a,b)
    * relational words (e.g. adjectives or verbs) have a rich
      (multidimensional) structure that acts as a filter on their arguments
  * Socher+ emnlp 2012 through recursive matrix-vector spaces
    * Each node in a parse tree is assigned both a vector and a matrix;
      the vector captures the actual meaning of the constituent, while
      the matrix models the way it changes the meaning of neighbouring phrases
* multiplication often seems to produce the best results (Blacoe & Lapata 2012)

# 2. Related distributional work for computing compositionality

* Closely related to compositionality is word meaning in context
  * Erk and Padó (2008, 2009) make use of selectional preferences
  * Thater+ (2009, 2010) extend to second-order co-occurrences
  * Dinu and Lapata (2010) model the meaning of words as a sense distribution
    * contextualized meaning as a change in the original sense distribution
    * non-negative matrix factorization (Lee and Seung, 2000, NMF)
* latent models for the modeling of word meaning
  * Latent Semantic Analysis (Landauer and Dumais, 1997)
  * Latent Dirichlet Allocation (Blei+ 2003)
* Tensor factorization in NLP
  * Giesbrecht (2010) a distributional model sensitive to word order
  * Van de Cruys (2010)
    * a three-way selectional preference model of verbs, subjects, and objects
  * Tucker decomposition, the same as Giesbrecht’s; and
    similar to Van de Cruys (2010)
    * former research does not use any syntactic information for the
      construction of the tensor
    * we? use parallel factor analysis (Harshman and Lundy, 1994)

# 3. method and mathematical machinery 3

## 3.2 The construction of latent noun factors

* Non-negative matrix factorization (NMF) from standard co-occurrence data
  * we minimize the Kullback-Leibler (KL) divergence
  * dim K is set << I, J so that a reduction is obtained
  * computed by alternating between the two iterative update rules
    * converges to a local minimum in the KL divergence

## 3.3 Modeling multi-way interactions

* inspired by Tucker decomposition (Tucker, 1966), although
  our own model instantiation differs significantly

### 3.3.1 Tucker decomposition

* also known as higher order singular value decomposition (HOSVD)
  (De Lathauwer+ 2000)
* a tensor is decomposed into a core tensor `G`,
  multiplied by matrices `A, B, C` along each mode
* matrices `A, B`, and `C` represent the latent factors for each mode,
* `G` indicates the level of interaction between the latent factors

### 3.3.2 Reconstructing a Tucker model from two-way factors

* Computing the Tucker decomposition is rather costly in time and memory
  * not unique
* we consider the factor matrices as given from our first step,
* the first mode is represented by its original instances

## 3.4 The composition of SVO triples

# 4. Examples 5

1.
  * we compute the outer product `w_athlete ◦ w_race`
  * we can inspect the tensor slice `G_run`
  * take the Hadamard product of the previous two
  * Table 1--3 nem annyira meggyőző, a _run_ példa sem túl jó, nem látok
    különböző jelentéseket
* most similar verbs (i.e. the most similar tensor slices)
  run,athlete,race  finish (.29), attend (.27), and win (.25)
  run,user,command  execute (.42), modify (.40), invoke (.39)
  damage,(man,car)  crash (.43), drive (.35), ride (.35)
  damage,(car,man)  scare (.26), kill (.23), hurt (.23)

# 5. Evaluation, quantitative 6

* similarity task for transitive sentences (Grefenstette and Sadrzadeh 2011a)
  * an extension of the similarity task for compositional models
    (Mitchell and Lapata 2008)
  * 2500 similarity judgements, provided by 25 participants
* +/contextualizing the landmark verb besides the context verb
* We compare our results to
  * Mitchell and Lapata’s (2008) model, elementwise vector multiplication
  * Grefenstette and Sadrzadeh’s (2011b) best scoring model outer product
    * "categorical"

## 5.2 Implementational details

* UKWAC corpus (Baroni+ 2009), a 2 billion word webcorpus
* nouns: 10 K nouns, cross-classified by 2 K context words
  * pointwise mutual information (PMI, Church and Hanks 1990)
* our tensor X, using 1 K verbs × 10 K subjects × 10 K objects
  * weighted using a three-way extension of PMI (Van de Cruys, 2011)
  * We set K = 300 as our number of latent factors

# 6 Conclusion

* future work issues
 1. more compositional phenomena and a differing number of modes
 2. all three modes be represented by latent factors
   * applications in the paraphrasing of compositional expressions
 3. new evaluation frameworks e.g. lexical substitution or paraphrasing task
    along the lines of McCarthy and Navigli (2009), but
    specifically aimed at the assessment of compositional phenomena
