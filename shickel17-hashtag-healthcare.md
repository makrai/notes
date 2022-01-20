Hashtag Healthcare: From Tweets to Mental Health Journals Using Deep Transfer L
Benjamin Shickel, Martin Heesacker, Sherry Benton, Parisa Rashidi
Under review with Scientific Reports arXiv:1708.01372 [cs.CL]

# Abstract

* mining social media, less attention has been paid to analyzing users'
  internalized thoughts and emotions from a mental health perspective
* we quantify the semantic difference between public Tweets and
  private mental health journals used in online cognitive behavioral therapy. We
  * deep transfer learning techniques for analyzing the semantic gap
  * for the task of emotional valence prediction, social media can be
    successfully harnessed to create more accurate, robust, and personalized
    mental health models
* the semantic gap between public and private self-expression is small
  * utilizing the abundance of available social media is one way to overcome the
    small sample sizes of mental health data, which are commonly limited by
    availability and privacy concerns

# 1 Intro

* We refer to
  * well-known research area as external sentiment analysis: sentiment and
    textual polarity is calculated with respect to a specific external entity
  * internal sentiment analysis as the study of the polarity of user text with
    respect to themselves, primarily concerned with statements of emotion and
    mental health
    6. Shickel, B.+
      Self-Reflective Sentiment Analysis
      Third Workshop on Computational Ling and Clinical Psychology, 23–32 (2016)
* we deal strictly with internal sentiment analysis, specifically with the
  valence prediction of private journals in a mental health therapy setting
  * partly aligns with emotion detection in text 7–12
  * we focus on the expansion of valence categories in a mental health setting
* online mental health therapy services 13–23
  * patient education components inherent in cognitive behavioral therapy (CBT)
    * Practice identifying and changing unhelpful thought patterns or cognitive
      distortions is a central part of CBT
  * practice with feedback can increase patients’ ability to accurately identify
    more helpful and less helpful thoughts, but up until now, ongoing feedback
  * users typically submit several directed journals
    * documenting their daily thoughts and feelings as they improve their mental
    * system for automatically categorizing user text has obvious benefits
      * early warning for suicide risk, providing a positive and
        always-available feedback for patients with distorted thinking, or
        simply providing enhanced and more fine-grained analysis of
        overall patient well-being
* Traditional sentiment analysis involves detecting
  * whether a given text fragment is subjective or objective, and
  * in the case of subjectivity, classifies the text as either positive/negative
* for mental health polarity
  * besides positivity and negativity, we introduce two additional classes:
    both positive and negative, and neither positive nor negative
  * psychological research suggests emotions cannot be represented on a single
    axis of valence 24–28
  * text classified as neutral using traditional frameworks would, using our new
    annotation scheme, fall into either of the two augmented classes
* few publicly-available mental health datasets suitable for ML-based internal
  sentiment analysis
  * traditional sentiment analysis in the context of social media platforms such
    as Twitter 29–34
  * we hypothesize that the social media domain is quite similar to the mental
    health domain with regards to textual language modeling and classification,
    and can be used to help train mental health models and systems
* We quantify the similarity between the two domains using transfer learning
  * training models on one domain (i.e. social media text)
  * fine-tuning them on another target domain (i.e.  mental health text)
  * in the context of deep learning
* We train deep learning models on a large dataset of annotated text from the
  social media platform Twitter, and transfer the underlying language model and
  learned representation to the task of predicting the
  * valence of mental health journal text
  * objective change in mental health
    as gauged by evidence-based mental health measures
* improved performance for emotional valence prediction

# Methods 3

## Transfer learning

* Our target domain: text-based emotional self-expressions and reflections
  from a cognitive-behavioral perspective,
  obtained through an online mental health therapy service
* source: public tweets from Twitter, would be similar enough to transfer
* we explore the application of recurrent neural networks

## Recurrent neural networks

* we include a word-level attention mechanism based on the work of Yang+ 35
  * 35. Yang, Z. et al
    Hierarchical Attention Networks for Document Classification. In Proceedings
    NAACL 2016
  * to provide a measure of natural interpretability to our final model eval

## Datasets and annotation

* Of the 3,872 responses, 63.5% were assigned the negative label
  (10.4% positive, 14.3% neither positive nor negative, 11.7% both)
  * The high class skew is a side effect of selection bias in our dataset -
    most psychotherapy seekers exhibit negative thinking, which is one major

## Experiments

# Results 6

# Discussion

* important implications for computer-assisted, computerized psychotherapy, and
  other therapy-related applications in which patients submit narrative text
  * negative affect in patient narratives suggesting elevated levels of
    distress, depression, or anxiety
  * when positive and negative affect are both high in narrative text:
    * ambivalence, which is often associated with conflict-related distress
  * oscillations in levels of negative affect or oscillations between high
    negative and high positive affect across time suggest the possibility of
    bi-polar disorder, cyclothymia, borderline personality disorder, and/or an
    interpersonal or social context fraught with cyclical affective instability
* patients might be skeptical of the accuracy of therapist feedback or reactive
  to the fact that a healthcare provider is providing feedback
  * might place their trust in the more objective feedback from the ML tool
  * ostensibly objective personality assessment feedback is widely accepted,
    especially if it is worded somewhat positively and somewhat generally
    36. Snyder, C. R., Shenkel, R. J. & Lowery, C. R
    Acceptance of Personality Interpretations: The ”Barnum Effect” and Beyond
    J. consulting clinical psychology 45, 104–114 (1977)
