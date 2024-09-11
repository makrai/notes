Open-Source Conversational AI with SpeechBrain 1.0
M Ravanelli, T Parcollet, A Moumen, S de Langen, C Subakan, P Plantinga,
  Y Wang, P Mousavi, L Della Libera, A Ploujnikov, F Paissan, D Borra, S Zaiem,
  Z Zhao, S Zhang, G Karakasidis, S Yeh, P Champion, A Rouhe, R Braun, F Mai,
  J Zuluaga-Gomez, S Mahed Mousavi, A Nautsch, X Liu, S Sagar, J Duret,
  S Mdhaffar, G Laperriere, M Rouvier, R De Mori, Y Esteve
Submitted to JMLR (Machine Learning Open Source Software) arXiv:2407.00463 [cs.LG]

* SpeechBrain is an open-source Conversational AI toolkit based on PyTorch,
  focused particularly on speech processing tasks such as
  speech recognition, speech enhancement, speaker recognition, text-to-speech,
* transparency and replicability by releasing both the pre-trained models and
  the complete "recipes" of code and algorithms required for training them
* This paper presents SpeechBrain 1.0, a significant milestone in the evolution
  * > 200 recipes for speech, audio, and language processing tasks, and more
  * > 100 models available on Hugging Face. SpeechBrain 1.0 introduces
  * new technologies to support diverse learning modalities, LLM integration,
    and advanced decoding strategies, along with novel models, tasks, and
    modalities. It also includes
* a new benchmark repository, offering researchers a unified platform for
  evaluating models across diverse tasks

# 1 Intro

* other open-source toolkits, like NeMo and ESPnet,
  also support multiple Conversational AI tasks, each excelling in diff applic
  * NeMo is industry-focused, offering ready-to-use solutions, 
    may be less flexibile for extensive customization compared to SpeechBrain,
  * ESPnet also supports various tasks with competitive performance, but
  * nL SpeechBrain stands out for its comprehensive documentation,
    beginner-friendly tutorials, simplicity, and
    lightweight design with fewer dependencies

# 3 Recent Developments

* Table 1: a complete list of Task and Techniques as of June 2024

## Learning Modalities

* continual learning, methods like Rehearsal, Architecture, and
  Regularization-based approaches (Della Libera+ 2023)
* interpretability, both post-hoc and design-based methods,
  * Post-hoc Interpretation via Quantization (Paissan+ 2023),
  * Listen to Interpret (Parekh+ 2022),
  * Activation Map Thresholding (AMT) for Focal Networks (Della Libera+ 2024),
  * Listenable Maps for Audio Classifiers (Paissan+ 2024)
* audio generation using standard and latent diffusion techniques, along with
  * DiffWave (Kong+ 2020) as a novel vocoder based on diffusion
* fine-tuning: faster inference using speech self-supervised models
  (Zaiem+ 2023a)
* wav2vec2 SSL pretraining from scratch as described by Baevski+ (2020)
  * efficient training of a 1-billion-parameter SSL model for French
    on 14,000 hours of speech using over 100 A100 GPUs,
  * showcasing the scalability of SpeechBrain (Parcollet+ 2024)

## Models and Tasks: We developed several new models and expanded support for

* speech recognition: new alternatives to the Transformer architecture like
  HyperConformer (Mai+ 2023) and Branchformer (Peng+ 2022), along with a
  Streamable Conformer Transducer
* models for discrete audio tokens
  (eg discrete wav2vec, HuBERT, WavLM, EnCodec, DAC, and Speech Tokenizer),
  * the basis for modern multimodal LLMs (Mousavi+ 2024a)
* Speech Emotion Diarization (Wang+ 2023)
* speech augmentation techniques refactored
  (Ravanelli and Omologo, 2014, 2015)
* EEG, a new modality. SpeechBrain 1.0 now supports electroencephalographic
  * The similarity between EEG and speech allows us to reuse many techniques
    originally developed for speech processing, enabling
  * tasks like motor imagery, P300, and SSVP classification with popular
  * models
    * eg EEGNet (Lawhern+ 2018),
      * EEGNet: A Compact CNN for EEG-based Brain-Computer Interfaces
    * ShallowConvNet (Schirrmeister+ 2017), and
      RT Schirrmeister, JT Springenberg, LD J Fiederer, M Glasstetter,
        K Eggensperger, M Tangermann, F Hutter, W Burgard, and T Ball
      Deep learning with CNNs for EEG decoding and visualization
      Human Brain Mapping, 38(11):5391–5420, Aug. 2017
    * EEGConformer (Song+ 2023)
      Y. Song, Q. Zheng, B. Liu, and X. Gao
      EEG conformer: Convolutional transformer for EEG decoding and visualizat
      IEEE Transactions on Neural Systems and Rehabilit Engin 31:710–719, 2023

## Decoding Strategies: We improved beam search algorithms

* for tasks like speech recognition and translation
* code simplified with separate scoring and search functions
* allows easy integration of various scorers, including n-gram language models
  and custom heuristics
* CTC training, RNN-T latency controlled beamsearch (Jain+ 2019), batch and GPU
  decoding (Kim+ 2017), and N-best hypothesis output with neural language model
  rescoring (Salazar+ 2019)
* interface to
  * Kaldi2 (k2) for search based on Finite State Transducers (FST) (Kang+ 2023)
  * KenLM for fast language model rescoring (Heafield, 2011)

## Integration with LLMs: LLMs are crucial in modern Conversational AI

* interfaces with popular models like GPT-2 (Radford+ 2019) and Llama 2/3
  (Touvron+ 2023) enhanced , enabling
  * easy fine-tuning for tasks eg dialogue modeling and response generation
    (Mousavi+ 2024c)
* LTU-AS, a speech LLM designed to jointly understand audio and speech
  (Gong+ 2023)
* LLMs can be used to rescore n-best hypotheses provided by speech recognizers
  (Salazar+ 2019)

## Benchmarks: a new benchmark repository

* for facilitating community standardization across various areas of interest
* Currently, we host four benchmarks:
  * CL-MASR for multilingual ASR continual learning (Della Libera+ 2023),
  * MP3S for speech self-supervised models with customizable probing heads
    (Zaiem+ 2023b),
  * DASB for discrete audio token assessment (Mousavi+ 2024b), and
  * SpeechBrain-MOABB for fair evaluation of deep learning models on EEG
* goal: common framework, baselines, and evaluation protocols for these tasks
