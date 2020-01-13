Peter D. Turney, Patrick Pantel
From frequency to meaning: vector space models of semantics
2010

# 1. Introduction

* history
  * The VSM was developed for the SMART information retrieval system
    (Salton, 1971; Salton, Wong, & Yang, 1975)
  * Rapp (2003) used a vector-based representation of word meaning to 
    achieve a score of 92.5\% on multiple-choice synonym questions 
    from the Test of English as a Foreign Language (TOEFL)
* We believe that the choice of a particular matrix type is more fundamental
  than other choices, such as the particular linguistic processing or
  mathematical processing

## 1.1 Motivation for VSM

* Most search engines use VSMs to
  measure the similarity between a query and a document (Manning et al., 2008)
* we take it as a defining property of VSMs that the values of the elements in
  a VSM must be derived from event frequencies, such as the number of times
  that a given word appears in a given context (see Section 2.6)
  * a lexicon or a knowledge base may be viewed as a graph, and a graph may be
    represented using an adjacency matrix, but this does 
    not imply that a lexicon is a VSM

## 1.2 Vectors in AI and Cognitive Science

* not frequency:
  * recommender systems
  * cognitive science, prototype theory
* Latent Semantic Analysis (LSA), Hyperspace Analogue to Language
* Cognitive scientists have argued that there are empirical and theoretical
  reasons for believing that VSMs, such as LSA and HAL, are plausible models of
  some aspects of human cognition

## 1.3 Motivation for This Survey

* pair--pattern matrices ... address some criticisms that have been directed at
  word--context matrices, regarding lack of sensitivity to word order

## 1.4 Intended Readership

## 1.5 Highlights and Outline

2. explains our framework for organizing the literature on VSMs
  * term–document, word–context, and pair–pattern
3. linguistic processing
   * stemming, part-of-speech tagging, word sense tagging, or parsing
4. mathematical processing
  * weighting the elements, smoothing the matrix, and comparing the vectors
  * optimization strategies for comparing the vectors, such as
    * distributed sparse matrix multiplication and randomized techniques
5. detailed look at three VSM systems
   * term–document VSMs, ... the Lucene information retrieval library
   * word–context VSMs
    * the Semantic Vectors package, which builds on Lucene
   * pair–pattern VSMs the Latent Relational Analysis module in the S-Space
     package, which also builds on Lucene
6. applications for semantic VSMs
   * historical view of research with semantic VSMs, beginning
   1. information retrieval
   2. applications for word–context matrices
   3. pair–pattern matrices
7. alternatives to VSMs for semantics
8. future of VSMs, ... their power and their limitations
9. conclude

# 2. Vector Space Models of Semantics

## 2.1 Similarity of Documents: The Term--Document Matrix

## 2.2 Similarity of Words: The Word--Context Matrix

* generalize the idea of documents to chunks of text of arbitrary size
  (phrases, sentences, paragraphs, chapters, books, collections), the result is
  the word–context matrix,

## 2.3 Similarity of Relations: The Pair--Pattern Matrix

* rows correspond to pairs of terms and the
  columns correspond to the patterns in which the pairs occur

## 2.4 Similarities

## 2.5 Other Semantic VSMs

* triple–pattern matrices
  * generalization of a matrix is a tensor
  * term–document–language third-order tensor
    for multilingual information retrieval
  * a word–word–pattern tensor to measure similarity of words (Turney 2007)
  * Van de Cruys (2009) uses a verb–subject–object tensor to
    learn selectional preferences of verbs

## 2.6 Types and Tokens

## 2.7 Hypotheses

# 3. Linguistic Processing for Vector Space Models 13

# 4. Mathematical Processing for Vector Space Models

## 4.1 Building the Frequency Matrix

1. scan sequentially through the corpus, recording events and their frequencies
   in a hash table, a database, or a search engine index
2. generate the frequency matrix, with a sparse matrix representation

## 4.2 Weighting the Elements

* adjust the weights of the elements in the matrix, because common words will
  have high frequencies, yet they are less informative than rare words
