OpusFilter: A Configurable Parallel Corpus Filtering Toolbox
Mikko Aulamo, Sami Virpioja, Jörg Tiedemann
ACL 2020

# Abstract

* components based on
  heuristic filters, language identification libraries, character-based language
  models, and word alignment tools, and it can easily be extended with custom
* Bitext segments can be ranked according to their quality or domain match using
  single features or a logistic regression model that can be trained without
  manually labeled training data. We demonstrate the effectiveness of OpusFilter
  on the example of a Finnish-English news translation task based on noisy
  web-crawled training data. Applying our tool leads to improved translation
  quality while significantly reducing the size of the training data, also
  clearly outperforming an alternative ranking given in the crawled data set.
  Furthermore, we show the ability of OpusFilter to perform data selection for
  domain adaptation.

# 1 Introduction

* Khayrallah and Koehn (2018) show that noisy training data is often more
  harmful for neural translation models than statistical translation models.
* WMT now feature shared tasks on data cleaning and ranking (Koehn+ 2018, 2019).
* In contrast to tools
  such as bicleaner (Sánchez-Cartagena+ 2018) and Zipporah (Xu and Koehn, 2017),
  that implement a single method for parallel corpus filtering, OpusFilter is

# 4 Conclu

* future work: additional filters and classification options. One option could
  * sentence embedding based filtering (Guo+ 2018).  Additionally, we would like
  * different scenarios and for other language pairs.  Especially interesting
    * low-resource settings and various levels of noise in the original data.
    * domain adaptation and data selection should be further explored.
