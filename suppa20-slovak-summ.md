A Summarization Dataset of Slovak News Articles
Marek Suppa, Jergus Adamec
LREC 2020

* utilities for reproducuction at https://github.com/NaiveNeuron/sme-sum

# Abstract

* single-document summarization: significant interest in the past few years
* ROUGE metric assumes its input to be written in English
* we aim to address issues by introducing
  * a summarization dataset of articles from a popular Slovak news site
  * proposing small adaptation to the ROUGE metric that make it better suited
  * Several baselines are evaluated on the dataset, including an
    * extractive approach based on the Multilingual version of BERT

# 1 Intro

* neural networks require training corpora on the order of thousands of docs
* evaluation metrics depend on English stemmers, stop-words, and synonyms
* we
  * document summarization dataset which consists of Slovak news stories
    obtained from a prominent Slovak news website
  * a slightly altered version of the ROUGE metric (Lin and Hovy, 2003)
    * more realistic comparison by utilizing a Slovak stemmer
* SME dataset is rather extractive and we therefore focus on extractive models
* We evaluate various baselines as well as supervised and unsupervised extracton

# 2 Related Work

* Luhn, (1958) attempting to create an ”auto-abstract” of technical papers and
  magazine articles by extracting the sentences with highest significance
* extractive approaches e.g. those based on
  * Latent Semantic Analysis (Steinberger and Jezek, 2004), others that use
  * graph-based approaches, such as LexRank (Erkan and Radev, 2004), or
  * TextRank which utilizes PageRank to identify sentences of importance
    (Mihalcea and Tarau, 2004)

## 2.1. Neural Summarization Methods

* extractive summarization as a sentence classification problem
  * SummaRuNNer (Nallapati+ 2017) which encoded the input document with a
    recurrent neural network.  Several other approaches within this paradigm
  * Refresh that is trained to globally optimize the ROUGE scores with
    reinforcement learning methods,
  * Sumo (Liu+ 2019) which sees summarization as tree induction problem,
  * NeuSum (Zhou+ 2018) that jointly learns to score and select sentences for
    the final summarization and
  * BertSum (Liu and Lapata, 2019) which exploits pre-trained LMs
* abstractive paradigm of single-document summarization
  * benefited greatly from the introduction of neural matchine translation,
    * summarization formulated as a translation from the source document
  * Rush+ (2015) made use of neural encoder-decoder architecture
  * pointer-generator networks (See+ 2017) which are capable of copying words
  * reinforcement learning-based approaches (Celikyilmaz+ 2018, Paulus+ 2017),
  * convolutional neural networks (Narayan+ 2018)
  * contextualized pre-trained language models (Liu and Lapata, 2019)

## 2.2 Datasets

* CNN/DailyMail (Hermann+ 15), NY Times (Durrett+ 16) and XSum (Narayan+ 18)
  contain tens of thousands of documents, they are well poised for neural
* overview of document summarization corpora (Dernoncourt+ 2018)
* non-English text summarization, the most notable corpora are the MultiLing
  datasets which aim to assist in efforts to improve multilingual summarization
  * MultiLing 2015 dataset (Giannakopoulos+ 2015) contains documents in Arabic,
    Chinese, Czech, English, French, Greek, Hebrew, Hindi, Romanian and Spanish
  * MultiLing 2017 dataset (Giannakopoulos+ 2017) consists of documents written
    in 41 languages, including Slovak
  * small size which makes them impractical for use in combination with neural
* a large-scale news-based summarization dataset for Czech (Straka+ 2018)
  * Straka M; Mediankin N; Kocmi T; Žabokrtskỳ Z; Hudeček V; and Hajic J.
    Sumeczech: Large czech news-based summarization dataset
    LREC 2018

## 2.3 Evaluation Metrics

* ROUGE (Lin and Hovy, 2003), METEOR (Banerjee and Lavie, 2005) or other
  LSA-based measures (Steinberger and Ježek, 2012)
  * shortcomings (Schluter, 2017), but ROUGE remains the most widely used auto
