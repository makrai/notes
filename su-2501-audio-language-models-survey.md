Audio-Language Models for Audio-Centric Tasks: A survey
Yi Su, Jisheng Bai, Qisheng Xu, Kele Xu, Yong Dou
arXiv:2501.15177 [cs.SD]

# Abstract

* Audio-Language Models (ALMs)
  * trained on audio-text data
  * processing, understanding, and reasoning of sounds
  * Unlike traditional supervised learning approaches
  * utilize natural language as a supervision signal, which is
    more suitable for describing complex real-world audio recordings
  * strong zero-shot capabilities and
    * can be flexibly adapted to diverse downstream tasks
  * Models combined with LLMs exhibit listening, thinking, and reasoning
    + significant success in following audio instructions <~ Conclusion
  * enhance the accuracy and generalization of audio processing tasks
  * These strengths promote the development of models that more closely
    resemble human auditory perception and comprehension
* this surveys: focus on general audio tasks
  * a structured and holistic overview of ALMs
  * the background of computer audition and audio-language models;
  * the foundational aspects of ALMs, including
    architectures, training objectives, and evaluation methods;
  * foundational pre-training and audio-language pre-training approaches;
  * task-specific fine-tuning,
    multi-task tuning and
    agent systems for downstream applications;
  * datasets and benchmarks; and
  * current challenges and future directions
  * a wide range of tasks in various
    audio types such as natural sounds, speech, and music
    * human voices, natural sounds, music rhythms present
      significant challenges to general audio modeling [23]
  * we analyze the current challenges in this field and propose directions

# I. Intro

* Enabling machines to hear like humans and process audiocentric tasks [1]
  [1] S. Deshmukh, B. Elizalde, R. Singh, and H. Wang,
  “Pengi: An Audio Language Model for Audio Tasks”
  NeurIPS 2023
* Audio-Language Models (ALMs)
* applicable to
  * basic audio tasks, such as audio classification [2], but also show great
  * audio-text retrieval [3], audio generation [4],
    automatic audio captioning [5], audio source separation [6],
    automatic speech translation [7], and audio chatbots [8]
* In contrast to learning based on labeled data for specific audio tasks,
  ALM can learn from more descriptive textual information, expanding the scope
  * including human-annotated captions and
    readily available titles and descriptions from web sources [9]
  * Natural language is well-suited for characterizing real-world audio
    * eg multiple overlapping sound events:
      ALMs can learn the intrinsic relationships [10]
  * avoids the model’s reliance on task-specific predefined labels
    ~> potential for models to generalize effectively to open-world scenarios
* integration with LLMs as guiding components within ALMs
  * LLMs exhibit remarkable comprehension capabilities
  * hE LLMs still face challenges in generalizing across a broad spectrum of
    downstream tasks [11], necessitating additional transfer steps such as
    post-training and collaboration with other foundational models
* language as a bridge
  * a unified mechanism for constructing instances, enabling LLMs to undergo
    instruction tuning and incontext learning across diverse tasks. This
    * bridges the gap between auditory information and language understanding,
      facilitating the alignment of multiple components within ALMs
  * a versatile human-machine interface, empowering users to
    instruct LLM agents to collaborate effectively with audio-language systems
* Existing relevant reviews include
  * speech-language models [12, 13]
  * codec-based models [14]
  * ALMs for specific tasks such as audio-text retrieval [15]
  * automated audio captioning [16]
  * speech-to-text translation [17]
  * audio-language datasets [18]
* we: the first comprehen survey on ALMs, from the perspective of model training
  * perspective centered on general audio-centric tasks
  * a diverse range of audio types
* Fig. 1: A timeline of recent advances in audio-language models
  * datasets serve as the foundation for inspiring research
    in pre-training and downstream models
  * CLAP [2] is considered a significant milestone
* audio-caption datasets [19–21]
  * initially used for automatic audio caption model training and
  * also served as data foundations for ALMs, inspiring subsequent work
* pre-training and large-scale datasets [22]
  * the advantages of ALMs have gradually gained attention
* Recently: intertwined development between pre-training and downstream models
  * evaluation standards and proposed various benchmarks
  * datasets, pre-training, downstream models, and benchmark research in ALMs
  * driven by commercial applications,
    research interests have shifted more towards the speech domain
* general audio modeling [23]
  * types including human voices, natural sounds, music rhythms, etc

# II. Background of audio-language pre-training and transfer

## A. Pre-training and Transfer Paradigm

* two challenges within the pre-training and transfer paradigm
  * models may overfit by exploiting simple label mappings [24]
  * the high cost of manual annotation [25]
* ALMs: to learn audio concepts through natural language supervision [2]
  * provides more details about the audio, enabling models to
    understand the meanings and make decisions accordingly like a human
    * eg natural language can describe the temporal order of multiple events
      using words such as ‘simultaneous,’ ‘before,’ and ‘after’ [26], better
      reflecting the complex composition of audio compared to predefined labels
      and helping models learn their intrinsic relationships [10]
  * easier to obtain than well-defined labeled datasets
    * eg ‘dog’ or ‘barking’ to label a dog barking
    * difficult to create a perfectly accurate audio dataset
    * human-annotated captions and translations, titles and descriptions related
      to audio found abundantly on the web can also serve as sources of annot

## B. Audio-Language Training Stages

* As data and model sizes grow,
  the training strategies for ALMs become more intricate
* def: pre-training (reprlearning) vs fine-tuning (transfer)
  * representation learning/pre-training:
    stages aimed at enhancing task-independent audio reprs
  * transfer: fine-tuning and cooperating
    (just) before the model is applied to downstream tasks
* pre-training can be further divided into multiple stages, typically including
  * pre-training of foundational models, followed by
  * audio-language pre-training on paired data
  * potentially further training on a broader range of data and tasks
* zero-shot or transfer
  * ALMs have achieved strong zero-shot capabilities in audio retrieval,
  * hE transfer remains an important stage for the downstream application
* Task-specific fine-tuning is one of the most widely used methods. It involves
  * supervised fine-tuning of pre-trained models on downstream task datasets
  * potentially with adaptive modules. Or
  * transferring simultaneously on multiple tasks to make the model more
    universal or gain from multi-task knowledge sharing
  * instruction tuning and in-context learning aim to enhance (or unlock) the
    LLM’s ability to follow human instructions
    * fine-tunes ALMs with a set of formatted instances in natural language [27]
    * thus helping the model generalize to various downstream tasks
  * agent system: Multi-task transfer by cooperating multiple models

## C. Research Landscape (Fig 2)

* pre-training vs transfer
* ALMs integrate pre-trained audio and language models, then undergo further
  pre-training on extensive audio-text data
  * Transfer is crucial for combining these models with other networks and
    applying them to various downstream tasks
* Data is an essential element for model training and evaluation
  * pre-training for representation learning,
  * downstream transfer, and
  * datasets and benchmarks
* Fig. 2: Research landscape for audio-language models
  * audio-language representation requires pre-training (Sec IV),
  * transfer to downstream application
    through task-specific fine-tuning or instruction tuning (Sec V),
  * data (Sec VI) is the foundation for model training, and it can be divided
    * labeled audio datasets,
    * audio-text paired datasets, and
    * audio question answering datasets

# III. Foundations: architecture, training objectives, and evaluation methods

## A. ALM Architectures (Fig 4)

* ALMs and systems typically comprising audio and language encoders, and
  may include other multimodal alignment mechanisms and language models. As
