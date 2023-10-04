Non-Linguistic Supervision for Contrastive Learning of Sentence Embeddings
Yiren Jian, Chongyang Gao, Soroush Vosoughi
Advances in Neural Information Processing Systems 35 (NeurIPS 2022) Main Conf

https://github.com/yiren-jian/NonLing-CSE.

# Abstract

* Semantic representation learning for sentences is important and well-studied
  * current: a Transformer-based sentence encoder through a contrastive obj w
    * ie, clustering sentences with semantically similar meanings and
* we: improvement by training with multi-modal multi-task losses, using
  * unpaired examples from another modality (eg sentences and unrelated
    image/audio data)
  * our model
    * besides learning by the contrastive loss on text, our model 
    * clusters examples from a non-linguistic domain (eg visual/audio) with a
      similar contrastive loss at the same time. The reliance of our framework
  * language-agnostic, enabling it to be widely applicable beyond English NLP.
* Experiments on 7 semantic textual similarity benchmarks reveal that models
* ie Transformer models are able to generalize better by doing a similar task
  (ie, clustering) with _unpaired_ examples from different modalities in a
  multi-task fashion

# Analysis

## 5.1Visual Supervision Versus NLI Supervision

## 5.2 Uniformity and Alignment of the Sentence Embeddings