* tf-idf (term frequency × inverse document frequency) family of weighting
  functions (Spärck Jones, 1972)
  * An element gets a high weight when the corresponding term is
    * frequent in the corresponding document (i.e., tf is high), but
    * rare in other documents in the corpus (i.e., df is low)
  * Salton and Buckley (1988) defined a large family of tf-idf ...  functions
* [document] length normalization (Singhal, Salton, Mitra, & Buckley, 1996)
* correct for correlated terms
  * e.g. _hostage_ and _hostages_
  * correlated, yet we may not want to [lemmatize] them ... (as in Sect 3.2),
    because they have slightly different meanings
  * alternative: we may reduce their weights when they co-occur in a document
    (Church, 1995)
* Feature selection (Forman 2003)
* Pointwise Mutual Information (Church & Hanks, 1989; Turney, 2001)
  * An alternative to tf-idf
  * works well for both word–context matrices (Pantel & Lin, 2002a) and
    term–document matrices (Pantel & Lin, 2002b)
  * Positive PMI (PPMI ... Niwa & Nitta, 1994)
    * performs [well] when measuring semantic similarity with word–context
      matrices (Bullinaria and Levy 2007)
    * Turney (2008a) applied PPMI to pair–pattern matrices
    * biased towards infrequent events
    * Another way to deal with infrequent events is Laplace smoothing

## 4.3 Smoothing the Matrix

* smooth the matrix, to
  * reduce the amount of random noise and to
  * fill in some of the zero elements in a sparse matrix
* keeping only the context-word dimensions with a PMI above a conservative
  _threshold_ and setting the others to zero, Lin (1998) showed that the number
  of comparisons needed to compare vectors greatly decreases
  while losing little precision in the similarity score
* truncated Singular Value Decomposition (SVD), also called thin SVD
  * applied to document similarity, it is called Latent Semantic Indexing (LSI)
  * applied to word similarity, it is Latent Semantic Analysis (LSA)
* four ways of looking at SVD:
  * latent meaning
  * noise reduction
  * [indirect or] high-order co-occurrence
    * when two words appear in similar contexts
  * sparsity reduction
* good C implementation
* alternative matrix smoothing processes
    * Nonnegative Matrix Factorization (NMF) (Lee & Seung, 1999),
    * Probabilistic Latent Semantic Indexing (PLSI) (Hofmann, 1999),
    * Iterative Scaling (IS) (Ando, 2000),
    * Kernel Principal Components Analysis (Scholkopf, Smola, Muller, 1997)
    * Latent Dirichlet Allocation (LDA) (Blei et al., 2003), and
    * Discrete Component Analysis (DCA) (Buntine & Jakulin, 2006)
  * tend to be more computationally intensive than truncated SVD, but they
    attempt to model word frequencies better
  * Truncated SVD implicitly assumes that the elements in X have a Gaussian
    _distribution_
    * Minimizing the the Frobenius norm `|X \hat{X}|_F` will minimize the
      noise, if the noise has a Gaussian distribution
    * word frequencies do not have Gaussian distributions. 
    * More recent algorithms are based on more realistic models of the
      distribution for word frequencies [no reference]

## 4.4 Comparing the Vectors 20

* there are many different ways to measure the similarity of two vectors
* cosine
* It is commonly said in IR that, properly normalized, the difference in
  retrieval performance using different measures is insignificant
* Euclidean distance and Manhattan distance
* Distance measures from information theory include
  Hellinger, Bhattacharya, and Kullback-Leibler
* Dice `2xy / (|x|^2 + |y|^2)` and Jaccard coefficients
  Nem tudom, hogy a Jaccard-indexet hogyan általánosítja nem-bool számokra
* Lee (1999): measures that focused more on overlapping coordinates and less on
  the importance of negative features (i.e., coordinates where one word has a
  nonzero value and the other has a zero value) appear to perform better. In
  Lee’s experiments, the Jaccard, Jensen-Shannon, and L1 measures seemed to
  perform best
* Given a word `w_0`, if we use a high/low/similar-frequency sensitive
  measure to score other words according to their similarity with `w_0`, words
  with frequencies higher than/lower than/similar to `w_0` will tend to get
  higher scores. Ezek konvex kombinációja?

