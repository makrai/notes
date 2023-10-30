Categorical vs Dimensional Perception of Italian Emotional Speech
Emilia Parada-Cabaleiro, G Costantini, A Batliner, A Baird, BW Schuller
Interspeech 20182-6 September 2018, Hyderabad

# Abstract

* Culture and measurement strategies are influential factors when
  evaluating the perception of emotion in speech
* hE multilingual databases suitable for such a study are missing
  * no agreement on the most suitable emotional model (in the contxt of percep)
* we present EmoFilm, a new multilingual emotional speech corpus
  * 1115 English, Spanish, and Italian emotional utterances
    from 43 films and 207 speakers
* eval: within-culture categorical vs dimensional perceptual evaluation,
  employing 225 native Italian listeners, who evaluated the Italian section
  * emotional states of anger, sadness, happiness, fear, and contempt
* the emotional model (categorical or dimensional), taken as reference for
  measurement, influences a listener’s perception of emotional speech
  * especially for some emotions, eg contempt
  * to what extent are both models complementary
* The confusion patterns typical of a categorical evaluation are
  not always mirrored by the dimensional assessment

# 1 Intro

* basic emotion categories have been thought to be universal [1]
  * expressed and perceived similarly across cultures
  * disagreement
    * the specific emotions that are known as basic [2], and
    * the extent to which culture can impact expression and perception [1]
  * emo perception in foreing language
    * accuracy in the perception of non-native emo speech is > by chance [3]
    * emotional state identific accuracy is substantially higher in native [4]
    * this has been explained by the level of proximity, ie similarity,
      between the culture of the listener and that of the encoder [5]
    * the measurement strategy considered to evaluate listeners’ perception of
      emotion could also influence their responses, since
      different subjects of the same culture may have diverse predispositions
      towards one model or another [6]
    * research on the suitability of the two main emotional models [7, 8, 9],
      ie the categorical [10] and the dimensional [11] model, no agreement
* We present EmoFilm, a multilingual emotional speech corpus
  * 1115 utterances extracted from Italian, Spanish, and English films
    * original English, dubbed Italian and Spanish versions
    * almost fully balanced distribution of speakers, utterances, and emotions
* within-culture evaluation of the Italian part of the dataset,
  we contrasted categorical vs dimensional perception in three experiments with
  a total of 225 native Italian listeners
  * the extent to which categorical and dimensional assessments are complem

# 2 related work

## 2.1. Emotional model: Categorical vs Dimensional

* evaluating the perception of emotional speech, the two models mainly
  * categorical (identifies emotions as discrete classes) [10], and
  * dimensional (places them in a continuous hyper-space characterised by
    different ‘dimensions’— mostly arousal and valence) [11]
* categorical
  * The measurement strategy is the forced-choice test, as this
    * minimises the spread of the responses; yet
    * its accuracy may relate more to a ‘discrimination’
      than to a ‘recognition’ task [12]
    * To deal with this risk,
      * additional emotional labels not represented in the
        evaluated utterances such as ‘neutral’ or
      * other emotional states (so called distractor labels) [13]
  * suggested that listeners’ perception of emotional speech is categorical [7]
  * model criticised for the one-to-one corresp between categories and emotions
  * difficult to identify ambiguous emotional states, ie made up of different
    emotions manifested simultaneously [9]
    * aka mixed or non-prototypical emotions would mostly depend on an
      evaluation based on the use of a minimal set of categories
* dimensions
  * a reduced set of dimensions faces similar problems [14]
  * the typical dichotomous representation of the dimensional model, ie arousal
    and valence, has also shown to be
    * insufficient for discrimination between basic emotional states, such as
      anger and fear [15], leading to
      => great overlap in the perception of mixed emotions [16]
  * alternative dimensions, eg potency [8] or interaction [17]
    * suggested that at least four dimensions might be necessary, yet still not
      sufficient to discriminate between related non-prototypical emotions, eg
      shame, guilt, and embarrassment [18]

## 2.2. Emotional speech: Multilingual corpora (available for research)

* biase towards some languages such as English [19]
  * eg Russian [20] is under-represented
  * multilingual datasets are quite uncommon [19]
    => machine learning is often forced to consider different monolingual
    corpora for training and evaluation [21]
    * might be valuable for robust development and real-world applications
      [22, 23]
* unbalanced distribution across speakers, utterances, and emotions
  may limit the performance of experimental techniques and bias results
* multilingual datasets, based on several types of speech, including
  * acted emotional speech [4], natural [24], or speech gathered in so-called
    Wizardof-Oz experiments [25]
  * only a few cross-lingual and cross-cultural databases exist
* Multilingual film replicas are still rare [26] and
  * they focus on single films and by that, on few of speakers and emotions

# 3 the dataset

## 3.1. Emotional speech from films

