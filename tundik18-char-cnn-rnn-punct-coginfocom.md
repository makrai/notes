Máté **Ákos** Tündik and György Szaszák
Joint Wordand Character-level Embedding CNN-RNN Models
  for Punctuation Restoration
Coginfocom 2018

# Abstract

* The sequence-to-sequence modelling paradigm, biLSTM
* The current paper proposes to
  * enhance the word sequence-based system with a character-level model using a
    Convolutional Neural Network (CNN). CNNs are known to be useful as
  * hybrid solution when the punctuation marks are jointly determined based on
    character~ and on word-level features, and demonstrate significant
  * evaluation ... on a Hungarian Broadcast Dataset and on the IWSLT English ds

# INTRODUCTION

* [our previous work] on automatic punctuation of ASR at CogInfoCom 2017 [1],
  * relies on text processing, whereas the second one on
  * exploiting prosodic markers linked to punctuation marks. In these previous
  * low latency in realistic use-cases of ASR technology. The current paper
* character-level sequential information is
  * motivated mostly by the idea to
    * data sparsity problems often met at the word-level, or to
    * model phenomena at a deeper level to better understand the ...  factors
    * light-weight models. As explained in earlier work, punctuation is
  * successfully used in several Natural Language Processing (NLP) tasks
    * distinguishing between similar languages or dialects [5]
    * Part-of-Speech (PoS) tagging in historical texts [6]
    * language modelling [7]
    * Named Entity Recognition (NER) [8]. Character-level models
  * combined with word-level models often perform the best, as reported in
    * [9] for NER
    * [10] for text classification, [11] for neural machine translation
    * [12] for sentiment analysis
  * neural network models has been shown to outperform ... CRF or MaxEnt [1]
  * Whether human cognition also exploits [character-level] features in
    * humans start from higher levels – such as situational context [14], but,
    * rely on very basic low-level features in cognitive tasks [15].  The
    * success of Convolutional Neural Net- works (CNN) in [speech] [16], [17]

# II Hungarian and English Datasets in Section II

## A. The Hungarian Broadcast Dataset

* punctuation marks ... in- clude commas, periods, question marks and exclamat

# III word-level, character-level, and hybrid punctuation restoration models

* closing with a weighted ensemble so- lution, in Section III

# IV The evaluation of system performance with objective measures

* The character-level approach is very simple with few vocabulary entries,
  still it yielded a punctuation performance close to the one seen with
  word-level models
