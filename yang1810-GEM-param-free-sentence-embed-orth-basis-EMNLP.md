Ziyi Yang, Chenguang Zhu, Weizhu Chen
GEM: Parameter-free Sentence Embedding via Orthogonal Basis
EMNLP-IJCNLP 2019

# Abstract

* Inspired by the Gram-Schmidt Process we build an orthogonal basis
  of the subspace spanned by a word and its sentence context
* We model the meaning of a word in a sentence based on two aspects
  * relatedness to the word vector subspace already spanned by its context wrds
  * novel semantic meaning introduced as a new basis vector perpendic
* method to combine pre-trained word embeddings into sentence representations
  * based on orthogonal basis
  * zero parameters, along with efficient inference performance
* evaluate our approach on 11 downstream NLP tasks
  * superior performance compared with non-parameterized alternatives
  * competitive to other approaches
    relying on either large amounts of labelled data or prolonged training time

# 1 Intro

* hierarchical nature of human language

## Parameterized sentence embeddings

* SkipThought (Kiros+ 2015) is an encoder-decoder model that
  predicts adjacent sentences
* Sent2Vec, (Pagliardini+ 2018) unsupervised model:
  * n-gram feature in a sentence to predict the center word from the
    surrounding context
* Quick thoughts (QT, Logeswaran and Lee, 2018) replaces the encoder with
  a classifier to predict context sentences from candidate sequences
* à la carte Khodak+ (2018) proposes to learn a linear mapping to
  reconstruct the center word from its context
* sentence encoder InferSent (Conneau+ 2017)
  trained on the Natural Language Inference (NLI) dataset
* Universal Sentence Encoder (Yang+ 2018; Cer+ 2018)
  utilizes transformer (Vaswani+ 2017; Devlin+ 2018)
  * first trained on unsupervised data from Wikipedia & forums, and
    then trained on the Stanford Natural Language Inference (SNLI) dataset
* gated recurrent averaging network (GRAN, Wieting and Gimpel 2017b)
  * trained on Paraphrase Database (PPDB) and English Wikipedia
* multi-task learning framework (Subramanian+ 2018) to sentence embeds
* paraphrastic sentence representations (Wieting+ 2015a)
  * simple average of updated word embeddings

## Non-parameterized sentence embedding

* weighted sum or transformation of word representations (Arora+ 2017) can
  outperform many sophisticated neural network structures in sentence embedding
  * SIF directly includes a hyper-parameter term in its weight scheme
* Ethayarajh (2018) builds upon the random walk model proposed in SIF by
  * probability of word generation inversely related to the angular distance
    between the word and sentence embeddings
* Rücklé+ (2018) concatenates different power mean word embeddings as a
  sentence vector in p-mean
* In this paper, we propose Geometric Embedding (GEM), based entirely on
  * linear combination of the sentence’s word embeddings lies in the subspace
  * each word may bring in a novel orthogonal basis to the existing subspace
  * new basis can be considered as the new semantic meaning brought in by this
    * orthogonal part can indicate the intensity of this new meaning
* QR factorization of the word embedding matrix A
  * QR decomposition: decomposition of a matrix A into a
    product A = QR of an orthogonal matrix Q and an upper triangular matrix R
  * we propose the sliding-window QR factorization method
    to capture the context of a word and characterize its significance therin
  * last step similar as Arora+ (2017) to remove top principal vectors
    * to ensure e.g. stop words, do not bias sentence similarity
    * sentence-specific principal vector removal method, leading to better
      * As we build a new orthogonal basis for each sentence, we propose to

# 2 our sentence embedding algorithm GEM, Approach 2

* We introduce three scores to quantify the importance of a word, as will be
  * novelty score α n measures the portion of the new semantic meaning in a w
  * significance score α s describes the alignment between the new semantic
    meaning and the sentence-level meaning
  * uniqueness score α u examines the uniqueness of the new semantic meaning
    in the corpus level

## 2.1 Quantify New Semantic Meaning

## 2.2 Novelty

## 2.3 Significance

