WinoGrande: An Adversarial Winograd Schema Challenge at Scale
Keisuke Sakaguchi, Ronan Le Bras, Chandra Bhagavatula, Yejin Choi
arXiv:1907.10641 [cs.CL]

* Yejin Choiról Turán György mondja, hogy hisz a deep learning szimbolikus
  dolgokkal való hibridizálásában

# Abstract

* The Winograd Schema Challenge (WSC) (Levesque, Davis, and Morgenstern 2011),
  a benchmark for commonsense reasoning, is a set of
  * 273 expert-crafted pronoun resolution problems originally
  * designed to be unsolvable for statistical models that rely on
    selectional preferences or word associations
* recent advances in neural language models have already reached around 90%
  accuracy on variants of WSC
  * spurious biases in the datasets that lead to an overestimation
* WinoGrande, a large-scale dataset of 44k problems, inspired by the original
  WSC design, but adjusted to improve both the scale and the hardness
  * dataset construction consist of
    * a carefully designed crowdsourcing procedure, followed by
    * novel AfLite: light-weight adversarial filtering
      * systematic bias reduction that generalizes human-detectable word
        associations to machine-detectable embedding assoc
* The best SOTA methods on WinoGrande achieve 59.4-79.1%, which are
  15-35% below human performance of 94.0%,
  depending on the amount of the training data allowed
* new SOTA results on five related benchmarks WSC (90.1%), DPR (93.1%), COPA
  (90.6%), KnowRef (85.6%), and Winogender (97.1%)
* implications:
  * effectiveness of WinoGrande when used as a resource for transfer learning.
    * SOTA results on several related benchmarks.
  * concern that we are likely to be overestimating the true capabilities of
    machine commonsense across all these benchmarks

# 2 Crowdsourcing WinoGrande at Scale

## Enhancing Crowd Creativity Creating twin sentences

* creativity from constraints (Stokes 2005) – a psychological notion which
* crowd workers are primed by a randomly chosen topic as a suggestive context,
  while they are asked to follow precise guidelines on the structure

## Crowdsourcing Task We collect WinoGrande problems

* write twins sentences that meet the requirements for WSC problems
  (e.g., avoiding word association, non-zero but small edit distance).
* To avoid repeating the same topics, workers were instructed to randomly pick
  an anchor word(s) from a randomly assigned WikiHow article 3 and to ensure
* Following the original WSC problems, we aimed to collect twins in
  * social commonsense: a situation involving two same gender people with
    contrasting attributes, emotions, social roles, etc., and
  * physical commonsense: a context involving two physical objects with
    contrasting properties, usage, locations, etc.
* In total, we collected 77k questions (i.e., 38k twins).

# 3 novel adversarial filtering algorithm: Algorithmic Data Bias Reduction

* annotation artifacts in large-scale datasets (Gururangan+ 2018; Poliak+ 2018;
  Tsuchiya 2018; Niven and Kao 2019; Geva, Goldberg, and Berant 2019)
* AfLite: reduce biases using SOTA contextual representation of words.
* adversarial filtering (AF) algorithm proposed by Zellers+ (2018), but makes
* our two key improvements
  * much more broadly applicable (by not requiring overgeneration)
    * Overgenerating machine text from a language model to use in test instances
      runs the risk of distributional bias where a discriminator can learn to
      distinguish between machine generated instances and human-generated ones.
  * more lightweight (not requiring re-training a model at each iteration)
    AF).
* Instead of manually identified lexical features, we adopt a dense
  representation of instances using their precomputed neural network embeddings.
  * we use RoBERTa (Liu+ 2019) fine-tuned on a small subset of the dataset.
    (referred to as RoBERTa embed ).
  * We use RoBERTa embed to pre-compute the embeddings for the rest of the
    instances (47k) as the input for AfLite
  * ensemble of linear classifiers (logistic regressions) trained on random
    subsets of the data to determine whether the representation used in RoBERTa
    embed is strongly indicative of the correct answer option. If so, we discard
    the corresponding instances and proceed iteratively.
* reminiscent of (Chen and Cardie 2018; Belinkov+ 2019; Elazar and
  Goldberg 2018).
  * Belinkov+ (2019) propose an adversarial removal technique for NLI which

## Assessment of AfLite

* two baselines: random data reduction and PMI-based filtering
  * Technically, we first pre-computed PMI between a word and the label y = 1
    following a method proposed by Gururangan+ (2018)
  * sum of PMI value of each token in a given sentence

## What bias has been actually detected by AfLite?

