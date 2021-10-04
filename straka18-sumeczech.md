SumeCzech: Large Czech News-Based Summarization Dataset
M Straka, N Mediankin, Tom Kocmi, Zdeněk Žabokrtský, Vojtěch Hudeček, Jan Hajič
LREC 2018

The dataset can be downloaded using the provided scripts available at
http://hdl. handle. net/11234/1-2615

# Abstract

* present SumeCzech, a Czech news-based summarization dataset.  It contains 
  * a million documents, each consisting of 
    a headline, a several sentences long abstract and a full text
* several summarization baselines evaluated on the dataset, 
  including a strong abstractive approach based on Transformer neural network
* evaluation is performed using a language-agnostic variant of ROUGE

# 1 Intro

* we introduce SumeCzech – a collection of one million Czech news articles,
  * each consisting of a headline, a several sentence abstract and a full text
  * originate from five Czech Internet news sites
  * can be used for multiple summarization setups:
    * headline generation either from an abstract or a full text, or
    * multi-sentence abstract from a full text
* language-agnostic variant of the ROUGE metric, which we call ROUGE RAW 
* We evaluate several baselines for all selected summarization settings
  * several unsupervised methods
  * two supervised methods:
    * extractive one inspired by approach by Kupiec+ (1995), and an
    * abstractive baseline based on Transformers neural network architecture

# 2 Related Work

## 2.1 Datasets

* headline generation. The task was standardized around the DUC-2003 and
  DUC-2004 competitions (Over+ 2007), which provided a standard evaluation set
  * 500 news articles from New York Times and Associated Press Wire, each paired
    with 4 different human-generated reference summaries
  * For training, the Gigaword dataset (Graff+ 2003) has been used frequently,
    offering 4 million news articles including their headlines
* Nallapati+ (2016a) modified the CNN/Daily Mail corpus constructed by Hermann+
  (2015) to serve for multi-sentence summarization
  * 300 000 documents
* Filippova and Altun (2013) proposed a method for constructing datasets for
    extractive sentence summarization
* Czech: Czech part of the MultiLing dataset (Giannakopoulos+ 2015; Li+ 2013;
  Elhadad+ 2013) containing 40 Wikipedia articles, and SummEC (Rott and Červa,
  2013) containing 50 news articles

## 2.2.  Metrics

* ROUGE (Lin, 2004) is the most commonly used metric, proposed as an
  English-specific recall-based metric
  * utilizes English stemmer, stop words and synonyms
* METEOR metric (Denkowski and Lavie, 2014) has been used by See+ (2017) to
  evaluate multisentence summarization

## 2.3.  Summarization Methods

* extractive summarization methods are typically
  * unsupervised, for example Luhn (Luhn, 1958)
    * Latent Semantic Analysis (Steinberger and Ježek, 2004)
    * LexRank (Erkan and Radev, 2004)
    * TextRank (Mihalcea and Tarau, 2004)
    * SumBasic (Vanderwende+ 2007) 
    * KL-Sum (Haghighi and Vanderwende, 2009). However, very good results in
  * recurrent neural networks (Filippova+ 2015; Filippova and Alfonseca, 2015;
    Nallapati+ 2016b; Nallapati+ 2017)
* Abstractive approach relies predominantly on the machine translation paradigm,
  (Rush+ 2015; Nallapati+ 2016a; Gülçehre+ 2016; See+ 2017)

# 3 The Dataset 2

## 3.1 Choice of Data Sources

* The raw data for the dataset was collected from the Common Crawl project 2
  using the Common Crawl API
* Initially, five Czech news websites were selected to create the dataset:
  novinky.cz , lidovky.cz , denik.cz , idnes.cz , and ihned.cz 
  * we decided to drop ihned.cz, because too many of its pages turned out to be
    just abridged versions of the actual articles with links to paid content
  * ceskenoviny.cz, which provides mostly highquality articles, was added

## 3.2 Data Preparation

* Dumps of the relevant websites’ pages from 10 Common Crawl collections were
* Irrelevant entries such as advertisement pages, article listings... filtered
* headline, abstract and full text were extracted based on the HTML structure
* Frequently seen leading tags such as FOTO, VIDEO, country, city were removed
* dropped if empty headline;, abstract shorter than 10 words;, full text shorter
  than 100 words;, text-to-abstract ratio less than 4
* Language recognition was performed with langdetect, 3 Python port of Google’s
* some documents was dropped based on the headline and/or abstract text
  * e.g. headlines indicated that the page is an advertisement
  * some abstracts were disclaimers that the page belongs to a series of culinar
