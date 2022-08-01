The Curse of Performance Instability in Analysis Datasets:
  Consequences, Source, and Suggestions
Xiang Zhou, Yixin Nie, Hao Tan, Mohit Bansal
EMNLP 2020

code is publicly available at: https://github.  com/owenzx/InstabilityAnalysis

# Abstract

* We: the performance of SOTA models on Natural Language Inference (NLI) and
  Reading Comprehension (RC) analysis/stress sets can be highly unstable
* ? reliability of the conclusions drawn based on these analysis sets?
  * we: a thorough empirical study over analysis sets
  * in addition to the unstable final performance, the
    instability exists all along the training curve
  * lower-than-expected correlations between the analysis validation set and
    standard validation set,
    questioning the effectiveness of the current model-selection routine
* Where does this instability come from?
  * both theoretical explanations and empirical evidence regarding the source
  * mainly comes from high inter-example correlations within analysis sets
* How should we handle this instability and what are potential solutions? For
  * we: initial attempt to mitigate the instability
  * guidelines for future work such as
    * reporting the decomposed variance
      for more interpretable results and fair comparison across models

# 1 Introduction

* on two semantically challenging tasks,
  Natural Language Inference (NLI) and Reading Comprehension (RC), the
  SOTA results have reached or even surpassed the estimated human performance
  on certain benchmark datasets (Wang+ 2019; Rajpurkar+ 2016a, 2018)
* Auxiliary analysis datasets for debugging and understanding models
  * a new trend of research to analyze what language understanding and
    reasoning skills are actually achieved
  * analysis approaches to examine models’ ability to capture diff ling phenom
    (eg named entities, syntax, lexical inference, etc.).
  * Those studies are often conducted in 3 steps: 
    * proposing assumptions about a certain ability of the model; 
    * building analysis datasets by automatic generation or crowd-sourcing; 
    * concluding models’ ability using results on these analysis datasets.  
* discoveries in NLP models, such as
  * over-stability (Jia and Liang, 2017),
  * surface pattern overfitting (Gururangan+ 2018), but recently
  * McCoy+ (2019a): the results of different runs of BERT NLI models have large
    non-negligible variances on the HANS (McCoy+ 2019b) analysis datasets,
    contrasting sharply with their stable results on standard validation set
    across multiple seeds
  => concerns regarding the reliability of results on those datasets, the
  conclusions made upon these results, and lack of reproducibilit (Makel+ 2012)
* we conduct a deep investigation on model instability, showing
  how unstable the results are, and how such instability compromises the
  feedback loop between model analysis and model development.
* We start from an empirical study of several representative models on NLI & RC
  * four worrisome observations in our experiments: 
  * The final results of the same model with different random seeds on
    several analysis sets are of significantly high variance
    * The largest variance is
      more than 27 times of that for standard development set; 
  * These large instabilities on certain datasets is model-agnostic
    * ie Certain datasets have unstable results across different models; 
  * The instability not only occurs at the final performance but
    exists all along training trajectory, as shown in Fig. 1; 
  * The results of the same model on analysis sets and on the standard
    development set have low correlation
    => hard to draw any constructive conclusion and
    * questioning the effectiveness of the standard model-selection routine.
* Next, theoretical explanations behind this instability
  * inter-examples correlation within the dataset is the dominating factor
    causing this performance instability
  * the variance of model accuracy on the entire analysis set can be decomposed
    1. the sum of single-data variance
      (the variance caused by individual prediction randomness on each example)
    2. the sum of inter-data covariance
      (caused by the correlation between different predictions)
  * To understand the latter term better, consider the following case:
    if there are many examples correlated with each other in the eval set,
    then the change of prediction on one example will influence predictions on
    all the correlated examples, causing high variances in final accuracy
  * We estimate these two terms with multiple runs of experiments and show that
    inter-data covariance contributes significantly more than single-data
    variance to final accuracy variance, indicating its major role in the cause
    of instability.