* four types: Two Towers, Two Heads, One Head and Cooperated Systems
* Two Towers, with one encoder and a projector for each modality,
  * embeddings will be aligned in a joint space
  * most prominent pre-training: Contrastive Language-Audio Pretraining (CLAP)
    * incorporates a contrastive learning framework to
      bring audio and text descriptions into a joint multimodal space,
      learning the mapping relationship between the two modalities [2]
  * based on the concept of modality alignment,
    mechanisms can be added between two independent encoders
    to facilitate communication
    ~> early-stage modality fusion during the representation phase [28]
* Two Heads, adds language model on top
  * ‘Head’ refers to a network that unifies a certain modal representation
    space into a unified space [29–31]
  * Language modeling has first been proven to possess strong capabilities in
    semantic feature extraction within the field of speech [32], making it a
    natural design choice to incorporate language models into ALMs. With the
  * many works have utilized LLMs as the backbone for ALM inference, expanding
    the perceptual modalities of large language models and leveraging their
    emergent understanding capabilities
  * classic works such as SpeechGPT [8], Pengi [1], and Qwen-Audio [33],
    making Two Heads a unified architecture of Large Audio-Language Models. In
  * modality fusion can also be promoted through communication mechanisms
    between encoders [34]. It is important to note that
  * in some works, text inputs may only undergo tokenization
    without the need for a dedicated text encoder, and
    these models can be considered under a special type of Two Heads framework
* One Head, with one unified encoder and a language model
  * one encoder to handle two different modalities simultaneously, with a
    language model on top. In the
  * vision community, a line of work has conducted research on the One Head
    architecture
    based on the view that the same multimodal processing module can achieve
    better alignment. That is, using a unified space to represent two
  * hE there are relatively few related studies in audio-language [35]
* Cooperated Systems, utilize LLMs as agents to cooperate several models
  * various model types mentioned above. Its design
  * facilitates the selection and utilization of each model’s inherent
    complementary strengths, tailored to downstream task requirements. Through
  * the system can tackle a wider array of complex tasks [36]

## B. Training Objectives (Fig 5)

* Pre-training objectives include contrastive, generative, and discriminative
  * may be conducted on audio-text or single-modal data
  * aiming to learn audio semantic features and audio-language correlations
* transfer objectives can be
  * task-specific fine-tuning objectives: either generative or discriminative
  * generative language modeling objective
    * aims to improve unlock pre-training models’ generalization ability on
      downstream tasks through standard language modeling objectives. Note that
* the above training objectives can be used in combination

### Contrastive Objectives

* audio-language pre-training: the most commonly used type of training objective
* bring positive sample pairs closer together and
  push negative sample pairs further apart
  within a shared embedding space for audio and text
  * ie audio-language correlations and
    distinguishable representations between audio samples
* symmetric audio-text infoNCE [37] loss function
  to measure the similarity between audio and text embeddings
  * The most widely implemented approach for this category of objective
  * Let the i − th sample pair be x i , t i . Given an
  * audio encoder h a (·) and a text encoder h t (·),
    audio sample x i and its corresponding caption t i
  * the embedding vectors can be represented as:
  z i a = h a (x i ) (1)
  z i t = h t (t i ) (2)
  The similarity between audio and text embeddings: dot product
  * The infoNCE loss for the audio dimension, l a , is defined as
    the average of a normalized function measuring the similarity of different
    texts to the same audio query
  * the contrastive loss for the text dimension, l t , measures the similarity
    of different audios to the same text query
  * For a batch with B audio-text pairs, we have:
    l i a = − log softmax z i a · z j t /τ (3)
    l i t = − log softmax z i · z j /τ (4) where
* τ represents a temperature parameter used to scale the range of logits

### Generative Objectives

* in audio representation learning [in general]:
  generative objectives lead the network in learning semantic features of audio
  through pretext tasks such as masked reconstruction [38]
* In audio-language pre-training, similar approaches are introduced
  * audio or audio-related language generation tasks
  * often combined with contrastive learning to bolster the robustness of
    learned audio embeddings or improve computational efficiency
  * During transfer, these generative objectives can help the model adapt to
    corresponding generative tasks and are
    widely used in transfer with generative LLMs
* pre-training: the most common method for audio mask reconstruction is
  based on the audio spectrogram
  * M (·) denotes the masking operation
  * f a (·) represents the spectrogram encoder
  * p ae (·) is the audio embedding projection layer
  * masked spectrogram prediction: an additional decoder f a −1 (·) is added
  * For an audio sample with the original spectrogram $a$,
  * spectrogram reconstruction can be represented as â = f a −1(p ae(f a(M(a))))
    * â n and a n to denote the decoder prediction output
      of the n − th masked spectrogram patch and the original true patch, resp
  * spectrogram divided into N patches,
  * the audio reconstruction loss used for self-supervision can be defined as
    minimizing the L2 (mean squared error, MSE) loss
  * ALMs include both audio and language modalities as inputs
    ~> some works have similarly designed masked crossmodal reconstruct tasks eg
    cross-attention mechanisms to communicate between the two encoders
    and perform reconstruction on the audio representation
* transfer: During audio generation transfer, training objectives
  enhance the model’s performance by minimizing the distance between the
  predicted embedding ẑ and its corresponding ground truth z
  * distance metric can be chosen based on the situation
    * eg L1 and L2 distances
  * training objective can also be set as a weighted sum of multiple distances
    * audio sample: generative audio train obj can be \mean \alpha L1 + \beta L2
  * also possible to directly train jointly with the decoder network, designing
    the training objective directly on the predicted audio amplitude. For
    * eg aiming to learn a decoder net h de (·) that maps known audio x i and
      query t i to a predicted audio â i
    * z i t is the embedding of the language query
    * the training objective could be the L1 (mean absolute error, MAE) loss
      between the amplitude spectrogram |a i | of the ground truth target audio
      and the predicted |â i |
* LM: Generative language modeling objectives are used to guide ALM in
  generating audio-related text that is consistent with the ground truth
  * pre-training: force the model to learn audio-language correlations
    * improve the model’s performance on corresponding downstream tasks
      (eg automatic caption generation)
  * fine-tuning: as a standard loss for generative language modeling, it is also
    commonly used during ALM transfer with language model [39]
  * An additional text decoder (language pre-trained model) is required in
    language generation
    * autoregressive language model
      to predict tokenized text associated with a given audio sample x,
      the language modeling objective is defined as minimizing the
      negative log-likelihood of the current ground-truth token (cross-entropy,
      CE loss), given the previous ground-truth tokens
    * Non-autoregressive language models also adopt a similar
      negative log likelihood objective without temporal averaging

### Discriminative Objectives

* They are used to guide the model in learning to predict the correct label, and
* categorized into classification and retrieval objectives
* eg take the cross-entropy function to uniformly calculate the loss
  between the predicted output and the truth
* Audio classification is one of the most extensively studied downstream tasks
  * recognize patterns from specific audio inputs to predict given labels
  * For a batch of B audio samples, the objective is avg y i,c log(p̂ i,c )
  * C is the number of classes. y i,c is the true label of the i − th sample
  * p̂ i,c is the predicted probability of the i − th sample in class c
* Audio-Text Retrieval (ATR) aims to
  find matching items between audio clips and textual descriptions
  * Given a query in one modality (audio or text), the goal is to retrieve the
    corresponding item from a pool of candidates in the other modality
  * scoring function S (·) to represent the model’s prediction output
  * Y is a set of m possible caption texts, the correspondence caption of a
    given audio x i is argmax softmax S(z i a , z j t )
  * retrieval tasks can be considered as instance-level classification, so the
    objective can be formatted as L = \sum log yi^
  * Specially, audio-text matching is pretext task designed to
    forcing a more fine-grained alignment between audio and text embeddings
    than contrastive pre-training
    * predict whether a given text correctly describes a provided audio
    * binary classification task
      L mat = p log S(z a , z t) + (1 − p) log 1 − S(z a , z t)
    * Here, p is 1 if the audio and text are paired, otherwise it is 0

