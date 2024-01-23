Self-Supervised Speech Representation Learning: A Review
Abdelrahman Mohamed, Hung-yi Lee, Lasse Borgholt, Jakob D Havtorn,
  J Edin, C Igel, K Kirchhoff, S Li, K Livescu, L Maaløe, TN Sainath, S Watanabe
arXiv:2205.10643 [cs.CL]

whisper not mentioned

# Abstract

* Self-supervised representation learning (SSL) has success in NLP and vision
* Speech representation learning is experiencing similar progress in
  * three main categories: generative, contrastive, and predictive methods
  * Other approaches rely on multi-modal data for pre-training, mixing text or
    visual data streams with speech. Although self-supervised speech
* closely related
  * acoustic word embedding and learning with zero lexical resources, both of
    which have seen active research for many years. This review presents
    approaches for self-supervised speech representation learning and their
* many current methods focus on automatic speech recognition as a downstream
* recent efforts on benchmarking learned representations to extend the applic

# II. Historical context of representation learning

# III. Speech representation learning paradigms 3

## A. Notation 4

## B. Generative approaches

### 1) Motivation: In this category, the pretext task is to generate, or
reconstruct, the input data based on some limited view.  This includes
predicting future inputs from past inputs, masked from unmasked, or the
original from some other corrupted view. “Generative” as used in this paper
hence refers to models that target the original input in their pretext task
* Note that this differs from generative models, which learn distributions that
allow to sample new data

### 2) Approaches:

#### a) Autoencoding

* essential Since their introduction in the mid-1990s [13], autoencoders (AEs)

#### b) Autoregressive prediction

* Autoregressive predictive coding (APC) [92], [93] takes
* inspiration from the classic
  * Linear Predictive Coding (LPC) approach for speech feature extraction [94]
  * autoregressive language models (LM) for text, where
    * the model learns to predict future information from past. A function f

## C. Contrastive approaches 7

### 1) Motivation: As discussed above, speech contains many entangled features

* Thus, learning to reconstruct the raw speech signal might not be the best way
  to discover contextualized latent factors of variations
* Contrastive models learn representations by distinguishing a target sample
  (positive) from distractor samples (negatives) given an anchor
  representation
* The pretext task is to max/minimize latent space similarity
  between the anchor and posi/negative samples
* This approach has been used extensively in the general ML community [134]

### 2) Approaches:

#### a) CPC: Contrastive Predictive Coding (CPC) [56] is a prominent example of

* a convolutional module f1 (·) to produce localized representations zt with
  a recurrent module f2 (·) on top that outputs a contextualized representation
  ht . An anchor representation ẑt,k is obtained via a linear projection gk (·)
  of ht . The positives and negatives are sampled from the localized
  representation Z.  Hence, at a single timestep t, CPC forms multiple anchor
  representations ẑt,k for k ∈ {1, ... , K} and associates with each

#### b) wav2vec 2.0 combines contrastive learning with masking

* As the CPC model, it uses the InfoNCE loss [56] to maximize the similarity
  between a contextualized representation and a localized representation

### 3) Challenges 9

* the strategy used to define positive and negative samples can also indirectly
  impose invariances on the learned representations
  * eg sampling negatives exclusively from the same utterance as the positive
    biases the features towards speaker invariance, which may or may not be
    desired for downstream applications. Another standing challenge is that
* speech does not have explicit segmentation of acoustic units,
  => the negative and positive samples do not represent a whole unit of
  language but rather partial or multiple units, depending on the span covered
* speech lacks natural segmentation, it can be
  => difficult to define a contrastive sampling strategy that is guaranteed to
  provide samples that always relate to the anchor as truly positives/negs
  in a sound way

## D. Predictive approaches 9

### 1) Motivation

* compared to contrastive approaches discussed above
  * Similar: defined by using a learned target for the pretext task. However,
  * unlike: not employ a contrastive loss
