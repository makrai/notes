Alexander Panchenko, Eugen Ruppert, Stefano Faralli, S Ponzetto, Chris Biemann
Building a WebScale Dependency-Parsed Corpus from Common Crawl

* The corpus and the software tools are available online
  https://www.inf.uni-hamburg.de/en/inst/ab/lt/resources/data/depcc.html
* [plus] the corpus can be directly used without the need to download it on
  the Amazon S3 distributed file system, cf. Section 3.7
  https://commoncrawl.s3.amazonaws.com/contrib/depcc/CCMAIN-2016-07/index.html
* The software tools used to build the corpus are distributed under an open lic
* The terms of use of the corpus are described in Section 4

# Abstract

* We present DepCC, the largest linguistically analyzed corpus in English
  * 365 million documents, 252 B tokens and 7.5 B of named entity
  * 14.3 B sentences from a webscale crawl of the Common Crawl project
  * provenance information [i.e.  the place of origin]
* We demonstrate the utility of this corpus on ... the SimVerb3500 dataset

# 1 Introduction

* commonly used text collections in the NLP community, such as BNC or Wikipedia
  * in the range 0.1–3 B tokens
* syntactic ngrams  was built from the 345 B token corpus of the Google
  Books project (Goldberg and Orwant, 2013). 3
  * access to books is often restricted, which limits use
* Web for construction of text corpora
  * PukWaC (Baroni+ 2009) (2 B of tokens) and
  * ENCOW16 (Schäfer, 2015) (17 B of tokens)
* web crawl dumps
  * at least one order of magnitude [bigg]er
  * e.g. ClueWeb 4 and CommonCrawl 5
  * problematic for researchers [becaues]
    1. the documents are not preprocessed, containing e.g. HTML markup
    1. big data infrastructure and skills are required
    1. (near)duplicates of pages disbalance the corpus
    1. documents are not linguistically analyzed, ... only shallow models
* The Common Crawl project regularly produces webscale crawls
  * as of October 2017, the estimated number of pages on the Web is 47 billion
  * the corresponding crawl contains over 3 B pages
  * the indexed Web contains about 5 B pages

# 2 Related Work

## 2.2.  Large Scale Text Collections

* WaCkypedia (Baroni+ 2009) is a parsed version of English Wikipedia as of
  * POS tagged with the TreeTagger (Schmid, 1994) and
  * dependency parsed with the Malt parser (Nivre+ 2007)
  * Similarly to our corpus, the results are presented in the CoNLL format. 9
* The 2017 version of W IKIPEDIA contains three times more tokens, compared to
  * no distributions of linguistically
* PukWaC is a dependencyparsed version of the UKWaC corpus (Baroni+ 2009),
  * processed in the same way as the WaCKYPEDIA corpus
* GigaWord (Parker+ 2011) is a large corpus of newswire, which is
  * not dependency parsed. The
* ClueWeb 12 is a corpus similar to the raw Common Crawl corpus: it contains
  * archives of linguistically unprocessed web pages.  The authors provide
  * descriptive statistics of the dataset regarding
    language distribution, formats of the documents, etc
* GoogleSyntacticNgrams corpus (Goldberg and Orwant, 2013) [see above]
* ENCOW16 (Schäfer, 2015) is a large-scale web corpus, which is arguably
  * the most similar one to DepCC
  * The authors also rely on the Malt parser and
  * named entity tagging. However, this corpus contains
  * roughly 15 times less tokens than DepCC

## 2.3 Common Crawl as a Corpus

* Kolias+ (2014) present an exploratory study of one of the early versions of
  the Common Crawl . The authors provide various descriptive statistics
* Finnish Parsebank consisting of 1.5 B tokens in 116 million sentences
  * Common Crawl was used construct [it]
  * (Laippala and Ginter, 2014). The texts were morphologically and
    syntactically analyzed. In addition, distributional vector space
  * available under an open license
* GloVe ... authors distribute two models trained on the English part of CC

# 3 Building a Web-Scale Dependency-Parsed Corpus in English from Common Crawl 3

* Figure 1 shows how a linguistically analyzed corpus is built from the Web
  1. web pages are downloaded by the web crawler of CommonCrawl, called CCBot
  2. preprocessing, involving elimination of duplicates and language detection,
     is performed using the C4Corpus tool
  3. we perform linguistic analysis of the corpus ... in the CoNLL format (3.4)

## 3.1 Input Web Crawl: the Common Crawl

The DepCC corpus is based on the crawl of February 2016 11 containing more than
1.73 B URLs. The CommonCrawl URL index for this crawl is available online
12 , while the original files are located in the “commoncrawl” bucket on the S3
distributed file system. 13 As summarized in Table 2, the total size of the
compressed HTML WARC files is about 30 Tb

## 3.2. Preprocessing of Texts: the C4Corpus Tool

* The raw corpus was processed with the C4Corpus tool (Habernal+ 2016)
  and is available on the distributed cloud-based file system Amazon S3. 14
* C4Corpus performs preprocessing of the raw corpus, in five phases:
  1. Language detection, license detection, and
    removal of boilerplate page elements, such as menus
  2. “Exact match” document de-duplication
  3. Detecting near duplicate documents
  4. Removing near duplicate documents
  5. Grouping the final corpus by language and license

The resulting output is a gzip-compressed corpus with a total size of 0.83 Tb
(cf. Table 2). For further processing, we selected only English texts with the
total size of 0.68 Tb, based on the language detection in the first phase. Note
that we use all texts written in English, not only those published under the
CC-BY license

## 3.3.  Linguistic Analysis of Texts

