GQA: Training Generalized Multi-Query Transformer Models from Multi-Head Checkpoints
Joshua Ainslie, James Lee-Thorp, M de Jong, Y Zemlyanskiy, F Lebrón, S Sanghai
EMNLP 2023. Added to related work arXiv:2305.13245 [cs.CL]

* Multi-query attention (MQA) only uses a single key-value head, 
  * drastically speeds up decoder inference
  * hE MQA can lead to quality degradation, and moreover it may not be
    desirable to train a separate model just for faster inference
* We
  1. a recipe for uptraining existing multi-head language model checkpoints
     into models with MQA using 5% of original pre-training compute,
  2. grouped-query attention (GQA), a generalization of multi-query attention
     which uses an intermediate number of key-value heads
    * (more than one, less than number of query heads)
* uptrained GQA achieves quality close to multi-head attention
  with comparable speed to MQA
