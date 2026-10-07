Linear Representations of Sentiment in Large Language Models
Curt Tigges, Oskar John Hollinsworth, Atticus Geiger, Neel Nanda
arXiv:2310.15154 [cs.LG]

# Abstract

* we reveal that across a range of models, sentiment is represented linearly: a
  * single direction in activation space mostly captures the feature 
  * across a range of tasks with one extreme for positive and the other for
* method: causal interventions, we isolate this direction and show it is
  causally relevant 
  in both toy tasks and real world datasets such as Stanford Sentiment Treebank.
* a thorough investigation of what a single direction means on a broad data
  distribution.
* We uncover the mechanisms: a small subset of attention heads and neurons. 
* the summarization motif, we discover a phenomenon which we term : 
  * sentiment is not solely/but additionally
    * represented on emotionally charged words, but is 
    * summarized at intermediate positions without inherent sentiment, such as
      eg punctuation and names. We show that in 
* Stanford Sentiment Treebank zero-shot classification, 
  76% of above-chance classification accuracy is lost when ablat the senti dir
  * nearly half of which (36%) is due to ablating the summarized sentiment
    direction exclusively at comma positions