## C. Evaluation Methods

* Zero-Shot Evaluation
  * assessing the ability of contrastive ALMs in open-set retrieval
  * measuring the similarity between audio and text embeddings
  * allows for zero-shot evaluation on classification tasks
    eg sound event detection and emotion recognition
* Linear Probe Evaluation of the audio representation of pre-trained ALMs
  * probe
    * adding a linear header (usually an MLP) to the frozen pre-trained model
    * training the header on downstream tasks, allowing the model to be adapted
      for specific tasks and datasets: simple transfer learning
    * may not achieve optimal performance on specific tasks
    * minimizes the variables introduced, hence its widespread adoption
  * tasks are usually fundamental linear tasks like classification
* Supervised Fine-tune Evaluation
  * examines the generalization ability of the pre-trained model to downstream
    tasks and its task-specific performance
  * the audio encoder is unfrozen and fine-tuned along with an attached head
  * performance is then validated on the test set and compared with SOTA models
  * tasks: not only classification tasks but often eg detection and generation
* Instruction-following Evaluation
  * esp for the generalization ability of Large Audio-Language Models (LALMs)
  * a special type of zero-shot evaluation or supervised fine-tuning evaluation,
    depending on whether instruction tuning is performed

# IV. Representation pre-training

* the choice of encoders significantly impacts the generation of powerful
  representations through Audio-language pre-training and
  enhances the performance of downstream tasks [40]

## A. Audio Pre-training

* CNN-based Models
  * strong feature extraction capabilities, parameter sharing, and sparse
    connectivity. In audio applications, CNNs-based models usually use
  * short-time Fourier transform (STFTs) to convert time-domain waveforms into
    log-mel spectrograms as input. Models like
  * AlexNet and VGG perform well in audio classification tasks [41, 42], and
  * performance is related to the design of network depth and width
  * PANNs [43] based on CNN14 achieve good results in Audioset labeling,
    * [43] Q. Kong, Y. Cao, T. Iqbal, Y. Wang, W. Wang, and M. D. Plumbley,
      Panns: Large-scale pretrained audio neural networks for audio patt recog
      IEEE/ACM Transactions on Audio, Speech, and Language Processing 2020
* Transformer-based Models: These models utilize self-attention mechanisms to
  * Wav2vec 2.0 [44] and HuBERT [45] are designed for speech tasks,
    * combining CNN with self-attention to manage local features and long-term
    * Wav2vec 2.0 uses a unique self-supervised method, which
      converts raw audio into potential representations through CNN, and then
      generates contextual output with masks and Transformer
    * Training involves contrastive tasks to predict masked segments for generlz
    * HuBERT improves this by introducing noise labels from offline clustering
      to form a codebook for pre-text prediction,
      encouraging the model to capture acoustic details and long-range temp rels
  * Whisper
    * supervised models face overfitting risks during fine-tuning [46],
    * Whisper [47] addresses this issue with a multi-task training framework,
      * encoder-decoder Transformer with additional convolutional layers for
        processing audio spectrograms, promoting next token prediction across
        tasks and offering wide adaptability
  * AST [48] is the first model without convolutions and based purely on
    attention for audio spectrograms
    * requires more data for training and faces
      challenges with large GPU memory and long training times [49]
  * HTSAT [50] deals with these issues through a hierarchical model structure,
    processing audio signals through multiple layers, with each layer’s
    Transformer capturing temporal and structural information, enabling more
    effective handling of long audio signals
  * AudioMAE [38]
    * audio extension of the Masked Autoencoder (MAE) [51], adopting a
      Transformer-based encoder-decoder design, masking log-mel spectrograms at
      a high rate, with the encoder providing non-masked tokens and the decoder
      reconstructing masked parts
    * advanced performance in classification tasks and is
    * one of the mainstream self-supervised pre-training models in the audio
* Codec-based Models: Based on the
  * encoder-decoder structure,
  * they can convert continuous audio into discrete tokens for developing ALMs
  * some loss of information, hE they excel at extracting acoustic features and
    * high-quality audio reconstruction [52]
  * SoundStream [53] is a pioneer, using
    * streamable SEANets [54] for encoding and decoding, and
    * Residual Vector Quantization (RVQ) bottleneck for parallel token flow,
      optimized through reconstruction and adversarial loss
  * Encodec [55] enhances this framework by adding LSTM layers and using a
    Transformer-based language model to improve sequence modeling performance

## B. Language Pre-training

* small (≤ 1 billion), medium (1−10 billion), large (10−100 billion), and
  very large (> 100 billion). Models with over
* > 1 billion parameters are referred to as LLMs. By pre-training on vast
* fine-tuning techniques incorporating human feedback, numerous LLMs with tens
* 10 bs: promising capabilities for multimodal tasks. Renowned language pre-
* GPT (Generative Pre-trained Transformers) families [56–61],
* LLaMA (Large Language Model Meta AI) families [62–65],
* Qwen [66–69], and
* OPT (Open Pre-trained Transformer) families [70, 71]
* details: please refer to [11, 72]
  * [11] W. X. Zhao, K. Zhou, J. Li, T. Tang, X. Wang, Y. Hou, Y. Min, B. Zhang,
    J. Zhang, Z. Dong, et al
    A survey of large language models, arXiv:2303.18223, 2023
  * [72] S. Minaee, T. Mikolov, N. Nikzad, M. Chenaghlu, R. Socher, X
    Amatriain, and J. Gao, “
    Large language models: A survey,” arXiv preprint arXiv:2402.06196, 2024

## C. Audio-Language Pre-training

| Model           | Architecture       | Con | Gen | Dis | Notes                                                                               |
|-----------------|--------------------|-----|-----|-----|-------------------------------------------------------------------------------------|
| MS-CLAP [2]     | CNN14 + BERT       |  1  |     |     | first to propose contrastive learning for ALM pre-training                          |
| LAION-CLAP [22] | HTSAT + RoBERTa    |  1  |     |     | first open-source contrastive learning for ALM pre-training                         |
| MS-CLAP V2 [50] | HTSAT-22 + GPT-2   |  1  |     |     | multi-task audio encoder and an autoregressive text encoder                         |
| BLAT [73]       | CNN14 + BERT       |  1  |     |     | audio captioning to synthetic data for pre-training                                 |
| ACBA [74]       | CNN14 + RoBERTa    |  1  |     |     | synthesize sequential audio with captions
                                                                   to enhance sequential relationship modeling capability between sound events |
| COMPA [26]      | HTSAT + Flan-T5    |  1  |     |     | composition-aware
                                                                            contrastive learning to enhance compositional reasoning capability |
| MGA-CLAP [75]   | HTSAT / AST + BERT |  1  |     |     | shared codebook and hard negative guided contrastive loss
                                                                            to unify the granularity and latent distribution of two modalities |
| MusCALL [76]    | ResNet50 + GPT-2   |  1  |     |     | strong performance in zero-shot genre classification and auto-tagging tasks
                                                                                                                       within the music domain |
|-----------------|--------------------|-----|-----|-----|-------------------------------------------------------------------------------------|
| CTAL [28]       | RoBERTa            |     |  1  |     | early exploration of joint representation learning methods
                                                                                                             for audio and language modalities |
| FLAP [77]       | MAViL + RoBERTa    |  1  |  1  |     | self-supervised audio-language representations
                                                                                   by masking for both contrastive learning and reconstruction |
