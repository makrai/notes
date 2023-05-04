Saif Mohammad
Obtaining reliable human ratings of valence, arousal, and dominance
  for 20,000 English words
ACL long 2018

* The NRC Valence, Arousal, and Dominance Lexicon
  http://saifmohammad.com/WebPages/nrc-vad.html
* NRC Word–Emotion Association Lexicon (Mohammad and Turney, 2013)
  whether they are associated with any of the eight basic emotions
  (anger, anticipation, disgust, fear, joy, sadness, surprise, and trust)
  http://saifmohammad.com/WebPages/NRC-Emotion-Lexicon.htm
* NRC Affect Intensity Lexicon (Mohammad, 2018) aka NRC Emotion Intensity Lex
  real-valued affect intensity scores for four basic emotions
  (anger, fear, sadness, joy)
  http://saifmohammad.com/WebPages/AffectIntensity.htm

# Abstract

* Factor analysis studies have shown that the
  primary dimensions of meaning are valence, arousal, and dominance (VAD)
* We present the NRC VAD Lexicon, which has human ratings
  * use Best–Worst Scaling to obtain fine-grained scores and address agreemnt
  * vastly more reliable than those in existing lexicons
  * statistically significant differences
    in the shared understanding of valence, arousal, and dominance
    * across demographic variables such as age, gender, and personality

# 1 Introduction

* factor analysis studies
  * the three most important, largely independent,
    * valence (positiveness–negativeness/pleasure– displeasure)
    * arousal (active–passive)
    * dominance (dominant–submissive)
  * (Osgood+ 1957; Russell, 1980, 2003)
    * James A Russell. 1980. A circumplex model of affect. Journal of personali
    * JA Russell. 2003 Core affect and the psychological construction of emotion
* beneficial for
  * natural language processing (e.g., automatic sentiment and emotion anal)
  * psycholinguistics
  * psychology (e.g., for understanding how people view the world around them)
  * social sciences (e.g., for understanding relationships between people), and
  * evolutionary linguistics (how language and behaviour relate for advantag)
* VAD lexicons created using rating scales
  (Bradley and Lang, 1999; Warriner+ 2013)
  * limitations (Presser and Schuman, 1996; Baumgartner and Steenkamp, 2001)
    * inconsistencies between different/the same annotator
    * scale region bias, and problems associated with a fixed granularity
* we describe how we obtained human ratings of VAD by crowdsourcing
  * use a comparative annotation technique called Best-Worst Scaling (BWS)
    (Louviere, 1991; Cohen, 2003; Louviere+ 2015)
  * The scores are fine-grained real-valued numbers in the interval 0 to 1
  * the NRC Valence, Arousal, and Dominance (VAD) Lexicon
* Correlations (r) between repeated annotations, e.g.  split-half reliability
  * r = 0.95 for valence, r = 0.90 for arousal, and r = 0.91 for dominance
  * well above the SHR scores obtained by Warriner+ (2013)
* Respondents had the option of additionally filling out a brief demographic
  * age, gender, and personality traits
  * people aged over 35 are significantly more consistent in their annotations
  * men have a significantly higher shared understanding of DV
  * women have a higher shared understanding of the degree of arousal of words
    We find that some personality traits significantly impact a person’s
    annotations of one or more of valence, arousal, and dominance
* further research
  * how certain aspects of the world are
    more important to certain demographic groups
  * higher degrees of shared representations of those concepts
    within those groups

# 2 Related Work

## Primary Dimensions of Meaning

* Osgood+ (1957) asked human participants to rate words along dimensions
* three most prominent dimensions of meaning are
  evaluation (good–bad), potency (strong–weak), and activity (active–passive)
* Russell (1980, 2003)
  * valence or pleasure (positiveness– negativeness/pleasure–displeasure),
    arousal (active–passive), and dominance (dominant– submissive)
  * individual emotions such as joy, anger, and fear are points in a
    three-dimensional space of valence, arousal, and dominance
* even though the names given by Osgood+ (1957) and Russell (1980) are
  different, they describe similar dimensions (Bakker+ 2014)

## Existing Affect Lexicons:

* Affective Norms of English Words (ANEW, Bradley and Lang 1999) asked VAD rate
* Warriner+ (2013) created a similar lexicon for more than 13,000 words
* non-English: Moors+ (2013) for Dutch, by Võ+ (2009) for German, and by
  Redondo+ (2007) for Spanish
* The NRC VAD lexicon is the largest manually created VAD lexicon (in any
  language), and the only one that was created via comparative annotations
  (instead of rating scales)

## Best-Worst Scaling (BWS, Louviere, 1991),

* building on work in the 1960’s in mathematical psychology and psychophysics
* Annotators are given n items (commonly n = 4). 4
* They are asked which item is the best and which is the worst
* reveal the order of five of the six item pairs
* Real-valued scores are determined using the number of times an item was
  chosen best and worst (Orme, 2009; Flynn and Marley, 2014)
* three annotations each for 2N 4-tuples is sufficient
  (Louviere, 1991; Kiritchenko and Mohammad, 2016)
* more reliable and discriminating than those obtained using rating scales
  (Kiritchenko and Mohammad 2016, 2017)
