Emerging Cross-lingual Structure in Pretrained Language Models
Shijie Wu, Alexis Conneau, Haoran Li, Luke Zettlemoyer, Veselin Stoyanov
ACL 2020 arXiv:1911.01464 [cs.CL]

# Abstract

* multilingual masked language modeling
* we present a detailed study of several factors that influence
  * transfer is possible even when
    * there is no shared vocabulary across the monolingual corpora and
    * the text comes from very different domains
  * only requirement is that there are some shared parameters in the top layers
    of the multi-lingual encoder
* representations from independently trained models in different languages can
  be aligned post-hoc quite effectively
  * much like for non-contextual word embeddings, there are
    universal latent symmetries in the learned embedding spaces
