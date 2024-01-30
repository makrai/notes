Robust Speech Recognition via Large-Scale Weak Supervision
Alec Radford, Jong Wook Kim, Tao Xu, Greg Brockman, C Mcleavey, Ilya Sutskever 
40th International Conference on Machine Learning, PMLR 202:28492-28518, 2023

inference code and models at the following URL: https://github.com/openai/whisper

# Abstract

* speech processing systems 
  trained simply to predict large amounts of transcripts of audio 
  * 680,000 hours of multilingual and multitask supervision, the resulting
  * models generalize well to standard benchmarks and are 
  * often competitive with prior fully supervised results
    without the need for any dataset specific fine-tuning
* compared to humans, the models approach their accuracy and robustness
* We are releasing models and inference code to serve as a foundation for

# 1 Intro

* speech recognition: unsupervised pre-training techniques
  eg Wav2Vec 2.0 (Baevski+ 2020)
  * no need for human labels, they can productively use large datasets of
  * scaled up to 1,000,000 hours of training data (Zhang+ 2021),
  * far more than the ~ 1 K h typical of an academic supervised dataset.
  * fine-tuned on standard benchmarks, this approach has improved the SOTA,
    especially in a low-data setting.
* These pre-trained audio encoders learn high-quality representations of
  * hE they are purely unsupervised =>
  * lack an equivalently performant decoder mapping those reprs to usable
  * necessitating finetuning in order to perform a task eg speech recognition
    * wav2vec (Baevski+ 2021) is an exciting exception ~ having developed 
      * a fully unsupervised speech recognition system
  * risk with requiring fine-tuning.  Machine learning methods are exceedingly
    * some of these brittle patterns don’t generalize to other datasets and
    * eg Radford+ (2021) documented a 9.2% increase in object classif, ImageNet 
      * no improvement in average accuracy on seven other natural image datasets
    * A model that achieves “superhuman” performance when trained on a dataset
      can still make many basic errors when evaluated on another (Geirhos+ 2020)
  * needed
    * an equivalently high-quality pre-trained decoder, combined with a
      recommended protocol of dataset-specific finetuning, is a crucial
  * goal of a speech recognition system should be to work reliably “out of the
    box” in a broad range of environments without requiring supervised
    fine-tuning of a decoder for every deployment distribution.
* Narayanan+ (2018), Likhomanenko+ (2020), and Chan+ (2021) 
  * speech recognition systems that are pre-trained in a supervised fashion
    across many datasets/domains exhibit higher robustness and generalization
  * achieved by combining as many existing high-quality speech recognition
    datasets as possible. However, there is still only a moderate amount of
  * SpeechStew (Chan+ 2021) mixes together 7 pre-existing datasets totalling
    5,140 hours of supervision. While not insignificant, this is 
  * still tiny compared to the previously mentioned 1,000,000 hours of
    unlabeled speech data utilized in Zhang+ (2021).
* larger datasets for speech recognition
  * Chen+ (2021) and Galvez+ (2021) make use of 
  * relaxing the requirement of goldstandard human-validated transcripts, 
  * sophisticated automated pipelines to scale weakly supervised speech
    recognition to 10,000 and 30,000 hours of noisier training data. This
  * computer vision has demonstrated that moving beyond gold-standard
    crowdsourced datasets such as ImageNet (Russakovsky+ 2015) to much larger
    but weakly supervised datasets significantly improves the robustness and
    generalization of models (Mahajan+ 2018; Kolesnikov+ 2020).
* Yet only a few times larger than the sum of existing high-quality datasets
    and still much smaller than prior unsupervised work. In
  * we close that gap, scaling weakly supervised speech recognition
    to 680 K h of labeled audio data
* Whisper 
  * transfer well to existing datasets zeroshot,
    removing the need for any dataset-specific fine-tuning to achieve
  * multilingual and multitask weakly supervised pre-training in speech recog
    * Of those 680,000 hours of audio, 117,000 hours cover 96 other languages.
    * 125,000 hours of X→en translation data. We find
    * benefits to joint multilingual and multitask training
      * for sufficiently large models

# 2 Approach

the speech recognition pipeline since it removes the need for a separate
inverse text normalization step in order to produce naturalistic
transcriptions.

# 3. Experiments

# 4. Analysis and Ablations 10

## 4.1. Model Scaling

* zero-shot generalization of Whisper models as a function of the model size.
  * Figure 8
  * With the exception of English speech recognition, performance continues to
    increase with model size across multilingual speech recognition, speech
    translation, and language identification
  * diminishing returns for English speech recognition could be due to
    saturation effects from approaching humanlevel performance 
    as analysis in Section 3.9 suggests.

## 4.2. Dataset Scaling

