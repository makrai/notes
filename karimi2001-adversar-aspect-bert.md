Adversarial Training for Aspect-Based Sentiment Analysis with BERT
Akbar Karimi; Leonardo Rossi; Andrea Prati
ICPR 2020 25th International Conference on Pattern Recognition

code is publicly available on a GitHub repository at
https://github.com/IMPLabUniPr/Adversarial-Training-for-ABSA.  Published in:

# Abstract

* adversarial process is carried out in the embedding space. Although these
* we fine-tune the general purpose BERT and domain specific post-trained BERT
  (BERT-PT) using adversarial training. After
  * improving the results of post-trained BERT with different hyperparameters,
* novel architecture called BERT Adversarial Training (BAT) to utilize
  * for the two major tasks of Aspect Extraction and Aspect Sentiment Classif
* outperforms the general BERT as well as the in-domain post-trained BERT in
* the number of training epochs and dropout values can have significant impacts
* the first study on the application of adversarial training in ABSA. The

# I. Introduction

* Aspect-Based Sentiment Analysis (ABSA) is a branch of sentiment analysis which
  * Traditional machine learning methods eg Support Vector Machines (SVM) [3],
    Naive Bayes [4], Decision Trees [5], Maximum Entropy [6]
  * deep learning methods such as
    * Convolutional Neural Nets (CNNs) [7], [8], [9],
    * Recurrent Neural Networks (RNNs) [10], [11], [12], and the
    * Transformer [13] have outperformed the traditional machine learning
  * Bidirectional Encoder Representations from Transformers (BERT) [14] is a
    * SOTA performances on the GLUE benchmark [15] including text classif. It
    * [2]: adding domain-specific information to this model can enhance its
      performance in ABSA. Using their post-trained BERT (BERT-PT), we add
      adversarial examples to further improve BERT’s performance on Aspect
      Extraction (AE) and Aspect Sentiment Classification (ASC) which are two
    * [2] H. Xu, B. Liu, L. Shu, and S. Y. Philip,
      Bert post-training for review reading comprehension and aspect-based senti
      NAACL-HLT 2019 Volume 1 (Long and Short Papers), 2019, pp. 2324–2335.
* Adversarial examples are a way of fooling a neural network [16]. They are
  * created by applying small perturbations to the original inputs. In the case
  * images, the perturbations can be invisible to human eye, but can cause
  * introducing them to the network during the training can improve them. This
    * “adversarial training” which acts as a regularizer to help the network [1]
  * discrete nature of text, it is not feasible to produce perturbed examples
    * [17] apply this technique to the word embedding space for text classif
      [17] T. Miyato, A. M. Dai, and I. Goodfellow,
      “Adversarial training methods for semi-supervised text classification,”
      arXiv preprint arXiv:1605.07725, 2016
  * Inspired by them and building on the work of [2], we experiment with
    adversarial training for ABSA.

# II. Related Work

* we review some of the works which have utilized deep learning techniques.
* [21] design a seven-layer CNN architecture and make use of both POS tagging
  and word embeddings as features
* In [22], convolutional neural networks and domain-specific data are utilized
  for AE and ASC. They show that adding the word embeddings produced from the
  domainspecific data to the general purpose embeddings semantically enriches
  them regarding the task at hand. In a recent work
* [2] show that using in-domain data can enhance the performance of the SOTA
  language model (BERT).  Similarly,
* [23] also fine-tune BERT on domainspecific data for ASC. They perform a
  two-stage process, first of which is self-supervised in-domain fine-tuning,
  followed by supervised task-specific fine-tuning. Working on the same task,
* [24] apply graph convolutional networks
  * assumption: in sentences with multiple aspects, the sentiment about one
    aspect can help determine the sentiment of another aspect.
* attention has become widely popular in many NLP tasks including sentiment
  * [26] design a network to transfer aspect knowledge learned
    from a coarse-grained network which performs aspect category sentiment
    classification
    to a fine-grained one performing aspect-level sentiment classification. This
    * attention mechanism (Coarse2Fine) which contains an autoencoder that
      emphasizes the aspect term by learning its representation from the
      category embedding.  Similar to the Transformer, which does away with RNNs
* [27] design an attention model for ASC with the difference that they use
  lighter (weight-wise) multi-head attentions for context and target word
  modeling.
* bidirectional LSTMs [28], [29] propose
  * Truncated History Attention (THA) that takes into account the history of
    aspects with an attention block
  * To capture the opinion summary, they also introduce Selective Transformation
    Network (STN) which highlights more important information with respect to a
    given aspect
* In [30], aspect extraction task is approached in an unsupervised way.
  Functioning the same way as an autoencoder, their model has been designed to
  reconstruct sentence embeddings in which aspect-related words are given higher
  weights through attention mechanism.
* adversarial training has been utilized for
  * sentence classification [17], [31], its effects have
  * not been studied in ABSA. Therefore, in this work, we study the impact of

# III. Aspect-Based Sentiment Analysis Tasks

* two major tasks in ABSA which are called
  Aspect Extraction (AE) and Aspect Sentiment Classification (ASC).
* These tasks were sub-tasks of task 4 in SemEval 2014 contest [32], and since

## Aspect Extraction

* Given a collection of review sentences, the
  goal is to extract all the terms, such as “waiter”, “food”, and “price” in the
  * aspects point to aspects of a larger entity [32]. In order to perform this
* usually modeled as a sequence labeling task, BIO
  * sequence (s) of n words is repred as [CLS], w 1 , w 2 , ..., w n , [SEP ]
  * the [CLS] token is an indicator of the beginning of the sequence as well as
    its sentiment when performing sentiment classification. The [SEP ] token is
  * vector representation of the size 768, size of BERT’s hidden layers, is
  * Then, we apply a fully connected layer to classify each word vector

## Aspect Sentiment Classification. Given the aspects with the review sentence,

* classify the sentiment towards each aspect as Positive, Negative, Neutral. In
* the input format for the BERT model is the same as in AE.
* The [CLS] token in the input representation (Figure 1) of the BERT is where
  the sentiment is encoded: in the last layer the sentiment is extracted from
  this token by applying a fully connected layer to its encoding.
* Input sequences can have multiple targets and aspects, meaning that a sequence
  * preprocessing step: Sequences with multiple aspects are repeated as many

# IV. Model 2

# V. Experimental Setup 3

# VI. Experiments 4

# VII. Conclusion 6

* future work, other white-box adversarialattacks as well as black-box ones
  for various sentiment analysis tasks. Furthermore, the impact of
* adversarial training in the other tasks in ABSA
  i.e. Aspect Category Detection and Aspect Category Polarity