* Within the NLP community, BWS has been used for creating datasets for
  * relational similarity (Jurgens+ 2012)
  * word-sense disambiguation (Jurgens, 2013)
  * word–sentiment intensity (Kiritchenko and Mohammad, 2016)
  * word–emotion intensity (Mohammad, 2018)
  * tweet–emotion intensity (Mohammad and Bravo-Marquez, 2017; Mohammad+ 2018;
    Mohammad and Kiritchenko, 2018)

## Automatically Creating Affect Lexicons

* automatically determining word–sentiment and word–emotion associations
  (Yang+ 2007; Mohammad and Kiritchenko, 2015; Yu+ 2015;
  Staiano and Guerini, 2014)

# 3 Obtaining Human Ratings of Valence, Arousal, and Dominance

## how we selected the terms to be annotated

## how we crowdsourced the annotation using best–worst scaling

* All terms in the NRC Emotion Lexicon (Mohammad and Turney, 2013)
  * labels indicating the eight basic emotions:
    anger, anticipation, disgust, fear, joy, sadness, surprise, and trust
    (Plutchik, 1980)
* positive and negative lists of the General Inquirer (Stone+ 1966)
* All 1,061 terms listed in ANEW (Bradley and Lang, 1999)
* All 13,915 terms listed in the Warriner+ (2013) lexicon
* Roget’s Thesaurus categories corresponding to the eight basic Plutchik emos
* Hashtag Emotion Corpus (HEC, Mohammad, 2012)
  * About 1000 high-frequency content terms, including emoticons

# 4 Demographic Survey

* age, gender, country they live in, and personality traits
* personality traits across the big five (Barrick and Mount, 1991)
  * Agreeableness (Ag) – Disagreeableness (Di)
    friendly and compassionate or careful in whom to trust, argumentative
  * Conscientiousness (Co) – Easygoing (Ea)
    efficient and organized (prefer planned and self-disciplined behaviour) or
    easy-going and carefree (prefer flexibility and spontaneity)
  * Extrovert (Ex) – Introvert (In)
    outgoing, energetic, seek the company of
    others or solitary, reserved, meeting many people causes anxiety
  * Neurotic (Ne) – Secure (Se) sensitive and nervous (often feel anger,
    anxiety, depression, and vulnerability) or secure and confident (rarely
    feel anger, anxiety, depression, and vulnerability)
  * Open to experiences (Op) – Closed to experiences (Cl)
    inventive and curious (seek out new experiences) or
    consistent and cautious (anxious about new experiences)

# 5 Examining of the NRC VAD Lexicon

## 5.1 A Comparsion to the Warriner+ Lexicon Scores

* We calculated the Pearson correlations r between the NRC VAD Lexicon scores
* low correlations

## 5.2 Independence of Dimensions

* Russell (1980) found through his factor analysis work that valence, arousal,
  and dominance are nearly independent dimensions. However,
* Warriner+ (2013)
  * valence and dominance have substantial correlation (r = 0.717)
  * split-half reliability score for their dominance annotations is only 0.77,
  * raises the suspicion whether annotators sufficiently understood the
    difference between dominance and valence
* our annotations show that V and D are only slightly correlated
* correlations for V–A and A–D are low in both our and Warriner annotations,
  * slightly higher in magnitude in our annotations

## 5.3 Reliability of the Annotations

* we calculate average split-half reliability (SHR) over 100 trials
  All annotations for a [4-tuple is] randomly split into two halves
* our SHR scores are markedly higher than those of Warriner+ (2013),
  especially for arousal and dominance

## Summary of Main Results

# 6 Shared Understanding of VAD Within and Across Demographic Groups

* Language use is also relevant to the understanding and treatment of
  neuropsychiatric disorders, such as sleep, mood, and anxiety disorders, which
  * occur more frequently in women than men (Bao and Swaab, 2011;
    Lewinsohn+ 1998; McLean+ 2011; Johnson+ 2006; Chmielewski+ 1995)
* respondents over the age of 35 obtain significantly higher agreements with
  each other on valence and arousal and lower agreements on dominance
* personality traits as they view themselves
  * conscientious have a particularly
    * higher shared understanding of the dominance of words, as compared to
    * higher in-group agreement for arousal, than those who view themselves as
    * difference for valence is not statistically significant. Also notable, is
  * extroverts have a particularly higher shared understanding of V, A, and D

# 7 Applications and Future Work

* sentiment or emotion detection systems
  * obtain sentiment-aware word embeddings and sentiment-aware sentence reprs
* interplay between the basic emotion model and the VAD model of affect
* high emotion intensity sentences or tweets
  * The Tweet Emotion Intensity Dataset (Mohammad and Bravo-Marquez, 2017)
    * emotion intensity and valence scores for whole tweets
    * the extent to which high intensity and high valence tweets consist of
      high V, A, and D words
    * identify sentences that express high emotional intensity without high VAD
* syllables that tend to occur in words with high VAD scores
  * names for commercial products that have the desired affectual response
* digital humanities and literary analysis
  * high V, A, and D words in books and literature
* hashtag words and emojis common in tweets, emotion denotating words,
  emotion associated words, neutral terms, words belonging to particular POS
* demographic groups and specific groups of words, for example, e.g. whether
  * younger annotators have a higher shared understanding of tweet terms,
  * women have a higher shared understanding of adjectives
* shared understanding in geographic and language groups
* VAD lexicons for other languages
  * characteristics of VAD that are common across cultures
