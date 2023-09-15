MSP-Podcasts: Building Naturalistic Emotionally Balanced Speech Corpus
  by Retrieving Emotional Speech From Existing Podcast Recordings
Reza Lotfian, and Carlos Busso
Journal of IEEE Transact on Affective Computing, Vol. XX, No. X, December 2016

# Abstract

* goal: large, natural emotional database
  * translate results on speech emotion recognition in controlled
    conditions into real-life applications.
  * unbalanced emotional content, which is dictated by the given recording
    protocol (eg, positive for colloquial conversations, negative for
    discussion or debates)
  * size and speaker diversity are also limited.
* we propose a novel approach to effectively build a large, naturalistic
  emotional database with balanced emotional content, reduced cost and reduced
  manual labor
  * relies on existing spontaneous recordings obtained from audio-sharing
    websites
  * combines machine learning algorithms to retrieve recordings conveying
    balanced emotional content with a cost effective annotation process using
    crowdsourcing, which make it possible to build a large scale speech emo db
  * multiple speakers, with different channel conditions and conveying balanced
    emotional content

# 1 Intro

* AFFECTIVE comp: understand, analyze, recognize, and synthesize human emotions
  * applications in areas related to human computer interaction (HCI),
    healthcare, security and defense, education and entertainment
  * Speech provides an accessible modality for current interfaces, importa info
* challenging task given the
  * subtle expressive behaviors that occur during human interactions [1].
  * databases are limited in size, number of speakers, inadequate/inconsistent
    emotional descriptors, lack of naturalistic behaviors, and unbalanced
    emotional content [2], [3], [4]
  * deep learning in automatic speech recognition (ASR)
    relies on many hours of speech data
    The research community does not have the resources to leverage powerful
    learning algorithms to create robust emotion models.
* Collecting data in real-life condition is a challenging task involving
  ethical, legal and financial considerations.  A popular approach used in
  * actors reading predefined sentences portraying target emotions [5], [6].
    * results in over-emphasized expressions, not subtle [4], [7], [8], [9]
  * simulate conversations between two or more speakers collecting spontaneous,
    * hypothetical situations (IEMOCAP database [10]),
    * conversation over video conference while completing a collaborative task
      (RECOLA database [11]) or
    * sensitive artificial listener (SAL,SEMAINE database [12], [13]).
    * hE costly and time consuming. Some researchers rely on data recorded in
  * uncontrolled setting during natural conversations.  Examples of these
    * call centers [7], [8],
    * interaction of kids with robots (FAU-AIBO database [14]),
    * TV talk-shows (VAM database [15]) and
    * media over Internet such as interviews or video blogs [16], [17]. In most
    * hE emo biased by the context and nature of the interaction,
    * reduced range of emotional behaviors in the corpora. It is important to
* we present MSP-PODCAST and the data collection approach that we are using to
  * relies on existing naturalistic recordings available on audio-sharing
    websites. The recent popularity of multimedia content on Internet
    * unlimited resources for videos (eg, YouTube, Vimeo), images (eg, Flickr,
      Picasa, Facebook, Instagram), and audio clips (eg, iTunes, Soundcloud).
    * we focus on podcasts, which are prerecorded audio programs that can be
      downloaded or streamed
    * key challenge: select audio segments with emotionally balanced content,
      covering the wide spectrum of human emotions. First, we select and
  * natural conversations between many different people over various topics,
    both positive and negative (eg, political debates, movie reviews, sport)
  * recordings under Creative Commons licenses with less restrictive requirem,
    so we can share the database to the broader community (CC-BY or CC-BY-SA)
  * segmented into clean, single speaker segments, removing silent segments,
    background music, noisy segments, or overlapped speech.
* selection, segmentation and cleaning is
  automatized with algorithms for voice activity detection (VAD), speaker
  diarization, music/speech recognition, and noise level estimation. After
  selecting candidate speaking turns, we retrieve a set of segments conveying
  balanced and rich emotional content
  * We rely on machine learning models trained with existing corpora to
    retrieve samples with target emotional behaviors as described by arousal
    (calm versus active) and valence (negative versus positive) attributes.
    * provides control over the emotional content, increases the speaker
      diversity, and maintains (non-acted) spontaneous nature of the recordings
  * segments are emotionally annotated with perceptual evaluations conducted on
    a crowdsourcing platform
  * We implement a novel evaluation that tracks the performance of the workers
    in real-time, stopping the evaluation when their performance drops below an
    acceptable threshold, as proposed in our previous study [18].
