The MSP-conversation corpus,
Luz Martinez-Lucas, Mohammed Abdelwahab, and Carlos Busso,
Interspeech 2020, Shanghai, China, October 2020, pp. 1823-1827

# Abstract

* lack of large corpora annotated with emotional labels that reflect the
  temporal complexity of expressive behaviors, especially during multiparty
  interactions
* we introduce the MSP-Conversation corpus, which contains
  * interactions annotated with time-continuous emotional traces for arousal
    (calm to active), valence (negative to positive), and dominance (weak to
    strong)
  * Time-continuous annotations offer the flexibility to
    explore emotional displays at different temporal resolutions while
    leveraging contextual information
  * This is an ongoing effort, where the corpus
    currently contains more than 15 hours of speech annotated by >= 5 annotors
  * The data is sourced from the MSP-Podcast corpus, which contains
    * MSP-Podcast: speech data from online audio-sharing websites
      annotated with sentence-level emotional scores
      * an easy, affordable, and scalable approach to obtain natural data with
        diverse emotional content from multiple speakers
  * we compare the time-continuous evaluations from the MSP-Conversation
    corpus with the sentence-level annotations of the MSP-Podcast corpus for
    the speech segments that overlap between the two corpora

# Index Terms: SER, human-computer interaction, time-continuous emo attribs

# 1 Intro

* we need a large amount of naturalistic data annotated with accurate emotional
  annotations that can describe the complex temporal externalization of ex-
  pressive behaviors during multiple party interactions
* we introduce the MSP-Conversation corpus, which uses
  naturalistic recordings obtained from online podcasts, conveying
  * a broad range of topics. A key feature of the corpus is that the
  * recordings overlap with the recordings included in the MSP-Podcast database
    * MSP-Podcast contains sentence-level annotations of short segments
      retrieved from podcasts. The MSP-Podcast corpus is
    * not appropriate to study contextual information, as the
    * isolated turns are separately evaluated, missing the temporal
      relationship between consecutive speaking turns. The MSP-Conversation
    * short sentences with durations less than 11 secs
    * speech segments are not necessarily consecutive speech turns in the
      recordings, since our
      * retrieval criterion is whether our SER models expect these segments to
        convey emotion
    * the perceptual evaluation is conducted out-of-order, so full contextual
      information is not available to the annotators
  * continuous conversations within the podcasts with duration ranging between
    10 and 20 minutes from multiple speakers appearing in multiple podcasts
  * 74 conversation segments from the podcasts (approximately 15h), but the
    plan is to increase the number of conversational segments in the future
  * 197 different speakers
* annotated in a time continuous manner with emotional attributes to retain
  contextual information as well as the dynamic information present in the
  * overlap between both corpora provides the perfect resource to explore the
    relationship between sentence-level annotations and time-continuous annot
* time-continuous annotations
  * Many emotional speech databases use sentence-level annotations, focusing on
  * hE emos are affected by contextual information [3–5]
  * Time-continuous annotations capture dynamic information [6, 7]
  * capture the instantaneous emotional perception of evaluators as they listen
  * emotional traces can be arbitrarily segmented according to the scope of the
    analysis, providing the resources to study emotions at various temporal
    resolutions (eg, phone, syllable, word, phrase, sentence)
* emotional attributes (rather than classes)
  * Emotional behaviors in natural settings are complex [8–10], so
  * it is difficult to find a finite number of classes that can capture the
  * emotional attributes provides appealing descriptors to better characterize
    emotional events [11]
  * validated by several studies supporting the core affect theory [12, 13]
* annotation in terms of
  * arousal (active versus calm)
  * valence (positive versus negative), and
  * dominance (strong versus weak), which are the most common attributes
    previously used
* natural speech that was not recorded for the purpose of creating an emotional
  database
  * other emotional speech databases are acted [14–16]. Gathering data in that
  * acted corpora tend to over emphasize the emotions resulting in easier
    problems that does not resemble real world scenarios [17]. By its
  * speech data sourced from various audio-sharing websites, the recordings of
  * a more diverse database in terms of speakers and emotions
* we present preliminary analysis on the MSP-Conversation corpus. It describes
  * the distribution of the emotional content of the corpus. This paper also
  * inter-evaluator agreement. The average Cronbach’s alphas are α = 0.50 for
    arousal, α = 0.54 for valence, and α = 0.41 for dominance. The
  * certain annotators are more reliable than others, which is
    * useful information for aggregating the traces across evaluators
  * compare the time-continuous evaluations of the MSP-Conversation corpus with
    the sentence-level annotations of the MSP-Podcast corpus for the speech
    segments belonging to both corpora
    * by aggregating the trace values over the duration of the segments in the
    * if the evaluator’s reaction lag in annotating is considered [18,19]:
      correlations between ρ = 0.196 and ρ = 0.403
