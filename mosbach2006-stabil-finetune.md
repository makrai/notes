On the Stability of Fine-tuning BERT:
  Misconceptions, Explanations, and Strong Baselines
Marius Mosbach, Maksym Andriushchenko, Dietrich Klakow
ICLR 2021 arXiv:2006.04884 [cs.LG]

code to reproduce: https://github.com/uds-lsv/bert-stable-fine-tuning

# Abstract

* fine-tuning is an unstable process
  * multiple random seeds can result in a large variance of the task performanc
* Devlin+ (2019); Lee+ (2020); and Dodge+ (2020) identified two potentl reasons
  * catastrophic forgetting and small size of the fine-tuning datasets
* we show that both hypotheses fail to explain the fine-tuning instability
  * we analyze BERT, RoBERTa, and ALBERT,
    fine-tuned on commonly used datasets from the GLUE benchmark
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
    * the standard recipe for using such models:
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
  * The goal of this work is to address this shortcoming
  * Why is fine-tuning prone to failures and how can we improve its stability?
* We start by investigating two common hypotheses for fine-tuning instability:
  * catastrophic forgetting and small size of the fine-tuning datasets
  * both hypotheses fail to explain fine-tuning instability
  * investigate fine-tuning failures on datasets from GLUE
    * fine-tuning instability can be decomposed into two separate aspects:
      * optimization difficulties early in training,
        characterized by vanishing gradients,
      * differences in generalization late in training,
        characterized by a large variance of development set accuracy for runs
        with almost equivalent training loss
* a simple but strong baseline for fine-tuning pre-trained language models
  * significantly improves the fine-tuning stability compared to previous work
  * Figure 1:
    * very stable results with very concentrated development set performance
      over 25 different random seeds across all three datasets on BERT
    * significantly outperform the recently proposed approach of Lee+ (2020)
      in terms of fine-tuning stability
* our findings apply also to more recent pre-trained models
  such as RoBERTa and ALBERT

# 2 Related work

* fine-tuning instability of BERT pointed out
  * Devlin+ (2019)
    * instabilities when fine-tuning BERT LARGE on small datasets and
    * resort to performing multiple restarts of fine-tuning and
      selecting the model that performs best on the development set
  * Dodge+ (2020)
    * a large-scale empirical investig of the fine-tuning instability of BERT
    * dramatic variations in fine-tuning accuracy across multiple restarts
    * it may be related to the choice of random seed and the dataset size
* directly address the fine-tuning instability: few approaches
  * Phang+ (2018) intermediate task training (STILTS) before fine-tuning
    * goal: improving performance on the GLUE benchmark
    * their proposed method leads to improved fine-tuning stability
    * not directly comparable to our work
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

### CoLA. The Corpus of Linguistic Acceptability (Warstadt+ 2018)

* a sentence-level classification task containing sentences labeled as either
  grammatical or ungrammatical
* Fine-tuning on CoLA was observed to be particularly stable in previous work
  (Phang+ 2018; Dodge+ 2020; Lee+ 2020)
* Matthew’s correlation coefficient (MCC)

### MRPC. The Microsoft Research Paraphrase Corpus (Dolan and Brockett, 2005)

* sentence-pair classification task
* model has to judge whether the sentences paraphrases of each other
* Performance is measured using the F 1 score

### RTE. The Recognizing Textual Entailment dataset

* sentence-pairs collected from a series of textual entailment challenges
  (Dagan+ 2005; Bar-Haim+ 2006; Giampiccolo+ 2007; Bentivogli+ 2009)
* the second smallest dataset in the GLUE benchmark
* fine-tuning on RTE was observed to be particularly unstable
  (Phang+ 2018; Dodge+ 2020; Lee+ 2020)
* Accuracy is used to measure performance

### QNLI. The Question-answering Natural Language Inference dataset

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
          skew badly toward those features ~~ or worse, toward incidental
          features that aren't truly related to the topic at all
        * Warm-up is a way to reduce the primacy effect of the early examples
        * Without it, you may need to run a few extra epochs to get the
          convergence desired, as the model un-trains those early superstitions
    * linearly decreased to 0 afterward
  * dropout with probability p = 0.1 and weight decay with λ = 0.01
  * 3 epochs on all datasets and global gradient clipping
  * the AdamW optimizer (Loshchilov and Hutter, 2019) without bias correction
* We not show results for BERT BASE
  since no instability when fine-tuning BERT BASE
  (both previous works and we observed this)