* we trained a series of medium-sized models on subsampled versions of the
  dataset which are 0.5%, 1%, 2%, 4%, and 8% of the full dataset size and
  compared their performance with the same medium-sized model trained on the
  whole dataset
  * Early stopping based on the validation loss was used to select model
  * exponential moving average estimate of the parameters
    (Polyak & Juditsky, 1992) using a smoothing rate of 0.9999 to help reduce
    the effect of the learning rate not fully decaying to zero for the models
    trained on the subsampled datasets due to early stopping
  * tab 6: Performance on English and multilingual speech recognition and X→en
* All increases in the dataset size result in improved performance on all
  tasks, although we see 
  * significant variability in improvement rates across tasks and sizes.
  * English speech recognition 
    * rapidly from 3,000 to 13,000 hours and then 
    * slows down noticeably between 13,000 and 54,000 hours. Using the 
    * full dataset, which corresponds to another 12.5× increase in size results
      in only a further 1 point drop in WER
    * This mirrors the diminishing returns observed with model size scaling for
      English speech recognition and could similarly be explained by saturation
      effects when approaching human-level performance
  * multilingual speech recognition Improvements in WER follow a 
    * power-law trend for till 54,000 hours and 
    * only a further 7 points when increasing to the full dataset size.  For
  * X→en translation, 
    * performance is practically zero when training on <= 7,000 hours of audio
    * a roughly log-linear improvement trend till 54,000 hours before also
    * diminishing returns when further scaling to the full dataset size.
* The general trend across tasks of diminishing returns when moving from 54,000
  hours to our full dataset size of 680,000 hours could suggest that 
  the current best Whisper models are under-trained relative to dataset size
  * performance could be further improved by 
    a combination of longer training and larger models OR
  * we are nearing the end of performance improvements from dataset size

## 4.3. Multitask and Multilingual Transfer

* we compared the performance of models trained on just English speech recog
  with our standard multitask and multilingual training setup and 
  * measured their average performance across our suite of zero-shot English
    speech recognition benchmarks
  * We adjust for the amount of FLOPs spent training on the task of English
* Our results visualized in Figure 9 show that 
  * for small models trained with moderate amounts of compute, there is indeed
    negative transfer between tasks and languages: joint models underperform
    English-only models trained for the same amount of compute. However,
  * nL multitask and multilingual models scale better and 
    * for our largest experiments outperform their English-only counterparts
    * joint models also slightly outperform English-only models even when not
      adjusting for compute spent per task.

## 4.4. Text Normalization

* we developed our text normalization jointly with Whisper to discount
  innocuous word errors
  => there is a risk that our normalizer is overfitted to Whisper
  * rather than addressing general variation in transcription.
  * To check this, we compared the performance of Whisper
    using our normalizer versus an independently developed one from the
    FairSpeech project (Koenecke+ 2020)
* In Figure 10, we visualize the differences
  * On most datasets the two normalizers perform similarly, without significant
  * on some datasets, namely WSJ, CallHome, and Switchboard, our normalizer
    reduces the WER of Whisper models’ significantly more. The differences in
    * can be traced down to different formats used by the ground truth and
      how the two normalizers are penalizing them
    * eg in CallHome and Switchboard, our standardizer did not penalize
      differences in common English contractions such as “you’re” vs “you are”,
    * in WSJ, our normalizer standardized the written and spoken forms of
      numerical and monetary expressions
      eg “sixty-eight million dollars” versus “$68 million”.

## 4.5. Strategies for Reliable Long-form Transcription

* Transcribing long-form audio using Whisper relies on 
  accurate prediction of the timestamp tokens to 
  determine the amount to shift the model’s 30-second audio context window by,
  * inaccurate transcription in one window may negatively impact transcription
    in the subsequent windows
* a set of heuristics that help avoid failure cases of long-form transcription,
  * applied in the results reported in sections 3.8 and 3.9
  * beam search with 5 beams using the log probability as the score function,
    to reduce repetition looping which happens more frequently in greedy
    decoding
  * We start with temperature 0, ie always selecting the tokens with the
    highest probability, and 
    * increase the temperature by 0.2 up to 1.0 when either 
      the average log probability over the generated tokens is lower than −1 or
      the generated text has a gzip compression rate higher than 2.4.
  * Providing the transcribed text from the preceding window as previous-text
    conditioning when the applied temperature is below 0.5 further improves the
  * the probability of the <|nospeech|> token alone is not sufficient to
    distinguish a segment with no speech, but 
    combining the no-speech probability threshold of 0.6 and 
    the average log-probability threshold of −1 
    makes the voice activity detection of Whisper more reliable
  * to avoid a failure mode where the model ignores the first few words, 
    we constrained the initial timestamp token to be between 0.0 and 1.0 s
* Table 7: adding each of the interventions above
  incrementally reduces the WER overall, but not evenly across the dataset
* These heuristics are a workaround for the noisy predictions of the model, and
  * more research should improve the reliability of long-form decoding

# 5. Related Work

## Scaling Speech Recognition. A consistent theme in speech recognition