* Acted emotional speech has acoustic profiles more intense than natural [27]
  * critisised for not being natural enough [28]
    * Shakespeare’s theory of acting: an intense repr of true reality [29]
  * culturally prescribed rules influence emotional expressions in order to
    adequately handle social situations [30]—which can result in hiding or
  * Acting techniques such as the Stanivslavsky method [31] claim to guarantee
    the validity of acted emotions as they are based on self-induction
  * the extent to which acted speech are realistic expressions of emo: unclear
  * especially from a cross-cultural perspective: Culture influences
* emotional speech databases from films have been collected
  * predominantly in English [32, 33, 34, 35, 21]; only rarely, other languages
  * Turkish [36]
  * Multilingual databases from films have scarcely been collected [26], and
  * Italian not yet considered

## 3.2. Corpus description

* 43 films (from 1993–2009, English originals), were selected 
  * genres including comedy, drama, horror, and thriller
  * Sequences with emotional content were chosen (collected under
    creative-commons) and segmented
  * audio in wave mono format (48 kHz sample rate and 16-bit)
* emotion inventory: we started with the so-called ‘big six’,
  * ie the basic emos: anger, sadness, happiness, fear, surprise, disgust [10]
  * Surprise and disgust could be found rarely in films [32] => excluded
  * contempt is more freq => included as a basic emotion too [37]
* The same utterances (447 by females) have been extracted for en, it, and sp
  * English (EN) produced by English actors in the original version, and
  * over-dubbed versions by Italian (IT) and Spanish (SP)
  * a total of 2,848 utterances
* clip selection
  * 1st manually by two affective computing researchers,
    rejecting clips affected by background noise and/or music
  * pre-test was conducted employing 10 Italian listeners who evaluated the
    whole database; we rejected all clips with a rater-agreement lower than 6
    => reference (‘gold standard’)
    * the same sentence may be considered as emotional in one language but not
      in another; thus, the number of utterances is not the same across the
      three languages
  * the same dubbing actor can dub more than one original actor in diff films,
    => the number of actors in IT and SP is mostly lower than in EN
    * 207 speakers: 94 females (35 EN, 35 IT, and 24 SP) and
      113 males (44 EN, 36 IT, and 33 SP)
  * 1115 clips with a mean length of 3.5 sec. (std 1.2 sec.)

|lang |clip |femail | utter per emo |
|-----|-----|-------|---------------|
| en  | 360 | 182   | 34.3 (std 6)  |
| it  | 413 | 190   | 41.3 (std 6.8)|
| sp  | 342 | 165   | 35.9 (std 9)  |

* The higher number of IT clips might be due to
  * Italian being a more ‘emotionally expressive’ language
  * pre-test made by Italian listeners, who may be better at perceiv IT emo

# 4 results of the perceptual study

## 4.1. Listening test design

* Emotional Italian speech is under-researched [38, 39], thus
* we start with a within-culture evaluation of the EmoFilm dataset by
* the extent to which measurement strategies might influ the percep by natives

### T. 1. Five-level rating-scale dimensional test (151 listeners, VA, 0..4)

### T. 2. Forced-choice categorical test with ‘real’ labels (151 listeners)

* anger, sadness, happiness, fear, and contempt;
=> there is a one-to-one correspondence between the emotions of the corpus and
the reference labels of the test

### T. 3. Forced-choice categorical test with ‘distractor’ labels (74 listen)

* two ‘distractor’ labels—surprise and neutral
* perception tests were performed using a computer-based interface
  (developed in the visual programming tool Max MSP1)
* 225 Italian native listeners, who evaluated the Italian emotional speech of
  the database, ie 413 emotional utterances
* T. 1 and T. 2 were performed together in the same perceptual session by 151
  listeners (48 females), age between 19 and 42 years (mean 21.2, std 2.7)
  * To avoid categories becoming anchors, for each utterance the listeners
    first did the dimensional and then the categorical annotation
* T. 3 was done by 74 listeners, different from those who participated in T1&2
  (40 females); age was between 20 and 26 years (mean 21.3, std 1.3)
* The subjects were all students of engineering and obtained credits
* In order to prevent listeners’ fatigue,
  each test was divided into 4 sessions, of around 100 utterances each
  (T. 1 and T. 2 lasting together around 80–90 min; T 3 around 45–50 min), with
  * different randomisation of the utterances for each listener

## 4.2 Results and discussion

* we will start with analysing T. 2 and T. 3, followed by T. 1
  * As our dimensional evaluation relates to the categorical results from T. 2
* From now on, when we refer to the
  * gold standard, ie the emotion assigned to an utterance by at least 6 out of
    10 Italian evaluators, we use upper-case, eg ANGER (AN)
  * emotion category perceived by our listeners in eg T. 2: we will use
    lower-case, eg anger (an)

# 5 conclusions and future work

* expression of emotions seems to relate to gender
  * eg fear is prominently misclassified as
    sadness for female speakers; contempt as anger and happiness for male
  * hE This categorical finding is dimensionally supported only for valence in
    the confusion pattern contempt vs happiness
    => the measurement strategy influences listeners’ evaluation
* For the categorical model, a decline in accuracy with distractor labels,
  => the accuracy of this model relates to this
  * when you include irrelevant ones, you will get these as well
