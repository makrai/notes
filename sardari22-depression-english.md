Audio based depression detection using Convolutional Autoencoder
Sardari+
Expert Systems with Applications Volume 189, 1 March 2022, 116076

implementation of the preprocessing phase and the proposed method at
https://github.com/SaraS92/CAE_ADD

* Thorough experimental study based on a real-world depression detect dataset
* Complete comparison of proposed feature extraction method with other techs

# Abstract

* Depression requires early diagnosis and treatment
* audio-based Automatic Depression Detection (ADD) system has sparked the
  * most of the reported approaches rely on hand-crafted audio features
  * They combine wide variety of audio-related features
  * large feature space can lead to high-dimensionality issues
    * increase the risk of overfitting
* we: a deep learning (DL) technique
  * an end-to-end Convolutional Neural Network-based Autoencoder (CNN AE)
  * sample imbalance problem ~> we use a cluster-based sampling technique
    * highly reduces the risk of bias towards the major class (non-depressed)
* experiments on Distress Analysis Interview Corpus-Wizard of Oz (DAIC-WOZ)
  * baseline: the hand-crafted feature extraction methods and other studies in
  * the proposed method outperforms other well-known audio-based ADD models
    with at least 7% improvement in F-measure for classifying depression

# 1 Intro

* the “Audio-Visual Emotion Challenges” (AVEC) competition has been held
  * mental disorder, examples being
    bipolar (Ringeval+ 2018) and 
    depression (Valstar+ 2016, Ringeval+ 2017, Valstar+ 2013, Valstar+ 2014)
  * One of the most popular sub-challenges is Depression Classification
    Sub-Challenge (DCC, Valstar+ 2016)
    * distinguishing depressed and non-depressed speakers using
    * three main modalities: audio, visual, and textual (a transcript)
* several datasets for languages such as German, Turkish and English
  (Gratch+ 2014, Ozkanca+ 2018, Valstar+ 2014)
  * German database as a part of the AVEC 2014 challenge (Valstar+ 2014)
  * Turkish which was collected at a hospital in Istanbul with 70 subjects
  * Black Dog dataset (McIntyre+ 2009) which includes recordings of audio/video
    from 40 speakers with a major depressive disorder
    * rating: Quick Inventory of Depressive Symptomatology Self Report scale
      (QIDS-SR, Cohn+ 2018)
* DAIC-WOZ (Gratch+ 2014)
  * interviews between participants (patients) and a virtual questioner
  * to develop a generalized depression detection model, we use this dataset
  * spoken in English, more sample data, ie? more participants
    compared to other dataset
* depression detection systems based on both visual and vocal features
  * Yang+ (2017): a hybrid depression classification and estimation method
    * fusion of audio, video and textual information and the 
    * experiments are carried out on DIAC-WOZ dataset. The study utilized a
    * multivariate regression model fusing the depression degree estimations
      extracted from each modality
    * text modality for developing depression/non-depression classification
      system using Paragraph Vector (PV), Support Vector Machine (SVM), and
      Random Forest where the whole system resulted in
    * 0.667F-measure for depressed class in the dev set. In
  * Al Hanai+ (2018) based on the sequences of audio and textual transcriptions
    * multi-modal Long Short-Term Memory (LSTM) model that combined the
      features extracted from both text and audio are evaluated. This model
      yielded the performance of 0.77F-measure score
  * Yang+ (2016): a gender specific Decision Tree classifier based on
    visual and vocal features. Their work was the winner of the AVEC-2016
    * F1 score of 0.57 for depressed class in testing set. Despite the fact
  * fusion of different modalities has been shown to be efficient
    * hE affects the acceptability of the system in real-world situations
* three phases: preprocessing, feature extraction, and classification
* unbalanced data problem in depression detection
  * techniques like random sampling to overcome the problem of unbalanced
    (Ma+ 2016, Vázquez-Romero and Gallardo-Antolín, 2020)
  * hE, both of the undersampling and oversampling as random sampling
    strategies have limitations
  * undersampling: some of the useful information from the majority class
    might be eliminated
  * oversampling: likely overfitting in the model (Lin+ 2017)
  * clustering-based resampling (undersampling) is to
    group similar data samples from the majority class into diff clusters
    * Therefore, the cluster centroid (or center) can be used to represent
      the data in the whole group
    * ie reducing the size of the majority class without losing info
* feature extraction
  * the performance of the model significantly depends on feature extraction
    (Nakisa, Rastgoo, Rakotonirainy, Maire, & Chandran, 2020)
  * Hand-crafted features can be extracted either by using special algorithms
    or utilizing the knowledge of human experts
  * Most of the studies related to ADD (Pampouchidou+ 2016, Valstar+ 2016,
    Yang+ 2016) rely on conventional hand-crafted feature extraction methods
    like COVAREP (Cooperative Voice Analysis Repository for Speech
    Technologies)
  * hE COVAREP might obtain a high dimensional feature set including relevant
    and irrelevant/less-relevant features to our specific problem of depression
    * curse of dimensionality, avoid overfitting, and have better
    * we should reduce the dimensionality to a feature space that corresponds
    * intrinsic representation of data (Van Der Maaten+ 2009)
