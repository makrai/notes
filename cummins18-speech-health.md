Speech analysis for health: The SOTA and the increasing impact of deep learning
Nicholas Cummins; Alice Baird; Björn W. Schuller
Methods Volume 151, 1 December 2018, Pages 41-54

# Abstract

* acoustic-prosodic properties of a speech signal are
  modulated with a range of health related effects
* an active and growing area of machine learning research in speech and health

# 1 Intro

* paralinguistic states and traits eg emotional states or age and gender
  * intelligent signal analysis and machine learning techniques
    to recognise these different facets [1, 2, 3, 4]
* computational paralinguistic analysis to assess health conditions
  * complexity of speech production
  * importances of the physiological and cognitive systems involved
    * human health and wellness –> respiratory system and the brain
    * slight changes in a speaker’s physical and mental state can affect their
      ability to control their vocal apparatus, often at a subconscious level
* active and passive remote sensing technology suitable for health conditions
* at the intersection of two arguably significant recent advances in computing
  * ie deep learning and ubiquitous computing
  * ubiquitous computing
    * embedding computational capability (generally microprocessors) into
      everyday objects to make them effectively communicate
    * minimizes the end user's need to interact with computers
* datasets are small
  * shared tasks for deep learning systems
    * Computational Paralinguistics Challenge (ComParE) [6, 7, 8, 9, 10, 11]
    * Audio/Visual Emotion Challenge (AVEC) workshops [12, 13, 14, 15]
    * increase of deep learning
      * ComParE 2011: recognition of speech affected by intoxication or fatigue
        * it was held before deep learning became SOTA in speech processing
      * 2017 almost two-thirds of entrants integrated some aspect of DL
        * feature representation learning, classification, or both
* Internet-of-Things (IoT) means there is currently a vast array of
  * microphone enabled smart-devices and wearable technologies on the market,
    eg, the Apple WatchTM series, Samsung GearTM technology, or
    the Sony SmartWatchTM series
  * Voice-based applications for the remote monitor of speaker states & traits
    including health are becoming more conspicuous in the literat [17, 18, 19]
  * Smart monitoring technologies, based on deep learning and big data
    * role in and remote diagnosis of various health conditions

# 2 How health states affect the muscular and cognitive procs in speech prod

# 3 The major breakthroughs that kick-started current deep learning

# 4 DL approaches conducted on ComParE and AVEC health sub-challenge data

* publicly available datasets

## 4.1. Baseline systems

* reason for focusing this review on the ComParE and AVEC challenges is the
  presence of a transparent baseline system and associated scoring metrics
  * This property enables the use of straightforward comparisons to assess
    improvements, if any, offered through new approaches
  * hE no strict rule as to what constitutes a ‘good’ system performance
  * larger scale studies, potentially undertaken as part of a clinical trail,
    are required to establish what constitutes system performances suitable
    to deploy speech-based systems into clinical practices
* The baseline system for the majority of these works is set using a
  brute-forced feature extraction paradigm to create a single, yet high
  dimensional, acoustic representation of an utterance
  * First, various frame-level features, commonly refereed to as Low Level
    Descriptors (LLDs), are extracted from a speech utterance typically at
    frame rates of 25–40 ms, as at a frame rate of 10 ms
    * eg pitch, energy and spectral descriptors
  * Next functionals, such as moments, extremes, percentiles and regression
    parameters, are applied to each LLD to produce a set of utterance levels
    summaries
    * These statistical summaries are then concatenated together to form the
      single, but often high dimensional, feature representation of an
      utterance
* In all the ComParE and AVEC challenges the baseline sets are extracted using
  the OPENSMILE toolkit [44]. OPENSMILE provides software solutions to enable
  * a standard set of scripts is provided with OPENSMILE to enable users to
    replicate the feature representation used in the challenges