| M2D-CLAP [78]   | M2D + GTE          |  1  |  1  |     | combine Masked Modeling Duo (M2D) to train audio encoder while contrastive learning |
| Cacophony [79]  | AudioMAE + RoBERTa |  1  |  1  |     | enhances audio-text alignment using auxiliary captions for fine-grained learning    |
| MINT [34]       | Data2vec + Flan-T5 |  1  |  1  |  1  | multi-target pre-training and instruction tuning                                    |


### Contrastive Pre-trained Models

* Inspired by vision, the CLIP [80] model, which
  * CLIP leverages large-scale web visual-text pairs to expand the training
  * excellent performance across various tasks, researchers have begun to apply
* MS-CLAP [2] (prefix added by the editor for distinction) is the first
  * symmetric audio-text infoNCE loss function 5 for pre-training based on
  * data: audio-text paired datasets and audios from other tasks such as audio
    classification
* Subsequent studies have focused on dataset scaling
  * LAION-CLAP [22] released a larger audio-caption dataset, LAION-Audio-630K,
    and trained the first fully open-source CLAP model based on this dataset
    together with other public datasets
  * MS-CLAP V2 [50] not only/but also
    * leverages a more extensive multi-task trained audio encoder
    * further expands the audio-text paired dataset for contrastive
      language-audio learning
  * BLAT [73], from another prospective, proposes using an audio captioning
    model to generate audio-text pair data for contrastive pretraining
* address the inherent shortcomings of the vanilla CLAP. The experiments of
  * ACBA [74] show that CLAP has limited understanding of natural language,
    especially regarding the order or concurrent arrangement of sound events. It
  * modifying the original pretraining dataset to provide more audio-language
    pairs about ordering
  * COMPA [26]
    * issue: current benchmarks cannot measure the lack of combinatorial
      reasoning in models and proposes
    * contrastive training with
      composition-aware hard negatives and a modular contrastive loss
  * MGA-CLAP [75] tackles the
    * problem of different granularities between modalities by adopting
    * solution: a shared codebook, designing
      a locality-aware block and a
      hard-negative guided loss to achieve fine-grained alignment
  * MusCALL [76] conducts pre-training research in professional fields such as
    music and performs excellently in related tasks
    * [76] I. Manco, E. Benetos, E. Quinton, and G. Fazekas, “
      Contrastive audiolanguage learning for music,” in
      Ismir 2022 Hybrid Conference, 2022

### Generative Pre-trained Models

* Cross-modal Transformer for Audio-and-Language (CTAL) [28] is an early
  * masked language modeling and
    cross-attention based masked cross-modal acoustic modeling
* Fast Language-Audio Pre-training (FLAP) [77] conduct representation learning
  through the combination of masked reconstruction and contrastive learning
  It generates multiple augmented views of the audio through masking for
  inter-modal contrast and
  * reconstruct the masked parts of the audio spectrogram. This masking
  * reduces the amount of data that needs to be processed, thereby
    lowering the computational complexity and making it
    more efficient than contrastive learning with raw spectrograms
  * the masked reconstruction task, encourages the model to compress information
    into each sample embedding, making the audio embedding
    ie not only close to their textual counterparts but also producing more
    informative original inputs
* M2D-CLAP [78] addresses the
  * issue: MAE using all patches to encode training signals, which
    may lead to underutilization of inductive biases. By
  * combining Masked Modeling Duo (M2D) [81] to train the audio encoder while
    contrastive learning further promotes input modeling, thus enhancing the
    effectiveness of the learned representations
* Cacophony [79]
  * vision-language has shown that
    integrating auxiliary captioning objectives in contrastive learning can pro-
    vide stronger supervision [82, 83]
  * Cacophony: improves CLAP by incorporating an auxiliary captioning objective,
    encouraging the audio encoder to capture fine-grained patterns closely
    matching text descriptions

### Discriminative Pre-trained Models

* set up a pretext task of audio-text matching, allowing the model to learn
  cross-modal alignment features
* MINT [34] is a framework that enhances audio-language pretraining through
  multiple objectives. Specifically, it introduces
  * Bridge-Net as a trainable module,
    taking the output of the audio encoder and text as inputs to the Bridge-Net
  * contrastive objective to align the audio and text representations by
    maximizing the mutual information between them,
    combines matching objective for fine-grained audio-text alignment, and
  * generative objective to guide the audio-grounded text generation task,
    forcing the model to extract audio features to capture all necessary
    information about generating the text

# V. Downstream transfer

* [1] S. Deshmukh, B. Elizalde, R. Singh, and H. Wang
  Pengi: An Audio Language Model for Audio Tasks
  NeurIPS 2023
* divided into task-specific fine-tuning or multi-task tuning and cooperation

## A. Task-specific Fine-tuning

| Model              | Domain        | Architectures / Pre-trained models          | Tasks     <td colspan=2>Input <td colspan=2>Output
|                    |               |                                             |           | A | T | A | T |
|--------------------|---------------|---------------------------------------------|-----------|---|---|---|---|
| VALL-E [32]        | Speech        | EnCodec + AR/NAR LM                         | TTS       | 1 | 1 | 1 |   |
| VALL-E X [84]      | Speech        | EnCodec + AR/NAR LM                         | TTS, S2ST | 1 | 1 | 1 |   |
| MMCE-Qformer [85]  | Speech        | RoBERTa + SpeechTokenizer + GPT-2           | TTS       | 1 | 1 | 1 |   |
| E2 TTS [86]        | Speech        | Unsupervised Pretraining + BigVGAN          | TTS       | 1 | 1 | 1 |   |
| Seed-TTS [87]      | Speech        | Speech Tokenizers + AR LM + DiT + Vocoders  | TTS       | 1 | 1 | 1 |   |
| F5-TTS [88]        | Speech        | ConvNeXt + DiT                              | TTS       | 1 | 1 | 1 |   |
| Whisper [47]       | Speech        | BPE + encoder-decoder Transformer           | ASR, S2TT | 1 |   |   | 1 |
| Style-Talker [99]  | Speech        | Whisper + Qwen-Audio + StyleTTS 2           | ASR       | 1 |   |   | 1 |
| Seed-ASR [100]     | Speech        | LUISE + MoE LLM                             | ASR       | 1 | 1 |   | 1 |
|--------------------|---------------|---------------------------------------------|-----------|---|---|---|---|
| MusicLM [90]       | Music         | SoundStream + w2v-BERT + MuLan              | TTM, SG   | 1 | 1 | 1 |   |
| MusicGen [106]     | Music         | EnCodec + AR LMs                            | TTM       | 1 | 1 | 1 |   |
| MeLoDy [107]       | Music         | MuLan + Wav2Vec2-Conformer + VAE + LM + DPD | TTM       | 1 | 1 | 1 |   |
| TANGO [91]         | Music         | FLAN-T5 + LDM + VAE + HiFi-GAN              | TTM       | 1 | 1 | 1 |   |
| LP-MusicCaps [101] | Music         | Whisper + BART-base                         | AAC       | 1 | 1 |   | 1 |
|--------------------|---------------|---------------------------------------------|-----------|---|---|---|---|
| AudioLM [89]       | Speech, Music | SoundStream + w2v-BERT                      | SC, PC    | 1 |   | 1 |   |
|--------------------|---------------|---------------------------------------------|-----------|---|---|---|---|
| AudioGEN [92]      | General audio | SoundStream + LSTM                          | TAC       | 1 | 1 | 1 |   |
| Diffsound [93]     | General audio | VQ-VAE + diffusion                          | TTA       |   | 1 | 1 |   |
| AudioLDM [4]       | General audio | CLAP + LDM + VAE                            | TTA       | 1 | 1 | 1 |   |
| LASS-Net [6]       | General audio | BERT + ResUNet                              | LASS      | 1 | 1 | 1 |   |
| ClipSep [94]       | General audio | CLIP + U-Net                                | LASS      | 1 | 1 | 1 |   |
| AudioSep [95]      | General audio | CLIP / CLAP + ResUNet                       | LASS, SE  | 1 | 1 | 1 |   |
| OpenSep [96]       | General audio | Caption Models + Instruction-tuned LLMs     | LASS      | 1 | 1 | 1 | 1 |
| FlowSep [97]       | General audio | FLAN-T5 + VAE + BigVGAN                     | LASS      | 1 | 1 | 1 |   |
| TQ-SED [98]        | General audio | CLAP + ResUNet + DPRNN                      | TSED      | 1 | 1 | 1 |   |
| ACT [102]          | General audio | DeiT + Word2Vec                             | AAC       | 1 |   |   | 1 |
| EnCLAP [5]         | General audio | CLAP + BART + EnCodec                       | AAC       | 1 |   |   | 1 |
| EnCLAP++ [103]     | General audio | CLAP + BART + DAC                           | AAC       | 1 |   |   | 1 |
| ReCap [104]        | General audio | CLAP + GPT-2                                | AAC       | 1 |   |   | 1 |
| DRCap [105]        | General audio | CLAP + SLAM LLM                             | AAC       | 1 |   |   | 1 |

