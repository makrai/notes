Wasi Uddin Ahmad, Zhisong Zhang, Xuezhe Ma, Kai-Wei Chang, Nanyun Peng
On Difficulties of Cross-Lingual Transfer with Order Differences:
  A Case Study on Dependency Parsing
NAACL 2019

# Abstract

* In this paper, we posit that an order-agnostic model will perform better
  when transferring to distant foreign languages
* To test our hypothesis, we train dependency parsers
  * we evaluate their transfer performance [from] English to 30 other langs
  * encoders and decoders based on RNNs and modified self-attention archits
  * RNN-based architectures transfer well to languages that are close
  * self-attentive models have better overall cross-lingual transferability and
    * especially on distant languages

# 1 Introduction

* Cross-lingual transfer
  * applied to many NLP tasks such as
    * text categorization (Zhou+ 2016a)
    * tagging (Kim+ 2017)
    * dependency parsing (Guo+ 2015, 2016) and o
    * machine translation (Zoph+ 2016)
  * requires understanding and handling differences between languages
    at levels of morphology, syntax, and semantics
* Prior work mainly focused on sharing word-level information by leveraging
  multi-lingual word embeddings (Xiao and Guo, 2014; Guo+ 2016; Sil+ 2018)
* encode context as a high-level feature for downstream tasks
  * a variety of approaches (CNN, RNN) have been proposed to
  * In this paper, we study [cross-lingual] transfer of generic contextual info
  * RNN compelling (Mikolov+ 2010; Sutskever+ 2014; Peters+ 2018)
  * “Transformer” (Vaswani+ 2017; Liu+ 2018; Kitaev and Klein, 2018)
    * With modification in position representations, [it] can be more robust
      than RNNs to the change of word order
* we quantify language distance in terms of word order typology
  * dependency parsing?
    * unified annotations across a broad spectrum of languages (Nivre+ 2018)
    * word order typology influence dependency parsing
      (Naseem+ 2012; Täckström+ 2013; Zhang and Barzilay, 2015; Ammar+ 2016;
      Aufrant+ 2016)
    * many downstream applications [can benefit]
      (McClosky+ 2011; Gamallo+ 2012; Jie+ 2017)
  * We conduct evaluations on 31 languages across a broad spectrum of families,

# 3 Models

* overall architecture of models that are studied in this research is
  * The first layer is an input embedding layer, for which we simply
    concatenate word and POS embeddings. The
  * POS embeddings are trained from scratch, while the
  * word embeddings are fixed and initialized with the multilingual embeddings
    by Smith+ (2017)
    * Samuel L Smith, David HP Turban, Steven Hamblin, and Nils Y Hammerla
      Internation Conference on Learning Representations 2017
      Offline biling word vectors, orthog trafos and the inverted softmax
  * These inputs are fed to the encoder to get contextual representations,
    which is further used by the decoder for predicting parse trees
* We explore different encoders and decoders that are considered as
  order-sensitive and order-free, respectively
