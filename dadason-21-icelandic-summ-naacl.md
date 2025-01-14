IceSum: An Icelandic Text Summarization Corpus
Jón Daðason, Hrafn Loftsson, Salome Sigurðardóttir, Þorsteinn Björnsson
NAACL 2021 Student Research Workshop

 We release the corpus and the models with an open license

# Abstract

* IceSum, the first Icelandic corpus annotated with human-generated summaries
  * 1,000 online news articles and their extractive summaries
* We train and evaluate several neural network-based models on this dataset,
  comparing them against a selection of baseline methods. We find that an
  * encoder-decoder model with a sequence-to-sequence based extractor obtains
    the best results, outperforming all baseline methods. Furthermore,
* we evaluate how the size of the training corpus affects the quality

# 1 Introduction

* Automatic Text Summarization (ATS) systems, which provide readers with a
  * two main types (Gambhir and Gupta, 2017).  Based on the
    * number of source documents used to generate a given summary,
      i.e. either single-document or multi-document summarization
    * method used to generate the individual sentences in the summary, i.e,
      either extractive or abstractive summarization
      * Extractive: typically sentence-level, grammatically correct and fluent
      * abstractive summaries may introduce grammatical errors and contain
        statements that are inconsistent with the source text
* ATS for Icelandic has been limited to simple statistical methods
  (Christiansen, 2014) (described in Section 2). Furthermore, to our best
  * no ATS system is currently in use in companies or institutions in Iceland
* we present IceSum, a corpus of 1,000 Icelandic news articles that can be used
  * evaluating more recently proposed methods for extractive summarization,
  * The best performing model obtains a ROUGE2 1 (Lin, 2004) recall score of
    71.06
  * the first ATS model for Icelandic which obtains a better result than the
    Lead baseline method, which obtains a score of 69.14
* Lemmatization is often employed as a preprocessing step in Icelandic
  * beneficial for tasks such as
    * named entity recognition (Ingólfsdóttir+ 2020),
    * information extraction (Steingrímsson+ 2020) and
    * machine translation (Barkarson and Steingrímsson, 2019),
  * ext summ
    * previous experiments with non-neural network-based models show no improvm
    * the same holds true for neural network-based models
* relationship between the size of the training set and the quality of the
  * increasing the size of the corpus would likely lead to significantly better
    results. We release the corpus 2 and the models 3 with an open license

# 2 related work in Section 2 and present

# 3 the summarization corpus in Section 3. The

# 4 methods are presented in Section 4 and the

# 5 Experimental Setup

* we report results obtained on the test set for the model that achieved the
  highest ROUGE-2 recall score on the validation set
* We also investigated whether lemmatizing the text improves the quality of the
  * tools, method
    * first ABLTagger (Steingrímsson+ 2019) to assign part-of-speech tags to
    * then Nefnir (Ingólfsdóttir+ 2019) to lemmatize the text.  The Tokenizer 6
      library was used to tokenize the source text. For models trained using
      nnsum, we use GloVe embeddings trained on a lemmatized version of the IGC
* We report ROUGE recall scores, calculated without stemming

# 6 results

# 7 conclude