* how semantically aligned a word is to the meaning of its context
* principal meanings in the contextual window = Singular Value Decomposition
* singular values {σ j } nj=1 , denoted by σ(A), represent the importance
* Although α s and α n look alike in mathematics form,
  they model distinct quantities in word w i against its contextual window
  α n is a function of kq i k 2 divided by kw i k 2 ,
  i.e., the portion of the new semantic meaning in word w i . In contrast,
  α s equals kq i k 2 divided by a constant
  i.e. α s quantifies the absolute magnitude of the new semantic meaning q i

## 2.4 Corpus-wise Uniqueness

* Similar to the idea of inverse document frequency (IDF, Sparck Jones, 1972),
* we compute the principal directions of the corpus and then
  measure their alignment with the novel orthogonal basis vector q i

### 2.4.1 Compute Principal Directions of Corpus

### 2.4.2 Uniqueness Score

* we select different principal vectors of X c for each sentence, as different
* the princ comps  are re-ranked in descending order of their correlation
  with sentence matrix S
* Next, the top h principal vectors are selected
* corpus-wise uniqueness score: `α u = exp (−|σ d o* (q i T D)|_2  / h)`

## 2.5 Sentence Vector

* A sentence vector c s is computed as a weighted sum of its word embeddings,
  * weights: a novelty, a significance, and a corpus-wise uniqueness score

### Sentence-Dependent Removal of Principal Components

## 2.6 OOV

* we map OOVs to pretrained in-vocabulary words, based on a hash func-
  tion SHA-256 of its characters

# 3 Experiments 5

## 3.1 Semantic Similarity Tasks: STS Benchmark

* STS Benchmark (Cer+ 2017), a sentence-level semantic similarity

## 3.2 Semantic Similarity Tasks: CQA

* subtask B of the SemEval Community Question Answering (CQA) task, another
* Given an original question Q o and a set of the first ten related questions
  retrieved by a search engine, the model is expected to re-rank the related qs
* Each retrieved question Q i is labelled
  “PerfectMatch”, “Relevant” or “Irrelevant”, with respect to Q o
  Mean average precision (MAP) is used as the evaluation measure
* We encode each question text into a unit vector u
  * but the hits are not normalized?

## 3.3 Supervised tasks

* nine supervised tasks, including
  * seven classification tasks:
    * movie review (MR, Pang and Lee, 2005)
    * Stanford Sentiment Treebank (SST, Socher+ 2013)
    * question-type classification (TREC, Voorhees and Dang, 2003)
    * opinion polarity (MPQA, Wiebe+ 2005)
    * product reviews (CR, Hu and Liu, 2004)
    * subjectivity/objectivity classification (SUBJ, Pang and Lee, 2004) and
    * paraphrase identification (MRPC, Dolan+ 2004)
  * two entailment and semantic relatedness tasks:
    SICK similarity (SICK-R) and the SICK entailment (SICK-E, Marelli+ 2014)
* The sentence embeddings generated are fixed and only the downstream
  task-specific neural structure is learned
  * classification tasks, a linear classifier is trained on top, following
  * relatedness tasks, we follow Tai+ (2015) to train a logistic regression to
* GEM outperforms all other non-parameterized sentence embedding models,
  including SIF, pmean (Rücklé+ 2018), and BOW on GloVe
* compares favorably with most of parameterized models, including
  * à la carte (Khodak+ 2018)
  * FastSent (Hill+ 2016)
  * InferSent, QT, Sent2Vec, SkipThought-LN
    (with layer normalization, Kiros+ 2015)
  * SDAE (Hill+ 2016)
  * STN (Subramanian+ 2018) and
  * USE (Yang+ 2018)

# 4 Discussion 7

## Comparison with Arora+ (2017)

* the weights in GEM are directly computed from the sentences themselves

## Robustness and Effectiveness

## Ablation Study

## Sensitivity to the four hyper-parameters in our model

* window size m in the contextual window matrix, the
* number of candidate principal components K, the
* number of principal components to remove h, and the
* power of the singular value in coarse sentence embedding,
  i.e. the power `t` in `f (σ_j ) = σ_j^t` in Equation (7)
  We sweep the hyper-parameters and test on STSB dev set, SUBJ, and MPQA
  * Unspecified parameters are fixed at m = 7, K = 45, h = 17 and t = 3
  * Figure 2, our model is quite robust with respect to hyperparameters

## Inference speed

# 5 Conclusions

* future work: subwords into the model
* more geometric structures in sentences
