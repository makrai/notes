Sentiment Analysis: 
  Aut Detecting Valence, Emotions, and Other Affectual States from Text
Saif M. Mohammad
manuscript of the chapter in Emotion Measurement 2021 2nd ed arXiv:2005.11882

# Abstract

* Sentiment analysis, the automatic determination of emotions in text
  * app in commerce, public health, government policy, social sciences, & art
  * text, from news to social media posts, is improving our
  * understanding how 
    * people convey emotions through language but also how 
    * emotions shape our behaviour
* we: a sweeping overview of sentiment analysis research
  * origins, tasks, challenges, methods and resources used, and applications.
  * potential for harmful outcomes
  * fairness

# 2. Challenges in Sentiment Analysis

## Complexity and Subtlety of Language Use

## Use of Creative and Non-Standard Language

## Lack of Para-Linguistic Information

* Often we communicate affect through 
  * tone, pitch, emphasis, stress, intonation
    * explicit emphasis markers (for example, Mary used *Jack’s* computer) and
    * explicit sentiment markers such as emoticons and emoji.
  * facial expressions
    * work linking different facial expressions to different emotional states
      (Ekman, 1992; Ekman & Friesen, 2003)

## Lack of Large Amounts of Labeled Data

## Subjective and Cross-Cultural Differences

# 3. Sentiment Analysis Tasks

## 3.4 Detecting Semantic Roles of Emotion

* Frame Semantics: the meanings of most words can be understood in terms of a
  set of related entities and their relations (Fillmore, 1976, 1982). For
  * eg, the concept of education usually involves a student, a teacher, a
    course, an institution, duration of study, and so on
  * The set of related entities is called a semantic frame and 
  * the individual entities, defined in terms of the role they play with
    respect to the target concept, are called the semantic roles
  * FrameNet (Baker, Fillmore, & Lowe, 1998) is 
    a lexical database of English that records such semantic frames.9 
  * emotions
    * Table 1 shows the FrameNet frame for emotions. Observe that the frame
    * roles such as who is experiencing the emotion (the experiencer), the
      person or event that evokes the emotion, and so on.  Information
      retrieval, text summarization, and textual entailment benefit from
      determining not just the emotional state but also from determining these
      semantic roles of emotion.
* Mohammad, Zhu, Kiritchenko, and Martin (2015) created 
  a corpus of tweets from the run up to the 2012 US presidential elections,
  * annotations for 
    * valence, emotion, stimulus, and experiencer. The tweets
    * intent (to criticize, to support, to ridicule, etc.) and 
    * style (simple statement, sarcasm, hyperbole, etc.). The dataset is made
  * available for download.10 They also show that 
  * emotion detection alone can fail to distinguish between sev types of intent
    * eg the same emotion of disgust can be associated with the intents of ‘to
      criticize’, ‘to vent’, and ‘to ridicule’. They also developed 
  * systems that automatically classify electoral tweets: emotion and purpose
    * features that have traditionally been used in tweet classification, such
      * eg word and character ngrams, word clusters, valence association
        lexicons, and emotion association lexicons.  
* Ghazi, Inkpen, and Szpakowicz (2015) compiled 
  FrameNet sentences that were tagged with the stimulus of certain emotions.
  * a stat model to detect spans of text referring to the emotion stimulus

## 4.1 Machine Learning Algorithms

* Despite the substantial dominance of neural and deep learning
  * more traditional machine learning frameworks
  * eg linear regression, support vector machines, and decision trees, as well
    * word n-grams and sentiment lexicons, remain relevant
  * notably because of their simplicity, ease of use, interpretability, and
    * potential ability to complement neural representations and improve
* Word and character ngrams are widely used as features in a number of text
  classification problems including sentiment classification as well.  Features
  * manually and automatically created sentiment lexicons  
    eg word–valence/word–arousal/word–emotion association lexicons are also
    commonly used in conjunction with neural representations 
    for detecting emotions or for detecting affect-related classes such as
    personality traits and states of well-being
    (Mohammad & Bravo-Marquez, 2017; Mohammad+, 2018; Chatterjee+, 2019;
    Agrawal & Suri, 2019). Examples
* commonly used 
  * manually created sentiment lexicons are: 
    * General Inquirer (GI, Stone, Dunphy, Smith, Ogilvie+ 1966), the 
    * NRC Emotion Lexicon (Mohammad & Turney, 2010; Mohammad & Yang, 2011a), the
    * NRC Valence, Arousal, and Dominance Lexicon (Mohammad, 2018a), and 
    * VADER (Hutto & Gilbert, 2014). Commonly used 
  * automatically generated sentiment lexicons include 
    * SentiWordNet (SWN, Esuli & Sebastiani, 2006), 
    * Sentiment 140 lexicon (Mohammad, Kiritchenko, & Zhu, 2013), and 
    * NRC Hashtag Sentiment Lexicon (Mohammad & Kiritchenko, 2014). 
  * Other traditional text features include those derived from parts of speech,
    punctuations (!, ???), word clusters, syntactic dependencies, negation
    terms (no, not, never), and word elongations (hugggs, ahhhh).
  * We will discuss manually and automatically generated emotion lexicons in
    more detail in Section 5.

