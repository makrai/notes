Word Representations withe Hierarchical Sparse Coding
Dani Yogatama, Manaal Faruqui, Chris Dyer, Noah A Smith
2015 jmlr

# Abstract

* algorithm based on stochastic proximal methods that is
  significantly faster than previous approaches,
  making it possible to perform hierarchical sparse coding
  on a corpus of billions of word tokens
* Experiments on word similarity ranking, syntactic and semantic analogies,
  sentence completion, and sentiment analysis
  * outperforms or is competitive with state-of-the-art methods

# Introduction

* this work is based on decomposition of a high-dimensional matrix
  * contexts are words (Turney & Pantel, 2010)
* govern the relationships among dimensions of the learned word vectors,
  * hierarchical organization imposed through a structured penalty known as the
    group lasso (Yuan & Lin, 2006). The idea of
  * regulating the order in which variables enter a model was
    first proposed by Zhao+ (2009), and it has since been shown useful
  * for other applications (Jenatton+ 2011)
  * coarse-to-fine organization of words’ meanings often found in the field of
    lexical semantics (see §2.2 for a detailed description)
  * distributed nature of hierarchical concepts in the brain (Raposo+ 2012)
  * Related ideas have also been explored in syntax (Petrov & Klein, 2008)
  * in cognitive science (Collins & Quillian, 1969)
* We propose a stochastic proximal algorithm for hierarchical sparse coding
  * billions of word tokens and 400,000 word types

# 2. Model

## 2.1. Background and Notation

* Other contexts include:
  * global context (Huang+ 2012)
  * multilingual context (Faruqui & Dyer, 2014)
  * geographic context (Bamman+ 2014)
  * brain activation (Fyshe+ 2014)
  * and second-order context (Schutze, 1998)
* we let `x_{v,c}` be the pointwise mutual information (PMI)
  (Turney & Pantel, 2010; Murphy+ 2012; Faruqui & Dyer, 2014;
  Levy & Goldberg, 2014)
* sparse coding
  * D is the set of matrices whose columns have `l_2 \le 1`
  * A ∈ R M ×V is the code matrix (each column of A represents a word),
  * λ is a regularization hyperparameter, and
  * Ω is the regularizer. Here,
    * we use the squared loss for the reconstruction error, but
    * other loss functions could also be used (Lee+ 2009). Note that
* it is typical, for M to be less than C
  * when M > C, it is often called an overcomplete representation
* The most common regularizer is the `l_1` penalty,
  which results in sparse codes
* our motivation is to use Ω to encourage a coarse-to-fine organization

## 2.2 Structured Regularization for Word Representations

* For Ω(A), we design a forest-structured regularizer that
  * encourages the model to use some dimensions in the code space
    before using other dimensions
  * trees describe the order in which variables “enter the model” (ie, take
    nonzero values). In general, a node may take a nonzero value only if its
    ancestors also do
    `\Omega (a_v) = \sum_node |a_{v,i} a_{v, descendants(i)}|_2`
    * Jenatton+  (2011) proposed a related penalty with only one tree for
      learning image and document representations
* thus we encode a constraint that
  the dimensions of a v that correspond to top level nodes
  should focus on “general” contexts that are present in most words
  * this corresponds to contexts with extreme PMI values for many words, since
    they are the ones that incur the largest losses
* Our hierarchical sparse coding approach is
  still several steps away from inducing a lexicon like WordNet

## 2.3. Learning

* The function is not convex with respect to D and A, but
  it is convex with respect to each when the other is fixed
  * Alternating minimization routines
    * shown to work reasonably well in practice for such problems (Lee+ 2007),
    * too expensive here due to
* One possible solution is based on the online dictionary learning method
  (Mairal+ 2010)
  For T iterations, we:
  * Sample a mini-batch of words and (in parallel) solve for each one’s `a`
    using proximal methods or alternating directions method of multipliers,
    shown to work well for overlapping group lasso problems
    (Jenatton+ 2011; Qin & Goldfarb, 2012; Yogatama & Smith, 2014)
  * Update `D` using the block coordinate descent algorithm
  * once D is fixed, we parallelize solving for all columns of A
* For a large corpus with billions of word tokens We propose an alternative

# 3 Experiments

## 3.3. Results

* similarity ranking and sentiment analysis tasks,
  our method performed the best in both low and high dimensional embeddings
* sentence completion challenge,
  our method performed best in the high-dimensional case and
  secondbest in the low-dimensional case
  * FOREST outperforms PCA and unstructured sparse coding (SC) on every task

### Analogies

* Our results on the syntactic and semantic analogies tasks for all models are
  below state-of-the-art performance
* on a bigger corpus, and the performance levels are comparable with
  previous work. On the
  * syntactic analogies task, FOREST is competitive with GV and
    both models outperformed SG and CBOW. On the
  * semantic analogies task, GV outperformed SG, FOREST , and CBOW

## 3.5 discussion

* the average numbers of nonzero entries are 91% and 85% respectively
  * not extremely sparse, this makes intuitive sense since we try to represent
    about 180,000 contexts in only 52 (520) dimensions. We also did not tune λ
    As we increase the tree size M , we get sparser representations
* We visualize our M = 52 word representations ( FOREST ) related to
  animals (10 words) and countries (10 words)
* larger magnitude of the vectors for more abstract concepts (animal, animals,
  country, countries) is
  * reminiscent of neural imaging studies that have found evidence of
    more global activation patterns for processing superordinate terms
    (Raposo+ 2012)
