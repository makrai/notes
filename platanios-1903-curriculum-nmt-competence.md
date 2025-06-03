Competence-based Curriculum Learning for Neural Machine Translation
Emmanouil A Platanios, Otilia Stretcu, G Neubig, B Póczos, Tom M Mitchell
NAACL 2019 arXiv:1903.09848 [cs.CL]

# Abstract

* Current SOTA NMT systems use large neural networks that are not only slow to
  * often require many heuristics and optimization tricks, such as specialized
    learning rate schedules and large batch sizes
  * requires extensive hyperparameter tuning
* In this paper, we propose a curriculum learning framework for NMT that
  * reduces training time, the need for specialized heuristics or large batch
  * results in overall better performance
* curriculum based on the
  * estimated difficulty of a sample and the current competence of the model
  * prevents the model from getting stuck in bad local optima, making it
    converge faster and reach a better solution than the common approach of
    uniformly sampling training examples
* can be easily applied to existing NMT models by modifying their input pipelin
* improve the training time and the performance of both RNNs and Transformers,
  * 70% decrease in training time
  * accuracy improvements of up to 2.2 BLEU
