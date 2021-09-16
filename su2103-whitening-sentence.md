Whitening Sentence Representations for Better Semantics and Faster Retrieval
Jianlin Su, Jiarun Cao, Weijie Liu, Yangyiwen Ou
arXiv:2103.15316 [cs.CL]

The source code is available at https://github.com/bojone/BERT-whitening

# Abstract

* attempts of boosting the isotropy of sentence distribution,
  e.g. flow-based model
* we find that the traditional whitening operation can similarly enhance the
  isotropy of sentence representations and achieve competitive results
  * also capable of reducing the dimensionality of the sentence representation
    * significantly reduce the storage cost and accelerate the retrieval

# 1 Introduction

* sentence embeddings poorly capture the semantics (Li+ 2020)
  * Bohan Li, Hao Zhou, Junxian He, Mingxuan Wang, Yiming Yang, and Lei Li
    EMNLP 2020
    On the sentence embeddings from pre-trained language models
* word representations of all words are not isotropic:
  they are not uniformly distributed with respect to direction
  (Gao+ 2019; Ethayarajh, 2019; Li+ 2020)
  * they occupy a narrow cone in the vector space
  * Ethayarajh, (2019) has proved that
    * in contextual word embeddings two word embeddings have, on average, a
      cosine similarity of 0.99
  * Li+ (2020) found
    * word frequency biases the embedding space
    * low-frequency words disperse sparsely, which leads to the difficulty
* To address the problem aforementioned,
  * Ethayarajh, (2019) elaborates on the theoretical reason that leads to the
    anisotropy problem, as observed in pre-trained models
  * Gao+ (2019) designs a novel way to mitigate the degeneration problem by
    regularizing the word embedding matrix
  * BERT-flow (Li+ 2020): transform the BERT sentence embedding distribution
    into a smooth and isotropic Gaussian distribution through normalizing flow
    (Dinh+ 2014), which is an invertible function parameterized by neu network
* we find that a simple and effective post-processing technique, whitening, is
  capable enough of tackling the anisotropic problem of sentence embeddings
  (Reimers and Gurevych, 2019). Specifically, we transform the
  * mean value of the sentence vectors to 0 and the
  * covariance matrix to the identity matrix. In addition, we also introduce a
  * dimensionality reduction strategy to facilitate the whitening operation for
    further improvement the effect of our approach (truncated SVD)
* The experimental results on 7 standard semantic textual similarity benchmark
  * our method can generally improve the model performance and achieve the SOTA
    results on most of datasets

# 2 Related Work

* anisotropy
  * Arora+ (2017) first computed the sentence representation for the entire
  * Mu and Viswanath, (2018) proposed a postprocessing operation is on dense
  * Gao+ (2019) proposed a novel regularization method to address the anisotropy
    problem in training natural language generation models
    * by regularizing the word embedding matrix. As observe that the word
    * directly increase the size of the aperture of the cone, which can be
  * Ethayarajh, (2019) investigated the inner mechanism of contextual
  * Li+ (2020) proposed BERT-flow, in which it transforms the anisotropic
* sentence embedding methods
  * SNLI datasets are suitable for training sentence embeddings
    (Conneau+ 2017; Cer+ 2017)
  * Yang+ (2018) proposed a method to train on conversations from Reddit using
    siamese DAN and siamese transformer networks, which yielded
    good results on the STS benchmark dataset
  * Cer+ (2018) proposed a so-called Universal Sentence Encoder
    * transformer network
    * augments unsupervised learning with training on SNLI dataset
  * pre-trained methods
    * Humeau+ (2019) addressed the run-time overhead of the cross-encoder from
      BERT and presented a method (poly-encoders) to compute a score between
      context vectors and pre-computed candidate embeddings using attention
    * Reimers and Gurevych, (2019) is a modification of the pretrained BERT
      * use siamese and triplet network structures to derive semantically
        meaningful sentence embeddings that can be compared using cosine

# 3 Hypothesis

## 3.1 Our Approach

* The cosine depends on the selected coordinate basis. Therefore, the coordinate
* each basis vector is supposed to be independent and uniform when we choose the
* we need to transform the original sentence embedding in a way to enforce it
  being isotropic, and then use the equation 1 to calculate the cosine sim

## 3.2 Whitening Transformation

## 3.3 Dimensionality Reduction

* each diagonal element of the diagonal matrix Λ measures the variation of the
  one-dimensional data in which it is located. If its value is small, it
  represents that the variation of this dimensional feature is also small
  * sentence vector may only be embedded into a lower dimensional space, and we
* We refer the entire transformation workflow as Whitening-k
  * implementation is shown in Algorithm 1

## 3.4 [computational] Complexity Analysis

# 4 Experiment

## 4.1 the bench-mark datasets

## 4.2 detailed experiment settings

### Experimental details

* Since the BERT-flow(NLI/target) is the primary baseline we are compared to, we
  basically align to their experimental settings and symbols. Concretely, we
  * both BERT base and BERT large in our experiments. We choose
  * first-last-avg as our default configuration as
    * averaging the first and the last layers of BERT can stably achieve better
      performance compared to only averaging the last one layer. Similar to (Li
* we leverage the full target dataset (train, development, and test sets) to
  calculate the whitening parameters W and μ through the unsupervised approach
* -whitening(NLI) denotes the whitening parameters are obtained on the NLI corp
* through our whitening method, the output embedding size is reduced to 256 and
  384, respectively

## 4.3 result and in-depth analysis

## 4.4 the effect of dimensionality reduction with different settings of dim

* For most tasks, reducing the dimension of the sentence vector to its one of
  third is an relatively optimal solution, in which its performance is at the
  edge of increasing point