* some documents was dropped based on the presence of certain keywords in the
  * e.g. abstracts were starting with the word ‘aktualizováno’ (‘updated’), a
    * could not be reliably removed.  From the sets of documents with either
* duplicate headlines, duplicate abstracts or duplicate texts, only one document
  was retained. Therefore, headlines in the dataset are unique, as well as
* Some inexact news duplicates were filtered out based on several heuristics
* Date of each article’s publication was extracted wherever possible

## 3.3 Structure of Dataset Entries: JSON Lines format

## 3.5 Dataset split (train/dev/test)

* we wanted
  * the documents that are close to each other in some sense to be put into the
    same part of the split
  * not? to end up with all the documents from one domain in the same part of the
    * it would introduce even stronger bias to the evaluation. To elaborate,
    * but it can be thought of as a common real-life situation when a model is
* documents were first clustered into 25 clusters by K-Means algorithm, based on
  normalized L2 similarity of their abstracts. A cluster of size approximately
  4.5% of the whole dataset size was taken as the out-of-domain test set. The
  rest of the data was then clustered again into 5000 clusters by K-Means
  algorithm, again based on L2 similarity of their abstracts. Consequently,
  the clusters were randomly divided in rougly 86.5:4.5:4.5 ratio to form the
  standard train/dev/test split

# 5 Eval Metrics 4

* A standard way to evaluate summarization task is the ROUGE metric (Lin, 2004)
  * English-specific metric (employing English stemmer, stop words and synonyms)
  * originally recall-based
* In DUC, both the gold summary and the system summary is capped at 75 bytes and
  the recall of the non-stop words is evaluated, taking synonyms into account
* with other datasets and more powerful abstractive methods,
  full-length F1 ROUGE is also being used recently
  (Nallapati+ 2016a; Chopra+ 2016; See+ 2017)
* we propose to evaluate summarization methods trained on the SumeCzech dataset
  using full-length F1score of a language-agnostic variant of ROUGE, which
  * no stemmer, no stop words and no synonyms. We denote this variant ROUGE RAW
  * ROUGE RAW -1 (unigrams), ROUGE RAW -2 (bigrams) and ROUGE RAW -L
* The Python 3 implementation of language-agnostic ROUGE RAW is provided

# 6 Experiments

## 6.1.  Extractive Methods

### 6.1.2 Supervised

* inspired by the work of Kupiec+ (1995). In this method, 
* we first transform each sentence to a vector of features
  * TF-IDF (Ramos and others, 2003): sum of TF-IDF measured for each word
  * Length: length of the sentence.
  * Cohesion: total edit distance from the sentence to the other ones
  * Proper names: count of capitalized words in the sentence.
  * Numbers: count of tokens that consist of digits.
  * Non-essential words: count of common words,,, 
* two classification algorithms: logistic regression and random forests. In the

## 6.2.  Abstractive Summarization

## 6.3.  Results and Discussion

* the `first` baseline is usually very difficult to overcome,
  especially in the domain of news articles (Nallapati+ 2016a; See+ 2017)
* abstract→headline setting in Table 4
  * extractive methods perform slightly worse than the first baseline, but the
  * abstractive t2t method performs the best, achieving the highest F-scores in
    all three ROUGE RAW variants
    * very high precision, but lacks in recall.  We found out that this is
    * a consequence of generating too short headlines. While the
      * gold headlines have an average length of 9.7 words, the headlines gener-
        ated by the t2t method consist of 7.7 words on average
  * On the out-of-domain test set, the results of the t2t method are lower
    relative to the performance of other algorithms
    * first baseline is the highest for ROUGE RAW -1 and ROUGE RAW -2 metrics,
      while being only slightly behind the best ROUGE RAW -L F-score, which was
      achieved by t2t
* full texts into headlines are presented in Table 5
  * Both supervised algorithms clf-rl and t2t demonstrate lower F-score
    performance than first and the unsupervised textrank
  * hE, the precision of t2t approach still surpasses all other methods in two
    ROUGE variants
  * t2t deteriorates on the out-of-domain test set, while other methods are
    mostly unaffected
* text→abstract summarization is evaluated in Table 6, yielding
  * results similar to the previous setup. The
  * first baseline is performing the best, followed by the textrank approach
  * t2t abstractive summarization is the lowest, being inferior even to the rand
* In order to compare quality of documents from different websites, we also
  analyse the first baseline in the abstract→headline setup for every website
  separately. The results are presented in Table 7. The ROUGE RAW metric shows
  * all websites provide headlines of similar quality, except ceskenoviny.cz ,
    whose headlines are much more similar to the first sentences of the abstract

## 6.4. Examples
