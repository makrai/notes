WinoGrande: An Adversarial Winograd Schema Challenge at Scale
Keisuke Sakaguchi, Ronan Le Bras, Chandra Bhagavatula, Yejin Choi
arXiv:1907.10641 [cs.CL]

* Yejin Choiról Turán György mondja, hogy hisz a deep learning szimbolikus
  dolgokkal való hibridizálásában

# Abstract

* The Winograd Schema Challenge (WSC) (Levesque, Davis, and Morgenstern 2011),
  a benchmark for commonsense reasoning, is a set of 273 expert-crafted pronoun
  resolution problems originally designed to be unsolvable for statistical
  models that rely on selectional preferences or word associations
* recent advances in neural language models have already reached around 90%
  accuracy on variants of WSC
  * spurious biases in the datasets that lead to an overestimation
* WinoGrande, a large-scale dataset of 44k problems, inspired by the original
  WSC design, but adjusted to improve both the scale and the hardness of the
  * The key steps of the dataset construction consist of 
    * a carefully designed crowdsourcing procedure, followed by 
    * systematic bias reduction using a novel AfLite algorithm that generalizes
      human-detectable word associations to machine-detectable embedding assoc
* The best SOTA methods on WinoGrande achieve 59.4-79.1%, which are 15-35%
  below human performance of 94.0%, depending on the amount of the training
  data allowed
* new SOTA results on five related benchmarks - WSC (90.1%), DPR (93.1%), COPA
  (90.6%), KnowRef (85.6%), and Winogender (97.1%). These results have dual
* implications: on one hand, they demonstrate the 
  * effectiveness of WinoGrande when used as a resource for transfer learning.
  * concern that we are likely to be overestimating the true capabilities of
    machine commonsense across all these benchmarks
