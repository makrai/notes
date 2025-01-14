XCOPA: A Multilingual Dataset for Causal Commonsense Reasoning
Edoardo M Ponti, Goran Glavaš, Olga Majewska, Qianchu Liu, I Vulić, A Korhonen
arXiv:2005.00333 [cs.CL]

# Abstract

* NLP systems must be able to reason about the dynamics of everyday situations,
  including their possible causes and effects
  * generalise the acquired world knowledge to new languages,
    modulo cultural differences. Advances in machine reasoning and cross-ling
* we introduce Cross-lingual Choice of Plausible Alternatives (XCOPA), a
  typologically diverse multilingual dataset for causal commonsense reasoning
  * 11 languages, which include resource-poor languages
    like Eastern Apurímac Quechua and Haitian Creole
* We evaluate a range of SOTA models on this novel dataset, revealing that the
  * current methods based on multilingual pretraining and zero-shot fine-tuning
    falls short compared to translation-based transfer
* we propose strategies to adapt multilingual models
  to out-of-sample resource-lean languages whith only a small corpus or dict
  * we report substantial improvements over the random baseline

# 1 Introduction

* Commonsense reasoning is critical for any NLU system (Davis and Marcus, 2015)
  * Contrary to textual entailment, commonsense reasoning must bridge between
    premises and possible hypotheses with world knowledge that is
    not explicit in text (Singer+ 1992)
  * Such world knowledge encompasses temporal and spatial relations, causality,
    laws of nature, social conventions, politeness, emotional responses, and
    multiple modalities
    * shapes the individuals’ expectations about typical situations
      (Shoham, 1990)
* benchmarks
  * seminal: Choice Of Plausible Alternatives dataset (COPA; Roemmele+ 2011)
    * focuses on cause–effect relationships
  * dedicated to other facets of world knowledge
    (Sakaguchi+ 2020; Bisk+ 2020; Bhagavatula+ 2020; Rashkin+ 2018; Sap+ 2019)
  * limited only to the English language
    * Anglocentric bias in modeling commonsense reasoning
    * expectations about typical situations vary across cultures (Thomas, 1983)
  * multilingual datasets for other natural understanding tasks, such as
    * language inference (Conneau+ 2018)
    * question answering (Lewis+ 2020; Artetxe+ 2020a; Clark+ 2020)
    * paraphrase identification (Yang+ 2019b)
    * several multilingual tasks in the XTREME evaluation suite (Hu+ 2020)
    * commonsense reasoning is still missing
* we develop a novel dataset, XCOPA (see examples in Table 1)
  * translating and re-annotating the validation and test sets of English COPA
    into 11 target languages
    * typologically diverse sample of languages
    * resource-rich languages tend to belong to a few families and areas,
      i.e. biased sample (Gerz+ 2018; Ponti+ 2019a; Joshi+ 2020; Lauscher+ 2020)
    * we: 5 geographical macro-areas
      (Africa, Eurasia, Papunesia, North America, and South America)
* We benchmark a series of SOTA pretrained multilingual models, including
  XLM R (Conneau+ 2020), MBERT (Devlin+ 2019), & multilingual USE (Yang+ 2019a)
  * Two XCOPA languages (i.e., Southern Quechua and Haitian Creole) are
    out-of-sample for the pretrained models
    * how to adapt the pretrained models to such unseen languages
  * resource-lean scenarios where either some monolingual data or a bilingual
    dictionary with English (or both) are available for the target language
* contributions
  * the first large-scale multilingual evaluation set for commonsense reasoning,
    spanning 11 languages
    * discuss the challenges in accounting for world knowledge across cultures
  * metrics to measure the internal variety of a language sample,
    * can guide the design of any multilingual dataset in the future
  * We benchmark pretrained SOTA models in cross-lingual commonsense transfer
  * how to (post-hoc) improve transfer for languages unseen at pretraining time
* models must be able to
  * combine textual evidence with world knowledge
    (Talmor+ 2019; Rajani+ 2019)
  * transfer the acquired causal reasoning abilities across languages
  * results indicate the limitations of current SOTA multilingual models in
    cross-lingual transfer settings for complex reasoning tasks

## 2.3 Final Dataset. As Table 1 shows

* each (X)COPA instance corresponds to a
  * premise
  * question (“What was the CAUSE ?” or “What happened as a RESULT ?”), and
  * two alternatives. The task is framed as binary classification
* For each target language, XCOPA comprises 100 valid 500 test
  * translations from the respective English COPA validation and test set
  * labeling prior to translation, deciding on the correct alternative
  * inter-translator agreement using the Fleiss’ κ statistic (Fleiss, 1971):
    * 0.921 for validation and 0.911 for test data reveal very high agreement
