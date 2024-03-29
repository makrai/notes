Rowan Zellers, Ari Holtzman, Yonatan Bisk, Ali Farhadi, Yejin Choi
HellaSwag: Can a Machine Really Finish Your Sentence?
ACL 2019

# Abstract

* Though its questions are trivial for humans (>95% accuracy),
  SOTA models struggle (<48%). We achieve this via
* Adversarial Filtering (AF), a data collection paradigm wherein
  a series of discriminators iteratively select an adversarial set of
  machine-generated wrong answers. AF proves to be surprisingly robust
* insight is to scale up the length and complexity of the dataset examples
  towards a critical ‘Goldilocks’ zone wherein generated text is ridiculous to
  humans, yet often misclassified by SOTA models
* sheds light on the inner workings of deep pretrained models
* [we] suggests a new path forward for NLP research, in which
  * benchmarks co-evolve with the evolving SOTA in an adversarial way

# 1 Intro

* a Goldilocks zone
  * roughly three sentences of context, and two generated sentences
  * generations are largely nonsensical, even though SOTA discriminators cannot
    reliably tell the difference between these generations and the ground truth
* On each iteration,
  a new classifier is trained on a dummy training set D_train to
  replace easily-classified negative endings on the dummy test set D_test with
  adversarial endings
* Only once this cycle becomes impossible can we say that the underlying task –
  as opposed an individual dataset – is solved

# Appendix

## B GPT Setup

* We generate our dataset examples from OpenAI GPT
* We finetune the model for two epochs on WikiHow, and 5 epochs on ActivityNet,
* default learning rate of (Radford+ 2018)
* Importantly, we generate randomly according to the language model
  distribution, rather than performing beam search – this would bias the
  generations towards common words
* For the WikiHow endings, we used Nucleus Sampling with p = 0.98 (Holtzman+ 19)
  * i.e. the probability weights for the tail (those tokens with cumulative
    probability mass < .02) are zeroed out
