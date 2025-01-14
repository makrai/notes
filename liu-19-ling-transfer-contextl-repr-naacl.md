Linguistic Knowledge and Transferability of Contextual Representations
Nelson F. Liu, Matt Gardner, Yonatan Belinkov, Matthew E. Peters, Noah A. Smith
NAACL 2019

# Abstract

* we study variants of ELMo, the OpenAI transformer LM, and BERT
* seventeen diverse probing tasks
* linear models trained on top of frozen contextual representations
  * competitive with SOTA task-specific models in many cases, but
  * fail on e.g., conjunct identification
* transferability of
  * individual layers within contextualizers,
    * especially between recurrent neural networks (RNNs) and transformers
  * higher layers of RNNs are more task-specific, while
  * transformer layers do not exhibit the same monotonic trend
* we compare language model pretraining with eleven supervised pretraining mods
  * when the pretraining dataset is fixed
    * closely related task yields better performance
    * language model is better on average
  * language model pretraining on more data gives the best results

# 1 Intro

* Recent work has explored the linguistic knowledge captured by LMs & NMT syss
  * hierarchical syntax (Blevins+ 2018) or
  * morphology (Belinkov+ 2017a)
  * we: seventeen probing tasks designed to assess a wide array
    e.g. coreference, semantic relations, and entity information
* transferability, pretraining contextualizers on the language modeling task
  * how the pretraining task affects the linguistic knowledge learned,
    * [we consider] twelve pretraining tasks [to] nine target tasks
* organization
  4. What features of language do these vectors capture
  5. How and why does transferability vary across representation layers
  6. How does the choice of pretraining task affect
* probing models
  * Sometimes called auxiliary or diagnostic classifiers
  * (Shi+ 2016b; Adi+ 2017; Hupkes+ 2018; Belinkov and Glass, 2019)
* Our analysis reveals
  * Linear [probes] are competitive with SOTA task-specific models in many tsks
  * layers
    * The most transferable layer
      * first layer of [an LSTM], consistently
      * the middle layers for transformers
    * other
      * Higher layers in LSTMs are more task-specific
      * transformer layers do not exhibit this same monotonic increase
  * bi-LM pretraining yields [more transferable] reprs
    than eleven other candidate pretraining tasks, though
    * pretraining odn related tasks yields the strongest results for [fixd task]

# 2 Probing Tasks 2

* we specifically focus on understanding the CWRs of individual words or pairs

# 3 Models 4

# 4 Pretrained Contextualizer Comparison 4

# 5 Analyzing Layerwise Transferability 6

# 6 Transferring Between Tasks 7

# 7 Related Work 8

# 8 Conclusion 9

* Prior work has suggested that higher-level contextualizer layers may be
  expressly encoding higher-level semantic information
* Instead, it seems likely that
  certain high-level semantic phenomena are incidentally useful for the
  contextualizer’s pretraining task, leading to their presence in higher layers

# Appendices

## A Probing Task Setup Details

## B Probing Model Training Details

## C References to SOTA Task-Specific Models (Without Pretraining)

## D Performance of Pretrained Contextualizers on All Tasks

## E Full Results for Transferring Between Pretraining Tasks
