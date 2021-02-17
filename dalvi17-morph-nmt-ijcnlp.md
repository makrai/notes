Fahim Dalvi, Nadir Durrani, Hassan Sajjad, Yonatan Belinkov, Stephan Vogel
Understanding and Improving Morphological Learning in the NMT Decoder
2017 IJCNLP

# Abstract

* little is known about
  * linguistic patterns of morphology, syntax and semantics learned
  * which parts of the architecture are responsible for learning each of these
* In this paper
  * how much morphology an NMT decoder learns, and
  * whether injecting target morphology into the decoder helps
* three methods:
  * joint generation,
  * joint-data learning, and
  * multi-task learning
* Our results show that explicit morphological information
  * helps the decoder learn target language morphology and
  * improves the translation quality by 0.2–0.6 BLEU points

# 1 Intro

* [NMT] improvements are attributed to
  * more fluent output (Toral and Sánchez-Cartagena, 2017) and
  * better handling of morphology and long-range dependencies
    (Bentivogli+ 2016)
  * However, systematic studies are required
* attempts ... to understand what NMT models learn
  * morphology (Belinkov+ 2017a)
  * syntax (Shi+ 2016) and
  * semantics (Belinkov+ 2017b)
  * activations at various layers from the NMT encoder to predict ...  properts
* Belinkov+ (2017a) found that word representations learned from the
  * encoder are rich in morphological information, while representations
  * decoder are significantly poorer.  However, the paper does not present a
  * [no] convincing explanation for this finding. Our first contribution in
* this work:
  a more comprehensive analysis of morphological learning on the decoder side
  * hypothesi[s]: other components of the NMT architecture
    * specifically the encoder and the attention mechanism,
    * learn enough information about the target language morphology for the
      decoder to perform reasonably well, without incorporating high levels of
      morphological knowledge into the decoder
  * questions:
    * What is the effect of attention on the performance of the decoder?
    * How much does the encoder help the decoder
      in predicting the correct morphological variant of the word it generates?
  * a quantitative measure of how well the NMT model learned morph features
    * train NMT models for different language pairs,
      involving morphologically rich languages such as German and Czech. We then
    * extract features from the decoder for words in the language of interest
    * train a classifier using the extracted features to predict the morph tag
  * results indicate that both the encoder and the attention mechanism
    aid the decoder in generating correct morphological forms, and thus
    limit the need of the decoder to learn target morphology
  * we ... force the decoder to learn more about morphology
    by injecting the morphological information during training
    which can in turn improve the overall translation quality. In order to test
* three possible solutions:
  1. Joint Generation:
    * the concatenation of words and morphological tags on the target side
  2. Joint-data learning:
    * each source sequence is used twice
      with an artificial token to either predict target words or morph tags
  3. Multi-task learning:
    * two objective functions
      to jointly learn translation and morphological tagging
* Our experiments show that ... explicitly injecting target morphology improve
  morphological tagging accuracy of the decoder by 3% and also improves the
  translation quality by up to 0.6 BLEU points

# 2 Experimental setup

## Morphological Annotations

* We used the following tools recommended on the Moses website 1 to annotate
  * LoPar (Schmid, 2000) for German,
  * Tree-tagger (Schmid, 1994) for Czech and
  * MXPOST (Ratnaparkhi, 1998) for English.  The
  * number of tags produced by these taggers is 214 for German and 368 for Cz

# 3 Analysis of the decoder

# 4 The three proposed methods to integrate morphology into the decoder

# 5 Results

# 6 Related work and

# 7 Concludes the paper
