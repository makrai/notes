Exploiting Cloze-Questions for Few-Shot Text Classification and NLI 
Timo Schick, Hinrich Schütze
EACL 2021

# Abstract

* fully unsupervised: pretrained language model + “task descriptions” in
  natural language (eg Radford+ 2019). While this approach
  * underperforms its supervised counterpart, we show in this work that
  * the two ideas can be combined
* We introduce Pattern-Exploiting Training (PET)
  * a semi-supervised training procedure that
    reformulates input examples as cloze-style phrases to help LMs understand a
    given task
  * These phrases are then used to assign soft labels to a large set of
    unlabeled examples
  * Finally, standard supervised training is performed on the resulting
    training set
* For several tasks and languages, PET outperforms supervised training and
  strong semi-supervised approaches in low-resource settings by a large margin.

# Intro

* solving a task from only a few examples becomes much easier with a task descr
* pretrained language models (PLMs)
  * GPT (Radford+ 2018), BERT (Devlin+ 2019) and RoBERTa (Liu+ 2019)
  * providing task descriptions has become feasible for neural architectures:
  * append such descriptions in natural language to an input and
    let the PLM predict continuations that solve the task
    (Radford+ 2019; Puri and Catanzaro, 2019). So far, this idea has
  * mostly considered in zero-shot scenarios: no training data available
* we show that 
  * task descriptions can be combined with standard supervised learning in
    few-shot settings: We introduce
  * Pattern-Exploiting Training (P ET ), a semi-supervised training procedure
    * uses natural language patterns to reformulate input examples into
      cloze-style phrases
    * Figure 1, P ET works in
  * three steps: 
    1. for each pattern a separate PLM is finetuned on a small training set T
    2. The ensemble of all models is then used to annotate a large unlabeled
       dataset D with soft labels
    3. a standard classifier is trained on the soft-labeled dataset
* We also devise iP ET , an iterative variant of P ET in which
  * this process is repeated with increasing training set sizes.
* experiments On a diverse set of tasks in multiple languages, we show that
  * small to medium number of labeled examples,
  * P ET and iP ET substantially outperform unsupervised approaches, supervised
    training and strong semi-supervised baselines

# Related Work

* Radford+ (2019) provide hints in the form of natural language patterns for
  zero-shot learning 
  * tasks such as reading comprehension and question answering (QA). 
  * idea has been applied to
    * unsupervised text classification (Puri and Catanzaro, 2019)
    * commonsense knowledge mining (Davison+ 2019) and
    * argumentative relation classification (Opitz, 2019).
  * Srivastava+ (2018) use task descriptions for zero-shot classification but
  * hE require a semantic parser
  * relation extraction, Bouraoui+ (2020) automatically identify patterns that
    express given relations
  * McCann+ (2018) rephrase several tasks as QA problems
  * Raffel+ (2020) frame various problems as language modeling tasks, but
    their patterns only loosely resemble natural language and are unsuitable
    for few-shot learning. 2
    * eg they convert inputs (a, b) for recognizing textual entailment (RTE) to
      “rte sentence1: a sentence2: b”, and the PLM is asked to predict strings
      like “not entailment”.
* cloze-style phrases to probe the knowledge that PLMs acquire during pretrain
  * factual and commonsense knowledge
    (Trinh and Le, 2018; Petroni+ 2019; Wang+ 2019; Sakaguchi+ 2020)
  * linguistic capabilities (Ettinger, 2020; Kassner and Schütze, 2020)
  * rare words (Schick and Schütze, 2020)
  * symbolic reasoning (Talmor+ 2019)
  * Jiang+ (2020): the problem of finding the best pattern to express a task.

* exploiting examples from related tasks (Yu+ 2018; Gu+ 2018; Dou+ 2019; Qian
  and Yu, 2019; Yin+ 2019) and using
  * data augmentation (Xie+ 2020; Chen+ 2020); the latter
    * commonly relies on back-translation (Sennrich+ 2016), requiring large
      amounts of parallel data
* textual class descriptors:
  typically assume that abundant examples are available for a subset of classes
  (eg Romera-Paredes and Torr, 2015; Veeranna+ 2016; Ye+ 2020). In contrast,
  * our approach requires no additional labeled data and provides an intuitive
    interface to leverage task-specific human knowledge.
* training multiple generations of models on data labeled by previous gens 
  * The idea behind iP ET 
  * resembles to self-training and bootstrapping approaches for
    * word sense disambiguation (Yarowsky, 1995)
    * relation extraction (Brin 1999; Agichtein & Gravano 2000; Batista+ 2015)
    * parsing (McClosky+ 2006; Reichart & Rappoport 2007; Huang & Harper 2009)
    * machine translation (Hoang+ 2018)
    * sequence generation (He+ 2020).

# 3 Pattern-Exploiting Training

* pattern: a function P that takes x as input and
  outputs a phrase or sentence P (x) ∈ V ∗ that contains exactly one mask token
  * ie its output can be viewed as a cloze question. Furthermore, we
* verbalizer: an injective function v : L → V that
  maps each label to a word from M ’s vocabulary
* refer to (P, v) as a pattern-verbalizer pair (PVP).  Using a PVP (P, v)
  * solve task A as follows: Given an input x, we apply P to obtain an input
    * P (x), which is then processed by M to determine the label y ∈ L for
      which v(y) is the most likely substitute for the mask
