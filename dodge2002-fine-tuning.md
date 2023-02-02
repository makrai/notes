Fine-Tuning Pretrained Language Models:
  Weight Initializations, Data Orders, and Early Stopping
Jesse Dodge, Gabriel Ilharco, Roy Schwartz, Ali Farhadi, H Hajishirzi, N Smith
arXiv:2002.06305 hivatalos helyen tudtommal nem jelent meg, 200+ hivatkozás
  nem tudom, hogy amiatt-e mert annyira jó, vagy csak Noah Smith miatt

# Abstract

* Fine-tuning pretrained contextual word embeddings to supervised downstream
  * often brittle: even with the same hyperparameter values,
    distinct random seeds can lead to substantially different results
* we experiment with
  * four datasets from the GLUE benchmark
  * fine-tuning BERT hundreds of times on each while varying only the random
  * substantial performance increases compared to previously reported results,
  * we quantify how the performance of the best-found model varies as a
    function of the number of fine-tuning trials [ie budget]
  * we examine two factors influenced by the choice of random seed:
    weight initialization and training data order
    * both contribute comparably to the variance of out-of-sample performance,
    * some weight initializations perform well across all tasks explored
  * On small datasets, we observe that
    many fine-tuning trials diverge part of the way through training
    * related work: STILTs (Phang+ 2018) reduced the number of diverging models
  * we offer best practices to stop training less promising runs early
  * We publicly release all of our experimental data, including
    * training and validation scores for 2,100 trials,
      to encourage further analysis of training dynamics during fine-tuning
    * thousands of fine-tuning episodes is publicly released

# 1. Introduction

* fine-tuning process is brittle
  (Devlin+ 2019; Phang+ 2018; Zhu+ 2019; Raffe+ 2019)
* In this work, we investigate this variation by conducting
  a series of fine-tuning experiments on four tasks in the GLUE benchmark
  * Changing only
    training data order and the weight initialization of the fine-tuning layer
    we find substantial variance in performance across trials
* We explore how validation performance of the best found model varies with the
  number of fine-tuning experiments, finding that,
  even after hundreds of trials, performance has not fully converged
* With the best found performance across all the conducted experiments
  * On MRPC (Dolan & Brockett, 2005), BERT performs better than the more recent
    XLNet (Yang+ 2019), RoBERTa (Liu+ 2019) and ALBERT (Lan+ 2019)
  * on RTE (Wang+ 2018) and CoLA (Warstadt+ 2019), we observe a 7% (absolute)
    improvement over previous results with the same model
  * a reminder of the value of more rigorous reporting practices (Dodge+ 2019)
* two factors that affect the high variance across fine-tuning episodes
  * the weight initialization for the task-specific layer; and
    the training data order resulting from random shuffling
    * previously been conflated or overlooked, even by works that recognize the
      importance of multiple trials or random initialization (Phang+ 2018)
* we: experiments with multiple combinations of random seeds that control each
  of these factors, we quantify their contribution to the variance across runs
  * some seeds are consistently better than others in a given dataset for both
    weight initializations and data orders
  * some weight initializations perform well across all studied tasks
* By frequently evaluating the models through training, we empirically observe:
  worse performing models can often be distinguished from better ones early 
  * motivating investigations of early stopping strategies
* a simple early stopping algorithm (sec 5) is an effective strategy for
  reducing the computational resources needed to reach a given validation perf
  * practical recommendations for a wide range of computational budgets
* To encourage further research in analyzing fine-tuning dynamics,
  we publicly release all of our experimental data. This includes, for each of
  the 2,100 fine-tuning episodes, the training loss at every weight update, and
  validation performance on at least 30 points in training
* contributions
  * multiple trials with different random seeds can lead to substantial gains
    in performance on four datasets from the GLUE benchmark
    * we present how the performance of the best found model changes as a
      function of the number of trials
  * We investigate weight initialization and training data order as two sources
    of randomness in fine-tuning by varying random seeds that control them,
    * they are comparable as sources of variance in performance
    * in a given dataset, some data orders and weight initializations are
      consistently better than others
    * some weight initializations perform well across multiple tasks
  * We demonstrate how a simple early stopping algorithm can effectively be
    used to improve expected performance using a given computational budget
  * We release all of our collected data of 2,100 fine-tuning episodes on
    four popular datasets from the GLUE benchmark to incentivize further anal

