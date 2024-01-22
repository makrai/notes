Muppet: Massive Multi-task Representations with Pre-Finetuning
Armen Aghajanyan, A Gupta, A Shrivastava, X Chen, L Zettlemoyer, S Gupta
EMNLP 2021

# Abstract

* We propose pre-finetuning, an additional large-scale learning stage between
  * massively multi-task learning (around 50 datasets, 4.8 M total labeled exa)
  * for representations that generalize better to many different tasks 
  * consistently improves
    * performance
      * for pret discriminators (eg RoBERTa) and generation models (eg BART)
      * on a wide range of tasks (sentence prediction, commonsense ríz, MRC, etc)
    * significantly improving sample efficiency during fine-tuning
  * large-scale multi-tasking is crucial
    * pre-finetuning can hurt performance when few tasks are used up until a
      critical point (usually above 15) after which
      performance improves linearly in the number of tasks
