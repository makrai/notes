Multimodal Language Analysis in the Wild:
  CMU-MOSEI Dataset and Interpretable Dynamic Fusion Graph
A Zadeh, PP Liang, J Vanbriesen, S Poria, E Tong, E Cambria, M Chen, L Morency
ACL 2018

# Abstract

* multimodal language Analysis is an emerging area of research in NLP
  * communication is multimodal (heterogeneous), temporal and asynchronous
  * language (words), visual (expressions), and acoustic (paralinguistic)
* we:
  * CMU-MOSEI, CMU Multimodal Opinion Sentiment and Emotion Intensity
    * the largest dataset of sentiment analysis and emotion recognition to date
  * novel multimodal fusion technique called the Dynamic Fusion Graph (DFG)
    * how modalities interact with each other in human multimodal language
    * highly interpretable and achieves competitive performance to SOTA

# 1 Intro

* multimodal language has recently become a centric research direction
  (Hazarika+ 2018; Zadeh+ 2018a; Poria+ 2017a; Baltrušaitis+ 2017; Chen+ 2017)
* dual dynamics of multimodal language:
  * intra-modal dynamics (dynamics within each modality) and
  * cross-modal dynamics (dynamics across different modalities)
* datasets have severe shortcomings in the following aspects:
  * Diversity in the training samples
    * crucial due to the complexity of the underlying distribution
    * variability of intra-modal and cross-modal dynamics (Rajagopalan+ 2016)
  * Variety in the topics
    * language and nonverbal behaviors tend to change based on the impression
      of the topic on speakers’ internal mental state
  * Diversity of speakers: speaking styles are highly idiosyncratic
    * overfitting: models learn the identity of speakers (Wang+ 2016)
  * Variety in annotations
    * multiple labels allows for studying the relations between labels
    * multi-task learning has shown excellent performance in the past
* CMU Multimodal Opinion Sentiment and Emotion Intensity (CMU-MOSEI)
  * 23,453 annotated video segments from 1,000 speakers and 250 topics
  * manual transcription aligned with audio to phoneme level
  * All the videos are gathered from online video sharing websites
  * part of the CMU Multimodal Data SDK
  * freely available to the scientific community through Github
* an interpretable fusion model called Dynamic Fusion Graph (DFG)
  * cross-modal dynamics visualized and studied in detail in our experiments
  * superior performance compared to previously proposed models
    for multimodal sentiment and emotion recognition on CMU-MOSEI

# 2 Background

### 2.1 datasets for modeling multimodal sentiment analysis and emotion recog

### 2.1.1 Multimodal Datasets

* CMU-MOSI (Zadeh+ 2016b) is a collection of 2199 opinion video clips each
  annotated with sentiment in the range [-3,3]
* CMU-MOSEI is the next generation of CMU-MOSI
* ICT-MMMO (Wöllmer+ 2013) consists of online social review videos annotated
  at the video level for sentiment
* YouTube (Morency+ 2011) contains videos from YouTube that span a wide range
  of product reviews and opinion videos
* MOUD (Perez-Rosas+ 2013) consists of product review videos in Spanish
  * Each video consists of multiple segments labeled to display positive,
    negative or neutral sentiment
* IEMOCAP (Busso+ 2008) consists of 151 videos of recorded dialogues, with
  * 2 speakers per session for a total of 302 videos across the dataset
  * Each segment is annotated for the presence of
    * 9 emotions (angry, excited, fear, sad, surprised, frustrated, happy,
      disappointed and neutral) as well as
    * valence, arousal and dominance

### 2.1.2 Language Datasets

* Stanford Sentiment Treebank (SST, Socher+ 2013) includes fine grained
  sentiment labels for phrases in the parse trees of sentences collected from
  movie review data
  * larger pool of annotations, we only consider the root level annotations
    for comparison
* Cornell Movie Review (Pang+ 2002) is a collection of 2000 movie-review
  documents and sentences labeled with respect to their overall sentiment
  polarity or subjective rating
* Large Movie Review dataset (Maas+ 2011) contains text from highly polar movie
  reviews
* Sanders Tweets Sentiment (STS) consists of 5513 hand-classified tweets each
  classified to four topics: Microsoft, Apple, Twitter, and Google

### 2.1.3 Visual and Acoustic Datasets