* supervised fine-tuning on specific downstream task datasets
  * adaptive modules, such as adding a linear proj layers to a spec num of cats
  * between the source and target domains, facilitating knowledge transfer
* discriminative tasks include audio classification (AC) and audio-text
  retrieval (ATR)
* classification broadly encompasses more specific scenarios such as
  Sound Event Classification, Accent Classification, Chord Classification,
  Spoken Language Identification, speech emotion recognition (SER), and
  spoken language understanding (SLU)
* Generative tasks can be further divided into
  * audio generation:
    * speech: speech continuation (SC), text-to-speech (TTS), and speech
      enhancement (SE) in the speech domain [32, 84–89];
    * music: piano continuation (PC), stereo generation (SG), and
      text-to-music (TTM) in the music domain [89–91]; as well as
    * other: text-guided audio continuation (TAC), text-to-audio (TTA),
      language-query sound source separation (LASS), and
      text-query sound event detection (TSED) in other general audio domains
      [4, 6, 92–98]
  * Language generation, on the other hand, centers on transcription,
    translation, and caption. Typical tasks include
    * automatic speech recognition (ASR) [47, 99, 100],
    * speech-to-text translation (S2TT) [84],
    * speech-tos-peech translation (S2ST) [47], and
    * automatic audio captioning (AAC) [5, 101–105]

### Models for Discriminative Tasks, Fig 6

* Through contrastive learning with natural language supervision,
  pre-trained ALMs can perform zero-shot audio classification and retrieval
  within a unified framework
  * pre-trained models already have strong generalization capabilities,
    nL supervised fine-tuning remains important [2, 22, 50]
  * Audio classification: mapping input audio to a label
    * the audio encoder from the pre-trained model can serve as a powerful audio
      pretraining model, used to train additional classifiers on specific
      datasets for fine-tuning
  * Retrieval can be divided into audio-to-text and text-to-audio
    * classification considered as a special case of retrieval
    * ATR research primarily focuses on enhancing system performance by
      integrating orthogonal SOTA works
* eg CNN14-NetRVLAD [108]: audio features and sequence aggregation
  * CNN14-based audio pretraining model PANNs and
  * NetRVLAD pooling techniques to achieve significant improvements in
  * bidirectional audio-text retrieval
* EN-CA-IMC [109] implements an audio enhancement strategy (EN) involving
  Gaussian noise, pitch adjustment, and time shift to reduce model overflow,
  + co-attentive mechanism (CA) and
  * intra-modal contrastive learning (IMC) between enhanced and original audio
* CED-BERT-LE [110] integrates a language enhancement strategy (LE) for
  effective cross-lingual retrieval and uses
  consistent ensemble distillation (CED) to handle variable-length audio
  * proficiency across seven additional languages with minimal extra train data
* the mini-batch Learning-to-match (m-LTM) framework [111] adapts the
  Learning-to-match approach using minibatch subsampling and
  Mahalanobis-enhanced ground metrics, leveraging soft-matching from entropic
  optimal plans and Mahalanobis distance to learn a rich, expressive joint
  embedding space for audio and text modalities

### Models for Generative Tasks

* personalized audio for applications such as augmented and virtual reality,
  game development, and video editing [4]
* common archit: codec structure that converts continuous audio into discrete
  tokens for language modeling, ensuring high fidelity [52]
* AudioGEN [92] is an pioneering audio language codec that uses
  data augmentation techniques, multi-stream modeling, and
  classifier-free guidance to improve adherence to text,
  * distinguishing multiple sound sources, handling real-world recording
    conditions, and encoding high-fidelity audio
* VALL-E [32], VALL-E X [84], and MusicLM [90] perform well in speech and
  music respectively
* SpeechX [112]
  combines neural codec language modeling with task-specific prompts to
  * unified and scalable modeling and provides
  * a consistent method for utilizing text input in speech enhancement and
    conversion tasks
* combining advanced generative models such as flow models and Diffusion
  * flow-based models like Flow-TTS [113] improve the overall fluency and
    naturalness of generated speech by using
    reversible transformations to balance local accuracy and global coherence
  * Diffsound [93] is an work based on diffusion models, using
    text as a condition for controlled audio generation by the diffusion model
  * SeedTTS [87] is a foundational speech generation model that
    excels in speech in-context learning and achieves
    good performance in speaker similarity and naturalness
* Audio source separation is a crucial task in audio enhancement applications
  * can be considered a type of audio generative task according to objectives in
    fine-tuning
  * LASS-Net [6] is the first end-to-end network for
    language-queried audio source separation (LASS),
    * capable of separating the target source from an audio mixture based on
      user’s natural language descriptions (e.g., “a woman speaking”)
  * AudioSep [95]
    * Transfer ALMs to source separation typically requires new design, Fig 7
    * text pretraining that achieves audio-text modality alignment during the
      ALM pretraining process as the query encoder for text and connects it to
      the prediction network for downstream tasks (audio separation network),
      and conduct post-training on specific task datasets. It
    * achieved audio segmentation for arbitrary descriptions but
    * extended to speech enhancement tasks, demonstrating the flexibility of
      combining natural language prompts with task paradigms
    * potential to integrate multiple audio enhancement tasks into a unified
      framework
  * Current research is unfolding in two main aspects:
    improving separation performance [97] and enhancing generalizability [96]
* Language generation aims to enable the model to perform audio-centric text
  prediction tasks, and
  fine-tuning can be conducted through language generative objectives
  * two sub-tasks, audio understanding and language generation, are accomplished
    by the audio encoder and the text decoder, respectively
  * multiple encoders or decoders [17]
  * Automated Audio Captioning (AAC) is an emerging audio perception task that
    * involves recognizing environments, sound events, and the temporal
      relationships between these events, and then describing them in fluent
      sentences. Currently,
    * the standard approach is an encoder-decoder deep learning framework, Fig 8
    * innovative network architectures and training schemes [16]
  * Audio Captioning Transformer (ACT) [102] is
    the first full Transformer architecture designed specifically for AAC,
    excelling in capturing global information and temporal relationships
  * EnCLAP [5] integrates
    * two powerful acoustic representation models, EnCodec and CLAP, with the
    + pre-trained language model BART to generate more accurate and contextually
      relevant captions
  * AutoCap [114]
    leverages extra guidance from metadata to enhance feature extraction,
    capturing nuanced acoustic information
  * LPMusicCaps [101] addresses data scarcity in music captioning by using LLMs
    to generate descriptions from large-scale tag datasets

