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
    oversimplification of the temporal dimension, although
    in one of the unimodal or multimodal interactions; and
  * temporal architectures (TA), which try to capture
    both unimodal and cross-modal temporal dependencies
* basic feature representation methods for each modality
* aggregated evaluation results on the reported methodologies
* future: validation procedures, representation learning & method robustness

# 1 Intro

* traditional approaches in early multimodal fusion works related to SER
  * Early fusion: concatenating multimodal features mostly at the input level
    [1,8,9] ie simply concatenating feature vectors from different modalities
    * not allow the intra-modality dynamics to be efficiently modeled
    * inter-modality dynamics can be more complex at the input level and can
      dominate the learning process or result in overfitting
  * Late fusion: unimodal classifiers independently and
    * decision voting [10,11] or other classifier combination strategies
    * also prevents the model from learning inter-modality dynamics efficiently
      by making the assumption that a simple aggregation of individual
      decisions is capable of capturing the multimodal relationships
* more complex techniques for combining multimodal and temporal information
  in the emotion recognition application domain

# 2 Feature representation techniques per modality 2

## 2.1. Audio

* in the deep learning era
  * some methodologies function directly on the raw audio signal
  * in most cases, hand-crafted features extracted from the time and freq doms

### 2.1.1. Feature Calculation

1. Prosodic features
  * long term features
  * easily preserved and explained by humans
  * mostly based on energy, duration, and fundamental frequency
  * eg rhythm and intonation
2. Time-domain features
  * directly extracted from the samples of the audio signal
  * eg short-term energy, zero crossing rate and entropy of energy
  * not strongly correlated to affective content in speech signals
  * nL they can carry information related to the strength of the emo (arousal)
3.  Spectral features:
  * calculated in the frequency domain
  * widely used <~ characteristics of the vocal tract are well represented [12]
  * usually extracted from overlapping short-term speech frames of length 20 to
    50 ms that are applied through a windowing operation on the audio signal
    * For each short-term frame, discrete Fourier transform (DFT): freq distri
  * Features such as the spectral centroid, spectral flux, spectral rolloff, &
    spectral entropy
    * widely used in traditional audio and music classification tasks and
      in some speech emo recog methods that use hand-crafted audio feats [13]
  * the most effective local features are extracted using the cepstrum,
    * the result of computing the inverse Fourier transform
      of the logarithm of the estimated signal spectrum
  * Taking the cepstral coefficients of signal transformations eg those below
    * efficient and robust features
    * Mel-Frequency Cepstral Coefficients (MFCC)
      * represent the short term power spectrum of the speech signal
      * the most widely used spectral features for emotion recognition [14]
      * Before calculating the cepstral coefficients, the signal is transformed
        using a Mel-filter bank on a number of sub-band energies [15]
    * Linear Prediction Cepstral Coefficients (LPCC)
      * task-specific coefficients that, in some cases, capture the emotional
        information expressed through vocal tract characteristics
      * derived from linear prediction (LP) analysis,
        which uses the energy values of linearly arranged filter banks to
        capture the contribution of all frequency components of a speech
        signal
      * hE they need a processing technique to avoid additive noise error [16]
    * Gammatone Frequency Cepstral Coefficients (GFCC)
      * close to the MFCC procedure
      * instead of the Mel-filter bank, it uses the Gammatone filter-bank on a
        range of sub-band energies [17]
4. Voice quality features
  * the qualities of the glottal source
  * features such as noise ratio (HNR), shimmer and jitter
  * extremely useful since according to [18], the emotional content and voice
    quality of speech are correlated
5. Teager Energy Operator-based features (TEO)
  * introduced in Teager 1990; Kaiser 1993
  * under stressful conditions, there is a change in fundamental frequency and
    critical bands of the hearing process due to the distribution of harmonics
  * The operator created by Teager (1990) was adopted in Kaiser (1993),
    in order to quantify the energy from speech by using a nonlinear process
  * TEO-decomposed frequency modulation variation, normalized TEO auto-corr and
    critical band-based TEO auto-correlation
  * open-source robust and efficient libraries can extract them, eg [22–25]

