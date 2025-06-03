Tuning Multilingual Transformers for Language-Specific Named Entity Recognition
Mikhail Arkhipov, Maria Trofimova, Yuri Kuratov, Alexey Sorokin
7th Workshop on Balto-Slavic Natural Language Processing 2019

# Abstract

* Slavic languages: Russian, Bulgarian, Czech and Polish with multilingual BERT
* Unsupervised pre-training of the BERT model on these 4 languages allows to
  significantly outperform baseline neural approaches and multilingual BERT.
  * Additional improvement is achieved by extending BERT with a word-level CRF
* NER models and BERT model pre-trained on the four Slavic languages.

# Intro

* contribution is three-fold:
  * multilingual BERT embeddings with a dense layer on the top clearly beat
  * languagespecific BERT, trained only on the target languages from Wikipedia
    and news dump, significantly outperforms the multilingual BERT.
  * we adapt a CRF layer as a a top module over the outputs of the BERT-based
    model and demonstrate that it improves performance even further.
* training BERT from scratch is extremely expensive computationally so we
  initialize our model with the multilingual one.  We rebuild the vocabulary of
  subword tokens using subword-nmt 2 . When a single Slavic subtoken may
  consist of multiple multilingual subtokens, we initilalize it as an average
  of their vectors, resembling (Bojanowski+ 2016). All weights of transformer
  layers are initialized using the multilingual weights.

## 4.2 Preand Post-processing

* sentence tokenizer
  * NLTK (Loper and Bird, 2002) for Bulgarian, Polish, and Czech
  * absence of Bulgarian sentence tokenizer we apply the English NLTK one
  * Russian language we use DeepMIPT sentence tokenizer.  We replace all UTF
