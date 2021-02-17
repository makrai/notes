ME Peters, M Neumann, M Iyyer, M Gardner, C Clark, K Lee, L Zettlemoyer
Deep contextualized word representations
NAACL 2018 outstanding paper

# Ruder

* whether to use the pre-trained language model as a
  * fixed feature extractor and incorporate its representation as features into
    a randomly initialized model as used in ELMo, or whether to
  * fine-tune the entire language model as done by ULMFiT. The latter
    * typically done in CV where either the top-most or several of the top
* core components of transfer learning for NLP:
  * expressive language model encoder such as a deep BiLSTM or the Transformer

# Abstract

* a new type of deep contextualized word representation that models both
  * complex characteristics of word use (e.g., syntax and semantics), and
  * how these uses vary across linguistic contexts (i.e., to model polysemy)
* Our word vectors are
  * learned functions of the internal states of a deep bidirectional language
    model (biL[ST]M), which is pretrained on a large text corpus
  * can be easily added to existing models and
  * significantly improve the SOTA across six challenging NLP problems,
    including question answering, textual entailment and sentiment analysis

# 1 Introduction

* Pre-trained word representations (Mikolov+ 2013; Pennington+ 2014)
* each token is assigned a representation that is a function of the entire
  input sentence. We use vectors derived from a bidirectional LSTM that is
  trained with a coupled language model (LM) objective ... ELMo (Embeddings
  from Language Models) representations.  Unlike
* previous approaches for ... contextualized word vectors [are not deep]
  (Peters+ 2017; McCann+ 2017)
* we learn a linear combination of the vectors stacked above each input word
  for each end task, which markedly improves performance over just using the
  top LSTM layer
* Using intrinsic evaluations, we show that the
  * higher-level LSTM states
  capture context-dependent aspects of word meaning (e.g., they can be used
  without modification to perform well on supervised word sense disambiguation
  tasks) while
  * lower-level states model aspects of syntax (e.g., they can be used to do
    part-of-speech tagging)
* Simultaneously exposing all of these signals is highly beneficial
* For tasks where direct comparisons are possible, ELMo outperforms CoVe
  (McCann+ 2017), which computes contextualized representations using a
  neural machine translation encoder

# 2 Related work

* pretrained word vectors ... are a
  * standard component of most [SOTA] archectures, including
    * question answering (Liu+ 2017),
    * textual entailment (Chen+ 2017),
    * and semantic role labeling (He+ 2017). However, these
  * a single context-independent representation for each word
* overcome some of the shortcomings of traditional word vectors by either
  * subword information (e.g., Wieting+ 2016; Bojanowski+ 2017)
  * separate vectors for each word sense (e.g., Neelakantan+ 2014)
  * Our approach also
    * benefits from subword units through the use of character convolutions,
    * seamlessly incorporate multi-sense information into downstream tasks
      without explicitly training to predict predefined sense classes
* context-dependent representations
  * context2vec (Melamud+ 2016) uses a bi-LSTM to encode the context
    around a pivot word
  * include the pivot word itself in the representation and are computed with
    the encoder of either
    * a supervised neural MT system (CoVe; McCann+ 2017) or
    * an unsupervised language model (Peters+ 2017)
  * we ... train our biLM on [the 1B word benchmark] corpus (Chelba+ 2014)
    * approximately 30 million sentences
* different layers of deep biRNNs encode different types of information
  * introducing [POS tags] at the lower levels of a deep LSTM
    can improve overall performance of higher level tasks such as
    dependency parsing (Hashimoto+ 2017) or
    CCG super tagging (Søgaard and Goldberg, 2016)
  * In an RNN-based encoder-decoder machine translation system, Belinkov+
    (2017) showed that the representations learned at the first layer in a 2-
    layer LSTM encoder are better at predicting POS tags then second layer
  * the top layer of an LSTM for encoding word context (Melamud+ 2016)
    has been shown to learn representations of word sense
* Dai and Le (2015) and Ramachandran+ (2017)
  * pretrain encoder-decoder pairs using language models and sequence
    autoencoders and then
    fine tune with task specific supervision
  * [we] In contrast, after
    * pretraining the biLM with unlabeled data, we
    * fix the weights and add additional task-specific model capacity

# 5 Analysis

* ablation analysis to validate our chief claims and to elucidate some inter-
  esting aspects of ELMo representations
  * Sec. 5.1 shows that using deep contextual representations in downstream
    tasks improves performance
    over previous work that uses just the top layer,
    regardless of whether they are produced from a biLM or MT encoder, and that
    ELMo representations provide the best overall performance
  * Sec. 5.3 explores the different types of contextual information captured in
    biLMs and uses
    two intrinsic eval- uations to show that
    syntactic information is better represented at lower layers while
    semantic information is captured a higher layers,
    consistent with MT encoders. It also shows that
    our biLM consistently provides richer representations then CoVe
* where ELMo is included in the task model (Sec. 5.2),
* training set size (Sec. 5.4), and
* visualize the ELMo learned weights across the tasks (Sec.  5.5)
