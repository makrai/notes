Opinions in Interactions: New Annotations of the SEMAINE Database
Valentin Barriere, Slim Essid, Chloé Clavel
LREC 2022

* This dataset is part of the
  Sequence labellIng evaLuatIon benChmark fOr spoken laNguagE benchmark
  (Chapuis+ 2020)

# Abstract

* we collected new annotations of opinions
  over the multimodal corpus SEMAINE composed of dyadic interactions
  * already annotated continuously in two affective dims: Valence and Arousal
  * We annotated the part of SEMAINE called Solid SAL composed of
    79 interactions between a user and an operator
    playing the role of a virtual agent
    designed to engage a person in a sustained, emotionally colored conversat
  * aligned at the word level
    using the available high-quality manual transcriptions
  * 5627 speech turns for a total of 73,944 words, corresponding to
    6 hours 20 minutes of dyadic interactions
  * Each interaction has been labeled by three annotators at the speech turn
    level following a three-step process. This method allows us to obtain a
    precise annotation regarding the opinion of a speaker
  * more than 48% of the annotated speech turns containing at least one opinion
* a new baseline for the detection of opinions in interactions
  improving slightly a SOTA model with RoBERTa embeddings, F1-score at 0.72

# 1 Intro

* The way a human expresses affective phenomena (opinion, emotion or sentiment)
  is very different depending on the media he uses (tweet/phone call/real-life)
  * Certain kinds of phenomena are easier to detect using specific modalities
  * many more studies on emotion recog in speech than in text (Schuller+ 2009),
    because of para-linguistics like tone, pitch or emphasis
* the study of opinion phenomena was initially restricted to text
  (Irsoy and Cardie, 2014; Balahur+ 2010) which has a clearer syntax
  * oral language: complexity of the annotation of the phenomenon and the
    volatility of the linguistic structure
* corpora for the study of multimodal affective phenomena
  * without interaction (Zadeh+ 2018; Morency+ 2011)
  * with dyadic interactions (Ringeval+ 2013; Busso+ 2017) or
  * with multiparty interactions (Poria+ 2019a; Lotfian and Busso, 2018)
  * majority of the available annotations are centered either on the emotions
    (McKeown+ 2012) or on the sentiment (Zadeh+ 2018)
  * we use multimodal data to detect the opinions in a dyadic interaction
* Some datasets are acted (Busso+ 2008)
  * emotions that are too rare in real-life data, like fear (Busso+ 2017)
  * This being not a problem for opinions, we decided to annotate a corpus
    containing non-acted interactions
  * SEMAINE corpus of McKeown+ (2012), which is a corpus of
    dyadic interactions between a spontaneous human-user and a human-agent
    playing a predefined role
    * The agent is intended to trigger an emotion in the user and engage them
      in an emotionally colored discussion
    * crafted to contain affective phenomena, likely to be dense with opinions
* links between the different affective phenomena are blurred (Munezero+ 2014)
  * nL the difference between emotion and opinion is pretty clear
  * emotions are physiological 
  * opinions are constructed and prominently based on objective and/or
    subjective probabilities of information about a topic, and not necessarily
    charged in emotion (Munezero+ 2014)
* SEMAINE (Schuller+ 2012) already contains annotation in emotions regarding
  4 affective dimensions, namely activity, expectation, power, and valence
  * used recently to compare different models of Emotion Recognition in
    Conversation (ERC, Poria+ 2019b) and can be useful to investigate the
    links between emotions and opinions in a multimodal dyadic context
* our annotation process, we focused on
  * the distinction between an opinion and an emotion in order to get clean
    annotation and
  * the use of the conversational context. In order to achieve the former goal,
  * learning phase: showing annotators examples of expected annotations in a
    * following the protocol of Langlet+ (2017) on another task and corpus, and
  * feedback on their work after the annotation of an entire discussion. In
    * we used all the conversational context to detect opinions, which is
      * unlike most of the previous works on multimodal data that were focusing
        on annotating the emotion or sentiment of a speaker
        within its speech turn or in an utterance (Zadeh+ 2018)

# 2 schema and web platform for simple annotation of long dyadic interactions

# 3 analysis of the corpus and the annotations

* inter-agreement and the ground truth obtained by majority vote

# 4 results of two baseline SOTA models for APReC

* APReC: Affective Phenomenon Recognition in Conversation (APReC)
* this section: valence and arousal for emotions and opinion
* baseline based on an ERC (Emotion Recognition in Conversation) SOTA model
  * a variant of the DialogueRNN of Majumder+ (2018) since it aims to detect an
    affective phenomenon in a conversation and is SOTA on the SEMAINE dataset
* we used a subset of SEMAINE 
  * 72 sessions, 5210 speech turns and 68,043 tokens, which has the
    annotations from AVEC and our annotations
  * the same documents Majumder+ (2018) used in the training and testing sets
* We further improve that SOTA model
  * using the high-quality manual transcripts
    we extract RoBERTa features (Liu+ 2019) at the granularity of a speech turn
  * We chose to do so because opinions phenomena are more centered on the text
    than the emotions are
  * we validated this new model on ERC, out-performing the SOTA in ERC on the
    SEMAINE dataset (see Table 6), before using the new model on our task
  * The version of the DialogueRNN we used is
    * the one that worked the best for Majumder+ (2018)
    * bidirectional version with attention and listener state update
    * trained for 600 epochs, with a dropout of 0.3 and an
      ℓ2 regularization weight of 1e-4
    * We trained the model 5 times, reporting average performance
* Our model using the RoBERTa embeddings improves greatly on the Valen & Arous
  * either regarding the MAE or the Pearson coefficient
  * The best results on opinion were obtained using a bimodal model
    using the textual and the audio modalities.3 
  * ie DialogueRNN with RoBERTa embeddings is a strong baseline for
    Affective Phenomenon Recognition in Conversation (APReC)
