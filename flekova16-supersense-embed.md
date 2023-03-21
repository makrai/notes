Supersense embeddings: A unified model for ... interpret, predict, & utiliz
L Flekova, I Gurevych
ACL 2016

https://github.com/UKPLab/acl2016-supersense-embeddings

# Abstract

* Coarse-grained semantic categories such as supersenses
  * useful for eg question answering or machine translation
  * no distributional word representations
* We present a novel joint embedding model of words and supersenses
  * words and supersenses in the same vector space
  * significant improvement in a range of downstream classification tasks
    * sentiment polarity classification, subjectivity classification and
      metaphor prediction

# 1 Introduction

* WSD: see Navigli (2009) or Pal and Saha (2015) for an overview
* Words are most commonly annotated with senses taken from WordNet
  * improvement in sentiment prediction using WSD (...Sumanth and Inkpen, 2015)
  * the publication bias toward positive results (Plank+ 2014)
    * Barbara Plank, Anders Johannsen, and Anders Søgaard
      Importance weighting and unsupervised domain adaptation of POS taggers:
        a negative result
      EMNLP 2014
* supersenses
  * coarse-grained word labels based on WordNet (Fellbaum, 1998)
    * 26 labels for nouns, such as ANIMAL, PERSON or FEELING and
    * 15 labels for verbs, such as COMMUNICATION, MOTION or COGNITION
  * provide disambiguating information without the need of fine-grained WSD
  * shown to improve
    * dependency parsing (Agirre+ 2011)
    * named entity recognition (Marrero+ 2009; Rüd+ 2011)
    * non-factoid question answering (Surdeanu+ 2011)
    * question generation (Heilman, 2011)
    * semantic role labeling (Laparra and Rigau, 2013)
    * personality profiling (Flekova and Gurevych, 2015)
    * semantic similarity (Severyn+ 2013) and
    * metaphor detection (Tsvetkov+ 2013)

# 2 Related Work

## 2.1 Semantically Enhanced Word Embeddings

* supersenses could be seen as hypernym
  * to our knowledge they have not been explicitly employed in these works
* our explicit supersense embeddings have direct interpretability

## 2.2 Supersense Tagging

* Supersenses, also known as _lexicographer files_ or _semantic fields_
* supersense tagging task
  * introduced by Ciaramita and Johnson (2003) for nouns
  * expanded for verbs (Ciaramita and Altun, 2006)
  * state-of-the-art system is trained and evaluated on the SemCor data
    (Miller+ 1994) with an F-score of 77.18%,
    * using a hidden Markov model
    * reimplementation by Heilman
    * widely used in applied tasks
      (Agirre+ 2011; Surdeanu+ 2011; Laparra and Rigau, 2013)
* Supersense taggers also for Italian (Picca+ 2008),
  Chinese (Qiu+ 2011) and Arabic (Schneider+ 2013)
* Tsvetkov+ (2015) proposes the usage of SemCor supersense frequencies as
  a way to evaluate word embedding models, showing that a
  * good alignment of embedding dimensions to supersenses correlates with
    performance of the vectors in word similarity and text classification
* Johannsen+ (2014)
  * introduced a task of multiword supersense tagging on Twitter
  * show poor domain adaptation performance of previous systems
* Schneider and Smith (2015)
  * expanded a multiword expression (MWE) annotated corpus of online reviews
    with supersense information
  * SemCor may not be a sufficient for adaption to different domains
* we using an automatically annotated Babelfied Wikipedia corpus
  (Scozzafava+ 2015)

# 3 Building Supersense Embeddings

* training corpus
  * the freely available sample of 500k articles of Babelfied English Wikipedia
    (Scozzafava+ 2015)
    * one of the largest published and evaluated sense-annotated corpora,
    * 500 million words, of which over 100 million are
      annotated with Babel synsets
    * estimated synset annotation accuracy of 77.8%
  * Few other automatically sense-annotated Wikipedia corpora are available
    (Jordi Atserias and Attardi, 2008; Reese+ 2010)
* We map
  * the Babel synsets to WordNet 3.0 synsets (Miller, 1995)
    * using the BabelNet API (Navigli and Ponzetto, 2012)
  * these synsets to their corresponding WordNet’s supersense categories
    (Miller, 1990; Fellbaum, 1990)
  * for nested named entities, only the largest BabelNet span is considered
* In this manner we obtain two alternative Wikipedia corpora where each word
  * is replaced by its corresponding supersense or
  * has its supersense appended
* skip-gram model with negative sampling
  on the shuffle of these three Wikipedia corpora
* benefits of learning this information jointly are threefold:
  * Vectors of the original words taking into account the similarity to
    supersenses in the vector space
  * similarity queries for supersenses of unannotated words
  * Disambiguated word+supersense vectors of annotated words can be employed
    similarly to sense embeddings (Iacobacci+ 2015; Chen+ 2014)
    to improve downstream tasks and
    in supersense disambiguation or contextual similarity systems

# 4 Qualitative Analysis

## 4.1 Verb Supersenses

* Table 2 shows the most similar word vectors to each of the verb supersense
* most of the assigned words are verbs
* The most frequent error originates from
  assigning the adverbs to their related verb categories,
  eg  jokingly to COMMUNICATION and drastically to CHANGE

## 4.2 Noun Supersenses

* the assignments of more specific supersenses
  * such as FOOD, PLANT, TIME or PERSON are in general more plausible than
    those for abstract concepts such as ACT, ARTIFACT or COGNITION
  * In accordance with previous work on suppersense tagging
    (Ciaramita and Altun, 2006; Schneider+ 2012; Johannsen+ 2014)
* COMMUNICATION supersense appears well defined,
  * In contrast to Schneider+ (2012) and Johannsen+ (2014)

## 4.3 Word Analogy and Word Similarity Tasks