* DL techniques in automatic feature extraction and classification
  (Nakisa+ 2020, Nakisa+ 2018b, Nakisa+ 2018a, Rastgoo+ 2019, Rastgoo+ 2018,
  Zhang+ 2017, Mou+ 2021, Banan+ 2020, Shamshirband+ 2019, Fan+ 2020)
  * ADD systems using DL methods
* Depaudionet proposed by Ma+ (2016)
  * focused on the two challenges of data representation and unbalance issue
    * audio files in the DAIC-WOZ dataset
  * audio files were firstly converted to spectrograms (= time–freq 2D repr)
  * Convolutional Neural Network (CNN) and LSTM models
  * unbalanced issue: a random sampling strategy is used
  * 0.52 F-measure performance for depressed class detection in dev set.
  * better performance compared to hand-crafted feature extraction methods,
  * hE converting the raw audio data into spectrogram data which is time
    consuming and limits its application to real-world applications
* Vázquez-Romero and Gallardo-Antolín (2020), an
  ensemble of CNNs for depression classification is proposed
  * unbalanced data: a random sampling method is utilized
  * notable performance (0.63F-measure) using the proposed method, utilizing
    the common practice of log-spectrogram representation of audio signals
* most of the studies (Ma+ 2016, Vázquez-Romero and Gallardo-Antolín, 2020)
  focus on converting an audio signal to spectrograms features and then
  applying deep learning techniques. However, this preprocessing phase is
  * hE not appropriate in real-time applications because of the computational
  * Chorowski+ (2019): many of these deep neural networks comprise automatic
    supervised representation learning that rely on large human labeled
    datasets, which is not available in many cases
  * Gogoi & Begum, 2017: that some of the best results in classification often
    involve an unsupervised pre-training phase, such as unsupervised
* we: DL technique to extract highly relevant and compact set of features from
  raw audio signals which can be applicable to real-world applications
* Autoencoder (AE) as an ideal candidate that can be adapted to the ADD
  * AE is a special type of deep neural network and unsupervised learning which
    * reconstruct the input signal in a manner to minimize reconstruct error
    * reconstruction error: the difference from the original (An & Cho, 2015)
    * The hidden representation of the original input can be interpreted as a
      compressed feature vector which represents the most important and
      relevant relationships of the original input features (Ribeiro+ 2020)
    * ie unsupervised non-linear dimensionality reduction and feature
      extraction method before applying a classifier. For example,
  * Sahu+ (2018): speech-based Adversarial AE for emotion recognition
    * High dimensional feature sets from audio files are extracted, and then
      the extracted features are passed to Adversarial AE to extract hidden
      representation of each sample. SVM classifier is applied to classify
      sample into 4 emotional labels of neutral, sad, angry, and happy and they
      achieved an Unweighted Average Recall (UAR) of 56.38, which is close to
      the performance of classifier on the original feature space (57.88). In
  * de-noising AE and SVM were proposed for hidden representation learning and
    classifying samples into neutral and emotional classes, this resulted in
    about 2 percent improvement in emotion recognition accuracy (Xia & Liu,
    2013)
* CNN instead of a simple Dense Neural Network in AE, adds a powerful feature
  * local feature extraction ie a local perception of sequential data like text
  * using kernels (Wen & Zhang, 2018)
  * scale well to high dimensional data unlike fully-connected architectures,
    * no dependence to the input dimensionality in the number of free
      parameters describing their shared weights (Masci+ 2011).  This
  * Wen and Zhang (2018) proposed a deep CNN AE model for feature learning from
    an Electroencephalography (EEG) signal for epilepsy prediction. The
    * performed better compared to other dimensionality reduction methods
* we present a novel end-to-end framework based on CNN AE in audio-based
  depression detection. Using an end-to-end learning approach, the network is
  trained from the raw audio signals without any a priori feature extraction
  Following this phase, a classifier is used to distinguish depressed speakers
  from non-depressed speakers
  * classifiers explored in this study are four typical classifiers of SVM,
    Multi-Layer Perceptron (MLP), Gradient Boosting (GB), and Random Forest
    (RF). We compare the performance of CNN AE against
  * baseline
    * hand-crafted features extracted from different studies as well as
      a simple Dense AE model
* contributions of this study are as follows:
  * an end-to-end framework to automatically extract a compact set of features
    using CNN AE to accurately build an audio-based depression detection model
    * no other research conducted on developing an automated feature extraction
      using Convolutional AE on the audio modality for depression detection
      * it is applied on raw audio data without converting them to spectrograms
  * To overcome the problem of unbalanced data using DAIC-WOZ dataset
    * a cluster-based resampling technique for the preprocessing step
  * experiments to compare the performance of the proposed CNN AE method with
    hand-crafted feature extraction technique. To address the problem of
    * different dimensionality reduction techniques were explored for
      hand-crafted features and their performance are explored and compared
  * The performance of the proposed method is analyzed and compared to previous
    outstanding studies using both hand-crafted and DL techniques

# 2 Speech-based CNN AE approach for depression detection

# 3 Experimental framework and its results

# 4 Conclusion and some suggestion for future works