* four stages presented in Figure 1 and is
* implemented using the Apache Hadoop framework 15 for parallelization and the
  Apache UIMA framework 16 for integration of linguistic analysers via the
  DKPro Core library (Eckart de Castilho and Gurevych, 2014)

### 3.3.1. POS Tagging and Lemmatization

For morphological analysis of texts, we used OpenNLP part-of-speech tagger and
Stanford lemmatizer

### 3.3.2. Named Entity Recognition

* we use the Stanford NER tool (Finkel+ 2005). 18 Overall,
* 7.48 B occurrences of named entities were identified in the 251.92 B tokens

### 3.3.3. Dependency Parsing

* Unfortunately, the most accurate parsers,
  * e.g. Stanford parser based on the PCFG grammar (De Marneffe+ 2006),
  * take up to 60 minutes to process 1 Mb of text on a single core: prohibitive
* We tested all versions of the Stanford,
  Malt (Hall+ 2009), and Mate (Ballesteros and Bohnet, 2014) parsers for
  English available via the DKPro Core framework. To dependency-parse texts,
* we selected the Malt parser, due to an optimal ratio of efficiency and effect
  * used in the past for ... linguistically analyzed web corpora, such as
    PukWaC (Baroni+ 2009) and ENCOW16 (Schäfer, 2015)
  * we used the stack model based on the projective transition system with the
* even the neural-based version of th[e Stanford] parser is substantially slow
* performance of the Malt parser is only about 1.5–2.5 points below the
  neural-based Stanford parser
* The text downloaded from the Web has highly variable quality due to the
  * inherent nature of user-generated content, but also unavoidable
    pre-processing errors, e.g. during the cleanup of incomplete HTML markup
  * To avoid crashes, we filter all sentences longer than 50 tokens
    * hardly any well-formed sentences of 50 tokens or more in this corpus

### 3.3.4. Collapsing of Syntactic Dependencies

* Collapsed and enhanced dependencies,
  e. g. the Stanford Dependencies (De Marneffe+ 2006) 20 can be useful
  * more compact syntactic trees of a sentence, compared to the original de-
* To compensate the lack of the dependency enhancement in Malt,
  we use the system of (Ruppert+ 2015) 21 to perform collapsing and enhancing
  * authors of the toolkit shown that
    * improves quality of ... distributional thesauri based on sparse synt feat
    * [to] Stanford enhanced dependencies, comparable. The advantage of using
    * original and enhanced versions are saved respectively into the columns
      “DEPREL” and “DEPS” as illustrated in Table 3

## 3.4 Format of the Output Documents 4

## 3.5 Computational Settings

## 3.6. Running Time

## 3.7 Using the Corpus in the Amazon Cloud

## 3.8. Index of the Corpus

# 4 Terms of Use

* you need to make sure to respect the Terms of Use of the original CC dataset

# 5 Evaluation: Verb Similarity Task

* task structurally [the same as] SimLex-999 (Hill+ 2015)
* We chose this task since verb meaning is largely defined by the meaning of
  its arguments (Fillmore, 1982), therefore
  dependency-based features seem relevant

## 5.1. Datasets: SimVerb3500 and SimLex222

* SimVerb3500 (Gerz+ 2016). The dataset is composed of
  * challenging dataset for verb relatedness
  * 3500 pairs of verbs and is split into the
  * train and test parts, called respectively SimVerb3000 and SimVerb500. In
* SimLex222, which is the verb part of SimLex999 dataset (Hill+ 2015)

## 5.2. A Distributional Model for Verb Similarity

* We compute syntactic count-based distributional representations of words
  using the JoBimText framework (Biemann and Riedl, 2013). 30 The sparse
  vectors are weighted using the LMI weighting schema and converted to unit
  length
* [parameters] In our experiments, we varied also the
  * maximum number of salient features per word (fpw) and words per feature
  * each row and column of the sparse term-feature matrix is pruned such that
    at most wpf nonzero elements in a row and fpw elements in a column are !=0

## 5.3. Discussion of Results

Table 4 presents results of the experiments

### 5.3.1. Baselines

* current stateof-art result on this dataset:
  * Count based SVD system is from (Baroni+ 2014)
  In the original paper, two corpora were used
    * “8B” is a 8 B tokens corpus produced by a script in the word2vec
      toolkit, which gathers the texts from various sources (Mikolov+ 2013) and
    * “PolyglotWikipedia” is the English Polyglot Wikipedia corpus consisting
      of 1.9 B tokens (AlRfou+ 2013)
* our goal is to show the impact of the large corpora on performance and
  not to present a new model for verb similarity

### 5.3.2. Impact of the Corpora on Performance

The bottom part of the table presents the distributional model described in
Section 5.2. trained on the corpora of various sizes. Note, that the
preprocessing steps for each corpus are exactly the same as for the DepCC
corpus

* the model [trained] on the dependency-based features extracted from DepCC
  substantially outperforms also the prior SOTA, e.g. (Baroni+ 2014) and
  (Gerz+ 2016), on the SimVerb dataset,
  through the sheer [puszta] size of the input corpus (Banko and Brill, 2001)

### 5.3.3. Differences in Performance for Test/Train Sets

* the absolute performance on the test part (SimVerb500) is higher than the
  absolute performance on the train part (SimVerb300) for almost all models,
  * We [don't know why]

# 6 Conclusion

* The corpus can be used in various contexts
  * syntaxbased word embeddings (Levy and Goldberg, 2014)
  * unsupervised induction of word senses (Biemann+ 2018) and
  * frame structures (Kawahara+ 2014)
* future work is ... multiple languages