* proof-of-concept experiments that demonstrate that
  * cross-corpus emotion classification along with crowdsource-based
    annotations can be effectively used to build naturalistic emotional
    database with balanced emotional content, reduced cost and reduced manual
    labor
  * building affective databases using media content was prev explored [17]
    * we: machine learning algorithms to retrieve audio clips with balanced emo
      * natural stimuli with wider spectrum of emotions
  * We study different information retrieval methods in the context of emotion
    detection and compare their performances. The proposed approach relies on
  * automatic algorithms to post-process podcasts and a
  * cost effective annotation process, which make it possible to scale .
* from the Conclusion
  * we trained and evaluated machine learning alternatives for classification,
    preference learning and regression, where the task was to identify
    sentences with low and high values of arousal and valence
  * Relying on the three most successful algorithms on the evaluations with
    existing corpora, we retrieved 2,317 sentences which were emotionally
    annotated using crowdsourcing evaluations
  * experimental evaluation: the emotional content of the retrieved speech
    sentences cover almost the entire arousal and valence space
    * The emo distribution of the corpus is more balanced than other emo corpora
  * we have extended the size of the corpus with over 27 hours of emo data

# 2 Existing emotional databases.

* TUM AVIC  10h 21 speakers spontaneous English
  [22] Schuller, Müller, Eyben, Gast, Hörnler, Wöllmer, Rigoll, Höthker, Konosu
    “Being bored? recognising natural interest by extensive audiovisual
    integration for real-life application,” 
    Image and Vision Computing, vol.  27, no. 12, pp. 1760– 1774, November 2009.

## 2.1 Lack of Naturalness

* actors were used in the Emo-DB, CREMA-D, and Chen Bimodal database. A
  * lack of naturalness, as the acted renditions 
  * resemble more prototypical behaviors 
    unlike daily interactions [23], [24], [25], [26].
* elicitation schemes can attenuate the problem of acting [27], [28], [29]
  * IEMOCAP and MSP-IMPROV databases are two examples, where emotions were
    elicited using (1) conversational settings in dyadic interactions, instead
    of read renditions by a single speaker, and (2) emotion-dependent
    contextual information which naturally triggers emotions.  However, these
  * still from actors.

## 2.2 Unbalanced Emotional Content

* more natural interactions (SAL, TV shows, call center). Examples of these
  * eg VAM, TUM-AVIC, SEMAINE, FAU-AIBO and RECOLA databases.  In spontaneous
  * controlling the emotion content during the recording is not easy. Common
    * no clear or extreme emotional manifestations, and the vast majority of
  * the recording protocol dictates the emotional behaviors conveyed in the
    * discussions between couples, the emotions will be biased toward negative
    * colloquial discussions, the emotions will be biased toward positive
    * If the topic of discussion is noncontroversial => neutral
* Figure 1 depicts the distribution for the emotional speech samples
  in the arousal-valence space: IEMOCAP, MSP-IMPROV, SEMAINE, RECOLA and VAM 
  * (the arousal-valence scores are normalized between -1 and 1). These figures
  * created as follows
    * First, we plot each speaking turn in the corpora as a dark point. Then,
    * color = estimated the average distance to the 20 nearest neighbor samples
    * To compensate for the differences in the size of the databases, we
      randomly select 1000 samples from each of the database.  Since the VAM
      database has 947 samples, we randomly repeat some sentences until
      reaching 1,000 sentences
  * The most balanced databases are the IEMOCAP and MSP-IMPROV corpora.  As
    * recorded from actors, where the scenarios were carefully selected to
    * without actors, achieving this balance is not easy
    * For the SEMAINE, RECOLA and VAM corpora: large areas with few samples
* SEMAINE and RECOLA
  * The SEMAINE: interactions between a user and an operator
    * The operator portrayed a given personality, and his/her goal was to induce
      emotions on the user. Figure 1(c) shows the distribution in the
    * Most of the sentences are neutral or slightly positive, since inducing
  * RECOLA database includes spontaneous interactions where participants
    resolved a collaborative task remotely through video conference. Despite
    * most of the sentences have emotionally neutral behaviors as we expect
    * mainly positive due to the colloquial interaction between the
  * VAM database mostly covers sentences with negative valence since the
    recordings come from the TV talk show Vera am Mittag, where the
    participants discuss relationship issues 
    (ie, fatherhood, affairs, and friendship) [15].

## 2.3 Limited Size of the Corpora

* Most emotional databases have few hours of recordings. To the best of our
* the largest emotional corpora are included in Table 1
* IEMOCAP, MSP-IMPROV, TUM AVIC and FAU-AIBO are the only corpora with > 9 h
* also limits the advances in ASR 
  o create recognition systems that are robust to expressive speech.

## 2.4 Limited Number of Speakers