## 4.3 Automatically Detecting and Analyzing Emotions

### • Work on Ekman’s Six and Plutchik’s Eight: Paul Ekman proposed a set of six

### • Work on Other Small Sets of Emotions: The 

* ISEAR Project asked 3000 student respondents to report situations in which
  they had experienced joy, fear, anger, sadness, disgust, shame, or guilt.18
  * Thomas+ (2014) applied supervised machine learning techniques on the ISEAR
    dataset for 7-way emotion classification.  
* Neviarouskaya+ (2009) collected 1000 sentences from the Experience Project
  webpage and manually annotated them for fourteen affectual categories.19
  * Experience Project is a portal where users share their life experiences.
    These shared texts are usually rife with emotion.
* Bollen, Pepe, and Mao (2009) analyzed 9,664,952 tweets posted in 2008 using
  Profile of Mood States (POMS, McNair, Lorr, & Droppleman, 1989)
  * POMS is a psychometric instrument that measures the mood states of tension,
    depression, anger, vigor, fatigue, and confusion.

### • Distant Supervision Datasets: Distant supervision techniques proposed in Mo-

### • Work on Emotion-Labeled Datasets in Languages Other than English

* Wang (2014) annotated Chinese news and blog posts with the Ekman emotions.
  * also translated Alm’s fairy tales dataset into Chinese
  * Quan and Ren (2009) created a blog emotion corpus in Chinese called the
    Ren-CECps Corpus.  The sentences in this corpus are annotated with 
    * eight emotions: expectation, joy, love, surprise, anxiety, sorrow, anger,
      and hate. Sentences not associated with any of these eight categories are
      marked as neutral. The corpus has 
    * 1,487 documents, 11,255 paragraphs, 35,096 sentences, and 878,164 Chinese
      words.
* The 2013 Chinese Microblog Sentiment Analysis Evaluation (CMSAE) compiled a
  * posts from Sina Weibo (a popular Chinese microblogging service) annotated
  * seven emotions: anger, disgust, fear, happiness, like, sadness and
    surprise.20 If a post has no emotion, then it is labeled as none. The
  * training/test set contains 4000/10,000 instances (13252/32185 sentences).
  * Chinese emotion classification using transfer learning and neural networks
    * Yu, Marujo, Jiang, Karuturi, and Brendel (2018), 
    * Matsumoto, Sasayama, Yoshida, Kita, and Ren (2018).
* Arabic emotion datasets include the tweet datasets from the shared task
  Semeval-2018 task 1: Affect in Tweets Mohammad+ (2018) and other works
  * Badarneh, Al-Ayyoub, Alhindawi, Jararweh,+ (2018), 
  * Al-Khatib and El-Beltagy (2017). 
  * Hussien, Tashtoush, Al-Ayyoub, and Al-Kabi (2016) analyzed the
    effectiveness of using emoticons for distant supervision in Arabic tweets.

### • Multimodal Datasets: There is new work on developing word representations not

* images that the words are associated with (Kiela & Bottou, 2014; Hill &
  Korhonen, 2014; Lazaridou, Bruni, & Baroni, 2014). (An image and a word can
  be considered associated if the caption for the image has the word, the image
  is a representation of the concept the word refers to, etc.) This bridges the
  * applications such as automatic image captioning (Karpathy, Joulin, & Li,
    2014; Kiros, Salakhutdinov, & Zemel, 2014)
* Mohammad and Kiritchenko (2018) created a dataset of more than 4,000 pieces
  of art (mostly paintings) that has annotations for emotions evoked in the
  observer by the painting (image and title), the title alone, and the image
  alone. The pieces of art are selected from WikiArt.org’s collection for four
  western styles (Renaissance Art, Post-Renaissance Art, Modern Art, and
  Contemporary Art). In addition, there is a large body of work on analyzing
* videos that analyzes facial expressions, gestures, text transcripts, and
  vocal features
  * survey by Marechal+ (2019).) Such multi-modal representations of emotions
  * applicatios also: captioning images or audio for emotions and even
    generating text that is affectually suitable for a given image or audio
As seen above, there are a number of datasets where sentences are manually
labeled for emotions. They have helped improve our understanding of how people
use language to convey emotions and they have helped in developing supervised
* questions remain unexplored. For example, to what extent do people 
  * convey emotions without using explicit emotion words? 
  * are some emotions more basic than others?  is there 
    * a taxonomy of emotions?  are some emotions indeed combinations of other
    emotions (optimism as the combination of joy and anticipation)? can 
  * data labeled for certain emotions be useful in detecting certain other emo?

