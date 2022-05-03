Deep Multimodal Emotion Recognition on Human Speech: A Review
Koromilas P and Giannakopoulos T
Appl. Sci. 2021, 11,

# Abstract

* This work reviews the SOTA in multimodal speech emotion recognition (SER)
* focusing on audio, text and visual information
* new, descriptive categorization of methods, based on the way they handle
  the inter-modality and intra-modality dynamics in the temporal dimension:
  * non-temporal architectures (NTA), which do not significantly model the
    temporal dimension in both unimodal and multimodal interaction;
  * pseudo-temporal architectures (PTA), which also assume an
    oversimplification of the temporal dimension, although in one of the
    unimodal or multimodal interactions; and
  * temporal architectures (TA), which try to capture both unimodal and
    cross-modal temporal dependencies
* basic feature representation methods for each modality
* aggregated evaluation results on the reported methodologies
* future: validation procedures, representation learning & method robustness

# 1 Intro

* traditional approaches in early multimodal fusion works related to SER
  * Early fusion: concatenating multimodal features mostly at the input level
    [1,8,9], ie, by simply concatenating feature vectors from different
    * not allow the intra-modality dynamics to be efficiently modeled. This is
    * inter-modality dynamics can be more complex at the input level and can
      dominate the learning process or result in overfitting
  * Late fusion: unimodal classifiers independently and
    * decision voting [10,11] or other classifier combination strategies
    * also prevents the model from learning inter-modality dynamics efficiently
      by making the assumption that a simple aggregation of individual
      decisions is capable of capturing the multimodal relationships
* more complex techniques for combining multimodal and temporal information in
  the emotion recognition application domain

# 2 feature representation techniques per modality 2

## 2.1. Audio

* in the deep learning era
  * some methodologies function directly on the raw audio signal. 
  * in most cases, hand-crafted features extracted from the time and freq doms

### 2.1.1. Feature Calculation

1. Prosodic features
  * long term features 
  * easily preserved and explained by humans. Typical such features are
  * mostly based on energy, duration, and fundamental frequency
  * eg rhythm and intonation.
2. Time-domain features: Such features are
  * directly extracted from the samples of the audio signal. Typical examples
  * eg short-term energy, zero crossing rate and entropy of energy. Such
  * not strongly correlated to affective content in speech signals; however,
  * nL they can carry information related to the strength of the emo (arousal)
3.  Spectral features:
  * calculated in the frequency domain and are
  * widely used since characteristics of the vocal tract are well repred [12]
  * usually extracted from overlapping speech short-term frames of length 20 to
    50 ms that are applied through a windowing operation on the audio signal.
    For each short-term frame, the discrete Fourier transform (DFT) is computed
    to provide a representation of the distribution of the frequency content.
  * Features such as the spectral centroid, spectral flux, spectral rolloff and
    spectral entropy 
    * widely used in traditional audio and music classification tasks and in
      some speech emotion recognition methods that use hand-crafted audio
      features [13]
  * the most effective local features are extracted using the cepstrum, which
    * the result of computing the inverse Fourier transform of the logarithm of
      the estimated signal spectrum
  * Taking the cepstral coefficients of signal transformations eg those below
    * efficient and robust features.
    * Mel-Frequency Cepstral Coefficients (MFCC): These coefficients
      * represent the short term power spectrum of the speech signal and
      * the most widely used spectral features for emotion recognition [14].
      * Before calculating the cepstral coefficients, the signal is transformed
        using a Mel-filter bank on a number of sub-band energies [15].
    * Linear Prediction Cepstral Coefficients (LPCC): These are
      * task-specific coefficients that, in some cases, capture the emotional
        information expressed through vocal tract characteristics
      * derived from linear prediction (LP) analysis,
        which uses the energy values of linearly arranged filter banks to
        capture the contribution of all frequency components of a speech
        signal
      * hE they need a processing technique to avoid additive noise error [16].
    * Gammatone Frequency Cepstral Coefficients (GFCC): This is a method that
      * close to the MFCC procedure
      * instead of the Mel-filter bank, it uses the Gammatone filter-bank on a
        range of sub-band energies [17].
4. Voice quality features: The voice quality features define
  * the qualities of the glottal source by producing
    features such as noise ratio (HNR), shimmer and jitter. These are
  * extremely useful since according to [18], the emotional content and voice
    quality of speech are correlated.
5. Teager Energy Operator-based features
  * introduced in Teager& 1990; Kaiser 1993
  * under stressful conditions, there is a change in fundamental frequency and
    critical bands of the hearing process due to the distribution of harmonics.
    The operator created by Teager& (1990) was adopted in Kaiser 1993, in order
    to quantify the energy from speech by using a nonlinear process.
  * TEO-decomposed frequency modulation variation, normalized TEO auto-
    correlation and critical band-based TEO auto-correlation are three basic
  * open-source robust and efficient libraries can extract them, eg [22–25]

