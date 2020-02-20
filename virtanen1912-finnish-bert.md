Virtanen, Kanerva, Ilo, Luoma, Luotolahti, Salakoski, Ginter, Pyysalo
Multilingual is not enough: BERT for Finnish
arXiv:1912.07076 [cs.CL]

We release the model and all related resources created for this study with open
https://turkunlp.org/finbert

# Abstract

* multilingual models that can be 
  fine-tuned to address tasks in a large number of different languages.
* [we compare] the multilingual BERT model on a range of [Finnish] tasks,
  ... with a new Finnish BERT model trained from scratch. The new
* language-specific model is shown to systematically and clearly outperform
  the multilingual.  While the 
* multilingual model largely fails to reach the performance of previously
  proposed methods, the 
* custom Finnish BERT model establishes new state-of-the-art results on all
  corpora for all reference tasks: 
  * part-of-speech tagging, named entity recognition, and dependency parsing.

# 1 Introduction

Transfer learning approaches using deep neural network architectures have
recently achieved substantial advances in 
  * sequence labeling tasks such POS tagging and NER (Peters+ 2018b) to
  * dependency parsing (Kondratyuk and Straka, 2019) and 
  * natural language understanding (NLU) tasks (Devlin+ 2018). While the great
* other languages, typically through multilingual models.  
* BERT model of Devlin+ (2018) has been particularly influential, establishing
  SOTA results for English for a range of NLU tasks and NER when it was
  released. For most languages, the only currently available BERT model is the
* multilingual model (M-BERT) trained on pooled data from 104 languages.  While
  * remarkable ability to generalize across languages (Pires+ 2019), several
  * monolingual BERT models, where available, can notably outperform M-BERT.
    * French BERT model (Martin+ 2019), the 
    * preliminary results accompanying the release of a German BERT model, and
    * comparing M-BERT with English and German monolingual (Rönnqvist+ 2019) 
* we [ apply] language-specific and multilingual BERT models to Finnish NLP. We
  * POS tagging, NER, and dependency parsing as well text classification tasks.
  * on most tasks the multilingual model does not represent an advance over
    previous state of the art, indicating that multilingual models may fail to
  * the custom Finnish BERT model systematically out-performs the multilingual
    as well as all previously proposed methods on all benchmark tasks

# 2 Related Work

* contextualized word embeddings was 
  * launched with ELMo (Peters+ 2018b), a context embedding method based on
    bidirectional LSTM networks.  Another notable example is the 
  * ULMFit model (Howard and Ruder, 2018), which specifically focuses on
    techniques for domain adaptation of LSTM-based language models.  
  * attention-based (as opposed to recurrent) Transformer architecture
    (Vaswani+ 2017), BERT was proposed by Devlin+ (2018), demonstrating
    superior performance on a broad array of tasks.  The 
    * BERT model has been further refined in a number of follow-up studies
      (e.g.  Liu+ 2019; Sanh+ 2019) and, presently, 
    * BERT and related models form the _de facto_ standard approach to
      embedding text segments as well as individual words in context.

  * computationally intensive task, requiring substantial resources. As of this
    * Unlike the previous generation of models, training BERT is a 
  * Google has released 
    * English and Chinese monolingual BERT models and the 
    * multilingual M-BERT model covering 104 languages. 1 Subsequently,
  * separate line
    * German 2 and French (Martin+ 2019). In a separate line of work, a
    * cross-lingual BERT model for 15 languages (Lample and Conneau 2019),
      leveraging also cross-lingual signals. Finally, a number of studies have
    * subdomains of English, such as BioBERT (Lee+ 2019) and SciBERT (Beltagy+
      2019) for biomedical publications and scientific text.

# 3 Pretraining

We next introduce the 
  * sources of unlabeled data used to pretrain FinBERT and present the 
  * data filtering and cleanup, vocabulary generation, and pretraining

## 3.2. vocabulary generation

* We then used the Sentence-Piece (Kudo and Richardson, 2018) implementation
  of byte-pair-encoding (BPE) (Sennrich+ 2016) to generate cased and
  uncased vocabularies of 50,000 word pieces each.

* coverage of ... vocabularies and compare these to previously introduced
  * we sampled a random 1% of tokens extracted [ from ] Wikipedias and
  * determine the number of word pieces and unknown pieces per basic token.
    * English, both BERT and M-BERT generate less than 1.2 WordPieces per token
      * model will represent the great majority of words as a single piece. For
    * Finnish, this ratio is nearly 2 for M-BERT. While 
      * some of this difference is explained by the morphological complexity of
      * also reflects that only a small part of the M-BERT vocabulary is
        dedicated to Finnish: 
        using the languagespecific FinBERT vocabularies, this ratio remains
        notably lower even though the size of these vocabularies is only half
        of the M-BERT vocabularies.

# 4

## 4.5 Probing Tasks

* probing tasks proposed by Conneau+ (2018)
* Finnish data introduced for these tasks by Ravishankar+ (2019), 21 which omit
  the TopConst task defined in the original paper. We also left out the
  Semantic odd-manout (SOMO) task, as we found the data to have errors making
  the task impossible to perform correctly. All of the tasks involve 
* freezing the BERT layers and training a dense layer on top of it to function
  * The only information passed from BERT to the classifier is the [CLS] state
* tasks can be roughly categorized into 3 different groups: surface, syntactic
  * Surface tasks In the 
    * sentence length (SentLen) task, sentences are classified into 6 classes
    * word content (WC) -- which of 1000 mid-frequency words occurs 
  * Syntactic tasks The 
    * tree depth (TreeDepth) task is used to test how well the model can
      identify the depth of the syntax tree of a sentence. We used dependency
      trees to maintain comparability with the work of Ravishankar+ (2019),
      whereas the original task used constituency trees. 
    * Bigram shift (BiShift) tests the model’s ability to recognize when two
      adjacent words have had their positions swapped.  
  * Semantic tasks In the 
    * subject number (SubjNum) task the number of the subject, i.e. singular or
    * Object number (ObjNum) is similar to the previous task but for objects of
    * Coordination inversion (CoordInv) has the order of two clauses joined by
      a coordinating conjunction reversed in half the examples. The 
      * model then has to predict whether or not a given example was inverted.
    * Tense task -- whether a main verb of a sentence is in the present or past

### Results 

* best performance is achieved by ... language-specific model for all tasks
  except TreeDepth, where M-BERT reaches the highest performance. The
* differences between the results for the language-specific and multilingual
  models are modest for most tasks with the exception of the BiShift task,
  where the FinBERT models are shown to be markedly better at identifying
  sentences with inverted words  

# 5 Discussion

* Finnish ranks 24th ... by Wikipedia article count, and 
  * 25th in Common Crawl by page count. 23 There are thus dozens of languages
* methods ... have only few language dependencies, such as the use of UD
  parsing results for filtering. As UD resources are already available for over

# Conclusions