### 2.1.2. Audio Representation Learning

* deep audio features can be learnt through CNNs
  * Convolutional neural networks (CNNs) “learn” image features, supervised
  * given a way to map audio signals into 2D representations (images),
  * The most straightforward approach to achieve this is through spectrograms
    * [26–28] use spectrograms as image inputs to CNNs in order to train
      classifiers for emotion recognition, and
    * since then, this approach of combining spectrograms (or melgrams) with
      CNNs has been widely adopted for speech emotion recognition tasks
* audio representations from the initial waveform
  * SincNet [29] replaces the one-dimensional convolution kernels with sinc
    filter functions on the audio signal, a supervised learning technique
  * unsupervised methods for speech representation learning from audio are
    rapidly evolving and produce efficient architectures such as
    wav2vec [30], wav2vec 2.0 [31] and HuBERT (Hidden-Unit BERT) [32]
    * HuBERT is the currently SOTA architecture for such representations

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
  multimodal emotion recognition are adopting the GloVe embeddings

## 2.3. Visual

* theoretically body language plays a significant part in expressing emotions
* hE most of the datasets in multimodal emotion recognition capture faces
* six face characteristics are correlated to emotional state [43]
  * morphology, symmetry, duration, speed of onset and the coordination of
    apexes and ballistic trajectory
* [44]: there are three main dimensions of facial variation
  * morphology, complexion and dynamics
  * dynamics being the most important for emotion recognition [45]
* [46]: Facial Action Coding System (FACS) for objectively measuring face move
  * implementation introduced by [47], became
    the standard for face movement recognition
  * The basic values of FACS are action units (AUs), which are
    the fundamental actions of either specific muscles or groups of muscles
    * AUs are combined in several sets and identified by a sequence of numbers
      containing codes about head movement, eye movement, visibility,
      gross behavior and overall codes
* tools for automatic facial recognition
  * eg IntraFace [48] and FACET [49]
  * implement FACS and give automated facial feature tracking,
    head pose estimation, facial attribute recognition and
    facial expression analysis from video

# 3 related works, a hierarchical categorization 4

* by modeling of the temporal dynamics and across modalities: 3 general categs

## 3.1. Methods Requirements and Categorization

## 3.2 non-temporal architectures

* ie simplify the modeling of the temporal dimension in both unimodal and
  multimodal interactions, by assuming simple statistical representations;
  * neither modality-specific temporal interactions
    nor cross-modality temporal interactions
* early fusion. One of the basic fusion ideas
  * called deep fusion (DF)
  * persuasiveness prediction [50]
  * evaluated on multimodal SER in a variety of latter works
  * represent the unimodal spaces with static vectors
  * feed-forward neural network for each modality
  * confidences c and the complementary confidences 1 − c of each modality are
    passed through a deep neural network to perform the final inference
* late fusion: [51] tries to introduce the temporal dimension
  * combine information from neighboring utterances,
    in order to capture the context of the session, they do
    not consider the temporal interactions between segments of the same
    utterance
  * static feature vectors are extracted for every utterance and modality and
    * later passed through a contextual LSTM (long short term memory) which is
      applied on the sequence of utterance-based features and
      produces context-dependent representations
  * representations are later concatenated and used as an input to
    a final contextual LSTM
  * includes both unimodal and cross-modal utterance-level temporal interacts
  * hE, neither simple early nor late fusion techniques are capable of
    achieving robust multi-modal representations