## 4.5 Efficient Comparisons 22

### 4.5.1 Sparse-Matrix Multiplication

* first building an inverted index for the [non-zero] coordinates
* In our own experiments of computing the semantic similarity between all pairs
  of words in a large web crawl, we observed
  near linear average running time complexity in `n`

### 4.5.2 Distributed Implementation using MapReduce 23

if ... the matrix X can[not] fit into memory

### 4.5.3 Randomized Algorithms

* Truncated ... SVD can be computationally intensive
* high-dimensional vectors can be randomly projected into a low-dimensional
  subspace with relatively little impact on the final similarity scores
  * especially in applications such as word similarity where
    we are interested in only the top-k most similar vectors to each vector
    (Ravichandran, Pantel, & Hovy, 2005; Gorman & Curran, 2006)
* Random Indexing
  * approximation technique based on Sparse Distributed Memory (Kanerva, 1993)
  * computes the pairwise similarity between all rows (or vectors) of a mx
  * `δ_1` controls the trade-off of accuracy versus efficiency
  * elements of each index vector are mostly zeros
    with a small number of randomly assigned +1’s and −1’s
  * The cosine measure between two rows `r_1` and `r_2` is then approximated by
    computing the cosine between two fingerprint vectors, fingerprint(r_1) and
    fingerprint(r_2), where
    * fingerprint(r) is computed by summing the index vectors of each non-unique
      coordinate of r
  * shown to perform as well as LSA on a word synonym selection task
    (Karlgren & Sahlgren, 2001)
* Locality sensitive hashing (LSH) (Broder, 1997) is another technique that
  approximates the similarity matrix with complexity O(n 2 r δ 2 )
  * map vectors (rows or columns) into short signatures or fingerprints
  * LSH functions include the
    * Min-wise independent function, which
      preserves the Jaccard similarity between vectors (Broder, 1997)
    * functions that preserve the cosine similarity between vectors
      (Charikar, 2002)

## 4.6 Machine Learning

can work directly with the vectors in a VSM,
without requiring an external similarity measure

# 5. Three Open Source VSM Systems

* As a representative of term--document VSMs, we present the Lucene information
  retrieval library
* For word--context VSMs, we explore the Semantic Vectors package, which builds
  on Lucene
* As the representative of pair--pattern VSMs, we review the Latent Relational
  Analysis module in the S-Space package, which also builds on Lucene

# 6. Applications 28

broad survey of applications

# 7. Alternative Approaches to Semantics

* The applications that we list in Section 6 do not necessarily require a VSM
  approach. For each application, there are many other possible approaches.  In
  this section, we briefly consider a few of the main alternatives
* measuring the semantic similarity of
  * documents and queries. The main alternatives to VSMs are prob models, i.e
    * traditional probabilistic retrieval models in information retrieval
      (van Rijsbergen, 1979; Baeza-Yates & Ribeiro-Neto, 1999)
    * statistical language models inspired by information theory
      (Liu & Croft, 2005)
      * by creating [an LM] of the given document and then measuring the
        probability of the given query according to the language model
  * words
    * lexicons, such as WordNet (Resnik, 1995; Jiang & Conrath, 1997; 
      Hirst & St-Onge, 1998; Leacock & Chodrow, 1998; Budanitsky & Hirst, 2001)
    * view the lexicon as a graph, in which nodes correspond to word senses and
    * similarity between two words is [] proportional to the length of the path
  * relations. As with word–context matrices, the main alternatives are
    * lexicons (Rosario & Hearst, 2001; Rosario, Hearst, & Fillmore, 2002;
      Nastase & Szpakowicz, 2003; Veale, 2003, 2004). The idea is to
    * reduce relational similarity to attributional similarity

# 8. The Future of Vector Space Models of Semantics

* criticism: word order
  * Clark and Pulman (2007) assigned distributional meaning to sentences using
    the Hilbert space tensor product
* Widdows and Ferraro (2008), inspired by quantum mechanics, explores several
  operators for modeling composition of meaning
* disjunction, conjunction, and negation can be represented with vectors
  * Widdows (2004) and van Rijsbergen (2004)

# 9. Conclusions 35
