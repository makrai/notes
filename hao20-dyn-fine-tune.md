Investigating Learning Dynamics of BERT Fine-Tuning 
Yaru Hao, Li Dong, Furu Wei, Ke Xu
AACL

# Abstract

* pre-trained language model BERT advances the SOTA on many NLP tasks through
* few studies investigate how the fine-tuning process improves downstream 
* we: two indicators
  * JS divergence to detect the change of the attention mode and use
  * SVCCA distance to examine the change to the feature extraction mode
    during BERT fine-tuning
* BERT fine-tuning
  mainly changes the attention mode of the last layers and
  modifies the feature extraction mode of the intermediate and last layers.
* we analyze the consistency of BERT fine-tuning
  between different random seeds and different datasets