* loss function such as squared error and cross-entropy
* how to discourages the model from learning a trivial solution
  * a contrastive loss: by the use of negative samples
  * predictive methods compute the targets outside the model’s computational
    graph; usually with a completely separate model
* somewhat akin to teacher-student training
* The first predictive approaches were motivated by the success of BERT-like
  methods in NLP [54] as well as the DeepCluster method in CV [138]

### 2) Approaches:

#### a) Discrete BERT

* Applying BERT-type training directly to speech input is not possible
  * Discrete BERT [129] uses a pre-trained vq-wav2vec model
    to derive a discrete vocabulary [124]
  * vq-wav2vec model is similar to wav2vec mentioned in Paragraph III-C2a
    but uses quantization to learn discrete representations
    * discrete units ct are first extracted with the vq-wav2vec model f1 (·)
* softmax normalized output layer g(·), ct = f1 (X[t−u,t+u] ) ,(21) H = f2
* categorical cross-entropy loss, L= X − log p(ct | X) , (24) t∈M where M is
* During training, only the BERT model’s parameters are updated, while the
* Discrete BERT was the first model to demonstrate the effectiveness of
  self-supervised speech representation learning by achieving a WER of 25% on
  the standard test-other subset using a 10-minute fine-tuning set, setting the
  direction for many approaches to follow

#### b) HuBERT

* Hidden Unit BERT (HuBERT) approach [130] uses
  * quantized MFCC features as targets learned with classic k-means
  * Rather than relying on an advanced representation learning model for
    discretizing continuous inputs, as Discrete BERT
  * k-means model g1 (·) assigns a cluster center to each timestep
  * helps to prevent loss of any relevant information due to input quantization
* architecture similar to that of wav2vec 2.0, with a
  * convolutional module f1 (·) and a Transformer encoder f2 (·), as well as a
  * softmax normalized output layer g2 (·): where w defines the window size
* categorical cross-entropy loss is computed on both masked, Lm , and unmasked,
  Lu , timesteps: X Lm = − log p(ct | X) , (29) t∈M L = βLm + (1 − β)Lu .  (30)
  Again, M is the set of all masked timesteps, β is a scalar hyperparameter and
  Lu is computed as Lm but summing over t∈ / M
* Intuitively,
  the HuBERT model is forced to learn both an acoustic and a language model
  1. the model needs to learn a meaningful continuous latent representation for
     unmasked timesteps which are mapped to discrete units, similar to a
     classical frame-based acoustic modeling problem
  2. similar to other masked pre-training approaches,
    the model needs to capture long-range temporal dependencies to make correct
    predictions for masked timesteps
* insight motivating this work is the importance of consistency of the targets
  which enables the model to focus on modeling the sequential structure of the
  input
* pre-training is a two-step procedure
  * The first iteration is described above
  * second iteration: representations from a hidden layer of the model from the
    first iteration are clustered with k-means to obtain new targets ct .  For
* only two iterations are needed to match or outperform the previous SOTA
  results for low-resource speech recognition
* combining the HuBERT approach with the wav2vec 2.0 approach, the w2v-BERT
  model has managed to improve results even further [127]

#### c) WavLM

* WavLM emphasizes spoken content modeling and speaker identity preservat [131]
* largely identical to HuBERT, but introduces two useful extensions
  1. it extends the Transformer self-attention mechanism with a so-called
    gated relative position bias
    * added prior to the softmax normalization of the attention weights. For
    * bias is computed based on the input to the Transformer layer at the
      current time step i and also incorporates a relative positional embedding
      for i − j.  The authors find that this extension
    * improves performance on phoneme and speech recognition tasks.  Second, it
  2. an utterance mixing strategy where
    * signals from different speakers are combined to augment the training
    * random subsequences from other examples in the same batch are scaled and
      added to each input example.  Only the targets corresponding to the
      original example are predicted during pre-training
      => the model learns to filter out the added overlapping speech
    * Most SSL methods are trained on data where each example only contains
      speech from a single person; therefore, they can perform subpar on
      multispeaker tasks like speaker separation and diarization
    * WavLM model achieved substantial improvements on the speech separation,
      speaker verification and speaker diarization tasks in the SUPERB
      benchmark
