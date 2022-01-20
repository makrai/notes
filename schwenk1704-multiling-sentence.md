Learning Joint Multilingual Sentence Representations with Neural Machine Translation
Holger Schwenk, Matthijs Douze
RepL4NLP arXiv:1704.04154 [cs.CL]

This version contains slightly updated results and examples.

* six very different languages. Our aim is that a representation which is
* new cross-lingual similarity measure, compare up to 1.4M sentence reprs and
* we study the characteristics of close sentences. We provide experimental
* sentences that are close in embedding space are indeed semantically highly
  related, but often have quite different structure and syntax. These relations
  also hold when comparing sentences in different languages.

# 1 Intro

* distributed representations of words, often called word embeddings, in
* sentences or small paragraphs, these word embeddings need to be “combined”
  * bag-of-words or some type of pooling, eg. (Arora+ 2017),
  * recursive neural networks, eg. (Socher+ 2011),
  * recurrent neural networks, in particular LSTMs, eg. (Cho+ 2014),
  * convolutional neural networks, eg. (Collobert and Weston, 2008; Zhang+ 2015)
  * hierarchical approaches, eg. (Zhao+ 2015).
* “encoder-decoder approach”, also named “sequence-to-sequence learning"
  * neural machine translation (NMT)
    (Kalchbrenner and Blunsom, 2013; Cho+ 2014; Sutskever+ 2014).
  * Current best practice is to use recurrent neural networks for the enc & dec,
  * alternative architectures like convolutional networks have been also
    explored.
* performance of these vanilla seq2seq models substantially degrades with the
  sequence length since it is difficult to encode long sequences into a fixed-sz
  * attention mechanism (Bahdanau+ 2015): where the generation of each target
* NMT handles several source and/or target languages at once, with the goal of
  * better translation quality than with separately trained NMT systems,
  * in particular for under resourced languages, see for instance
    (Dong+ 2015; Zoph and Knight, 2016; Luong+ 2015a; Firat+ 2016a)
* we aim at learning multilingual sentence representations. Motivations to learn
  * capture the underlying semantics of the sentence (since the meaning is the
    only common characteristic of a sentence formulated in several languages);
  * it has the potential to zero-shot transfer of many sentence processing
    applications (classification, sentiment analysis, semantic similarity, etc),
  * it enables multilingual search;
  * sort of a continuous space interlingua
* we are using the framework of NMT with multiple encoders and decoders. We

# model in detail,

## relate it to existing research, and then present an

# experimental evaluation.