## B. Multi-task Tuning and Cooperation

| Type         | Model                | Domain | Architectures / Pre-trained models    <td colspan=2>Input 
                                                                                              <td colspan=2>Output
|              |                      |        |                                                   | A | T | A | T |
|--------------|----------------------|--------|---------------------------------------------------|---|---|---|---|
| Codec        | UniAudio [116]       | Audio  | Tokenizers + Multi-scale Transformer              | 1 | 1 | 1 | 1 |
|--------------|----------------------|--------|---------------------------------------------------|---|---|---|---|
| Codec        | SpeechX [112]        | Speech | EnCodec + AR/NAR LM (VALL-E)                      | 1 | 1 | 1 |   |
| Codec        | VioLA [117]          | Speech | LSTM + AR LM                                      | 1 | 1 | 1 | 1 |
| Codec        | AudioPaLM [7]        | Speech | w2v-BERT / USM-v1 / USM-v2 + PaLM-2 + SoundStream | 1 | 1 | 1 | 1 |
| Codec        | LauraGPT [118]       | Speech | EnCodec + Qwen + Vocoder                          | 1 | 1 | 1 | 1 |
|--------------|----------------------|--------|---------------------------------------------------|---|---|---|---|
| LALM         | Pengi [1]            | Audio  | CLAP + GPT-2                                      | 1 | 1 |   | 1 |
| LALM         | LTU [24]             | Audio  | AST + LLaMA                                       | 1 | 1 |   | 1 |
| LALM         | SALMONN [119]        | Audio  | Q-Former + Whisper + BEATs + Vicuna               | 1 | 1 |   | 1 |
| LALM         | Qwen-audio [66]      | Audio  | Whisper + Qwen                                    | 1 | 1 |   | 1 |
| LALM         | Audio Flamingo [120] | Audio  | CLAP + OPT-IML-MAX                                | 1 | 1 |   | 1 |
| LALM         | GAMA [121]           | Audio  | AST + Q-Former + LLaMA-2                          | 1 | 1 |   | 1 |
|--------------|----------------------|--------|---------------------------------------------------|---|---|---|---|
| LALM         | SpeechGPT [8]        | Speech | HuBERT + LLaMA + HiFi-GAN                         | 1 | 1 | 1 | 1 |
| LALM         | SALM [122]           | Speech | Conformer + Megatron LLM                          | 1 | 1 |   | 1 |
| LALM         | BLSP [123]           | Speech | Whisper + LLaMA-2                                 | 1 | 1 | 1 | 1 |
| LALM         | SpeechT5 [124]       | Speech | wav2vec 2.0 + Transformer + vocoders              | 1 | 1 | 1 | 1 |
| LALM         | Voicebox [125]       | Speech | ALiBi + VB-En / VB-Multi                          | 1 | 1 |   |   |
| LALM         | SpeechVerse [115]    | Speech | WavLM / Best-RQ / Others + Flan-T5                | 1 | 1 |   | 1 |
| LALM         | COSMIC [126]         | Speech | Whisper-medium + Qformer + LLaMA-2                | 1 | 1 |   | 1 |
| LALM         | Moshi [127]          | Speech | Mimi + Helium                                     | 1 | 1 | 1 | 1 |
|--------------|----------------------|--------|---------------------------------------------------|---|---|---|---|
| LALM         | MusiLingo [128]      | Music  | MERT + Vicuna                                     | 1 | 1 |   | 1 |
| LALM         | Llark [129]          | Music  | Jukebox + LLaMA-2                                 | 1 | 1 | 1 | 1 |
|--------------|----------------------|--------|---------------------------------------------------|---|---|---|---|
| Agent System | AudioGPT [130]       | Audio  | GPT-3.5 + Audio Foundation Models                 | 1 | 1 | 1 | 1 |
| Agent System | SpeechAgents [131]   | Speech | SpeechGPT + LLaMA-2                               | 1 | 1 | 1 | 1 |
| Agent System | MusicAgents [132]    | Music  | LLMs + Music Tools                                | 1 | 1 | 1 | 1 |


* In the early stages of audio processing, research efforts were primarily
  focused on breaking down complex tasks into simpler, independent audio tasks
* [1, 115]: task-specific models lacked understanding capabilities and
  failed to capture the connections between tasks, resulting in
  poor scalability and limited robustness 
  when dealing with the inherent variability and complexity of audio signals
* the combination of LLM in ALM achieves
  understanding and reasoning across diverse audio tasks
  * convergence of large-scale language modeling with audio processing has
    ~> new possibilities to create more powerful, context-aware, and human-like
    audio understanding and reasoning systems

### Multi-task Tuning Models, Fig 9

* can be achieved by multi-task sequence-to-sequence modeling, instruction
  tuning or in-context learning

#### Multi-task sequence-to-sequence modeling is a classic approach

* Codecs
  * pipeline
    * Codecs convert continuous audio into discrete tokens
    * these tokens can easily be merged with text, MIDI, and other context tokens
    * then passed to a language model to generate an output sequence
    * further converted into the desired audio, text, or other outputs [14]
  * high fidelity and is widely used in generative tasks
  * more natural interaction between text and audio, enabling the use of a
    single model to perform ASR, TTS, S2TT, MT, and S2ST tasks, using
  * context or ID to indicate the task to which a sample belongs [117]
  * Depending on the LM type: autoregressive (AR) and non-autoregressive (NAR)
  * hE information loss due to the quantization of voice signals into discrete
    * significant performance degradation in some tasks compared to models that
      use continuous speech features [118]. Apart from codecs,
* Large Audio-Language Models (LALMs)
  leverage the emergent understanding and reasoning capabilities of LLMs
  to build more generalized audio-centric models
  * typically employ an audio pre-trained model as the encoder,
    set up encoders for other modalities as needed, and
    add adaptive modules before connecting an LLM on top
  * hE pre-trained LLMs still lack sufficient cross-task generalization
    * require further post-training [11]
  * Multi-task tuning for LALMs can be similar to codecs, adopting a unified
    sequence format, or achieved through instruction tuning or in-context
    learning
* VioLA [117] is a Transformer-based autoregressive decoder network
  * unifies cross-modal tasks involving speech and text
  * converts speech into discrete tokens and
    integrates task IDs and language IDs
    to enhance the ability to handle different languages and tasks
    * excellent performance in both single-modal and cross-modal tasks
* LauraGPT [118] operates based on a unified task expression (input embeddings,
  task ID, output tokens) to handle multiple tasks
  * modular and flexible design
  * perform complex tasks by combining sub-tasks such as S2ST
* AudioPaLM [7] is a model for speech understanding and generation. In
  * combined task learning,
    the model is instructed to output intermediate steps of complex tasks, which
    aligns with the spirit of chain-of-thought prompting. For example,
  * eg in Speech-to-Speech Translation (S2ST), the model can perform
    end-to-end conversion from English audio tokens to French audio tokens
    through a single autoregressive decoding process,
    guided by task tags like [ASR AST S2ST English French]
  * This enables the integration of ASR, MT, and TTS within a unified model,
    eliminating the need for a separated pipeline approach
