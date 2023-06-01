A cross-corpus study on speech emotion recognition
Rosanna Milner, Md Asif Jalal, Raymond W. M. Ng, Thomas Hain
ASRU 2019 arXiv:2207.02104 [cs.CL]

* speech emotion datasets: difficult to acquire large quantities of reliable
  * acted emotions may be over the top compared to
    less expressive emotions displayed in everyday life. Lately,
  * recently larger datasets with natural emotions have been created. Instead
  * we not ignor smaller, acted datasets, this study investigates
* question: whether information learnt from acted emotions is useful for
    detecting natural emotions
  * Cross-corpus research has mostly considered cross-lingual and cross-age
  * difficulties arise from different methods of annotating emotions causing a
  * we: four adult English datasets covering acted, elicited and natural
  * A SOTA model is proposed to accurately investigate the degradation of perf
    * a bi-directional LSTM with an attention mechanism to classify emotions
    * the transfer of information is not successful
    * more suitable
      * Out-of-domain models, followed by adapting to the missing dataset, and
        domain adversarial training (DAT) are shown to be more suitable to
      * positive information transfer from acted datasets to more natural
      * benefits from training on different corpora. 

# 1 Intro

* Speech emotion recognition (SER) aims to automatically detect human
  * reviews into methods, features and datasets exist [3, 4, 5, 6].
* A lot of research within SER has focussed on a single dataset avoiding
  different annotation problems [10]
  * [10] Mia Atcheson, Vidhyasaharan Sethu, and Julien Epps,
    “Demonstrating and modelling systematic time-varying annotator disagreement
    in continuous emotion annotation,” in
    Interspeech, Hyderabad, India, 2-6 Sep, 2018, pp.  3668–3672.
  * Cross-corpus has been investigated with initial work by Schuller+ [11]
    using various normalising schemes across six datasets.
* training test mismatch
  * In [12], to relieve the feature distribution mismatch between training and
    test speech, importance weights are learnt for a support vector machine
    (SVM) which applies three domain adaption methods for children’s speech
    corpora
  * [13, 14, 15] learnt new representations for training and test speech via an
    autoencorder based domain adaptation framework
  * domain-adaptive least squares regression model (DALSR) [16, 17] calculates
    the maximum mean discrepancy (MMD) to balance the feature distribution
    difference using transfer non-negative matrix factorisation (TNNMF)
  * Kim+ [18] used auxiliary gender and naturalness recognition tasks in a
    multi-task learning setting for emotion recognition. Most recently, to deal
  * unsupervised: the domain-adaptive subspace learning (DoSL) approach was
    * an SVM is trained based on labelled training set speech signals [19].
* hE, the majority of this cross-corpus work has been cross-lingual and
  occasionally both cross-lingual and cross-age. In the past this has been
  * now larger datasets, 
    * eg MOSEI database which has around 65 hours of natural emotion data [20],
* Deep neural networks, such as long short-term memory (LSTM) networks [21] and
  attention mechanism [22]
  * in various emotion recognition studies [23, 17, 18, 24]. Recently,
  * in speech recognition, domain adversarial training (DAT) was proposed [25]
    * applicable to the SER task [26], and achieves representation learning
    * a gradient reversal layer is applied in the domain classifier in an
      attempt to bring the representations closer.  Training models using DAT
    * saves time, by learning two representations simultaneously, it also aims
    * transfer of information between the two tasks.
* we cross-corpus SER within the same language (English) and same age (adult)
  * between acted and natural datasets, the first study of this kind.
  * A bidirectional-LSTM with an attention mechanism approach is considered for
  * The information transfer to other datasets is investigated and further
  * experiments looking into domain adversarial training (DAT) and
    out-of-domain (OOD) models, then adapting these models, are considered. The

# 2 Approach

# 3 Datasets studied

* two acted datasets, eNTERFACE [30] and RAVDESS [31],
* one elicited dataset, IEMOCAP [32], and
* one natural dataset, MOSEI [20]
* Table 1 gives an overview of the emotion classes covered in each dataset.

## 3.1. eNTERFACE

* eNTERFACE (ENT, 2005) has the big-six emotion classes and contains about
  * 1 hour of acted utterrances [30]
  * 5 recordings of each emotion for every speaker
  * 44/43 speakers (8 female), however due to further inspection of the data this
  * 1287 segments (Spkr23 is missing three happy segments)
  * speakers are from 14 nations, not all native speakers, resulting in
    different English accents
  * A training set is created with 38 speakers (Spkr1 to Spkr39 without Spkr6)
  * test set contains the last 5 speakers (Spkr40 to Spkr44).

## 3.2. RAVDESS

* RAVDESS (RAV) is another acted dataset containing 24 speakers (12/12 fe/male)
  * 1.5 hours of speech [31]. The dataset contains the
  * big-six emotions and also calm and neutral. It contains
  * North American English accented speech
    * wiki: a class of historically related American English dialects, spoken
      by predominantly white Americans, in much of the Great Lakes region,,,
  * the first 19 speakers for training and the last 5 for testing. The
  * 0 for no emotion, 1 as exists and 2 as strong emotion
    * All 2 values have been changed to 1 for classification.

## 3.3. IEMOCAP

* IEMOCAP (IEM) contains utterances from 10 speakers (5 male and 5 female) over
  * 12 hours [32]
  * five dyadic sessions (between two speakers) which are
    either scripted or improvised to elicit emotions. As well as the
  * big-six emotions + excitement, frustration, neutral and other.  The English
  * North American accent
  * The first four sessions, containing 8 speakers, are used as training data
  * the last session, containing 2 speakers, is used for testing
  * IEM4: In the literature it is common for IEMOCAP to be evaluated as 4 class
    * happy, sad, anger and neutral (excitement is combined with happy, [33])

## 3.4. MOSEI

* MOSEI (MOS) is currently the largest sentiment and emotion dataset at
  * around 65 hours of data and more than 1000 speakers [20]. Utterances have
  * segmented from YouTube videos and annotated for the big-six emotions using
    Amazon Mechanical Turk. As data is collected from YouTube and
  * the orig YouTube videos are not specifically designed as an emotion ie natr
  * English speech but it is unclear which accents are covered.  The official
  * training, validation and test splits1 for the ACL 2018 conference have been
    * training and validation sets are combined for training.  The emotion
  * labels in the range 0 to 3, have been changed to binary values,
    * whether the emotion exists or not.

# 4 Experimental setup and results 3

## 4.9 Discussion

# 5 Conclusions
