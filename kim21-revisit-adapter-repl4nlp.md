Revisiting Pretraining with Adapters
Seungwon Kim, Alex Shum, Nathan Susanj, Jonathan Hilgart
ACL 2021 | IJCNLP | RepL4NLP

# Abstract

* adapter-based pretraining is able to achieve comparable results to
  task-specific pretraining while using a fraction of the trainable parameters
* We further explore direct use of adapters without pretraining and find that
  * direct fine-tuning performs mostly on par with pretrained adapter models,
* ablation study on task-adaptive pretraining to investigate how different
  hyperparameter settings can change the effectiveness of the pretraining

# 1 Introduction

* adapters have been proposed as an alternative approach (Houlsby+ 2019)
  * mostly matches the performance of those with the full fine-tuning strategy
    on many NLP tasks including GLUE benchmark (Wang+ 2018) and
  * reduces the size of the model from 100s of MB to 1 MB (Pfeiffer+ 2020b). As
* can the adapter alone adapt PLMs to the target task?
* we explore task-adaptive pretraining, termed TAPT (Gururangan+ 2020), with
  adapters to address this question and overcome the limitations of the

## 3.5 Analysis

* Since we sweep the learning rates and the number of epochs in the range that
  includes larger figures compared to those in the full model when fine-tuning
  adapters and kept the other hyper-parameters the same as in Gururangan+ 2020,
  we hypothesize that the larger learning rate zeroes out the benefits of
  pretraining
