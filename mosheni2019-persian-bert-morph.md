MorphoBERT: a Persian NER System with BERT and Morphological Analysis
Mahdi Mohseni Amirhossein Tebbifakhr
First Workshop on NLP Solutions for Under Resourced Languages 2019

#Abstract

* Persian is a less-developed language in many NLP tasks such as NER. In this
* our system, MorphoBERT Taghizadeh+ (2019). We train the BERT model (Devlin+
  2019a) on a large volume of Persian texts to get a highly accurate
  representation of tokens and then we apply a BiLSTM (bidirectional LSTM) on
  vector representations to label tokens. 
* Persian is a rich language in terms of morphology and word parts may convey
  grammatical and semantic information. To inform the model of this in-
  * we analyze texts morphologically to split the lemma and affix(es) of each
