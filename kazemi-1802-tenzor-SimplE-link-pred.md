SimplE Embedding for Link Prediction in Knowledge Graphs
Seyed Mehran Kazemi and David Poole
NIPS 2018

code is available on GitHub at https://github.com/Mehran-k/SimplE

# Abstract

* Knowledge graphs contain [structured] knowledge about the world
* Tensor factorization approaches [to link prediction] have proved promising
* Canonical Polyadic (CP, 1927) performs poorly for link prediction
  as it learns two independent embedding vectors for each entity
* We present a simple enhancement of CP (which we call SimplE) to allow
  * the two embeddings of each entity to be learned dependently
  * The complexity of SimplE grows linearly with the size of embeddings
  * interpretable, and certain types of
    background knowledge can be incorporated through weight tying
    * namely symmetry, anti-symmetry, and inversion
  * derive a bound on the size of its embeddings for full expressivity
  * outperforms several state-of-the-art tensor factorization techniques

# 1 Introduction

* KGs have applications in several fields including
  * search, question answering, natural language processing, recommendation sys
  * statistical relational learning (SRL) [12, 31, 7]
    * Link prediction and several other related problems
      aiming at reasoning with entities and relationships are studied
    * represented as a set of (head , relation, tail )
    * also known as knowledge graph completion
* Tensor factorization [for effective] KG completion [29, 4, 39, 26]
  * embeddings for each entity and each relation
  * outputs a number indicating the predicted probability
  * Details and discussions in recent surveys [27, 43]
    27. Dat Quoc Nguyen
      An overview of embedding models of entities and relationships for knowl-
      edge base completion
      arXiv preprint arXiv:1703.08098, 2017.
    43. Quan Wang, Zhendong Mao, Bin Wang, and Li Guo.
      Knowledge graph embedding: A survey of approaches and applications.
      IEEE Transactions on Knowledge and Data Engineering, 29(12) 2017
  * canonical Polyadic (CP) decomposition [15] learns one embedding vector
    for each relation and two embedding vectors for each entity
  * This independence has caused CP to perform poorly for KG completion [40]
* In this paper tensor factorization approach [SimplE] based on CP that
  * addresses the independence among the two embedding vectors of the entities
  * can be considered a bilinear model,
  * fully expressive
  * capable of encoding background knowledge
    * through parameter sharing (aka weight tying)
  * performs very well empirically despite (or maybe because of) its simplicity
* We also discuss several disadvantages of other existing approaches
  * e.g., [4, 17, 41, 26] are not fully expressive
  * the function used in ComplEx [39, 40], a SOTA approach for link prediction,
    involves redundant computations

# 2 Background and notation

* A tensor factorization model
  * defines two things
    * the embedding functions for entities and relations
    * a function f taking h, r and t as input and generating a prediction
  * is fully expressive if given any  full assignment of truth values

# 3 Related Work

* Translational Approaches
  * entity `e` is a single vector `v_e ∈ R_d`
  * relation `r` is a vector `v_r ∈ R_d` and 2 matrices `P_r ∈ R_d×d` and `Q_r`
  * The dissimilarity function for a triple (h, r , t) is defined as
  `||P_r v_h + v_r − Q_r v_t || i`
  (i.e.  encouraging `P_r v_h + v_r ≈ Q_r v_t`)
  where ||v|| i represents norm i of vector v
  * restrictions they impose on `P_r` and `Q_r`
    * TransE [4], d = d' , `P_r = Q_r = I_d`
    * TransR [22], `P_r = Q_r`
    * STransE [26], no restrictions are imposed on the matrices
    * FTransE [11], slightly changes the dissimilarity function
      ||P_r v_h + v_r − α Q_r v_t || i for a value of
      * α that minimizes the norm for each triple
      * In the rest of the paper,
        FTransE [has no restrictions] over `P_r` and `Q_r`
* Multiplicative Approaches define product-based functions over embeddings
  * DistMult [46] [ defines ] `\langle v_h , v_r , v_t\rangle`
    * can only model symmetric relations
  * ComplEx [39] extends DistMult by considering complex-valued vectors
  * RESCAL [28], HolE [32]
* Deep Learning Approaches generally use a neural network
  * E-MLP [37] considers the embeddings for each
    * entity e to be a vector `v_e ∈ R_d`
    * relation r to be a matrix `M_r ∈ R 2k×m` and a vector v_r ∈ R m
    * [v_h ; v_t] ∈ R 2d into a two-layer neural network whose weights for
      * the first layer are the matrix `M_r`
      * the second layer are `v_r`
  * ER-MLP [10], considers the embeddings for both entities and relations to be
    single vectors and feeds [v h ; `v_r` ; v_t] ∈ R 3d into a two layer NN
  * In [35], once the
    * entity vectors are provided by the convolutional neural network and the
    * relation vector is provided by the long-short time memory network,
    * for each triple the vectors are concatenated similar to ER-MLP and are
      fed into a four-layer neural network
    * Neural tensor network (NTN) [37] combines E-MLP with several bilinear
      parts (see Subsection 5.4 for a definition of bilinear models)

# 4 SimplE: A Simple Yet Fully Expressive Model

* SimplE takes advantage of the inverse of relations [for weights tying]
  * inverse of relations has been used for other purposes [20, 21, 6]
