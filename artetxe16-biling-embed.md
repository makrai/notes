Learning principled bilingual mappings of word embeddings 
  while preserving monolingual invariance
Mikel Artetxe [mikél ártedzse], Gorka Labaka, Eneko Agirre
2016

https://github.com/artetxem/vecmap

# Intro

* Bilingual word embeddings have attracted a lot of attention in recent times
  Zou et al., 2013
  Kočiský et al., 2014
  Chandar A P et al., 2014
  Gouws et al., 2014
  Gouws and Søgaard, 2015
  Luong et al., 2015
  Wick et al., 2016).
    Michael Wick, Pallika Kanani, and Adam Pocock
    Minimally-constrained multilingual embeddings 
      via artificial code-switching
    2016 AAAI
* induce new translations with a direct application in machine translation
  (Mikolov et al., 2013b; Zhao et al., 2015).
  * Kai Zhao, Hany Hassan, and Michael Auli. 
    2015 NAACL
    Learning translation models from monolingual continuous representations
* optimization objective
  * Mikolov et al.  (2013b), who learn the linear transformation that minimizes
    the sum of squared Euclidean distances for the dictionary entries.
  * Xing et al. (2015) incorporate length normalization in the training of word
    embeddings and try to maximize the cosine similarity instead,
    introducing an orthogonality constraint to preserve the length
    normalization after the projection.  
  * Faruqui and Dyer (2014) use canonical correlation analysis to project the
    embeddings in both languages to a shared vector space.
  * Beyond linear mappings, Lu et al. (2015) apply deep canonical correlation
    analysis to learn a nonlinear transformation for each language
  * hubness problem 
    * neighbor retrieval method (Dinu et al., 2015) and the 
    * training itself (Lazaridou et al., 2015).  
  * We leave the study of non-linear transformation and other additions for
    further work.
* we propose a general framework to learn bilingual word embeddings. We start
  with a basic optimization objective (Mikolov et al., 2013b) and 
  * introduce several meaningful and intuitive constraints that are equivalent
    or closely related to previously proposed methods (Faruqui and Dyer, 2014;
    Xing et al., 2015)
  * showing the underlying connection between the existing methods, revealing
    some flaws in their theoretical justification and providing an alternative
    theoretical interpretation for them. Our 
  * experiments on an existing 
    * English-Italian word translation induction and an 
    * English word analogy task give strong empirical evidence in favor of our
      theoretical reasoning, while showing that 
    * one of our models clearly outperforms previous alternatives.

# 2 Learning bilingual mappings

## 2.1 Orthogonality for monolingual invariance

Monolingual invariance is needed to preserve the dot products after mapping,
avoiding performance degradation in monolingual tasks

## 2.2 Length normalization for maximum cosine

* Normalizing word embeddings in both languages to be unit vectors guarantees
  that all training instances contribute equally to the optimization goal.
* In fact, our experiments show that orthogonality is more relevant than length
  normalization, in contrast to Xing et al. (2015), who introduce
  orthogonality only to ensure that unit length is preserved after mapping.

## 2.3 Mean centering for maximum covariance

* Dimension-wise mean centering captures the intuition that two randomly taken
  words would not be expected to be semantically similar, ensuring that the
  expected product of two random embeddings in any dimension and, consequently,
  their cosine similarity, is zero. 
* As long as W is orthogonal, this is equivalent to maximizing the sum of
  dimensionwise covariance for the dictionary entries: 
  * closely related to our framework, Faruqui and Dyer (2014) use Canonical
    Correlation Analysis (CCA) to project the word embeddings in both languages
    to a shared vector space.
  * CCA maximizesthe dimension-wise covariance of both projections 
    * which is equivalent to maximizing the covariance of a single projection
      if the transformations are constrained to be orthogonal
    * adds an implicit restriction to the two mappings, making different
      dimensions have the same variance and be uncorrelated among themselves
      * Our experiments (cf. Section 3) show [that this restriction] degrade
        the quality of the monolingual embeddings. 

# 3 Experiments

* code for Mikolov et al. (2013b) and Xing et al. (2015) is not publicly
  available, so we implemented and tested them
  * differs from the original systems in the 
    * optimization method (exact solution instead of gradient descent) and the
    * length normalization approach in the case of Xing et al. (2015)
      (postprocessing instead of constrained training). 
* As for the method by Faruqui and Dyer (2014), we used their original
  implementation in Python and MATLAB, which 
  * we extended to cover cases where the dictionary contains more than one
    entry for the same word.
* orthogonality constraint is key to preserve monolingual performance, and it
  also improves bilingual performance
* length normalization, when **followed by** mean centering ... obtain further
  improvements in bilingual performance without hurting monolingual performance 

# 4 Conclusion

* It is the proposed method with the orthogonality constraint and a global
  preprocessing with length normalization and dimension-wise mean centering
  that achieves the best overall results
* In the future, we would like to study 
  * non-linear mappings (Lu et al., 2015) and 
  * the additional techniques in (Lazaridou et al., 2015).
