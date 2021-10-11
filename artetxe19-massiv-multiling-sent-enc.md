Massively Multilingual Sentence Embeddings for Zero-Shot Cross-Lingual Transfer and Beyond
Mikel Artetxe, Holger Schwenk
Transactions of the Association for Computational Linguistics (2019) 7: 597–610

Our implementation, the pre-trained encoder, and the multilingual test set
https://github.com/facebookresearch/LASER

# Abstract

* We introduce an architecture to learn joint multilingual sentence reprs
* 93 languages, belonging to more than 30 families and written in 28 scripts
* a single BiLSTM encoder with a
  * shared byte-pair encoding vocabulary for all languages, which is
  * coupled with an auxiliary decoder and
  * trained on publicly available parallel corpora.  This enables us to learn a
* classifier on top of the resulting embeddings using English annotated data
  * transfer it to any of the 93 languages without any modification.  Our
* experiments in
  * cross-lingual natural language inference (XNLI data set)
  * cross-lingual document classification (MLDoc data set)
  * parallel corpus mining (BUCC data set) show the effectiveness of our
* new test set of aligned sentences in 112 languages, and show that
  * our sentence embeddings obtain strong results in multilingual sim search
    even for low-resource languages
