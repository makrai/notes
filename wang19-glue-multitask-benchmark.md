GLUE: A Multi-Task Benchmark and Analysis Platform for NLU
Alex Wang, Amanpreet Singh, Julian Michael, Felix Hill, Omer Levy, SR Bowman
ICLR 2019; arXiv:1804.07461 [cs.CL]

https://gluebenchmark.com/

# Abstract

* we introduce the General Language Understanding Evaluation benchmark (GLUE),
  a tool for evaluating and analyzing the performance of models across a
  diverse range of existing NLU tasks
  * model-agnostic, but it incentivizes sharing knowledge across tasks because
    certain tasks have very limited training data
* We further provide a hand-crafted diagnostic test suite that enables detailed
  linguistic analysis of NLU models
  * baselines based on current methods for multi-task and transfer learning and
    * they do not immediately give substantial improvements over the aggregate
      performance of training a separate model per task, indicating
    * room for improvement in developing general and robust NLU systems

# 1 Intro

* most NLU models above the word level are designed for a specific task and
  struggle with out-of-domain data
  * If we aspire to develop models with understanding beyond the detection of
    superficial correspondences between inputs and outputs, then it is critical
    to develop a more unified model that can learn a range of tasks and domains
* we present the General Language Understanding Evaluation (GLUE) benchmark: a
  * tasks including question answering, sentiment analysis, and textual
    entailment
  * online platform for model evaluation, comparison, and analysis. GLUE does
  * no constraints on model architecture beyond the ability to process
    single-sentence and sentence-pair inputs and to make corresponding preds
  * For some/other GLUE tasks, training data plentiful/limited/genre mismatch
  * => favors models that can learn to represent linguistic knowledge in a way
    that facilitates sample-efficient learning and effective knowledge-transfer
  * None of the datasets in GLUE were created from scratch for the benchmark;
    * they have been implicitly agreed upon by the NLP community as challenging
  * Four of the datasets feature privately-held test data, which will be used
* analysis examples for probing trained models, hand-crafted
  * To understand the types of knowledge learned by models and to encourage
    linguistic-meaningful solution strategies, GLUE also includes a set of
  * designed to highlight common challenges,
    eg the use of world knowledge and logical operators, that we expect models
* experiments with simple baselines and SOTA sentence representation models. We
  * unified multi-task trained models slightly outperform comparable models
    trained on each task separately
  * Our best multi-task model makes use of ELMo (Peters+ 2018), a recently
    * still achieves a fairly low absolute score
    * Analysis with our diagnostic dataset reveals that our
      baseline models deal well with strong lexical signals but
      struggle with deeper logical structure
* In summary, we offer:
  * nine sentence or sentence-pair NLU tasks,
    built on established annotated datasets and selected to cover a
    diverse range of text genres, dataset sizes, and degrees of difficulty
  * online evaluation platform and leaderboard, based primarily on
    privately-held test data. The platform is model-agnostic, and can evaluate
    any method capable of producing results on all nine tasks
  * An expert-constructed diagnostic evaluation dataset
  * Baseline results for several major existing approaches to sentence repr

# 3 TASKS

## 3.1 SINGLE-SENTENCE TASKS

### CoLA The Corpus of Linguistic Acceptability (Warstadt+ 2018) consists of

* English acceptability judgments drawn from books and journal articles on
  linguistic theory
  * Each example is a sequence of words annotated with whether it is a
    grammatical English sentence
  * Following the authors, we use Matthews correlation coefficient (Matthews,
    1975) as the evaluation metric, which evaluates performance on unbalanced
    binary classification and ranges from -1 to 1, with 0 being the performance
    of uninformed guessing
  * We use the standard test set, for which we obtained private labels from the
    authors
  * We report a single performance number on the combination of the in~ and
    out-of-domain sections of the test set

### SST-2 The Stanford Sentiment Treebank (Socher+ 2013)

* consists of sentences from movie reviews and human sentiment annotations
* The task is to predict the sentiment of a given sentence
* We use the two-way (positive/negative) class split, and use only
  sentence-level labels