# 2. Methodology 2

# 3. The large impact of random seeds

* sizable variance in performance across trials varying only random seeds
* especially pronounced on the smaller datasets; the validation performance
  of the best found model from multiple experiments is substantially higher
* Table 1: performance of the best model from all conducted experiments,
* substantial gains compared to previous work that uses the same model and
  optimization procedure
* On some datasets, we observe numbers competitive with more recent models
  with improved pretraining regimes (Phang+ 18; Yang+ 19; Liu+ 19; Lan+ 19);
  * pretrained on more data, and some utilize more sophisticated modeling or
    optimization strategies

## 3.1. Expected validation performance

* expected validation performance as introduced by Dodge+ (2019)
  * train dev test = training x models, evaluating each of them on validation,
    then taking the model which has the best validation performance
  * as the number of trained models x increases,
    the best of those x models will improve
  * expected validation performance calculates the expected value of the best
    validation performance as a function of x. 4
* fig 1: expected validation curves for each dataset
  * The leftmost point on each of these curves (x = 1) shows the
    expected performance for a budget of a single training run
  * rising trend continues even up to our largest budget,
    suggesting even larger budgets could lead to improvements
  * On the three smaller datasets (MRPC, RTE, and CoLA) there is
    significant variance at smaller budgets, which indicates that
    individual runs can have widely varying performance
* In the most common setup for fine-tuning on these datasets,
  models are evaluated on the validation data after each epoch, or
  once after training for multiple epochs
  (Phang+ 2018; Devlin+ 2019)
  * Figure 1 shows expected performance as we vary the number of evaluations on
    validation data during training (all models trained for three epochs):
    once after training (green), after each of the three epochs (orange), and
    frequently throughout training (ten times per epoch, blue)
  * more frequent evaluations are recommended in similar scenarios

# 4. Weight initialization and data order 4

* Figure 2: each colored cell represents validation performance
  * each row/column represents a single weight initialization/data order
  * We sort the rows and columns by their averages (top and row are highest)
* Compared to training, evaluation is typically cheap,
  since the validation set is smaller than the training set and
  evaluation requires only a forward pass
  * Moreover, evaluating on the validation data can be done in parallel to
    training, and thus does not necessarily slow down training
* Table 3
  * Expected (average) standard deviation in validation performance across runs
  * The expected std of given WI and DO random seeds are close in magnitude,
    and only slightly below the overall standard deviation
* For MRPC, RTE, and CoLA, a fraction of the trained models diverge, yielding
  performance close to that of predicting the most frequent label (Table 2)
  * explains the large variance found in the expected valid curves in Fig 1

## 4.1. Decoupling

* For each dataset, for each WI and for each DO seed
  the standard deviation in validation performance across all trials
  * then  expected (average) standard deviation, aggregated under all WI & DO
  * distribution of standard deviations in the appendix
  * Although their magnitudes vary significantly between the datasets, the
    expected standard deviation from the WI and DO seeds is comparable, and are
    slightly below the overall standard deviation inside a given task

## 4.2. Some random seeds are better than others

* On MRPC, RTE, and CoLA the performance of the best and worst WIs are more
  dissimilar than the best and worst DOs, while on SST the opposite is true
  * could be related to the size of the data
  * MRPC, RTE, and CoLA are smaller datasets, whereas SST is larger, so
    SST has more data to order and more weight updates to move away from init
* ANOVA (Fisher, 1935) to test for statistical significance, we examine
  whether the performance of the best and worst DOs and WIs have diff means
  * Table 4
  * For all datasets, we find the best and worst DOs and WIs are signific diff
  * a discussion of the assumptions behind ANOVA in the appendix

## 4.3. Globally good initializations

* While the data order is dataset specific,
  the same weight initialization can be applied with different datasets,
  since all tasks studied are binary classification