* also performing well on many other tasks compared to HuBERT and wav2vec 2.0

#### d) data2vec

* Motivated by the success of using an exponential moving average (EMA) teacher
  for self-supervised visual representations [139], [140], the
* data2vec model [132] computes targets Y using an EMA of its own parameters
  * The targets are constructed by averaging hidden representations of the top
    k layers of the EMA teacher network applied to unmasked inputs. Here, we
    denote this jointly as f¯2 (·).  The
* data2vec model was proposed for different data modalities, but
  * for audio it uses an architecture similar to wav2vec 2.0 and HuBERT with a
    * convolutional module f1 (·), a Transformer f2 (·) and
      masking applied to the Transformer input.  zt = f1 (X[t−u,t+u] ) ,(31) H
* The teacher network f¯2 (·) is a copy of the Transformer of the student
  but with the parameters at training step i, θteacher,i , given by an EMA of
  the student parameters over all previous training steps.  ( θstudent,0 i=0)
* regression loss between target and prediction
  * to reduce sensitivity to outliers and prevent exploding gradients, it uses
    the smoothed L1 loss [141], ( 1 (yt − ht )2 /η, |yt − ht | ≤ η , (35) Lt =
    * the hyperparameter η controls the transition from a squared loss to an L1
* work well for representation learning with either speech, images or text
* the first approach to achieve competitive results when trained on any one of
  the three modalities

### 3) Challenges

* The iterative nature of pre-training for the HuBERT and wavLM could present a
* the quality of the initial vocabulary generated from MFCC features. The
  * data2vec approach improves over other predictive models by allowing the
    targets to improve continuously via the EMA teacher network; however,
    * hE student-teacher approaches inflate the existing computational
      challenges of very large models and
      may necessitate the use of methods that decrease instantaneous memory
      eg mixed precision training, model parallelism and model sharding [142]

## E. Learning from multi-modal data 10

### 1) Motivation

* Multiple modalities are useful in many settings, where each modality provides
  information that is complementary to other modalities.  Multi-modal work in-
* supervised settings
  * audio-visual ASR [143],11 [144] and person identification [145] which have
* we focus only on unsupervised representation learning from multi-modal data
  * learning from multiple modalities can reduce the effect of noise, since
    <= noise in different modalities is likely to be largely independent or
    uncorrelated
* speech data with accompanying signals such as images or video can help learn
  representations that encode more semantic information. Such “grounding”
* Human language learning:
  infants benefit from the visual modality when learning language [146]
* Early computational models of multi-modal language learning were motivated by
  (and tried to emulate) human learning of language in the context of the
  visual surroundings [147]

### 2) Approaches. Two broad classes: what type of multi-modal data is involved

#### Intrinsic modalities are modalities produced directly by the speech

* images or video of the speaker’s face [148], [149], lip-movement [150],
  articulatory flesh point measurements [151], [152], or simultaneous magnetic
  resonance imaging (MRI) scans [153]. Typically, learning from multiple
  * to improve robustness to noise, since
  * acoustic noise is likely to be uncorrelated with the other modality(ies)
  * often referred to as “multi-view learning” because the multiple intrinsic
    * multiple views of the same content
* Some typical approaches in this category include
  * Multi-view autoencoders and variations [154], [155],
  * Multi-modal deep Boltzmann machines [156],
  * Canonical correlation analysis (CCA) [157] and its
    * non-linear extensions [158]–[166],
  * Multi-view contrastive losses [167], [168],
  * More recently, audio-visual extensions of masked prediction methods
    [150], [169], specifically Audio-Visual HuBERT (AV-HuBERT) [150]

#### Extrinsic modalities

* eg
  * an image and its spoken caption: The image tells us what the speech is
    * recently a surge of datasets collected for this purpose
  * audio and image frames in a video
  * video clips with their spoken descriptions
* A recent review of datasets, as well as methods, in this cat: Chrupała [170]
* Typical approaches involve
  * learning a neural representation model for each modality, with a
    multi-modal contrastive loss that encourages paired examples in the two
    modalities to have similar representations while unpaired examples remain
    different [171]–[176]. Other choices include training with a
  * masked margin softmax loss [177], [178] or a masked prediction loss [179]
  * very high-level learning objective of
    ie matching speech with a corresponding image (or other contextual modality),
* evaluated on
  * cross-modal retrieval, although some work has also used the models for
  * other downstream tasks such as the ZeroSpeech and SUPERB benchmark tasks
    [180]. Analyses of such models have found that
* such models often learn multiple levels of linguistic representations
  * from the shallowest to the deepest model layers [181]–[183]
  * word-like units learned [184]–[186] and
  * can be used for cross-lingual retrieval,
    by considering the visual signal as an “interlingua” [187]–[189].  In some
  * even in the presence of some amount of textual supervision (ie transcrib)
    visual grounding still helps retrieval [190]
* joint speech and text representations using paired and unpaired data. The
  * SLAM [191]
    * speech and text are first represented using two separate pre-trained enc
    * followed by a multi-modal encoder to build the joint representations
    * The entire model is trained using a multi-task loss including
      * two supervised and two self-supervised tasks

### 3) Challenges: One of the challenges of using multi-modal approaches is

* multi-modal data they rely on is often in shorter supply than single-modality
* multimodal data is typically drawn from specific domains, for example
  eg descriptions of visual scenes
  * not clear how well the learned speech representations apply to domains that
    are not describing or situated in a visual scene

## F. Acoustic Word Embeddings 11

* Most of the representation learning techniques discussed in the preceding
  sections are aimed at learning frame-level representations
* For some purposes, however, it may be useful to
  explicitly represent longer spans of speech audio of arbitrary duration
  eg phone, word, or phrase-level segments
  * purposes eg searching within a corpus of recorded speech for segments that
    * written or spoken) query can be seen as
    * ie finding segments whose representations are most similar to that of the
      query [118], [192]–[194];