### 2.1.2. Audio Representation Learning

* deep audio features can be learnt through CNNs
  * Convolutional neural networks (CNNs) “learn” image features, supervised
  * given a way to map audio signals into 2D representations (images), 
  * The most straightforward approach to achieve this is through spectrograms.
    * [26–28] use spectrograms as image inputs to CNNs in order to train
      classifiers for emotion recognition, and
    * since then, this approach of combining spectrograms (or melgrams) with
      CNNs has been widely adopted for speech emotion recognition tasks.
* audio representations from the initial waveform 
  * SincNet [29], a network that replaces the one-dimensional convolution
    kernels with sinc filter functions on the audio signal, is a supervised
    learning technique in such a direction. On the other hand,
  * unsupervised methods for speech representation learning from audio are
    rapidly evolving and produce efficient
    architectures such as
    wav2vec [30], wav2vec 2.0 [31] and HuBERT (Hidden-Unit BERT) [32], which is
    * HuBERT is the currently SOTA architecture for such representations.
    
## 2.2. Text

* word-vectors produced by neural networks
  * GloVe (Global Vectors) [34] is one of the first robust embeds
  * FastText model [35], which also included sub-word information, and
  * ELMo (Embeddings from Language Models) [36], deep context-dependent word repr
  * transformer networks [37], the architectures that produce word embeddings
  * GPT (generative pre-trained) 1, 2 and 3 [38–40];
  * BERT (bidirectional encoder representations from transformers) [41];
  * ALBERT (a lite BERT) [42], etc
* in order to be easily compared to the baseline models, most architectures of
  multimodal emotion recognition are adopting the GloVe embeddings.

## 2.3. Visual

* theoretically body language plays a significant part in expressing emotions,
* hE most of the datasets in multimodal emotion recognition capture faces.
* six face characteristics are correlated to emotional state [43]
  * morphology, symmetry, duration, speed of onset and the coordination of
    apexes and ballistic trajectory, 
* [44]: there are three main dimensions of facial variation
  * morphology, complexion and dynamics
  * dynamics being the most important for emotion recognition [45].
* [46]: Facial Action Coding System (FACS) for objectively measuring facial mov
  * implementation introduced by [47], became
    the standard for face movement recognition
  * The basic values of FACS are action units (AUs), which are
    the fundamental actions of either specific muscles or groups of muscles and
    * combined in several sets and identified by a sequence of numbers
      containing codes about head movement, eye movement, visibility, gross
      behavior and overall codes.
* tools for automatic facial recognition
  * eg IntraFace [48] and FACET [49],
  * implement FACS and give automated facial feature tracking, head pose
    estimation, facial attribute recognition and facial expression analysis
    from video.

# 3 related works, a hierarchical categorization 4

* by modeling of the temporal dynamics and across modalities: 3 general categs
  * non-temporal architectures, ie, approaches that simplify the modeling of
    the temporal dimension in both unimodal and multimodal interactions, by
    assuming simple statistical representations;
  * pseudo-temporal architectures, which also assume an oversimplification of
    the temporal dimension, in either unimodal or multimodal interactions
    (while the first category simplifies in both ways); and
  * temporal architectures, ie, methods that try to capture both unimodal and
    cross-modal temporal dependencies

# 4 evaluation results in the most widely adopted datasets for emotion recog 12

## 4.1. Datasets

* four categories according to the recording procedure that was followed during
  * spontaneous speech: the participants are unaware of the recording while
    * real environment [72];
  * acted speech: the emotional condition of the speakers is acted;
  * elicited speech: where the speaker is placed in a situation which evokes a
    specific emotional state [73]; and
  * annotated public speech: data from public sources, such as YouTube
* datasets must be realistic by having some desired properties, such as a
  variety in modalities, speakers, genders, subjects discussed, spoken
  languages, words used, emotional intensity and amount of data
* CMU-MOSEI [63] has most of the desired properties
  * the biggest dataset available that includes the most speakers and the
    greatest subject variety
  * YouTube videos, one of the most useful data sources, since many industrial
    products are used on similar data
  * labels for emotion recognition + for (text-based) sentiment analysis
  * mostly used for sentiment analysis architectures (eg, [63,66,67,70,83–85])
* IEMOCAP [74]
  * the most widely used dataset, is
  * collected in a detailed way in a lab environment. The use of
    * ten actors which attach different realistic emotions in dyadic sessions
      makes this dataset the collection with the strongest ground truth. In
  * visual features of high quality, since
    markers on the face, head and hands were used in order to capture facial
    expressions and hand movements
  * one of the oldest, well recorded, annotated and maintained datasets, and
  * the overwhelming majority of multimodal architectures are evaluated using
  * overfitting
    * a variety of unwanted features since it only includes a small number of
      speakers and subjects discussed
