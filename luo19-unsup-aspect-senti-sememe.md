Unsupervised Neural Aspect Extraction with Sememes
Ling Luo, Xiang Ao, Yan Song, Jinyao Li, Xiaopeng Yang, Qing He, Dong Yu
ijcai 2019 Main track

# Abstract

* Aspect extraction relies discovering coherence among words, which is
  * challenging when word meanings are diversified and processing on short
    texts.  To enhance the performance on aspect extraction, leveraging
  * lexical semantic resources is a possible solution to such challenge. In this
* we present an unsupervised neural framework that leverages sememes
* The overall framework is analogous to an autoenoder which reconstructs
  sentence representations and learns aspects by latent variables
* Two models that form sentence representations by exploiting sememes via
  * (1) a hierarchical attention; (2) a context-enhanced attention
* Experiments on two real-world datasets demonstrate the validity and the effect
  * our models significantly outperforms existing baselines

# 1 Introduction

* Aspect extraction is an essential component for aspect level sentiment
  * two sub-tasks in aspect extraction,
    * extracting aspect terms from an opinion corpus, e.g. identifying “seaweed”
      from “The seaweed was chewy like gum”, and
    * grouping subtle aspect terms into categories where each category denotes
      an individual aspect, e.g. cluster “steak” and “seaweed” into “food”
* Unsupervised approaches are one of the mainstream solutions. Among them, the
  * latent Dirichlet allocation (LDA) based methods [Titov and McDonald, 2008;
    Brody and Elhadad, 2010; Zhao+ 2010; Mukherjee and Liu, 2012].  However,
    * limited for two reasons. First,
      * from word co-occurrences, it is hard to predict aspects from word topic
        (aspect) distributions because they are not highly differentiated
      * inaccurate topic distribution estimations from LDA-based models limit
        the performance on concise reviews
  * deep learning based models [Wang+ 2015; He+ 2017] were proposed. Yet they
    * issues. First,
      * a word in different contexts may have various senses, e.g., “roll” in
      * aspects might be represented in implicit manners. For example, “my
      * most aspect terms are infrequent.  Figure 1 exhibits the frequencies of
        * long-tailed distribution on aspect terms’ frequencies. However,
          existing neural models favor extracting frequent aspect terms instead
* people solve these issues with external semantic knowledge. To present such
  knowledge, sememes [Bloomfield, 1926] are minimum semantic units of word
  meanings and usually annotated in lexical semantic resources. It could be
  effective to find the real aspect terms especially infrequent ones by
  utilizing such semantic resources to obtain latent semantic information and
  get the meaning of the context behind the obscure and various expressions
* we leverage sememes from external lexical semantic resources and introduce an
  unsupervised neural framework to incorporate neural models and unlabeled data
  effectively. The overall
  * framework is analogous to an autoencoder, which takes a sentence repr input
    * reconstructed by a linear combination of aspect embeddings and a latent
      variable sampling from a learnt distribution.  Based on the framework, we
  * two models which leverage sememes to form the input sentence representations
    * Aspect Extraction with Sememe Attentions (AE-SA), has a hierarchical
      sememe attention layer that obtains a sentence representation by
      emphasizing correlated word senses on the lexical level
    * Aspect Extraction via Contextenhanced Sememe Attentions (AE-CSA) adopts an
      RNN to perform global encoding of sentences and concatenates with the
      sememe attention layer to effectively explore related word senses
* Experiments on two large public review datasets have verified the
  * sememes can greatly help discover infrequent aspects, where
  * AE-SA and AE-CSA outperform the previous SOTA models. The
* contributions can be summarized as follows,
  * Our models utilize lexical semantics to discover latent semantic information
    behind implicit and various expressions for aspect extraction
  * We propose a sememe attention structure to represent word meanings and such
    structure is proved to be useful in aspect extraction, especially for
    extracting infrequent aspects
  * We add an RNN structure to the sememe attention, which learns the sequential
    information of the contexts and help the explorations of real aspect terms

# 5 Related work

## Aspect extraction

* important for sentiment analysis [Wang+ 2017a; Luo+ 2018], and existing work
  can be categorized into three types: rule-based, supervised, and unsupervised
* Rule-based methods [Somasundaran and Wiebe, 2009; Qiu+ 2011]: frequent pattern
* Supervised methods [Jin+ 2009; Li+ 2010; Choi and Cardie, 2010; Wang+ 2016;
  Wang and Pan, 2018] were typically built based on sequence labeling methods
  such as hidden Markov models (HMM) and conditional random fields (CRF), which
  * required large amounts of labeled data for training
* unsupervised
  * LDA-based methods [Titov and McDonald, 2008; Brody and Elhadad, 2010; Zhao+
    2010; Mukherjee and Liu, 2012; Chen+ 2014] were representative methods of
  * [Wang+ 2015] proposed Restricted Boltzmann Machines based model to extract
    aspects and relevant sentiments simultaneously
  * [Yin+ 2016] used dependency path embeddings and [Wang+ 2017b] proposed
    multi-layer attentions while exploiting indirect relations between terms
  * [Li and Lam, 2017] utilized a memory interaction structure [He+ 2017]
    adopted attention mechanism with word embeddings to improve aspect coherence

## Sememe representation learning

* Recently, sememes from lexical semantic resources are utilized to recognize
  different word senses in various contexts and applied in many NLP tasks
* [Niu+ 2017], [Song+ 2017] and [Zeng+ 2018] encoded it to improve Chinese word
  representations and lexicon expansion
* [Li+ 2018; Qi+ 2018; Jin+ 2018] study the lexical sememe prediction task with
  external resources
* we devise different sememe structures and investigate them for aspect extract
