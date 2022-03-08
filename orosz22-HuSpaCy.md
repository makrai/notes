HuSpaCy: an industrial-strength Hungarian natural language processing toolkit
György Orosz, Zsolt Szántó, Péter Berkecz, Gergő Szabó, Richárd Farkas
MSZNY 2022 arXiv:2201.01956v2 [cs.CL] 10 Jan 2022

# Abstract

* a couple of open-source language processing pipelines for Hungarian,
* hE none of them satisfies the requirements of today’s NLP applications. A
  * close to SOTA lemmatization, morphosyntactic analysis, entity
    recognition and word embeddings.
  * Industrial text processing applications have to satisfy
    non-functional software quality requirements,
    * Responsiveness, Usability, Security, Portability, etc
  * frameworks supporting multiple languages are more and more favored. This
* we introduce HuSpaCy, an industryready Hungarian language processing toolkit.
  * components for the most important basic linguistic analysis tasks.  It is
  * open-source and is available under a permissive license. Our system is
  * easily usable, fast yet accurate application.
* Experiments confirm that HuSpaCy has
  high accuracy while maintaining resource-efficient prediction capabilities.

# 1 Intro

* built upon spaCy’s NLP components, which means that it is
  * fast, has a rich ecosystem of NLP applications and extensions, comes with
    extensive documentation and a well-known API
  * https://spacy.io/

# 2 Background

* overview of the underlying models

## 2.1 Demands for a language processing pipeline in the 2020s

* Starting from the release of the Penn Treebank (Marcus+ 1993) in 1992, the
  * language processing tools for particular tasks, like tokenization,
    part-of-speech tagging etc
  * usually run in a sequence and form a pipeline.
  * In the 2000s, many language-specific corpora and treebanks were developed
  * Hungarian was among the best supported languages (Simon+ 2012)
* In the early 2010s,
  Universal PoS (Petrov+ 2012) and Universal Dependency (Nivre+ 2016) labeling
  * goals of ”cross-linguistically consistent treebank annotation for many
    languages” and ”facilitating multilingual parser development, cross-lingual
    learning, and parsing research from a language typology perspective.” Many
  * pipelines changed their representations to these universal annot schema
    but most of them stayed in their own software architecture.
* Industrial NLP applications are frequently multi-lingual, i.e.  the same NLP
  task has to be solved in several languages
  * demand for standardization over languages is high in commercial partners.
  * companies prefer multilingual software frameworks and make business
    decisions to support Hungarian, based on the availability in multilingual
    frameworks.

* neural language models (NLM) and the applications based on them (Young+ 2018)
  * Academic research has introduced various deep learning methods
    outperforming previous SOTA in many areas. Such systems
  * usually employ a single neural network providing end-to-end NLP solutions
    without the need for specific pipeline steps.

* pre-trained multilingual NLMs are becoming available which provide
  standardized solutions for many languages. Regardless of the multilingual-
  ity and the high accuracy of deep learning solutions, a lot of
* critiques have been raised by real-world industrial NLP projects recently.

  * deep learning solutions often require far more computational resources
    compared to classic solutions. They
  * heavily rely on GPU acceleration along with significant memory consumption.
  * running costs are usually 10 or even 100 times higher than that of
  * questionable commercial return of the accuracy gain. We also note that
  * modern NLP pipelines consist of static word embedding representations and
    use deep learning for individual pipeline steps as well, hence, the
    advantage of large neural end-to-end systems might be very small
* industrial demand for human-readable output
  * Most of the industrial applications are fully or partially rule-based
    * not enough training data for a pure machine learning solution 
      available. And there is no free lunch! Each and every realworld
      application has its own requirements. Rule-based components of these
      real-world applications require language-specific representations which
      can be used for defining rules. Such human-readable representations
      consist of tokens, lemmata, part-of-speech tags, morphological features,
      dependency parse trees and named entities. Static word embeddings are
      often integral parts of industrial applications, as many practical
      algorithms (e.g.  semantic textual similarity methods) heavily rely on
      them.

## 2.2 Requirements for industrial-strength language processing
pipelines

* tackle the most important text preprocessing tasks including
  tokenization, sentence splitting, PoS tagging, lemmatization, dependency
  parsing, named entity recognition and word embedding representation.
* accurate enough for real world scenarios while it should be
  resource conscious at the same time. Furthermore, an industry focused system
* developer friendly, customizable and easy-to-integrate, as NLP modules are
  integral parts of a larger system in practical applications.
