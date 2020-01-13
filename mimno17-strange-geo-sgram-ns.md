The Strange Geometry of Skip-Gram with Negative Sampling
David Mimno and Laure Thompson
EMNLP 2017 (best paper honorable mention)

# elevator pitch

* in the popular SGNS algorithm ... the negative sampling objective dominates,
  resulting in vectors that lie within a narrow cone

# Abstract

* vector positions ... occupy a narrow cone,
  diametrically opposed to the context vectors
* this geometric concentration
  * depends on the ratio of positive to negative examples
  * neither theoretically nor empirically inherent in related embedding algos

# 1 Intro

* numerous methods with similar objectives
  (Turian+ 2010; Dhillon+ 2012; Pennington+ 2014; Luo+ 2015)
  * Hongyin Luo, Zhiyuan Liu, Huanbo Luan, and Maosong Sun
    EMNLP 2015
    Online learning of interpretable word embeddings
  * evaluations of intrinsic and extrinsic quality (Schnabel+ 2015)
* two sets of embeddings: the “official” [and] context embeddings
  * Any difference between these two sets of vectors is puzzling,
    since the sliding window used in training is symmetrical
  * GloVe ... also defines word and context vectors and
    by default returns the mean of these two vectors
* Previous work has analyzed what the algorithm might be doing in theory,
  * as an approximation to a matrix factorization (Levy and Goldberg, 2014)
  * empirical effects of ... arbitrary-seeming algorithmic choices (Levy+ 15)
    * Omer Levy, Yoav Goldberg, and Ido Dagan. TACL 2015. 
      Im proving ... similarity with lessons learned from word embeddings
* we find that the SGNS objective results in
  * vectors that are narrowly clustered in a single orthant
  * can be made non-negative without significant loss
  * context vectors mirror the “official” word vectors, with the
    angle between vectors effectively controlled by the number of neg samples
  * this relationship between vectors is effectively hidden by the
    commonly-used t-SNE projection (van der Maaten and Hinton, 2008)

# 3 Results

* we compare SGNS-trained vectors to vectors trained by ... GloVe
* We
  * begin by examining one set of embeddings from each algorithm,
    both with K = 50 dim, a vocabulary of ≈ 70k ..., and context window 5
  * then evaluate sensitivity to negative samples, window size, and dimension
* Embeddings are sensitive to word frequency (Hellrich and Hahn, 2016)
* Interactions between infrequent terms are rare, no matter how large the
  corpus
* We define four categories of words by ranked frequency: the top 100 words
  (ultra-high frequency), the 100–500th ranked words (high frequency), the
  500–5000th ranked words (moderate frequency) and the remaining (low
  frequency) words
* All vectors have a large, positive inner product with the mean, indicating
  * with the exception of the rare words, which have slightly less positive
    inner products
  * the vectors trained by GloVe show a clear relationship with word frequency,
    with low-frequency words opposing the frequency-balanced mean vector

    TODO

# Conclusion

* vectors lie on a narrow primary axis that is effectively non-negative
* further work
  * theoretical reasons why the observed concentration ... not appear to affect
    performance relative to algorithms that do not have this property
* measuring the interplay between positive and negative objectives
  may provide insight into algorithmic choices that are now poorly understood,
  such as the effect of reducing the occurrence of frequent words in the corpus
  and the sampling distribution of negative examples
