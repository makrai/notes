Ian Tenney, Patrick Xia, Berlin Chen, Alex Wang, Adam Poliak, R Thomas McCoy,
Najoung Kim, Benjamin Van Durme, Samuel R. Bowman, Dipanjan Das, Ellie Pavlick
What do you learn from context?
  Probing for sentence structure in contextualized word representations
ICLR 2019

* data processing and model code

# Abstract

* Contextualized representation models
  such as ELMo (Peters+ 2018a) and BERT (Devlin+ 2018)
  * SOTA results on a diverse array of downstream NLP tasks
* recent token-level probing work
* we introduce a novel
  * edge probing task design
  * sub-sentence tasks derived from the traditional structured NLP pipeline
* We probe word-level contextual representations from four recent models
* investigate syntactic, semantic, local, and long-range phenomena
* tl;dr: models trained on language modeling and translation
  * strong representations for syntactic phenomena, but
  * comparably small improvements on semantic tasks over a non-contextual baslin
* from the Conclusion
  * the performance of ELMo cannot be fully explained by a model with access to
    local context
    * i.e. ELMo does encode distant linguistic information, which can help
      disambiguate longer-range dependency relations and higher-level syntactic
      structures

# 1 Introduction

* contextualized word embeddings
  * training objectives like
    * machine translation (McCann+ 2017) or
    * lang modeling (Peters+ 18a; Radford+ 18; Howard & Ruder, 18; Devlin+ 18)
  * the same interface as conventional word embeddings
  * significant improvements to the SOTA on several tasks, including
    constituency parsing (Kitaev & Klein, 2018), semantic role labeling (He+
    2018; Strubell+ 2018), and coreference (Lee+ 2018), and has
  * outperformed fixed-length (Kiros+ 2015; Conneau+ 2017)
* Recent token-level probes e.g.
  * POS tags (Blevins+ 2018; Belinkov+ 2017b; Shi+ 2016),
  * morphology (Belinkov+ 2017a;b), or
  * word-sense disambiguation (Peters+ 2018a)
* Peters+ (2018b) extend this to constituent phrases, and present a heuristic
  for unsupervised pronominal coreference
* we focus on asking what information is encoded at each position
  * structural information about that word’s role in the sentence
  * primarily syntactic or also encode higher-level semantic relationships?
* We use data derived from traditional structured NLP tasks: tagging, parsing,
  semantic roles, and coreference
  * corpora such as OntoNotes (Weischedel + 2013) provide a wealth of annotation
* refered to as “edge probing”
  * we decompose each structured task into a set of graph edges (§ 2)
  * predict edges independently using a common classifier architecture (§3.1)
* We probe four popular contextual representation models (§ 3.2):
  * CoVe (McCann+ 2017), ELMo (Peters + 2018a), OpenAI GPT (Radford+ 2018), and
    BERT (Devlin+ 2018)
  * because their pretrained weights and code are available
  * word-level baselines to separate the contribution of context from lexical
  * augmented baselines to better understand the role of pretraining and the
    ability of encoders to capture long-range dependencies

# 2 Edge probing 2

## 2.1 Tasks

,,,

### Semantic role labeling (SRL): imposing predicate-argument structure 

* e.g. given a sentence like “Mary pushed John”, SRL is concerned with
  * ARG0 (agent, the pusher) vs.  ARG1 (patient, the pushee).

### Coreference

* whether two spans of tokens (“mentions”) refer to the same entity (or event)

### Semantic proto-role (SPR): fine-grained, non-exclusive semantic attributes,

* such as change of state or awareness, over predicate-argument pairs. E.g.

### Relation Classification (Rel.): predicting the real-world relation 

