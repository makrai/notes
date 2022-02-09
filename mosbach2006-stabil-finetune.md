On the Stability of Fine-tuning BERT:
  Misconceptions, Explanations, and Strong Baselines
Marius Mosbach, Maksym Andriushchenko, Dietrich Klakow
ICLR 2021 arXiv:2006.04884 [cs.LG]

Code to reproduce: https://github.com/uds-lsv/bert-stable-fine-tuning

# Abstract

* fine-tuning is an unstable process
  * multiple random seeds can result in a large variance of the task performanc
* Devlin+ (2019); Lee+ (2020); and Dodge+ (2020) identified two potentl reasons
  * catastrophic forgetting and small size of the fine-tuning datasets
* we show that both hypotheses fail to explain the fine-tuning instability
  * we analyze BERT, RoBERTa, and ALBERT,
    fine-tuned on commonly used datasets from the GLUE benchmark, and show that
  * instability is caused by
    optimization difficulties that lead to vanishing gradients
  * the remaining variance of the downstream task performance can be attributed
    to differences in generalization where
    fine-tuned models with the same training loss exhibit noticeably different
    test performance
  * a simple but strong baseline that makes fine-tuning BERT-based models
    significantly more stable than the previously proposed approaches

# 1 Intro

* Pre-trained transformer-based masked language models
  * such as BERT (Devlin+ 2019), RoBERTa (Liu+ 2019), and ALBERT (Lan+ 2020)
  * fine-tuning
    * the standard recipe for using such models typically
    * training a pre-trained model for a few epochs on a supervised downstream
    * impressive empirical results, dominating a large variety of English NLP
      benchmarks such as GLUE (Wang+ 2019b) and SuperGLUE (Wang+ 2019a)
* poorly understood
  * pick up spurious [false] patterns and biases from the training data
    (Niven and Kao, 2019; McCoy+ 2019)
  * large training instability
    * fine-tuning a model multiple times on the same dataset,
      varying only the random seed, leads to a
      large standard deviation of the fine-tuning accuracy
      (Devlin+ 2019; Dodge+ 2020)
* Few methods have been proposed to solve the observed instability
  (Phang+ 2018; Lee+ 2020)
  * no sufficient understanding of why fine-tuning is prone to such failure
  * The goal of this work is to address this shortcoming. More specifically
  * Why is fine-tuning prone to failures and how can we improve its stability?
* We start by investigating two common hypotheses for fine-tuning instability:
  * catastrophic forgetting and small size of the fine-tuning datasets
  * demonstrate that both hypotheses fail to explain fine-tuning instability
  * investigate fine-tuning failures on datasets from GLUE
    * fine-tuning instability can be decomposed into two separate aspects:
      * optimization difficulties early in training,
        characterized by vanishing gradients,
      * differences in generalization late in training,
        characterized by a large variance of development set accuracy for runs
        with almost equivalent training loss
  * a simple but strong baseline for fine-tuning pre-trained language models
    * significantly improves the fine-tuning stability compared to previous wor
    * Figure 1:
      * very stable results with very concentrated development set performance
        over 25 different random seeds across all three datasets on BERT
      * significantly outperform the recently proposed approach of Lee+ (2020)
        in terms of fine-tuning stability
  * our findings apply also to more recent pre-trained models
    such as RoBERTa and ALBERT

# 2 Related work

* The fine-tuning instability of BERT has been pointed out in various studies
  * Devlin+ (2019)
    * instabilities when fine-tuning BERT LARGE on small datasets and
    * resort to performing multiple restarts of fine-tuning and selecting the
      model that performs best on the development set
  * Dodge+ (2020)
    * a large-scale empirical investig of the fine-tuning instability of BERT
    * dramatic variations in fine-tuning accuracy across multiple restarts
    * it may be related to the choice of random seed and the dataset size
* Few approaches have been proposed to directly address the fine-tuning instab
  * Phang+ (2018) study intermediate task training (STILTS) before fine-tuning
    * goal: improving performance on the GLUE benchmark
    * their proposed method leads to improved fine-tuning stability
    * hE, due to the intermediate task training, their work is
      not directly comparable to ours
  * Lee+ (2020) propose a new regularization technique termed Mixout
    * improves stability during fine-tuning
    * they attribute it to the prevention of catastrophic forgetting
* optimization difficulties of pre-training transformer-based language models
  (Xiong+ 2020; Liu+ 2020)
  * highlight the importance of the learning rate warmup for optimization
    * Similar to our work
  * focus on pre-training and hence orthogonal to our work

# 3 Background

## 3.1 Datasets

