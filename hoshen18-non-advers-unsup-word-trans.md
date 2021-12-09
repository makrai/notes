Non-Adversarial Unsupervised Word Translation
Yedid Hoshen, Lior Wolf
EMNLP 2018 Brussels, Belgium

# Abstract

* Unsupervised word translation from non-parallel inter-lingual corpora has
* neural network methods trained with adversarial loss functions achieved high
* the recent techniques suffer from the typical drawbacks of GANs
  * sensitivity to hyper-parameters, long training time and lack of interpretab
* we: two sufficiently similar distributions can be aligned correctly with
  iterative matching methods
  * novel method that
    1. aligns the second moment of the word distributions of the two languages
    2. iteratively refines the alignment
* Extensive experiments on word translation of European and Non-European langs
  * our method achieves better performance than recent SOTA deep adversarial
  * competitive with the supervised baseline
  * efficient, easy to parallelize on CPU and interpretable