* tensor fusion network (TFN), introduced by [6]
  * concatenates each unimodal representation with the unit vector and then
    computes the outer product among each modality
    * The tensor fusion layer (ie, outer product) explicitly captures the
      unimodal, bimodal and trimodal interactions using a three-fold Cartesian
      product from modality embeddings
    * The final representation is passed through an inference subnetwork which
      performs inference of the target value. Great representation power
  * problem of exponential dimensional growth is a drawback
  * [52] tries to tackle it by introducing the low rank fusion technique, which
    scales linearly in the number of modalities and has less parameters
    * matrix rank decomposition in order to parameterize the product of the
      final neural network with the fused tensor
  * neither [6] nor [52] include temporal representations
    for the acoustic and visual modalities, but instead consider
    the expected (average) vector for each utterance

## 3.3 pseudo-temporal architectures

* also oversimplify the temporal dimension, in either unimodal or multimodal
  interactions
* feature-summarizing temporal observations for either cross-modal or
  intra-modal interactions
* attention mechanism is presented in [53]
  * a deep architecture for the problem of speech emotion recognition
  * two modalities of audio and text
  * For each medium, they implement a recurrent neural network (RNN)
  * In order to choose the most emotional words, the final audio embedding is
    used as a query for an attention mechanism against the hidden states of all
    text sequence elements
    * The representations of the selected “emotional” words are concatenated
      with the original audio vector to form the multimodal representation
  * hE, the performance is not improved by the use of the attention layer
* The same authors extend their work [54], the multi-hop attention (MHA)
  * three steps:
  * MHA-1: predict the emotion based on the audio bidirectional-LSTM (BiLSTM)
    and query the output state (ie, the representation of the audio) to the
    text BiLSTM in order to obtain a text representation H 1 that is associated
    with this very sound;
  * MHA-2: query H 1 to the audio BiLSTM in order to obtain the audio segments
    that are related to the selected words and represent them with H 2; and
  * MHA-3: query H 2 to the text BiLSTM for cross-check and obtain the overall
    representation H 3
    * hE the third attention step results in a worse performance compared to
      that achieved by MHA-2
* A mix of traditional fusion techniques seems to be effective when combined
  with strong segment feature representations, as shown in [55]
  * apply SOTA techniques for unimodal representations with the use of
    * ALBERT [42] embeddings for the text modality
    * audio: a spectrogram is calculated for every audio segment and passed
      through a CNN in order to learn the unimodal representation
      * The sequence of segmented features is the input to a Bi-LSTM and a
        multi-head self-attention layer in order to filter periods of silence
  * The resulting multimodal representations are
    * firstly early-fused and passed through a prediction (bi-modal) network
    * and subsequently late-fused using an ensemble classifier on the
      speech prediction, text prediction and bimodal prediction networks
* Designing a network that learns modality representations,
  instead of using existing modality embedding libraries [9], in order to learn
  representations from
    * visual sequences: convolutional recurrent multiple kernel learning netw
      * uses a convolutional RNN, ie, a CNN applied on the concatenation of
        pairs of consecutive images (3 different convolutional filter sizes)
    * text representations are learned with the application of a CNN on the
      text embeddings, while for the
    * aural modality, the openSMILE [25] embeddings are used
    * multiple kernel learning algorithm, and the final emotion prediction is
      inferred based on algorithmically selected features from the
      concatenation of the unimodal representations
* Attention mechanisms
  not only serve to produce better cross-modal representations, but they can
  * efficiently combine diff feature extraction methods of the same modality
  * [56] use two feature extraction techniques widely used in text analysis
    * applying three Conv1D networks, with filter size 1, 2 and 3,
      respectively, on the text embedding sequence in order to extract a
      variety of n-word representations, and
    * using a Bi-RNN on the input embeddings and then apply method (a) to the
      output
    * attention is applied along the two methods
      so as to get the best possible dynamics
    * for the audio modality, a SincNet, a neural architecture that tends to
      replace CNNs in audio feature extraction [29], is used
    * Before concatenating the feature vectors, self-attention is calculated on
      the unimodal sequences in order to identify informative segments
