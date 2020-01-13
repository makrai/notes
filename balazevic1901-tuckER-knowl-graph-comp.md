Ivana Balažević, Carl Allen, Timothy M. Hospedales
TuckER: Tensor Factorization for Knowledge Graph Completion
arXiv:1901.09590 [cs.LG]

https://github.com/ibalazevic/TuckER

# Abstract

* linear model based on Tucker decomposition of the binary tensor
* outperforms all previous SOTA models across standard link prediction DSs
* fully expressive model,
  * [we] deriving the bound on its entity and relation embedding dimensionality
  * several orders of magnitude smaller than the bound of previous SOTA models
    ComplEx and SimplE
  * [still inreasonably high]
* several previously introduced linear models can be viewed as special cases

# 1 Intro

* Knowledge graphs ... represented by a third-order binary tensor
  * 1 indicating a true fact and 0 indicating the unknown (false or a missing)
* approaches to link prediction
  * linear, based [on] factorizing the third-order binary tensor 
    (Nickel+ 2011; Yang+ 2015; Trouillon+ 2016; Kazemi & Poole, 2018)
  * convolutional models, SOTA (Dettmers+ 2018; Balažević+ 2018)
* In this paper, we introduce TuckER (E stands for entities, R for relations),
  * based on Tucker decomposition (Tucker, 1966) of the third-order binary tnsr
    * Tucker decomposition factorizes a tensor into a core tensor multiplied by
      a matrix along each mode
    * a form of higher-order singular value decomposition (HOSVD) in the
      special case where matrices are orthogonal and the core tensor is
      “all-orthogonal” 
      (Kapteyn+ 1986; Kroonenberg & De Leeuw, 1980; Kolda & Bader, 2009)
  * In our case,
    * rows of the three matrices contain entity and relation embedding vectors,
    * entries of the core tensor determine the level of interaction
    * subject and object entity embedding matrices are assumed equivalent
* relation types (symmetric, asymmetric, transitive, etc.),
  * TuckER is fully expressive
* [the] bound on the entity and relation embedding dimensionality
  * several orders of magnitude lower than the previous SOTA 
    ComplEx (Trouillon+ 2016) and SimplE (Kazemi & Poole, 2018)
* several previous SOTA linear models are special cases of TuckER
  * RESCAL (Nickel+ 2011), DistMult (Yang+ 2015), ComplEx (Trouillon+ 2016) and
    SimplE (Kazemi & Poole, 2018)
* contributions of this paper are
  * TuckER, a new linear model for link prediction in knowledge graphs
  * fully expressive and ["low"] bound on the entity and relation embed dim
  * subsumes several previous ... tensor factorization approaches to link pred

# 2. Related Work

## linear models for link prediction

### RESCAL (Nickel+ 2011)

* bilinear product between vector embeddings for each subject and object entity
* full rank matrix for each relation. Although [] very expressive and powerful
* prone to overfitting ... increases quadratically in the embedding dimension

### DistMult (Yang+ 2015) is

* a special case of RESCAL with a diagonal matrix per relation, so the number
* [the] tensor learned by DistMult is symmetric in the subject and object
* a special case of CP, where subject and object entity embeddings are
  equivalent

### ComplEx (Trouillon+ 2016)

* extends DistMult to the complex domain. Even though each relation matrix of
* subject and object entity embeddings for the same entity are ... complex
  conjugates, which introduces asymmetry into the tensor decomposition

### SimplE (Kazemi & Poole, 2018) is a linear model

* based on Canonical Polyadic (CP) decomposition (Hitchcock, 1927). In CP
* subject and object entity embeddings for the same entity are independent
  SimplE ... make subject and object entity embedding vectors dependent, i.e
  it computes the average of two terms, first of which is a bilinear product of
  the head embedding of the subject entity, relation embedding and tail
  embedding of the object entity and the second is a bilinear product of the
  head embedding of the object entity, inverse relation embedding and tail
  embedding of the subject entity

## Recent SOTA non-linear models

### ConvE (Dettmers+ 2018) is

* the first nonlinear model that significantly outperformed ...  linear models
* subject entity and relation embedding vectors, after they are reshaped to
  matrices and concatenated
* a global 2D convolution operation is performed
* The obtained feature maps are flattened, transformed through a fully
  connected layer, and the inner product is taken with all object[s]