* Table 2 presents examples that AfLite has detected as a dataset-specific bias.
* first two twins, where the sentiment between the answer option and the target
  pronoun are highly correlated. In other words, these problems can be easily
  * structural rather than at the token level,
    * unlike that identified in the literature (Gururangan+ 2018; Poliak+ 2018),
    * hard to detect using heuristics such as lexical PMI-filtering
* We also release 31k problems that are filtered out by AfLite for additional
  training set (§4) and resource (§5), resulting in a total number of problems
  in WinoGrande all to be 43,972

## 3.1 WinoGrande V.S. the Original WSC

* a few design choices that deviate from the original design guidelines of WSC
  in order to scale up the dataset considerably while ensuring the hardness of
  * fill-in-the-blank problem where the blank corresponds to the mention of one
    of the two names in the context,
    * following other recent WSC variants such as Trinh and Le (2018). 8 In
  * Second, while we originally collected all problems in twins,
    the final questions in the filtered WinoGrande debiased are not always twins
    because it is possible that AfLite filters out only one of the twin
    * about 1/3 of questions are not twins. We also release WinoGrande all
  * crowdworkers. Thus, the language used in WinoGrande is more diverse and

# 4 Experimental Results 5

## 4.2

### Learning Curve In order to see the effect of training size,

* Table 4 shows the performance by RoBERTa trained on different training sizes
  * the best model, RoBERTa, on the WinoGrande debiased dev set. RoBERTa’s
  * ranges from 59% to 79% <800 (2% of the training data) to 41K instances.
  * To achieve human-level performance, current SOTA models would
    need over 118K training instances.
  * (∼800) roughly matches the size of the training data made available in
    previous variants of WSC (see Table 5). For most of these datasets,
    SOTA already reaches around 90% (§5). In contrast, when we control for the
    training set size in WinoGrande , RoBERTa’s performance is considerably
    lower (59%) – demonstrating that our dataset 100 y = 4.8463ln(x) + 26.215 94
  * problems that are collectively considerably harder than previous datasets.

# 5 Transfer Learning from WinoGrande 6

* WinoGrande contains a large number of WSC style questions.
* In addition to serving as a benchmark dataset, we use WinoGrande as a resource
* evaluating its performance on related datasets: WSC, PDP, SuperGLUE-WSC, DPR,
  KnowRef, KnowRef, and Winogender). We establish
* SOTA results across several of these existing benchmark datasets.

## Existing WSC and Related Datasets

### WSC (Levesque, Davis, and Morgenstern 2011) This is

* the original Winograd Schema Challenge dataset, which consists of 273 problems
* Trichelair+ (2018) report that 13.5% may still have word-association bias

### PDP (Morgenstern, Davis, and Ortiz 2016, Pronoun Disambiguation Problems)

* used in the 2016 running of the Winograd Schema Challenge. The dataset
* as a multiple choice task, in which a pronoun must be resolved to one of up to
  5 (but mostly binary) possible antecedents.

### SuperGLUE-WSC (Wang+ 2019) SuperGLUE contains multiple datasets

* including a modified version of WSC, which we will refer to as SuperGLUE-WSC.
* aggregates the original WSC, PDP and additional PDP-style examples, and
  recasts them into True/False binary problems (804 in total).
* We converted WinoGrande to the True/False binary problems.

### DPR (Rahman and Ng 2012, Definite Pronoun Resolution Dataset) introduces

* 1,886 additional WSC problems authored by 30 undergraduate students.

* overall less challenging than the original WSC (Trichelair+ 2018) due to an
  increased level of language-based or dataset-specific biases. We split the

### KnowRef (Emami+ 2019) KnowRef provides over 8k WSC-style coreference

* extracted and filtered with heuristic rules from 100 million web sentences
  (Reddit, Wikipedia, and OpenSubtitles)

### COPA (Roemmele, Bejan, and Gordon 2011)

* This dataset introduces 1,000 problems that aim to test commonsense reasoning
  focusing on script knowledge, formulated as a binary choice about causes and
  effects of given premises.
* split:  Since COPA does not provide a training set, we split the original
  development set (500) into training (400) and development (100) sets in the
  same way as SuperGLUECOPA (Wang+ 2019).

### Winogender (Rudinger+ 2018) This dataset introduces 720 problems focusing

## 5.4 Diagnostics for Gender Bias

* In Winogender, bias is measured by the difference in accuracy between the
  cases where the pronoun gender matches the occupation’s majority gender
  (called “non-gotcha”) or not (“gotcha”)
* the gender gap in RoBERTa-WinoGrande is smaller than RoBERTa-DPR.

# 6 Conclusions 8

* Unlike past decades where the community constructed a static benchmark dataset
  to work on for many years to come, we now need AI algorithms to compose
  challenges that are hard enough for AI, which requires dynamic datasets that
  evolve together with the evolving SOTA.
