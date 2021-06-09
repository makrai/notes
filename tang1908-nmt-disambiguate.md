Gongbo Tang, Rico Sennrich, Joakim Nivre
Encoders Help You Disambiguate Word Senses in Neural Machine Translation
EMNLP 2019

# Abstract

* NMT has achieved new SOTA performance in translating ambiguous words
  However, it is still unclear which component dominates  disambiguation
* In this paper
  * evaluating hidden states and
  * investigating the distributions of self-attention
  * train a classifier to predict whether a translation is correct given the
    representation of an ambiguous noun
* We find that encoder hidden states outperform word embeddings significantly
  which indicates that encoders adequately encode relevant information for
  disambiguation into hidden
  * In contrast to encoders, the effect of decoder is different in models
  * attention weights and attention entropy show that
    self-attention can detect ambiguous nouns and
    distribute more attention to the context

# 1 Introduction

* Neural machine translation (NMT) models (Kalchbrenner and Blunsom, 2013;
  Sutskever+ 2014; Cho+ 2014; Bahdanau+ 2015; Luong+ 2015)
  * have access to the whole source sentence for the prediction of each word,
    * allows them to perform WSD better than previous phrase-based methods, and
      Rios+ (2018) have confirmed this empirically
* unclear which component dominates the ability to disambiguate word senses. We
* Marvin and Koehn (2018) find that the hidden states in higher encoder layers
  do not perform disambiguation better than those in lower layers and
  * However, their results are based on small data sets, and we wish to revisit
* Tang+ (2018b) speculate [ hidden states ] but without any experimental tests
* In this paper, we first train a classifier for WSD, on a much larger
  * data set extracted from ContraWSD (Rios+ 2017), for (DE→EN) and (DE→FR)
  * The classifier
    * is fed
      * a representation of ambiguous nouns and
      * a word sense (represented as the embedding of a translation candidate),
    * has to predict whether the two match. We can learn the role that encoders
  * comparing different representations:
    word embeddings and encoder hidden states at different layers
    * encoder hidden states from RNNS2S (Luong+ 2015) and Transformer (Vaswa17)
* Belinkov+ (2017a,b) have shown that the higher layers are better at semantics
* We hypothesize that the hidden states in higher layers incorporate more
  relevant information for WSD than those in lower layers. In addition to
* distributions of attention mechanisms have been used for interpreting NMT
  (Ghader and Monz, 2017; Voita+ 2018; Tang+ 2018b; Voita+ 2019; Tang+ 2019)
* our findings:
  * Encoders encode lots of relevant information for WSD into hidden states,
    even in the first layer
    * The higher the encoder layer, the more relevant information is encoded
  * Forward RNNs are better than backward RNNs in modeling ambiguous nouns
  * Decoders hidden states have different effects on WSD in Transformer and
    RNNS2S
  * Self-attention
    * focuses on the ambiguous nouns themselves in the first layer and
    * keeps extracting relevant information from the context in higher layers
  * Self-attention can recognize the ambiguous nouns and distribute more
    attention to the context words compared to dealing with nouns in general

# 2 Methodology 2

# 3 Experiments 3

# 4 Analysis 4
