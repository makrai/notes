Understanding Emotions: A Dataset of Tweets to Study
  Interactions between Affect Categories
Saif Mohammad, Svetlana Kiritchenko
LREC 2018

# Abstract

* majority of the emo detection work: only on classifying text in pos/neg/neut
* a much smaller amount on classif text into basic emotion categories eg joy
* we create a single textual dataset that is annotated for
  many emotion (or affect) dimensions, both the basic emotion model and VAD
  * but see set 5, last point
* For each emotion dimension, we annotate the data
  also for fine-grained real-valued scores indicating the
  intensity of emotion (anger, sadness, valence, etc)
* Best–Worst Scaling (BWS) to address the limitations of traditional rating
  <= inter~ and intra-annotator inconsistency
  * We show that the fine-grained intensity scores thus obtained are reliable
    (repeat annotations lead to similar scores)
* Twitter as the source of the textual data we annotate because tweets are
  * self-contained, widely used, public posts, and tend to be rich in emotions
* sheds light on crucial research questions such as
  * which emotions often present together in tweets?
  * how do the intensities of the three negative emotions relate to each other?
  * how do the intensities of the basic emotions relate to valence?

# 5 Summary and Future Work

* 11,000 tweets such that overlapping subsets are annotated for a number of
  emotion dimensions (from both the basic emotion model and the VAD model)
* Subsequently, Spanish and Arabic tweet datasets were also created
  following the methodology described here (Mohammad+, 2018)
* We calculated the extent to which
  * pairs of emotions co-occur in tweets
  * the intensities of affect dimensions correlate
  * affect–affect intensity ratios which help identify the tweets for which the
    two affect scores correlate and the tweets for which they do not
* We are currently annotating the dataset for arousal and dominance
  => explore how valence, arousal, and dominance change
  across tweets with low to high anger/joy/sadness/fear intensity
