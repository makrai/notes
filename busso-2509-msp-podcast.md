The MSP-Podcast Corpus
C Busso, R Lotfian, K Sridhar, A N. Salman, W Lin, L Goncalves,
  S Parthasarathy, A Reddy Naini, S Leem, L Martinez-Lucas, H Chou, P Mote
IEEE Transactions on Affective Computing submission arXiv:2509.09791 [eess.AS]

* large, high-quality emotional speech databases is essential for advancing
* limitations in size, emotional balance, and speaker diversity. This study
* MSP-Podcast corpus, summarizing our ten-year effort. The corpus consists of
* 400 hours of diverse audio samples from various audio-sharing websites, all
  * Common Licenses that permit the distribution of the corpus. We annotate
* labels, including 
  * primary (single dominant emotion) and 
  * secondary (multiple emotions perceived in the audio) emotional categories,
  * emotional attributes for valence, arousal, and dominance. 
  * $\ge$ five raters annotate these emotional labels. The corpus also has
  * speaker identification for most samples, and 
  * human transcriptions of the lexical content of the sentences for the
* The data collection protocol includes a machine learning-driven pipeline for
  selecting emotionally diverse recordings, ensuring a balanced and varied
  representation of emotions across speakers and environments. The resulting

| Corpus                              | Size | #spk | Size    | #Spkr   | Type               | Language           |
|-------------------------------------|------|------|--------:|---------|--------------------|--------------------|
| MSP-PODCAST 2.0 (this paper)        | ✓    | ✓    | 407h    | xxx     | Spontaneous        | English            |
| Dusha [20]                          | ✓    | ✓    | 346h36m | 8,308   | Acted, Spontaneous | Russian            |
| Crowdsourcing Emotional Speech [21] | ✓    | ✓    | 187h    | 2,965   | Spontaneous        | English            |
| BIIC-Podcast [15]                   | ✓    | x    | 147h26m | Unknown | Spontaneous        | Taiwanese Mandarin |
| MIKU-EmoBench [22]                  | ✓    | x    | 131h12m | Unknown | Spontaneous        | Multiple           |
| CMU-MOSEAS [23]                     | ✓    | ✓    | 68h49m  | 1,645   | Spontaneous        | Multiple           |
| CMU-MOSEI [24]                      | ✓    | ✓    | 65h53m  | 1,000   | Spontaneous        | English            |

* Fig. 2. Histogram showing the distribution of speaking turn durations
* Fig. 3. Histogram showing the number of files in the MSP-Podcast 2.0 corpus
  by the number of valid annotations. Each file has at least five annotations.

# V. Organization and Sharing of the Corpus

## A. Partitions

* TABLE VI.  Emotional class distribution for each partition (267,905 turns)

| Emotion     | Train  | Dev.  | Test1 | Test2 | Test3 | All    |
|-------------|--------|-------|-------|-------|-------|--------|
| Anger       | 22,609 | 5,728 | 1,476 |   538 |   400 | 36,260 |
| Contempt    | 2,765  | 6,985 | 1,040 |   304 |   400 | 5,985  |
| Disgust     | 1,324  | 1,476 |   534 |   141 |   400 | 3,143  |
| Fear        |   794  | 1,040 |   744 |   116 |   400 | 1,943  |
| Happiness   | 37,048 | 7,487 | 2,351 | 2,801 |   400 | 58,684 |
| Neutral     | 51,149 |10,948 | 8,318 | 6,793 |   400 | 79,117 |
| Sadness     | 18,256 | 8,318 | 3,041 |   581 |   400 | 24,629 |
| Surprise    | 3,220  |12,457 | 1,025 |   394 |   400 | 6,245  |
| Other       | 1,746  | 2,351 | 1,019 |   277 |   0   | 3,719  |
| No agreement|30,279  | 3,041 | 6,518 | 2,877 |   0   | 48,180 |
| **Total**   |169,190 |34,399 |46,294 |14,822 | 3,200 |267,905 |

