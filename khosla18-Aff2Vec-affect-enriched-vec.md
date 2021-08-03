Sopan Khosla, Niyati Chhaya, and Kushal Chawla
Aff2Vec: Affect–Enriched Distributional Word Representations
arXiv:1805.07966v1 cs.CL 21 May 2018

# Abstract

* affective word distributions in not well studied
* Aff2Vec outperforms
  * the SOTA in intrinsic word-similarity tasks
  * baseline embeddings and, in some sub-tasks, the SOTA
    in sentiment analysis, personality detection, and frustration prediction

# 1 Intro

* Historically, affective computing used multi-modal data 
  * gathered through various sensors
* Word correlation with social and psychological processes
  * Pennebaker (2011)
  * Preotiuc-Pietro+ (2017) studied personality and psycho-demographic
    preferences through Facebook and Twitter content
  * Sentiment analysis in Twitter with a detailed discussion on human affect
    (Rosenthal+ 2017) and
  * affect analysis in poetry (Kao and Jurafsky, 2012)
  * opinion and emotion words (Ghosh+ 2017)
* Sedoc+ (2017) introduce the notion of affect features in word distributions
* augmenting neural language modeling with affective information to
  emotive text generation (Ghosh+ 2017)
* Aff2Vec can be trained using any affect space,
* we focus on the Valence–Arousal–Dominance dimensions
* We introduce the ENRON-FFP Email dataset with 
  * Frustration, Formality, and Politeness tags gathered using a crowd-sourced

# 2 Prior art for enriched word distributions

# 3 Aff2Vec 3

* We leverage the Warriner’s lexicon (Warriner+ 2013) in the
  Valence–Arousal–Dominance space for this work
* This section presents two approaches for affect–enrichment of word distris

## 3.1 Affect-APPEND

* Consider
  * word embeddings W, the aim is to introduce affective information
  * affect embedding space, A
* word vectors W, with dimension D are concatenated with affect vectors A
  1. Normalize word vector W and affect vector A using their L2-Norms
  2. Concatenate the regularized word vectors x i with regularized affect
  3. Standardize (1 variance, 0 mean) the D + F dimensional embeddings
  4. The enriched space W A is then PCA-ed to original D dimensional vector

## 3.2 Affect-STRENGTH

* the strength in the antonym/synonym relationships of the words is
  incorporated in the word distribution space
  * Retrofitted Word Embeddings for this approach (Faruqui+ 2014)

### Affect-cStrength

In this approach, the affective strength is considered as a function of all F
affect dimensions ka i − a j k S(w i , w j ) = 1 − qP (6) F 2 max dist f =1 f
where
  a i and a j are F dimensional vectors in A and
  max dist f is defined as the maximum possible distance between two vectors in
  f th dimension (= 9.0 − 1.0 = 8.0 for VAD dimensions)

### Affect-iStrength

* Here, each dimension is treated individually
* For every dimension f in A, we add an edge between neighbors in the Ontology Ω
  where the strength of that edge is given by S f (w i , w j ):
  S f (w i , w j ) = 1 − |a if − a jf | / max dist f
  `S(w i , w j ) = \sum_{f=1..F} S f (w i , w j )`
  β ij from equation 5 is normalized with this strength function as
  β ij = β ij ∗ S(w i , w j ),
  where S(w i , w j ) is defined by either Affect-cStrength or Affect-iStrength

# 4 Crowd-sourcing study for the ENRON-FFP Dataset

# 5 Experimental setup 6

## 5.2 Extrinsic Evaluation

* performance of word embeddings on intrinsic benchmarks does not reflect
  directly into the downstream tasks
  (Chiu+ 2016, Gladkova and Drozd, 2016; Batchkarov+ 2016) suggest that

### Affect Prediction (FFP-Prediction): The experiment is to predict the

* formality, politeness, and frustration in email. We introduce the ENRON-FFP
* A basic CNN model is used for the prediction 8 . The purpose of this

### Personality Detection: This task is to predict human personality from text

* big five personality dimensions (Digman, 1990) are used for this experiment
  * Extroversion (EXT), Neuroticism (NEU), Agreeableness (AGR),
    Conscientiousness (CON), and Openness (OPEN)
  * Stream-of-consciousness essay dataset by Pennebaker+ (1999) contains 2468
    anonymous essays tagged with personality traits of the author. We use this
  * Majumder+ (2017) propose a CNN model for this prediction. We use their best
    results as baseline and report the performance of Aff2Vec on their default
    implementation 9

### Sentiment Analysis: The Stanford Sentiment Treebank (SST, Socher+ 2013)

* We report the performance on a Deep Averaging Network (DAN, Iyyer+ 2015)
  with default parameters on the SST dataset and compare against refined
* Implementation by Yu+ (2017) is used for the refined embeddings

### Emotion Intensity Task (WASSA)

* WASSA shared task on emotion intensity (Mohammad and Bravo-Marquez, 2017)
  (anger, fear, joy, or sadness) in a tweet
* intensity score can be seen as that of the author or as felt by the reader
* We train a BiLSTM-CNN–based model for this regression task with embedding

## 5.3 Qualitative Evaluation: Noise@k

* measures that capture noise in the neighborhood of a word
* Polarity-Noise@k (PN@k, Yu+ 2017) calculates the number of top k nearest
  neighbors of a word with opposite polarity for the affect dimension under
  consideration
* Granular-Noise@k (GN@k) captures the average difference between a word and
  its top k nearest neighbors for a particular affect dimension (f)
  * This is done for each word in the affect lexicon

# 6 Results

* compared against the vanilla word embeddings, embeddings with counterfitting,
  and embeddings with retrofitting. Table 4 summarizes the results
* Intrinsic word–similarity tasks. For the pre–trained word embeddings,
  * Amongst AffectAPPEND and Affect-STRENGTH, Affect-APPEND out performs the
    rest in most cases for GloVe and Word2vec
* Extrinsic tasks are reported in Table 5. We report the performance for GloVe
  * FFP-Prediction, Affect-APPEND is the best for Frustration and Politeness
  * personality detection, Affect-APPEND variants for NEU, AGR, and OPEN
* Sentiment Analysis (SA) task shows that Affect-APPEND variants report highest
* WASSA-EmoInt task.  Affect-APPEND and retrofit variants outperform
* Qualitative Evaluation: Polarity-Noise@10 and Granular-Noise@10
  * Affect-APPEND report the lowest noise for both cases
  * rate of change of noise with varying k provides insights into (1) how

# 7 Discussion on the distributional word representations

# 8 Conclusion
