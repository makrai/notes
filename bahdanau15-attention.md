Neural machine translation by jointly learning to align and translate
Dzmitry Bahdanau and KyungHyun Cho and Yoshua Bengio
2015

# 1 Introduction

* Neural machine translation is a newly emerging approach to MT
  * proposed by
    Kalchbrenner and Blunsom (2013), * Sutskever+ (2014) and * Cho+  (2014b)
  * Most of the ... models belong to a family of
    * encoder–decoders (Sutskever+ 2014; Cho+ 2014a),
    * or involve a language-specific encoder applied to each sentence
      (Hermann and Blunsom, 2014)
  * fixed-length vector ... may make it difficult for ... long sentences,
    * especially those that are longer than ... in the training corpus
    * Cho+ (2014b) showed that indeed the
    performance of a basic encoder–decoder deteriorates rapidly
    as the length of an input sentence increases

# 2 Background: neural machine translation

* neural networks to directly learn this conditional distribution
  * Kalchbrenner and Blunsom, 2013; Cho+ 2014a;
  * Sutskever+ 2014;
    * RNNs with long shortterm memory (LSTM) units achieves
      close to the state-of-the-art performance
      * of the conventional phrase-based machine translation system
      * without using any neural network-based component
    * on an English-to-French translation task
    * Adding neural components to existing translation systems
      * e.g
        * score the phrase pairs in the phrase table (Cho+ 2014a) or to
        * re-rank candidate translations (Sutskever+ 2014), has
      * surpass the previous state-of-the-art performance level
  * Cho+ 2014b;
  * Forcada and Neco, (1997)