* class imbalance observed with each split is proportionally consistent with
  the class distribution across the whole dataset,
  except for test 2 and test 3, as explained later in this section. A key
  * three test sets, which have different characteristics. The 
  * test 1 set has approximately 17.2% of the corpus collected from 465
    speakers (Table VI).
    * Table III shows inter-evaluator agreements very similar to entire corpus.
  * test 2 set was collected without the retrieval-based protocol presented in
    * An early feedback we received:
      machine learning models may bias the selection of speaking turns. 
      We mitigate this issue by utilizing 
      over 48 criteria based on different SER formulations, trained on
      different databases, features, and modalities, as 
      * explained in Section III-C. In response to this problem, 
      * we also created the test 2 set. We
    * 117 podcasts for this set, annotating all the speaking turns that
      satisfy our requirements, except the emotion retrieval step (Figure 1).
    * higher proportion of neutral (around 45.8% – Table VI). This test set
    * 112 known speakers. An observation from this set in Table III is the
    * lower inter-evaluator agreement compared to other partitions
      since neutral speech tends to be more uncertain [91].
  * test 3 set comprises 3,200 speaking turns, with a 
    * balanced representation based on primary categorical emotions (Tab VI).
    * 428 speakers. We are 
    * not releasing the emotional labels, transcriptions, or speaker info
    * Early versions of this test set were successfully used for SER challs
      (Odyssey 2024 [60] and Interspeech 2025 [84]).  We have developed a
      * website-based interface for research groups to submit their results
        for classification of primary emotions and prediction of emo attribs
      * leaderboard for each of these two SER formulations, which are
        automatically updated with the results of new submissions. Notice that
    * the balance of emo classes resulted in higher inter-eval agree (Tab III)
  * The development set has 12.9% of the corpus (Table VI), and its purpose is
    * 704 speakers, which are not included in either the test sets or the train
  * training set includes recordings of the remaining 2,220 speakers and the
    speaking turns with unknown speakers. The partitions 
    * aim to be speaker-independent, although 
    * some unknown speakers in the training set may overlap with dev or test
  * there is speaker overlap between test sets (e.g., data from some speakers
    are included in both test 1 and test 2 sets).

# VI. Baseline

* pre-trained SSL models built on WavLM [92], Wav2vec 2.0 [93], or HuBERT
  [94]. These models contain 
  * 24 transformer layers and are comprised of ∼310M parameters. We utilized
    the pre-trained off-the-shelf models from Hugging Face [48]. As evidenced
    in previous studies [55], [57], [60], [95], [96], fine-tuning pre-trained
    SSL models for SER can lead to a significant performance boost. For
* categorical emotion recognition, we fine-tuned the models on eight emotion
  classes using focal loss, with a simple two-layer fully connected head. For
* attribute prediction, we adopted a staged fine-tuning strategy: 
  * first, adapting SSL models using concordance correlation coefficient (CCC)
    loss to predict valence, arousal, and dominance, and
  * then jointly training with categorical classification using focal loss.
  * After the fine-tuning stage, for attribute-based predictions, we employ a
    single-task setup, where we train a separate regression model for each of
    the three emotion attributes, while keeping the SSL encoder frozen and
    updating only the head. We fine-tuned both models for 20 epochs, with a
    learning rate of 1e-5, a batch size of 32, and the Adam optimizer.
* tab VII: consistent improvements across all test partitions compared to the
  previous MSP-Podcast v1.12 release, highlighting the benefit of expanding
  the training set and removing low-agreement labels
  * on SERB [84], these refinements translated into ∼8% relative gains over
    the earlier baselines. 
  * WavLM generally outperformed both wav2vec2 and HuBERT
    in both categorical and attribute tasks. The 

* Table VII. Baseline perf. for categorical emotion recognition and emo attrib

| Model        | Test1 F1-Ma | Test1 F1-Mi | Test2 F1-Ma | Test2 F1-Mi | Test3 F1-Ma | Test3 F1-Mi |
|--------------|-------------|-------------|-------------|-------------|-------------|-------------|
| WavLM        | 0.297       | 0.394       | 0.206       | 0.280       | 0.356       | 0.373       |
| Wav2vec 2.0  | 0.238       | 0.325       | 0.156       | 0.166       | 0.289       | 0.316       |
| HuBERT       | 0.285       | 0.390       | 0.192       | 0.264       | 0.344       | 0.361       |

# VII. Discussion

