`XLM-R_{XL,XXL}`: Larger-Scale Transformers for Multilingual Masked LM
Naman Goyal, Jingfei Du, Myle Ott, Giri Anantharaman, Alexis Conneau
ACL 2021 | IJCNLP | RepL4NLP

# 1 Introduction

* The better performance of self-supervised crosslingual models on low-resource
  languages comes however at the cost of lower performance on higher-resource
  languages (Arivazhagan+ 2019)
  * When the number of languages becomes large, Conneau+ (2019) even observed
    an overall decrease of performance on all languages. It was hypothesized
    that when multilingual models get more capacity, they may showcase strong
    performance on both high-resource languages and lowresource languages. With
    only 550M parameters, the XLM-R model is now relatively small compared to
    new standards
* language models to hundreds of billions (Brown+ 2020) or even multiple
  trillion parameters (Fedus+ 2021), showing consistent gains in doing so
  * multilingual T5 showed impressive increase in performance by scaling the
    model capacity to tens of billions of parameters. Our study complements
    these findings by showing the impact of larger capacity models on the
    important pretraining task of multilingual masked language model-

# 3

## Disucssion

* larger improvement from the XL model to the XXL model in the case of mT5, in
  * additional capacity can exploit the large quantity of unlabeled mC4 data
  * Another explanation may be that generative models scale better than maskd LM
* striking variance of performance across languages. For example the mT5 XXL
* the CC100 dataset may get saturated with current larger-capacity models
