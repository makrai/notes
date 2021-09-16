WhiteningBERT: An Easy Unsupervised Sentence Embedding Approach
Junjie Huang, Duyu Tang, Wanjun Zhong, Shuai Lu, Linjun Shou, Ming Gong,
  Daxin Jiang, Nan Duan
arXiv:2104.01767 [cs.CL]

https://github.com/Jun-jie-Huang/WhiteningBERT

# Abstract

* we conduct a thorough examination of
  pretrained model based unsupervised sentence embeddings
* We study four pretrained models and seven datasets
* findings
  * averaging all tokens is better than only using [CLS] vector
  * combining the embeddings of the bottom layer and the top layer is better
    than only using top layers
    * some works use the last layer or the combination of the last two layers
      (Reimers and Gurevych, 2019; Li+ 2020)
  * an easy whitening-based vector normalization consistently boosts the perf
    * with less than 10 lines of code
    * Li+ (2020) transform sentence embeddings to a different distribution with
      sophisticated networks to address the problem of non-smooth anisotropic
      distribution
    * we explore whether a simple linear transformation is sufficient

# 1 Introduction

* Pre-trained language models perform well on learning sentence semantics when
  fine-tuned with supervised data (Reimers and Gurevych, 2019; Thakur+ 2020)
  * Nandan Thakur, N. Reimers, Johannes Daxenberger, and Iryna Gurevych. 2020
    Augmented sbert: Data augmentation method for improving bi-encoders for
    pairwise sentence scoring tasks
    ArXiv, abs/2010.08240
* when a large amount of supervised data is unavailable, unsup approach
  (Arora+ 2017; Zhang+ 2020)

# 3 WhiteningBERT

## 3.3 Whitening

* Whitening is a linear transformation that transforms a vector of random
  variables into a new vector whose covariance is an identity matrix & 0 mean
* effective to improve the text representations in
  * bilingual word embedding mapping (Artetxe+ 2018) and
  * image retrieval (Jégou and Chum, 2012)
* problem of non-smooth anisotropic distribution (Li+ 2020) by a simple linear

# 5 Related works

* Unsupervised sentence embeddings are mainly composed with pre-trained
* whether the pre-trained embeddings are further trained or not
  * yes: some works leverage unlabelled natural language inference datasets
    (Li+ 2020; Zhang+ 2020; Mu and Viswanath, 2018)
  * not: some works propose weighted average word embeddings based on word
    features (Arora+ 2017; Ethayarajh, 2018; Yang+ 2019; Wang and Kuo, 2020)
    * Ziyi Yang, Chenguang Zhu, and Weizhu Chen
      Parameter-free sentence embedding via orthogonal basis
      EMNLP/IJCNLP 2019
    * Bin Wang and C.-C. Jay Kuo. . 
      SBERT-WK: A sentence embedding method by dissecting bert-based word models
      2020 IEEE/ACM Transactions on Audio, Speech, and Language Processing
    * hE, these approaches need further training or additional features, which
      limits the direct applications of sentence embeddings in real-world scens
* concurrent to this work, Su+ (2021) also explored whitening sentence embed,
  released to arXiv one week before our paper
  * Jianlin Su, Jiarun Cao, Weijie Liu, and Yangyiwen Ou
    2021
    Whitening sentence representations for better semantics and faster retrieval

# Appendix A.3

```python
def whitening_torch(embeddings):
  mu = torch.mean(embeddings, dim=0, keepdim=True)
  cov = torch.mm((embeddings - mu).t(), embeddings - mu)
  u, s, vt = torch.svd(cov)
  W = torch.mm(u, torch.diag(1/torch.sqrt(s)))
  embeddings = torch.mm(embeddings - mu, W)
  return embeddings
```
