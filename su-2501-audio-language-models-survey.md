Audio-Language Models for Audio-Centric Tasks: A survey
Yi Su, Jisheng Bai, Qisheng Xu, Kele Xu, Yong Dou
Cite as: 	arXiv:2501.15177 [cs.SD]

# Abstract

* Audio-Language Models (ALMs) are trained on audio-text data, focus on the
  * processing, understanding, and reasoning of sounds.
  * Unlike traditional supervised learning approaches
  * utilize natural language as a supervision signal, which is
    more suitable for describing complex real-world audio recordings. ALMs
  * strong zero-shot capabilities and
    * can be flexibly adapted to diverse downstream tasks.
  * from the Conclu:
  * Models combined with LLMs exhibit listening, thinking, and reasoning
    + significant success in following audio instructions.
  * enhance the accuracy and generalization of audio processing tasks but also
  * These strengths promote the development of models that more closely resemble
    human auditory perception and comprehension. Recent advances in ALMs have
* this surveys: focus on general audio tasks, aiming to fill this gap by
  providing a structured and holistic overview of ALMs. Specifically, we cover:
  * the background of computer audition and audio-language models;
  * the foundational aspects of ALMs, including prevalent network
    architectures, training objectives, and evaluation methods;
  * foundational pre-training and audio-language pre-training approaches;
  * task-specific fine-tuning,
    multi-task tuning and
    agent systems for downstream applications;
  * datasets and benchmarks; and
  * current challenges and future directions. Our review provides a clear
  * a wide range of tasks in various
    audio types such as natural sounds, speech, and music, providing a clear
  * we analyze the current challenges in this field and humbly propose directs

# 1 Intro

* Enabling machines to hear like humans and process audiocentric tasks [1]
* Audio-Language Models (ALMs)
* applicable to
  * basic audio tasks, such as audio classification [2], but also show great
  * audio-text retrieval [3], audio generation [4],
    automatic audio captioning [5], audio source separation [6],
    automatic speech translation [7], and audio chatbots [8].
* In contrast to learning based on labeled data for specific audio tasks,
  ALM can learn from more descriptive textual information, expanding the scope
  * including human-annotated captions and readily available titles and
    descriptions from web sources [9]
  * Natural language is well-suited for characterizing real-world audio, which
    * eg multiple overlapping sound events:
      ALMs can learn the intrinsic relationships [10]
  * avoids the model’s reliance on task-specific predefined labels, enhancing
    ~> potential for models to generalize effectively to open-world scenarios.
* integration with LLMs as guiding components within ALMs.
  * LLMs exhibit remarkable comprehension capabilities, researchers have
  * hE LLMs still face challenges in generalizing across a broad spectrum of
    downstream tasks [11], necessitating additional transfer steps such as
    post-training and collaboration with other foundational models. Within this
* language provides a unified mechanism for constructing instances,
  enabling LLMs to undergo instruction tuning and incontext learning across
  diverse tasks. This approach bridges the gap between auditory information and
  language understanding, facilitating the alignment of multiple components
  within ALMs.
  + language serves as a versatile human-machine interface, empowering users to
    instruct LLM agents to collaborate effectively with audio-language systems.
* Existing relevant reviews include
  * speech-language models [12, 13]
  * codec-based models [14]
  * ALMs for specific tasks such as audio-text retrieval [15]
  * automated audio captioning [16]
  * speech-to-text translation [17]
  * audio-language datasets [18].
* we: the first comprehen survey on ALMs, from the perspective of model training
  * perspective centered on general audio-centric tasks that encompasses
  * a diverse range of audio types to provide a more detailed reflection of the
* Fig. 1: A timeline of recent advances in audio-language models. Is is
  * datasets serve as the foundation for inspiring research
    in pre-training and downstream models.  With the advancement of model
  * CLAP [2] is considered a significant milestone. Previous work includes
* audio-caption datasets [19]–[21], which were initially used for automatic
  audio caption model training and also served as data foundations for ALMs,
  inspiring subsequent work. Since the introduction of
* pre-training and large-scale datasets [22], the advantages of ALMs have
  gradually gained attention.
* Recently: intertwined development between pre-training and downstream models.
  * evaluation standards and proposed various benchmarks. It shows a high
  * datasets, pre-training, downstream models, and benchmark research in ALMs.
  * driven by commercial applications,
    research interests have shifted more towards the speech domain.
* general audio modeling [23].
  * types including human voices, natural sounds, music rhythms, etc., which