* future research directions include the use of this corpus to analyze the
  role of contextual information in the study of emotion
  * The annotation of speaker diarization information is critical to evaluate
    inter-dependencies between speakers [5]
  * share this corpus with the community

# 2 Related work

* speech corpora with timecontinuous annotations. Table 1 summarizes the key
  * SEMAINE database’s Solid SAL approach [20] controlled the emotions of the
    ‘operator’ to elicit target emotions from the ‘user’
  * RECOLA database [21] is another corpus, where
    * participants were asked to solve a problem by communicating through a
      video conference
    * showing neutral, negative or positive stimuli before recordings. A more
  * SEWA database [22], which takes a similar approach.  The data consists of
    * conversations between people, who were emotionally induced by showing
      emotional media
* some level of naturalness, but their data collection involves direct or
  indirect intervention of the researchers
  * emotional contents are often biased to positive interactions given the
    colloquial interactions [2].  Another recent corpus is the The
* MuSe-CaR database [23], which uses
  * recording of car reviewers in the wild that are
  * annotated with time-continuous labels for arousal, valence, and
    trustworthiness
  * natural recordings, and, although the domain of the database is limited, it
    has a wide range of emotional content. We argue that the research community
    needs more resources to effectively understand the role of temporal
    information during natural interactions.  The proposed approach has the
* with ours, we can easily balance the emotional content and speaker demography
  by choosing the right podcasts
  * not intentionally manipulate or induce the speakers
    => flexible and scalable approach to collect emotional data

# 3. The MSP-Conversation Corpus

# 4. Analysis of the Corpus

## 4.1. Emotional Diversity

* All the aggregated traces were split into five-second segments
  * Then, we estimate the average value over time across the segments
  * Figure 2 shows the histograms of the dimensional attributes. Notice that
  * the values of the traces are in the range between -100 and 100. The figure
  * Most of the annotations are concentrated between -40 to 40 for valence,
    -20 to 50 for arousal, and -20 to 40 for dominance
  * Valence has a wider range compared to the other two dimensions, and
  * dominance has the smallest range
  * Arousal and dominance scores are biased to positive scores (ie, active and
    strong, respectively)
  * In the future, we will look for more conversations with low arousal and
    dominance scores to balance the corpus (eg, conversations expressing fear)

## 4.2. Inter-Evaluator Agreement

* We use Cronbach’s Alpha [28] to estimate inter-evaluator agreement, which
  * This metric considers that two raters agree not only if their ratings are
    similar in value, but also if the ratings increase or decrease at the same
    rates (ie, similar trends). We calculate the overall agreement for the
    emotional attributes and the evaluators
  * For the attributes, we calculate the agreement for each of the annotated
    segments, reporting the average scores per emotional attribute
  * For an annotator, we compare the agreement across traces by including and
    excluding his/her annotations
    * The difference between these scores indicates how much his/her
      annotations improve or worsen the general agreement
* Table 2 lists the agreement results, which shows that the
  * highest agreements are for valence, and the
  * lowest agreements are for dominance
  * agreement values are not high, we would like to highlight that
    * nL annotating emotion is a complex process, especially with
      time-continuous annotations
    * inter-evaluator agreements reported in emotional databases are often low
      [14, 17, 29, 30]
  * different agreements across the annotators, where evaluators 4 through 12
    consistently increase the agreements with their traces
    * The agreement performance can be considered while combining the traces,
      weighing unreliable workers less
    * there is value in extra annotations even if they are less reliabile [31]

## 4.3. Time-Continuous Versus Sentence-Level Annotations

* 1,567 speech turns overlap the two corpora (Sec 3.5). To compare the
  * the aggregated time-continuous annotations are averaged in time during the
    duration of the speaking turns of the MSP-Podcast annotations
  * Figure 3 illustrates this process for three speech segments, which results
    in sentence-level scores from the traces.  The analysis accounts for the
  * reaction lag of the annotator [18, 19]
    * we consider lags equal to 2.8, 3.0, 3.6, 4.08, 5.44, and 5.6 seconds. The
    * optimal delays found in previous studies for different attribs [18, 32]
* Pearson correlation coefficient between the sentence-level labels
  * Table 3 shows the averages for each emotional attribute.  The table shows
    * higher correlation for valence and arousal
    * optimal reaction lag (4.08s for valence, and 2.8s for arousal and domin)
  * The correlation coefficients never exceeded ρ = 0.403. While more analysis
  * that lack of contextual information may be the key difference
