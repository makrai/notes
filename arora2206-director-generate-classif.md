DIRECTOR: Generator-Classifiers For Supervised Language Modeling
Kushal Arora, Kurt Shuster, Sainbayar Sukhbaatar, Jason Weston
arXiv:2206.07694 [cs.CL]

* Current language models achieve low perplexity but their resulting
  generations still suffer from
  toxic responses, repetitiveness and contradictions
* we introduce Director
  * a unified generator-classifier with
    both a language modeling and a classification head for each output token
* Training is conducted jointly using both
  standard language modeling data, and
  data labeled with desirable and undesirable sequences
* Experiments in several settings show
  * competitive training and decoding speed compared to standard LMs
  * alleviating known issues while maintaining generation quality
  * outperforms existing model guiding approaches
    in terms of both accuracy and efficiency
