RoBERTa: A Robustly Optimized BERT Pretraining Approach
Yinhan Liu, Ott, Goyal, Du, Joshi, Chen, Levy, Lewis, Zettlemoyer, Stoyanov
arXiv:1907.11692 

Our models and code are available at: https://github.com/pytorch/fairseq

# Abstract

* We measure the impact of many key hyperparameters and training data size
* BERT was significantly undertrained, and 
  * can match or exceed the performance of every model published after it
* we achieves SOTA results on GLUE, RACE and SQuAD
  * 88.5 on the public GLUE leaderboard, matching the 88.4 reported by Yang+
  * new SOTA on 4/9 of the GLUE tasks: MNLI, QNLI, RTE and STS-B
  * match SOTA results on SQuAD and RACE

# 1 Intro

* we 
  * propose RoBERTa, an improved recipe for training BERT models, which we
  * match or exceed the performance of all of the post-BERT methods.  Our
    1. training the model longer, with bigger batches, over more data; 
    1. removing the next sentence prediction objective; 
    1. training on longer sequences; and 
    1. dynamically changing the masking pattern applied to the training data.
  * new dataset (CC-NEWS) of comparable size to other privately used
    datasets, to better control for trai
  * re-establish that BERT’s masked language model training objective is
    competitive with other recently proposed training objectives such as
    perturbed autoregressive language modeling (Yang+ 2019)
* contributions of this paper are: 
  1. We present a set of important BERT design choices and training strategies
     and introduce alternatives that lead to better downstream task
     performance; 
  1. We use a novel dataset, CC-NEWS, and confirm that using more data for
     pretraining further improves performance on downstream tasks; 
  1. Our training improvements show that masked language model pretraining,
     under the right design choices, is competitive with all other recently
     published methods

## 4.1 Static vs. Dynamic Masking

* BERT relies on randomly masking and predicting tokens. The 
* original BERT implementation performed masking once during data
  preprocessing, resulting in a single static mask. To avoid using the same
  mask for each training instance in every epoch, training data was duplicated
  10 times so that each sequence is masked in 10 different ways over the 40
  epochs of training. Thus, each training sequence was seen with the same mask
  four times during training.  
* dynamic masking where we generate the masking pattern every time we feed a
  sequence to the model. This becomes crucial when pretraining for more steps
  or with larger datasets.
