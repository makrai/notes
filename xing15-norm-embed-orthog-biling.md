Chao Xing and Dong Wang and Chao Liu and Yiye Lin
Normalized Word Embedding and Orthogonal Transform
  for Bilingual Word Translation
2015 NAACL

nincs kód

# Abstract

* words [have been translated in Mikolov+ 2013] from one language to another
  by a simple linear transform
* some inconsistence among the
  * objective functions of the embedding and the
    * (maximum likelihood based on inner product),
  * transform learning, as well as the
    * (mean square error)
  * distance measurement
    * cosine
* This paper proposes a solution which
  * normalizes the word vectors on a hypersphere and
  * constrains the linear transform as an orthogonal transform

# 1 Intro

* This paper: To respect the normalization constraint on word vectors, the
  linear transform in the bilingual projection has to be constrained as an
  orthogonal transform

# 2 Related work (Multilingual learning)

* rely on a multilingual lexicon or a word/pharse alignment
  * projection-based approaches
    * embedding is performed for each language individually
    * one or several projections are learned using multilingual data
      * Our method in this paper and
        the linear projection method in (Mikolov et al., 2013b)
      * Faruqui and Dyer (2014)
        * linear transforms that project word vectors of all languages to a
          common low-dimensional space, where 
          the correlation of the multilingual word pairs is maximized with the
          canonical correlation analysis (CCA)
  * regularization-based approaches
    * involve the multilingual constraint in the objective function
    * Zou et al. (2013) adds an extra term that
      * reflects the distances of some pairs of semantically related words from
        different languages
    * Klementiev et al. (2012)
      * casts multilingual learning as a multitask learning and
      * encodes the multilingual information in the interaction matrix
* joint optimization method for word alignments and the embedding
  * Blunsom et al. (2014)
  * A simplified version of this approach
    * proposed in (Hermann and Blunsom, 2014)
    * a sentence is represented by the mean vector of the words involved
    * Multilingual learning is then reduced to maximizing the overall distance
      of the parallel sentences in the training corpus, with the distance
      computed upon the sentence vectors

# 3 Normalized word vectors

* skip-gram model,
  * predict the context words with a word in the central position
* we simply divide a vector by its l-2 norm whenever the vector is updated
  * every n mini-batches

# 4 Orthogonal transform

* We us[e] the cosine distance in the transform learning,
* Orthogonal:
  * [if] the dimensions of the source and target vector spaces are the same,
    * theo
      * the normalization constraint on word vectors can be satisfied by
        constraining W as an orthogonal matrix,
      * A general solver such as SQP can be used
    * approximation
      * Firstly, solve (4) by gradient descendant without constraint
      * After the update, W is orthogonalized by
        * min_{W'} || W-W' || i.e
        * by taking the singular value decomposition (SVD) of W and
          * replacing the singular values to ones
  * else
    * First, we extend the low-dimensional vector space
      * by padding a small tunable constant at the end of the word vectors
    * The vectors are then renormalized

# 5 Experiment

## 5.1 Monolingual word embedding

* data published by the EMNLP 2011 SMT workshop (WMT11)
* we largely follow Mikolov (2013)’s settings
* en -> sp
* data preparation
  * tokenized
  * duplicated sentences were removed
  * numerical expressions were tokenized as ’NUM’, and
  * special characters (such as !?,:) were removed
  * skip-gram
  * model and the text window was set to 5
  * embedding of 169k English and 116k Spanish

## 5.2 Monolingual word similarity

* WordSimilarity-353 Test Collection
  * by (Finkelstein et al., 2002) is used. The dataset involves
  * 154 word pairs
  * mean values of 13 people
* dimension of the vector space varies from 300 to 1000

## 5.3 Bilingual word translation

* train and test
  * 6000 frequent words in English
  * Google’s translation
  * 10-fold cross validation
* 5.3.1 Results with linear transform
  * best dimension setting is 800 for English and 200 for Spanish,
* 5.3.2 Results with orthogonal transform

# 6 Conclusions

* It is unknown if the normalized embedding works on other tasks such as
  relation prediction,
