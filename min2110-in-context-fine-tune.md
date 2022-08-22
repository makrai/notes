MetaICL: Learning to Learn In Context
Sewon Min, Mike Lewis, Luke Zettlemoyer, Hannaneh Hajishirzi
arXiv:2110.15943 [cs.CL]

https://github.com/facebookresearch/MetaICL

# Ruder

* a different fine-tuning setting that optimizes for in-context learning:
  instead of fine-tuning a model on examples of a task directly, they provide
  the concatenation of k+1 examples to a model as input, and
  train the model to predict the label of the k+1-th example
* improvements in zero-shot transfer

# Abstract

* We introduce MetaICL (Meta-training for In-Context Learning),
  * a new meta-training framework for few-shot learning where
    a pretrained language model is tuned to do in-context learning
    on a large set of training tasks
* learn a new task in context at test time, by simply conditioning on a few
  training examples with no parameter updates or task-specific templates
* We experiment on a large, diverse collection of
  * tasks consisting of 142 NLP datasets including classification, QA, NLP,
    paraphrase detection, etc
  * seven meta-training/target splits
* MetaICL outperforms a range of baselines including
  * in-context learning without meta-training and
  * multi-task learning followed by zero-shot transfer
* particularly significant for target tasks that have
  domain shifts from the meta-training tasks
* using a diverse set of the meta-training tasks is key to improvements
* MetaICL
  * approaches (and sometimes beats) the performance of models fully finetuned
    on the target task training data, and
  * outperforms much bigger models with nearly 8x parameters