* We express emotions differently, so it is important to include multiple
* Most emotional corpora have less than 20 speakers
* The CREMA-D, FAU-AIBO and Chen Bimodal DBs are the only corpora with > 50 [2]
* Even for these cases, the size of the corpus per speaker is limited, which
* also: expressive speech in speaker verification tasks
  * Speaker verification systems require registration data in addition to test
  => ~ 5 min per speaker are needed [30]
  * These corpora are not appropriate for these tasks.

# 3 Method used for the data collection including

* the selection of the podcasts, segmentation of the podcasts into short turns,
  post-processing steps, and emotional annotation.
* our previous work, we introduced the idea of building 
  * a naturalistic database from existing speech corpora providing the
    proof-of-concepts behind this framework [31]
  * That study relied on the Fisher corpus [32], which consists of 
    * telephone conversation between two participants. However, the Fisher
    * hE not freely available to the broader community and the 
    * interactions were mainly colloquial with very few sentences with negative
* MSP-Podcast: podcasts recordings that are freely available on audio sharing
  * emotional diversity by selecting podcasts from a variety of topics,
  * no such structure which is a characteristic of other radio-like programs.
* collecting the MSP-PODCAST corpus, which is summarized in Figure 2.

## 3.1 Selection of Podcasts

* podcasts that are freely available to the public under Creative Commons
  under CC-BY or CC-BY-SA licenses. These options are the least restrictive
  * modify and redistribute the data for either commercial or noncommercial
    purpose
  * Podcasts with these licenses usually contain conversations from common
    individuals, without music segments, since the producers do not have the
    right to digitally distribute the broadcasted music. This is another
* The second criterion to select podcasts is to maintain the naturalness and
  diversity of the emotional content
  * We are manually downloading podcasts covering different topics to increase
  * topics include science, technology, politics, economics, business, arts,
    culture, medicine, lifestyle and sports. Our goal is to include
  * We also avoid acted recordings, which will affect the naturalness of the
  * by searching keywords related to conversations, interviews, talk shows,
    news, discussions, education, storytelling and debates. These interactions
  * an ongoing effort. For this study, we include 403 podcasts.

## 3.2 Segmentation Process

* convert them into a consistent format. All the downloaded podcasts are
  * mono channel, having a sampling rate of 16 kHz, and 16 bit PCM. The podcast
* full length programs ranging from three to 190 minutes, including
  speaking segments and music segments, one or multiple speakers.  Therefore,
* we segment the podcasts into short segments using a diarization tool. We have
  * an online cloud applic called Speaker Attribution Intelligent Service [33],
    * output: starting time, duration of the segments and the speaker ID 
* We also manually segmented 105 podcasts. These podcasts are 
  later used to train a classifier that can detect music (Sec 3.3)

## 3.3 Selecting Candidate Speaking Turns

* Our goal is to consider single speaker segments, without noise or music.
* selecting segments that are not too long or too short
* We emotionally annotate the corpus at the segment level, where 
  each rater assigns an emotional label (Sec.  3.4). There is a tradeoff in the
* ideal duration of the segments. If the segments are too 
  * long, the emotional content may fluctuate within the segment, so a single
  * short, the listeners will have limited information to evaluate the
  * we considering segments with duration between 2.75s and 11s, discarding
  * we use a separate speech activity detection (SAD) algorithm [34], removing
    samples with short speech activity.
    * While the speech diarization tool should remove non-speech segments, we
      can still have 2.75s segments dominated by silence

* We also remove segments recorded with poor quality, or contaminated by noise.
  * We find the signal-to-noise ratio (SNR) of the segments, using the
    waveform amplitude distribution analysis (WADASNR) method [35], where we
    discard segments with SNR values less than 20dB
  * We also remove phone quality speech.  Audio recorded over the phone has
    
* We remove segments with music or speech with background music. Since 
  * the diarization tool detects any segment that has an identifiable speech
  * we built a support vector machine (SVM) classifier to detect music by
    analyzing the spectrum of the audio signal represented by pyknogram
    patterns [36]. This classifier was trained using the samples from the 105
    podcasts that are manually segmented. After listening to 500 randomly
    selected samples detected as music, 63.8% of them included only music, or
    music in the background. There is room for improvement.

* this results in 84,125 speaking turns from the 403 podcasts. These segments
  * we select the sentences to be annotated, many neutral
  * by automatically evaluating the emotional content of speak turns (sec 4)

* The retrieved speech segments are then emotionally annotated (Sec. 3.4). This
  * we manually check the retrieved samples before uploading them for
  * Figure 3: 
    * 65.6% of the retrieved samples that were accepted
    * the reasons for rejection including segment with silence, multiple
      speakers, music and other reasons (eg, offensive language, explicit
      sexual references, use of languages other than English)
    * The most important problem is segments with multiple speakers (22.3%).
    * future: detect overlapped speech [37]

## 3.4 Perceptual Evaluations using Crowdsourcing

