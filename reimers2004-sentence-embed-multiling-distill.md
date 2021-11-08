Making Monolingual Sentence Embeddings Multilingual using Knowledge Distill
Nils Reimers, Iryna Gurevych
arXiv:2004.09813 cs.CL

https://github.com/UKPLab/sentence-transformers
* While v1 model supports 15 languages, v2 supports 50+ languages
  * hE, performance on the 15 languages are reported to be a bit lower in v2

# Abstract

* Our method extends existing sentence embedding models to new languages
  * create multilingual versions from previously monolingual models
  * idea that a translated sentence should be mapped to the same location
    1. orig monoling model to generate sentence embeddings for the source lang
    2. train a new system on translated sentences to mimic the original model
* advantages
  * with relatively few samples to new languages
  * easier to ensure desired properties for the vector space
    * e.g. design a vector space to work well for a specific clustering task
  * hardware requirements for training is lower
* experiments in 10 languages from various language families
* Code to extend sentence embeddings models to more than 400 languages

# Introduction

* Mapping sentences or short text paragraphs to a dense vector space
  * applications: information retrieval, clustering, automatic essay scoring,
    and semantic textual similarity
  * training data for other languages is scarce
* We call this approach multilingual knowledge distillation learning
  * works for various language combinations as well as for multilingual setups
* other training approaches for multilingual sentence embeddings
  * LASER (Artetxe and Schwenk, 2018): an encoder-decoder LSTM model using a
    translation task. The output of the encoder is used as sentence embedding
    * works well for identifying exact translations in different languages
    * works less well for accessing the similarity of sentences that are !=
  * Multilingual Universal Sentence Encoder (mUSE)
    (Chidambaram+ 2018; Yang+ 2019) 
    * trained in a multi-task setup on SNLI (Bowman+ 2015) and
      on >1B question-answer pairs from online forums and QA websites
    * training obj: translation ranking. Given a translation pair
      and various alternative (incorrect) translations, identify the correct one
    * multi-task learning can suffer from catastrophic forgetting
      * balancing multiple tasks is not straight forward
      * huge computational overhead
      * alternative translations
        * random alternative translations usually leads to mediocre results
        * hard negatives (Guo+ 2018) are required, i.e., alternative incorrect
        * Getting these hard negative samples is non-trivial
          1. train the network with random negatives samples, then
          2. identify for each translation pair five hard negative examples with
             this preliminary sentence encoder
  * we use
    * Sentence-BERT (SBERT, Reimers and Gurevych, 2019), which
      * SOTA performance for various sentence embeddings task
      * based on transformer models like BERT (Devlin+ 2018)
      * mean pooling on the output to derive a fixed sized sentence embedding
    * XML-RoBERTa (XLM-R, Conneau+ 2019), a transformer network pre-trained on
      100 languages, as student model
  * approach is not limited to be used with transformer models
