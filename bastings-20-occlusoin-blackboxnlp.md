The elephant in...:  Why attention as explanation when we have saliency methods?
Jasmijn Bastings, Katja Filippova
BlackboxNLP | EMNLP 2020

* input saliency methods (§3)
  * (Li+ 2016a; Sundararajan+ 2017; Ribeiro+ 2016; Montavon+ 2019)
    * Jiwei Li, Xinlei Chen, Eduard Hovy, and Dan Jurafsky
      Visualizing and understanding neural models in NLP
      NAACL 2016a
    * Mukund Sundararajan, Ankur Taly, and Qiqi Yan
      Axiomatic attribution for deep networks
      2017 ICML
    * Marco Tulio Ribeiro, Sameer Singh, and Carlos Guestrin
      ”Why should I trust you?”: Explaining the predictions of any classifier
      2016.  ACM SIGKDD Intnl Conference on Knowledge Discovery and Data Mining
    * Grégoire Montavon, Alexander Binder, S Lapuschkin, W Samek & KR Müller
      Layer-wise relevance propagation: An overview
      2019 in Samek+ eds Explainable AI: Interpreting, Explaining and Visu
  * importance weights to the input tokens in a faithful manner, why should the

# 3 Saliency Methods

* following Arras+ (2019)
* We discuss methods that are applicable to any neural NLP model, allowing
  access to model internals, such as activations and gradients, as attention
  * We leave out more expensive methods that use a surrogate model
    eg LIME (Ribeiro+ 2016)

## 3.1 gradient-based (§3.1)

## 3.2 propagation-based (§3.2)

## 3.3 occlusion-based methods (§3.3)