* Classification mainly with
  linear kernel Support Vector Machines (SVM)/Support Vector Regression (SVR)
  * because they are considered to be robust against overfitting
  * overfitting is a common issue when utilising small and unbalanced datasets
  * implemented in the open-source machine learning toolkit Weka [54]

## 4.3. Sleepiness (2011)

* ‘speech affected by fatigue’
  * sleepiness and cognitive load can be grouped under this umbrella term
* fatigue has no strict medical condition definition
  * core symptoms include a reduction in efficiency and motivation
  * degrades an individual’s performances and can lead to errors and,
    potentially fatal, accidents in many settings, such as on the road [55,56],
    or in the workplace [57]
* early and remote diagnosis of fatigue is therefore potentially lifesaving on
  the roads and in related transport industries such as aeronautical and
  freight [58]
* cognitive and physical aspects
  * notable effects on speech
  * impaired speech planning such as flattened prosody; effects include
    reduced intelligibility and
    tense and breathy qualities <~ irregular vocal fold actions [59]
* The challenge dataset was the Sleepy Language Corpus (Table 2)
  * 4368 dimensional acoustic feature representation, and was used in
    conjunction with Synthetic Minority Oversampling Technique (SMOTE)
    resampling [60], to account for class imbalances and
    a SVM to set a 2-class, ‘not-sleepy’ and ‘sleepy’,
    * development set UAR of 67.3% and test set UAR of 70.3% [6]
* GMMs & HMMs were SOTA classification techniques in speech proc until 2012 [61]
  * none of the challenge entrants were based on deep, or for that matter
    shallow, neural networks.  Indeed, the
  * winner of the sleepiness sub challenge used a MFCC based on a GMM-Universal
    Background Model-Maximum a Posteriori (UBM-MAP) supervector approach
    utilised in a 3-state left-to-right HMMs, with the resulting supervectors
    being classified using a SVM [62]
    * supervector formation, the interested reader is referred to [63,64]
    * UAR of 71.7%, representing a 3.1% percentage point improvement over the
      baseline system
  * an in-depth review of other approaches: [59]
  * no works had revisited this corpus and attempted to improve on the
    challenge winning score using deep learning

## 4.4. Intoxication (2011)

## 4.5. Pathologic speech (2012)

* pre and post Concomitant Chemo-Radiation Treatment (CCRT) for inoperable
  tumours of the head and neck [7]

## 4.6. Autism spectrum conditions (2013)

## 4.7. Depression (2013 & 2014)

* Major Depressive Disorders (MDD) are a growing global health concern
  * 322 million individuals worldwide living with depression [91] and that the
  * increased by 18.4% between 2005 and 2015 [92]
* Speech, as well as other behavioural and physiological signals, as objective
  markers to aid depression detection [3,93]
* Both the 2013 and 2014 Audio-Visual Emotion Challenges (AVEC) included
  self-reported depression as scored by the Beck Depression Index II (BDI-II)
  [94], from a given audiovisual clip [12,13]
  * Both challenges corpora are based on a subset 150 files taken from the
    Audio-Visual Depressive Language Corpus (AViDCorpus) 1
  * audio baseline feature set for both challenges consisted of 2 268 features
    and the classifier was a SVR
  * metric for both challenges was the RMSE over all sequences
  * audio RMSE dev/test baselines for AVEC-2013 were 10.75/14.12; the corre-
    * AVEC-2014 were 11.52 and 12.57
  * participants
    * None in either of the challenges, utilised deep learning approach
    * audio-only, visual-only and audiovisual systems
    * Both challenges were won by teams from Lincoln Lab, Massachusetts [95,96]
      * highly knowledge driven, exploiting a specifically designed feature
        space which captured coordination across articulators and a purpose
        built Gaussian staircase regressor. Their
      * lowest AVEC-2013 RMSE was 8.50, and the lowest test set RSME of their
        AVEC-2014, which also included visual information, was 8.12