* We compare the different weight initializations across datasets
  * some initializations perform consistently well
  * eg WI seed 12 has the best performance on CoLA and RTE, the second best on
    MRPC, and third best on SST
* Studying the properties of good weight initializations and data orders: futur
  * we release the results of our 2,100 fine-tuning experiments to facilitate

# 5. Early stopping

* In this section we show that
  * better performance can be achieved with the same computational resources by
    using early stopping algorithms that stop the least promising trials early
  * recommendations for practitioners for setting up experiments
    meeting a variety of computational budgets

## Early discovery of failed experiments

* Fig 4: perf diverg can be recognized early
* performance values of 20 randomly chosen models at different times
* eg after training halfway through the first epoch on CoLA,
  the models which diverged could be stopped
* the correlation of validation performances at diff points in train, fig 5
  * Spearman’s rank corr between performance at iteration i and j across trials
  * High rank correlation suggests we can stop the worst perf models early
* On MRPC, RTE and CoLA, there exists a high correlation between the models’
  performance early on (part way through the first epoch) and their final perf
* On the larger SST dataset, we see high correlation between the performance
  after training for two epochs and the final performance

## Early stopping: we analyze a simple algorithm

* inspired by existing approaches to making hyperparameter search more
  efficient by stopping some of the least promising experiments early
  (Jamieson & Talwalkar, 2016; Li+ 2018)
* approach does not distinguish between DO and WI
  * While initial results suggest that this distinction could inspire
    more sophisticated early-stopping criteria, we defer this to future work
* we: an early stopping algorithm to select the best performing random seed. 11
* three parameters: t, f, p, and s
* start by training t trials, and
  partially through training (f, a fraction of the total number of epochs)
  evaluate all of them and only continue to fully train the p most promising
  * takes a total of (tf + p(1 − f ))s steps, where
  * s: the number of steps to fully train a model, In our expers, s = 3 epochs

## Start many, stop early, continue some

* Figure 6 shows the best observed assignment of these parameters
  for budgets between 3 and 90 total epochs of training, or
  the equivalent of 1 to 30 complete training trials
* There are some surprisingly consistent trends across datasets and budgets –
  * the number of trials started should be significantly higher than the number
    trained fully, and
    the number of trials to train fully should be around x/2
* On three out of four datasets, stopping least promising trials after 20–30%
  of training (less than one epoch) yielded the best results—
  * on the fourth dataset this is still a strong strategy

## Early stopping works

* We compare this algorithm to running multiple experiments all the way
* for a given computational budget equivalent to fully training t models
* Figure 7 shows the relative error reduction for each dataset as the
  computational budget varies, where we observe
  small but reasonably consistent improvements on all tasks

# 6. Related work 7

* hyperparameter optimization
  * eg learning rate, the width of the layers, and the strength of the
    regularization (Li+ 2018; Bergstra+ 2011)
  * large impact on the performance; in this work we only examine two oft-overl
* Melis+ (2018) heavily tuned the hyperpamareters of an LSTM language model,
  for some experiments running 1,500 rounds of Bayesian optimization (thus,
  training 1,500 models). They showed that
  * an LSTM, when given such a large budget for hyperparameter tuning, can
    outperform more complicated neural models
  * such work informs the community about the best performance found after
    expending very large budgets
  * hE difficult for future researchers to build on this without some measure
    of how the performance changes as a function of computational budget
* the distribution from which initializations are drawn
  * Xavier (Glorot & Bengio, 2010) and Kaiming initialization (He+ 2015)
    * both initialize weights by sampling from a uniform or normal distribution
    * variance scaled so as to preserve gradient magnitudes through backprop
  * orthogonal initializations (Saxe+ 2014) aim to
    prevent exploding or vanishing gradients
* Active learning techniques
  * choose a data order using a criterion such as the model’s uncertainty
    (Lewis & Gale, 1994)
  * training on mini-batches which are diverse in terms of data or labels
    (Zhang+ 2017) can be more sample efficient
  * The tools we present here can be used to
    * evaluate different seeds for a stochastic active learning algorithm, or
    * compare different active learning algorithms
