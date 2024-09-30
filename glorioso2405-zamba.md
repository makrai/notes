Zamba: A Compact 7B SSM Hybrid Model
Paolo Glorioso, Quentin Anthony, Yury Tokpanov, James Whittington, Jonathan Pilault, Adam Ibrahim, Beren Millidge
Cite as: 	arXiv:2405.16712 [cs.LG]

weights and all checkpoints for Zamba, through both phase 1 and annealing phases

# Abstract

* we present Zamba, a novel 7B SSM-transformer hybrid model which achieves
* competitive performance against leading open-weight models at a comparable
  scale. Zamba is
* trained on 1T tokens from openly available datasets and is
* architecture combining a Mamba backbone with a single shared attention
  module, thus obtaining the benefits of attention at minimal parameter cost.
* significantly faster at inference than comparable transformer models and
  requires substantially less memory for generation of long sequences. Zamba is
* pretrained in two phases:
  * the first phase is based on existing web datasets, while the
  * second one consists of annealing the model over high-quality instruct and
    synthetic datasets, and is characterized by a
    * rapid learning rate decay
