A Cognitive Regularizer for Language Modeling\
Jason Wei, Ryan Cotterell , Clara Meister\
ACL 2021 arXiv:2105.07144 [cs.CL]

# Abstract

* uniform information density (UID) hypothesis, which posits that
  * speakers behaving optimally tend to distribute information uniformly across
    a linguistic signal, has gained traction in psycholinguistics as an
    explanation for certain syntactic, morphological, and prosodic choices
* we explore whether the UID hypothesis can be operationalized\
  as an inductive bias for statistical language modeling
  * we augment the canonical MLE objective for training language models\
    with a regularizer that encodes UID
* experiments on ten languages spanning five language families, we find that
  using UID regularization consistently improves perplexity in language models,
  * larger effect when training data is limited
* via an analysis of generated sequences, we find that\
  UID-regularized language models generate text that is more lexically diverse
  * a validation of the UID hypothesis using modern-day NLP tools

# 1 Introduction

* hypothesis: Language follows certain information-theoretic constraints
  * One of the most famous of these constraints is the\
    uniform info density hypothesis (UID, Fenk and Fenk 1980; Jaeger 2010)
  * subject to the rules of the grammar,\
    speakers aim to distribute information density across a linguistic signal\
    as uniformly as possible
    * ie differences between the peaks and troughs in information are minimed
* In the psycholinguistics literature, the UID hypothesis has been used to
  explain a variety of linguistic phenomena ranging from/to
  * how we shorten the phonetic duration of more-predictable linguistic units
    (Aylett and Turk, 2004)
  * when we decide to use optional synt relativizers (Levy and Jaeger, 2007),
  * other phenomena (Bell+ 2003; Frank and Jaeger, 2008)
  * These studies often use language models to estimate the information density
    of linguistic units, taking observations of low variation of information
    density in well-formed utterances as evidence for the UID hypothesis
* In this paper, we propose a new experimental paradigm that uses modern-day
  NLP models to test the UID hypothesis
  * prior work has used language modeling as a tool for observing UID, 1\
    we explore the converse—can UID be used as a tool to train better LMs?
    * UID as a regularizer to help train language models
    * a new type of evidence for the UID hypothesis at scale
* In experiments, we indeed find such evidence:\
  across a variety of languages and dataset sizes,\
  UID regularization consistently improves performance, having a\
  larger effect when training data is limited
  * in comparison with their unregularized counterparts—UIDregularized LMs are
    * higher entropy while achieving the same (or better) test set perplexity
    * generate text that is longer and more lexically diverse
* Our work is the first to explore the interaction between UID and\
  training modern-day neural language models

# 7 Discussion and Related Work

## UID in modern NLP. In addition to the traditional line of psycholinguistic

* more-recent studies on UID in the context of modern NLP
* Rubino+ (2016) leverage
  information density encoded as
  surprisal at the word, part of speech, and syntax levels to help build a
  SOTA model for mixed-domain translationese detection
* Jain+ (2018) incorporate UID measures across sentences\
  into models designed to detect natural versus manipulated text
* most related to ours, Meister+ (2020a), leverages UID to explain
  * why beam search is an effective decoding algorithm and
  * uses operationalizations of UID during beam search to alleviate problems
    with decoding poorly calibrated machine translation models
