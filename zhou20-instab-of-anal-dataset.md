The Curse of Performance Instability in Analysis Datasets:
  Consequences, Source, and Suggestions
Xiang Zhou, Yixin Nie, Hao Tan, Mohit Bansal
EMNLP 2020

code is publicly available at: https://github.com/owenzx/InstabilityAnalysis

# Abstract

* We: the performance of SOTA models on Natural Language Inference (NLI) and
  Reading Comprehension (RC) analysis/stress sets can be highly unstable
* ? reliability of the conclusions drawn based on these analysis sets?
  * we: a thorough empirical study over analysis sets
  * instability exists all along the training curve
  * lower-than-expected correlations
    between the _analysis_ validation set and standard validation set,
    questioning the effectiveness of the current model-selection routine
* Where does this instability come from?
  * both theoretical explanations and empirical evidence
  * mainly comes from high inter-example correlations within analysis sets
* How should we handle this instability and what are potential solutions?
  * we: initial attempt to mitigate the instability
  * guidelines for future work: reporting the decomposed variance for more
    interpretable results and fair comparison across models

# 1 Introduction

* on two semantically challenging tasks,
  Natural Language Inference (NLI) and Reading Comprehension (RC), the
  SOTA results have reached or even surpassed the estimated human performance
  on certain benchmark datasets (Wang+ 2019; Rajpurkar+ 2016a, 2018)
* Auxiliary analysis datasets for debugging and understanding models
  * a new trend of research to analyze what NLU and reasoning skills are achived
  * analysis approaches to examine models’ ability to capture diff ling phenoms
    (eg named entities, syntax, lexical inference, etc)
  * Those studies are often conducted in 3 steps:
    * proposing assumptions about a certain ability of the model;
    * building analysis datasets by automatic generation or crowd-sourcing;
    * concluding models’ ability using results on these analysis datasets
* discoveries in NLP models, such as
  * over-stability (Jia and Liang, 2017),
    Robin Jia and Percy Liang. 2017
    Adversarial examples for evaluating reading comprehension systems
    EMNLP 2017
  * surface pattern overfitting (Gururangan+ 2018)
  * McCoy+ (2019a): the results of different runs of BERT NLI models have large
    non-negligible variances on the HANS (McCoy+ 2019b) analysis datasets,
    contrasting sharply with their stable results on standard validation set
    across multiple seeds => concerns regarding
    * the reliability of results on those datasets,
    * the conclusions made upon these results, and
    * lack of reproducibility (Makel+ 2012)
* we conduct a deep investigation on model instability, showing
  how unstable the results are, and how such instability
  compromises the feedback loop between model analysis and model development
  1. empirical study of several representative models on NLI & RC
    * four worrisome observations
    * The final results of the same model with different random seeds on
      several analysis sets are of significantly high variance
      * The largest variance is more than 27 times of that for standard dev set
    * These large instabilities on certain datasets is model-agnostic
      * ie certain datasets have unstable results across different models;
    * The instability not only occurs at the final performance but
      exists all along training trajectory, as shown in Fig. 1;
    * The results of the same model on analysis sets and on the standard
      development set have low correlation => hard to draw any construv conclus
      * questioning the effectiveness of the standard model-selection routine
  2. theoretical explanations behind this instability
    * inter-examples correlation within the dataset is the dominating factor
      causing this performance instability
    * the variance of model accuracy on the entire analysis set can be decomped
      1. the sum of single-data variance
      (the variance caused by individual pred randomness on each example)
      2. the sum of inter-data covariance
      (caused by the correlation between different predictions)
    * To understand the latter term better, consider the following case:
      if there are many examples correlated with each other in the eval set,
      then the change of prediction on one example will influence preds on all
      the correlated examples, causing high variances in final accuracy
    * We estimate these two terms with multiple runs of experiments
      * inter-data covariance contributes significantly more than single-data
        variance to final accuracy variance, ie major role in instability
  3. suggestions
    * in order for the continuous progress, trustworthy and interpretab results
    * how to perceive the implication of and handle this instability issue
      1. when reporting means and variance over multiple runs,
      also report two decomposed variance terms
      (ie sum of single data variance and sum of inter-data covariance)
      for more interpretable results and fair comparison across models;
      2. focus on designing models with better inductive and structural biases,
      datasets with higher linguistic diversity
* Our contribution is 3-fold
  * a thorough empirical study of the instability in perf on analysis datasets
  * we demonstrate theoretically and empirically that
    the performance variance is attributed mostly to inter-example correlations
  * suggestions on how to deal with instability, including
    * reporting the decomposed variance for more interpretable evaluation and
      better comparison

