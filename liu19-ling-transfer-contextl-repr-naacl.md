Nelson F. Liu, Matt Gardner, Yonatan Belinkov, Matthew E. Peters, Noah A. Smith
Linguistic Knowledge and Transferability of Contextual Representations
NAACL 2019

# Abstract

* we study ... variants of ELMo, the OpenAI transformer LM, and BERT
* seventeen diverse probing tasks
* linear models trained on top of frozen contextual representations are
  * competitive with SOTA task-specific models in many cases, but
  * fail on ... e.g., conjunct identification
* transferability of
  * individual layers within contextualizers, 
    * especially between recurrent neural networks (RNNs) and transformers
  * higher layers of RNNs are more task-specific, while
  * transformer layers do not exhibit the same monotonic trend
* we compare language model pretraining with eleven supervised pretraining ones
  * when the pretraining dataset is fixed
    * closely related task yields better performance than
    * language model ... is better on average
  * language model pretraining on more data gives the best results

# 1 Intro

* Recent work has explored the linguistic knowledge captured by LMs & NMT syss
  * hierarchical syntax (Blevins+ 2018) or 
  * morphology (Belinkov+ 2017a). We extend prior work by studying CWR s with a
  * we: diverse set of seventeen probing tasks designed to assess a wide array
    e.g. coreference, ... semantic relations, and entity information
* transferability, pretraining contextualizers on the language modeling task
  * how the pretraining task affects the linguistic knowledge learned,
    * [we consider] twelve pretraining tasks [to]  nine target tasks.
* organization
  4. What features of language do these vectors capture, and what do they miss?
  5. How and why does transferability vary across representation layers in
  6. How does the choice of pretraining task affect
* probing models 
  * Sometimes called auxiliary or diagnostic classifiers.
  * (Shi+ 2016b; Adi+ 2017; Hupkes+ 2018; Belinkov and Glass, 2019) to analyze
* Our analysis reveals interesting insights such as:
  * Linear [probes] are competitive with SOTA taskspecific models in many
  * layers
    * The most transferable layer
      * first layer of [an LSTM] is consistently the 
      * the middle layers for transformers
    * other
      * Higher layers in LSTMs are more taskspecific (and thus less general),
      * transformer layers do not exhibit this same monotonic increase in spec 
  * Language model pretraining yields [more transferable] representations 
    than eleven other candidate pretraining tasks, though 
    * pretraining on related tasks yields the strongest results for individual