* We study four datasets from the GLUE benchmark (Wang+ 2019b)
  * following previous work studying instability during fine-tuning:
  * Detailed statistics for each can be found in Section 7.2 in the Appendix

### CoLA. The Corpus of Linguistic Acceptability (Warstadt+ 2018) is

* a sentence-level classification task containing sentences labeled as either
  grammatical or ungrammatical
* Fine-tuning on CoLA was observed to be particularly stable in previous work
  (Phang+ 2018; Dodge+ 2020; Lee+ 2020)
* Matthew’s correlation coefficient (MCC)

### MRPC. The Microsoft Research Paraphrase Corpus (Dolan and Brockett, 2005)

* sentence-pair classification task. Given two sentences, a
* model has to judge whether the sentences paraphrases of each other
* Performance is measured using the F 1 score

### RTE. The Recognizing Textual Entailment dataset is a collection of

* sentence-pairs collected from a series of textual entailment challenges
  (Dagan+ 2005; Bar-Haim+ 2006; Giampiccolo+ 2007; Bentivogli+ 2009)
* the second smallest dataset in the GLUE benchmark and
* fine-tuning on RTE was observed to be particularly unstable
  (Phang+ 2018; Dodge+ 2020; Lee+ 2020)
* Accuracy is used to measure performance

### QNLI. The Question-answering Natural Language Inference dataset contains

* sentence pairs obtained from SQuAD (Rajpurkar+ 2016)
* The task is to determine whether the context sentence contains the answer
  * i.e. entails the answer
* Wang+ (2019b) converted SQuAD into a sentence pair classification task
  by forming a pair between each question and each sentence in the
  corresponding paragraph
* Accuracy is used to measure performance on QNLI

## 3.2 Fine-tuning

* Unless mentioned otherwise, we follow the default fine-tuning strategy
  recommended by Devlin+ (2019)
  * we fine-tune uncased BERT LARGE (henceforth BERT) using a batch size of 16
  * learning rate of 2e−5
    * linearly increased from 0 to 2e−5 for the first 10% of iterations
      * known as a warmup—and
      * stackoverflow: If your data set is highly differentiated, you can
        suffer from a sort of "early over-fitting"
        * If your shuffled data happens to include a cluster of related,
          strongly-featured observations, your model's initial training can
          skew badly toward those features -- or worse, toward incidental
          features that aren't truly related to the topic at all
        * Warm-up is a way to reduce the primacy effect of the early examples.
        * Without it, you may need to run a few extra epochs to get the
          convergence desired, as the model un-trains those early superstitions
    * linearly decreased to 0 afterward
  * dropout with probability p = 0.1 and weight decay with λ = 0.01
  * 3 epochs on all datasets and global gradient clipping
  * the AdamW optimizer (Loshchilov and Hutter, 2019) without bias correction
* We not show results for BERT BASE
  since previous works observed no instability when fine-tuning BERT BASE
  which we also confirmed in our experiments
* we show additional results on
  RoBERTa LARGE (Liu+ 2019) and ALBERT LARGE-V2 (Lan+ 2020)
  using the same fine-tuning strategy
  * compared to BERT, both RoBERTa and ALBERT have slightly diff hyperparams.
    * RoBERTa uses weight decay with λ = 0.1 and no gradient clipping, and
      ALBERT does not use dropout
    * A detailed list of all default hyperparameters for all models: sec 7.3
* Our implementation is based on HuggingFace’s transformers lib (Wolf+ 2019)

### Fine-tuning stability

* By fine-tuning stability we mean the
  standard deviation of the fine-tuning performance (measured, e.g., in terms
  of accuracy, MCC or F 1 score) over the randomness of an algorithm
* we measure fine-tuning stability using the development sets from GLUE
  * following previous works (Phang+ 2018; Dodge+ 2020; Lee+ 2020) 
* We discuss alternative notions of stability in Section 7.1 in the Appendix

### Failed runs

* Following Dodge+ (2020), we refer to a fine-tuning run as a failed run
  if its accuracy at the end of training is
  less or equal to that of a majority classifier on the respective dataset
* The majority baselines for all tasks are found in Section 7.2 in the Appendix

# 4 Investigating previous hypotheses for fine-tuning instability 3

# 5 Disentangling optimization and generalization in fine-tuning instability 5

# 6 A simple but hard-to-beat baseline for fine-tuning bert

# Conclusions

# APPENDIX

## 7.1 Alternative notions of stability

## 7.2 Task statistics

## 7.3 Hyperparameters

## 7.4 Ablation studies

## 7.5 Additional gradient norm visualizations

## 7.6 Loss surfaces

## 7.7 Training curves

## 7.8 Additional fine-tuning results
