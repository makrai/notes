Speech analysis for health:
  Current SOTA and the increasing impact of deep learning
Nicholas Cummins; Alice Baird; Björn W. Schuller
Methods Volume 151, 1 December 2018, Pages 41-54

# Abstract

* acoustic-prosodic properties of a speech signal are modulated with a range of
  health related effects
* an active and growing area of machine learning research in speech and health

# 1 Intro

* paralinguistic states and traits eg emotional states or age and gender
  * intelligent signal analysis and machine learning techniques to recognise
    these different facets [1, 2, 3, 4]
* computational paralinguistic analysis to assess health conditions
  * complexity of speech production
  * importances of the physiological and cognitive systems involved
    (human) health and wellness – such as the respiratory system and the brain
    * slight changes in a speaker’s physical and mental state can affect their
      ability to control their vocal apparatus, often at a subconscious level
* active and passive remote sensing technology suitable for health conditions
* at the intersection of arguably two significant recent advances in computing
  * ie deep learning and ubiquitous computing
  * ubiquitous computing
    * embedding computational capability (generally microprocessors) into
      everyday objects to make them effectively communicate
    * minimizes the end user's need to interact with computers
* small size of collected datasets, it is debatable if the full advantages of
  * shared tasks for deep learning systems 
    * Computational Paralinguistics Challenge (ComParE) [6, 7, 8, 9, 10, 11]
    * Audio/Visual Emotion Challenge (AVEC) workshops [12, 13, 14, 15]
    * ComParE 2011: recognition of speech affected by intoxication or fatigue,
      * it was held before deep learning became SOTA in speech processing
    * 2017 almost two-thirds of entrants integrated some aspect of DL
      * feature representation learning, classification or both
* Internet-of-Things (IoT) means there is currently a vast array of
  * microphone enabled smart-devices and wearable technologies on the market,
    eg, the Apple WatchTM series, Samsung GearTM technology, or the Sony
    SmartWatchTM series
  * Voice-based applications for the remote monitor of speaker states & traits
    including health are becoming more conspicuous in the literat [17, 18, 19]
  * Smart monitoring technologies, based on deep learning and big data
    * role in and remote diagnosis of various health conditions

# how health states affect the muscular and cognitive procs in speech prod

# the major breakthroughs that kick-started current deep learning

# 4 DL approaches conducted on ComParE and AVEC health sub-challenge data

* publicly available datasets

## 4.3. Sleepiness (2011)

## 4.4. Intoxication (2011)

## 4.5. Pathologic speech (2012)

* pre and post Concomitant Chemo-Radiation Treatment (CCRT) for inoperable
  tumours of the head and neck [7]

## 4.6. Autism spectrum conditions (2013)

## 4.7. Depression (2013 & 2014)

## 4.8. Cognitive and physical load (2014)

## 4.9. Parkinson’s (2015)

## 4.10. Eating (2015)

* classify the type of food, or none, a speaker was eating [10]

## 4.11. Depression (2016 & 2017)

## 4.12. Cold and Flu (2017)

## 4.13. Snore (2017)

## ComParE-2018 challenge, which includes ‘state-of-mind’ and ‘abnormal heart'

* deep representation learning as a baseline system [159]
  * set using the auDeep toolkit [160] which utilises
  * recurrent sequence to sequence autoencoders to learn representations which
    take into account the temporal dynamics of time series data such as speech

# Opportunities and challenges associated with advancing remote deep learning
speech-based sensing technologies

* overfitting, A common reoccurring theme, not limited to deep learning
  * small and imbalanced datasets often use in the challenges (cf. Table 1)

## Inclusion of intelligent labelling paradigms

* Techniques [150]
  such as semi-supervised learning, active learning and cooperative learning
  have been shown to enhance recognition models in a range of speech tasks
* leverage a smaller set of labelled data to annotate a larger dataset with
  minimal human involvement
* in speech based classification tasks including emotion recognition
  * see [150] for a recent review
* Recent image classification research shows that
  the combination of semi-supervised learning in with few-shot networks can
  efficiently solve new learning tasks using only few training samples
  [151, 152]
* not tested yet in the speech-health domain

## Data augmentation

* Generative Adversarial Networks (GANS) [153, 154] can be used to
* generate new training data samples [155, 156]
* Promising results presented in [157]
* competitive performances when compared with more conventional classif [157]

## Data representation learning

* Conventional hand crafted features may not adequately capture the required
  variability
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
    * SVM based, classifier can be obtained by aggregating the training data
      from both corpora. Similarly results presented in
    * [162] combined learning of depression and affects for depression
      * a multitask LSTM-RNN paradigm
    * depression information aids the accuracy of deep regressors performing
      affect detection on AVEC-2014 data [163, 164]
    * Autoencoder and RNN based transfer learning system have been shown to aid
      speech-based emotion recognition [165, 166]
      * not tested yet in the speech-health domain 
* image: GANs are also explored for domain adaptation solutions, eg, [167]
  * core idea: an adversarial network to learn a mapping between two domains

# a brief conclusion

* two challenges have been won using a deep learning based approach:
  2015’s Parkinson’s condition sub-challenge [118] and 2017’s cold and flu
  * debatable given the results in [126] if the winning approach in 2015 was
    due to the deep learning approach or the
    post-processing speaker clustering method employed [118]
  * the majority of challenge participants still use very conventional feature
    extraction and classification paradigms
* A major reason for this is most likely the small database,
  * compared to other speech-tasks such as speaker and speech recognition
  * multiple samples from a single speaker, and
  * can be unbalanced in terms of samples per class
* future research topics in intelligent labelling, data augmentation,
  representation learning as well as multitask and transfer learning
  * hE considerable investment is needed in collecting truly large datasets.
  * The need for this data is twofold, firstly
    * to facilitate the true impact that deep learning solutions could make, and
    * to enable large scale clinical studies 
      * this second aspect would enable investigations into
        which recognition accuracies correspond to positive impacts in
        real-world healthcare situations 
* ubiquitous computing devices have the potential to
  * provide truly big data for researchers in the speech-health domain [168]
  * The combination of such data with current and next generation deep learning
    paradigms can foster a new generation of patient-driven healthcare devices
  * could offer the improvement of diagnostics, triggering of earlier
    interventions and discovery of more effective treatments [169, 170]
