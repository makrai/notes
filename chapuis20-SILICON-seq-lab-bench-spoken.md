Hierarchical Pre-training for Sequence Labelling in Spoken Dialog
Emile Chapuis, Pierre Colombo, Matteo Manica, Matthieu Labeau, Chloé Clavel
Findings 2020

# Abstract

* Sequence labelling tasks like Dialog Act and Emotion/Sentiment identification
  * a key component of spoken dialog systems
* we propose: learn generic representations adapted to spoken dialog
  * new benchmark we call SILICONE
    * Sequence labellIng evaLuatIon benChmark fOr spoken laNguagE
    * 10 datasets of various sizes
* our representations with a hierarchical encoder based on transformer
  * we extend two well-known pre-training objectives
  * Pre-training is performed on OpenSubtitles
    * a large corpus of spoken dialog containing over 2.3 billion of tokens. We
  * competitive results with consistently fewer parameters compared to SOTA
  * hierarchical encoders are important for both pre-training and fine-tuning

# 1 Intro

* identification of both Dialog Acts (DA) and Emotion/Sentiment (E/S) in spoken
  * important step in spontaneous dialogue task
  * essential to avoid the generic response problem (Yi+ 2019; Colombo+ 2019)
    * automatic dialog system generate an unspecific response
    * can be an answer to a very large number of user utterances
* DA and emotion identification (Witon+ 2018; Jalalzai+ 2020) are
  done through sequence labelling systems that are
  * usually trained on large corpora (with over 100k labelled utterances) eg
    * Switchboard (Godfrey+ 1992)
    * MRDA (Shriberg+ 2004) or
    * Daily Dialog Act (Li+ 2017)
    * complex models learned from scratch (eg seq2seq (Colombo+ 2020)) are
      very specific to the labelling scheme employed
* Generic representations adapt models across different sets of labels
  (Mikolov+ 13; Pennington+ 14; Peters+ 18; Devlin+ 18; Yang+ 19; Liu+ 19)
  * usually trained on large written corpora such as
    * OSCAR (Suárez+ 2019)
    * Book Corpus (Zhu+ 2015) or
    * Wikipedia (Denoyer and Gallinari, 2006)
* Tran+ (2019): training a parser on conversational speech data can improve
  * discrepancy between spoken and written language
  * disfluencies (Stolcke and Shriberg, 1996),
  * fillers (Shriberg, 1999; Dinkar+ 2020),
  * different data distribution
  * discourse-level features, which distinguish dialog from other types of text
    (Thornbury and Slade, 2006), eg capturing multi-utterance dependencies, is
  * not explicitly present in pre-training objectives
    (Devlin+ 2018; Yang+ 2019; Liu+ 2019),
    as they often treat sentences as a simple stream of tokens
* our goal is to train on SD data a generic dialog encoder
  capturing discourse-level features that produce representations
  adapted to spoken dialog
  * We evaluate these representations on both DA and E/S labelling
  * new benchmark SILICONE composed of
    * datasets of varying sizes using different sets of labels
  * smaller models to obtain lightweight reprs (Jiao+ 2019; Lan+ 2019)
    * can be trained without a costly computation infrastructure
    * good performance on several downstream tasks (Henderson+ 2020)
  * we propose the first hierarchical generic multi-utterance encoder based on
    a hierarchy of transformers
    * hierarchy is inherent in dialog (Thornbury and Slade, 2006)
    * factorise the model parameters, getting rid of long term dependencies and
    * training on a reduced number of GPUs
    * we generalise two existing pre-training objectives
  * data
    * embeddings highly depend on data quality (Le+ 2019) & volume (Liu+ 2019)
    * we preprocess OpenSubtitles (Lison+ 2019)
      * a large corpus of spoken dialog from movies
      * an order of magnitude bigger than corpora
      (Budzianowski+ 2018b; Lowe+ 2015; Danescu-Niculescu-Mizil and Lee, 2011)
      used in previous works (Mehri+ 2019; Hazarika+ 2019)
* Lastly, we evaluate our encoder along with other baselines on SILICONE
  * finer conclusions of the generalisation capability of our models

# 2 Method

