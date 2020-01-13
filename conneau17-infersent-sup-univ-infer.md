Supervised Learning of Universal Sentence Representations
  from Natural Language Inference Data
Alexis Conneau, Douwe Kiela, Loı̈c Barrault, Holger Schwenk, Antoine Bordes
EMNLP 2017, Outstanding Paper Award arXiv:1705.02364v4 [cs.CL] 21 Jul 2017

https://github.com/facebookresearch/InferSent

# Abstract

* we show how
  * universal sentence representations
    * trained using the supervised data of the
      Stanford Natural Language Inference datasets
    * outperform unsupervised methods like SkipThought vectors (Kiros+ 2015)
      on a wide range of transfer tasks
  * like how computer vision uses ImageNet [for] transfer
    * suitability of natural language inference for transfer learning [in] NLP
* encoder is publicly available

# Intro

* existing work on ... learning sentence encoders [is] unsupervised
  * like SkipThought (Kiros+ 2015) or FastSent (Hill+ 2016)
* We compare sentence embeddings trained on various supervised tasks
* we ... compare convolutional, recurrent and even simpler word composition
  * encoder based on a bi-directional LSTM architecture with max pooling,
  * trained on the Stanford Natural Language Inference (SNLI) dataset
    (Bowman+ 2015)
  * state-of-the-art sentence embeddings
    compared to all existing approaches like SkipThought or FastSent,
    * much faster to train

# 2 Related work

* Recent work on generating sentence embeddings
  * [non-neural]
    * Le and Mikolov, 2014
    * Arora+ 2017
      * A simple but tough-to-beat baseline for sentence embeddings
        International Conference on Learning Representations
      * directly learn a classifier on top of unsupervised sentence embeddings
    * Wieting+ 2016
      * Towards universal paraphrastic sentence embeddings
        International Conference on Learning Representations
  * complex neural network architectures
    * SkipThought vectors (Kiros+ 2015) propose an objective function
      * adapts the skip-gram model ... to the sentence level. By
      * encoding a sentence to predict the sentences around it, and using the
      * good performance on 8 transfer tasks. They
      * further ... results using layer-norm regularization (Ba+ 2016)
    * Hill+ (2016)
      * unsupervised + supervised training in
        * machine translation data (using the WMT’14 ...),
        * dictionary definitions and
        * image captioning data from the COCO dataset (Lin+ 2014). These
      * significantly lower results compared to the unsupervised Skip-Thought

# 3 Approach

1. how the NLI task can be used to train universal sentence encoding models
2. architectures that we investigated for the sentence encoder
  * standard recurrent models such as LSTMs and GRUs
    * mean and maxpooling over the [biLSTM] hidden representations
  * self-attentive network that incorporates different views of the sentence;
    Lin+ (2017)
  * hierarchical convolutional network that can be seen as
    * a tree-based method that blends different levels of abstraction

## 3.1 The Natural Language Inference task

* SNLI dataset consists of 570k human-generated English sentence pairs,
  * entailment, contradiction and neutral. It captures
  * natural language inference, also known ... as Recognizing Textual
    Entailment
* Models can be trained on SNLI in two different ways:
  1. separate the encoding of the [two] sentences and
  2. joint methods that allow to use encoding of both sentences (to use
     * cross-features or attention from one sentence to the other)
* Since our goal is to train a generic sentence encoder, we adopt the first
  * matching methods are applied to extract relations between u and v :
    1. concatenation of the two representations (u, v);
    1. element-wise product u ∗ v; and
    1. absolute element-wise difference |u − v|
  * The resulting vector ... is fed into a 3-class classifier consisting of
    multiple fully-connected layers culminating in a softmax layer

## 3.2 Sentence encoder architectures

### 3.2.2 BiLSTM with mean/max pooling

* two ways of combining the varying number of `{h_t}_t` to form a fixed-size
  1. maximum value over each dimension of the hidden units (max pooling)
     (Collobert and Weston, 2008) or by considering the
  2. average of the representations (mean pooling)

### 3.2.4 Hierarchical ConvNet

* One of the currently best performing models on classification tasks is a
  convolutional architecture termed AdaSent (Zhao+ 2015), which
* concatenates ... representations of the sentences at different level
  of abstractions
* we introduce a faster version consisting of 4 convolutional layers

# 4 Evaluation of sentence representations

* 12 transfer tasks
* Adam (Kingma and Ba, 2014) to fit a logistic regression classifier
* Binary and multi-class classification
  * a set of binary classification tasks (see Table 1) that covers various types
    * sentiment analysis (MR, SST)
    * question-type (TREC)
    * product reviews (CR)
    * subjectivity/objectivity (SUBJ) and
    * opinion polarity (MPQA)
  * linear classifier [is] suitable for small datasets,
    where transfer learning is especially well-suited
* Entailment and semantic relatedness
  * SICK dataset for both entailment (SICK-E) and semantic relatedness (SICK-R)
* STS14 Semantic Textual Similarity
  * 6 unsupervised SemEval tasks of STS14 (Agirre+ 2014)
    * news articles, forum discussions, image descriptions and headlines
* Paraphrase detection
  * Microsoft Research Paraphrase Corpus is composed of pairs of
    * sentences ... extracted from news sources on the Web
* Caption-Image retrieval
  * The goal is either to rank a large collection of
    * images by their relevance with respect to a ... caption (Image Retrieval),
    * captions by their relevance for a given query image (Caption Retrieval). We
  * pairwise rankingloss L cir (x, y):

# 5 Empirical results

* The BiLSTM-4096 with the max-pooling operation performs best
  on both SNLI and transfer tasks
  * better performance on the training task does not necessarily translate in
    better results on the transfer tasks [e.g.] inner-attention and BiLSTM-Mean
* optimization algorithm:
  * when training with Adam instead of SGD, we observed that the BiLSTM-max
    * converged faster on SNLI (5 epochs instead of 10), but obtained
    * worse results on the transfer tasks

## Embedding size

* increased embedding sizes lead to increased performance for almost all models
  * Since it is easier to linearly separate in high dimension,
    * especially with logistic regression
  * particularly true for some models (BiLSTM-Max, HConvNet, inner-att), 
    *  unequal abilities to incorporate more information as the size grows

## Comparison with SkipThought

* We train our model in less than a day on a single GPU
  * compared to the best SkipThought-LN network trained for a month

## MultiGenre NLI

* On semantic textual similarity STS14, we are also competitive with PPDB based
  paragram-phrase embeddings

# Appendix Max-pooling visualization for BiLSTM-max trained and untrained