* UniAudio [116] is an advanced codec-based ALM supports
  * 11 diverse audio generation tasks. It achieves this by
  * tokenizing both target audio and various condition modalities, then
    concatenating these source-target pairs into unified [conditions, target]
    sequences. The system leverages
  * LM for next-token prediction and incorporates a
  * multi-scale Transformer architecture to efficiently handle the extended
    sequence lengths introduced by neural codec-based tokenization
* Pengi [1] frames all audio tasks as text-generation tasks, allowing for
  comprehensive audio understanding and generation. Pengi demonstrates
  * remarkable capabilities across zero-shot tasks in general audio including
    environmental sound, speech, and music tasks, and achieves
    good performance in close-ended and open-ended audio tasks
* Qwen-audio [33] adopts a multitask training framework, which uses
  * hierarchical tags to condition the decoder, allowing for effective knowledge
    sharing while avoiding interference issues
  * handle diverse audio types and tasks, including automatic speech recognition
    (ASR), audio captioning, and audio question-answering
  * pre-trained across over 30 tasks in environmental sound, speech, and music,
  * SOTA results on 9 evaluation benchmarks without task-specific fine-tuning,
  * surpassing baselines on several tasks,
    eg automatic speech recognition and acoustic scene classification

#### Instruction tuning

* another method to provide multiple audio tasks
  with unified instance construction formats using natural language
* This allows a single model to handle multiple tasks
  without explicit fine-tuning on specific tasks but
  by enhancing its instruction-following capability [133]
  * [133] H. Liu, C. Li, Q. Wu, and Y. J. Lee
    Visual instruction tuning
    NeurIPS vol. 36, 2024
* SpeechGPT [8] incorporates discrete speech representations into a large
  language model framework, enabling intrinsic cross-modal conversational
  abilities. SpeechGPT is
  * datasets: SpeechInstruct, a pioneering large-scale cross-modal speech
    instruction dataset, and employs a sophisticated
  * three-stage training strategy: modality-adaptation pre-training, cross-modal
    instruction finetuning, and chain-of-modality instruction fine-tuning. This
  * perceive and generate multimodal content effectively, demonstrating
    impressive capabilities in following cross-modal human instructions and
* LLark [129] and MusiLingo [128] are instruction-tuned multimodal model designed
  specifically for music tasks,
  from classification and regression to more complex captioning and reasoning
  * impressive capabilities in zero-shot tasks
* SALMONN [119] conduct a
  * three-stage cross-modal training method of
    pre-training, instruction tuning and an additional activation tuning stage
    proposed to resolve the issue of over-fitting to the speech recognition and
    audio captioning tasks in instruction tuning
  * impressive capabilities across zeroshot and downstream tasks in
    environmental sound, speech, and music, and introduce
  * two novel tasks: audio-based storytelling and speech audio co-reasoning
* LTU [24] aims to leverage the comprehension abilities of LLM to enable an
  audio foundation model to listen, think, and understand. To train LTU, they
  * dataset: OpenAQA-5M consisting of closed-ended and open-ended diverse
    (audio, question, answer) tuples, using a
    * perception-to-understanding curriculum with an autoregressive training
      framework. LTU demonstrates
  * strong performance and generalization ability on
    * conventional audio tasks such as classification and captioning, as well as
    * emerging audio reasoning and compression abilities that are absent in
      existing audio models
* GAMA [121] integrates multiple types of audio representations using a custom
  Audio Q-Former and a multi-layer aggregator, capturing diverse aspects from
  semantic generalization to surface-level audio properties
  * datasets: CompA-R and CompA-R-test,
    a human-labeled dataset for open-ended audio QA requiring complex reasoning
  * Fine-tuned on CompA-R, GAMA demonstrates
    strong performance in complex reasoning and instruction-following tasks

#### In-context learning

* LLMs: quickly adapt to specific tasks using a few examples
  * predict unseen input labels without additional parameter updates. In the
* audio-language: learn and enhance vocabulary from the context of prompt texts
  without performing backpropagation [122]
  * unlocking the capabilities of frozen LLMs for a wide range of audio
    understanding and generation tasks [134]
* Voicebox [125] is a non-autoregressive flow-matching model trained to infill
  speech based on audio context and text, utilizing over 50,000 hours of
  unfiltered or enhanced speech data for training. Voicebox
  * can perform various tasks through in-context learning, such as
    * eg mono or cross-lingual zero-shot TTS, noise removal, content editing,
      style conversion, and diverse sample generation, achieving
    * high fidelity and efficiency in speech synthesis and editing
* SALM [122] equipped with multitask and in-context learning capabilities. SALM
  * comparable performance to task-specific models through instruction tuning
    for ASR and AST. Additionally,
  + a speech-supervised in-context training method is proposed to bridge the gap
    between LLM training and downstream speech tasks, further enhancing the
    in-context learning ability of speech-to-text models
* Audio Flamingo [120]: instruction tuning on interleaved audio-text pairs,
  thereby excelling in robust multi-turn dialogue capabilities. By
  incorporating in-context learning, it achieves
  quick adaptation to unseen tasks. The model attains
  * SOTA results on several close-ended and open-ended audio understanding tasks
    without the need for task-specific finetuning

### Audio-Language Agent Systems, Fig 10

* LLMs as agents to transform human instructions, achieving task transfer in
  downstream tasks by cooperating different foundational pre-trained models
  * leveraging the reasoning capabilities of LLMs
  * invoke and collaborate with a diverse array of audio models and tools
    to accomplish complex tasks initiated by humans
* SpeechAgents [131] is a multi-modal, multi-agent system designed to
  simulate human communication
  * The agents collaborate in a distributed and parallel manner to
    make decisions and execute corresponding actions,
    significantly enhancing work efficiency and effectiveness
  * Multi-Agent Tuning technique was proposed, allowing the system to handle
    complex, multi-party communications more effectively. Notably, the system
    * excellent scalability, performing well even with up to 25 agents. This
  * particularly suitable for tasks such as drama creation and audio novel
    generation
* MusicAgent [132] integrates and organizes various music processing tasks
  * a comprehensive toolset for collecting music-related tools from diverse
    sources, and
  * an autonomous workflow powered by LLMs that organizes these tools,
  * decomposes user requests into multiple sub-tasks automatically, and
    invokes the appropriate music tools to fulfill these requirements
  * capable of handling a wide range of music processing tasks and
    aims to bridge the gap between tools from different sources by unifying data
    formats (text, MIDI, ABC notation, audio), thereby enabling seamless
    collaboration among tools on different platforms
* AudioGPT [130] is an innovative multi-modal system that
  * integrates ChatGPT with audio foundation models and input/output interfaces
    to process complex audio information and conduct spoken conversations. Its
  * four key stages:
    modality transformation, task analysis, model assignment, response generat
  * proficiency in various audio-related tasks, including speech processing,
    music analysis and generation, and sound effect understanding and creation

# VI. Datasets and benchmarks

## A. Audio-Text Paired Datasets

