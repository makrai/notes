An Empirical Study of Mamba-based Language Models
R Waleffe, W Byeon, D Riach, B Norick, V Korthikanti, T Dao, A Gu,
  A Hatamizadeh, S Singh, D Narayanan, G Kulshreshtha, V Singh, J Casper,
  J Kautz, M Shoeybi, B Catanzaro

checkpoints and code used to train our models as part of NVIDIA's Megatron-LM

# Abstract

* Selective state-space models (SSMs) like Mamba 
  * overcome some of the shortcomings of Transformers, such as 
    * quadratic computational complexity with sequence length and 
    * large inference-time memory requirements from the key-value cache.
  * can match or exceed the language modeling capabilities of Transformers,
  * hE only small scale experiments comparing SSMs to Transformers.
* we: larger scales, a direct comparison between 8B-parameter Mamba, Mamba-2,
  and Transformer models trained on the same datasets of up to 3.5T tokens.
  * We also compare these models to a hybrid architecture consisting of
    43% Mamba-2, 7% attention, and 50% MLP layers (Mamba-2-Hybrid). Using a
* diverse set of tasks, we answer the question of whether Mamba models can
  * results show that while
  * pure SSMs match or exceed Transformers on many tasks, they 
  * SSMs lag behind Transformers on tasks which require 
    * strong copying or in-context learning abilities (eg 5-shot MMLU,
      Phonebook) or 
    * long-context reasoning. In contrast, we find that 
  * the 8B Mamba-2-Hybrid exceeds the 8B Transformer on all 12 standard tasks
    we evaluated (+2.65 points on average) and is 
    * predicted to be up to 8x faster when generating tokens at inference time.
  * long-context capabilities: additional experiments evaluating variants of
    the Mamba-2-Hybrid and Transformer extended to support 16K, 32K, and 128K
    sequences. On an 
    * additional 23 long-context tasks, 
    * the hybrid model continues to closely match or exceed the Trafo on avg.