* Mikolov+ (2013 Linguistic regularities...) word analogy dataset
  * Enriching our data with the recently proposed adjective supersenses
    (Tsvetkov+ 2014) could be of interest for Opposites or Plurals
  * Y Tsvetkov, N Schneider, D Hovy, A Bhatia, M Faruqui, Ch Dyer
    Augmenting english adjective senses with supersenses
    2014
* word similarity datasets:
  * WordSim353-Similarity (353-S) and WordSim353-Relatedness (353-R) Agirre+09,
    MEN dataset (Bruni+ 2014), RG-65 dataset (Rubenstein and G, 1965)
    MC-30 (Miller and Charles, 1991)
  * explicit supersense information could be further exploited,
    similarly to previous sense embedding works
    (Iacobacci+ 2015; Rothe and Schütze, 2015; Chen+ 2014)
  * we report similarity performance for completeness, while
    * a substantial discussion on downstream quality quantification
      (Li and Jurafsky, 2015; Faruqui+ 2016)

# 5 Building a Supersense Tagger

* we build a deep neural network model to predict supersenses
* on the Twitter supersense corpus created by Johannsen+ (2014),
  * based on the Twitter NER task (Ritter+ 2011),
  * token-level annotation combines the B-I-O flags
    with the supersense class labels to represent
    the multiword expression segmentation and supersense labeling in a sentence

## 5.1 Experimental Setup

* We implement a window-based approach with a
* multi-channel multi-layer perceptron model using the Theano framework
* sliding window of size 5 for the sequence learning setup we extract for each
  word the following seven feature vectors:

## 5.2 Supersense Prediction

Our system achieves comparable performance to the best previously used
supervised systems, without using any explicit gazetteers

# 6 Using Supersense Embeddings in Document Classification Tasks

* WSD is limited by the errors cumulated along the pipeline
* we demonstrate an end-to-end deep learning approach

# 6.1 Experimental Setup

* state-of-the-art semantic composition models for text classification
  (Kim, 2014; Li+ 2015; Johnson and Zhang, 2014)
  * Convolutional Neural Networks (CNNs) and
  * Long Short-Term Memory (LSTM) (Hochreiter and Schmidhuber, 1997) are
  * their combinations achieving an unprecedented performance
    (Sainath+ 2015)
* We extend the CNN-LSTM approach from the publicly available Keras demo
  with the supersense information
* network architecture
  * three channels of word embeddings on the plain textual input + 1
    1. the 300-dimensional word embeddings obtained from our enriched corp
    2. 41-dimensional vectors capturing the cosine similarity to supersense
    3. background supersense distribution for the word
    4. supersense text
  * convoluted with the filter size of 3, followed by a
    pooling layer of length 2 and fed into a longshort-term-memory (LSTM)

## 6.2 Sentiment Polarity Classification

* Movie Review dataset (Pang and Lee 2005)
  * a standard benchmark task for binary sentence classification
* Socher+ (2011) address this task with recursive autoencoders and
  Wikipedia word embeddings
* recursive neural network with parse trees (Socher+ 2012)
* sentiment-analysis-specific parser (Dong+ 2015), with a
* fast dropout logistic regression (Wang and Manning, 2013), and with
* convolutional neural networks (Kim, 2014)
* Table 7 compares these approaches to our sota? results
* qualitative analysis revealed that
  * supersenses help to generalize over rare terms
  * Often the wit of unusual expressions is lost
    for the benefit of generalization

## 6.3 Subjectivity Classification

* Pang and Lee (2004)
  * subjectivity detection can be a useful input for a sentiment classifier
  * dataset of 5000 subjective and 5000 objective sentences
* Kim (2014) and Wang and Manning (2013) further improve the performance
* Supersenses are a natural candidate for subjectivity prediction, as we
  * (eg VERB.FEELING vs. VERB.COGNITION)
  * Our sota? results are reported in Table 9
  * manual error analysis
    * verbs
      * Subjective sentences contain more verbs of supersense PERCEPTION
      * objective ones more feature POSSESSION and SOCIAL
    * Nouns in the
      * subjective is characterized by COMMUNICATION and ATTRIBUTE,
      * objective ones the PERSON and POSSESSION are more frequent

## 6.4 Metaphor Identification

* metaphor prediction tasks (Gershman+ 2014)
  * supersenses hold the information of coarse semantic concepts
* Turney+ (2011)
    * discriminating literal and metaphoric adjective-noun expressions
* Tsvetkov+ (2013)  publishing a
  * dataset of 985 literal and 985 methaphorical adjective-noun pairs
* Gershman+ (2014)
  * state-of-the-art F-score of 85% with random decision forests,
  * including also abstractness and imageability features (Wilson, 1988) and
    supersenses from WordNet, averaged across senses

# 7 Discussion

* our work is based on an automatically annotated large corpus
  * previous research is based on a manually produced gold standard
* While Scozzafava+ (2015) report a high accuracy estimate of 77.8% _on
  sense level_, the performance and possible bias on tagged supersenses are yet
  to be evaluated
* some of the previously proposed approaches for building word sense embeddings
  (Rothe and Schütze, 2015; Chen+ 2014; Iacobacci+ 2015)
  could be eventually extended to supersenses
* a different level of granularity of the concepts, such as WordNet Domains
  (Magnini and Cavaglia, 2000) could be explored

# 8 Conclusions and Future Work

* future work
  * apply our method on smaller, gold-standard corpora
    eg SemCor (Miller+ 1994) and STREUSLE (Schneider and Smith, 2015)
  * multilingual adaptation of the vector space,
    * eg extending Faruqui and Dyer (acl 2014)
      Improving vector space word representations using multilingual corr
    * supersenses was shown to be preserved in translation (Schneider+ 2013)
