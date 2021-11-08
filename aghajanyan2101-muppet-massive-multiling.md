Muppet: Massive Multi-task Representations with Pre-Finetuning
Armen Aghajanyan, Anchit Gupta, Akshat Shrivastava, Xilun Chen, Luke Zettlemoyer, Sonal Gupta
arXiv:2101.11038 [cs.CL]

* We propose pre-finetuning, an additional 
  * large-scale learning stage between language model pre-training & fine-tuning 
  * massively multi-task learning 
    (around 50 datasets, over 4.8 million total labeled examples), and is
  * consistently improves performance for 
    * pretrained discriminators (e.g.~RoBERTa) & generation models (e.g.~BART)
    * wide range of tasks (sentence prediction, commonsense reasoning, MRC, etc)
  * significantly improving sample efficiency during fine-tuning.  We also show
  * large-scale multi-tasking is crucial
    * hurt performance when few tasks are used up until a 
    * critical point (usually above 15) after which 
    * performance improves linearly in the number of tasks. 
