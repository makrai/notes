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
    1. dynamically changing the masking pattern applied to the training data
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

## 2.3

### Next Sentence Prediction (NSP)

* binary classification loss for predicting whether two segments follow each ot
* Negative examples are created by pairing segments from different documents
* Positive and negative examples are sampled with equal probability
* designed to improve e.g. Natural Language Inference (Bowman+ 2015)

## 4.1 Static vs. Dynamic Masking

* BERT relies on randomly masking and predicting tokens. The
* original BERT implementation performed masking once during data
  preprocessing, resulting in a single static mask. To avoid using the same
  mask for each training instance in every epoch, training data was duplicated
  10 times so that each sequence is masked in 10 different ways over the 40
  epochs of training. Thus, each training sequence was seen with the same mask
  four times during training
* dynamic masking where we generate the masking pattern every time we feed a
  sequence to the model. This becomes crucial when pretraining for more steps
  or with larger datasets

## 4.2 Model Input Format and Next Sentence Prediction

* The NSP loss was hypothesized to be an important factor in the original BERT
  * Devlin+ (2019) observe that removing NSP hurts performance
    * significant performance degradation on QNLI, MNLI, and SQuAD 1.1
  * recent work has questioned the necessity of the NSP loss
    (Lample and Conneau, 2019; Yang+ 2019; Joshi+ 2019)
* we compare several alternative training formats:
  * SEGMENT PAIR + NSP
    * the original input format used in BERT (Devlin+ 2019), with the NSP loss
    * segments can each contain multiple natural sentences, but the
    * total combined length must be less than 512 tokens
  * sentence-pair+nsp
    * each input contains pair of natural sentences, either sampled from a
    * significantly shorter than 512 tokens, we increase the batch size so that
      the total number of tokens remains similar to SEGMENT PAIR + NSP 
    * We retain the NSP loss
  * FULL SENTENCES : Each input is packed with full sentences sampled contiguou
    * total length is at most 512 tokens
    * may cross document boundaries. When we reach the end of one document, we
    * separator token between documents. We remove the NSP loss
  * DOC SENTENCES : SENTENCE PAIR + NSP :
    * Inputs may not cross document boundaries
    * Inputs near the end of a document may be shorter than 512 tokens, so we
      dynamically increase the batch size in these cases to achieve a similar
      number of total tokens as FULL SENTENCES . We remove the NSP loss

### Results Table 2 shows results for the four different settings

* original SEGMENT PAIR input format from Devlin+ (2019) vs SENTENCE PAIR
  * both formats retain the NSP loss, but the latter uses single sentences. We
  * individual sentences hurts performance on downstream tasks, which
  * we hypothesize is because the model is not able to learn long-range deps
* without the NSP loss vs with blocks of text from a single document (
  * outperforms the originally published BERT BASE results and that
  * removing the NSP loss matches or slightly improves downstream performance,
    in contrast to Devlin+ (2019)
  * It is possible that the original BERT implementation may only have removed
    the loss term while still retaining the SEGMENT PAIR input format
* sequences from a single/multiple document(s): single performs slightly better
  * hE because the DOC - SENTENCES format results in variable batch sizes, we
    use FULL SENTENCES in the remainder of our experiments for easier
    comparison with related work