* two levels
  * At the highest level, we have a set D of conversations composed of
    utterances with Y being the corresponding set of labels (eg DA, E/S). At a
  * lower level each conversation Ci is composed of utterances u with Yi being
    the corresponding sequence of labels: each ui is associated with a unique
  * lowest level, each utterance ui can be seen as a sequence of words, i )

## 2.1 Pre-training Objectives

* Our work builds upon existing objectives designed to pre-train encoders: the
  * Masked Language Model (MLM)
    * Devlin+ (2018); Liu+  (2019); Lan+ (2019); Zhang+  (2019a)
  * Generalized Autoregressive Pre-training (GAP) from Yang+ (2019)
    * computing a classic language modelling loss across different
      factorisation orders of the tokens. In this way, the model will learn to
      gather information across all possible positions from both directions

## 2.5 Pre-training Datasets

* Datasets used to pre-train dialog encoders (Hazarika+ 2019; Mehri+ 2019) are
  often medium-sized
  * Cornell Movie Corpus (Danescu-Niculescu-Mizil and Lee, 2011)
  * Ubuntu (Lowe+ 2015) based on logs;
  * MultiWOz (Budzianowski+ 2018a)
* we focus on OpenSubtitles (Lison and Tiedemann, 2016)4 because
  * it contains spoken language, contrarily to the Ubuntu corpus (Lowe+ 2015)
  * multi-party dataset as
    * Wizard of Oz (Budzianowski+ 2018a) and
    * Cornell Movie Dialog Corpus (Danescu-Niculescu-Mizil and Lee, 2011)
  * an order of magnitude larger than any other spoken language dataset
* We segment OpenSubtitles by considering 6 sec silence
  * Conversations shorter than the context size T are dropped
  * After preprocessing, Opensubtitles contains subtitles from 447 K movies or
    series which represent 55 M conversations and over 2.3 billion of words

## 2.6 Baseline Encoders, two different types

* Pre-trained Encoder Models. We use BERT (Devlin+ 2018) through the pytorch
  * fed with a concatenation of the utterances. Formally given an input context
* Hierarchical Recurrent Encoders
  * ie hierarchical encoders based on recurrent cells
  * current SOTA perf in many seq labelling tasks
    (Li+ 2018a; Colombo+ 2020; Lin+ 2017)
  * In this work we rely on our own implementation of the model based on HR
  * Hyperparameters in Appendix B

# 3 Evaluation of Sequence Labelling

## 3.1 Related Work

* Sequence labelling tasks for spoken dialog: two types of labels: DA and E/S
* Early work has tackled the sequence labelling problem as an
  independent classification of each utterance
* Deep neural network models that currently achieve the best results
  (Keizer+ 2002; Surendran and Levow, 2006; Stolcke+ 2000)
  model both contextual dependencies between
  * utterances (Colombo+ 2020; Li+ 2018b) and
  * labels (Chen+ 2018b; Kumar+ 2018; Li+ 2018c)
* require large corpora to train models from scratch eg
  * Switchboard Dialog Act (SwDA, Godfrey+ 1992),
  * Meeting Recorder Dialog Act (MRDA, Shriberg+ 2004),
  * Daily Dialog Act (Li+ 2017),
  * HCRC Map Task Corpus (MT, Thompson+ 1993)
* smaller datasets
  * adoption to them is hard
  * Loqui human-human dialogue corpus (Loqui, Passonneau and Sachar, 2014),
  * BT Oasis Corpus (Oasis, Leech and Weisser, 2003),
  * Multimodal Multi-Party Dataset (MELD, Poria+ 2018a),
  * Interactive emotional dyadic motion capture database (IEMO),
  * SEMAINE database (SEM, Mckeown+ 2013)

## 3.2 Presentation of SILICONE

* methods for DA and E/S sequential classification are similar
  * hE studies usually rely on a single type of label
  * there is variety of small or medium-sized labelled datasets,
  * hE evaluation is usually done on the largest available corpora
    (eg SwDA, MRDA)
* We introduce SILICONE, a collection of sequence labelling tasks
  * both DA and E/S annotated datasets
  * built upon challenging and interesting preexisting datasets
  * model agnost: Any model that is able to process multiple sequences as
    inputs and predict the corresponding labels can be evaluated on SILICONE
  * We especially include small-sized datasets
    * models should distil substantial knowledge and
      adapt to different sets of labels without relying on many examples.  The
  * corpora statistics are gathered in Table 2

