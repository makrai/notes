Bin Wang, C.-C. Jay Kuo
SBERT-WK: A Sentence Embedding Method by Dissecting BERT-based Word Models
arXiv:2002.06652 cs.CL

https://github.com/BinWang28/SBERT-WK-Sentence-Embedding

# Abstract

* generate a high quality sentence representation from BERT-based word models
* different layers of BERT capture different linguistic properties
* fusion information across layers to find better sentence representation
* we study the layer-wise pattern of the word representation of deep contextlzd
  * dissecting BERT-based word models through geometric analysis of the space
  * No further training is required in SBERT-WK
* evaluate SBERT-WK on semantic textual similarity and downstream supervised tsk
* ten sentence-level probing tasks are presented for detailed linguistics

# 1 Introduction

* As reported in [8] and [9], different layers of BERT learns different levels
  * intermediate layers encode the most transferable features
  * higher layers are more expressive in high-level semantic information
  * information fusion across layers has its potential
* we experiment on patterns of the isolated word representation across layers
  * Words of richer information have higher variation in their repr, while
  * the token representation changes gradually, across layers
  * This finding helps define
    “salient” word representations and informative words for sentence embed
* sentence embedding method, which transforms a sentence to a vector
  * a common approach based on BERT-based models is to average the
    representations obtained from the last layer or using the CLS token
    * both are sub-optimal as shown in the experimental section of this paper
  * sentence embedding using pre-trained BERT, Sentence-BERT (Reimers & G 19)
    * leverages further training with high-quality labeled sentence pairs
  * unsupervised learning of sentence encoders
    * SkipThought [12] and FastSent [13]
    * self-supervision from a large unlabeled corpus
  * supervision: InferSent [14] shows that training on high quality labels
    can consistently outperform unsupervised training objectives
    * e.g., the Stanford Natural Language Inference (SNLI) dataset
  * USE [15] incorporates both supervised and unsupervised training objectives
    on the Transformer architecture
  * [16]: multi-tasking training to combine inductive biases of diverse objectvs
  * multi-tasking learning for sentence embedding is still under development,
    * selecting supervised tasks and handling interactions between them
* we investigate sentence embedding by studying the geometric structure of deep
  * new method by dissecting BERT-based word models
  * inherits the strength of deep contextualized models
  * compatible with BERT [5] and SBERT [11]
* contributions
  * evolution of isolated word representation patterns across layers
    * highly correlated with word’s content
  * eight downstream tasks and seven semantic textual similarity tasks, and
    * SOTA performance
  * sentence-level probing tasks

# 2 Related work

## A. Contextualized Word Embedding

* ELMo [4], GPT1 [7], GPT2 [17] and BERT [5] are pre-trained deep neural LMs
  * BERT-based models are dominating in leaderboards of language understanding
    tasks such as SQuAD2.0 [18] and GLUE benchmarks [10]
  * ELMo is one of the earlier work to downstream tasks [4]. It employs
    * two layer bi-directional LSTM and
      fuses features from all LSTM outputs using task-specific weights
  * OpenAI GPT [7] incorporates a fine-tuning process when it is applied to
    downstream tasks

## B. Universal Sentence Embedding

* Non-parameterized methods usually rely on high quality pretrained word embeds
  * average word embedding results as the representation for a sentence
  * weighted averaging methods were proposed,
    including tf-idf, SIF [27], uSIF [28] and GEM [29]
    * SIF uses the random walk to model the sentence generation process and
      derives word weights using the maximum likelihood estimation (MLE)
    * uSIF extends SIF by introducing an angular-distance-based random walk
      * No hyper-parameter tuning is needed
      * [28] K. Ethayarajh,
        “Unsupervised random walk sentence embeddings: A strong but simple bl”
        Representation Learning for NLP, 2018
    * GEM: weights from exploiting geometric analysis of the word space
      with several hand-crafted measurements
      * p-mean [30] to concatenate the power means of word embeddings and
        fuses different word embedding models
      * [29] Z. Yang, C. Zhu, and W. Chen,
        “Parameter-free sentence embedding via orthogonal basis,”
        EMNLP-IJCNLP 2019
