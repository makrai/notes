Information Sciences Volume 509, January 2020, Pages 257-289
YAKE! Keyword extraction from single documents using multiple local features
V Mangaraviteeg, Arian Pasqualie, Alípio Jorgebe, Célia Nunescf, Adam Jatowtd

Open-Source: demo [yake.inesctec.pt] [9] and an app on Google Play, as well as
an API [yake.inesctec.pt/api] and a python package [github.com/LIAAD/yake]


# Abstract

* [from the conclusion]:
  * multi-lingual keyword extraction from individual documents that
  * can be used for summarization, clustering, indexing, and info visualization,
* YAKE! follows an unsupervised approach.  It does
  * not require a corpus or a dictionary ( corpus independent ), which means it
  * domain and language independent ). Our solution
  * scales to any document length in a linear manner in the number of candidate
    terms identified and is
  * term frequency-free , meaning that no conditions are set with respect to the
    minimum frequency or sentence frequency that a candidate keyword must have
* experiments:
  * ten popular SOTA unsupervised keyword extraction algorithms, under a large
  * documents belonging to twenty different datasets. It also offers
  * similar or superior effectiveness to SOTA supervised methods, without the
* Many documents do not come with descriptive terms, thus requiring humans to
* unsupervised approach. In this article, we describe YAKE!, a light-weight
* Our system does not depend on external corpora, text size, language, or domain

# Introduction

* supervised algorithms demand large manually annotated collections of documents
* we follow an unsupervised approach by proposing YAKE!, a lightweight
  * rely on local text features and statistical information, such as
    term co-occurrence and frequencies. The system we propose is largely robust
    to language or domain diversity and can easily scale to vast collections of
  * relies on individual documents makes it possible to operate independent of
* difficulty, including document length and structure. To tackle this problem,
* approach:
 1. first, we employ local statistic features that extract informative content
    within the text to calculate the importance of single terms;
 2. we apply a special n-gram construction model to form multi-word terms and
    employ a heuristic measure to determine their relevance. While the features
    may be heuristic, they are not arbitrarily chosen and are founded on
  * rather simple yet still able to achieve better results than SOTA methods
* contributions can be summarized as follows:
  1.  Unsupervised approach: we propose a light-weight unsupervised automatic
      keyword extraction algorithm which builds upon local text statistical
      features extracted from single documents; i.e., it does not require any
      training corpus
  1.  can retrieve keywords from a single document only,
      without the need to rely on external document collection statistics as IDF
  1.  not depends on NER or PoS taggers, just a static list of stopwords
  1.  can retrieve keywords containing interior stopwords
  1.  Scale: YAKE! scales to any document length
      linearly in the number of candidate terms identified
  1.  no minimum (sentence) frequency that a candidate keyword must have
* eval
  * we compare it against
    * ten unsupervised approaches and one supervised method
      * three statistical methods (TF.IDF [22], KP-Miner [13], and RAKE [42])
      * seven graph-based methods (TextRank [37], SingleRank [48], ExpandRank
        [48], TopicRank [4], TopicalPageRank [46], PositionRank [15], and
        MultipartiteRank [6]). The
    * supervised method is KEA [50].  We carry out our tests using
  * data: twenty different public document collections
    [github.com/LIAAD/KeywordExtractor-Datasets]: 110-PT-BN-KP [32],
    500N-KPCrowd-v1.1 [31], Inspec [21], Krapivin2009 [28], Nguyen2007 [38],
    PubMed, Schutz2008 [44], SemEval2010 [27], SemEval2017 [1], cacic [2],
    citeulike180 [34], fao30 [35], fao780 [35], pak2018, theses100, wicc [2],
    wiki20 [33], WWW [16], KDD [16], and WikiNews. The collections are in
    * 5 different languages: English, French, Spanish, Portuguese, and Polish)
  * the most comprehensive experimental evaluation ever performed in terms of
* This article is an extended version of Campos+ [10] (Best Short Paper
  Award at ECIR’18 conference), which briefly introduced our approach and
  preliminary evaluation results. In comparison with that paper, this article
  additionally does the following:
  * a high-level overview of the related research on keyword extraction;
  * reasoning for each of the steps of our methodology;
  * two additional distance similarity measures (Jaro Winkler and Sequence
    Matcher) to discard potential similar candidate keywords;
  * Evaluates the effectiveness of YAKE! under various settings (through a
    fine-tuning process that enables determination of the best deduplication and
    window parameters);
  * sixteen additional text collections 110-PT-BN-KP, Inspec, Krapivin2009,
    Nguyen2007, PubMed, SemEval2017, cacic, citeulike180, fao30, fao780,
    pak2018, theses100, wiki20, WWW, KDD, and WikiNews to further corroborate
  * new dataset for the Polish language;
  * Uses a random oversampling technique
    to evaluate YAKE! and SOTA methods from a single unified view;
  * Extends the experimentals with seven additional SOTA baseline approaches
    (Expand Rank, TopicRank, TopicalPageRank, PositionRank, MultipartiteRank,
    and KEA)
  * further metrics, including MAP@X, F1@X, P@X, R@X, R-Precision, Mean
    Reciprocal Rank, and Precision Recall curves
  * evaluation of interior stopwords (which has never been done before); and
  * Evaluates feature importance in order to understand the functioning of our

# 2 Related research

# 3 The architecture of YAKE!

# 4 Experimental setup 15

# 5 Results

# 6 Analysis on feature importance 26

## 6.1. characteristics of the features

* features: T Case , T Positional , TF Norm , T Rel , and T Sentence , and
* the distribution of the different features and
  their contribution to the single term weight

## 6.2 their contribution to the final keywords weight assignment S(kw) score

* an ablation study

## 6.3 keywords weight assignment over different text lengths, to understand

* whether different features behave differently depending on the size of the

## 6.4 interior stopwords

# 7 Summarizes the article and concludes with some final remarks

* future, we plan to develop a
  * supervised solution, which will be built using the statistical features
  * absent keywords based on word embeddings