* Vera am Mittag (VAM) corpus consists of 12 hours of recordings of the German
  TV talk-show “Vera am Mittag” (Grimm+ 2008)
  * labeled for continuous-valued scale for three emotion primitives VAD
  * VAM-Audio and VAM-Faces are subsets that contain on acoustic and visual
    inputs respectively
* RECOLA (Ringeval+ 2013) consists of 9.5 hours of audio, visual, and
  physiological (electrocardiogram, and electrodermal activity) recordings of
  online dyadic interactions
* Mimicry (Bilakhia+ 2015) consists of audiovisual recordings of human
  interactions in
  * two situations:
    * discussing a political topic and
    * playing a role-playing game
* AFEW (Dhall+ 2012, 2015) is a dynamic temporal facial expressions data corpus
  * close to real world environment extracted from movies
* tab 1: Detailed comparison of CMU-MOSEI to the datasets in this section is
  * CMU-MOSEI has
    * longer total duration as well as larger number of data point in total
    * a larger variety in number of speakers and topics. It has
    * all three modalities provided, as well as
    * annotations for both sentiment and emotions

### 2.2 baselines and recent models for sentiment analysis and emotion recog

* Modeling multimodal language in NLP and multimodal machine learning
* symbol for reference in the Experiments and Discussion section (Section 5)
* # MFN: (Memory Fusion Network, Zadeh+ 2018a) synchronizes multimodal
  sequences using a multi-view gated memory that stores intra-view and
  cross-view interactions through time
* ∎ MARN: (Multi-attention Recurrent Network, Zadeh+ 2018b) models intra-modal
  and multiple cross-modal interactions by assigning multiple attention
  coefficients. Intra-modal and cross-modal interactions are stored in a hybrid
  LSTM memory component
* ∗ TFN (Tensor Fusion Network, Zadeh+ 2017) models inter and intra modal
  interactions by creating a multi-dimensional tensor that captures unimodal,
  bimodal and trimodal interactions
* ◇ MV-LSTM (Multi-View LSTM, Rajagopalan+ 2016) is a recurrent model that
  designates regions inside a LSTM to different views of the data
* § EF-LSTM (Early Fusion LSTM) concatenates the inputs from different
  modalities at each time-step and uses that as the input to a single LSTM
  (Hochreiter and Schmidhuber, 1997; Graves+ 2013; Schuster and Paliwal, 1997)
  * In case of unimodal models EF-LSTM refers to a single LSTM
* baseline models:
  * multimodal
    * † BC-LSTM (Poria+ 2017b),
    * ♣ C-MKL (Poria+ 2016),
    * ♭ DF (Nojavanasghari+ 2016),
    * ♡ SVM
      (Cortes & Vapnik, 1995; Zadeh+ 2016b; Perez-Rosas+ 2013; Park+ 2014)
    * ● RF (Breiman, 2001), THMM (Morency+ 2011), SAL-CNN (Wang+ 2016),
        3D-CNN (Ji+ 2013)
  * language only baseline models:
    * ∪ CNN-LSTM (Zhou+ 2015), RNTN (Socher+ 2013),
    * ×: DynamicCNN (Kalchbrenner+ 2014),
    * ⊳ DAN (Iyyer+ 2015),
    * ≀ DHN (Srivastava+ 2015),
    * ⊲ RHN (Zilly+ 2016)
  * For acoustic only baseline models
    * AdieuNet (Trigeorgis+ 2016), SERLSTM (Lim+ 2016)

# 3 CMU-MOSEI Dataset

## 3.1 Data Acquisition

* Social multimedia presents a unique opportunity for acquiring large
  * Users post their opinions in the forms of monologue videos
  * only one person in front of camera discussing a certain topic of interest
  * three modalities: language in the form of spoken text, visual via perceived
    gestures and facial expressions, and acoustic through intonations & prosody