* Parameterized models are more complex, and they usualy perform better
  * skipthought sentence encoder [12]
    * extends the unsupervised training of word2vec [1] to the sentence level
    * adopts the encoder-decoder architecture
  * InferSent [14] employs bi-directional LSTM with supervised training
    * model trained to predict the entailment or contradiction of sentence pairs
      with the Stanford Natural Language Inference (SNLI) dataset
    * better results than methods with unsupervised learning
  * USE (Universal Sentence Encoder) method [15] extends the InferSent model by
    * Transformer architecture with unsupervised as well as supervised training
  * multiple objectives in sentence embedding can provide better [16, 31]
  * SBERT method [11]: the only parameterized sentence embedding model on BERT
    * similar to InferSent [14]. It uses the Siamese network on top of BERT
    * fine-tunes it based on high quality sentence inference data (e.g. SNLI)
    * no clear objective function
* we combine the advantage of both parameterized and non-parameterized methods
  SBERT-WK is computed by subspace analysis of the manifold learned by the
  parameterized BERT-based models

## C. Subspace Learning and Analysis

* latent variable representation methods such as
  * Principal Component Analysis (PCA)
  * Singular Spectrum Analysis (SSA)
  * Independent Component Analysis (ICA) and
  * Canonical Correlation Analysis (CCA).  Subspace analysis has solid
  * to explain the internal states of Deep Neural Networks [32], [33], [34]
* in post-processing and evaluation of word embeddings [37], [38], [39]
* subspace analysis in sentence embedding
  * SCDV [40] determines the sentence/document vector
    by splitting words into clusters and analyzing them accordingly
  * GEM [29] models the sentence generation process as a Gram-Schmidt procedure
    and expands the subspace formed by word vectors gradually
  * DCT [41] and EigenSent [42] map a sentence matrix into the spectral space
    and model the high-order dynamics of a sentence from a signal processing
    perspective
  * so far on static word embedding methods
* we: subspace analysis to find generic sentence embeddings
  based on deep contextualized word models
  * SBERT-WK can consistently outperform SOTA methods with low compute
    and good interpretability, which is attributed to
    high transparency and efficiency of subspace analysis

# 3 Evolution of word representation patterns in deep contextualized models

# 4 SBERT-WK method

two steps

## A. from layers, Determine a unified word representation for each word

by examining their alignment and novelty properties

## B. word importance for weighted average of unified word representations

## C. Computational Complexity

# 5 Evaluation

* goal is to obtain a general purpose sentence embedding method, we evaluate on
  * Semantic textual similarity tasks
    * relevant for clustering and information retrieval via semantic search
  * Supervised downstream tasks.  They measure embedding’s transfer capability
    * including entailment and sentiment classification
  * Probing tasks to measure the linguistic features and provide fine-grained
* SentEval toolkit [44] is used in all experiments
* SBERTWK method can be built upon BERT, SBERT, RoBERTa and XLNET
  * Here, we evaluate it on top of two models: SBERT and XLNET
  * XLNET pre-trained model obtained from the Transformer Repo
  * We adopt their base models that contain 12 self-attention layers
* we compare SBERT-WK with the following 10 different methods,
  * including parameterized and non-parameterized models
  1. Average of GloVe word embeddings;
  2. Average of FastText word embedding;
  3. Average the last layer token representations of BERT;
  4. [CLS] embedding from BERT, originally used for next sentence prediction
  5. SIF model [27], which is a non-parameterized model
    * a strong baseline in textual similarity tasks;
  6. p-mean model [30] that incorporate multiple word embedding models;
  7. Skip-Thought [12];
  8. InferSent [27] with both GloVe and FastText versions;
  9. Universal Sentence Encoder [15], a strong parameterized sentence embedding
     using multiple objectives and transformer architecture;
  10. Sentence-BERT, which is a SOTA sentence embedding model
    * Siamese network over BERT

# 6 Concluding remarks and future work directions

* future research topics
  * subspace analysis in the deep contextualized models
    to regulate the training or fine-tuning process
  * understand deep contextualized neural models through subspace analysis
    * Theoretical analysis could be the key in revealing the myth
