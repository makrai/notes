Comparing ML Learning and Deep Learning Approaches on NLP Tasks for Italian
Bernardo Magnini, Alberto Lavelli, Simone Magnolini
LREC 2020, pages 2110–2119 Marseille, 11–16 May 2020

pretrained deep: only mBERT?

# Abstract

* datasets (e.g., from the Evalita shared tasks) on
  * two sequence tagging tasks (i.e., named entities recognition and nominal
    entities recognition) and
  * four classification tasks (i.e., lexical relations among words, semantic
    relations among sentences, sentiment analysis and text classification)
* a single model for all the other languages, including Italian
* We: experiments using available datasets (e.g., from the Evalita shared tasks)
  * two sequence tagging tasks (i.e., NER and nominal entity recognition) and
  * four classification tasks (i.e.,
    * lexical relations among words
    * semantic relations among sentences
    * sentiment analysis
    * text classification). We
* deep learning approaches ?outperform traditional machine learning algorithms
  * yes in sequence tagging, while
  * for classification tasks, still competitive
    * heavily rely on semantics approaches based on feature engineering are . We
* similar analysis could be carried out for other languages

# Introduction

* tasks related to semantic analysis of text, the
  * limited availability of annotated data, typically
    * requiring specialized human effort, has slowed the adoption of neural
* motivation: benchmarks encompassing a variety of tasks in order to favour
  models that share general linguistic knowledge across tasks
  * GLUE, the General Language Understanding Evaluation (Wang+ 2018), a
* from the conclusion
  * BERT outperforms previous approaches both for named entities, textual
    entailment (RTE dataset) and text classification on clinical reports;
  * on nominal entity recognition, a task much more complex than NER, we have
    shown that the NeuroNLP2 model can be extended with terms contained in a
    gazetteer, achieving state-of-the-art performance;
  * on the three datasets for sentiment analysis on tweets traditional machine
    learning outperforms BERT, indicating that more accurate fine tuning is
    still necessary;
  * on lexical relations (i.e., compatibility among words)
    a simple BERT fine tuning achieves results comparable to those obtained by
    more complex architectures using linguistic features (e.g., the semantic
    head of the term)

# 2 basic notions about deep learning for NLP that will be used

# 3 named entity recognition and

# 4 nominal entity recognition

# 4 lexical relations,

# 5 textual entailment,

# 6 sentiment analysis and

# 7 text classification

# 9 discusses our achievement and proposes work for the future

