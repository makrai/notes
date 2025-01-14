Selecting the UD v2 Morphological Features for Indonesian Dependency Treebank
Ika Alfina; Daniel Zeman; Arawinda Dinakaramani; Indra Budi; Heru Suhartanto
Published in: 2020 International Conference on Asian Language Processing (IALP)

https://github.com/ialfina/revised-id-pud

# Abstract:

* propose the relevant Universal Dependencies (UD) morphological features for
* apply the proposed features to an existing treebank.
* We propose the use of 14 UD v2 features
* we built models for lemmatization, POS tagging, morphological analysis, and
  dependency parsing using UDPipe, a trainable pipeline for tokenization,
* For lemmatization, POS tagging, and morphological features analysis tasks, the
  resulting models have F1-score of more than 93% that shows that the
  consistency of annotations for the columns LEMMA, UPOS, and FEATS in the
  treebank is already good.
* hE, the accuracy of the Indonesian dependency parser built is still only
  82.59% for UAS and 79.83% for LAS. The experiments also show that
* morphological information has no or little impact on improving the quality of
  lemmatization, POS tagging, and dependency parsing models for Indonesian.

# I.  Introduction

* Indonesian, also known as Bahasa Indonesia, is an Austronesian language
  * over 260 million speakers in 2020.
  * In [4], Indonesian is addressed as Malay-Indonesian, since the indigenous
    name of the language is Bahasa Melayu (the Malay language). Indonesian is
    similar with the Malay language used in Malaysia, Brunei and Singapore.
* two Indonesian treebanks in the UD dataset v2.6, named
  Indonesian GSD [5] and Indonesian PUD [6].
  * Alfina+ 2019 conducted
    * analysis to both treebanks and suggested that
      their quality still needed improvements since
    * many aspects in tokenization, POS tagging and syntactic annotation were
      not fully aligned to the Indonesian grammar.
    * They proposed improvements and revised the Indonesian PUD treebank. We
    * the revised Indonesian PUD treebank produced by [7] also still need
      improvements since they have not filled the lemma and features columns in
* Previous works had worked on Indonesian morphological features.
  * Pisceldo+ 2008 built a morphological analyzer
    * produce information about the active/passive voice of Indonesian verbs.
  * MorphInd [9] produces more features like singular/plural information for Ns
  * Some UD Indonesian treebanks also have applied UD features to the dataset.
  *  many differences among those works about what features are relevant for id
* The objectives of our work are:
  * To propose the relevant UD v2 features for Indonesian grammar.
  * To revise an Indonesian dependency treebank by applying these features.
  * To investigate the impact of using morphological features in building models
    for lemmatization, POS tagging, and dependency parsing for Indonesian.
* a new version of the Indonesian PUD treebank that has been made public

# II.  Related Work

# III.  Selecting the Ud V2 Features For Indonesian

# IV.  Revising the Indonesian Pud Treebank

# V.  Experiments and Results
