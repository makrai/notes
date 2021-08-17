Whitening Sentence Representations for Better Semantics and Faster Retrieval
Jianlin Su, Jiarun Cao, Weijie Liu, Yangyiwen Ou
arXiv:2103.15316 [cs.CL]

The source code is available at https://github.com/bojone/BERT-whitening

# Abstract

* attempts of boosting the isotropy of sentence distribution,
  such as flow-based model
* we find that the traditional whitening operation can similarly enhance the
  isotropy of sentence representations and achieve competitive results
  * also capable of reducing the dimensionality of the sentence representation
    * significantly reduce the storage cost and accelerate the retrieval

# 1 Introduction

* sentence embeddings poorly capture the semantics (Li+ 2020)
  * Bohan Li, Hao Zhou, Junxian He, Mingxuan Wang, Yiming Yang, and Lei Li
    EMNLP 2020
    On the sentence embeddings from pre-trained language models. In Proceedings
* word representations of all words are not isotropic:
  they are not uniformly distributed with respect to direction
  (Gao+ 2019; Ethayarajh, 2019; Li+ 2020)
  * they occupy a narrow cone in the vector space, and are therefore
  * Ethayarajh, (2019) has proved that
    * in contextual word embeddings two word embeddings have, on average, a
      cosine similarity of 0.99. Further investigation from (Li+ 2020) found
    * word frequency biases the embedding space
    * low-frequency words disperse sparsely, which lead to cause the difficulty
* To address the problem aforementioned,
  * Ethayarajh, (2019) elaborates on the theoretical reason that leads to the
    anisotropy problem, as observed in pre-trained models
  * Gao+ (2019) designs a novel way to mitigate the degeneration problem by
    regularizing the word embedding matrix
  * BERT-flow (Li+ 2020), proposed to transform the BERT sentence embedding
    distribution into a smooth and isotropic Gaussian distribution through
    normalizing flow (Dinh+ 2014), which is an invertible function parameter-
    ized by neural networks
* we find that a simple and effective post-processing technique – whitening – is
  capable enough of tackling the anisotropic problem of sentence embeddings
  (Reimers and Gurevych, 2019). Specifically, we transform the
  * mean value of the sentence vectors to 0 and the
  * covariance matrix to the identity matrix. In addition, we also introduce a
  * dimensionality reduction strategy to facilitate the whitening operation for
    further improvement the effect of our approach
* The experimental results on 7 standard semantic textual similarity benchmark
  * our method can generally improve the model performance and achieve the SOTA
    results on most of datasets.  Meanwhile, by adding the dimensionality