* word embeddings can be defined by pooling representations of instances [114]
* unsupervised segmentation and spoken term discovery can be seen as
  * detecting and clustering segments [195], [196]; and even
* ASR as matching written word representations to reprs of audio spans
  [91], [197], [198]
* learning representations of spans of speech, especially word segments,
  typically referred to as acoustic word embeddings
* Early work on unsupervised acoustic word embeddings defined them as
  vectors of distances from the target segment to a number of pre-defined
  “template” segments [199]. Later work used
  * variants of neural autoencoders [118], [200]–[202]
* evaluated on word discrimination = determining whether two word segments
  correspond to the same word or not [203]. This task can be thought of as
  * a proxy for query-by-example search, since the basic operation in search is
    to determine whether a segment in the search database matches a query
    segment, and
  * has been used for evaluation of both frame-level [89] and word-level [199],
    [204] reprs
* most work on acoustic word embeddings preceded the very recent wave of new
  self-supervised frame-level reprs
  * ? whether word (or more generally segment) embeddings could be derived more
    simply by pooling self-supervised frame-level representations, as has been
    done for text span embeddings by pooling over word embeddings [205], [206]
    * [205] S. Toshniwal, H. Shi, B. Shi, L. Gao, K. Livescu, and K. Gimpel,
      “A cross-task analysis of text span representations,” ReprLearn4NLP 2020
      [206] S. Wang, L. Thompson, and M. Iyyer,
      “Phrase-BERT: Improved phrase embeddings from BERT with an application to
      corpus exploration,” EMNLP 2021
  * Some initial results suggest that at least very simple pooling approaches
    like downsampling and mean or max pooling are not successful [202], [207],
    but more work is needed to reach conclusive results

# IV. Benchmarks for self-supervised learning 12

# V. Analysis of self-supervised representations

## A. Information content

## B. Training criterion

## C. Effects of data and model size

## D. Robustness and transferability

# VI. From representation learning to zero resources