# 2 Related Work

## NLI and RC Analysis

* NLI
  * word/phrase level lexical/semantic inference
    (Glockner+ 2018; Shwartz and Dagan, 2018; Carmona+ 2018)
  * syntactic-related (McCoy+ 2019b; Nie+ 2019; Geiger+ 2019)
  * logical-related (Minervini and Riedel, 2018; Wang+ 2019)
  * Naik+ (2018a): a suite of analysis sets covering different linguistic pheno
* In RC, adversarial style analysis to test the robustness of the models
  (Jia and Liang, 2017)
  * Most of the work follows the style of Carmona+ (2018) to
    diagnose/analyze models’ behavior on pre-designed analysis sets
* we analyze NLI and RC models from a broader perspective by inspecting models’
  performance across different analysis sets, and their inter/intra-dataset rel

## Dataset-Related Analysis

* meta-issues of the dataset
* undesirable bias (The most well-known issue)
  * In visual question answering datasets, unimodal biases were found,
    compromising their authority on multimodality evaluation
    (Jabri+ 2016; Goyal+ 2017)
  * In RC, passage-only models can achieve decent accuracy
    (Kaushik and Lipton 2018)
  * In NLI, hypothesis bias was also found in Stanford NLI and Multi-Genre NLI
    (Tsuchiya, 2018; Gururangan+ 2018)
* spurious shortcuts in the dataset and their harmful effects on models
* To mitigate these problems
  * Liu+ (2019a): a systematic task-agnostic method to analyze datasets
  * Rozen+ (2019) further explain how to improve challenging datasets and
    why diversity matters
  * Geva+ (2019): training and test data should be from exclusive annotators
    to avoid annotator bias

## Robustifying NLI and RC Models

* NLI
  * model ensemble (Clark+ 2019; He+ 2019)
  * novel training mechanisms (Pang+ 2019; Yaghoobzadeh+ 2019)
  * adversarial data augmentation (Nie+ 2020)
  * enhancing word representations (Moosavi+ 2019)
* RC
  * different training objectives (Yeh and Chen, 2019; Lewis and Fan, 2019)
* improvements have been made on certain analysis datasets,
  hE the stability of the results is not examined

## Instability in Performance

* in deep reinforcement learning (Irpan, 2018)
* in active learning (Bloodgood and Grothendieck, 2013)
* supervised learning is [unstable even] with fixed datasets and labels
  * McCoy+ (2019a): high variance in NLI-models perf on the analysis dataset
  * Phang+ (2018): high variances in fine-tuning pre-trained models
    in several NLP tasks on the GLUE Benchmark
  * Reimers & Gurevych (2017, 2018): conclu based on single run perf unreliable
  * Weber+ (2018): the model’s ability to generalize beyond the training distri
    depends greatly on the random seed
  * Dodge+ (2020): weight initialization and training data order
    both contribute to the randomness in BERT performance
  * we: a comprehensive explanation and analysis of the instability of neural
    models on analysis datasets and general guidance for future work

# 3 The Curse of Instability

## 3.3 What are the Concerns?

### Instability in Final Performance

* Fig. 2, the results of different runs for BERT, RoBERTa, and XLNet are highly
  stable on MNLI-m, MNLI-mm, and SNLI => model performance on standard
  validation datasets regardless of domain consistency are fairly stable
  * Here SNLI and MNLI-m share the same domain as the training set while
    MNLI-mm is from different domains
* This stability also holds on some analysis sets, especially on SNLI-hard,
  which is a strict subset of the SNLI validation set
* hE noticeable high variances on some analysis sets
  * most significant ones are on STR-NU and HANS where
    points are sparsely scattered with a
    * 10-point gap between the highest and the lowest number for STR-NU and a
    * 4-point gap for HANS

### Model-Agnostic Instability

* Regardless of the model choice, some of the analysis datasets (eg HANS,
  STR-O, STR-N) are significantly more unstable (with standard deviation 27
  times larger in the extreme case) than the standard evaluation datasets
* Similarly, for RC, the normalized deviation of model F1 results on SQuAD
  almost doubled when evaluated on AddSent, as shown in Table 2 + Appendix

### Fluctuation in Training Trajectory

* We choose
  * HANS and STR-NU as our example unstable analysis datasets because their
    variances in final performance are the largest
  * SNLI and MNLI-m for standard validation set comparison
* Fig. 1: the training curve
  * on MNLI and SNLI (the top two lines) is highly stable
  * significant fluctuations in the HANS and STR-NU trajectories
  * Besides the mean and standard deviation over multiple runs, we also show
    the accuracy of one run as the bottom dashed line in Fig. 1
