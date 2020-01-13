Karl Stratos and Michael Collins and Daniel Hsu
Model-based Word Embeddings from Decompositions of Count Matrices
acl15

# 1 Introduction

* negative sampling training of the skip-gram model [is]
  a low-rank factorization of a matrix whose entries are word-context
  co-occurrence counts, scaled and transformed
* raises
  * What is the right matrix to decompose?
  * rigorous justifications for the choice of matrix and count transformations?
* canonical correlation analysis (CCA, Hotelling (1936))
  * reduces to SVD
* Stratos et al. (2014) uses CCA for learning the class of HMMs underlying
  Brown clustering
* This paper
  * a rigorous justification for CCA-based word embeddings, we also supply 
  * a general template that encompasses a range of spectral methods (algorithms
    employing SVD) for inducing word embeddings in the literature, 
    including the method of Levy and Goldberg (2014b)
  * experiments:
    * CCA combined with the square-root transformation achieves the best

# 2 Notation

# 3 Background in CCA

* Pearson correlation coefficient \in [-1,1]
## 3.1 CCA objective
## 3.2

# 4 Using CCA for parameter estimation

# 5 A template for spectral methods

# 6 Related work

# 7 Experiments

# 8 Conclusion