* a range of different ideas that deliver promising results
  * [57]: the authors break down the emotion recognition problem to three
    sub-tasks in order to extract direct and relative predictions
    * they concatenate the different feature representations and
      separate emotion recognition to the following tasks:
    1. multimodal local ranking task,
      * input: two short segments randomly selected within a video and is
      * output: whether there was an increase or decrease in emo intensity
        (a binary classification task)
    2. global ranking task, which uses the previous results of local rankings
       to infer global emotion ranks using a Bayesian skill rating algorithm
    3. direct-relative fusion. The global emotion ranks are incorporated with
       the raw multimodal inputs to estimate final emotion intensities
* multimodal representation learning, [58] is one of the crucial works
  * not concentrate on finding an efficient way to fuse information
  * multimodal cyclic translation network (MCTN) learns
    a joint representation space for different modalities
  * For two modalities it uses an encoder–decoder architecture
    to translate one modality to another by adopting a cyclic translation loss
  * the hidden embeddings serve as the cross-modal representation
  * For three modalities, a cyclic translation is formed
  * the resulting embeddings are the input to an encoder with
    the third modality being the target for the corresponding decoder
  * once trained with multimodal data,
    only data from one source modality are needed during the inference time
    to construct both the joint representation and the label
  * more robust to noisy unimodal inputs
* All aforementioned works
  * efficiently modeling unimodal temporal dynamics
  * no cross-modal learning or fusion on the temporal level,
    since the cross- modal interaction is performed on the final repr
    instead of the sequence level
* The MCTN [58] achieves modeling both temporal cross-modal learning and
  unimodal temporal dynamics but only for two modalities
  * When needing the third modality, there is no cross-modal temporal
    interactions for this specific input sequence
* In the pseudo-temporal architectures (PTA),
  modeling unimodal temporal representations (UTA) is more common
* nL there are architectures that prefer to model crossmodal temporal
  interactions only (CTA)
  * [59] introduce the multimodal factorization model (MFM)
    * factorizes multimodal representations into
      multimodal discriminative factors and modality-specific generative factrs
    * tries to learn multimodal discriminative factors
      in order to perform inference, while it
      jointly learns unimodal generative factors that can be used to
      reconstruct missing or noisy information during testing time
    * an encoder for each modality (audio, text, video) and their fusion (audio
      + text + video), which creates the generative and discriminative factors
    * The corresponding decoders of the generative factors serve to
      approximate the input modalities, while
      the decoder of the discriminative factor is used for inference
    * For the encoder networks, the MFN architecture is used while
      LSTMs serve as decoders
    * competitive performance on six multimodal time series datasets
    * reconstruction of missing modalities from observed modalities does
      not significantly impact discriminative performance

## 3.4 temporal architectures

* ie try to capture both unimodal and cross-modal temporal dependencies

# 4 evaluation results in the most widely adopted datasets for emotion recog 12

## 4.1. Datasets

* four categories according to the recording procedure
  * spontaneous speech: the participants are unaware of the recording while
    * real environment [72];
  * acted speech: the emotional condition of the speakers is acted;
  * elicited speech: where the speaker is placed in a situation which evokes a
    specific emotional state [73]; and
  * annotated public speech: data from public sources, such as YouTube
* datasets must be realistic by having some desired properties
  eg variety in modalities, speakers, genders, subjects discussed, languages,
  words used, emotional intensity and amount of data
* CMU-MOSEI [63] has most of the desired properties
  * the biggest dataset available that includes the most speakers and the
    greatest subject variety
  * YouTube videos, one of the most useful data sources,
    since many industrial products are used on similar data
  * labels for emotion recognition + for (text-based) sentiment analysis
  * mostly used for sentiment analysis architectures (eg, [63,66,67,70,83–85])
* IEMOCAP [74]
  * the most widely used dataset
  * collected in a detailed way in a lab environment
    * ten actors which attach different realistic emotions in dyadic sessions
      makes this dataset the collection with the strongest ground truth
  * visual features of high quality, since
    markers on the face, head and hands were used for
    capturing facial expressions and hand movements
  * one of the oldest, well recorded, annotated and maintained datasets
  * the overwhelming majority of multimodal archits are evaluated with IEMOCAP
  * overfitting
    * a variety of unwanted features since it only includes a
      small number of speakers and subjects discussed
