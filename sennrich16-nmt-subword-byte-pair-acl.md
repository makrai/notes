Neural Machine Translation of Rare Words with Subword Units
Rico Sennrich and Barry Haddow and Alexandra Birch
acl 2016

# Abstract

* We discuss the suitability of different word segmentation techniques,
  including simple character n-gram models and 
  a segmentation based on the byte pair encoding compression algorithm, and
  empirically show that subword models improve over a back-off dictionary
  baseline for the WMT 15 translation tasks English→German and English→Russian

# Introduction

* subword models achieve better accuracy for the translation of rare words than
  large-vocabulary models and back-off dictionaries
* contributions:
  * open-vocabulary [NMT] via subword units ... simpler and more effective 
    than using large vocabularies and back-off dictionaries 
    (Jean et al., 2015; Luong et al., 2015b)
  * We adapt byte pair encoding (BPE) (Gage, 1994), a compression algorithm, to
    the task of word segmentation. BPE allows for the representation of an open
    vocabulary through a fixed-size vocabulary of 
    variable-length character sequences, making it a 
    very suitable word segmentation strategy for neural network models.

# 3 Subword Translation

## 3.2 Byte Pair Encoding (BPE)

* data compression technique that 
  * iteratively replaces the most frequent pair of bytes in a sequence with a
    single, unused byte. 
  * We adapt this algorithm for word segmentation. Instead of merging frequent
    pairs of bytes, we merge characters or character sequences.
* we do not consider pairs that cross word boundaries. The algorithm 
  * can thus be run on the dictionary [weighted]
* difference to other compression algorithms, such as Huffman encoding, which
  have been proposed to produce a variable-length encoding of words for NMT
  (Chitnis and DeNero, 2015), is that 
  our symbol sequences are still interpretable as subword units, and that the
  network can generalize to translate and produce new words
* We evaluate two methods of applying BPE: learning 
  * two independent encodings, one for the source, one for the target
    * more compact in terms of text and vocabulary size, and having 
      stronger guarantees that each subword unit has been seen in ... training
  * the encoding on the union of the two vocabularies (which we call joint BPE)
    * improves consistency between the source and the target segmentation.  If
      we apply BPE independently, the same name may be segmented differently in
      the two languages, which makes it harder for the neural models to learn a
      mapping between the subword units
    * between English and Russian segmentation ... we transliterate 