* unintuitive [because of] reshaping and concatenating of vectors as well as
  using 2D convolution on word embeddings

### HypER (Balažević+ 2018)

* simplified convolutional model, that uses
* a hypernetwork to generate 1D convolutional filters for each relation,
* The authors show that
  * convolution is a way of introducing sparsity and parameter tying
  * HypER [is] tensor factorization up to a non-linearity
  * drawback: it sets most elements of the core weight tensor to 0
    * hard regularization, rather than letting the model learn

* Scoring functions of all models described above and TuckER are summarized in
  Table 1

# 3. Background

## 3.2. Tucker Decomposition 3

* Tucker, (1964) and refined in his subsequent work (Tucker, 1966)
  * decomposes a tensor into a set of matrices and a smaller core tensor
  * Factor matrices A, B and C, when orthogonal, can be thought of as the
    principal components in each mode
  * Elements of the core tensor Z show the level of interaction
  * not unique, i.e. we can transform Z without affecting the fit if we apply
    the inverse of that transformation to the factor matrices
  * improved uniqueness (Kolda & Bader, 2009) by imposing e.g sparsity, making
    its elements small or making the core “all-orthogonal”

# 4. Tucker Decomposition for Link Prediction

* We propose a model that uses Tucker decomposition for link prediction on the
  third-order binary tensor representation of a knowledge graph
* entity embedding matrix E that is equivalent for subject and object entities,
* We apply logistic sigmoid to each score φ(e s , r, `e_o` ) to obtain the
  predicted probability p = σ(φ(e s , r, `e_o` )) of a triple being true
* fully expressive, i.e.  given sufficient ...  dimensionality, it is able to
  assign [any combination of] truth true triples [and] false ones

## 4.1. Training 4

* the tensor being factorized is comprised of ∞ and −∞ 
  (after applying the inverse of logistic sigmoid)
* we use numerical methods to train TuckER
* Following the training procedure introduced by Dettmers+ (2018)
  * 1-N scoring, i.e. we simultaneously score a pair `e_s` and r 
    with all entities `e_o` ∈ E,
    * in contrast to 1-1 scoring, where individual triples (e s , r, `e_o` ) are
      trained one at a time
    * local-closed world assumption (Nickel+ 2016) i.e. we include only the
      non-existing triples (e s , r, ·) and (·, r, `e_o` ) of the observed pairs
      `e_s` , r and r, `e_o` respectively as negative samples and all observed
      triples as positive samples
* minimize the Bernoulli negative log-likelihood loss function

# 5. Theoretical Analysis

## 5.1. Bound on Embedding Dimensionality for Full Expressiveness

* ComplEx and SimplE are fully expressive with [the following dimensions]
  * ComplEx: d_e = `d_r` = n_e · n_r (Trouillon+ 2017)
  * SimplE: d_e = `d_r` = min(n e · n_r , γ + 1) (Kazemi & Poole 2018) with 
    γ representing the number of true facts
* other models are not fully expressive:
  * DistMult, because it cannot model asymmetric relations; and
  * transitive models such as TransE (Bordes+ 2013) and its variants FTransE
    (Feng+ 2016) and STransE (Nguyen+ 2016)
* TuckER : `d_e = n_e` and `d_r = n r`

## 5.2. ... Previous Tensor Factorization Approaches [as special cases] 5

### RESCAL (Nickel+ 2011) Following the notation introduced in Section 3.2,

* the second dimension of original tensor X ∈ R n_e ×n r ×n e is not reduced
* also known as Tucker2 decomposition (Kolda & Bader, 2009). As is the case

### DistMult (Yang+ 2015) ... can be viewed in two ways:

* as equivalent to that of TuckER with acore tensor ... is superdiagonal with
  1s on that superdiagonal
  * can alternatively be interpreted as a special case of CP decomposition
    (Hitchcock, 1927)
* as equivalent to that of RESCAL ...  with a core tensor ... which is diagonal
  for every d_e × d_e slice

### ComplEx (Trouillon+ 2016)

* Bilinear models are a family of models where subject and object entity
  * embeddings are represented by vectors `e_s` , e o
  * a relation is represented by a matrix W r ∈ R d_e ×d e and
  * the scoring function takes the form of a bilinear product