* typically given an inventory of symbolic relation types (often from an
* e.g. “Mary is walking to work”: linking “Mary” to “work” via the
  Entity-Destination relation

## 2.2 Datasets

* OntoNotes 5.0 corpus (Weischedel+ 2013) for five of the above eight tasks: POS
  tags, constituents, named entities, semantic roles, and coreference. In
* dependencies, proto-roles, or semantic relations. Thus, for 
  * dependencies: English Web Treebank from the UD 2.2 release (Silveira+ 2014).
  * SPR, we use two datasets, 
    * SPR1 (Teichert+ (2017)) derived from Penn Treebank and 
    * SPR2 (Rudinger+ (2018)) derived from English Web Treebank.  For 
  * relation classif: SemEval 2010 Task 8 dataset (Hendrickx+ 2009), which
    * English web text, labeled with a set of 9 directional relation types.  
* extra “challenge” coreference dataset 
  * based on the Winograd schema (Levesque+ 2012).  Winograd schema problems
  * the version of the Definite Pronoun Resolution (DPR) dataset (Rahman & Ng,
    2012) employed by White+ (2017): balanced positive and negative pairs

# 3 Experimental set-up 4

# 4 Experiments 5

# 5 Results 6

* central questions: 
  * what types of syntactic and semantic information at each position? And 
  * is the information captured primarily local, or 
    do contextualized embeddings encode information about long-range structure?

## 5.1 Comparison of representation models. We report F1 scores for ELMo, CoVe, GPT,

* ELMo and GPT (with mix features) have comparable performance, with 
  * ELMo slightly better on most tasks but the 
  * Transformer scoring higher on relation classification and OntoNotes
  * Both models outperform CoVe by a significant margin (6.3 F1 points on avg),
* ELMo, CoVe, and the GPT differ in architecture, training objective, and both
  the quantity and genre of training data (§ 3.2). 
* on all tasks except for Winograd coreference, the lexical representations used
  by the ELMo and GPT models outperform GloVe vectors (by 5.4 and 2.4 points)
  * particularly pronounced on constituent and semantic role labeling, where the
    model may be benefiting from better handling of morphology by
    character-level or subword representations.
* ELMo-style scalar mixing (mix) instead of concatenation improves significantly
  on both deep Transformer models (BERT and GPT).  We
  * most relevant information being contained in intermediate layers, which
  * agrees with Blevins+ (2018), Peters+ (2018a), and Devlin+ (2018), and with
    * Peters+ (2018b): top layers may be overly specialized to next-word pred 
* When using scalar mixing (mix), we observe that the 
  * BERT-base model outperforms GPT, which has a similar 12-layer Transformer
  * 24-layer BERT-large model > BERT-base by 1.1 F1 points and ELMo by 2.7 F1 
    * a nearly 20% relative reduction in error on most tasks.  
* improvements of the BERT models are not uniform across tasks.  In particular,
  BERT-large improves on ELMo by 7.4 F1 points on OntoNotes coreference, more
  than a 40% reduction in error and nearly as high as the improvement of the
  ELMo encoder over its lexical baseline.  
* also a large improvement (7.8 F1 points) 7 on Winograd-style coreference from
  BERT-_large_ in particular, suggesting that deeper unsupervised models may

## Genre Effects. 

* Our probing suite is drawn mostly from newswire and web text (§ 2). This is a
* good match for the Billion Word Benchmark (BWB) used to train the ELMo model,
* weaker match for the Books Corpus used to train the published GPT model.  
* To control for this, we train a clone of the GPT model on the BWB, using the
  * performs only slightly better (+0.15 F1 on average) on our probing suite
    than the Books Corpus-trained model, but still underperforms ELMo

## Encoding of syntactic vs. semantic information. 

* largest gains on tasks which are considered to be largely syntactic, such as
  dependency and constituent labeling, and 
* smaller gains on tasks which are considered to require more sem reasoning,
  such as SPR and Winograd. We observe 
* on POS tagging and entity labeling, i.e. local type information
  * small absolute improvements, likely due to the word-level priors
  * Relative reduction in error is much higher, suggesting that ELMo does encode
* Semantic role labeling benefits greatly from contextual encoders overall, but
  * predominantly due to better labeling of core roles (+19.0 F1 for ELMo) which
    * closely tied to syntax (e.g. Punyakanok+ (2008); Gildea & Palmer (2002)).
    * The lexical baseline performs similarly on core and non-core roles (74 and
  * the more semantically-oriented non-core role labels 
    (such as purpose, cause, or negation) see 
    only a smaller improvement from encoded context (+8.8 F1 for ELMo). The
* semantic proto-role labeling task (SPR1, SPR2) 
  looks at the same type of core predicate-argument pairs but tests for
  * only weakly captured by the contextual encoder (+1-5 F1 for ELMo).  
* relation classification task is designed to require semantic reasoning, but in
  * large improvement from contextual encoders, with ELMo improving by 22 F1
  * many easy relations can be resolved simply by observing key words
    (for example, “caused” suggests the presence of a Cause-Effect)
  * To test this, we augment the lexical baseline with a bag-of-words feature,
    * capture more than 70% of the headroom from using the full ELMo model

## Effects of architecture. Focusing on the ELMo model

* how much of the model’s performance can be attributed to the architecture,
  rather than knowledge from pretraining? In Figure 2 we 
* compare to an orthonormal encoder (§ 4) which is 
  * structurally identical to ELMo but contains 
  * no information in the recurrent weights. It can be thought of as a
    randomized feature function over the sentence, and provides a baseline for
    how the architecture itself can encode useful contextual information. We
  * improves significantly on the lexical baseline, but that overall the 
  * learned weights account for over 70% of the improvements from full ELMo.

## Encoding non-local context. How much info is carried over long distances

* which task?
  * extend our lexical baseline with a convolutional layer, which 
    * allows the probing classifier to use local context. In Figure 2 we find that
    * CNN of width 3 (±1 token) closes 72% of the gap between the lexical baseline
      and full ELMo; this extends to 
      * 79% if we use a CNN of width 5 (±2 tokens).
    * On nonterminal constituents, we find that the CNN ±2 model matches ELMo
    * suggesting that most of the constituent info propagated is local in nature.
* similar trend on the other? syntactic tasks, with 8090% of ELMo performance on
* more semantic tasks, such as coreference, SRL non-core roles, and SPR, 
  * the gap between full ELMo and the CNN baselines is larger. This 
  * suggests that ELMo's improvements are largely due to long-range information.
* how our probing model performs with distant spans. 
  * Figure 3 shows F1 score as a function of the distance (number of tokens)
  * CNN models and the orthonormal encoder perform best with nearby spans, but
    fall off rapidly as token distance increases. The 
  * full ELMo model holds up better, with performance dropping only 7 F1 points

# 6 Related work 9

# 7 Conclusion 10

Appendix

# A Changes from original version 14

# B Dataset statistics

# C Model details

# D Contextual representation models 15

# E Retokenization 16
