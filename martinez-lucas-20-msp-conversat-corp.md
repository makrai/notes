The MSP-conversation corpus,
Luz Martinez-Lucas, Mohammed Abdelwahab, and Carlos Busso,
Interspeech 2020, Shanghai, China, October 2020, pp. 1823-1827

# Abstract

* large corpus annotated with emotional labels that reflect the temporal
  complexity of expressive behaviors, especially during multiparty interactions
* we introduce the MSP-Conversation corpus, which contains
  * interactions annotated with time-continuous emotional traces for
    arousal (calm/active), valence (negative/pos), and dominance (weak/strong)
  * Time-continuous annotations offer the flexibility to
    explore emotional displays at different temporal resolutions while
    leveraging contextual information
  * ongoing effort, currently > 15 hours of speech annotated by >= 5 annotors
  * The data is sourced from the MSP-Podcast corpus
    * MSP-Podcast: speech data from online audio-sharing websites
      annotated with sentence-level emotional scores
      * an easy, affordable, and scalable approach to obtain
        natural data with diverse emotional content from multiple speakers
      * Lotfian and Busso,
        ...naturalistic emotionally balanced speech corpus by retrieving
        IEEE Transactions on Affective Computing, vol. 10, no. 4 2019
  * we compare the time-continuous evaluations from MSP-Conversation
    with the sentence-level annotations of the MSP-Podcast corpus
    for the speech segments that overlap between the two corpora

# Index Terms: SER, human-computer interaction, time-continuous emo attribs

# 1 Intro

* complex temporal externalization of expressive behaviors
  during multiple party interactions
* we need a large amount of naturalistic data with accurate emotional annot
* we introduce the MSP-Conversation corpus, which uses
  naturalistic recordings obtained from online podcasts
  * a broad range of topics
  * recordings overlap with the recordings included in the MSP-Podcast database
    * MSP-Podcast contains sentence-level annotations of short segments
      retrieved from podcasts
    * not appropriate to study contextual information
    * isolated turns are separately evaluated, missing the temporal relship
      between consecutive speaking turns
    * short sentences with durations less than 11 secs
    * speech segments are not necessarily consecutive speech turns
    * <~ retrieval criterion is whether our SER models expect these segments to
      convey emotion
    * the perceptual evaluation is conducted out-of-order
    * the full contextual information is not available to the annotators
  * continuous conversations
  * duration ranging between 10 and 20 minutes from
  * multiple speakers appearing in multiple podcasts
  * 74 conversation segments from the podcasts (approximately 15h), but the
    plan is to increase the number of conversational segments in the future
  * 197 different speakers
* annotated in a time continuous manner with emotional attributes to retain
  contextual information as well as the dynamic information
  * overlap between both corpora provides the perfect resource to explore the
    relationship between sentence-level and time-continuous annotation
* time-continuous annotations
  * Many emotional speech databases use sentence-level annotations
  * hE emos are affected by contextual information [3–5]
  * Time-continuous annotations capture dynamic information [6, 7]
  * capture the instantaneous emotional perception of evaluators as they listen
  * emotional traces can be arbitrarily segmented according to the anal scope
    * ie study emotions at various temporal resolutions
      (eg, phone, syllable, word, phrase, sentence)
* emotional attributes (rather than classes)
  * Emotional behaviors in natural settings are complex [8–10]
  * difficult to find a finite number of classes
  * emotional attributes provide appealing descriptors to better characterize
    emotional events [11]
  * validated by several studies supporting the core affect theory [12, 13]
    * from ScienceDirect: Core Affect is
      * an aspect of subjective emotional experience. It is
      * a neurophysiological state consciously accessible as simply
        feeling good or bad, energized or quiescent
      * how do you feel?
* annotation in terms of
  * arousal (active versus calm)
  * valence (positive versus negative), and
  * dominance (strong versus weak), the most common attributes previously used
* natural speech ie recorded for the purpose of creating an emotional database
  * other emotional speech databases are acted [14–16]
  * acted corpora tend to over emphasize the emotions
    => easier problems that does not resemble real world scenarios [17]
  * speech data sourced from various audio-sharing websites
  * a more diverse database in terms of speakers and emotions
* we present preliminary analysis on the MSP-Conversation corpus
  * distribution of the emotional content of the corpus
  * inter-evaluator agreement. The average Cronbach’s alphas are
    α = 0.50 for arousal, α = 0.54 for valence, and α = 0.41 for dominance
  * certain annotators are more reliable than others, which is
    * useful information for aggregating the traces across evaluators
  * compare the time-continuous evaluations of the MSP-Conversation corpus with
    the sentence-level annotations of the MSP-Podcast corpus
    for the speech segments belonging to both corpora
    * by aggregating the trace values over the duration of the segments
    * if the evaluator’s reaction lag in annotating is considered [18,19]:
      correlations between ρ = 0.196 and ρ = 0.403