* our automatic data acquisition process, videos from YouTube are analyzed for
  * presence of one speaker in the frame using face detection to ensure the
  * speaker’s attention is exclusively towards the camera, no moving cameras
    (such as camera on bikes or selfies recording while walking).  We use a di-
  * 250 frequently used topics in online videos as the seed for acquisition. We
    restrict the
    * most freq: reviews (16.2%), debate (2.9%) and consulting (1.8%) while
    * the remaining topics are almost uniformly distributed
  * number of videos acquired from each channel to a maximum of 10. This
  * 1,000 identities from YouTube. The definition of a identity is proxy to the
    number of channels since accurate identification requires quadratic manual
    annotations, which is infeasible for high number of speakers
  * videos limited to have manual and properly punctuated transcriptions
  * => 5,000 videos which were then
  * manually checked for quality of video, audio and transcript by 14 expert
  * The judges also annotated each video for gender and confirmed that each
    video is an acceptable monologue
  * => 3228 videos remained after manual quality inspection. We also
  * automatic checks on the quality of video and transcript which are discussed
    in Section 3.3 using facial feature extraction confidence and forced
    alignment confidence.  Furthermore,
  * we balance the gender in the dataset using the data provided by the judges
    (57% male to 43% female).  This constitutes the final set of raw videos in
  * tokenized into sentences using punctuation markers manually provided by
    transcripts. Due to the high quality of the transcripts, using punctuation
    * better sentence quality than using the Stanford CoreNLP tokenizer
      (Manning+ 2014)
    * verified on a set of 20 random videos by two experts. After tokenization,
* 23,453 sentences were chosen as the final sentences in the dataset
  * restricting each identity to contribute at least 10 and at most 50 sents to
* Table 2 shows high-level summary statistics of the CMU-MOSEI dataset

## 3.2 Annotation

* Annotation of CMU-MOSEI follows closely the annotation of
  CMU-MOSI (Zadeh+ 2016a) and Stanford Sentiment Treebank (Socher+ 2013)
  * Each sentence is annotated for
  * sentiment on a [-3,3] Likert scale
  * Ekman emotions (Ekman+ 1980) of {happiness, sadness, anger, fear, disgust,
    surprise} are annotated on a [0,3] Likert scale for presence of emotion x:
  * 3 crowdsourced judges from Amazon Mechanical Turk platform
    * 5 minutes training video on how to use the annotation system. All the
    * master workers with higher than 98% approval rate to assure high quality
* Extensive statistics of the dataset including the crawling mechanism, the
  annotation UI, training procedure for the workers, agreement scores are
  available in submitted supplementary material on arXiv
* Figure 2 shows the distribution of sentiment and emotions in CMU-MOSEI
  dataset
  * slight shift in favor of positive sentiment which is
    * similar to distribution of CMU-MOSI and SST
    * an implicit bias in online opinions being slightly shifted to positive,
    * different prevalence for different emotions
    * The most common category is happiness with more than 12,000 positive
  * nL the least frequent emotion, fear, still has 1,900 data points, OK for ML
    * The least prevalent emotion is fear with almost 1900 positive sample

## 3.3 Extracted Features

* Data points in CMU-MOSEI come in video format with one speaker in front of
  the camera. The extracted features for each modality

### Language: All videos have manual transcription

* Glove word embeddings (Pennington+ 2014) were used to extract word vectors
* Words and audio are aligned at phoneme level using P2FA forced alignment
  model (Yuan and Liberman, 2008). Following this, the
* visual and acoustic modalities are aligned to the words by interpolation
  Since the utterance duration of words in English is usually short, this
  interpolation does not lead to substantial information loss

### Visual

* Frames are extracted from the full videos at 30Hz
* bounding box of the face is extracted using the MTCNN face detection
  algorithm (Zhang+ 2016)
* facial action units extracted through Facial Action Coding System (FACS)
  (Ekman+ 1980). Extracting these action units allows for accurate tracking and
  understanding of the facial expressions (Baltrušaitis+ 2016)
* We also extract a set of six basic emotions purely from static faces
  using Emotient FACET (iMotions, 2017)
* MultiComp OpenFace (Baltrušaitis+ 2016) is used to
  extract the set of 68 facial landmarks, 20 facial shape parameters, facial
  HoG features, head pose, head orientation and eye gaze (Baltrušaitis+ 2016)
* face embeddings from commonly used facial recognition models such as DeepFace
  (Taigman+ 2014), FaceNet (Schroff+ 2015) and SphereFace (Liu+ 2017)

### Acoustic

* We use the COVAREP software (Degottex+ 2014) to extract acoustic features
  * 12 Mel-frequency cepstral coefficients,
  * pitch,
  * voiced/unvoiced segmenting features (Drugman and Alwan, 2011)
  * glottal source parameters (Drugman+ 2012; Alku+ 1997, 2002)
  * peak slope parameters and maxima dispersion quotients
    (Kane and Gobl, 2013)

# 4 Multimodal Fusion Study

* Dynamic Fusion Graph (DFG) is easily interpretable through what is called
  efficacies in graph connections
