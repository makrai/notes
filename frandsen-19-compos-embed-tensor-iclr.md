Understanding composition of word embeddings via tensor decomposition
Abraham Frandsen & Rong Ge
ICLR 2019

github.com/abefrandsen/compositional-embeddings (no documentation)

# Abstract

* model
  * capture specific syntactic relations between words
  * correlations between three words (measured by their PMI) form a tensor
  * Tucker decomposition gives the word embeddings as well as a core tensor

# 1 Introduction 1

* vector representations for supervised learning (Maas+ ACL 2011)
  * AL Maas, RE Daly, PT Pham, D Huang, AY Ng, C Potts
    Learning word vectors for sentiment analysis
* Our model is motivated by
  * Arora+ (2015)
  * composition similar to Coecke+ (2010)
* We give a generative model called syntactic RAND-WALK (see Section 3)
  * capturing specific syntactic relations (e.g., adjective-noun, verb-object)
  * previous works (Socher+ 12; Baroni & Zamparelli, 10; Maillard & Clark, 15)
    * adjective as a linear operator (a matrix)
    * require learning a `d × d` matrix for each adjective
  * we use a core tensor `T ∈ R d×d×d` to capture the
    relations between a pair of words and its context
    * using the tensor `T` and the word embedding for the adjective, it is
      possible to define a matrix for the adjective that can be used as an
      operator on the embedding of the noun
    * allows the same interpretations as many previous models while having
      much fewer parameters
* high order statistics
  * the phrase of interest already has two words, so it would be
    natural to consider co-occurrences between at least three words
* Based on our model, if words `a, b` have the particular syntactic relships
  * their composition will be a vector `v_a + v_b + T(v_ a , v_b , ·)`
  * Here `v_a`, `v_b` are the embeddings for word `a` and `b`, and
    the tensor gives an additional correction term
  * different core tensors recover many previous composition methods
* experiments (Section 5)

## Related work

### Syntax and word embeddings

* Andreas & Klein (2014) find that syntax-blind word embeddings fail
* syntax-aware embedding algorithms
  * Levy & Goldberg (2014a)
  * Cheng & Kartsaklis (2015) build syntax-awareness into a neural network
    * a negative set of samples in which the context words are shuffled,
      to capture the syntactic elements which are sensitive to word order

### Word embedding composition

* Gittens+ (2017) give a theoretical justification for additive composition
  in the skip-gram model, but these assumptions don’t address syntax
* Coecke+ (2010) present a mathematical framework for reasoning about
  syntax-aware word embedding composition that motivated our model
  * Our new contribution is a concrete and practical learning algorithm with
    theoretical guarantees
* Mitchell & Lapata (2008; 2010) explore various composition methods
  * some of these are limited by the need to learn additional parameters
    post-hoc in a supervised fashion
* Guevara (2010) word embeddings for each word and for adjective-noun pairs
  * composition model is trained by using the adjective-noun token
* Maillard & Clark (2015) treat adjectives as matrices and nouns as vectors
* our tensor generalizes many previous composition methods (see Section 3.3)

### Tensor factorization for word embeddings

* embedding methods are closely connected to matrix factorization problems
  * Levy & Goldberg (2014b) and Li+ (2015)
* Sharan & Valiant (2017): CP decomposition on triple word co-occurrence counts
* Bailey & Aeron (2017) explore this idea further by defining a
  * third-order generalization of PMI, and then performing a
    symmetric CP decomposition on the resulting tensor
* our approach
  * arrives naturally at the more general Tucker decomposition (Section 4)
  * a different (yet still common?) definition of third-order PMI

# 2 Preliminaries 3

* The Tucker decomposition for a tensor can be computed efficiently
* CP decomposition (Carroll & Chang 1970; Harshman 1970)
  * When the core tensor S is restricted to a diagonal tensor
  * hard to compute in the general case (Håstad, 1990; Hillar & Lim, 2013)
* Tucker is natural for syntactic embeddings, see Section 4

# 3 Syntactic rand-walk model 4

* more direct dependence on syntactic neighbors than on topic
* we need to mediate the interaction between three quantities, namely a
  discourse vector c and the word embeddings v and v'
* A natural generalization of the LBL model is a log-trilinear form
* allowing discourse vectors to generate a pair of words with some small
  probability `p_syn`
* distribution of the second word has two terms
  * proportional to the context-free probability of generating word b
  * adjustment based on the syntactic relationship

## 3.2 Inference 5

* bottleneck in computing the marginal probabilities is normalization
  * we would need to divide by the appropriate partition functions, namely Z
  * Fortunately, these quantities are highly concentrated
    in terms of? the norm of the composition tensor

## 3.3 Composition 6

* view the discourse vector c corresponding to a syntactic word pair (a, b) as
  a suitable representation for the phrase as a whole
