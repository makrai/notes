MUStARD++: A Multimodal Corpus for Emotion Recognition in Sarcasm
Anupama Ray, Shubham Mishra, Apoorva Nunna, Pushpak Bhattacharyya
LREC 2022 Marseille, France

[dataset, annotations, code](https://github.com/apoorva-nunna/MUStARD_Plus_Plus)

# Abstract

* the relationship between sarcasm and emotion has largely remained unexplored
  * eg “I love being ignored” belies sadness, while
    “my mobile is fabulous with a battery backup of only 15 minutes!”: frustrat
  * to the best of our knowledge, is hitherto unexplored
* multimodal sarcasm detection dataset (MUStARD) pre-annotated with 9 emotions
  * We identify and correct 343 incorrect emotion labels (out of 690)
  * We double the size of the dataset, label it with emotions along with valence
    and arousal which are important indicators of emotional intensity
  * we label each sarcastic utterance with one of the four sarcasm types:
    Propositional, Embedded, Likeprefixed and Illocutionary
* Exhaustive experimentation with multimodal (text, audio, and video) fusion
  * outperforms the SOTA sarcasm detection

# 1 Intro

* intent of sarcasm: appear humorous, ridicule someone, or to express contempt
  * verbal and non-verbal cues (pitch, tone, emphasis in speech, and body
    language in video)
  * Even for humans, understanding the underlying emotion is challenging without
    the audio/video or the context of the conversation
* dataset
  * textual datasets (such as tweets (Oprea and Magdy, 2020), Reddit short texts
    (Khodak+ 2017), dialogue (Oraby+ 2016) etc) for a decade
  * multimodal datasets in the space of sarcasm detection, for example,
    * image data from Twitter (Cai+ 2019),
    * code-mixed sarcasm and humor detection dataset (Bedi+ 2021)
* Castro+ (2019): a video dataset for sarcasm detection called MUStARD with
  * 345 sarcastic videos and 345 non-sarcastic videos
  * Chauhan+ (2020) annotated MUStARD data with 9 emotion labels and sentiment
    (all sarcastic utterances having negative sentiment) and used emotion and
    sentiment to improve sarcasm detection
* We started with this emotion-labeled variant of MUStARD provided by Chauhan+
  * we build a multiclass emotion recognizer on sarcastic utterances and
  * we observed several labeling errors while performing error analysis. During
  * we doubled the dataset by adding new utterances from similar sitcom genre
    series as in MUStARD while maintaining 50% sarcastic and 50% non-sarcastic
* affective dimensions of valence and arousal are common (Mohammad, 2021)
  * the entire dataset is annotated with arousal and valence along with the
    perceived emotion of the speaker. While
  * valence indicates the extent to which the emotion is positive or negative,
  * arousal measures the intensity of the emotion associated (Cowie and
    Cornelius, 2003). Finally,
* we also add sarcasm type as metadata which [c]ould give an understanding of
  what kind of information/modality is required to improve sarcasm detection
  * Propositional, Embedded, Like-Prefixed and Illocutionary (Camp, 2012)
    * Propositional sarcasm needs context information to be able to detect
      whether it’s sarcasm or not. “your plan sounds fantastic!”
      (Zvolenszky, 2012)
  * Embedded sarcasm has an embedded incongruity within the utterance; thus, the
    text itself is sufficient to detect sarcasm
    * For example: “It’s so much fun working at 2 am at night”
  * Like [mintha]-prefixed sarcasm: a like-phrase to show the incongruity of the
    argument being said, for example, “Like you care” (Joshi+ 2017)
  * Illocutionary sarcasm is a type of sarcasm that bears the sarcasm in the
    non-textual cues, and the text is often the opposite of the attitude
    captured in the audio or video modality
    * eg by Zvolenszky (2012): rolling eyes while saying ”Yeah right” being a
* Figure 1 is a sample in MUStARD++ with the labels and metadata information
  * transcription of the sarcastic utterance, and the text in the yellow bubbles
  * the contextual sentences transcribed from the contextual video frames.  The

# 2 Related Work

* the detection of sarcasm (Joshi+ 2016),(Joshi+ 2018). Research studying
* the impact of sarcasm on sentiment analysis (Maynard and Greenwood, 2014)
  showed that sarcasm often has a negative sentiment, but
  the associated emotions are important to frame the response and follow-up comm
* Schifanella+ (2016) extended sarcasm detection to multimodal data (images and
  text) from social media and observed that
  * visual features did boost the performance over the textual models. Along
  * Sangwan+ (2020) reported the improvement by using image data in addition
    * dataset is curated from Instagram and the authors consider the
    * image, text caption, and the transcript embedded within the image as
      multiple modalities
  * Cai+ (2019) used text features, image features and image attributes as three
    modalities and proposed a multimodal hierarchical fusion model for tweets
* MUStARD (Castro+ 2019) is a subset of Multimodal Emotion Lines Dataset
  (MELD) (Poria+ 2018) and
  * MELD is a multimodal extension of textual dataset EmotionLines (Chen+ 2018)
  * MELD contains about 13,000 utterances from the TV series Friends, labeled
    with one of the seven emotions (anger, disgust, sadness, joy, neutral,
    surprise, and fear) and sentiment
* emotion
  * EmotionLines (Chen+ 2018) and EmoryNLP (Zahiri and Choi, 2017) are textual
    datasets with conversational data, the former containing
    * EmotionLines data from the TV show Friends and private Facebook messenger
      * EmoryNLP curated from the series Friends
  * Iemocap (Busso+ 2008) is a wellknown multimodal, dyadic dataset with 151
    recorded videos annotated with categorical emotion labels, as well as
    dimensional labels such as valence, activation, and dominance
  * none of them have sarcastic utterances
* Bedi+ (2021) released a Hindi-English code-mixed dataset for the problem of
  Multimodal Sarcasm Detection and Humour Classification in a conversational
  * attention-based architecture named MSH-COMICS for enhanced utter- ance
    classification
* dimensional models of emotion (Russell, 1980; Plutchick, 1980) also propose
  (Ex: Valence, Arousal, Dominance), which could help in capturing the
  complicated nature of human emotions better
  * Zafeiriou+ (2017) created a database of 298 videos (non-enacted,
    in-the-wild) and captured facial affect in their subjects in terms of
    valence arousal annotations ranging between -1 to +1
  * Preoţiuc-Pietro+ (2016) annotate valence and arousal on Facebook data
    * nine-point scale . They also release
    * bag-of-words regression models trained on their data which
    * outperform popular sentiment analysis lexicons in valence-arousal pred
