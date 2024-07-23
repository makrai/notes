What to Pre-Train on? Efficient Intermediate Task Selection
Clifton Poth, Jonas Pfeiffer, Andreas Rücklé, Iryna Gurevych
EMNLP 2021 arXiv:2104.08247 [cs.CL]

# Abstract

* Intermediate task fine-tuning has been shown to culminate in large transfer
  * an abundance of candidate datasets as well as pre-trained language models,
  * infeasible to run all the combinations to find the best transfer setting.
* we first/subsequently
  * similar sequential fine-tuning gains can be achieved in adapter settings,
  * efficiently identify beneficial tasks for intermediate transfer learning.
    * we consolidate previously proposed methods
* experiments: 42 intermediate and 11 target 
  * English classification, multiple choice, question answering, and seq tag
  * efficient embedding based methods that rely solely on the respective
    datasets outperform computational expensive few-shot fine-tuning
  * Our best methods achieve an average Regret@3 of less than 1% across all
    target tasks,
    ie we are able to identify the best datasets for intermediate training
