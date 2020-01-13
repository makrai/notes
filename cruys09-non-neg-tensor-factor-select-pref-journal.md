A non-negative tensor factorization model for selectional preference induction
Tim Van de Cruys
ACL 2009 https://www.aclweb.org/anthology/W09-0211
Natural Language Engineering 2010

# Abstract

* evaluated in a pseudo-disambiguation task. The results [are promising]

# 1 Intro

* situations [with] co-occurrence frequencies of three modes and beyond
  * information retrieval: words × documents × authors
  * NLP
    * words × dependency relations × bag of ... context words, or
    * verbs × subjects × direct objects
* Selectional preferences are
  * useful and versatile resource for
    * syntactic disambiguation (Hindle and Rooth 1993),
    * semantic role labeling (Gildea and Jurafsky 2002), and
    * word sense disambiguation (McCarthy and Carroll 2003)
  * semantic restrictions that the verb imposes on its arguments
* standard models
  * a real number `a`, representing the degree of preference of a
    verb `v` for a class `c` with respect to role `r` (Light and Greiff 2002)
* three modes needed for selectional restrictions:
> (2) The turntable [lemezjátszó] is playing the piano
  * violation is due to the ambiguity of the verb play, and the individual
    preferences (play, SUBJ, turntable) and (play, OBJ, piano) are perfect

# 2 Previous work

## 2.1 selectional preferences and verb clustering in NLP

* early approaches (Basili+ 1992; Grishman and Sterling 1992)
* Resnik (1993, 1996)
  * calculates the selectional preference strength S r(v) [as] the
    Kullback–Leibler divergence between the [synset] distribution of the
    verb p(c | v) and the aggregate class distribution p(c)
* Other notable approaches using WordNet (Abe and Li 1996; Clark and Weir 2001)
* clustering
  * Pereira, Tishby and Lee (1993) [cluster] nouns according to their
    distribution as direct objects among verbs, conditioned on [the clusters]
  * Rooth+ (1999) use an Expectation-Maximization based clustering
    * based on the co-occurrence frequencies [with] subjects and DOs
    * distributional similarity methods [mostly for] textual entailment
      (Bhagat, Pantel and Hovy 2007; Basili+ 2007; and Erk 2007)

# 2.2 factorization algorithms ... used for language processing

### 2.2.1 Two-way factorizations

* SVD [has been used in] image recognition, information retrieval and
  signal processing (Deprettere 1988)
* [LSA] has been criticized for ... the factorization contains negative nums
  * probabilistic latent semantic analysis (Hofmann 1999) and
  * non-negative matrix factorization (Lee and Seung 2000), remedy these

### 2.2.2 Three-way factorizations

* multilinear generalizations of the SVD
  * In statistics, the three-way component analysis
  * for an overview, see Kiers and van Mechelen (2001)
* The two most popular methods are the
  * parallel factor analysis (PARAFAC, Carroll & Chang 1970; Harshman 1970)
  * Tucker decomposition (Tucker 1966)
* applied in various domains, such as psychometry and image recognition
  * In information retrieval, [for] link analysis (Kolda and Bader 2006)
* non-negative tensor factorization (NTF, Shashua and Hazan 2005)
* One of the few papers that has investigated the application ... for NLP is
  Turney (2007), in which a three-mode tensor is used to compute ... sem sim

# 3 Methodology 6

## 3.1 Three-way data

## 3.2 Tensor algebra

* preliminaries based on Kiers (2000) and Kolda and Bader (2009)

# 3.3 Multi-way factorization algorithms 11

* two different (but related) multi-way factorization algorithms
  * parallel factor analysis and
  * non-negative tensor factorization
* overview of multi-way data analysis (Acar & Yener 2009; Kolda & Bader 2009)

### 3.3.1 Parallel factor analysis

* algorithms available to calculate the PARAFAC decomposition
  * alternating least squares (ALS, Carroll and Chang 1970; Harshman 1970)
    * In each iteration, two of the modes are fixed and the third one is fitted

### 3.3.2 Non-negative tensor factorization

* algorithms
  * Bro and Jong (1997) use an alternating least squares algorithm
    * non-negativity can be enforced by using
      * non-negative least squares computation (Lawson and Hanson 1974) or
      * multiplicative update rules (Welling and Weber 2001) similar to the
        update rules for non-negative matrix factorization, explained in 2.2.1
* The algorithm used in this research is a non-negative ALS algorithm
  * implemented in matlab, using the Tensor Toolbox for sparse tensor[s]
    (Bader and Kolda 2009)

# 4 Application 12

## 4.1 three-way selectional preferences

## 4.2 Methodological remarks

* Twente Nieuws Corpus (Ordelman 2002), a .5 B words corpus of Dutch news
* dimension sizes: the 1 k verbs, 10 k subjects, and 10 k direct objects
* The resulting tensor is very sparse, with only .02 percent (1/5,000)
* extension of [positive] pointwise mutual information (Church & Hanks 1990)
  * PPMI ... proves beneficial for similarity (Bullinaria and Levy 2007)
* [rank] varying between 50 and 300

## 4.3 Examples

* example dimensions that have been found by the algorithm with k = 100
  * police arrest suspect, majority support proposal, governemt send troop, etc
* qualitative evaluation indicates that
  * about 44 dimensions contain similar, frame-like semantics
  * In another 43 dimensions, the semantics are less clear-cut (single verbs
    ... account for one dimension, or different senses of a verb get mixed up)
  * Thirteen dimensions [based] rather on ... fixed expressions and pronomina
    * `x play role`
    * practically all of the dimension’s mass is attributed to [this] expr
    * The subject slot is more spread out: ‘fame’, ‘nature’, ‘use’, ‘hygiene’,
      ‘revenge’, ‘shame’, ‘institution’, ‘Culture’, ‘division’ (.04 each)

# 5 Evaluation [in] pseudo-disambiguation task

## 5.1 Evaluation framework

* pseudo-disambiguation task, similar to the one used by Rooth+ (1999)
  * The task is to judge which subject (s or s') and direct object (o or o')
    is more likely for a particular verb v,
    * (s, v, o) is a combination drawn from the corpus, and
    * s' and o' are a subject and direct object randomly drawn from the corpus
    * e.g. youngster/coalition drink beer/share
* Four different models have been evaluated
  * NTF and
  * PARAFAC model, without the non-negativity constraints
  * two matrix factorization models[, NMF and] SVD
    * matrix ... contains the pairwise co-occurrence frequencies of
      verbs by subjects [and] direct objects (1k × 20k)
    * pointwise mutual information

## 5.2 Evaluation results

# 6 conclusions and ... future work

* future work
  1. inclusion of other dependency relations
  2. the tensor factorization model
    * minimization of the Kullback–Leibler divergence
    * Minimizing the sum of squared distance assumes normally distributed data,
      and language phenomena are rarely normally distributed
    * Kullback–Leibler divergence [might capture the structures much better]
    * ld. Van de Cruys+ 13
  3. other problems in NLP, [e.g.] word sense discrimination
