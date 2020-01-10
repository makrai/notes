J Ács
Multilingual Morphological Probes for Contextual Word Representations
rejected from emnlp 19

    We will publicly release our code and data.

#Intro

* The extent to which distributed models like Contextual word representations
  (CWR) s encode linguistics ... has been widely probed 
  (Shi+ 2016; Linzen+ 2016; Adi+ 2017; Hupkes and Zuidema, 2018; Blevins+ 2018;
  Conneau+ 2018; Hewitt and Manning, 2019; Tenney+ 2019; Liu+ 2019). 
  * A probe typically treats a learned representation as a fixed feature vector
    and measures the ease in which a model for a linguistic task (e.g., part of
    speech tagging) can be learned from these features alone, often with
    limited training data. High accuracy on the task is taken as a
* the difference between CWR -based models and baselines correlates strongly
  with the level of ambiguity of the task (Pearson’s r = 0.76). 
  * On verb probes ..., morphological awareness of CWR s is mostly on par with
  * on noun probes CWR s’ advantage is more pronounced. We also note that 
* BERT and ELMo learn morphology to a similar degree on average, but with
  notable variation across languages: training data and linguistic typology.  
* contrasts with conventional wisdom. First, 
  * in contrast to recent findings in machine translation (Belinkov+ 2017),
    lower layers of CWR s do not encode more morphology than higher layers.
  * contrary to the recommendation by the BERT authors (Devlin+ 2019), we show
    that the last wordpiece 2 of a word in BERT encodes much more morpho-
    logical information than the first wordpiece. 
    
#2 Probing Tasks

* up to 15 Estonian noun classes. 
* See Appendix A for details of the sampling method, as well as the full list
  of languages and tasks.
