TweetEval: Unified Benchmark and Comparative Evaluation for Tweet Classification
Francesco Barbieri, Jose Camacho-Collados, Leonardo Neves, Luis Espinosa-Anke
Findings of EMNLP 2020 arXiv:2010.12421 [cs.CL]

# Abstract

* The experimental landscape in NLP for social media is too fragmented
  * Each year, new shared tasks and datasets are proposed,
  * ranging from sentiment analysis to irony detection or emoji prediction
  => unclear what the current SOTA is, as there is
  * no standardized evaluation protocol, neither a
  * no strong set of baselines trained on such domain-specific data. In this
* we propose a new evaluation framework (TweetEval) consisting of
  * seven heterogeneous Twitter-specific classification tasks. We also provide
  * a strong set of baselines as starting point, and
  * we compare different language modeling pre-training strategies. Our initial
  * experiments show the effectiveness of
    starting off with existing pre-trained generic language models, and
    continue training them on Twitter corpora

# 1 Introduction

* NLP systems are typically ill-equipped to noisy user-generated text
  * social media: The high-paced, conversational and idiosyncratic nature of
      * platform-specific restrictions (eg Twitter’s character limit),
  * requires tackling additional challenges
    * eg
      * POS tagging (Derczynski+ 2013)
      * lexical normalization (Han and Baldwin, 2011; Baldwin+ 2015)
      * named entity recognition (Ritter+ 2011; Baldwin+ 2013)
    * In other more generic contexts, these challenges can be considered solved
      or are simply non-existent. Moreover, other apparently simple tasks such
  * sentiment analysis have proven to be hard on Twitter data (Poria+ 2020),
    <= limited amount of contextual cues available in short texts (Kim+ 2014)
  * highly fragmented landscape and the lack of a unified evaluation framework
* versatility of pretraining and Language Models (LMs)
  * SentEval (Conneau and Kiela, 18), GLUE (Wang+ 19b) & SuperGLUE (Wang+ 19a)
    have contributed to the fast development of NLU and LMs
    * comprehensive evaluations across several tasks: fair and reproducible
  * standard NLP tasks such as language inference, paraphrase detection or
    sentiment analysis, among others
  * hE currently cannot be gauged comparably across Twitter datasets and tasks

* We thus develop TweetEval, a benchmark for tweet classification in English. T
  * a standardized test bed for seven tweet classification tasks.  These are:
    * sentiment analysis, emotion recognition, offensive language detection,
      hate speech detection, stance prediction, emoji prediction, & irony det
  * unified framework, unified criteria for train/validation/test splits, and
  * we evaluate
    * strong baselines inspired by current SotA in these tasks. We also
    * transformer-based models, trained entirely and partially on Twitter data,
    * we shed light on the effect of training with different corpora

# 2 TweetEval: The Benchmark

* Table 1, a sample tweet and its corresponding label from the original task

## 2.1 Tasks

### Emotion Recognition: recognizing the emotion evoked by a tweet

* We use the dataset of the most participated task of SemEval2018, “Affects in
  Tweets” (Mohammad+ 2018)
* The original competition was framed as a multi-label classification problem,
  including 11 emotions
* The integration into TweetEval consists of re-purposing this multi-label
  dataset into multi-class classification
  * keeping only the tweets labeled with a single emotion. Since
  * the amount of tweets with single labels was scarce
  => we selected the most common four emotions (Anger, Joy, Sadness, Optimism)2
    * those emotions with a minimum frequency of 300 examples in the training

### Emoji Prediction: given a tweet, predicting its most likely emoji, and is

* based on the Emoji Prediction challenge at Semeval2018 (Barbieri+ 2018). It
  only considers tweets with one emoji (irrespective of its position), which is
  used as classification label
* test set is the same as in the original publication, but
* we limit the training and validation splits to 50,000 tweets, in order to
  comply with Twitter distribution policies
* label set comprises 20 different emoji, and due to their
  * skewed distribution, this task proved to be highly difficult, with low
  * more than 42% of the tweets are labeled with the 3 most frequent emoji

### Irony Detection: recognizing whether a tweet includes ironic intents

* We use the Subtask A dataset of the SemEval2018 Irony Detection challenge
  (Van Hee+ 2018)
* this dataset was artificially balanced to make the task more accessible

### Hate Speech Detection: predicting whether a tweet is hateful or not against

* two target communities: immigrants and women
* Our dataset of choice stems from the SemEval2019 Hateval challenge
  (Basile+ 2019)

### Offensive Language Identification

* identifying whether some form of offensive language is present in a tweet
* For our benchmark we rely on the SemEval2019 OffensEval dataset
  (Zampieri+ 2019)

### Sentiment Analysis: recognize if a tweet is positive, negative or neutral

* We use the Semeval2017 dataset for Subtask A (Rosenthal+ 2019)
  * includes data from previous runs (2013, 2014, 2015, and 2016) of the same
    SemEval task

### Stance Detection

* determine, given a piece of text, whether the author has a favourable,
  neutral, or negative position towards a proposition or target
* We use
  the SemEval2016 shared task on Detecting Stance in Tweets (Mohammad+ 2016)
  * five target domains: abortion, atheism, climate change, feminism, Hillary
* Unlike the other tasks, training is provided separately for each domain,
  which we use to extract individual validation sets

## 2.2 Statistics and evaluation metrics

* Table 2 includes the TweetEval datasets statistics after unification.3
* Data sizes range from a few hundred instances for training to over 40,000
* the preprocessing pipeline is equal for all tasks:
  * user mentions are anonymized and line breaks and website links are removed

### Evaluation metrics. We use the same evaluation metric from the original

* macro-averaged F1 over all classes, in most cases. There are
* three exceptions: stance (macro-averaged of F1 of favor and against classes),
  irony (F1 of ironic class), and sentiment analysis (macro-averaged recall)
* Similar to GLUE (Wang+ 2019b), we also introduce a global metric (TE)
  based on the average of all dataset-specific metrics

# 3 Language Models for Tweet Classification

* Transformer-based LMs
  such as GPT (Radford+ 2018), BERT (Devlin+ 2019) or XLNET (Yang+ 2019)
  outperforming previous linear models and neural networks (LSTMs/CNNs)
  in many tasks, including sentence and text classification (Wang+ 2019b).
  * First, LMs are trained on a large unlabeled corpus
  * Then, they are fine-tuned to the task for where an appropriate training set
* hE For social media 
  ? whether existing pretrained models trained on standard corpora are optim
  => We thus compare three different training data: 
  * Using an existing large pre-trained LM; 
  * using an existing archit, but training from scratch using only Twitter data
  * starting with an original pretrained LM and continue to train with Twitter
    * keeping the original tokenizer and the same masked LM loss.
    * three theoretical advantages: 
      * these models are generally trained on large amounts of text corpora,
        and reproducing the same experiment would be extremely expensive
        even if we had same amount of Twitter data; 
      * learning on different types of text corpora make the models more robust
        and knowledgeable about the world; and 
      * some models such as RoBERTa (Liu+ 2019) or GPT-2 (Radford+ 2019) are
        not unfamiliar with internet language and slang, as part of their
        underlying training corpora contains Reddit data (38GB).
