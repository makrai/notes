FlauBERT: Unsupervised Language Model Pre-training for French
Hang Le, Loïc Vial, Jibril Frej, Vincent Segonne, Maximin Coavoux, Benjamin
  Lecouteux, Alexandre Allauzen, Benoît Crabbé, Laurent Besacier, Didier Schwab
LREC 2020 arXiv:1912.05372 [cs.CL]

Different versions of FlauBERT as well as
a unified evaluation protocol for the downstream tasks, called FLUE (fr nlu)
are shared to the research community for further reproducible experiments

# Abstract

* learned on a very large and heterogeneous French corpus
  * trained on a multiple-source corpus and achieved SOTA results on a number of
* Models of different sizes are trained using the new CNRS supercomputer
* tasks (text classification, paraphrasing, natural language inference, parsing,
  word sense disambiguation) and show that
  * most of the time they outperform other pre-training approaches
* competitive with CamemBERT (Martin+ 2019) – another fr pretrained language mod
  * despite being trained on almost twice as fewer text data.  In order to make
* FLUE
  * similar to the popular GLUE benchmark (Wang+ 2018), and is named FLUE
    (French Language Understanding Evaluation)

# 2.  Related Work

## 2.2. Pre-trained Language Models Beyond English Given the impact of

* ELMo exists for Portuguese, Japanese, German and Basque, 5 while
* BERT and variants were specifically trained for simplified and traditional
  Chinese 8 and German. 6 A
* Portuguese version of MultiFiT is also available. 7 Recently, more monolingual
* BERT for
  * Arabic (Antoun+ 2020)
  * Dutch (de Vries+ 2019; Delobelle+ 2020)
  * Finnish (Virtanen+ 2019)
  * Italian (Polignano+ 2019)
  * Portuguese (Souza+ 2019)
  * Russian (Kuratov and Arkhipov, 2019)
  * Spanish (Cañete+ 2020)
  * Vietnamese (Nguyen and Nguyen, 2020).  For
* French, besides pre-trained language models using
  * [ULMFiT and MultiFiT configurations]
    (https://github.com/piegu/language-models)
  * CamemBERT (Martin+ 2019) is a French BERT model concurrent to our work
* multilingual models with a shared vocabulary. The release of
  * multilingual BERT for 104 languages pioneered this approach. 8 A recent
  * parallel data to build a cross-lingual pre-trained version of LASER (Artetxe
    and Schwenk, 2019) for 93 languages,
  * XLM (Lample and Conneau, 2019) and XLM-R (Conneau+ 2019) for 100 languages

## 2.3. [multi-task] Evaluation Protocol for NLP

* multi-task evaluation benchmark such as GLUE (Wang+ 2018) for English is benef
  * SuperGLUE (Wang+ 2019a): a new benchmark built on the principles of GLUE,
    * more challenging and diverse set of tasks. A
* Chinese version of GLUE 9 is also developed to evaluate model performance in
* no such benchmark for French

# 4 FLUE

* different domains, level of difficulty, degree of formality, and amount of
  training samples
  * Three out of six tasks  are from cross-lingual datasets
    (Text Classification, Paraphrase, Natural Language Inference)
    since we also aim to provide results from a monolingual pre-trained model to
    facilitate future studies of cross-lingual models, which have been drawing
    much of research interest recently.  Table 2 gives an overview of the
    datasets, including their domains and training/development/test splits. The

## 4.1. Text Classification

### CLS The Cross Lingual Sentiment CLS (Prettenhofer and Stein, 2010) dataset

* Amazon reviews for three product categories: books, DVD, and music in
* four languages: English, French, German, and Japanese. Each sample contains a
* rating from 1 to 5 stars
  * Following Blitzer+ (2006) and Prettenhofer and Stein (2010), ratings with 3
    stars are removed.  Positive reviews have ratings higher than 3 and negative
    reviews are those rated lower than 3. There is one train and test set for
    each product category.  The
  * train and test sets are balanced, including around 1 000 positive and 1 000
* We take the French portion to create the binary text classification task in
  * report the accuracy on the test set