* It is trivial to show that both RESCAL and DistMult belong to the family
  * ComplEx can be considered a bilinear model (Kazemi & Poole 2018)
  * This makes the scoring function of ComplEx (see Table 1) equivalent to that
    of RESCAL with relation matrix W r constrained as described
  * Therefore, similarly to DistMult, we can regard the scoring function of
    ComplEx in two ways:
    * as equivalent to the scoring function of TuckER (see Equation 1), with
    * as equivalent to the scoring function of RESCAL (see Equation 4), with
* ComplEx ... is equivalent to a hard regularization of the core tensor of
  TuckER in the real domain

### SimplE (Kazemi & Poole, 2018) The authors show that SimplE

* belongs to the family of bilinear models
* equivalent to:
  * that of TuckER (see Equation 1)
  * that of RESCAL (see Equation 4)

## 5.3. Representing Asymmetric Relations

* possible ways in which linear link prediction models introduce asymmetry into
  factorization of the binary tensor of triples
* so far
  * e.g. ComplEx and SimplE
    * distinct (although possibly related) embeddings for subject and object es
    * diagonal matrix (or equivalently a vector) for each relation
    * strict constraint on the relation matrix and
    * a hard limit on the type of transformation applied on entity embeddings
  * RESCAL
    * subject and object entity embeddings to be equivalent, but representing a
    * relation as a full rank matrix
    * quadratic growth of parameter number with the number of relations
    * overfitting, especially for relations with [few] training triples
* TuckER introduces a novel approach to dealing with asymmetry: by representing
  * relations as vectors `w_r` , which makes the parameter number grow linearly
  * asymmetric relation-agnostic core tensor W, which
    enables knowledge sharing between relations, multi-task learning
  * Multiplying W with `w_r`, we obtain a
    full rank relation-specific matrix `W_r` which [can be] transformed

# 6. Experiments and Results 6

* datasets:
  * FB15k (Bordes+ 2013) is a subset of Freebase, a large database of
    real world facts containing information about films, actors, sports, etc
  * FB15k-237 (Toutanova+ 2015) was created from FB15k
    * by removing the inverse of many relations that are present in the
      training set from validation and test sets
  * WN18 (Bordes+ 2013) is a subset of WordNet, ... hierarchical structure
  * WN18RR (Dettmers+ 2018) is a subset of WN18, created by removing the
    inverse relations from validation and test sets

## 6.2. Implementation and Experiments

* embedding dimension
  * For FB15k and FB15k-237, we set both entity and relation embedding
    dimensions to d_e = `d_r` = 200. For
  * WN18 and WN18RR
    * contain a significantly smaller number of
      * relations relative to the number of entities as well as a small number of
      * relations compared to FB15k and FB15k-237,
    * we set d_e = 200 and `d_r` = 30
* batch normalization (Ioffe & Szegedy, 2015) and dropout (Srivastava+ 2014)
* We evaluate each triple from the test set as in (Bordes+ 2013): 
  for a given triple, we generate 2n e test triples
  * by keeping the subject entity `e_s` and relation r fixed and
    replacing the object entity `e_o` with all possible entities E and
  * by keeping the object entity `e_o` and relation r fixed and
    replacing the subject entity `e_s` with all entities E
  * We then rank the scores obtained
  * filtered setting only, i.e.  we remove all other true triples apart from
    the currently observed test triple
* two evaluation metrics used across the link prediction literature:
  * mean reciprocal rank (MRR) and
    * the average of the inverse of a mean rank assigned to the true triple
      over all n_e generated triples
  * hits@k, k ∈ {1, 3, 10}

## 6.3. Link Prediction Results

TuckER [consistently obtains better results than] some simpler linear models
* We believe this is achieved by exploiting
  * knowledge sharing between relations through the core tensor and
  * implicit regularization from dropout
* dropout parameter to have a significant influence on results, with
  * lower dropout values (0.1, 0.2) required for datasets with
    [more] training triples per relation
  * higher dropout values (0.3, 0.4, 0.5) required for datasets with
    [many] relations (FB15k and FB15k-237)
* TuckER improves the results of all previous linear models by a larger margin
  on datasets with [many] relations

## 6.4. Influence of Embedding Dimensionality 8

* we train ComplEx, SimplE and TuckER on FB15k-237
  with embedding sizes `d_e = d_r` ∈ {20, 50, 100, 200}
  Figure 3 shows the obtained MRR on the test set for each of the models

# 7. Conclusion

* Future work
  * softly regularizing the model other than dropout
  * incorporate background knowledge on individual relation properties
