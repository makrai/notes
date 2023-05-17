A multi-modal open dataset for mental-disorder analysis
Hanshu Cai, Zhenqin Yuan, Yiwen Gao, Shuting Sun, Na Li, Fuze Tian,+ 
Scientific Data volume 9, Article number: 178 (2022) Cite this article

# Abstract

* mental disorder patients, especially depression patients
  * leading contributor to the global burden of disease
  * explore new possible physiological indicators of mental disorder
* We present a multi-modal open dataset for mental-disorder analysis
  * EEG and recordings of spoken language data from clinically depressed
    patients and matching normal controls, who were carefully diagnosed and
    selected by professional psychiatrists in hospitals
  * EEG dataset includes data collected using a traditional 128-electrodes
    mounted elastic cap and a wearable 3-electrode EEG collector for pervasive
    computing applications. The 128-electrodes EEG signals of 53 participants
    were recorded as both in resting state and while doing the Dot probe tasks;
    the 3-electrode EEG signals of 55 participants were recorded in
    resting-state; the
  * Chinese audio data of 52 participants were recorded during
    interviewing, reading, and picture description.
    
# Background and Summary

* Recordings of spoken language are another non-invasive accessib physiological
  * Harati+ 7 built their predictive model on top of emotion-based features to
    help clinical management decisions during Deep Brain Stimulation treatment
    of major depressive disorder patients
  * Cummins+ 8 studied speech-based depression classification using gender
    dependant features and classifiers and revealed gender differences in the
    effect of depression on vowel-level formant features
  * Williamson+ 9 proposed an algorithm that estimates the articulatory
    coordination of speech from recordings of spoken language and uses these
    coordination features to learn a prediction model to track depres severity
* good-quality data is essential for their analysis results
  * participants have to be adequately diagnosed by professional doctors, not
    by self-rating scales
  * data has to be collected before patients taking any medication since the
    * medication will change brain activity
  * experiment requires full cooperation from the participants, who are depres
    * One of the symptoms of major depressive disorder patients is the lack of
      motivation to do anything. Therefore, it is tough to ask patients to
    * experiment process could last hours.
* we present a multi-model open dataset for mental-disorder analysis
  * data mainly from clinically depressed patients and matching normal
  * At this stage, only electroencephalogram (EEG) and recordings of spoken
    language recording data are made publicly available
* The recordings of spoken language data have been used in Liu’s study
  * Liu+ proposed a new speech segment fusion method based on decision tree to
  * recognition accuracy is 75.8% and 68.5% for males and females,

# Methods

## Experimental material

### Recordings of spoken language experiment

* In the design of the experiment,
  two factors were examined: speaking style and emotional valence
  * Speaking style: interview, word reading, and picture description. Each of
  * three kinds of emotional valences: positive, neutral, and negative
  * The order of speech with different emotional valences was assigned randomly
    to counteract the sequence effect
  * The language of the experiment was Chinese
* The interview had 18 questions from DSM-IV23, HRSD26, and other scales.
* Reading comprised two groups of words
  * each group has ten common Chinese words that came from affective ontology
    corpus27 and Chinese sentimental words extremum table (Zhang J+ 2010)
* The picture description contained three facial expression pictures, which
  were from the Chinese Facial Affective Picture System (CFAPS)29. More details
