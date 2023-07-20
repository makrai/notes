Kazuma Hashimoto and Yoshimasa Tsuruoka
Learning embeddings for transitive verb disambiguation by implicit tensor factr
3rd Workshop on Continuous Vector Space Models and their Compositionality 2015

# Abstract

* directly models the interaction between predicates and their two arguments,
  and learns verb phrase embeddings
  * By representing transitive verbs as matrices
  * captures multiple meanings of transitive verbs and disambiguates them
    taking their arguments into account
* We evaluate our method on
  * a widely-used verb disambiguation task and our method outperforms prev SOTA
  * three phrase similarity tasks
* adjuncts provide useful information in learning the meanings of verb phrases

# 1 Intro

* representing the meaning of transitive verb phrases
  (Grefenstette and Sadrzadeh, 2011; Grefenstette+ 2013; Kartsaklis+ 2012)
* The meaning of a transitive verb is often disambiguated by its arguments,
* capturing the meanings of transitive verb phrases is useful in
  * semantic retrieval (Miyao+ 2006) and
  * question answering (Who did What to Whom?; Srihari and Li, 2000)
* approaches to representing transitive verb phrases in a vector space
  * tensor calculus
    (Grefenstette and Sadrzadeh, 2011; Kartsaklis+ 2012; Van de Cruys+ 2013)
  * neural networks
    * Hashimoto+ 2014
    * Muraoka+ 2014
    * Tsubaki+ 2013
    Masashi Tsubaki, Kevin Duh, Masashi Shimbo, and Yuji Matsumoto
    Modeling and Learning Semantic Co-Compositionality
      through Prototype Projections and Neural Networks
    EMNLP 2013
  * To bridge the gap between the two approaches, we present an
    implicit tensor factorization method
    * We then implicitly factorize the tensor into
      one predicate tensor and two argument matrices
    * motivated by the recently proposed implicit matrix factorization methods
      for learning word embeddings (Levy and Goldberg, 2014; Mikolov+ 2013)
* We evaluate our method using a widely-used verb disambiguation task and
  three phrase similarity tasks
  * disambiguation dataset provided by Grefenstette and Sadrzadeh (2011), we
    * Spearman’s rank correlation score of 0.614, which is
    * significantly higher than the state of the art (0.456)

# 2 Method 2

* adjuncts, e.g. _An importer makes payment in his own domestic currency_
  * If we further observe the verb phrase “pay money” with a similar adjunct
  * In disambiguation, strong interactions between transitive verbs and
    their arguments are desirable as with the method in Tsubaki+ (2013)
* p3 To model the co-occurrence statistics we follow Van de Cruys+ (2013)
  * our method can treat phrases as the arguments
* plausibility judgment task
  * i.e. score of observed has to be greater than that of random

## 2.1 Transitive Verb Phrases with Adjuncts

* To compute argument embeddings composed by subject-verb-object tuples, we
  use the copy-subject function in Kartsaklis+ (2012)

## 2.2 Relationship to Previous Work

* Representing transitive verbs with matrices
  * proposed by
    * Grefenstette and Sadrzadeh 11
    * Kartsaklis+ 12
    * Milajevs+ EMNLP 14
    D Milajevs, D Kartsaklis, M Sadrzadeh, and M Purver
    Evaluating Neural Word Representations in Tensor-Based Compositional Settin
    * Polajnar+ 14
    Tamara Polajnar, Laura Rimell, and Stephen Clark
    Using Sentence Plausibility to Learn the Semantics of Transitive Verbs
    Workshop on Learning Semantics at NIPS 2014
* which pre-trained word embeddings are suitable for each method or task
  (Milajevs+ 2014)

# 3 Experimental Settings

## 3.3 Baseline method

* PAS-CLBLM in Hashimoto+ (2014)
  * a word predication model using predicate-argument structures
  * SOTA on transitive verb phrase similarity tasks
  * We selected the Wadd nl function in PAS-CLBLM

                 `tanh(w_s ⊙ s(j) + w_v ⊙ v(i) + w_o ⊙ o(k))`

    where w_s, w_v, w_o ∈ R^{d×1} are the weight vectors for composition
    and s(j), v(i), o(k) ∈ R^{d×1} are the embeddings

# 4 Results and Discussion 6

* in our method, d = 50

## 4.1 Evaluation on Transitive Verb Tasks

### 4.1.1 Evaluation Settings

* We evaluated the learned embeddings of transitive verbs using
  * a transitive verb _disambiguation_ task and
  * 3 tasks for the semantic _similarity_ between transitive verb phrases

#### Transitive verb disambiguation 7

* The first dataset GS’11 is provided by Grefenstette and Sadrzadeh (2011)
  * each verb pair takes the same subject and object
  * has an aspect of a verb sense disambiguation task
  * As discussed in previous work
    (Kartsaklis and Sadrzadeh, 2013; Milajevs+ 2014; Polajnar+ 2014), GS’11
  * For example, the transitive verb “run” is known as polysemous: operate/move
    * “run” and “operate” are similar when subj = “people” and obj = “company”
    * In the same context, not similar to “move”

#### Transitive verb phrase similarity

* The other datasets are
  * ML’10 provided by Mitchell and Lapata (2010),
    * pairs of verb-object phrases and
  * KS’13 provided by Kartsaklis and Sadrzadeh (2013)
    * complements ML’10 by incorporating an appropriate subject for each VO
  * KS’14 provided by Kartsaklis and Sadrzadeh (2014)
    * reannotated version of KS’13 using a cloud sourcing service
* require one to capture the topical similarity
  rather than the disambiguation aspect (Polajnar+ 2014)

### 4.1.2 Result Overview 7

### 4.1.3 Disambiguation Task 8

* weighed addition composition functions put more weight on head words
  (Hashimoto+ 2014; Muraoka+ 2014; Socher+ 2013)

### 4.1.4 Phrase Similarity Task

* Milajevs+ (2014) and Polajnar+ (2014) [achieve much better correlation
  scores using element-wise vector addition] than other tensor-based
  complex composition functions

## 4.2 Qualitative Evaluation on Verb Matrices 9

# 5 Related Work 9

* representing transitive verb phrases using word embeddings
  * Grefenstette and Sadrzadeh, 2011; Hashimoto+ 2014; Kartsaklis+ 2012;
    Tsubaki+ 2013
* Grefenstette and Sadrzadeh (2011) presented a method for
  calculating a verb matrix using pre-trained word embeddings of its args
  * then composition functions for the verb matrices and the noun embeds
  * Their approach has been followed by some recent studies
    * Kartsaklis+ 2012
    * Milajevs+ 2014
    * Polajnar+ 2014
    * Van de Cruys+ 2013

# 6 Conclusion and Future Work 9

# Bib 10

* Dimitri Kartsaklis and Mehrnoosh Sadrzadeh
  Prior Disambiguation of Word Tensors for Constructing Sentence Vectors
  EMNLP 2013
* Dimitri Kartsaklis and Mehrnoosh Sadrzadeh
  A Study of Entanglement in a Categorical Framework of Natural Language
  11th Workshop on Quantum Physics and Logic (QPL) 2014
* Dimitri Kartsaklis, Mehrnoosh Sadrzadeh, and Stephen Pulman
  A Unified Sentence Space for Categorical Distributional-Compositional Sem
  COLING 2012
* R Socher, EH Huang, Jeffrey Pennin, Christopher D Manning, and Andrew Y. Ng
  Dynamic Pooling and Unfolding Recursive Autoencoders for Paraphrase Detection
  NIPS 2011