### 3.2.1 DA Datasets

#### Switchboard Dialog Act Corpus (SwDA) is a telephone speech corpus

* two-sided telephone conversations with provided topics
* includes additional features such as speaker id and topic information
* The SOTA model, based on a seq2seq architecture with guided attention,
  reports an accuracy of 85.5% (Colombo+ 2020) on the official split

#### ICSI MRDA Corpus (MRDA, Shriberg+ (2004)

* transcripts of multi-party meetings hand-annotated with DA
* the second biggest dataset with around 110k utterances
* The SOTA model reaches an accuracy of 92.2% (Li+ 2018a) and uses
  * Bi-LSTMs with attention as encoder as well as
  * additional features, such as the topic of the transcript

#### DailyDialog Act Corpus (DyDAa, Li+ (2017))

* multiturn dialogues, supposed to reflect daily communication
  by covering topics about daily life
* manually labelled with dialog act and emotions
* the third biggest corpus of SILICONE with 102k utterances
* The SOTA model reports an accuracy of 88.1% (Li+ 2018a), using
  * Bi-LSTMs with attention as well as additional features
  * We follow the official split introduced by the authors

#### HCRC MapTask Corpus (MT) has been introduced by (Thompson+ 1993). To build

* participants were asked to collaborate verbally by
  describing a route from a first participant’s map
  by using the map of another participant
* small (27k utterances)
  * no standard train/dev/test split7 performances depends on the split
  * Tran+ (2017)'s Hierarchical LSTM encoder with a GRU decoder layer and
  * accuracy of 65.9%

#### Bt Oasis Corpus (Oasis, Leech and Weisser, 2003)

* transcripts of live calls made to the BT and operator services
* rather small (15k utterances). There is no standard train/dev/test split 8
* few studies use this dataset

### 3.2.2 S/E Datasets

* no consensus on the choice the evaluation metric
  * Ghosal+ (2019); Poria+ (2018b) use a weighted F-score while
  * Zhang+ (2019b) report accuracy
  * For SILICONE, we choose to stay consistent with the DA research and thus
    follow Zhang+ (2019b) by reporting the accuracy
* lable set
  * emotion/sentiment labels are neither merged nor prepossessed
  * Comparison with concurrent work is more difficult as
    system performance heavily depends on the number of classes and
    label processing varies across studies (Clavel and Callejas, 2015)

#### DailyDialog Emotion Corpus (DyDAe) eleven emotional labels

* SOTA model (De Bruyne+ 2019) is based on BERT with
  additional Valence Arousal and Dominance features and reaches an
  accuracy of 85% on the official split

#### Multimodal EmotionLines Dataset (MELD)

* created by enhancing and extending EmotionLines dataset (Chen+ 2018a) where
  multiple speakers participated in the dialogues
* two types of annotations MELDs and MELDe :
  * three sentiments (positive, negative and neutral) and
  * seven emotions (anger, disgust, fear, joy,neutral, sadness and surprise)
* The SOTA model with text only is proposed by Zhang+ (2019b) and is inspired
  by quantum physics
* On the official split, it is compared with a hierarchical bi-LSTM, which it
  beats with an accuracy of 61.9% (MELDs ) and 67.9% (MELDe ) against 60.8% and
  65.2

#### IEMOCAP database (IEMO) is a multimodal database of ten speakers. It

* dyadic sessions where actors perform improvisations or scripted scenarios
* Emotion categories are: anger, happiness, sadness, neutral, excitement,
  frustration, fear, surprise, and other. There is
* no official split on this dataset
* a bi-LSTMs model (Zhang+ 2019b) and achieves 35.1%, with text only

#### SEMAINE database (SEM)

* comes from the Sustained Emotionally coloured Machine human Interaction using
  Nonverbal Expression project (Mckeown+ 2013)
* annotated on three sentiments labels: positive, negative and neutral by
  Barriere+ (2018)
* built on Multimodal Wizard of Oz experiment where
  participants held conversations with an operator who adopted various roles
  designed to evoke emotional reactions
* no official split on this dataset
