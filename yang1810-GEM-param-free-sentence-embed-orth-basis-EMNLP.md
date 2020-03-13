Ziyi Yang, Chenguang Zhu, Weizhu Chen
GEM: Parameter-free Sentence Embedding via Orthogonal Basis
EMNLP-IJCNLP 2019

# Abstract

* Inspired by the Gram-Schmidt Process we build an orthogonal basis
  of the subspace spanned by a word and its [sentence] context
* We model the meaning of a word in a sentence based on two aspects
  * relatedness to the word vector subspace already spanned by its context wrds
  * novel semantic meaning ... introduced as a new basis vector perpendic
* method  to combine pre-trained word embeddings into sentence representations
  * based on orthogonal basis
  * zero parameters, along with efficient inference performance
* evaluate our approach on 11 downstream NLP tasks
  * superior performance compared with non-parameterized alternatives
  * competitive to other approaches
    relying on either large amounts of labelled data or prolonged training time

# 1 Intro

* hierarchical nature of human language

##Parameterized sentence embeddings

* SkipThought (Kiros+ 2015) is an encoder-decoder model that 
  predicts adjacent sentences
* Sent2Vec, (Pagliardini+ 2018) unsupervised model:
  * n-gram feature in a sentence to predict the center word from the
    surrounding context
* Quick thoughts (QT) (Logeswaran and Lee, 2018) replaces the encoder with
  a classifier to predict context sentences from candidate sequences
* à la carte Khodak+ (2018) proposes to learn a linear mapping to
  reconstruct the center word from its context
* sentence encoder InferSent (Conneau+ 2017)
  [trained on the] Natural Language Inference (NLI) dataset
* Universal Sentence Encoder (Yang+ 2018; Cer+ 2018)
  utilizes [transformer] (Vaswani+ 2017; Devlin+ 2018)
  * first trained on ... unsupervised data from Wikipedia & forums, and
    then trained on the Stanford Natural Language Inference (SNLI) dataset
* gated recurrent averaging network (GRAN, Wieting and Gimpel 2017b)
  * trained on Paraphrase Database (PPDB) and English Wikipedia
* multi-task learning framework (Subramanian+ 2018) to ... sentence embeds
* paraphrastic sentence representations (Wieting+ 2015a)
  * simple average of updated word embeddings

##Non-parameterized sentence embedding

* weighted sum or transformation of word representations (Arora+ 2017) can
  outperform many sophisticated neural network structures in sentence embedding
* Ethayarajh (2018) builds upon the random walk model proposed in SIF by
  * probability of word generation inversely related to the angular distance
    between the word and sentence embeddings
* Rücklé+ (2018) concatenates different power mean word embeddings as a
  sentence vector in p-mean
* In this paper, we propose ... Geometric Embedding (GEM), based entirely on
  * linear combination of the sentence’s word embeddings lies in the subspace
  * each word may bring in a novel orthogonal basis to the existing subspace
  * new basis can be considered as the new semantic meaning brought in by this
    * [orthogonal part] can indicate the intensity of this new meaning
* QR factorization of the word embedding matrix A
  * QR decomposition: decomposition of a matrix A into a
    product A = QR of an orthogonal matrix Q and an upper triangular matrix R
  * we propose the sliding-window QR factorization method
    to capture the context of a word and characterize its significance [ther]in
  * last step [ similar ] as Arora+ (2017) to remove top principal vectors
    * to ensure ... e.g. stop words, do not bias sentence similarity
    * sentence-specific principal vector removal method, leading to better
      * As we build a new orthogonal basis for each sentence, we propose to

# 2 our sentence embedding algorithm GEM

# 3 and 4 evaluate our model on various tasks in

# 5 summarize our work in