* we show additional results on
  RoBERTa LARGE (Liu+ 2019) and ALBERT LARGE-V2 (Lan+ 2020)
  using the same fine-tuning strategy
  * compared to BERT, both RoBERTa and ALBERT have slightly diff hyperparams
    * RoBERTa uses weight decay with λ = 0.1 and no gradient clipping, and
    * ALBERT does not use dropout
    * A detailed list of all default hyperparameters for all models: sec 7.3
* Our implementation is based on HuggingFace’s transformers lib (Wolf+ 2019)

### Fine-tuning stability

* By fine-tuning stability we mean the
  standard deviation of the fine-tuning performance (measured, eg, in terms
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

* two hypotheses for what can be related to fine-tuning instability:
  catastrophic forgetting and small training data size of the downstream tasks
* ubiquity of these hypotheses
  (Devlin+ 2019; Phang+ 2018; Dodge+ 2020; Lee+ 2020)
* we argue that none of them has a causal relationship with fine-tuning instab

## 4.1 Does catastrophic forgetting cause fine-tuning instability?

* Catastrophic forgetting (McCloskey and Cohen, 1989; Kirkpatrick+ 2017)
  * neural network is sequentially trained to perform two different tasks, and
    it loses its ability to perform the first task
    after being trained on the second
  * in our setup: after fine-tuning a pre-trained model, it can no longer
    perform the original masked language modeling task used for pre-training
  * can be measured in terms of the perplexity on the original training data
    * the language modeling performance of a pre-trained model correlates with
      its fine-tuning accuracy (Liu+ 2019; Lan+ 2020),
    * no clear motivation for why preserving the original MLM performance after
      fine-tuning is important
      * only where supervised fine-tuning as an intermediate training step,
        eg with the goal of domain adaptation
      * We leave an investigation of this setting for future work
* In the context of fine-tuning BERT,
  Lee+ (2020)'s regularization method has an effect of alleviating catastr forg
* how exactly catastrophic forgetting occurs during fine-tuning
  and how it relates to the observed fine-tuning instability
* we perform the following experiment:
  * fine-tune BERT on RTE, following the default strategy by Devlin+ (2019)
  * select three successful and three failed fine-tuning runs and
    evaluate their masked language modeling perplexity
    on a subset of BERT's training data
    * on the test set of the WikiText-2 LM benchmark (Merity+ 2016)
    * BERT was trained on English Wikipedia
  * sequentially substitute the top-k layers of the network
    varying k from 0 (i.e. all layers are from the fine-tuned model)
    to 24 (i.e.  all layers are from the pre-trained model)
* results in Fig. 2 (a) and (b)
  * catastrophic forgetting occurs for the failed models (Fig. 2a) —
    * perplexity on WikiText-2 is indeed degraded for k = 0
    * affects only the top layers of the network
    * around 10 out of 24 layers
  * same for the successfully fine-tuned models, except for a
    much smaller increase in perplexity
* catastrophic forgetting typically requires that the model at least
  successfully learns how to perform the new task
  * not the case for the failed fine-tuning runs
  * both devel acc and fine-tuning loss equal to that of the majority class
* This suggests that the observed fine-tuning failure is rather
  an optimization problem causing catastrophic forgetting in the top layers
  * We will show later that the optimization aspect is actually
    sufficient to explain most of the fine-tuning variance

## 4.2 Do small training datasets cause fine-tuning instability?

* by far the most commonly stated hypothesis for fine-tuning instability
  (Devlin+ 19; Phang+ 18; Lee+ 20; Zhu+ 20; Dodge+ 20; Pruksachatkun+ 20)
* do small training dataset inherently lead to fine-tuning instability
* experiment
  * similar experiment (Phang+ 2018) with a different goal of showing that
    their extended pre-training procedure can improve fine-tuning stability
  * randomly sample 1,000 training samples from the CoLA, MRPC, and QNLI train
  * fine-tune BERT using 25 different random seeds on each dataset
  * two settings
    * training for 3 epochs on the reduced training dataset, and
    * training for the same number of iterations as on the full training set
* results in Fig. 3
  * training on less data does indeed affect the fine-tuning variance:
    many more failed runs
  * hE, when we simply train for as many iterations as on the full train set,
    we almost completely recover the original variance of the fine-tuning
    performance
  * no failed runs on MRPC and QNLI and only a single failed run on CoLA
    * similar to the results obtained by training on the full training set
  * as expected, training on fewer samples affects the generalization
    * worse development set performance on all three tasks
  * the same holds true for datasets from different domains than the pre-train
    * Section 7.8 in the Appendix shows
* We conclude from this experiment, that the role of
  training dataset size per se is orthogonal to fine-tuning stability
  * crucial: the number of training iterations
    (that changes the effective learning rate schedule)
  * we will show in the next section that it has a crucial influence on stabilt

# 5 Disentangling optimization and generalization in fine-tuning instability 5

* fine-tuning instability is an optimization problem
  * this sec: a simple solution
* a large fraction of the fine-tuning instability can be explained by optimizat
  * the remaining instability can be attributed to generalization issues where
    fine-tuning runs with the same training loss exhibit
    noticeable differences in the development set performance

## 5.1 The role of optimization

### Failed fine-tuning runs suffer from vanishing gradients

* Fig. 2c: the failed runs have practically constant training loss
  * Fig. 14 in the Appendix: a comparison with successful fine-tuning
* Fig. 4 plots the l 2 gradient norms of the loss function with respect to
  different layers of BERT, for one failed and successful fine-tuning run
  * failed run: we see large enough gradients only for the top layers and
    vanishing gradients for the bottom layers
  * successful run
    * also observe small gradients at the beginning of training (until iter 70)
      gradients start to grow as training continues
    * at the end of fine-tuning, we observe gradient norms nearly 2× orders of
      magnitude larger than that of the failed run
  * visualizations for additional layers and weights in Fig. 10 in the Appendix
  * same behavior also for RoBERTa and ALBERT: Appendix Fig. 11 and 12
* the vanishing gradients we observe during fine-tuning are
  harder to resolve than
  the standard vanishing gradient problem (Hochreiter, 1991; Bengio+ 1994)
  * common weight initialization schemes (Glorot and Bengio, 2010; He+ 2015)
    * the pre-activations of each layer of the network have
      zero mean and unit variance in expectation
    * hE, we cannot simply modify the weights of a pre-trained model on each
      layer to ensure this property since
      this would conflict with the idea of using the pre-trained weights

### Importance of bias correction in ADAM

* fine-tuning BERT-based models Following Devlin+ (2019)
  * use the ADAM optimizer (Kingma and Ba, 2015)
  * not include the bias correction in ADAM
* Kingma and Ba (2015): the effect of the bias correction is to
  reduce the learning rate at the beginning of training
* By rewriting the update equations of ADAM as follows, we can clearly see this
  effect of bias correction
  ```
  α t = α * \sqrt{1 − β 2 t} /(1 − β 1 t ),             (1)
  θ_t ← θ t−1 − \frac{α t · m_t}{\sqrt{v t} + epsilon}  (2)
  ```
  * `m_t` and `v_t` are biased first and second moment estimates respectively
* Equation (1) shows that bias correction simply boils down to
  reducing the original step size α by a multiplicative factor which is
  significantly below 1 for the first iterations of training and
  approaches 1 as the number of training iterations t increases (see Fig. 6)
  * You+ (2020): bias correction in ADAM has a similar effect to the warmup
    which is widely used in deep learning to prevent early divergence
    (He+ 2016; Goyal+ 2017; Devlin+ 2019; Wong+ 2020)
* The implicit warmup of ADAM is likely to be an important factor that
  contributed to its success, including fine-tuning BERT-based LMs
* Fig. 5: the results of fine-tuning on RTE with and without bias correction
  for BERT, RoBERTa, and ALBERT models
  * footnote: Some of the hyperparameter settings lead to a small fine-tuning
    variance where all runs lead to a performance below the majority baseline
    * Obviously, such fine-tuning stability is of limited use
  * significant benefit in combining warmup with bias correction,
    * particularly for BERT and ALBERT
    * Even though for RoBERTa fine-tuning is already more stable even without
      bias correction, adding bias correction gives an additional improvement
* bias correction is useful if we want to get the best performance within 3
  epochs, the default recommendation by Devlin+ (2019)
  * An alternative solution is to simply train longer with a smaller learning
    rate, which also leads to much more stable fine-tuning
  * We provide a more detailed ablation study in Appendix (Fig. 9) with
    * analogous box plots for BERT using
      various learning rates, numbers of training epochs, with and without bias
      correction
* concurrently to our work, Zhang+ (2021): the importance of bias correction
  and longer training

### Loss surfaces

* To get further intuition about the fine-tuning failure, we provide
  loss surface visualizations (Li+ 2018; Hao+ 2019) of failed and successful
* Denote by `θ_p , θ_f , θ_s` the parameters of the
  pre-trained model, failed model, and successfully trained model,
  * We plot a two-dimensional loss surface `f (α, β) = L(θ_p + α δ_1 + β δ_2 )`
    in the subspace spanned by `δ_1 = θ_f − θ_p` and `δ_2 = θ_s − θ_p`
    centered at the weights of the pre-trained model `θ_p`
  * more details are specified in Section 7.6 in the Appendix
* Contour plots of the loss surfaces for RTE, MRPC, and CoLA in Fig. 7
  * They provide additional evidence to our findings on vanishing gradients:
  * failed fine-tuning runs converge to a “bad” valley
    separated from the local minimum (to which the successfully trained run
    converged) by a barrier (see also Fig. 13 in the Appendix)
  * highly similar geometry for all three datasets
  * further support for our interpretation of fine-tuning instability as a
    primarily optimization issue

## 5.2 The role of generalization

* the remaining fine-tuning variance on the development set
  can be attributed to generalization
* experiment:
  * fine-tune BERT on RTE for 20 epochs and show the
    * development set accuracy for 10 successful runs in Fig. 8a
    * the development set accuracy vs. training loss of all BERT models
      fine-tuned on RTE for the full ablation study (shown in Fig. 9 in the
      Appendix), in total 450 models
* despite achieving close to zero training loss
  overfitting is not an issue during fine-tuning
  * consistent with previous work (Hao+ 2019)
* we argue that it is even desirable to train for a larger number of iterations
  since the development accuracy varies considerably during fine-tuning and it
  does not degrade even when the training loss is as low as 10 −5

# 6 A simple but hard-to-beat baseline for fine-tuning BERT

* guidelines for fine-tuning transformer-based MLMs on small datasets:
  * Use small learning rates with bias correction to avoid vanishing gradients
    early in training
  * Increase the number of iterations considerably and train to (almost) zero
    training loss
* simple baseline scheme
  * fine-tune BERT using ADAM with bias correction and a learning rate of 2e−5
  * 20 epochs,
  * learning rate is linearly increased for the first 10% of steps and
    linearly decayed to zero afterward
  * All other hyperparameters are kept unchanged
* A full ablation study on RTE testing various combinations of the changed
  hyperparameters is presented in Section 7.4 in the Appendix

## Results

* Table 1 and Fig. 1 show the results of fine-tuning BERT on RTE, MRPC, & CoLA
  * compare to
    the default strategy of Devlin+ (2019) and
    the recent Mixout method (Lee+ 2020)
* our method leads to a much more stable fine-tuning performance on all three
  datasets as evidenced by the
  significantly smaller standard deviation of the final performance
* Levene’s test (Levene, 1960) to check the equality of variances for the
  distributions of the final performances on each dataset
  * For all three datasets, p < 0.001 when we compare the variances between our
    method and the method achieving the second smallest variance
* our method improves the overall fine-tuning performance:
  * in Table 1 we achieve a higher mean value on all datasets and also
    comparable or better maximum performance on MRPC and CoLA respectively
* we suggest to increase the number of fine-tuning iterations
  only for small datasets
  * => the increased computational cost of our proposed scheme is not a problem

# Conclusions

# APPENDIX

## 7.1 Alternative notions of stability

* The definition that we use throughout the paper follows the previous work
  (Phang+ 2018; Dodge+ 2020; Lee+ 2020). For example,
  * Dodge+ (2020) report and analyze
    the standard deviation of the validation performance (eg, see Section 4.1)
  * Phang+ (2018) study the influence of intermediate fine-tuning,
    discusses the variance of the validation performance (Section 4: Results)
    * shows the standard deviation over multiple random seeds in Figure 1
* assume that the performance metric is accuracy and we have two classes
* alternative definition of fine-tuning stability:
  per-point stability where the expectation and variance are interchanged:
  * can be useful to better understand the properties of fine-tuned models and
    we refer to McCoy+ (2020) for a study in this direction

## 7.2 Task statistics

## 7.3 Hyperparameters

## 7.4 Ablation studies

## 7.5 Additional gradient norm visualizations

## 7.6 Loss surfaces

## 7.7 Training curves

## 7.8 Additional fine-tuning results