* The rest of the datasets are not extensively used in multimodal emotion recog
  * they can be used in a cross-dataset evaluation scheme in order to produce
    highly generalizable results and upgrade the performance estimation to a
    more realistic manner

## 4.4. Aggregated Reported Results

* most of the authors have tested their work on the IEMOCAP datasets
  * Some works present results for other datasets
    eg CMU-MOSEI (eg, [63,66,84]) or REVOLA (eg, [57]), but
    hE these works can be only grouped in small sets, and thus we think that
    the best overview of the field architectures can only be seen in an IEMOCAP
* In Table 2, we only group some metrics associated with IEMOCAP
  * results cannot be directly compared
    * not the same validation procedure, and for the ones that do, it is
      not certain whether they used the same speakers or sessions for testing
    * we juxtapose the authors’ results in order to acquire a sense of the
      actual differences between each architecture’s ideas
    * For an empirical comparison of such architectures, which trains from
      scratch a wide range of the presented architectures, we refer to [88]
* We also report the results on unaligned multimodal emotion recognition, which
  * input data sequences are not forced-aligned by the dataset owners. This
  * closer to reality and can result in approaches that extract more efficient
    multimodal temporal representations: more robust in real-world applications
  * In Table 3, the connectionist temporal classification (CTC) [89] method is
    adopted in order to use architectures that require forced-aligned data in
    an unaligned manner
    * these models train to optimize the CTC alignment objective and the
      emotion multimodal objective simultaneously [70]
    * The results can be easily compared <~ same evaluation on the same data
    * MTAG [71] is the architecture that holds the SOTA performance,
      while using just 0.14 million parameters

# 5 conclude our work and introduce the key future challenges, as they arise 16

* future
  * evaluation procedure. More specifically, the proposed architectures are
    * differences in
      * pipelines (eg random subsampling train-val split vs leave-1-speaker
        out)
      * classification metrics (eg, binary metrics for each label vs multiclass
        aggregated metrics)
    * speaker-dependent experimentation may result in overfitted results (in
      terms of speaker identity)
    * leave-one-speaker-out evaluation should be used as a standard not only to
    * experiments have to list both binary and multiclass metrics and also
    * capture both the dimensional (ie, valence, arousal and dominance) and the
      categorical (discrete emotions) dimensions of emotion recognition
* industrial adaptation of the architectures, robustness
  * models are usually engineered on specific datasets (thus lacking
    generalization power),
    * relying on unrealistic data such as forced-aligned multimodal sequences,
      error-less text transcriptions, non realistic recording conditions,
      artificial dialog context and perfect information on all modalities
  * needed: multimodal temporal architectures for the problem of SER that are:
    * trained in a cross-dataset evaluation manner, while utilizing the power
      of
      * unsupervised [90] or supervised [91] domain adaptation methodologies,
        in order to better evaluate their generalization power;
    * capable of performing inference on unaligned temporal multimodal data;
    * capable of performing inference in cases of noisy or absent modalities;
      and
    * capable of performing under unexpected ASR errors
* methods need to be adopted for signal representation
  * in the task of multimodal speech emotion recognition, a few specific
    low-level modality representation techniques have been established. In
    * aural modality, signal-analysis-based features that are associated with
      both the spectral and temporal domains are used
    * textual: basic word embeddings are used
    * visual: traditional facial features are used
    * deep learning techniques has resulted in better representation
      capabilities for all three of these modalities. Thus,
  * multimodal architectures need to
    * be in line with the SOTA techniques for unimodal representations and
    * find efficient ways to combine them by taking into account the temporal
      dimension
  * each modality can be enriched with new representations that also take into
    account parts of the information that have not been so widely used until
    * body language is strongly correlated with expressed emotions, the only
    * beyond facial expressions
  * unsupervised representation, application-independent
    * In other machine learning application domains, there are many powerful
    * BERT [41] for text, wav2vec 2.0 [31] for audio, and MoCo (He+ 20) for vision
      * He, K.; Fan, H.; Wu, Y.; Xie, S.; Girshick, R
        Momentum contrast for unsupervised visual representation learning. In
        IEEE/CVF Conference on Computer Vision and Pattern Recognition 2020
      * Ruder:  Contrastive Self-Supervised Learning 🤳
        [Ankesh Anand](https://ankeshanand.com/blog/2020/01/26/contrative-self-supervised-learning.html)
        gives an overview of recent contrastive methods that learn by
        distinguishing between positive and negative examples (in contrast to
        generative models) such as Deep InfoMax, Contrastive Predictive Coding,
        and MoCo with a focus on models for computer vision
    * Several well-defined datasets have been created for emotion recognition,
    * combine them in order to generate generic multimodal emotion-oriented
      representations
    * may result in a exponential growth of the use of emo anal in other applic
      * eg speaker verification system
        * improve the robustness of the system to the emotional state
