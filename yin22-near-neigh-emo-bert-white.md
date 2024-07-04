Efficient Nearest Neighbor Emotion Classification with BERT-whitening
Wenbiao Yin, Lin Shang
EMNLP 2022

# Abstract

* Retrieval-based methods have been proven effective in many NLP tasks. Previous
  * direct sim search with representations from the pre-trained model for
  * hE sentence representations from the pre-trained model like BERT perform
    poorly in retrieving semantically similar sentences, resulting in poor
* we propose kNN-EC, a simple and efficient non-parametric emotion classif (EC)
  * nearest neighbor retrieval. We use BERT-whitening to get better sentenc sem
  * BERT-whitening can also reduce memory  storage of datastore (>10x) and
    accelerate retrieval speed
  * kNN-EC average improves the pre-trained model by 1.17 F1-macro
    on the GoEmotions and the ISEAR emotion classification datasets

# Introduction

* Retrieval-based methods enhance model performance by
  * extracting textual information related to the input from large training
    data
  * interpolates the original model distribution and retrieved results’
    distribution as the final distribution for output
  * ie related knowledge not present in the input (Wang+ 2022)
  * applied to many tasks such as
    * language modeling (Khandelwal+ 2019; Guu+ 2020),
    * machine translation
     (Gu+ 2018; Bapna and Firat, 2019; Khandelwal+ 2020; Zheng+ 2021),
    * question answering (Chen+ 2017; Lee+ 2019), and
    * computer vision (Devlin+ 2015; Gur+ 2021)
  * expressive, adaptable, and interpretable. Here,
* we propose KNNEC
  * a simple and efficient non-parametric emotion classification (EC) method
    using nearest neighbor retrieval. KNN-EC
  * can be added to any pre-trained emotion classification model without
    further training. Pre-trained models such as BERT (Devlin et al., 2019),
* pre-trained models always induced a non-smooth anisotropic semantic space of
  sentences, which harmed its performance of semantic similarity. To address
  * Gao+ (2018) designed a novel way to mitigate the degeneration problem by
    regularizing the word embedding matrix
  * Li+ (2020) proposed to transform the BERT sentence embedding distribution
    into a smooth and isotropic Gaussian distribution through normalizing flow,
    an invertible function parameterized by the neural net- work
  * these methods require addi- tional parameters added to the neural network,
* we use BERT-whitening (Su+ 2021), a simple linear transformation for isotropy
  * competitive results. The details of BERT-whitening are described in Sec 2.2
* experiments on two emotion clas- sification datasets
  * KNN-EC can achieve 1.21- 1.65/0.28-1.44 F1-macro scores improvements over
    pre-trained models on GoEmotions/ISEAR. Mean- while, by adding the
  * BERT-whitening, our ap- proach can further boost the model performance,
    optimize memory storage and accelerate retrieval speed

# 2 Background

## 2.2 BERT-whitening

### 2.2.1 Whitening Transformation

### 2.2.2 Dimension Reduction

# 4 Experiment

## 4.3 Overall Results

* pkNN with BERT-whitening is always better than pModel . It is a fascinating
  * why is the non-parametric method using nearest neighbor retrieval better
    than the well-trained linear classifier?
  * Because BERT induces a non-smooth anisotropic semantic space of sentences,
  * BERTwhitening can boost the isotropy of sentence distribution
* KNN-EC average improves the pre-trained models by 1.17 F1-macro on two
  emotion classification datasets. KNN-EC can achieve 1.211.65/0.28-1.44
  F1-macro improvements over pretrained models on GoEmotions/ISEAR
* The more data available for retrieval, the better our model works
  * The effectiveness of KNNEC depends on the quality of retrieved NNs
  * The quality of retrieved nearest neighbors depends on the amount of data
    available for retrieval
  * pkN N average achieves 0.63/0.55 F1macro improvements over pM odel . The

## 4.4 The Effectiveness of BERT-whitening

* Besides, pkN N without BERT-whitening is very unstable, whose results are
  * the standard deviation (µ) equals 7.56/9.81 on GoEmotions/ISEAR. While
    pkN N with BERT-whitening is not only stable (µ = 0.89/1.35) but also better
* we visualize the sentence representations from RoBERTa on GoEmotions, where
  * Figure 2: sentence representations in the sadness category almost overlap
    with sentence representations in the surprise category, seriously affecting
  * BERTwhitening: the sentence reprs of sadness and surprise are separated

## 4.5 Performance with Different k As shown in

* Figure 3
  * bert-large, roberta-base, roberta-large:
    * pModel performs better, KNN-EC tends to select larger k, and retrieve
      more relevant sentences to improve performance
  * bert-base, xlnetbase:
    * pModel performs relatively poorly
    * selecting a larger k will introduce more noise
    * ~> kNN-EC tends to select a small k
