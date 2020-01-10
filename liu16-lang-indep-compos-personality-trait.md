A Language-independent and Compositional Model
  for Personality Trait Recognition from Short Texts
Fei Liu, Julien Perez, Scott Nowson
2016 EACL

#Abstract

* Many methods have been used to recognise author personality
  * e.g. linear regression or Support Vector Machines
* This work uses deep-learning based models [on]
  * characters to build hierarchical ... word and sentence representations
  * applied to a corpus of tweets, shows state-of-the-art performance across
    five traits and three languages (English, Spanish and Italian)
  * preliminary visualisation work, are encouraging for the ability to detect
    complex human traits

#Intro

* modelling people from their language
  * language use is known to be influenced by sociodemographic characteristics
    such as gender and personality (Tannen, 1990; Pennebaker+ 2003)
  * personality traits ... are considered temporally stable (Matthews+ 2003),
    * thus our model ... is enriched by the acquisition of more data over time
    * Extroversion, emotional Stability, Agreeableness, Conscientiousness and
      Openness
* Computational personality recognition
  * workshops exploring the topic (Celli+ 2014; Tkalčič+ 2014)
  * in the PAN Author Profiling challenge at CLEF in 2015 (Rangel+ 2015)
  * Much prior literature in this field has used some variation of enriched
    bag-of-words; e.g. the Open vocabulary approach (Schwartz+ 2013)
  * relationship between word use and traits ... (Pennebaker+ 2003)
  * levels of representation [such as syntactic, semantic, and] the
    psychologically-derived lexica of LIWC (Pennebaker+ 2015)
* the relationship between language and personality is not consistent across
  all forms of communication (Nowson and Gill 2014)
* task is framed as supervised sequence regression
  * classification of [short] texts ... state-of-the-art BoW based approaches
    * Han and Baldwin, 2011
* we propose a novel recurrent and compositional neural network architecture,
  capable of constructing representations at character, word and sentence level
* two sets of experiments
  1. inferring personality for users
    * user-level evaluation is the common practice
  2. short text level analysis
  * state-of-the-art performance across five personality traits and three langs

#Related work

* Early work on computational personality recognition
  * Argamon+ 2005; Nowson and Oberlander, 2006
  * SVM-based approaches and manipulated lexical and grammatical feature sets
* new features in the PAN 2015 Author Profiling task
  * from multiple levels of representation on language
  * word, lemma and character n-grams
  * POS tags and dependency relations
  * punctuation and emoticon use
  * latent semantic analysis for topic modelling
  * external resources such as LIWC (Pennebaker+ 2015)
    * represents over 20 years of psychology-based feature engineering
    * When [tweets, however, LIWC requires] cleaning (Kreindler, 2016)
* small data `=>` few Deep-learning based approaches
  * Kalghatgi+ (2015) personality prediction of users
    * hand-crafted grammatical and social behavioral features from each user
    * 5 personality traits
    * no evaluation of this work, nor details of the dataset, were provided
  * Su+ (2016) describes an RNN based system,
    * exploiting the turn-taking of conversation
    * LIWC-based and grammatical features
    * focus is on the prediction of trait scores on the user level
  * this paper: trait scores from a single short text
* [our] model
  * inspired by
    * Ling+ (2015) c2w
      * character-level LSTM
      * Topped by a softmax layer at each word
      * applied to LM, POS tagging
    * Yang+ (2016) introduced Hierarchical Attention Networks where the
      * representation of a sentence [from] words using a bi-directional GRU
      * documents from sentences ... by another bi-directional GRU at the
      * Word to Sentence to Document, W2S2D
  * Character to Word to Sentence for Personality Trait, C2W2S4PT

#4 Experiments and Results

##4.4 superiority of C2W2S4PT is less clear in Italian [because of fewer data
as in] English and Spanish