| Datasets               | Domain      | Audio Source                                        | Pairs | Text Source       |
|------------------------|-------------|-----------------------------------------------------|------:|-------------------|
| AudioCaps [19]         | Audio       | AudioSet                                            | 57K   | Human             |
| Sound-VECaps [135]     | Audio       | AudioSet                                            | 1.6M  | Generated         |
| AudioGrounding [136]   | Audio       | AudioSet                                            | 5K    | Generated         |
| AudioSetCaps [137]     | Audio       | AudioSet, YouTube-8M, VGGSound                      | 6M    | Generated         |
| LAION-Audio-630K [22]  | Audio       | AudioSet, FreeSound, BBC Sound Effects, etc.        | 630K  | –                 |
| WavCaps [40]           | Audio       | AudioSet, FreeSound, BBC Sound Effects, SoundBible  | 400K  | Generated         |
| Auto-ACD [138]         | Audio       | AudioSet, VGGSound                                  | 1.5M  | Generated         |
| Clotho [20]            | Audio       | FreeSound                                           | 30K   | Human             |
| AudioDiffCaps [139]    | Audio       | FreeSound                                           | 29K   | Generated         |
| augmented FSD50K [140] | Audio       | FreeSound                                           | 51K   | Online            |
| WavText5k [141]        | Audio       | BigSoundBank, SoundBible                            | 5K    | Online            |
| SoundDescs [15]        | Audio       | BBC Sound Fffects                                   | 33K   | Online            |
| MACS [142]             | Audio       | TAU Urban Acoustic Scenes                           | 17K   | Human             |
| AudioCaption [10]      | Audio       | Internal Collected                                  | 29K   | Human             |
|------------------------|-------------|-----------------------------------------------------|-------|-------------------|
| EMOSpeech [143]        | Speech      | Internal Collected                                  | 31K   | Generated + Human |
| SpeechCraft [144]      | Speech      | AISHELL-3, Zhvoice, GigaSpeech-m, LibriTTS-R        | 2.1M  | Generated         |
|------------------------|-------------|-----------------------------------------------------|-------|-------------------|
| MusicCaps [90]         | Music       | AudioSet                                            | 5.5K  | Human             |
| AnimalSpeak [145]      | Bioacoustic | iNaturalist, Xeno-Canto, Animal Sound Archive, etc. | 1.1M  | Generated         |

* eg captions (description of audios), transcriptions (for speech datasets) or
  translations (transcriptions in another language of what the speaker says)
* natural language can describe multiple events in the audio more freely and in
  greater detail, audio-caption datasets providing more information
* transcriptions and translations are more often used for fine-tuning

## B. Audio Question Answering Datasets

| Datasets              | Audio Source                                     | Pairs  | Template | Generated | Human |
|-----------------------|--------------------------------------------------|--------|----------|-----------|-------|
| DAQA [146]            | AudioSet                                         | 600K   |    1     |           |   1   |
| AudioSetCaps-QA [137] | AudioSet, YouTube-8M, VGGSound                   | 18.4M  |    1     |           |       |
| SpeechInstruct [8]    | GigaSpeech, Common Voice, LibriSpeech            | 9M     |    1     |     1     |       |
| ClothoAQA [21]        | FreeSound                                        | 36K    |          |     1     |   1   |
| mClothoAQA [147]      | FreeSound                                        | 287K   |          |     1     |   1   |
| OpenAQA-5M [24]       | AudioSet, VGGSound, Freesound, Sound Bible, etc. | 5.6M   |          |     1     |   1   |
| CompA-R [26]          | AudioSet                                         | 200K   |          |     1     |   1   |
| Audio Dialogues [148] | AudioSet                                         | 163.8K |          |     1     |       |
| MusicQA [149]         | AudioSet, TagATune                               | 70K    |          |           |   1   |

Tab V: popular open-source QA datasets

* Initially, such datasets were specifically created for Audio Question
  Answering (AQA) tasks, constructing diverse questions to train models on how
  to answer similar queries
* In recent years, AQA tasks have been increasingly utilized as a proxy task for
  model learning perception and reasoning about audio [146]. They can serve as a
* they integrate multiple audio tasks [24] and
* can also be used to guide models in better following human instructions [8]

## C. Benchmarks (ie a dataset along with an evaluation strategy)

* three types: task-specific, cross-task, and audio instruction benchmarks
* Task-specific benchmarks like
  * eg SoundDescs [15], CompA [26], and ADU-Bench [150] evaluate models on
  * tasks such as ATR and audio dialogue
* Cross-task benchmarks
  * eg ARCH [151] and MMAU [152] test generalization
    across multiple domains and tasks
  * Other speech-related cross-task benchmarks:
    SUPERB [153], Dynamic-SUPERB [154], LeBenchmark [155], LAPE [156],
    VoiceBench [157]
  * music domain benchmarks like MusicBench [91] and MuChoMusic [158]
* Audio instruction benchmarks like AIR-Bench [159] and AudioBench [160]
  * a unified human-computer conversation format
  * various speech and audio tasks

# VII. Challenges and future research directions

* From a data perspective, there are three challenges and potential directions
  * Audio Sources:
    * The current audio-language datasets have limited sources [18]
    * AudioSet [161], FreeSound [162], and BBC Sound Effects [163]
    * using multiple audio-language datasets for model training
      * hE often limited due to the overlap of data sources
    * distribution shift issues [164], resulting in ALM lacking robustness
    * Compared with the data sources of LLM and VLM, the
      diversity of audio data is still limited [165]
    * future: methods for constructing online audio datasets
  * Text Sources:
    * Currently, audio-language datasets focus on generating audio captions from
      known labeled datasets or manual annotation, hindering the acquisition
    * create ALM-suitable datasets via model generation methods
    * generated text may contain inaccuracies like hallucinations [166]
    * future: dependable model generation methods is a crucial direction
    * vast but noisy audio-related text on the internet,
      eg audio introductions and comments, remains overlooked
  * Evaluation Benchmarks and Analysis: A
    * unified model evaluation framework is essential
    * ? empirical analysis across a wide range of audio types, tasks, and models
      remains scarce
    * limited availability of audio resources, as data used in evaluations
      should not overlap with the training set
    * future: benchmarks with broader coverage beyond mainstream audio sources,
      from other public or private domains
* model perspective
  * Compared to training methods, the model architecture is a more fundamental
  * four challenges and potential directions
  * Unified multimodal encoder:
    * Current ALMs mainly employ two separate networks for audio and language
    * vision community: unifying learning on the One Head architecture can
      enhance communication efficiency across data modalities,
      improve training efficiency, and alignment [31, 167]
      * [31] J. Jang, C. Kong, D. Jeon, S. Kim, and N. Kwak, “
        Unifying vision-language representation space with single-tower trafoer
        AAAI Conference on Artificial Intelligence, vol. 37, no.  1, 2023, pp
      * [167] M. Tschannen, B. Mustafa, and N. Houlsby
        Image-and-language understanding from pixels only
        arXiv preprint arXiv:2212.08045, vol.  3, 2022
    * hE few related studies in the field of audio-language [35]
  * Pre-trained Foundation Models
    * the choice of pre-trained audio and text encoders is crucial
      [22, 40, 141]
    * hE the primary audio encoders are still PANNs [43] or AST [48]
    * the open ALM community lacks a large, well-trained audio encoder
  * Continual Learning: Existing work highlights the use
    * streamable data accumulates
    + when old data is unavailable, pretraining from scratch is not permissible
    * continue learning on new datasets without affecting their performance on
      old tasks and zero-shot predictions
  * Efficient Learning:
    * Compared to the natural language and vision communities,
      * sources of audio are relatively limited, and
    * pre-training ALMs on large-scale training data requires intensive comput
    * future: data-efficient ALMs that can train effective models with limited
      audio-text data
      * eg learning not only from each audio-text pair but also utilizing more
        useful information from supervised learning between paired data [168]
      * [168] B. Wu, R. Cheng, P. Zhang, T. Gao, J. E. Gonzalez, and P. Vajda
        Data efficient language-supervised zero-shot recognition
          with optimal transport distillation
        ICLR 2022 International Conference on Learning Representations
    * active learning or curriculum learning methods
      to make more efficient use of limited data [169]
    * audio tasks and transfer learning methods are orthogonal ~>
      * combining ALMs with more transfer learning methods
      * better trade-off between parameter-efficient learning and performance

# VIII. Concluding the paper
