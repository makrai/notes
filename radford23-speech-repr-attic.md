Whisper: Robust Speech Recognition via Large-Scale Weak Supervision
Alec Radford, Jong Wook Kim, Tao Xu, Greg Brockman, Ch Mcleavey, Ilya Sutskever
International Conference on Machine Learning, PMLR 202:28492-28518, 2023

inference code and models at the following URL: https://github.com/openai/whisper

# Abstract

* speech processing systems
  trained simply to predict large amounts of transcripts of audio
  * 680,000 hours of multilingual and multitask supervision
  * models generalize well to standard benchmarks and are
  * often competitive with prior fully supervised results
    without the need for any dataset specific fine-tuning
  * approach human accuracy and robustness
* We are releasing models and inference code to serve as a foundation

# 1. Introduction

* unsupervised pre-training techniques eg Wav2Vec 2.0 (Baevski+ 2020)
  * learn directly from raw audio without the 
  * no need for human labels, they can productively use large datasets
  * scaled up to 1,000,000 hours of training data (Zhang+ 2021)
  * >> the ~ 1 K h typical of an academic supervised dataset
  * fine-tuned on standard benchmarks, this approach has improved the SOTA,
    especially in a low-data setting
* finetuning need
  * they lack a decoder mapping those representations to usable outputs
    * wav2vec (Baevski+ 2021) is an exciting exception ~ having developed
    * a fully unsupervised speech recognition system
  * overfitting to patterns within a training dataset which boost performance
    on held-out data from the same dataset. However
    * some of these patterns are brittle and spurious and don’t generalize to
      other datasets and distributions
    * eg Radford+ (2021) documented a 9.2% increase in object classification
      accuracy when fine-tuning a computer vision model on the ImageNet dataset
      (Russakovsky+, 2015) without observing any improvement in average
      accuracy when classifying the same objects on seven other natural image
      datasets. A model that achieves “superhuman” performance when trained
    * humans are oblivious to those dataset-specific quirks (Geirhos+, 2020)
* crucial weakness
  * an equivalently high-quality pre-trained decoder combined with 
  * a recommended protocol of dataset-specific finetuning, is a
* speech recognition systems that are pre-trained in a supervised fashion
  across many datasets/domains exhibit higher cross-dataset generalization
  (Narayanan+ (2018), Likhomanenko+ (2020), and Chan+ (2021))
  * achieves by combining as many existing high-quality speech recognition
    datasets as possible. However, there is still only a moderate amount of
    this data easily available
  * SpeechStew (Chan+ 2021) mixes together 7 pre-existing datasets (5,140 h)
    * still tiny compared to the previously mentioned 1,000,000 hours of
      unlabeled speech data utilized in Zhang+ (2021)
* larger datasets for speech recognition
  * By relaxing the requirement of gold-standard human-validated transcripts
  * Chen+ (2021) and Galvez+ (2021) make use of
    sophisticated automated pipelines to scale weakly supervised speech
    recognition to 10,000 and 30,000 hours of noisier training data. This
    trade-off between quality and quantity is often the right call
  * computer vision: moving
    beyond gold-standard crowdsourced datasets eg ImageNet (Russakovsky+ 2015)
    to much larger but weakly supervised datasets
    significantly improves the robustness and generalization of models
    (Mahajan+ 2018; Kolesnikov+ 2020)
  * these new datasets are only a few times larger than the sum of existing
    high-quality datasets and still much smaller than prior unsupervised work
* Whisper: we close that gap,
  scaling weakly supervised speech recognition the next order of magnitude to
  680,000 hours of labeled audio data.  We call our approach Whisper. We
  * Whisper transfers well to existing datasets zero-shot, removing the need
    for any dataset-specific fine-tuning to achieve high-quality results
