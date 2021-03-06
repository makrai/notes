 Deep Bottleneck Features for Spoken Language Identification
* Bing Jiang, Yan Song, Si Wei, Jun-Hua Liu, Ian Vince McLoughlin, Li-Rong Dai
* PLOS 2014

* the DBF extractor ... is trained on the corpus with phonemes or phoneme states
* information
* a total variance akkor is működik, ha csak nyelv szintjén van cimkézve a tanulóadat?

# Abstract

* representations which are specific to language information
* in recent years, representations based on both phonotactic and acoustic
  features have proven their effectiveness for LID
* we propose using Deep Bottleneck Features (DBF) for spoken LID
  * two acoustic models, termed DBF-TV and parallel DBF-TV (PDBF-TV), using a
    DBF based i-vector representation for each speech utterance
* Results on NIST language recognition evaluation 2009 (LRE09)

# Intro

* just phonotactic and acoustic features
  * representations from various research domains, such as 
    * phonotactic and acoustic information [1]–[3], 
    * lexical knowledge [4], 
    * prosodic information [5],
    * articulatory parameters [6], and 
    * universal attributes [7]. 
  * extra language-related cues may help 
    * Eady [5], 
      * F0 patterns of speech: Tone language versus stress language
    * Matrouf et. al. [4] and 
      * lexical information
    * Kirchoff et. al. [6]  
      * Mixed-memory Markov models for automatic language identification
      * application to both a phone-based and an articluatory fateure
      * based LID system
  * this paper, we mainly focus on the phonotactic and acoustic
    representations, which are considered to be the most common ones
* Phonotactic representations 
  * the phonotactic representation of a given utterance is the token sequence
  * or lattice output from a phone recognizer (PR). 
  * approaches are state-of-the-art
    * Parallel Phone Recognizers + Language Models (PPR-LM) [3] and 
  *   ! Parallel Phone Recognizers + Support Vector Machines (PPR-SVM) 
  * problem with the phone recognizer (PR) [12].
    * When the labelled dataset size is limited
      * bad results
      * time consuming
* ! acoustic representations mainly capture the spectral feature distribution 
  * factors
    * (1) front-end feature extractor: forms the frame level representation
      * A popular feature is Shift Delta Cepstra (SDC) [13]–[15].
        * an extension of traditional MFCC or PLP features 
    * (2) back-end model constructs the representation for LID [itself]
    *   ! Gaussian Mixture Model-Universal Background Model (GMM-UBM) [15]
      *   15. Torres-Carrasquillo PA, Singer E, Kohler MA, Greene RJ, Reynolds DA, et al.
      *   (2002) 
      *   Approaches to language identification using Gaussian mixture models
        * and shifted delta cepstral features
      * Gaussian Mixture Model-Support Vector Machine (GMM-SVM) [16], [17]
    * machine learning techniques, such as 
      * discriminative training [18]–[20], 
      * Factor Analysis (FA) [21]–[23] and 
      *   21. Vair C, Colibro D, Castaldo F, Dalmasso E, Laface P (2006) 
        * Channel factors compensation in model and feature domain for speaker recognition. 
        * In: Proceedings of Odyssey 2006
      *   22. Castaldo F, Colibro D, Dalmasso E, Laface P, Vair C (2007) 
        * Compensation of nuisance factors for speaker and language recog
        * IEEE Trans Audio Speech Lang Processing 15: 1969–1978.
      *   23. Hubeika V, Burget L, Matejka P, Schwarz P (2008) 
        * Discriminative training and channel compensation 
        *   for acoustic language recognition. 
        *   International Speech Communication Association
      * Total Variability (TV) modeling [24], [25]
      *   24. Dehak N, Kenny PJ, Dehak R, Dumouchel P, Ouellet P (2011) 
      *   Front-end factor analysis for speaker verification
      *   25. Dehak N, Torres-Carrasquillo PA, Reynolds DA, Dehak R (2011) 
      *   Language recognition via i-vectors and dimensionality reduction
  * performance ... comparable to or even exceed that of phonotactic approaches
* acoustic system based on deep bottleneck features (DBF)
* DBFs were generated by a structured Deep Neural Network (DNN) 
  * containing a narrow internal bottleneck layer
* unlike work by Diez et. al. [32], [33], in which 
  * the log-likelihood ratios of posterior probabilities, 
    * called Phone Log-Likelihood Ratios (PLLR), 
    * output from the multi-layered perceptron (MLP), 
    * were used as frame level features for LID. 
    * We will present a more detailed discussion and comparison
* equal error rate (EER)

# Methods

* Deep Bottleneck Features
* DNN Training
  * generative pre-training 
    * a generative Deep Belief Net (DBN) with stacked Restricted Boltzmann
    * Machines (RBM) is trained
    * layer-by-layer
  * discriminative fine-tuning phases
    * a randomly initialized softmax layer is added
    * In our work, [output layers] correspond to the 
      * language-specific phonemes
* DBF Extraction
  * The DBF extractor removes the layers above the bottleneck layer
  * x is the ... input feature, 
    * concatenated from multiple frames of MFCC and prosodic features