* Finally, suggestions
  * in order for the continuous progress of the community to be built upon
    trustworthy and interpretable results
  * how to perceive the implication of this instability issue and how we should
    potentially handle it. For this, we encourage future research to: 
  1. when reporting means and variance over multiple runs,
    also report two decomposed variance terms
    (ie sum of single data variance and sum of inter-data covariance)
    for more interpretable results and fair comparison across models; 
  2. focus on designing models with better inductive and structural biases, and
     datasets with higher linguistic diversity.
* Our contribution is 3-fold
  * a thorough empirical study of the instability issue in models’ performance
    on analysis datasets
  * we demonstrate theoretically and empirically that
    the performance variance is attributed mostly to inter-example correlations
  * suggestions on how to deal with instability, including
    * reporting the decomposed variance for more interpretable evaluation and
      better comparison.

# 2 Related Work

## NLI and RC Analysis

* In NLI, some analyses target
  * word/phrase level lexical/semantic inference
    (Glockner+ 2018; Shwartz and Dagan, 2018; Carmona+ 2018), some are more
  * syntactic-related (McCoy+ 2019b; Nie+ 2019; Geiger+ 2019), some also
  * logical-related study (Minervini and Riedel, 2018; Wang+ 2019).
  * Naik+ (2018a): a suite of analysis sets covering different linguistic pheno
* In RC, adversarial style analysis to test the robustness of the models
  (Jia and Liang, 2017)
  * Most of the work follows the style of Carmona+ (2018) to diagnose/analyze
    models’ behavior on pre-designed analysis sets
* we analyze NLI and RC models from a broader perspective by inspecting models’
  performance across different analysis sets, and their inter/intra-dataset rel

## Dataset-Related Analysis

* meta-issues of the dataset. The most well-known one is the analysis of
* undesirable bias
  * In VQA datasets, unimodal biases were found, compromising their authority
    on multimodality evaluation (Jabri+ 2016; Goyal+ 2017)
  * In RC, Kaushik and Lipton (2018) found that passage-only models can achieve
    decent accuracy
  * In NLI, hypothesis bias was also found in SNLI and MultiNLI
    (Tsuchiya, 2018; Gururangan+ 2018)
* spurious shortcuts in the dataset and their harmful effects on models
* To mitigate these problems
  * Liu+ (2019a): a systematic task-agnostic method to analyze datasets.
  * Rozen+ (2019) further explain how to improve challenging datasets and
    why diversity matters
  * Geva+ (2019): the training and test data should be from exclusive
    annotators to avoid annotator bias.  Our work is complementary to those

## Robustifying NLI and RC Models

* NLI
  * model ensemble (Clark+ 2019; He+ 2019)
  * novel training mechanisms (Pang+ 2019; Yaghoobzadeh+ 2019)
  * adversarial data augmentation (Nie+ 2020)
  * enhancing word representations (Moosavi+ 2019)
* RC 
  * different training objectives (Yeh and Chen, 2019; Lewis and Fan, 2019).
* improvements have been made on certain analysis datasets, 
  hE the stability of the results is not examined

## Instability in Performance. Performance instability has already been

* in deep reinforcement learning (Irpan, 2018) and
  active learning (Bloodgood and Grothendieck, 2013)
* supervised learning is [not] stable [even] with fixed datasets and labels
  * McCoy+ (2019a) show high variances in NLI-models performance on the
    analysis dataset
  * Phang+ (2018): high variances in fine-tuning pre-trained models in several
    NLP tasks on the GLUE Benchmark
  * Reimers and Gurevych (2017, 2018) state that conclusions based on single
    run performance may not be reliable for machine learning approaches
  * Weber+ (2018) found that the model’s ability to generalize beyond the
    training distribution depends greatly on the random seed
  * Dodge+ (2020) showed weight initialization and training data order both
    contribute to the randomness in BERT performance
  * we: a comprehensive explanation and analysis of the instability of neural
    models on analysis datasets and give general guidance for future work.

# 4 Tracking Instability

## 4.1 Inter-Example Correlations

* the individual prediction of each example may be highly unstable so that the
   prediction is constantly changing
* there might be strong inter-example correlations in the datasets such that a
  large proportion of predictions are more likely to change simultaneously,
  thus causing large instability
* Here we show that the second reason, ie
  the strong inter-example prediction correlation is the major factor.

# Conclusion
