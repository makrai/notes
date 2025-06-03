A Soft-label Method for Noise-tolerant Distantly Supervised Relation Extraction
Tianyu Liu, Kexiang Wang, Baobao Chang, Zhifang Sui
EMNLP 2017

Abstract

* Distant-supervised relation extraction 
  * inevitably suffers from wrong labeling problems because it 
  * heuristically labels relational facts with knowledge bases. 
  * sentence level denoise models don’t achieve satisfying performances
* we introduce an entity-pair level denoise method which 
  exploits semantic information from correctly labeled entity pairs to 
  correct wrong labels dynamically during training.
  * a joint score function which combines 
    the relational scores based on the entity-pair representation and 
    the confidence of the hard label 
    to obtain a new label, namely a soft label, for certain entity pair.
    During training, soft labels instead of hard labels serve as gold labels.
  * Experiments: outperforms other state-of-the-art systems.

# 1 Intro

* the reliability of a distant-supervised (DS) label can be determined by the
  syntactic/semantic similarity between certain instance and the potential
  correctly labeled instances. 
* Soft-label method intends to utilize corresponding similarities to correct
  wrong DS labels in the training stage dynamically, which means 
  the same bag may have different soft labels in different epochs of training.
* The basis of soft-label method is the dominance of correctly labeled
  instances.
* Xu+ (2013): correctly labeled instances account for 94.4% (including true
  negatives) in the distant-supervised New York Times corpus.
* we introduce a soft-label method to correct wrong labels at entity-pair
  level during training by exploiting semantic/syntactic information from
  correctly labeled instances. In our model, 
  * the representation of certain entity pair is
    a weighted combination of related sentences which are encoded by piecewise
    convolutional neural network (PCNN) (Zeng+, 2015). Besides, we propose 
  * a joint score function to obtain soft labels during training
    by taking both the confidence of DS labels and the entity-pair reprs
    into consideration
