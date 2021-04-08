Sascha Rothe, Sebastian Ebert, and Hinrich Schütze
Ultradense Word Embeddings by Orthogonal Transformation
2016 NAACL (az ACL-es hivatkozik erre )

* output lexicons available at www.cis.lmu.de/~sascha/Ultradense/
* implementation by someone else: https://github.com/joemzhao/ultradensifier

# Abstract

* we introduce Densifier, a method that learns an
  * orthogonal transformation of the embedding space that
    focuses the information relevant for a task in an ultradense subspace
    * dimensionality is smaller by a factor of 100
* state of the art on a
  * lexicon creation task in which
  * words are annotated with three types of lexical information
    * sentiment, concreteness and frequency
  * SemEval2015 10B sentiment analysis task
    * no information is lost when the ultradense subspace is used, but
    * training is an order of magnitude more efficient

# 1 Introduction

* Embeddings are useful for sentiment analysis
  * Kim (2014), Kalchbrenner+ (2014), Severyn and Moschitti (2015), Ebert+(2015)
* Orthogonal transformations reorder the space without adding or removing info
* evaluation in two text polarity classification tasks
  (SemEval2015 Task 10B, Czech movie reviews)
* we create high-coverage lexicons with up to 3 million words
  * sentiment, concreteness and frequency
  * five languages: Czech, English, French, German and Spanish
  * two domains, Twitter and News, in a domain adaptation setup
* The main advantages of this method of lexicon creation are:
  * We need a training lexicon of only a few hundred words
  * extensible to phrase embeddings (Yu and Dredze, 2015) and
    sentence embeddings (Kiros+ 2015)
  * the output lexicon is continuous and potentially more informative
* we beat the SOTA on SemEval2015 Task 10E (determining association strength)
* make embeddings more interpretable
* first step towards a general decomposition

# 2 Model

# 3 Lexicon Creation

* resources used in this paper cover five languages and three domains
  * the FrWac embeddings for French(http://fauconnier.github.io/)
* lexicon resources for
  * sentiment:
    * SubLex 1.0 (Veselovská and Bojar, 2013) for Czech
    * WHM for English [the combination of MPQA (Wilson+ 2005), Opinion Lexicon
      (Hu and Liu, 2004) and NRC Emotion lexicons (Mohammad and Turney, 2013)]
    * FEEL (Abdaoui+ 2014) for French
    * German Polarity Clues (Waltinger, 2010) for German
    * and the sentiment lexicon of Pérez-Rosas+ (2012) for Spanish
  * concreteness, we use BWK, a lexicon of 40,000 English words (Brysbaert+ 14)
  * frequency, we exploit word2vec
* we intersect the vocabulary of l with the top 80,000 words of E
  to filter out noisy, infrequent words that tend to have low quality embeds

abstract: fundamental, obvious, legitimate, reasonable, optimistic, satisfied
concrete: tree, truck, kitchen, dog, bike, bat, garden, homer, bed, gallon

# 4 Evaluation

## 4.1 Top-Ranked Words

## 4.2 Quality of Predictions

* size of the lexicon resource has no big effect
  * results for Spanish (small resource) and French (large) are about the same
* word embeddings represent sentiment and concreteness much better than freq
  * reason for this likely is  modeling the context
  * Infrequent words can occur in frequent contexts

## 4.3 Determining Association Strength

## 4.4 Text Polarity Classification

# 5 Parameter Analysis

## 5.1 Size of Subspace

* sentiment
  * for lexicon creation: a single dimension is sufficient
  * for other sentiment tasks more dimensions may be needed,
    e.g.,  different emotional dimensions of polarity: fear, sadness, anger etc
* directly train low-dimensional word2vec embeddings?
  * does not work very well

## 5.2 Size of Training Resource

* small training resource of 300 entries is sufficient for high performance

# 6 Related Work on postprocessing word embeddings

* Faruqui+ (2015) perform postprocessing based on a semantic lexicon
  * good for word similarity
  * bad for syntactic relations
* In a tensor framework, Rothe and Schütze (2015) transform the word embeddings
  to sense (synset) embeddings
* Xing+ (2015) restricted the work of Mikolov+ (2013 ling regu) to an orthogonl
* our method is also related to Oriented PCA (Diamantaras and Kung, 1996)
  * a solution for Oriented PCA is not orthogonal
* extending manually labeled sentiment lexicons
  (Turney, 2002; Kiritchenko+ 2014)
  * Heerschop+ (2011) used WordNet together with a PageRank-based algorithm
  * Scheible (2010): a semi-automatic approach based on machine translation
  * The winning system of SemEval2015 10E (Amir+ 2015) was
    based on structured skipgram embeddings with 600 dimensions and
    support vector regression with RBF kernels
  * Hamdan+ (2015), the second ranked team, used the average of six sentiment
    lexicons as a final sentiment score
* Tang+ (2014b) train sentiment specific embeddings
  by extending Collobert & Weston’s model and Tang+ (2014a)’s skip-gram model