In the subsequent sections of this paper, we first

## II. Background of audio-language pre-training and transfer

## A. Pre-training and Transfer Paradigm

* two challenges within the pre-training and transfer paradigm 
  * models may overfit by exploiting simple label mappings [24], achieving high
  * the high cost of manual annotation [25]
* To address these challenges, ALMs have been proposed to learn audio concepts
  through natural language supervision [2].  This form of supervision 
  * provides more details about the audio, enabling models to understand the
    meanings and make decisions accordingly like a human. For example, natural
    language can describe the temporal order of multiple events using words such
    as ‘simultaneous,’ ‘before,’ and ‘after’ [26], better reflecting the complex
    composition of audio compared to predefined labels and helping models learn
    their intrinsic relationships [10]. Additionally, audio-text data is 
  * easier to obtain than well-defined labeled datasets, effectively expanding
    * eg ‘dog’ or ‘barking’ to label a dog barking, but inconsistencies among
    * difficult to create a perfectly accurate audio dataset. While ALMs are
    * human-annotated captions and translations, titles and descriptions related
      to audio found abundantly on the web can also serve as sources of annot

## B. Audio-Language Training Stages

* As data and model sizes grow, 
  the training strategies for ALMs become more intricate. 
* def: pre-training vs transfer
  * representation learning /pre-training:
    stages aimed at enhancing task-independent audio reprs
  * transfer: fine-tuning and cooperating
    before the model is applied to downstream tasks
* pre-training can be further divided into multiple stages, typically including
  * pre-training of foundational models, followed by 
  * audio-language pre-training on paired data. Some may also involve 
  * potentially further training on a broader range of data and tasks.
* zero-shot or transfer
  * ALMs have achieved strong zero-shot capabilities in audio retrieval,
    hE transfer remains an important stage for applying models to downstream
* Task-specific finetuning is one of the most widely used methods. It involves
  * supervised fine-tuning of pre-trained models on downstream task datasets and
  * potentially with adaptive modules. Another category of methods includes
  * transferring simultaneously on multiple tasks to make the model more
    universal or gain from multi-task knowledge sharing. Unlike task-specific
  * instruction tuning and in-context learning aim to enhance (or unlock) the
    LLM’s ability to follow human instructions. Essentially, it 
    * fine-tunes ALMs with a set of formatted instances in natural language form
      [27], thus helping the model generalize to various downstream tasks.
  * agent system: Multi-task transfer by cooperating multiple models 

## C. Research Landscape (Fig 2)

* training dimension, ALMs are divided into pre-training and transfer. 
* ALMs integrate pre-trained audio and language models, then undergo further
  pre-training on extensive audio-text data.
  Transfer is crucial for combining these models with other networks and
  applying them to various downstream tasks. 
* Data is an essential element for model training and evaluation. Different
  types of datasets can be utilized at various stages of training, and
  benchmarks provide unified and comprehensive standards for model evaluation,
  playing an important role in optimizing the models. Therefore, research on
  ALMs can be developed in three fields: 
  * pretraining for representation
  learning, 
  * downstream transfer, and 
  * datasets and benchmarks.
* Fig. 2: Research landscape for audio-language models
  * audio-language representation requires pre-training (Sec.  IV), 
  * transfer to downstream application
    through task-specific fine-tuning or instruction tuning (Sec. V), 
  * data (Sec. VI) is the foundation for model training, and they can be divided
    * labeled audio datasets, 
    * audio-text paired datasets, and 
    * audio question answering datasets

# III. Foundations: architecture, training objectives, and evaluation methods

A. ALM Architectures
B. Training Objectives

### Contrastive Objectives
### Generative Objectives
### Discriminative Objectives

C. Evaluation Methods

# IV. Representation pre-training

A. Audio Pre-training
B. Language Pre-training
C. Audio-Language Pre-training

### Contrastive Pre-trained Models
### Generative Pre-trained Models
### Discriminative Pre-trained Models

# V. Downstream transfer

A. Task-specific Fine-tuning

### Models for Discriminative Tasks
### Models for Generative Tasks

B. Multi-task Tuning and Cooperation

### Multi-task Tuning Models
### Audio-Language Agent Systems

# VI. Datasets and benchmarks

A. Audio-Text Paired Datasets
B. Audio Question Answering Datasets
C. Benchmarks

# VII. Challenges and future research directions

# VIII. Concluding the paper