* a more in depth review of both challenges: [3]
* there has been no speech and deep learning approaches on either corpora
* recent research in predicting depression scores using deep vision
  * Zhu+ [97]
    * a dual CNN structure to exploit both facial appearance and dynamic info
    * a lowest AVEC-2014 test set RMSE of 9.55
  * Kang+ [98], used the AVEC-2014 data to re-tune the VIPLFaceNet network, a
    10-layer CNN with 7 convolutional layers and 3 fully-connected layers
    * RMSE of 9.43

## 4.8. Cognitive and physical load (2014)

* recognition of speakers cognitive and physical load in speech [9]
* datasets
  * Cognitive Load with Speech and EGG (CLSE) database (cf. Table 6) and the
  * Munich Bio-voice Corpus (MBC) (cf. Table 7)
* High cognitive load and mental fatigue is strongly associated [with?]
  increasing demands on working memory and impaired mental performances [56,99]
  * increased articulation rate, an increase in the number of filled pauses,
    and a reduction in formant vowel space area are commonly reported [99]
* Physical fatigue on the other hand, is a reduction in muscle power & movement
  * key symptom is impaired co-ordination [56]
  * there are strong links between changes in heart-rate and changes in
    prosodic and voice quality (glottal) features [48,100]
* The baseline was again set with the 6373 dimensional ComParE-2013 feature set
  * The official baseline scores for the cognitive load sub-challenge were
    63.2%/61.6% for the development/test partition
  * While for the physical load challenge development and test set UAR’s were
    67.2% and 71.9% respectively [9]
* Both challenges had two entrants using DNN based approaches [101,102], as
  well as a DNN based representation learning paradigm [103]
  * Gosztolya+ [101,102] proposed and developed a Deep Rectifier Network (DRN)
    approach which utilised rectified linear units (ReLU)
    * test set UAR of the proposed DRN is 63.05%, representing
      a slight improvement on the baseline
  * winning UAR of 73.9%, achieved by fusing four i-vector based systems which
    utilise different low-level feature representations [104]
    * i-vector paradigm: refer to [105,106]
  * the gulf in system performance between the DNN system presented in [101]
    and the challenge winner could be due in part to the small amount of data
    in the cognitive load corpora

## 4.9. Parkinson’s (2015)

## 4.10. Eating (2015)

* classify the type of food, or none, a speaker was eating [10]

## 4.11. Depression (2016 & 2017)

* task revisited (cf. 4.7) in The AVEC series in 2016 and 2017 [14,15]
* Both challenges utilised the
  Distress Analysis Interview Corpus – Wizard of Oz (DAIC-WOZ) database of
  193 clinical interviews designed to support the diagnosis of
  psychological distress conditions such as depression
* 2016
  * task: for AVEC-2016 [14], the challenge was a
    2-class multimodal level of severity (high/low) task, based on the patients
    Patient Health Questionnaire (PHQ)-8 depression index score [127]
    * Fig. 3: score distribution of the DAIC-WOZ data
    * features: The challenge organisers provided extracted video features (for
      ethical reasons the raw video could not be shared), audio files and
      transcription of the interviews
  * imbalance in training data (4:1 ‘notdepressed’ to ‘depressed’)
  * audio baseline feature representation was realised using
    a set of prosodic, voice quality and spectral LLDs extracted from the
    Collaborative Voice Analysis REPository (COVAREP) Matlab toolbox [128]
    * SVM classification, with
      majority voting used to produce one single depression label per file
  * metric: F1 score for the ‘depressed’ class
  * Using this method, the
    development score was 0.46 (0.68, for ‘not-de- pressed’) and the
    test set score was 0.41 (0.58, for ‘not-depressed’)
  * contestants in 2016
    * the only deep learning approach was the DEPAUDIONET E2E system [129]
      * feed Mel Spectrum features into an E2E network comprising a feature
        extraction topology of; a onedimensional convolution layer, a batch
        normalization layer, a ReLu layer, a one-dimensional max-pooling layer
        and a dropout layer; this is then followed by a LSTM layer and two fully
        connected layers
      * To help overcome imbalance issues: random down sampling of the non
        depression class when creating their mini-batch samples 
      * outperformed the baseline approach on development set 0.52 (0.70, for
        ‘not-depressed’); however, no test set score was given in the paper
        [129]
    * winning entrant utilised a gender-dependant multi-modal decision tree ap-
      proach, gaining a test set score of 0.57 (0.88, for ‘not-depressed’) [130]
