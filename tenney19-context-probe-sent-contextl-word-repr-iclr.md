Ian Tenney, Patrick Xia, Berlin Chen, Alex Wang, Adam Poliak, R Thomas McCoy,
Najoung Kim, Benjamin Van Durme, Samuel R. Bowman, Dipanjan Das, Ellie Pavlick
What do you learn from context?
  Probing for sentence structure in contextualized word representations
ICLR 2019 camera-ready version, 17 pages including appendices

* data processing and model code

#Abstract

* Contextualized representation models
  such as ELMo (Peters+ 2018a) and BERT (Devlin+ 2018)
  * state-of-the-art results on a diverse array of downstream NLP tasks
* recent token-level probing work
* we introduce a novel
  * edge probing task design
  * sub-sentence tasks derived from the traditional structured NLP pipeline
* We probe word-level contextual representations from four recent models
* investigate ... syntactic, semantic, local, and long-range phenomena
* models trained on language modeling and translation produce
  * strong representations for syntactic phenomena, but only offer
  * comparably small improvements on semantic tasks over a non-contextual basel
* [from the Conclusion]
  * the performance of ELMo cannot be fully explained by a model with access to
    local context
    * [i.e. it does] encode distant linguistic information, which 
      can help disambiguate longer-range dependency relations and 
      higher-level syntactic structures


#1 Introduction

* contextualized word embeddings
  * training objectives like
    * machine translation (McCann+ 2017) or
    * lang modeling (Peters+ 18a; Radford+ 18; Howard & Ruder, 18; Devlin+ 18)
  * the same interface as conventional word embeddings
  * significant improvements to the state-of-the-art on several tasks, includ
    constituency parsing (Kitaev & Klein, 2018),
    semantic role labeling (He+ 2018; Strubell+ 2018), and
    coreference (Lee+ 2018), and has
  * outperformed fixed-length (Kiros+ 2015; Conneau+ 2017)
* Recent [token-level probes e.g.]
  * part-of-speech tags (Blevins+ 2018; Belinkov+ 2017b; Shi+ 2016),
  * morphology (Belinkov+ 2017a;b), or
  * word-sense disambiguation (Peters+ 2018a)
* Peters+ (2018b) extend this to constituent phrases, and 
  present a heuristic for unsupervised pronominal coreference
* we focus on asking what information is encoded at each position
  * structural information about that word’s role in the sentence
  * primarily syntactic [or] also encode higher-level semantic relationships?
* We use data derived from traditional structured NLP tasks:
  tagging, parsing, semantic roles, and coreference
  * corpora such as OntoNotes (Weischedel + 2013) provide a wealth of annot
* refer[ed to]  as “edge probing”
  * we decompose each structured task into a set of graph edges (§ 2)
  * predict [edges] independently using a common classifier architecture (§3.1)
* We probe four popular contextual representation models (§ 3.2):
  * CoVe (McCann+ 2017), ELMo (Peters + 2018a), OpenAI GPT (Radford+ 2018), and
    BERT (Devlin+ 2018)
  * because their pretrained weights and code are available
  * word-level baselines to separate the contribution of context from lexical
  * augmented baselines to better understand the role of pretraining and the
    ability of encoders to capture long-range dependencies

#2 Edge probing 2

#3 Experimental set-up 4

#4 Experiments 5

#5 Results 6

#6 Related work 9

#7 Conclusion 10



#A Changes from original version 14

#B Dataset statistics

#C Model details

#D Contextual representation models 15

#E Retokenization 16