* future research with this corpus
  * analyze the role of contextual information in the study of emotion
  * The annotation of speaker diarization information is critical
    to evaluate inter-dependencies between speakers [5]
    * [5] S. Mariooryad and C. Busso,
      Exploring cross-modality affective reactions for audiovisual emo recog
      IEEE Transactions on Affective Computing vol. 4 no. 2 pp. 183–196 2013
  * share this corpus with the community

# 2 Related work 2

* speech corpora with time-continuous annotations. Table 1
  * SEMAINE database’s Solid SAL approach [20] controlled the emotions of the
    ‘operator’ to elicit target emotions from the ‘user’
  * RECOLA database [21]
    * participants were asked to solve a problem in a video conference
    * showing neutral, negative or positive stimuli before recordings
  * SEWA database [22], which takes a similar approach
    * conversations between people, who were
      emotionally induced by showing emotional media
* ↑ some level of naturalness
  * hE data collection involves direct or indirect intervention of researcher
  * emotional contents are often biased to positive interactions given the
    colloquial interactions [2]
* MuSe-CaR database [23], which uses
  * recording of car reviewers in the wild
  * annotated with time-continuous labels for arousal, valence, trustworthiness
  * natural recordings, and, although the domain of the database is limited, it
    has a wide range of emotional content
* with ours, we can easily balance the emotional content and speaker demography
  by choosing the right podcasts
  * not intentionally manipulate or induce the speakers
    => flexible and scalable approach to collect emotional data

# 3. The MSP-Conversation Corpus 2

## 3.1. Protocol for Selecting Conversations

## 3.2. Annotations of Emotional Attributes

## 3.3. Post-Processing of the Time-Continuous Annotations

## 3.4. Annotation of Speaker Diarization

* Each conversation was manually diarized
* ie identifying the segments where each participant was speaking
* Figure 1 shows the annotations in ELAN [25]. Timing labels were created for
* including laughing and crying
  * music or unrelated sound was also annotated
* one channel per speaker, so it is easy to identify overlapped speech between
* percentage of overlapped speech is around 4%, although the percentage
  * can increase to as much as 10% depending of the type of conversation. The
* a unique number for identification of the speakers.  In total, the corpus has
* 197 unique speakers (87 female, 110 male)
* hist of num of partic
  * Three of the conversations (4.1%) have one speaker
  * 32 conversations (43.3%) have two speakers
  * 30 conversations (40.5%) have three speakers
  * four conversations (5.4%) have four speakers
  * and five conversations (6.8%) have five speakers

## 3.5. The MSP-Podcast Corpus

## 3.6. Partition of the MSP-Conversation Corpus

# 4. Analysis of the Corpus

## 4.1. Emotional Diversity

* All the aggregated traces were split into five-second segments
* Then, we estimate the average value over time across the segments
* Figure 2 shows the histograms of the dimensional attributes
* the values of the traces are in the range between -100 and 100
* Most of the annotations are concentrated between
  -40 to 40 for valence, -20 to 50 for arousal, and -20 to 40 for dominance
* Valence has a wider range compared to the other two dimensions
* dominance has the smallest range
* Arousal and dominance scores are biased to positive scores
  (ie, active and strong, respectively)
* future: we will look for more conversations with low arousal and domin
  to balance the corpus (eg fear)

## 4.2. Inter-Evaluator Agreement

* We use Cronbach’s Alpha [28] to estimate inter-evaluator agreement
  * metric considers not only if the ratings are similar in value,
    but also if the ratings increase or decrease at the same rates (ie, similar
    trends)
* overall agreement for the emotional attributes and the evaluators
  * attributes: we calculate the agreement for each of the annotated segments,
    reporting the average scores per emotional attribute
  * annotator: we compare the agreement across traces
    by including and excluding his/her annotations
    * The difference between these scores indicates how much his/her
      annotations improve or worsen the general agreement
* Table 2 lists the agreement results
  * highest agreements are for valence
  * lowest agreements are for dominance
  * agreement values are not high
  * annotating emotion is a complex process, especially time-continuously
    * inter-evaluator agreements reported in emotional databases are often low
      [14, 17, 29, 30]
  * different agreements across the annotators
    * evaluators 4 through 12 consistently increase the agreements
    * The agreement performance can be considered while combining the traces,
      weighing unreliable workers less
    * there is value in extra annotations even if they are less reliabile [31]

## 4.3. Time-Continuous Versus Sentence-Level Annotations

* 1,567 speech turns overlap the two corpora (Sec 3.5)
  * the aggregated time-continuous annotations are averaged in time during the
    duration of the speaking turns of the MSP-Podcast annotations
  * Figure 3 illustrates this process for three speech segments, which
  * => sentence-level scores from the traces
  * reaction lag of the annotator [18, 19]
    * we consider lags equal to 2.8, 3.0, 3.6, 4.08, 5.44, and 5.6 seconds
    * optimal delays found in previous studies for different attribs [18, 32]
* Pearson correlation coefficient between the sentence-level labels
  * Table 3 shows the averages for each emotional attribute
    * higher correlation for valence and arousal
    * optimal reaction lag (4.08s for valence, and 2.8s for arousal and domin)
  * The correlation coefficients never exceeded ρ = 0.403
  * that lack of contextual information may be the key