* The AVEC-2017 depression sub-challenge required participants to predict
  * from multimodal audio, visual, and text data
  * target: PHQ8 score of each patient in the DAIC-WOZ corpus [15]
  * baseline audio system was again based on COVAREP features, however this was
    in conjunction with a Random Forest regressor
  * metric was RMSE, as in AVEC-2013 and AVEC-2014 (cf. 4.7)
    * audio development set and test set RMSE’s being 6.74 and 7.78 resp
* contestants
  * two papers explored CNNS
    * both lead by Le Yang of Northwestern Polytechnical University
  * [131] system fed ComParE-2013 features into a CCN trained to predict PHQ8
    * After training the CNN,
      the weights were frozen and the last layer removed
    * The output of the remaining fully connected layer was then fed into a new
      DNN which was trained using the CNN features
    * 4 systems; a combination of gender specific models for ‘depressed’ and
      ‘not-depressed’ classes
    * outputs of these four systems were then fused (also with outputs of
      similar systems from the video and text modalities) via multivariate
      linear regression
    * To alleviate imbalance issues: data expansion technique in which the
      * cutting longer depressed segments into multiple chunks to artificially
        create more depression data instance, albeit with the same labels
    * development set RMSE of 6.62, which was below the provided baseline; only
      audio-visual fusion RMSE were given for test set, with the lowest
      reported value being 5.40
  * [132], the same CNN-DNN set up but downsampling methodology during training
    presented in [129] for the ‘not-depressed’ class
    * only gender dependent models (not class specific as well) were trained
    * No audio only scores directly comparable with the baseline are given in
    * The audio-visual approach achieved a RMSE of 5.97. For the interested
  * a unification of both CNN approaches is presented in [133]
  * The winning approach [134] exploited the patient interview transcripts to
    identify salient topics and segments
    * random forest regression on the baseline audio and visual features
      corresponding to these segments
    * augmented with semantic features, which were manually extracted using the
      Linguistic Inquiry and Word Count (LIWC) text analysis program [135]
    * The combined approach utilising acoustic, visual and semantic features
      produced the winning RMSE of 4.99

## 4.12. Cold and Flu (2017)

* four systems were presented as a baseline:
  * the ComParE2013 feature set together with a SVM
  * a Bag-of-Audio-Words (BoAW) approach, for details see [137], which
    quantised the ComParE2013 LLD’s into a sparse histogram-of-occurrences
    representation, 64.2% development and 67.3% for test;
    * 137 M. Schmitt, B. Schuller
      openXBOW – Intro the Passau open-source crossmodal bag-of-words toolkit
      J. Mach. Learn. Res. 18 (2017) 5 pages
  * an E2E topology of two convolutional layers and one LSTM layer, operating
    directly on the raw audio waveform 59.1% development and 60.0%; and
    * The challenge organisers speculate that
      the weaker performance of the E2E model was due to the imbalance in the
      training data towards the healthy condition, approximately 8:1 [11]
    * E2E models rely purely on the statistics of the available data to learn
  * a majority vote fusion of these approaches which returned the official
    baseline test set score of 71.0%

## 4.13. Snore (2017)

* The same four baseline approaches as per the cold sub-challenge (cf.  4.12),

## ComParE-2018 challenge, which includes ‘state-of-mind’ and ‘abnormal heart'

