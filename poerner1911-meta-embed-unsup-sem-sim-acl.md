Sentence Meta-Embeddings for Unsupervised Semantic Textual Similarity
Nina Poerner, Ulli Waltinger, Hinrich Schütze
ACL 2020 arXiv:1911.03700 [cs.CL]

# Abstract

* by ensembling diverse pre-trained sentence encoders
* We apply ... different meta-embedding methods from the word embedding literat
  * including dimensionality reduction (Yin and Schütze, 2016),
  * generalized Canonical Correlation Analysis (Rastogi+ 2015) and
  * cross-view auto-encoders (Bollegala and Bao, 2018). Our sentence
* new unsupervised State of The Art (SoTA) on the STS Benchmark and on the
  STS12-STS16 datasets, with gains of between 3.7% and 6.4% Pearson's r over
  single-source systems

# Introduction

* Our sentence encoder ensemble
  * includes three models from the recent
    * Sentence-BERT (Reimers and Gurevych, 2019), the
    * Universal Sentence Encoder (Cer+ 2017) and
    * averaged ParaNMT vectors (Wieting and Gimpel, 2018).  Our meta-embeddings
  * outperform every one of their constituent single-source embeddings on
    STS12–16 (Agirre+ 2016) and on the STS Benchmark (Cer+ 2017)
  * future improvements may be possible by adding new encoders
