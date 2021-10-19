SimCSE: Simple Contrastive Learning of Sentence Embeddings
Tianyu Gao, Xingcheng Yao, Danqi Chen
EMNLP 2021 arXiv:2104.08821 [cs.CL]


The code and pre-trained models https://github.com/princeton-nlp/SimCSE

* This paper presents SimCSE, a simple contrastive learning framework that
  greatly advances the SOTA sentence embeddings
* We describe an
  * unsupervised approach, which takes an input sentence and
    predicts itself in a contrastive objective, with
    * only standard dropout used as noise. This simple method
    * works surprisingly well, performing on par with previous supervised
    * dropout acts as minimal data augmentation and
      removing it leads to a representation collapse
  * supervised approach, which incorporates annotated pairs from NLI datasets
    into our contrastive learning framework, by using
    "entailment" pairs as positives and "contradiction" pairs as hard negs
* We evaluate SimCSE on standard semantic textual similarity (STS) tasks, and
  our unsupervised and supervised models using BERT base achieve an average of
  76.3% and 81.6% Spearman's correlation respectively, a
  4.2% and 2.2% improvement compared to previous best results
* We also show -- both theoretically and empirically -- that contrastive obj
  * regularizes pre-trained embeddings' anisotropic space to be more uniform,
  * better aligns positive pairs when supervised signals are available
