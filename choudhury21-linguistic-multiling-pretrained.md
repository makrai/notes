How Linguistically Fair Are Multilingual Pre-Trained Language Models?
M Choudhury, A Deshpande
AAAI 2021

# Abstract

* Massively multilingual pre-trained language models, e.g. mBERT and XLM-RoBERTa
* crosslingual zero-shot transfer of NLP tasks.  This is especially promising
  * a large number of languages have no or very little labeled data for
  * substantially improved performance on low resource languages
    without any significant degradation of accuracy for high resource langs
* lacking a nuanced and thorough comparison of benefits across langs and tasks
  A related and important question that has received little attention is
* how to choose from a set of models, when no single model significantly
  outperforms the others on all tasks and languages. As we discuss in this
  * this is often the case, and the choices are usually made without a clear
    articulation of reasons or underlying fairness assumptions. In this work,
  * we scrutinize the choices made in previous work, and
  * we propose different strategies for fair and efficient model selection
    * based on the principles of fairness in economics and social choice theory
  * we emphasize Rawlsian fairness, which provides an appropriate framework for
    * fair (with respect to languages, or tasks, or both) choices while

# 1 Intro

* massively Multilingual pre-trained language models (MultiLMs)
  * pre-trained on unlabeled corpora of a large number (typically 100+) of langs
  * Multilingual BERT (mBERT, Devlin+ 2019)
  * XLM-RoBERTa (XLM-R, Conneau+ 2020)
  * Massively Multilingual Translation Encoder (MMTE, Arivazhagan+ 2019)
  * Unicoder (Liang+ 2020)
* crosslingual zero-shot transfer capabilities (Pires, Schlinger, and Garrette
  2019; Wu and Dredze 2020) have revolutionized our approach
* `A` performs better than B on 10 languages, B performs better than A on 3
  languages, and on the remaining two, the models perform equally well. Should
* The problem has great practical significance for two reasons. First, before
  * average performance over the set of tested languages has been adopted by
    * important factors such as 
    * the set of languages and tasks the model is expected to work well on, and
      the amount of data across languages that the MultiLM was pre-trained and
      fine-tuned on (Hu+ 2020; Wu and Dredze 2020; Lauscher+  2020). More
  * one of the primary advantages as well as the reason behind the popularity of
    MultiLMs is their excellent crosslingual zero-shot transfer ability
    * Wu and Dredze (2020) point out, “top high resource languages are slightly
      hurt by massively multilingual joint training”; yet these are preferred
      because they offer a solution for low-resource languages
    * equal or equitable accuracy of MultiLMs across languages and tasks has
      been one of the critical points of scrutiny in the recent times (Hu+ 2020)
    * If this is the central tenet behind the conception and construction of
      MultiLMs, then selection problem (MMSP) must be resolved in a manner that
      conforms to this normative principle of “fairness” or “distributive
      justice” across languages 
* discourse on fairness in machine learning, ethics, social choice theory,
  economics and decision theory, we provide several possible resolution of the
* principles of distributive justice entailed by the choices made by the
  researchers while resolving the MMSP, but not stated as such. As we shall see,
  * most of the work, whenever possible, follow the Pareto-efficiency principle,
    i.e., choose the model which does as good or better than all others on all
    languages that were tested for; 
  * otherwise, a utilitarian approach is adopted, where a simple unweighted
    average performance across languages is used as the selection criterion. We
* a practical trade-off between the egalitarian and utilitarian ideologies could
  be the prioritarian or Rawlsian principle (Rawls 1999)
  * one should select the model which maximizes the minimum performance over all
    languages. Rawlsian fairness is
  * based on the principle of least difference, and proposes to narrow the gap
    between unequal accuracies or utilities, instead of equalizing them
  * Rawlsian fairness based resolution of MMSP is also the robust utilitarian
    choice under an adversarial assumption, and it 
  * also ensures a progressively more egalitarian distribution under the
    assumption that language resources for all languages will grow over time, 
* researchers have critiqued the utilitarian approach to MMSP
  (Wu and Dredze 2020; Hu+ 2020); the objective of those studies have been to
  * in most cases a single Pareto-efficient model does not exist. These
    critiques, however, do not propose any mechanism to resolve the MMSP under
  * they suggest that the resolution of MMSP should be deferred till we have a
    clearer understanding of the model performances
* it is unlikely that in the near future we will have a MultiLM that is
  Pareto-efficient across languages and tasks. 
  * it is useful and important to resolve the MMSP under partial knowledge in
* discourse on fairness in
  * ML (Mehrabi+ 2019; Barocas, Hardt, and Narayanan 2017; Leben 2020), and more
  * NLP (Blodgett+ 2020), argue for individual and group fairness (Binns 2018)
* we: distributive justice when languages, instead of individuals, are viewed as
  entities
  * a language can be equated to a group of individuals, as we discuss in Sec 4,
    there are important philosophical and practical distinctions between these
    notions, such that they merit independent treatments

# 2, we formally introduce the MMSP and discuss its potential resolutions

under various normative principles of distributive justice. This section will
* introduce the reader to the basic concepts and some well established results
  of distributive justice in social choice theory

# 3 reinterprets the model selection decisions taken in the recent papers. We

# 4 philosophical, technical and practical aspects of MMSP and its resolution

# 5 Practical Recommendations

### Stating the Fairness and Efficiency Assumptions: We recommend that all

### Utilitarian Resolution to MMSP: In case the researcher has a strong reason

* in favor of the model that Pareto dominates all other models
* When no model Pareto dominates, the model with the highest (weighted) average
  performance can be chosen
* If there is a tie (defined as exact or sufficiently close average
  performances), they could invoke the prioritarian principle to resolve the tie
  in favor of the model that maximizes the minimum accuracy

### Prioritarian (aka Rawlsian) Resolution to MMSP: In case the researcher

* use the max-min, or more generally, the lex-min objective,
  i.e., maximize the minimum accuracy, and
* if two models that maximize the minimum accuracy have the same minimum
  accuracy, then maximize the second minimum accuracy, and so on

### Considering Outlier languages that have remarkably high or low performances

* should be included or excluded before applying the fairness principles – a
  decision that can be made based on practical considerations such as how
  reliable is the test-set of a particular language

### Alternative Leader-boards

* Current leader-boards for MultiLMs, e.g.  https://sites.research.google/xtreme
  rank the models based on the average performance. We recommend alternative
