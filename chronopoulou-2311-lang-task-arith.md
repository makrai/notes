Language and Task Arithmetic with Parameter-Efficient Layers
  for Zero-Shot Summarization
A Chronopoulou, J Pfeiffer, J Maynez, X Wang, S Ruder, P Agrawal
arXiv:2311.09344 [cs.CL]

# Abstract

* Parameter-efficient fine-tuning (PEFT) using labeled task data
* we propose to improve zero-shot cross-lingual transfer
  by composing language~ or task-specialized parameters
  * language and task PEFT modules via element-wise arithmetic operations to
  => leverage unlabeled data and English labeled data
  * We extend our approach to cases where labeled data from more languages is
    available and propose to arithmetically compose PEFT modules trained on
    languages related to the target
* results on summarization demonstrate that our method is an effective strategy
  * consistent gains using minimal training of PEFT modules
  * using PaLM 2 as the pretrained model

# 5 Analysis

## 5.1 Using task vector in different languages has consistent improvements

## 5.2 Our method also works with other PEFT parameters

## 5.3 Module subtraction is particularly helpful for summarization

## 5.4 Task vectors selected by lang2vec