* non-English summarization, drawbacks
  * ROUGE uses English stemmer, English stop words and synonyms
  * Straka+ (2018) propose an alternative language-agnostic approach
    * ROUGE RAW that does not use any stemmer, stop words or synonyms

# 3 The Dataset

* news articles from the web version of a prominent Slovak newspaper SME,
  * at the time of writing, the second most popular news website in Slovakia
* Following the methodology suggested in Hermann+ (2015),
  * Hermann KM; Kocisky T; Grefenstette E; Espeholt L; Kay W; Suleyman M;
      Blunsom P (2015)
    Teaching machines to read and comprehend
    NIPS 2015
* we collected over 100 thousand SME.sk articles from the Wayback archive
* items that resembled paid content have been removed from further processing
* For each article we extracted its
  * headline,
  * short one or two sentence abstract,
  * its actual text, the
  * news category (e.g. Home News, World News, Sport, Travel, Health, Tech, Bsn)
  * Wayback URL that uniquely identifies it
* train/valid/test set in the 80%/10%/10% ratio
* abstract follows the headline, we concatenated the two together --> summ
* source document and the target summary tokenized using the BlingFire library
* A comparison of this dataset with standard English summarization datasets
  * our dataset is split similary to the XSum, NY Times and DailyMail datasets
  * the summary statistics are very similar across all three splits
  * length of its documents both in terms of words and sentences is among the
    smallest ones on the list
    * may suggest that it could be applicable in the extreme summarization
    * hE, summary averages to two sentences, direct application is problematic
  * rich vocabulary which is most probably due to morphological richness
* novel ngrams found in the gold (target) summary
  * high number of novel unigrams in the dataset (about 32%)
  * most probably caused by Slovak morphology as when stemming gets applied,
    the fraction of novel n-grams gets considerably lower (to about 27%)
* two baseline extractive methods: Lead and Ext-Oracle
  * `Lead` (Nenkova, 2005) selects a couple of sentences from the beginning
  * metrics for the English datasets from (Narayan+ 2018), in which the
    CNN, DailyMail, NY Times and XSum have had their Lead baseline created by
    extracting the first 3 sentences, first 4 sentences, first 100 words and the
    first sentence of the source document, respectively
  * SME dataset, the first three sentences have been extracted
  * SME dataset is much closer to the extractive-leaning datasets like CNN and
    NY Times than to the abstractive XSum dataset
* The Ext-Oracle method can be seen as an upper bound for extractive
  * For the SME dataset, we select the subset of three sentences as the oracle
  * SME dataset seems to be much closer to the extractive-learning datasets than
    to the abstractive XSum with regards to this baseline as well

## 4.3 Eval

* ROUGE-1, ROUGE-2, and ROUGE-L
  * The first two metrics can be seen as a proxy measure for informativeness
    while the last metric can be taken to represent fluency
* issues with ROUGE applied to non-English texts: English-specific components,
* Straka+ (2018) ditch the stemming part altogether, resulting in a
  language-agnostic approach called ROUGE RAW 
* hE, In our experiments, this approach proved to be problematic
  * automatic evaluation reported zero score,
    even if the summary was in fact of high quality. The authors also note this
* we: both the system and ref summaries are passed through a Slovak stemmer
  before the ROGUE score is computed
* we update a Python implementation of the ROUGE score evaluation package
  py-rouge to work with a custom Python-based stemmer
* Slovak stemming with the stemmsk package
  * adapts the Czech stemmer described in Dolamic and Savoy, (2009) and
  * we use the ”light” version throughout this study

# 5 Results and discussion

* the unsupervised TexRank outperform Random only by a slight margin
* M-BERT better than the Lead baseline but the differences seem negligible –
* Considering the values reported for the Ext-Oracle baseline, it is clear
  that the presented models leave a substantial room for improvement
* the dataset may suffer from some of the issues described in Kryściński+ (2019)
  * task under-constrained and too ambiguous to be solved with end-to-end models