* two adjacent checkpoints can have
  a dramatically large performance gap on STR-NU
  * very likely to be one of the reasons for the instability in the final perf

### Low Correlation between Datasets

* high correlation (> 0.95) among standard validation datasets
  (eg MNLI-m, MNLI-mm, SNLI)
* hE low correlations between other dataset pairs, especially when pairing
  STR-O or STR-NU with MNLI or SNLI
  * can bring useful insights for analysis
  * performance on the standard validation set is not representative enough for
    certain analysis set performances
  * comparison/conclusions drawn from analysis datasets’ results from model
    selection on standard evaluation sets may be unreliable

# 4 Tracking Instability

## 4.1 Inter-Example Correlations

* two potential sources
  * the individual prediction of each example may be highly unstable
    so that the prediction is constantly changing
  * there might be strong inter-example correlations in the datasets such that
    a large proportion of predictions are more likely to change simultaneously,
    thus causing large instability
* Here we show that the second reason is the major factor
* We examine the correlation between different example prediction pairs
  during the training process
  * Fig. 4: inter-example Spearman’s correlation on MNLI and HANS
    * a clear difference between the inter-example correlation in stable (MNLI)
      datasets versus unstable (HANS) datasets
    * For stable datasets (MNLI), the correlations between the predictions of
      examples are uniformly low, while
    * for unstable datasets (HANS), there exist clear groups of examples with
      very strong inter-correlation between their predictions
    * suggests that those groups could be a major source of instability
      if they contain samples with frequently changing predictions

## 4.2 Variance Decomposition

* different trend of total variance and independent variance
  * similar avgs of the independent variance on standard and analysis datasets
  * hE a large gap between the averages of covariances on different datasets =>
    inter-example correlation is the major reason for the difference of
    variance on the analysis datasets

## 4.3 Highly-Correlated Cases

* the largest variance happens in HANS, several subsets of STR, and EQU-SYN
  * SNLI-hard and EQU-NAT: variance is much smaller than the former ones
  * high-variance datasets are usually created with the help of synthetic rules
* in Figure 4, clear boundaries of blocks of high-correlation examples in the
  right sub-figure (for HANS dataset)
  * examples in HANS are ordered by its templates, examples in the same block
    are created using the same template
    * synthetic rules may cause preds to be more correlated with each other =>
      the distributions of analysis datasets are less diverse
      than the distributions of standard datasets

# 5 Implications, Suggestions, and Discussion

* solving this issue via dataset resplitting?
  * below we first present one initial attempt at illustrating the difficulty

### Limitation of Model Selection

* now exper: if an oracle model selection process can help reduce instability
  * analysis sets are often proposed as a single set without dev/test splits
  * In Sec. 4, we observe that models’ performances on analysis sets have
    little correlation with model performance on standard validation sets,
    making the selection model routine useless for reducing performance
  * oracle model selection by dividing the original analysis set into an 80%
    analysis-dev dataset and a 20% analysis-test dataset
  * Model selection based on the high correlation between dev/test sets
* Table 6 compares the results of BERT-B on the new analysis-test
  with model selection based on the results on
  either MNLI or the corresponding analysis-dev
  * model selection on analysis-dev
    * helps increase the mean performance on several datasets 6
      * especially on HANS, STR-O, and STRNU, indicating the expected high
        correlation inside the analysis set
    * hE variances of final results are not always reduced for diff datasets
  * Hence, besides the performance instability caused by noisy model selection,
    different random seeds indeed lead to models with different performance on
    analysis datasets
    * might indicate/hint that
      * performance instability is relatively independent of the mean perf
      * current models may have intrinsic randomness
        brought by different random seeds which is
        unlikely to be removed through simple dataset/model fixes

## Implications of Result Instability

* If the intrinsic randomness in the model prevents a quick fix,
  what does this instability issue imply?
* These datasets can still serve as good evaluation tools as long as we are
  aware of the instability issue and report results with multiple runs

## Short/Long Term Suggestions

### Better Analysis Reporting (Short Term)

### Model and Dataset Suggestions (Long Term)

* improving models so that they can get high accuracy stably
  * better inductive biases,
  * large-scale pre-training with tasks concerning structure/compositionality
* more diverse datasets (in terms of syntax and lexicon)
  * natural real-life sources usually lead to
    lower covariance between predictions and better stability
  * Manual verification for synthetic examples
    also helps reduce the instability of analysis datasets

# Conclusion
