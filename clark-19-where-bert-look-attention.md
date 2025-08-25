What Does BERT Look at? An Analysis of BERT’s Attention
Kevin Clark, Urvashi Khandelwal, Omer Levy, Christopher D. Manning
BlackboxNLP 2019

     github.com/clarkkev/attention-analysis + additional community code

# Abstract

* Large pre-trained neural networks such as BERT have had great recent success
  * research investigating what aspects of language they are able to learn from
    * model outputs (eg language model surprisal) or
    * internal vector representations (eg probing classifiers)
* we propose methods for analyzing the attention mechanisms of pre-trained mods
  * patterns such as attending to delimiter tokens, specific positional
    offsets, or broadly attending over the whole sentence, with
    * heads in the same layer often exhibiting similar behaviors
  * certain attention heads correspond well to
    linguistic notions of syntax and coreference
    * eg heads that attend to the direct objects of verbs, determiners of
      nouns, objects of prepositions, and coreferent mentions
      with remarkably high accuracy
  * an attention-based probing classifier
  * demonstrate that substantial syntactic information is captured
