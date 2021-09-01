Investigating BERT’s Knowledge of Language: Five Analysis Methods with /negation
Warstadt, Cao, Grosu, Peng, Blix, Nie, Alsop, Bordia, Liu, Parrish, Wang, Phang,
  Mohananey, Mon Htut, Jeretic, Bowman
EMNLP-IJCNLP 2019

# Abstract

* inspired by prior work evaluating pretrained sentence representation models.
* negative polarity item (NPI) licensing, as a case study for our experiments.
  NPIs like _any_ are grammatical only if they appear in a licensing environment
  like negation (Sue doesn’t have any cats vs.  `*`Sue has any cats). This
  * challenging because of the variety of NPI licensing environments that exist.
* We introduce an artificially generated dataset that manipulates key features
  of NPI licensing for the experiments.
* We find that BERT has significant knowledge of these features, but
  its success varies widely across different experimental methods. We conclude
  * a variety of methods is necessary to reveal all relevant aspects

# Intro

* evaluating grammatical knowledge of sentence encoders like BERT (Devlin+ 18)
  * Shi+ (2016), Ettinger+ (2016), and Tenney+ (2019) use probing tasks to
  * Marvin and Linzen (2018) and Wilcox+ (2019) compare language models’
    probabilities for pairs of minimally different sentences differing in
    grammatical acceptability.
  * Linzen+ (2016), Warstadt+ (2018), and Kann+ (2019) use Boolean acceptability
    judgments inspired by methodologies in generative linguistics. However, we
  * not yet seen any substantial direct comparison between these methods,
    and whether they tend to yield similar conclusions about what a given model
    * trade-offs in task choice by comparing different methods inspired by
* negative polarity item (NPI) licensing in English, an empirically rich pheno
  widely discussed in the theoretical linguistics literature
  (Kadmon and Landman, 1993; Giannakidou, 1998; Chierchia, 2013)
  * NPIs can only appear in environments that are negative
    (Fauconnier, 1975; Ladusaw, 1979; Linebarger, 1980). For
    * syntactic scope of a licensor: the syntactic domain
    _*Any cookies haven’t been eaten._
    * varies from licensor to licensor. A sentence with an NPI present is only
* five experimental methods to test BERT’s knowledge of NPI licensing. We
  * a Boolean acceptability classification task, sentences in isolation,
  * an absolute minimal pair task evaluating
    * whether the absolute Boolean outputs of acceptability classifiers
      distinguish between pairs of minimally different sentences
  * a gradient [i.e. relative] minimal pair task evaluating
    * whether the gradient outputs of acceptability classifiers distinguish
      between minimal pairs,
  * a cloze test: BERT’s masked language modeling head, and
  * a probing task directly evaluating BERT’s representations for knowledge of
    specific grammatical features relevant to NPI licensing.
* We find that BERT does have knowledge of all the key features necessary to
  predict the acceptability of NPI sentences in our experiments.
  hE, our five methods give meaningfully different results. While the
  * gradient minimal pair experiment
    and, to a lesser extent, the acceptability classification and cloze tests
    indicate that BERT has systematic knowledge of all NPI licensing environs
  * absolute minimal pair and probing experiments show that BERT’s knowledge is
    in fact not equal across these domains. We conclude that each method depicts
  * comparing both gradient and absolute measures of performance of models gives
    a more complete picture. We recommend that future studies use multiple

# 2 Related Work

## Evaluating Sentence Encoders

* Boolean classification tasks of English sentences to evaluate the
  grammatical knowledge encoded in these models
  * objective is to predict whether a single input sentence is acceptable
  * abstracting away from gradience in acceptability judgments.
  * Linzen+ (2016) train classifiers on this task
    using data with manipulated verbal inflection to
    investigate whether LSTMs can identify subject-verb agreement violations,
    and therefore a (potentially long distance) syntactic dependency
  * Warstadt+ (2018) train models on this task using the CoLA corpus of
    acceptability judgments as a method for evaluating domain general
    grammatical knowledge, and Warstadt and Bowman (2019) analyze how these
    domain general classifiers perform on specific linguistic phenomena.
  * Kann+ (2019): verbal argument structure classes
* method of minimal pairs, consisting of two sentences that differ minimally
  * Marvin and Linzen (2018) and Wilcox+ (2019) apply this method to
    e.g. subject-verb agreement, NPI licensing, and reflexive licensing
* probing tasks to predict the value of a particular linguistic feature given an
  * syntactic and surface features such as tense and voice (Shi+ 2016),
    sentence length and word content (Adi+ 2016), or
    syntactic depth and morphological number (Conneau+ 2018).
  * Giulianelli+ (2018) use diagnostic classifiers to track the propagation of
    information in RNN-based language models.
  * Ettinger+ (2018) and Dasgupta+ (2018) use automatic data generation to
    evaluate compositional reasoning.
  * Tenney+ (2019): sub-sentence level probing derived from common NLP tasks

## Negative Polarity Items

* In the theoretical literature on NPIs, proposals have been made to
  * unify the properties of the diverse NPI licensing environments.  For
  * downward entailing (DE) environments (Fauconnier, 1975; Ladusaw, 1979), i.e.
    an environment that licences inferences from sets to subsets. 1
    I have(n’t) been to France/Paris.
* Within computational linguistics, NPIs are used as a testing ground for neural
  * Marvin and Linzen (2018) find that LSTM LMs do not systematically prefer
    sentences with licensed NPIs (1) over sentencew with unlicensed NPIs (2).
  * Jumelet and Hupkes (2018) shows LSTM LMs find a relation between the
    licensing context and the negative polarity item, and appears to be aware of
    the scope of this context.
  * Wilcox+ (2019) use NPIs and filler-gap dependencies, as instances of
    non-local grammatical dependencies, to probe the effect of supervision with
    hierarchical structure.
    * structurally-supervised models outperform SOTA sequential LSTM models,
      showing the importance of structure in learning non-local dependencies
      like NPI licensing.

## CoLA

* Corpus of Linguistic Acceptability (CoLA; Warstadt+ 2018) in our experiments
  to train supervised acceptability classifiers.  CoLA is a dataset of
  * over 10k syntactically diverse example sentences
    from the linguistics literature with Boolean acceptability labels. As is
  * gathered from diverse sources and represent a wide array of syntactic,
    semantic, and morphological phenomena.
* As measured by the GLUE benchmark (Wang+ 2018),
  acceptability classifiers trained on top of BERT and related models reach
  near-human performance on CoLA.

# 7 Discussion

* BERT’s knowledge of which expressions are NPIs and NPI licensors is generally
  stronger than its knowledge of the licensors’ scope. This is especially
* Supplementing BERT with additional pretraining on CCG and MNLI does not
  improve performance, and even lowers performance in some cases. While results
  from Phang+ (2018) lead us to hypothesize that intermediate pretraining might
  help, this is not what we observe on our data. This result is
  * in direct contrast with the results from Wilcox+ (2019), who find that
    syntactic pretraining does improve performance in the NPI domain. This
  * difference in findings is likely due to differences in models and training
    procedure, as their model is an RNN jointly trained on language modeling and
    parsing over the much smaller Penn Treebank (Marcus+ 1993).