## 4.4 Detecting Subjectivity

* applications in question answering, information retrieval, paraphrasing,
* techniques: patterns of word usage, identifying certain kinds of adjectives,
  detecting emotional terms, and occurrences of certain discourse connectives
  (Hatzivassiloglou & Wiebe, 2000; Riloff & Wiebe, 2003; Wiebe+, 2004). 
* Opinion Finder is a popular freely available subjectivity sys (Wilson+ 2005)
* hE very little work on subjectivity detection in the later half of 2010s;
  likely because of the greater interest in modeling sentiment and emotion
  directly as opposed to through the framework of subjectivity.

# 5. Capturing Term–Sentiment Associations

### 5.1.3 Large, Influential, Manually Created Lexicons

* The earliest emotion lexicons 
  eg the General Inquirer and ANEW capture 
  * words that denotate (not just connotate) an emotion
  * These lexicons tend to be small
* Starting with the NRC Emotion lexicon: words that denotate or connotate an emo
  * eg _party_ does not denotate joy, but is associated with/connotates joy
  * Below They are ordered by size

#### NRC Valence, Arousal, and Dominance Lexicon (NRC-VAD): ∼20K English
terms annotated for real-valued scores of valence, arousal and dominance
(Mohammad, 2018a).25 Automatic translations of the words in over 100 languages

#### NRC Emotion Lexicon (EmoLex): ∼14k English terms with binary annotations
(0 or 1) indicating no association or association with eight basic emotions
(those proposed by Plutchik (1980)) as well as for positive and negative
sentiment.26 
* Automatic translations of the words in overl 100 languages included
  (Mohammad & Turney, 2010, 2012)

#### Warriner+ Lexicon: ∼14K English terms annotated for valence, arousal, and
dominance (real-valued scores) (Warriner, Kuperman, & Brysbaert, 2013).27

#### NRC Emotion Intensity Lexicon: ∼10K English terms annotated for intensity
(real-valued) scores corresponding to eight basic emotions (anger,
anticipation, disgust, fear, joy, sadness, surprise, and trust)
(Mohammad, 2018b)

#### MPQA Subjectivity Lexicon: ∼8,000 English terms annotated for valence
(strongly positive, weakly positive, strongly negative and weakly negative)
(Wilson, Wiebe, & Hoffmann, 2005).29 Includes the words and annotations from
the General Inquirer and other sources.

#### Hu and Liu Lexicon: ∼6,800 English terms from customer reviews that are
annotated for valence (positive, negative) (Hu & Liu, 2004).30

#### General Inquirer (GI): ∼3,600 English terms annotated for associations
with various semantic categories including valence (Stone+, 1966).31
These include about 1500 words from the Osgood study
* Note: Stone+ (1966) use the term evaluativeness instead of valence

#### AFINN: ∼2,500 English terms annotated for valence (Nielsen, 2011). The
ratings range from -5 (most negative) to +5 (most positive) in steps of 1.32

#### Linguistic Inquiry and Word Count (LIWC) Dictionary

* ∼1,400 English terms manually identified to denotate the affect categories:
* positive emotion, negative emotion, anxiety, anger, and sadness
* Pennebaker, Boyd, Jordan, & Blackburn, (2015)

#### The Affective Norms for English Words (ANEW)

* ∼1,000 English terms annotated for valence, arousal, and dominance
  (Bradley & Lang, 1999).34 

---

* Emotion lexicons such as those listed above provide simple and effective
  means to analyze and draw inferences from large amounts of text. They are
  also used by machine learning systems to improve prediction accuracy,
  especially when the amount of training data is limited. Large emotion
  * also used in digital humanities, literary analyses, psychology, and art

# 6. Modeling the impact of sentiment modifiers 27

# 7. Sentiment in Sarcasm, Metaphor, and other Figurative Language

# 8. Multilingual and Crosslingual Sentiment Analysis

# 9. Applications

# 11. Summary and Future Directions

* future: sentiment modifiers such as negators and modals, work on detecting
  * figurative and metaphoric language, as well as cross-lingual sentiment
  * understanding the relationships between emotions, multimodal affect
    analysis (involving not just text but also speech, vision, physiological
    sensors, etc), and applying emotion detection to new applications.
* NLP has always been an interdisciplinary field with strong influences from
  * always: Computer Science, Linguistics, and Information Sciences
  * last decade: psychology, digital humanities, history, art, and social sci
    * sometimes attracting controversy. (For example, see the articles on the
      so called [Digital Humanities Wars]
      (https://www.chronicle.com/article/The-Digital-Humanities-Debacle/245986)
* ethics, fairness, and bias of sentiment analysis systems, as well as the use
  * SA to help identify explicit and implicit biases of people.