* eg the task of identifying whether two sentences a and b contradict or agree
  * pattern P (a, b) = _a?  [mask], b._  combined with a
    verbalizer v that maps y 0 to “Yes” and y 1 to “No”. Given an example input
     
## 3.1 PVP Training and Inference

## 3.2 Auxiliary Language Modeling

* catastrophic forgetting can occur. As a PLM finetuned for some PVP is still a
  * With L CE denoting cross-entropy loss and L MLM language modeling loss,
    we compute the final loss as L = (1 − α) · L CE + α · L MLM
  * this idea was recently applied by Chronopoulou+ (2019) in a data-rich scena

## 3.3 Combining PVPs

* challenge: in the absence of a large development set,
  it is hard to identify which PVPs perform well
* => we use a strategy similar to knowledge distillation (Hinton+ 2015).
* Figures 1, 2
* First, we define a set P of PVPs that intuitively make sense for a given
  task A. We then use these PVPs as follows:
  1. We finetune a separate language model M p for each p ∈ P as in Sec 3.1.
    * As T is small, this finetuning is cheap even for a large number of PVPs.
  2. We use the ensemble M = {M p | p ∈ P} of finetuned models to annotate
     examples from D. We first combine the unnormalized class scores for each
     example x ∈ D as s M (l | x) = 1 X w(p) · s p (l | x) Z p∈P P where Z =
     p∈P w(p) and the w(p) are weighting terms for the PVPs. We experiment
    * two different realizations of this weighing term: either we simply set
      w(p) = 1 for all p or we set w(p) to be the accuracy obtained using p
      on the training set before training. We refer to these two variants as
      uniform and weighted. Jiang+ (2020) use a similar idea in a zero-shot
    * We transform the above scores into a probability distri q using softmax
    * Following Hinton+ (2015), we use a temperature of T = 2 to obtain a
      suitably soft distribution
    * All pairs (x, q) are collected in a (soft-labeled) training set T C .
  3. We finetune a PLM C with a standard sequence classification head on T C
    * The finetuned model C then serves as our classifier for A.  All steps

## 3.4 Iterative P ET (iP ET )

* Distilling the knowledge of all individual models into a single classifier C
  means they cannot learn from each other
  * As some patterns perform (possibly much) worse than others, the training
    set T C for our final model may therefore contain many mislabeled examples.
* The core idea of iP ET is to train several generations of models
  on datasets of increasing size
  * we first enlarge the original dataset T by labeling selected examples from
    D using a random subset of trained P ET models (Figure 2a)
  * then train a new generation of P ET models on the enlarged dataset (b);
    this process is repeated several times (c).

# 5 Analysis

## Combining PVPs We first investigate

* whether P ET is able to cope with situations were some PVPs perform much
  worse than othersl
* Table 4 compares the performance of P ET to that of the best and worst
  performing patterns after finetuning; we also include results obtained
  using the ensemble of P ET models corresponding to individual PVPs without
  knowledge distillation
  * Even after finetuning, the gap between the best and worst pattern is large,
    especially for Yelp.  However, P ET is not only able to compensate for
    this, but even improves accuracies over using only the best-performing
    pattern across all tasks
  * Distillation brings consistent improvements over the ensemble;
    additionally, it significantly reduces the size of the final classifier. We
  * no clear difference between the uniform and weighted variants of P ET

## Auxiliary Language Modeling, the influence of

* Figure 3 shows performance improvements from adding the language modeling
  * four training set sizes. We see that the auxiliary task is
  * extremely valuable when training on just 10 examples
  * With more data, it becomes less important, sometimes even leading to worse
  * Only for MNLI, we find language modeling to consistently help.

## Iterative P ET, whether iP ET is able to improve models over multiple gens,

* Figure 4: average performance of all generations of models in a zero-shot
  * Each additional iteration does indeed further improve the ensemble
  * We did not investigate continuing this process for even more iterations
* whether similar results can be obtained with fewer iterations
  by increasing the training set size more aggressively. To answer this
  * we skip generations 2 and 3 for AG’s News and Yahoo and for both tasks
    directly let ensemble M 1 annotate 10 · 5^4 examples for M 4 .  As
  * clearly leads to worse performance, highlighting the importance of only
    gradually increasing the training set size
  * We surmise that this is the case because annotating too many examples too
    early leads to a large percentage of mislabeled training examples.

## In-Domain Pretraining

* P ET makes use of the additional unlabeled dataset D. Thus, at least some of
* we simply further pretrain RoBERTa on in-domain data,
  * a common technique for improving text classification accuracy
    (eg Howard and Ruder, 2018; Sun+ 2019). As language model pretraining is
    expensive in terms of GPU usage, we do so only for the Yelp dataset
* Figure 5 shows results of supervised learning and P ET with/out indomain pret
  * pretraining does indeed improve accuracy for supervised training, the
    supervised model still clearly performs worse than P ET , showing that
    the success of our method is not simply due to the usage of additional
    unlabeled data
  * in-domain pretraining is also helpful for P ET , indicating that
    P ET leverages unlabeled data in a way that is clearly different from
    standard masked language model pretraining
