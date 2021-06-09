What Does BERT Look at? An Analysis of BERT’s Attention
Kevin Clark, Urvashi Khandelwal, Omer Levy, Christopher D. Manning
2019 BlackboxNLP: Analyzing and Interpreting Neural Networks for NLP

# Abstract

* we propose methods for analyzing the attention mechanisms of pre-trained
* BERT’s attention heads exhibit patterns such as attending to delimiter tokens,
  specific positional offsets, or broadly attending over the whole sentence,
  with heads in the same layer often exhibiting similar behaviors.  We further
* certain attention heads correspond well to linguistic notions of syntax and
  coreference. For example, we find
  * heads that attend to the direct objects of verbs, determiners of nouns,
    objects of prepositions, and coreferent mentions with remarkably high accurc
* we propose an attention-based probing classifier and use it to further
  * substantial syntactic information is captured in BERT’s attention.
