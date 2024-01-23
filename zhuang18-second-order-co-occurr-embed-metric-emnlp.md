Quantifying Context Overlap for Training Word Embeddings
Yimeng Zhuang, Jinghui Xie, Yinhe Zheng, and Xuan Zhu
EMNLP 2018

Ruder: Zhuang+ propose to use second-order co-occurrence relations to
train word embeddings via a newly designed metric

# Abstract

* In this paper, a metric is designed to estimate second order cooccurrence
  * based on [quantized] context overlap
  * joint training with existing neural word embedding models
* Experimental results for word similarity tasks and text classification

# 1 Intro

* global matrix factorization approach, dimensionality reduction
  (Deerwester+ 1990; Lee and Seung, 2001; Srebro+ 2005; Mnih and Hinton, 2007;
  Li+ 2015; Wang and Cohen, 2016)
* neural word embeddings (Levy and Goldberg, 2014b):
  * Neural Probabilistic Language Model (Bengio+ 2003),
  * SGNS and CBOW (Mikolov+ 2013a,b), GloVe (Pennington+ 2014) and their
    variants (Shazeer+ 2016; Kenter+ 2016; Ling+ 2017; Patel+ 2017)
* indirectly deal with unobserved co-occurrence for dense neural word embeds
  * negative sampling in SGNS (Mikolov+ 2013a,b)
  * Swivel (Shazeer+ 2016) improves GloVe by using a “soft hinge” loss to
    prevent from over-estimating zero co-occurrences  However, the
    * latent relations between unobserved word pairs are not explicitly
      represented
* semantic composition and distributional inference to address the sparseness
  (Mitchell and Lapata, 2008; Erk and Padó, 2008, 2010;
  Reisinger and Mooney, 2010; Thater+ 2011; Kartsaklis+ 2013; Kober+ 2016)
  * they are not neural word embeds
* [our approach] utilizes context overlap
  * extensions for GloVe and Swivel
* [rel work in sec conclu:]
  * exploration for second order co-occurrence can be traced back to 1990s
  * We think it is helpful to revive the classical method
    in a modern, embedding driven way

# 2 Quantify Context Overlap

* overlap of Point-wise Mutual Information (PMI, Church and Hanks, 1990)
  reflects context overlap
  * As shown in Figure 1, two separate words may exhibit a particular aspect of
* calculation of complete PMI-weighted context overlap may be time-consuming
  * only the context words that have strong lexical association are considered
  * threshold .. acts as a magnitude to shift PMI, and S i denotes the set that
`\sum min f(PMI(i, k)), f(PMI(j, k)))`
  * f is a monotonic mapping function to rectify the data characteristics for
    certain objective function in word embedding training
  * exponential function f (x) = exp(x) works much better in our experiments
    * similar as the cooccurrence counts, i.e., few word pairs have

# 4 Experiments

## 4.1 Setup

### Corpus 6 billion tokens collected from diversified corpora

### Preprocessing Following (Lee and Chen, 2017), the Stanford tokenizer

### Parameter

* vocabularies are limited to the 200K most frequent words. Following , a
* decreasing weighting function to construct the cooccur mx (Pennington+ 2014)

## 4.2 Intrinsic Evaluation: word similarity [and] analogy tasks. Word

* The improved semantics performance, to a certain extent, reflects second
  order co-occurrence relations are more semantic

## 4.3 Text Classification

* datasets from (Kim, 2014) including
  binary classification tasks CR (Hu and Liu, 2004), MR (Pang and Lee, 2005),
  Subj (Pang and Lee, 2004) and
  multiple classification tasks TREC (Li and Roth, 2002), SST1 (Socher+ 2013)
* We train Convolutional Neural Networks (CNN) on top of our static pretrained

# 5 Model Analysis

* word frequency [is important in] word embeddings (Gittens+ 2017). Inspired
* word analogy accuracy [vs] the log mean freq of the words (Shazeer+ 2016) in
* An obvious semantic performance improvement in the range of low frequency
  * may be caused by PMI’s bias towards infrequent words [or]
    infrequent words carry more information in second order co-occurrence
    relations

# 6 Conclusion

* context overlap leverages global association distribution
  to measure word pairs correlation
* method is easy to extend to existing models, such as GloVe and Swivel, by an
* future work
  * integrate second order co-occurrence information for approaches like w2v
  * investigating the characteristics of context overlap in diversified ways
