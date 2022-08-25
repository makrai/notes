BERTs of a feather do not generalize together: Large variability in generaliz
  across models with similar test set performance
R. Thomas McCoy, Junghyun Min, Tal Linzen
BlackboxNLP | EMNLP 2020

The weights for all 100 fine-tuned models https://github.com/tommccoy1/ hans

# Abstract

* we fine-tuned 100 instances of BERT on the Multi-genre NLI (MNLI) dataset and
  evaluated them on the HANS dataset, which evaluates synt genlization in NLI
  * On the MNLI dev set, the accuracy of all instances was remarkab consistent
    * between 83.6% and 84.8%
  * hE they varied widely in their generalization performance
    * eg subject-object swap, accuracy ranged from 0.0% to 66.2%
      (eg “the doctor visited the lawyer” !=> “the lawyer visited the doctor”)
  * likely due to the presence of many local minima in the loss surface
  * required: models with stronger inductive biases

# 1 Intro

* two types of generalization (Generalization to examples drawn from...)
  1. In-distribution generalization
  2. Out-of-distribution generalization
* Standard test sets in NLP are generated in the same way as the training set,
  therefore testing only in-distribution generalization
  * Current neural architectures perform very well at this type of generalizat
  * eg on GLUE benchmark (Wang+ 2019), several Transformer-based models (Liu+
    2019b,a; Raffel+ 2020) have surpassed the human baselines from Nangia& (19)
* biases in training distributions
  * strong in-distribution generalization by using shallow heuristics
* alternative evaluation approach addresses this flaw by testing
  how the model handles particular linguistic phenomena, using
  datasets designed to be impossible to solve using shallow heuristics
  * this line of investigation tests out-of-distribution generalization
  * results are more mixed
    * successful handling of phenomena such as
      * subject-verb agreement (Gulordava+ 2018) and
      * filler-gap dependencies (Wilcox+ 2018)
    * surprising failures even on seemingly simple types of examples
      (Marvin and Linzen, 2018; McCoy+ 2019)
* we investigate the linguistic generalization across instances of one archit
  * whether successes and failures of generalization should be attributed to
    aspects of the architecture or to the choice of the initial weights
  * using the task of natural language inference (NLI)
  * We fine-tuned 100 instances of BERT (Devlin+ 2019) on the MNLI dataset
    * differed only in (i) the initial weights of the classifier on top of BERT
      and (ii) the order in which training examples were presented
    * initial weights of BERT were held constant
    * evaluated on both the
      * in-distribution MNLI development set and the
      * out-of-distribution HANS evaluation set (McCoy+ 2019), which
        * tests syntactic generalization in NLI models
  * We found that these 100 instances were
    * remarkably consistent in their in-distribution generalization accuracy,
      * all accuracies on the MNLI dev set falling in the range 83.6% to 84.8%
      * high level of consistency on labels for specific examples
        (eg 526 examples that all 100 instances labeled incorrectly)
    * In contrast, these 100 instances
      varied dramatically in their out-of-distribution generalization perform
      * on one of the thirty categories of examples in the HANS dataset,
        accuracy ranged from 4% to 76%
* suggestion: when assessing the linguistic generalization of neural models,
  consider multiple training runs of each architecture,
  since models can differ vastly in how they perform out-of-distribution,
  even when they perform similarly on an in-distribution test set

# 2 Background

## 2.1 In-distribution generalization

* the same architecture can have very different in-distribution generalization
  across restarts of the same training process
  (Reimers and Gurevych, 2017, 2018; Madhyastha and Jain, 2019)
  * finetuning of BERT is unstable for some datasets, such that
    some runs achieve SOTA results while others perform poorly
    (Devlin+ 2019; Phang+ 2018). Unlike these past works, we focus on out-of-di

## 2.2 Out-of-distribution generalization ("syntactic")

* Weber+ (2018) trained 50 instances of a sequence-to-sequence model
  on a symbol replacement task
  * These instances consistently had above 99% accuracy on the in-distribution
    * but varied on out-of-distribution generalization sets
    * in the most variable case, accuracy ranged from close to 0% to over 90%
  * McCoy+ (2018) trained 100 instances for each of six types of networks,
    * synthetic training set that was ambiguous between two generalizations
    * Some models consistently made the same generalization across runs, but
      others varied considerably, with
      * some instances of a given architecture strongly preferring one of the
        two generalizations that were plausible given the training set, while
      * other instances strongly preferred the other generalization
  * Liška+ (2018) trained 5000 instances of recurrent neural networks on the
    lookup tables task. Most of these instances failed on compositional
    generalization, but a small number generalized well
