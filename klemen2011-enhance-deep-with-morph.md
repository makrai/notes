Enhancing deep neural networks with morphological information
Matej Klemen, Luka Krsnik, Marko Robnik-Šikonja
Cite as: 	arXiv:2011.12432 [cs.CL]

* We analyze the effect of adding morphological features to LSTM and BERT
  * three tasks
    * available in many less-resourced languages:
    * NER, dependency parsing (DP), comment filtering (CF).  We construct
      sensible baselines involving LSTM and BERT models, which we adjust by
* additional input in the form of part of speech (POS) tags and universal feats.
* eight morphologically-rich languages from different language families.
* mixed effects depending on the quality of features and the task. The features
  LSTM: improve NER and DP tasks, while they do not benefit CF task. For
  BERT: only improve the performance on DP when they are of high quality, while
  * in NER and CF datasets manually checked features are not available, we only
* from the conclusion:
  * Testing different variants of BERT shows that
    language specialised variants improve the performance on the DP task and the
    additional morphological information is beneficial, though less and less as
    we shift from multilingual towards monolingual models.

# 1 Intro

* Although previous research has shown that BERT already captures some
  information contained in the morphology [Pires+ 2019, Edmiston, 2020], our
  experiments involve several languages with rich morphology where neural
  networks could benefit from explicit morphological features.
* Specifically, we present methods which
  * combine BERT with separately encoded morphological properties:
    * universal part of speech tags (uPOS tags) and
    * universal features (grammatical gender, tense, conjugation, declination,)
  * three downstream tasks: named-entity recognition (NER), dependency parsing
    (DP), and comment filtering (CF). We perform similar
  * experiments on LSTM networks and compare the results for both architectures
  * Besides English, we analyze eight more languages: Croatian, Estonian,
    Finnish, Latvian, Lithuanian, Russian, Slovene and Swedish . The choice of
    * different language groups (Balto-Slavic, Germanic, and Uralic), for which
      we were able to obtain sufficient resources (datasets, embeddings, and
      corpora), due to their coverage in the EU EMBEDDIA project 1 .
* Our experiments show mixed effects depending on the task. Across the tasks
  1. they benefit the LSTM-based models even if the features are noisy and
  2. they benefit the BERT-based models only when the features are of high qual
    * suggesting that BERT models already capture the morphology of the
    * room for improvement: pre-training objectives that capture these propertis
* from the conclusion:
  * Since the release of BERT, several new pre-training objectives have been
    * syntactic and semantic phrase masking [Zhou+ 2020b] and
    * span masking [Joshi+ 2020]. In
    * further work:
      * apply these models to the DP task: test how well they capture morphology
      * additional tasks and languages, since the explicit morphological
        information does not seem to benefit them equally.

# 2 related work

* morphological information in machine learning, in particular neural networks,
* in the three evaluation tasks. In

# 3 datasets and their properties

# 4 the baseline models and models with additional morphological information

# 5 Eval of performance 7

# 6 summary and directions for further research 14
