Multilingual BERT Post-Pretraining Alignment
Lin Pan, Chung-Wei Hang, Haode Qi, Abhishek Shah, Saloni Potdar, Mo Yu
NAACL 2021

# Abstract

* We propose post-pretraining
  * a simple method to align multilingual contextual embeddings
    for improved cross-lingual transferability of the pretrained LMs
* Using parallel data, our method aligns embeddings on the
  * word level through the recent Translation Language Modeling objective (TLM)
  * sentence level via contrastive learning and random input shuffling. We also
  * sentence-level code-switching with English when finetuning on downstream
* result
  * On XNLI, our best model (initialized from mBERT)
    * improves over mBERT by 4.7% in the zero-shot setting and achieves
    * comparable result to XLM for translate-train while using less than 18% of
      the same parallel data and 31% fewer model parameters
  * On MLQA, our model outperforms XLM-R_Base, which has 57% more parameters

# 1 Intro

* Conneau and Lample (2019) pretrain a new Transformer-based (Vaswani+ 17)
  model from scratch with an
  * MLM objective on monolingual data, and a
  * Translation Language Modeling (TLM) objective on parallel data.

## 2.2 Word-Level Alignment Objective

* We use TLM for word-level alignment
  * an extension of MLM that operates on bilingual data—
  * parallel sentences are concatenated and MLM is applied to the combined
    bilingual sequence.
  * Different from Conneau and Lample (2019), we
    * not reset positional embeddings when forming the bilingual sequence, and we
    * not use language embeddings. In addition,
    * the order of Sien and Sitr during concatenation is determined by the
      random input shuffling from the sentence-level alignment step and we
    * add a [SEP] token between Sien and Sitr
* We randomly mask 15% of the WordPiece tokens in each combined sequence.
  * [MASK] token 80% of the times,
  * a random token in the vocabulary 10% of the times, and
  * unchanged for the remaining 10%
    * TLM is performed using the query encoder of MoCo
* Our final PPA model is trained in a multi-task manner with both
  sentence-level objective and TLM
