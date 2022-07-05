BERTs of a feather do not generalize together:
Large variability in generaliz across models with similar test set performance
R.Thomas McCoy, Junghyun Min, Tal Linzen
BlackboxNLP | EMNLP 2020

# Abstract

* we fine-tuned 100 instances of BERT on the Multi-genre NLI (MNLI) dataset and
  evaluated them on the HANS dataset, which evaluates syntactic generalization
  in natural language inference
  * On the MNLI dev set, the accuracy of all instances was remarkab consistent
    * between 83.6% and 84.8%
  * hE they varied widely in their generalization performance. For example, on
    * eg subject-object swap , accuracy ranged from 0.0% to 66.2%
      (eg “the doctor visited the lawyer” !=> “the lawyer visited the doctor”)
  * likely due to the presence of many local minima in the loss surface that
  * required: models with stronger inductive biases.

# 1 Intro

* two types of generalization:
  1. In-distribution generalization: Generalization to examples which are
  2. Out-of-distribution generalization: Generalization to examples drawn
* Standard test sets in NLP are generated in the same way as the training set,
  therefore testing only in-distribution generalization
  * Current neural architectures perform very well at this type of generalizat.
  * eg on GLUE benchmark (Wang+ 2019), several Transformer-based models (Liu+
    2019b,a; Raffel+ 2020) have surpassed the human baselines from Nangia& (19)
* biases in training distributions, it is often possible for a model to achieve
  * strong in-distribution generalization by using shallow heuristics rather
* alternative evaluation approach addresses this flaw by testing
  how the model handles particular linguistic phenomena, using datasets
  designed to be impossible to solve using shallow heuristics. 
  * this line of investigation tests out-of-distribution generalization, the
  * results are more mixed
    * successful handling of phenomena such as subject-verb agreement
      (Gulordava+ 2018) and filler-gap dependencies (Wilcox+ 2018).  Other
    * surprising failures even on seemingly simple types of examples
      (Marvin and Linzen, 2018; McCoy+ 2019).
* we investigate whether the linguistic generalization across instances of arch
  * whether successes and failures of generalization should be attributed to
    aspects of the architecture or to the choice of the initial weights.
  * using the task of natural language inference (NLI)
  * We fine-tuned 100 instances of BERT (Devlin+ 2019) on the MNLI dataset
    * differed only in (i) the initial weights of the classifier trained on top
      of BERT, and (ii) the order in which training examples were presented.
    * initial weights of BERT, were held constant. We
    * evaluated on both the in-distribution MNLI development set and the
      out-of-distribution HANS evaluation set (McCoy+ 2019), which tests
      syntactic generalization in NLI models.
  * We found that these 100 instances were
    * remarkably consistent in their in-distribution generalization accuracy,
      * all accuracies on the MNLI development set falling in the range 83.6%
        to 84.8%, and with a
      * high level of consistency on labels for specific examples (eg we
        identified 526 examples that all 100 instances labeled incorrectly)
    * In contrast, these 100 instances varied dramatically in their
      out-of-distribution generalization performance; for example,
      * on one of the thirty categories of examples in the HANS dataset,
        accuracy ranged from 4% to 76%
* sugg: when assessing the linguistic generalization of neural models, it is
  important to consider multiple training runs of each architecture, since
  models can differ vastly in how they perform on examples drawn from a
  different distribution than the training set,
  even when they perform similarly on an in-distribution test set.

# 5 Discussion

* that models might be even more variable if the pre-training of BERT were also
  redone across instances