* scaling compute, models, and datasets
  * Early work applying deep learning to speech recognition (Mohamed+ 2009)
    * model depth and size and leveraged i
    * GPU acceleration to make training these larger models tractable . Further
  * dataset size, improving from being 
    * only competitive with prior GMM-HMM systems when using just 3 hours of
      TIMIT training data for phone recognition to achieving a 
    * 30% word error rate reduction when trained on the 2,000 hour Switchboard
      dataset (Seide+ 2011).
* Liao+ (2013) is an early example of leveraging weakly supervised learning to
  increase the size of a deep learning based speech recognition dataset by over
  1,000 hours.
* These trends continued with Deep Speech 2 (Amodei+ 2015) being a notable
  * high-throughput distributed training across 16 GPUs and scaling to 12 K h
  * continuing improvements at that scale
* semi-supervised pre-training, Narayanan+ (2018) were able to grow dataset
  * 162,000 hours of labeled audio. More recent work has explored
* billion-parameter models (Zhang+ 2020) and using 
* up to 1,000,000 hours of training data (Zhang+ 2021).

## Multitask Learning (Caruana, 1997) has been studied for a long time. 

* In speech recognition, multi-lingual models (Schultz & Kirchhoff, 2006)
* An inspirational and foundational work in NLP exploring multi-task learning
  with a single model is Collobert+ (2011).  Multitask learning
* in the sequence-to-sequence framework (Sutskever+ 2014) using multiple
  encoders and decoders was investigated in Luong+ (2015).  The use of
* language codes with a shared encoder/decoder architecture was first demon-
  strated for machine translation by Johnson+ (2017), removing the need for
  separate encoders and decoders
  * approach was simplified further into the “text-to-text” framework of
    McCann+ (2018) and 
  * popularized by its success with large transformer language models in the
    * Radford+ (2019) and Raffel+ (2020).
* Toshniwal+ (2018) demonstrated jointly training a modern deep learning speech
  recognition system on several languages with a single model, and 
* Pratap+ (2020a) scaled this line of work significantly to 50 languages with a
  billion-parameter model
* MUTE (Wang+ 2020c) and mSLAM (Bapna+ 2022)
  * joint training over both text and speech language tasks, transfer OK

## Robustness to distribution shift and other types of perturbations 

* has long been studied and is actively being researched across many fields of

* Torralba & Efros (2011) highlighted the lack of generalization of machine
* even in slightly different settings 
  (Lake+ 2017; Jia & Liang, 2017; Alcorn+ 2019; Barbu+ 2019; Recht+ 2019). More
* Taori+ (2020) studied the robustness of image classification models, and
* Miller+ (2020) investigated this for question-answering models. A key finding
  * multi-domain training increases robustness and generalization as discussed
  * replicated in NLP (Hendrycks+ 2020) and computer vision (Radford+ 2021).

# 6. Limitations and Future Work

## Improved decoding strategies

* larger models have made steady and reliable progress on reducing
  perception-related errors such as confusing similar-sounding words
* Many remaining errors, particularly in long-form transcription seem
  * decidedly non-human/perceptual.
* They are a combination of failure modes of seq2seq models, language models,
  and text-audio alignment and 
* include problems such as getting stuck in repeat loops, 
  * not transcribing the first or last few words of an audio segment, or
    complete hallucination where the model will output a transcript entirely
    unrelated to the actual audio
* the decoding details discussed in Section 4.5 help significantly, we suspect
  fine-tuning Whisper models on a high-quality supervised dataset and/or using
  reinforcement learning to more directly optimize for decoding performance
  could help further reduce these errors.

## Increase Training Data For Lower-Resource Languages

* performance on a language is very well predicted by the amount of data
* our pre-training dataset is currently very English-heavy due to biases of our
  data collection pipeline, which sourced primarily from English-centric parts
  of the internet, 
  * most languages have less than 1000 hours of training data
* A targeted effort at increasing the amount of data for these rarer languages
  could result in a large improvement to average speech recognition performance
  even with only a small increase in our overall training dataset size.

## Studying fine-tuning 

* we only studied the zero-shot transfer performance of Whisper. While this is
  * representative of general reliability
* for many domains where high-quality supervised speech data does exist, it is
  likely that results can be improved further by fine-tuning.
* allows for direct comparisons with prior work since it is a much more common

## Studying the impact of Language Models on Robustness

* we suspect that Whisper’s robustness is partially due to its strong decoder,
  which is an audio conditional language model
* unclear to what degree the benefits of Whisper stem from training its
  encoder, decoder, or both
* could be studied by either 
  * ablating various design components of Whisper
    * eg training a decoder-less CTC model
  * studying how the performance of eg wav2vec 2.0 changes when used with a LM

## Adding Auxiliary Training Objectives 

* Whisper departs noticeably from most recent SOTA speech recognition systems
  due to the lack of unsupervised pre-training or self-teaching methods. While
* it is possible that the results could be further improved 