* The rest of the datasets are not extensively used in multimodal emotion recog
  * they can be used in a cross-dataset evaluation scheme
    in order to produce highly generalizable results and
    upgrade the performance estimation to a more realistic manner

## 4.2. Performance Evaluation Metrics

## 4.3. Evaluation Procedures

## 4.4. Aggregated Reported Results

* most of the authors have tested their work on the IEMOCAP datasets
  * Some works present results for other datasets
    eg CMU-MOSEI (eg, [63,66,84]) or REVOLA (eg, [57])
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
* We also report the results on unaligned multimodal emotion recognition
  * input data sequences are not forced-aligned by the dataset owners
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

# 5 conclusion and future challenges 16

* future:
* evaluation procedure
  * differences in
    * pipelines
      (eg random subsampling train-val split vs leave-1-speaker out)
    * classification metrics
      (eg, binary metrics for each label vs multiclass aggregated metrics)
  * speaker-dependent experimentation may result in overfitted results
    (in terms of speaker identity)
  * leave-one-speaker-out evaluation should be used as a standard
  * experiments have to list both binary and multiclass metrics and also
  * capture both the dimensional (ie, valence, arousal and dominance) and the
    categorical (discrete emotions) dimensions of emotion recognition
* industrial adaptation of the architectures, robustness
  * models are usually engineered on specific datasets => no generalization
    * relying on unrealistic data such as forced-aligned multimodal sequences,
      error-less text transcriptions, non realistic recording conditions,
      artificial dialog context and perfect information on all modalities
  * needed: multimodal temporal architectures for the problem of SER that are:
    * trained in a cross-dataset evaluation manner, while utilizing
      * unsupervised [90] or supervised [91] domain adaptation methodologies,
        in order to better evaluate their generalization power;
    * capable of performing inference on unaligned temporal multimodal data;
    * capable of performing inference in cases of noisy or absent modalities;
    * capable of performing under unexpected ASR errors
* methods need to be adopted for signal representation
  * in the task of multimodal speech emotion recognition, a few specific
    low-level modality representation techniques have been established
    * aural modality, signal-analysis-based features that are
      associated with both the spectral and temporal domains
    * textual: basic word embeddings are used
    * visual: traditional facial features are used
    * deep learning techniques has resulted in better repr capabilities
      for all three of these modalities
  * multimodal architectures need to
    * be in line with the SOTA techniques for unimodal representations and
    * find efficient ways to combine them by taking into account the temporal
      dimension
  * each modality can be enriched with new representations that also take into
    account parts of the information that have not been so widely used yet
    * body language is strongly correlated with expressed emotions
    * beyond facial expressions
  * unsupervised representation, application-independent
    * In other machine learning application domains, they are powerful
    * BERT [41] for text, wav2vec 2.0 [31] for audio, and
      MoCo (He+ 20) for vision
      * He K; Fan H; Wu Y; Xie S; Girshick R
        Momentum contrast for unsupervised visual representation learning
        IEEE/CVF Conference on Computer Vision and Pattern Recognition 2020
      * Ruder:  Contrastive Self-Supervised Learning
        [Ankesh Anand](https://ankeshanand.com/blog/2020/01/26/contrative-self-supervised-learning.html)
        * an overview of recent contrastive methods that learn by
          distinguishing between positive and negative examples
          (in contrast to generative models)
        * eg as Deep InfoMax, Contrastive Predictive Coding, and MoCo with a
        * focus on models for computer vision
    * Several well-defined datasets have been created for emotion recognition,
    * combine them
      in order to generate generic multimodal emotion-oriented representations
    * may result in a exponential growth of the use of emo anal in other applic
      * eg speaker verification system
        * improve the robustness of the system to the emotional state
