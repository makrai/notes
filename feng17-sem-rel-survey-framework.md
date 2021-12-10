The SOTA in semantic relatedness: a framework for comparison
Yue Feng, Ebrahim Bagheri, Faezeh Ensan, Jelena Jovanovic
The Knowledge Engineering Review 2017, page 1 of 30

# Abstract

* we review the SOTA in SR research through a hierarchical framework. The
  * three main aspects of SR approaches including the
    * resources they rely on, the
    * computational methods applied on the resources for developing a rel metric
    * evaluation models that are used for measuring their effectiveness
* We have selected 14 representative SR approaches to be analyzed using our
* we provide guidelines for researchers and practitioners on how to select the
  most relevant SR method for their purpose.  Finally, based on the comparative

# 1 Intro

* applications: semantic information retrieval, keyword extraction and summ
* Information retrieval techniques have particular interest in SR measures as
* domains such as biomedical informatics and geoinformatics have also benefited
  * bioentities (Pedersen+ 2007) and geographic concepts (Hecht+ 2012), resp
* we are primarily concerned with two main challenges in this area:
  * challenges related to the underlying knowledge resources that can provide
    insight into SR of words, and
  * challenges related to the formalization of the relatedness measures. In
* we cover the main models and techniques that have been proposed to address
  * propose a taxonomic framework for comparing the more widely known work in
    this domain with specific focus on the above two aspects.  The framework is
    presented by considering the basic features of SR methods including:
  * the knowledge resources that an SR method adopts;
  * the computational methods that an SR method is based on; and
  * the evaluation method that is used to assess the suitability of an SR
    method, including the used data sets and evaluation metrics. The framework

# 2 criteria used for selecting the methods studied in this paper; each method

# 3 the proposed framework, and its dimensions and sub-dimensions

## 3.3 16

# 4 compares the selected methods and discusses the strengths and weakness

# 5 a meta-analysis of the findings in this paper; areas for future research 23

* two distinct approaches for calculating semantic similarity emerge: based on
  * latent relation hypothesis, and
  * content structure
* latent relation
  * relatedness is derived from and measured based on the words’ context
  * knowledge resources are primarily employed to build context for every word
  * primary objective: similarity and relatedness between words could be
    determined based on the similarity of their contexts
  * Context is predominantly defined as the words or terms that
    * surround the word of interest or that are used to define it
  * many different types of textual corpora have been used to build context
    * e.g.  Wikipedia articles, Web pages, search snippets, WordNet glosses
  * e.g. ESA (Gabrilovich & Markovitch, 2007)
  * can be sensitive to the role and impact of noise
  * information theoretic and time series-based methods for identifying noise
    from textual corporal (Weng & Lee, 2011)
    * already proposed topic and event detection from social network content,
    * can be applied to the knowledge resources used in the context of SR
  * domain specificity of the corpora and its
    impact on the dominant senses of the words
    * e.g. would the SR models learnt from Wikipedia content be applicable for
      similarity measurement on online News content from CNN Politics?
  * temporality when context is being constructed for words
    * i.e. evolution of the word contexts over time
    * Most of the work assume that the knowledge resource is stable and constant
      (except a few such as Radinsky+ 2011)
    * there is need for methods that are able to automatically determine the
      length of the time windows between which the semantics of the words shift
      through time
    * the time window for each word might be different
* second category: extract explicit structure from knowledge resources
  * e.g. links between Web pages, Wikipedia category hierarchy and WordNet hypnm
  * structure extraction approaches e.g
    * tree traversal and path finding techniques, graph analysis techniques and
      network mining
  * ?integrate structures extracted from WordNet, for example, hypernym rel,
    with the graph extracted from Wikipedia category hierarchy
    * higher coverage and accuracy
* integrating structural and context-based information
  * very few reported works that have explored this possibility systematically
  * e.g. in user interest modeling on microblogging platforms such as Twitter,
    * users’ social network structure combined with their posted content, for
      identifying user interests, quite effective (Zarrinkalam+ 2016)
* the role of the communication medium on determining the SR of words
  * Feng+ (2015): the semantics of words can substantially shift
    * e.g. _movie_ and _popcorn_ were highly related on Twitter but rated very
      low within the WS-353 gold standard

# 6 concludes
