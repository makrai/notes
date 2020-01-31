Nelson F. Liu, Matt Gardner, Yonatan Belinkov, Matthew E. Peters, Noah A. Smith
Linguistic Knowledge and Transferability of Contextual Representations
NAACL 2019

# Abstract

* we study ... variants of ELMo, the OpenAI transformer LM, and BERT) with a
* seventeen diverse probing tasks. We find that
* linear models trained on top of frozen contextual representations are
  * competitive with state-of-the-art task-specific models in many cases, but
  * fail on ... e.g., conjunct identification
* transferability of
  * individual layers within contextualizers, especially
    between recurrent neural networks (RNNs) and transformers. For instance,
  * higher layers of RNNs are more task-specific, while
  * transformer layers do not exhibit the same monotonic trend. In addition, to
* we compare language model pretraining with eleven supervised pretraining
  tasks.  For any given task, pretraining on a
  * when the pretraining dataset is fixed
    * closely related task yields better performance than
    * language model ... is better on average) when the pretraining dataset is
  * language model pretraining on more data gives the best results
