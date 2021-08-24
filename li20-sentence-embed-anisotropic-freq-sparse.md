On the Sentence Embeddings from Pre-trained Language Models 
Bohan Li, Hao Zhou, Junxian He, Mingxuan Wang, Yiming Yang, Lei Li
EMNLP 2020

https://github.com/bohanli/BERT-flow

# Abstract

* we
  * theoretical connection between the 
    masked language model pre-training objective and the 
    semantic similarity task
  * analyze the BERT sentence embeddings empirically
* BERT always induces a non-smooth anisotropic semantic space of sentences,
* we propose to transform the anisotropic sentence embedding distribution to a
  smooth and isotropic Gaussian distribution 
  through normalizing flows that are learned with an unsupervised objective
* significant performance gains over the SOTA sentence embeddings on 
  a variety of semantic textual similarity tasks