* solid documentation should be available as well. Moreover, it is often
* the underlying machine learning model(s) should be reproducible and
  controllable.
* usually multilingual, thus
  * compatibility with international annotation standards (Petrov+ 2012; Nivre+
    2016; de Marneffe+ 2021; McCarthy+ 2020) is necessary. Moreover, it is also
  * easily usable through a well-known multilingual toolkit.

## 2.3 The landscape of Hungarian language processing pipelines

* Up until recently,
  only a few text processing applications were focused on meeting these criter
  even for English
* spaCy (Honnibal, 2015) was one one of the first tools targeting industrial
  applications mainly. Its authors created an unprecedented tool which offers
  near SOTA accuracy while being an order of magnitude faster than other tools
  * intuitive API, has detailed documentation, and also
    fits well into the Python ecosystem of machine learning tools. What is
  * easily deployable and offers built-in syntax and entity visualization tools
* The landscape of the Hungarian text processing systems is
  similar to that of English before the ”industrial NLP revolution”. There are
  * a number of standalone text analysis tools 2 (Simon+ 2012) capable of
    performing individual text processing tasks, but they often do not play
    well with each other.
* only a few attempts at providing industrial Hungarian pipelines. One of them
  * magyarlanc (Zsibrita+ 2013) which is
  * a Java based system consisting of SOTA pipeline steps, which were adapted
    and extended from various libraries.
  * designed to serve industrial applications, what is more, a lot of effort
    has been made on software quality, speed, memory efficiency and
    customizability
  * tokenization, sentence boundary detection (SBD), PoS tagging, lemmatization
    and dependency parsing, but lacks entity recognition and word embeddings.
  * It uses the version 1 of the Universal Dependency (UD) annotations.
  * still used in real world commercial applications, it is
  * hW, not maintained for years.
* emtsv (Simon+ 2020; Indig+ 2019a,b
  * and its predecessor e-magyar (Váradi+ 2018; Váradi+ 2017)) is a result of
  * a multi-institute collaboration project aiming to
    integrate existing NLP toolkits into a single application.  Unfortunately,
  * neither computational efficiency nor developer ergonomics were amongst the
    main goals of the project. Although emtsv
  * can yield Universal morphosyntactic annotations through conversion, it is
    rather inaccurate.  What is more, it is
  * not designed to efficiently deal with word vectors, therefore no such
    facility is available in the system.
* contenders [versenyző] of the recent multilingual CoNLL text parsing
  competitions (Zeman+ 2017, 2018). There were
  * numerous submissions, but
  * Stanza (Qi+ 2020) and UD-Pipe (Straka, 2018) are by far the most popular
    freely available off-the-shelf applications. These tools provide
    morphological and syntactical analysis of raw texts for many languages, but
    lack entity annotations
    * Accuracy scores vary across tools, but all of them are limited by the
      small size of the publicly available UD annotated gold standard corpora.
* Table 1 summarizes the landscape of the most important Hungarian NLP pipeline
  * how they meet the requirements of today’s NLP applications. We must note
  * emtsv does not have any restriction for using it in commercial
    applications, although some of its most important components have very
    restrictive licenses (e.g. emMorph). All in all, we can say that
  * none of them is easily applicable in industrial settings.
* HuSpaCy, a new industry-ready Hungarian NLP toolkit
  * all the aforementioned basic text processing modules with high accuracy.
  * models are optimized to be light on memory consumption and CPU usage. The
  * open source and available under the permissive CC-BY-SA-4.0 license.  Our
  * built on top of spaCy’s infrastructure, thus
    * extensive documentation, debugging tools, an ergonomic API and a
      flourishing ecosystem are already provided.

# 3 evaluation is presented using various datasets 5

# 4 experiments

* high accuracy in many subtasks and resource-efficient prediction

# 5 Conclusion

* HuSpaCy, a new industry-ready Hungarian language processing pipeline that is
  open source and is freely available
  * can be easily used to solve practical text processing problems, our system
    builds on the solid foundations of an industrial NLP framework. We
    presented how our toolkit utilizes spaCy's underlying ML models to provide
    all the basic language analysis components. We performed various
  * high accuracy in many text processing tasks while using only moderate
    computation resources.  As results show, the
* accuracy of HuSpaCy's dependency parser needs further improvements. Further
  advancement opportunities lie in fine-tuning the NER model and in using a new
  neural lemmatizer.  In summary, this study described a new freely available
  tool which is suitable for real-world industrial applications.

