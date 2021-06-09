Alternative structures for character-level RNNs
Piotr Bojanowski, Armand Joulin, and Tomáš Mikolov

# Három cikk és két repó

|skip-gramwi	  |arxiv/1607.04606|Enriching Word Vectors|szovektorokrol	       |
|fastText	      |arxiv/1607.01759|Bag of trick for Effic|az osztalyozásról	   |
|RNN (ICLR 2016)|arxiv/1511.06303|Alternative structures|modellek tomoriteserol|

https://github.com/facebookresearch/fastText
https://github.com/facebook/Conditional-character-based-RNN

# Abstract

* two alternative structural modifications to the classical RNN model
  * conditioning the character level representation on the previous word
  * character history to condition the output probability
* We evaluate [on] multi-lingual real world data

# Intro

* sequential data ... applications, for example in
  * language modeling (Goodman, 2001),
  * speech recognition (Young+ 1997)
  * machine translation (Koehn+ 2007)
* subword information
  * words that are rarely seen during training [or] only in the test data
  * agglutinative languages
  * typos and spelling mistakes
    * requires ad-hoc spell checking approaches that are
      designed disjointly from the main language modeling task
* CharRNNs
  * Mikolov+ 2011; Sutskever+ 2011; Graves, 2013
  * both lower accuracy and higher computational cost (Mikolov+ 2012)
  * also ... LSTM RNNs work better with word-based input (Graves, 2013)
* Ad-hoc solutions based on larger sub-word units
  * reasonable accuracy and training speed (Mikolov+ 2012)
  * one has to specify how to create the sub-word units
    * differ from language to language; and
    * a word can have multiple segmentations
* number of parameters the RNN has to access during the training and test
  * The smaller is the input and output layer of RNN, the larger needs to be
    the fully connected hidden layer, which [is] expensive
  * another architecture [without] word level information
    * make the computation ... more sparse
* modifications of this model
  * Sec. 3, combines two networks,
    * one working with characters at the input, and the other with words
  * Sec.  4
    * conditioning the softmax output on the recent history

## Related work

* mix of word and character level input for neural network language models
  * Kang+ (2011) in the context of Chinese
  * RNN for LM Mikolov+ (2010)
  * subword units are either
    * characters (Mikolov+ 2011; Sutskever+ 2011; Graves, 2013)
    * syllables (Mikolov+ 2012)
  * embedding of words to deal with OOV words
    (Bilmes & Kirchhoff, 2003; Alexandrescu & Kirchhoff, 2006; Luong+ 2013)
    * Luong+ (2013)
      * recursive neural network over morpheme embeddings, while
    * Bilmes & Kirchhoff (2003) build their embedding by
      * concatenating features built on previously seen words

# 5 Experimental evaluation

* We evaluate our method using entropy in bits per character
  * defined as the empirical estimate of the cross-entropy between the target
    distribution and the model output in base 2

## The multilingual Europarl dataset

* The CRNN baseline as well as the proposed models
  still are quite far from the performance of a word-level RNN
  * average performance of both proposed models give a
    per-character entropy of 1.36
  * The proposed structural modifications allow us to achieve
    similar performance to a large character-level RNN
    with a reduced computational cost
  * For languages such as Finnish and Hungarian, the
    conditional model (Cond) yields best performance
* For reference, we computed a
  word-level RNN baseline using a modified version of SCRNN
  * If we assign 4 times the average entropy to OOV words,
    it gives us an entropy of 1.7 BPC
  * The proposed models allow us to
    efficiently tackle the problem of learning small vocabulary sequences
  * hE, the gap between the word and character-level models is far from closed