* Model Definition: SimplE considers
  * two vectors h_e , t_e ∈ R d as the embedding of each entity e
  * two vectors v_r , v_r −1 ∈ R d for each relation r
  * similarity function defined as
    * the average of the CP scores for (e i , r , e_j ) and (e j , r −1 , e i)
  * we also consider a different variant, which we call SimplE-ignr
* Learning SimplE Models: stochastic gradient descent with minibatches
  * negative [sampling]: We use Bordes+ [4]’s procedure
    * we randomly decide to corrupt the head or tail
  * following [39] we optimize the L2 regularized negative log-likelihood
    * softplus(x) = log(1 + exp(x)). While several previous works
    * Trouillon and Nickel [38] show that the margin-based loss function is
      more prone to overfitting compared to log-likelihood

# 5 Theoretical Analyses

## 5.1 Fully Expressiveness

* Proposition 2. FSTransE [and TransE, FTransE, STransE, TransH [41], and
  TransR [22] have] the following restrictions
  * If a relation r is reflexive on ∆ ⊂ E,
    r must also be symmetric and transitive on ∆,
  * If entity e 1 has relation r with every entity in ∆ ⊂ E and
    entity e 2 has relation r with one of the entities in ∆, then
    e 2 must have the relation r with every entity in ∆
    * e.g.  friendship relation in FB15k [with 20 friends],
      `netflix genre` in FB15k and `has part` in WN18

## 5.2 Incorporating Background Knowledge into the Embeddings

* incorporating background knowledge into tensor factorization approaches
  * post-processing steps or add
    additional terms to the loss function to penalize predictions that violate
    the background knowledge [34, 42, 45, 13, 9]
  * Minervini+ [25] show in terms of equivalence and inversion through
    parameter tying

## 5.3 Time Complexity and Parameter Growth

* time complexity for TransE is O(d) where d is the size of the embedding
* STransE ([with] the two relation matrices) increases [it] to O(d 2 )
  * number of parameters to be learned from data grows quadratically with d
* RESCAL and NTNs have quadratic or higher time [and parameter] complexity
* DistMult and ComplEx have linear time [& param] complexities
* time complexity of both SimplE-ignr and SimplE is O(d), i.e. linear in the
* SimplE-ignr requires one multiplication between three vectors for each
  triple. This number is 2 for SimplE and 4 for ComplEx

## 5.4 Family of Bilinear Models

* [i.e.] the family of models where the embedding for each
  * entity e is v_e ∈ R d , for each
  * relation r is M r ∈ R d×d (with certain restrictions), and
  * the similarity function for a triple (h, r , t) is defined as v h^T M r_v t
* remarkable performance for link prediction in knowledge graphs [31]
* DistMult, ComplEx, and RESCAL + SimplE (and CP) also belong to this family
  * DistMult restricts the M r matrices to be diagonal as in Fig. 2(a). For
  * ComplEx
  * RESCAL imposes no constraints on the M r matrices. Considering the
  * CP
  * SimplE [similar to CP] extra parameters [correspond to] the inverse
* SimplE [is compatible] with other embedding models (in KG completion,
  computer vision and natural language processing) such as [35, 47, 36]

# 6 Experiments and Results

* Datasets: We conducted experiments on two standard benchmarks:
  * WN18, a subset of Wordnet [24], and
    * 41 k entities, 18 relations, 141 k train, 5 k validation and 5 k test triples
  * FB15k a subset of Freebase [2]
    * FB15k contains 15 k entities, 1 k relations, 483 k + 50 k + 59 k triples
* Baselines
  * CP, TransE, TransR, DistMult, NTN, STransE, ER-MLP, and ComplEx
* Evaluation Metrics
  * filtered MRR. We also report hit@k measures
* Implementation in TensorFlow [1]
  * The best embedding size and λ values on FB15k for
    SimplE-ignr were 200 and 0.03 respectively, and for
    SimplE were 200 and 0.1

## 6.1 Entity Prediction Results

* On WN18, SimplE-ignr and SimplE perform as good as ComplEx, a SOTA model
  On FB15k, SimplE outperforms the existing baselines
* bilinear approaches tend to have better performances

## Incorporating background knowledge

Table 2: Background Knowledge Used in Section 6.2
* hyponym <-> hypernym, memberMeronym <-> memberHolonym, instanceHyponym <->
  instanceHypernym, hasPart <-> partOf , memberOfDomainTopic <->
  synsetDomainTopicOf , memberOfDomainUsage <-> synsetDomainUsageOf ,
  memberOfDomainRegion <-> synsetDomainRegionOf , similarTo = similarTo

# 7 Conclusion

* future, SimplE could be improved or may help improve relational learning
  * ensembles of SimplE models as [18] do it for DistMult,
  * adding SimplE to the relation-level ensembles of [44],
  * explicitly modelling the analogical structures of relations as in [23],
  * using [8]’s 1-N scoring approach to generate negative triples
    * Trouillon+ [39] show that generating more negative triples [helps]
  * combining SimplE with
    * logic-based approaches (e.g., with [19])
    * (or use SimplE as a sub-component in)
      techniques from other categories of relational learning
      as [33] do with ComplEx,
  * incorporating other types of background knowledge (e.g., entailment)