* the composite embedding for the phrase is `v_a + v_b + T (v_a , v_b , ·)`
  i.e. the traditional additive composition `v_a + v_b`, plus correction
  * the correction term is a matrix-vector multiplication `T(v_a , ·, ·)`
  * the composition tensor allows us to compactly associate a matrix with each
    word in the same vein as Maillard & Clark (2015)
  * Depending on the actual value of T, the correction term
    can also recover any manner of linear or multiplicative interactions
    between v_a and v_b, such as those proposed in Mitchell & Lapata (2010)

# 4 Learning 7

* we define the PMI for 3 words
  * all the partition numbers will be canceled out
* all the parameters of the syntactic RAND-WALK model can be obtained as
  the Tucker decomposition of the PMI3 tensor

## 4.1 Implementation

### Corpus

* Wikipedia, remove stop-words and words that appear less than 1000
* vocabulary of size 68,279
* Stanford Dependency Parser (Chen & Manning, 2014)

### Training

* first train the word embeddings following Arora+ (2014)
* next train the composition tensor T via
  * not precisely targeting the Tucker decomposition of the PMI3 tensor,
  * analogous to the training criterion used in Arora+ (2015), and
  * can be viewed as a negative log-likelihood for the model
* we constrain T to have CP rank 1000
* We also trained the embeddings and tensor jointly, but very similar results
* Tensorflow framework (Abadi+ 2016) with the
  Adam optimizer (Kingma & Ba, 2014) (default), and train for 1-5 epochs

# 5 Experimental verification 8

## 5.1 Model verification

* Arora+ (2015) empirically verify the model assumptions of RAND-WALK, and
  since we trained our embeddings in the same way, we don’t repeat
* Norm of composition tensor
* Concentration of partition functions

## 5.2 Qualitative analysis of composition

* We test our composition for adjective-noun and verb-object pairs
  by the words with closest embedding to the composed vector
* compare our results to the additive composition method
* quality varies
* More results can be found in supplementary material

## 5.3 Phrase similarity

* adjective-noun phrase similarity task (Mitchell & Lapata 2010)
  * 108 pairs each of adjective-noun and verb-object phrases
  * similarity ratings by a group of 54 humans
  * both the Spearman rank correlation and the Pearson correlation
  * inter-subject agreement for the task is 0.52 (Mitchell & Lapata 2010)
* we consider a weighted tensor composition v_a + v_b + αT (v_a , v_b , ·)
  * tensor composition yields worse performance than the simple additive
  * dev + test: Following Mitchell & Lapata (2010), we split the data into a
    development/test set of 18/36 humans
  * three times, rotating over folds of 18 subjects, and report the avg results
* baseline, we also report the average results using
  * additive composition, as well as a weighted additive composition βv a + v_b
  * We select β using the
    * development set (“weighted1") and the
    * test set (“weighted2"), an upper bound
  * smoothed inverse frequency (“sif") weighting method
    * near SOTA for sentence embedding tasks (Arora+ 2016)
* (“sif+tensor") of the form `p + γ ω_a ω_b T (v_a , v_b , ·)`,
  where p is the sif embedding for (a, b), `ω_a` and `ω_b` are the sif weights,
  and γ is a positive weight selected using the development set
  * motiv: evaluate the extent to which the sif and tensor are complementary
* two other standard sets of pre-computed word embeddings, namely
  * GloVe 2 and
  * carefully optimized cbow vectors (Mikolov+ 2017)
    T Mikolov, E Grave, Piotr Bojanowski, Christian Puhrsch, and Armand Joulin
    Advances in pre-training distributed word representations
    arXiv:1712.09405, LREC 2018
  * the composition tensor using the same corpus and technique as before, but
    substituting these pre-computed embeddings in place of the RAND-WALK (rw)
    * our syntactic RAND-WALK model constrains the norm of the word embeddings
      to be related to the frequency of the words, whereas
      this is not the case with the pre-computed embeddings
    * we rescaled the pre-computed embeddings sets to have the same norms
      as their counterparts in the rw embeddings, and
    * then trained the composition tensor using these rescaled embeddings
    * At test time, we use the
      * original embeddings to compute the additive components of our
        compositions, but use the
      * rescaled versions when computing the tensor components
* The results for adjective-noun phrases
  * additive < tensor < sif < tensor + sif
  * parameters
    * high consistency across the folds for the optimal weight parameter α,
      α = .4/.2/.3 for rw/glove/cbow embeddings
      γ was typically in the range .1, .2
* The results for verb-object phrases
  * weight2, tensor, sif+tensor > additive,weight1, sif
* Overall, these results demonstrate that the
  * tensor can improve the quality of the phrase embeddings in many cases, and
  * improvements are at least somewhat orthogonal to improvements from sif

# A Additional qualitative results 14

## Sentiment analysis 15
