Linguistic Knowledge and Transferability of Contextual Representations 
Nelson F. Liu, Matt Gardner, Yonatan Belinkov, Matthew E. Peters, Noah A. Smith
2019 NAACL

# Abstract

* we study several recent pretrained contextualizers (variants of ELMo, the
  OpenAI transformer language model, and BERT) with a suite of 
* sixteen diverse probing tasks. We find that 
* linear models trained on top of frozen contextual representations are
  * competitive with SOTA task-specific models in many cases, but 
  * fail on tasks requiring fine-grained linguistic knowledge (e.g., conjunct
    identification).  To investigate the 
* transferability of contextual word representations, we quantify 
  * differences in the transferability of individual layers within
  * especially between recurrent neural networks (RNNs) and transformers. For
    * higher layers of RNNs are more task-specific, while 
      transformer layers do not exhibit the same monotonic trend.  In addition,
* we compare language model pretraining with eleven supervised pretraining
  * pretraining on a closely related task yields better performance than LM
  * LM is better on average
  * language model pretraining on more data gives the best results