* Amazon mechanical Turk (AMT)
* In our previous work [10], [19], we have annotated sentences with 
  * emotional attributes (arousal, valence, dominance) and 
  * categorical emotions (ie, anger, happiness, sadness)
  * Attribute and categorical based descriptors provide complementary info
* Figure 4 shows the questionnaire which has two parts
  * first part evaluates the segments with attribute based annotations (Figs.
    * seven-point Likert scale to evaluate valence (negative versus  positive),
      arousal (calm versus  active), and dominance (weak versus  strong). We
    * self-assessment manikins (SAMs) [38], [39] to visually guide the
      evaluators in annotating these dimensional attributes. SAM provides a
      lexicon-free assessment tool which simplifies the understanding of the
      emotional attributes, improving their inter-evaluator agreement. The
  * second part evaluates the segments with categorical labels
    * First, the evaluators need to choose the primary emotion that best
      * anger, sadness, happiness, surprise, fear, disgust, contempt, neutral
      * They can also choose other when none of the previous options are
      * can only select one option
    * Second, we annotate secondary emotions similar to Busso+ [19], where the
      evaluators can choose all the classes that they perceive in the segment
      (eg, sadness + frustration)
      * Speech in naturalistic interactions often convey ambiguous emotions [40]
      * provides complementary information to better describe the emotional
      * We extend the list of emotion including amused, frustrated, depressed,
        concerned, disappointed, excited, confused, and annoyed
      * Similar emotional classes are grouped together to reduce cognitive load

* We rely on a modified version of the crowdsourcing approach by Burmania+ [18]
  * the inter-evaluator agreement in annotating emotional labels increases when
    the evaluators evaluate more than one segment per human intelligence task
    (HIT). The workers can calibrate their assessment by evaluating multiple
    segments per task [18].  The performance drops when the worker tires or
    loses interest in the task.

  * Burmania+ [18] proposed to create HITs with multiple segments, where we
    track in real-time the quality of the workers, stopping the evaluation when
    * a set of reference sentences which are already evaluated are interlaced

  * we implement three main changes on the approach
    * we increase the frequency that we include reference sentences. In
      * one reference sentence every four new sentences so we can detect faster
    * we randomly the presentation pattern for the four new sentences and the
      reference sentence 
  * the stopping criterion includes not only primary emotions, as in our
    previous work, but also attribute-based annotations
    * metric: For primary emotions, we use the angular similarity metric, which
      transforms evaluations into vectors and estimates whether the angular
      distance between annotations in/decreases (less/more agreement) or
      when an extra annotation is added (see details in Burmania+ [18]). For
    * attribute-based annotation, we only consider arousal and valence. We
      estimate the absolute distance between the average score assigned to a
      reference sentence and the score provided by the worker.

# 4 Machine learning frameworks used to retrieve segments to be emo annotated

* we focus on balancing the emotional content in terms of attribute-based
  * dominance is highly correlated with arousal so we do not include this
  * We prefer attribute-based annotations over categorical annotations because
  (1) the diversity on the emotional classes considered across studies [3], and
  (2) the existence of annotations for arousal and valence in many corpora.

* emotion detectors by training different models using available emotional
  corpora to find the most expressive samples among the unlabeled pool of
  * We formulate the problem as a retrieval task where the objective is to
    identify sentences with high and low arousal, and high and low valence.
    Using these methods, we expect a better balance in the emotion distribution
    over the arousal-valence space by separately targeting these four problems.
    Other formulations are possible, but are left as future work (eg,
    retrieving categorical emotions [41], finding hotspots [42], [43]).

* classification, preference learning and regression.
  * classification, we use the confidence level of the claseifiers to retrieve
    sentences from the pool that are most likely eo be in the target
    arousal-valence region. Using 
  * preference learning (ie ranking), we rank unlabeled samples according to
    their valence or arousal scores, selecting the sentences at the top (high)
    and bottom (low) of the sorted list. Using 
  * regression, we directly estimate the arousal and valence scores of the
    * selecting the ones with higher and lower values for each attribute
* This section describes different solutions under these three ML problems,
  evaluating their performance with existing emotional corpora.  The best
  algorithms are then used to retrieve the sentences for MSP-PODCAST

# 5 Quantitative analysis on the emotion distribution of the retrieved DB

## 5.4

* the distribution of the corpus across primary emotions is not as balanced as
  the scores for attribute dimensions, where we have few sentences for
  certain emotional classes (eg, fear, sadness)
  * future: To address this problem, we are exploring preference learning
    solutions for categorical emotions (eg, sad ranker). We are also increasing
    the number of podcasts with emotional content including unrepresentative
    emotional classes increasing the pool of candidate sentences.

# 6 Conclusion: summery, final remarks and future directions
