Irony detection via sentiment-based transfer learning
S Zhang, X Zhang, J Chan, P Rosso
Information Processing & Management Volume 56, Issue 5, September 2019

# Highlights

* Take advantage of the readily available sentiment resources
  to identify implicit incongruity for irony detection
* Transferring deep sentiment features to a neural attention model 
  * an effective approach to extract patterns of implicit incongruity
* Evaluate irony detection models using
  human-annotated and automatic hashtag-labeled datasets separately

# Abstract

* Irony as a literary technique is widely used in online texts such as Twitter
  * irony detection is crucial for tasks such as effective sentiment analysis
  * ironic intent is defined by its context incongruity
    * eg “I love being ignored”
* irony detection mostly formulated as a standard supervised text categ task
* we formulate irony detection instead as a transfer learning task where
  * supervised learning on irony labeled text is enriched with
    knowledge transferred from external sentiment analysis resources.
    * we focus on identifying the hidden, implicit incongruity
      without relying on explicit incongruity expressions
* three transfer learning-based approaches to using sentiment knowledge
  to improve the attention mechanism of recurrent neural models
  for capturing hidden patterns for incongruity
* findings are:
  * Using sentiment knowledge from external resources is a very effective
  * For detecting implicit incongruity,
    transferring deep sentiment features seems to be the most effective way
  * Experiments: our models outperform SOTA neural models for irony detection