* diversity in speakers, emotions, and environments.
* Wagner+ [57] and Naini+ [96] demonstrated that
  finetuning SSL models such as WavLM with emotional data is beneficial for
  SER tasks. This corpus is sufficiently large to support effective finetuning,
* a stronger starting point for models tailored to a specific domain where
  less annotated data may be available. This database unlocks a range of novel
  opportunities.  We focus here on highlighting a few notable ones.

## A. Perception of Emotions

With 1,446,224 annotations from 13,278 workers, this corpus is well-suited for
studying human emotion perception. 
* We are releasing all individual annotations, along with the 
  timestamps indicating when each annotation was completed. This information
* allows eg investigation of the priming effect [97], [98] The sequential
* can also support preference learning strategies, where 
  direct comparisons are used to establish relative labels (e.g., one speaking
  turn is more positive than another) [99].

## B. Robustness to Environments

* speech models that are robust to multiple environments. 
* MSP provides a perfect resource for evaluating 
* We highlight two prominent efforts in this area. 
* Leem+ [61] recorded an early version of the MSP-Podcast corpus by playing
  the speaking turns and radio noise in a single-walled sound booth (release
  1.8). The microphone and the speaker were strategically placed at different
  locations to achieve target SNRs. This noisy version of the corpus has been
  extremely useful to explore robust SER models [101]. The second effort is
* Grageda+ [102], [103] recorded a noisy version of the MSP-Podcast corpus in
  the context of human robot interaction (HRI) (test1 of release 1.9). The
  microphone was mounted on a robot, which moved, changing the relative
  distance between the noise source, the speech source, and the microphone.
  This effort has led to improvements in distant SER models [104].

## C. Emotions and Other Speech Tasks

* how emotion affects eg speaker verification and speaker recog [77]–[81] To
* we collected multiple podcast episodes from the same speakers whenever
  possible. 
* Speaker verification evaluations are often conducted across sessions
  collected on different days under different conditions.
  * Different episodes are often collected on different days, which approaches
* speaker verification tasks require an enrollment set to build the models.
* text-to-speech (TTS) requires enough data to build a speaker model.
* Fig. 15. Cumulative distribution of speakers
  with increasing recording duration. The bars show 
  * the number of male, female, and total speakers who have more than a given
* ideal for voice conversion (VC) and TTS tasks [82], [83].

## D. Rich Emotional Descriptors

* secondary emotion labels, where annotators select all emotions they perceive
* We have shown the value of secondary emotions by using them as auxiliary
  tasks in 
  classification problems [105], and in 
  retrieval tasks aimed at finding recordings with emotions similar to a
  reference (anchor) sample [106], [107]. 
* the annotation protocol allows evaluators to provide their own labels for
  both primary and secondary emotions when none of the predefined options are
  appropriate. 
* Chou+ [108] transformed these free-text labels into polarity vectors
  (negative, positive, ambiguous) using LIWC [109]. These examples showcase

## E. Support for Other Data Collections

* other languages. We created the
  affective naturalistic database consortium [AndC](http://andc.ai/)
  * aims to provide all the tools used to collect the MSP-Podcast corpus to
    other researchers, enabling them to create new databases and expand the
    infrastructure for affective computing. 
* We have partnered with collaborators from the National Tsing Hua University
  in Taiwan to test this initiative.
  They followed the code and protocol used for our corpus. The result of this
  effort is 
  the BIIC-Podcast corpus [15], with recordings in Taiwanese Mandarin. Another
* eg2 the White House tapes speech emotion recognition (WHiSER) corpus [32].
  Using a variation of the proposed protocol, we annotated the emotions of
  ambient recordings from the Oval Office during the presidency of Richard
  Nixon. This set provides a perfect test set for SER models in 
  * challenging recording conditions (distant speech, low-quality microphones,
    noisy environment). We expect that this consortium will encourage the
    creation of new resources.
* NaturalVoices corpus [110], [111] for speech generation tasks, particularly
  voice conversion (VC) [110] and emotional voice conversion (EVC) [111]
  * uses the 6,007 recordings used in the MSP-Podcast corpus (5,046 hours).
  * also suitable for eg text-to-speech (TTS). The original podcast recordings
    are freely available 4
* MSP-Conversation corpus [18] also beneficed from the collection of the
  MSP-Podcast corpus.