* These works all used simple, synthetic tasks with
  * training sets designed to exclude certain types of examples
  * we: natural-language training set that is not adversarially designed
* concurrent work, Zhou+ (2020)
  also measured variability in out-of-distribution performance
  for 3 models (including BERT) on 12 datasets (including HANS)
  * Xiang Zhou, Yixin Nie, Hao Tan, and Mohit Bansal
    The curse of performance instability in analysis datasets:
      Consequences, source, and suggestions
    arXiv:2004.13606
  * impressive breadth, whereas we instead aim for depth
    * We analyze the particular categories within HANS to give a fine-grained
      investigation of syntactic generalization, while
    * Zhou+ only report overall accuracy averaged across categories
    * we fine-tuned 100 instances of BERT, while Zhou+ only fine-tuned 10 insta
      * allows us to investigate the extent of the variability in more detail

## 2.3 Linguistic analysis of BERT

* a deeper understanding of BERT, whether to assess its
  * encoding of sentence structure (Lin+ 2019; Hewitt and Manning, 2019;
    Chrupała and Alishahi, 2019; Jawahar+ 2019; Tenney+ 2019b)
  * representational structure more generally (Abnar+ 2019)
  * handling of specific linguistic phenomena
    * subject-verb agreement (Goldberg, 2019),
    * negative polarity items (Warstadt+ 2019),
    * function words (Kim+ 2019)
    * psycholinguistic phenomena (Ettinger, 2020)
  * internal workings (Coenen+ 2019; Tenney+ 2019a; Clark+ 2019)
  * inductive biases (Warstadt and Bowman, 2020)
* models without fine-tuning or only a small number of fine-tuning runs
  (usually only one fine-tuning run, or at most ten fine-tuning runs)

# 4 Results

## 4.1 In-distribution generalization

* we provide some quantitative and qualitative analysis of consistency of
  performance on individual examples
* the consistent score of about 84% on the MNLI development set can be
  partially explained by the fact that there are certain examples that all
  models answered correctly or that all models answered incorrectly, as
  models were consistently correct or incorrect on 72% of the examples
* Examples (7) through (12) show some of the 526 cases that all 100 instances
  answered incorrectly
  * Some of these examples arguably have incorrect labels in the dataset,
    such as (7) (because the hypothesis mentions a report which the premise
    does not mention), so it is unsurprising that models found such examples
    difficult
  * Other consistently difficult examples involve areas that one might
    intuitively expect to be tricky for models trained on natural language,
    * world knowledge (eg (8) requires knowledge of how long forearms are, and
      (9) requires knowledge of what nodding is), the
    * ability to count (eg (10)), or
    * fine-grained shades of meaning that might require multiple steps of
      reasoning (eg (11) and (12))
  * Some have a high degree of lexical overlap yet are not labeled entailment
    (such as (13)); the difficulty of such examples adds further evidence to
  * there are some examples, such as (14), for which it is unclear why models
    find them so difficult

## 4.2 Out-of-distribution generalization

* HANS consists of 6 main categories of examples,
  each of which can be further divided into 5 subcategories
  * Performance was reasonably consistent on five of these categories, but
  * hE on the sixth category—lexical overlap examples that are inconsistent
    with the lexical overlap heuristic—performance varied dramatically, ranging
    from 5% accuracy to 55% accuracy (Figure 6). Since this is the most
    * we focus on it for the rest of the analysis
    * examples for which the correct label is non-entailment and for which all
      the words in the hypothesis also appear in the premise but not as a
      contiguous subsequence
    * five subcategories; examples and results for each subcateg are in Fig 5
* Chance performance on HANS was 50%;
* on all subcategories except for passives, accuracies ranged from far below
  chance to modestly above chance
* Models varied considerably even on categories that humans find simple
  (McCoy+ 2019)
  * eg subject-object swap examples, which
    * can be handled with only rudimentary knowledge of syntax
    * ranged from 0% to 66%
    * ie models learned highly variable representations of syntax

# 5 Discussion

* models might be even more variable if the pre-train of BERT were also redone