* deep representation learning as a baseline system [159]
  * set using the auDeep toolkit [160] which utilises
  * recurrent sequence to sequence autoencoders to learn representations which
    take into account the temporal dynamics of time series data such as speech
* this challenge is mentioned only in Sec 5

# 5 Opportunities and challenges for remote deep learning speech-based sensing

* overfitting, A common reoccurring theme, not limited to deep learning
* small and imbalanced datasets often used in the challenges (cf. Table 1)

## Inclusion of intelligent labelling paradigms

* some techniques [150] enhance recognition models in a range of speech tasks
  * eg semi-supervised learning, active learning and cooperative learning
* leverage a smaller set of labelled data to annotate a larger dataset with
  minimal human involvement
* in speech based classification tasks including emotion recognition
  * see [150] for a recent review
* Recent image classification research shows that
  the combination of semi-supervised learning with few-shot networks can
  efficiently solve new learning tasks using only few training samples
  [151, 152]
* not tested yet in the speech-health domain

## Data augmentation

* Generative Adversarial Networks (GANS) [153, 154] can be used to
* generate new training data samples [155, 156]
* Promising results presented in [157]
* competitive performances when compared with more conventional classif [157]

## Data representation learning

* Conventional hand crafted features may
  not adequately capture the required variability
* Deep representation and E2E learning have the potential
* determine highly abstract, thus more robust, representations
* Non-deep approaches, such as BoAW [137], highlight the potential of repr lear
  * BoAW has achieved the SOTA for emotion prediction in particular [158] and
    is now a ComParE baseline system [11, 159]
* SOTA performance using the deep spectrum features for snore sounds [147]

## More multitask and transfer learning

* relationship between health conditions discussed in this review
  * either a direct, ie, they are co-morbid, or have an indirect relationship
  * eg increased fatigue is a core symptom of depressive disorders [94]
* Mutlitask learning and transfer learning approaches have the potential to
  * exploit commonalities to create a more robust system [150]
  * Inter-relationships between the sleepiness (sec 4.3) and intoxication (4.4)
    datasets were explored in [161]
    * SVM based, classifier can be obtained by
      aggregating the training data from both corpora
    * [162] combined learning of depression and affects for depression
      * a multitask LSTM-RNN paradigm
    * depression information aids the accuracy of deep regressors performing
      affect detection on AVEC-2014 data [163, 164]
    * Autoencoder and RNN based transfer learning system have been shown to aid
      speech-based emotion recognition [165, 166]
      * not tested yet in the speech-health domain
* image: GANs are also explored for domain adaptation solutions, eg, [167]
  * core idea: an adversarial network to learn a mapping between two domains

# A brief conclusion

* two challenges have been won using a deep learning based approach:
  2015’s Parkinson’s condition sub-challenge [118] and 2017’s cold and flu
  * ? winning approach in 2015 was due to the
    post-processing speaker clustering method employed [118]
    * given the results in [126], rather than deep learning
  * the majority of challenge participants still use
    very conventional feature extraction and classification paradigms
* A major reason for this is most likely the small database,
  * compared to other speech-tasks such as speaker and speech recognition
  * multiple samples from a single speaker, and
  * can be unbalanced in terms of samples per class
* future research topics in intelligent labelling, data augmentation,
  representation learning as well as multitask and transfer learning
  * hE considerable investment is needed in collecting truly large datasets
  * The need for this data is twofold
    * to facilitate the true impact that deep learning solutions could make,
    * to enable large scale clinical studies
      * this second aspect would enable investigations into
        which recognition accuracies correspond to
        positive impacts in real-world healthcare situations
* ubiquitous computing devices have the potential to
  * provide truly big data for researchers in the speech-health domain [168]
  * The combination of such data with current and next generation deep learning
    paradigms can foster a new generation of patient-driven healthcare devices
  * could offer the improvement of diagnostics, triggering of earlier
    interventions and discovery of more effective treatments [169, 170]