## A. Unpaired text and audio

## B. No text or lexicon

# VII Discuss and Conclu 23

* solid performance of Wav2vec 2.0 for speech recognition and many downstream
  * multilingual variants public, enabled wide adoption in the community making
    * a “standard” goto model
* simplicity and stability of the HuBERT approach
  * resemblance of its training procedure to classic frame-level ASR systems,
  * => an easy choice for research extensions on improving representation
    quality, speech translation, and textless NLP
* shortcomings of existing work and future research directions

## Using the representation model

* two main ways to use representation models
  * Freeze the representation models and use them as feature extractors, or
  * fine-tune the representation models on downstream tasks.  Some
* NLP: efficient methods for leveraging SSL models exist
  * Adapters [337]– [339] are lightweight modules inserted into SSL models, and
    in downstream tasks, the parameters of SSL models are frozen, and only the
    adapters are trained
  * prompt/instruction learning methods [20] also freeze the SSL parameters and
    control the output of SSL by adding additional information, which is called
    prompt, in the input
  * Both yield competitive performance compared with fine-tuning in NLP
* hE little related work for speech [340], [341]. In addition,
  * prompt for speech SSL does not achieve comparable performance on generation
    * eg phoneme recognition and slot filling, so how to use prompt is still an

## Increasing the efficiency of the representation model

* As discussed in Section V-C
* larger representation models lead to better downstream performance
  * high costs in terms of memory and time for pre-training, fine-tuning, and
    even when used only to extract representations without gradient calcul
    => unsuitable for edge devices or very large datasets
* compressing speech representation models through network
  pruning [342] or knowledge distillation [343]
  * conditional computing [344] and neural network quantization [345]
  * improving the specific efficiency of Transformer models, especially with
    * self-attention [346], but these technology has
    * not been widely used in speech SSL
* ?reduce the length of speech representation sequence but still keep the info
  * no publication in this direction when writing this paper
* non-streaming architectures in models such as the bidirectional Transformer
  have hindered the representation model used in streaming scenarios, leading
  to studies that address these problems [347]. We anticipate research here

## Data-efficient approaches

* data needed by SOTA representation learning meths way beyond what babies need
* generative approaches could be more data efficient than
  contrastive or predictive approaches
  since they are constrained by more bits of info to reconstruct their inputs

## Feature Disentanglement

* Speech SSL models show strengths on a surprisingly wide range of tasks [44],
  ie representations contain different information. One way to further improve
* decompose the representation into content embedding and speaker embedding and
  * Some work has been in this direction [348]–[350]

## Creating robust models. As discussed in Section V-D, studies conducted [351]

* the failure modes of SSL models are still poorly understood, and it remains
  * whether they provide more or less robustness to adversarial attacks than
    fully supervised models. Due to the importance of this research direction,
* enhancing the robustness of SSL models [281], [352]– [354] and
* identifying their vulnerability to adversarial attack [351]

## Capturing higher-level semantic information

* many representation learning approaches capture some lexical info [355]
* hE struggle in higher-level semantic tasks easily captured by eg BERT
* One workaround is two-stage training [77], [332]; however, this
  * hE prevents propagating rich lexical and semantic knowledge modeled in the
    second stage to benefit the phonetically focused first stage

## Using text representation models to improve speech representation

* The amount of content information in speech corpora used to train speech
  representation models is far less than that of text representation models
  * the BERT training corpus exceeds 3 billion words [54], and assuming a
    typical speaking rate of 120 words per minute, a speech corpus containing
    the same content as the BERT training data would include 400,000 hours of
  => the use of text models such as BERT and GPT seems key: nevertheless,
  * hE ? how to use these to improve speech representation model pretraining
* The relationship between representation models and downstream tasks ||
  the relationship between operating systems and applications
  * even individuals can build applications with desired functions on a
    smartphone because the smartphone’s operating system handles the complex
    communication with the hardware and provides a convenient developer
    interface. Likewise, as SSL representation models learn general knowledge