* DNN Training Settings
  * Corpus.
    * for train[ing] and construct[ing] two DBF feature extractors 
      * Mandarin DNN (MA-DNN) 
        * trained from conversational telephone speech, consisting of
        * more than 1,600,000 utterances of about 1,000 hours duration,
        * recorded from 32,950 Mandarin speakers
      * English
        * DNN (EN-DNN) uses the well-known Switchboard corpus,
        * consisting of the 
          * Switchboard-I training set and 
          * 20-hour Call Home English data
        * about 300-hours duration
    * for LID, using completely different multilingual training and test
    * data
  * DNN Configuration.
    * similar to that used for ASR
    * dimension of each layer, speparated by hyphen
      * 43 -2048 -2048 - D_DBF -2048 -2048 - D_out
    * The training process
      * pre-training
      * fine tudning: hogy jön bele a GMM?
* Relation to Existing Features
  * conventional SDC [13]–[15] and 
    * Shift Delta Cepstra (SDC)
      * bib
        * 13. Bielefeld B (1994) 
          * Language identification using shifted delta cepstrum. 
          * In: Proceedings of the 14th Annual Speech Research Symp.  
        * 14. Kohler MA, Kennedy M (2002) 
          * Language identification using shifted delta cepstra. 
          * In: Proceedings of the 45th IEEE ... on Circuits and Systems
        * 15. Torres-Carrasquillo PA, Singer E, Kohler MA, et al.. (2002) 
          * Approaches to language identification 
            * using Gaussian mixture models and shifted delta cepstral features. 
          * In: Proceedings of the Annual Conference of the ISCA
      * one of the most common acoustic features for spoken LID, 
      * an extension of MFCC and PLP
      * capture phonemic information over a longer time-span
      * a simple linear transformation 
        * of several concatenated delta cepstral blocks
      * optimal SDC parameters ... may vary with different LID tasks [14].
      * generally prone to ... speaker and channel variabilities
    * DBF
      * Similarity to SDC, 
        * takes the features extracted from concatenated frames as input. 
      * differently from SDC,
        * exploits long-term temporal information ... 
          * through a non-linear transformation
        * extracted with discriminative training
          * with the labeling information ... in the training corpus,
          * more robust to language-independent nuisance
        * a fusion of the middle-level representation 
          * between the high-level phonetic and low-level acoustic features.
  * recently proposed PLLR [32], [33]
* Proposed LID Systems Using DBF # TODO
* Total Variance 
  * first introduced in the context of speaker verification [24]
  * state-of-the-art ... both in speaker and language communities [25].
* DBF-TV
  * The TV modeling back-end consists of the following phases, 
  *   ! i-vector extraction, 
      * I-vectors are extracted via TV modeling approach, which is
      * motivated by the success of Joint Factor Analysis (JFA) for
      * speaker recognition task [43]
      * given 
        * an utterance, 
        * the GMM super-vector , 
          * which is created by stacking the mean vectors of a GMM
            * adapted to that utterance, can be modeled as follows (8) 
      * where m is the UBM super-vector
    * intersession compensation 
      * remove the nuisance in i-vectors
        * two ... techniques are applied
          * The first is linear discriminant analysis
          * within-class covariance normalization (WCCN), which
            * normalizes the cosine kernel between utterances 
              * with an inverse of the within-class covariance
    * cosine scoring
* PDBF-TV
  * is similar to PPRLM, 
    * which aims to take advantage of complementary acoustic models. 
  * having different DBF extractors as parallel acoustic front ends
  * early fusion and late fusion.
    * The early scheme conducts fusion at feature-level, ... before classification. 
    * The late fusion scheme acts at a decision-level, where 
      * the outputs of the mono DBF-TV systems are integrated 
        * by the use of an averaging criteria 

# Results and Discussion

* Experimental Setup
  * LID Database.
    * LRE09 dataset, comprising 23 target languages
    * for each language came from two different channels 
      * Conversational Telephone Speech (CTS) and 
        * Data from the previous evaluations conducted by NIST,
        * including LRE 1996, LRE 2003, LRE 2005 and LRE 2007. These
        * mainly collected from CallFriend, CallHome and Mixer databases
      * narrow band Voice of America (VOA) radio broadcasts
        * VOA partition: Most of the utterances are from the
        * NIST-provided datasets: VOA2 and VOA3.
  * Performance Measurement.
    * in LRE09, Three different metrics are used
      * average decision cost function (C_avg) [9], which is 
        * a measure of the cost of taking bad decisions
      * DET curves [46], which are 
        * represent the range of possible system operating points 
          * of detection systems and 
        * measure the system discrimination capability
      * the classical equal error rate (EER)
  * LID Systems.
    * for comparison are 
      * SDC-TV
        * acoustic
        * SDC are extracted as
          * 1) MFCC features are extracted for each 20 ms... 
          * 2) The SDC features comprise ... static and stacked MFCCs 
          * 3) The non-speech frames are gated out by 
            * using voice activity detection (VAD). 
          * 4) SDC features are normalized to a standard distribution. The
        * TV space is estimated using a GMM-UBM with ...
      * PPR-LM, which rely on 
        * phonotactic features
        * as described in Xu et.al. [27], 
        * with different PR frontends, i.e. 
          * BUT TRAPs/NN phone decoders for Hungarian (HU) and Russian (RU)
          * http://speech.fit.vutbr.cz/software/phoneme-recognizer-based-long-temporal-context
* Comparison with Baseline
* DBF Configurations
  * Temporal Window Size Investigation.
  * DBF Extractor Output Hidden Nodes Investigation.
* Performance of the Proposed PDBF-TV System
* Performance Comparison with State-of-the-Art

# Conclusions
