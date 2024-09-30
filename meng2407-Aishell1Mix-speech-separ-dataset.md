Empowering Whisper as a Joint Multi-Talker and Target-Talker Speech Recognition System
Lingwei Meng, Jiawen Kang, Yuejiao Wang, Zengrui Jin, Xixin Wu, Xunying Liu, Helen Meng
INTERSPEECH 2024 arXiv:2407.09817 [cs.SD]

* Multi-talker speech recognition and target-talker speech recognition,
* both involve transcription in multi-talker contexts, remain significant
* existing methods rarely attempt to simultaneously address both tasks. In this
* we empower Whisper for joint multi-talker and target-talker speech recognit
  * Whisper is a speech foundation model
  * we freeze Whisper and plug a Sidecar separator into its encoder to separate
    mixed embedding for multiple talkers;
  * a Target Talker Identifier is introduced to identify the embedding flow of
    the target talker on the fly,
    requiring only three-second enrollment speech as a cue;
  * soft prompt tuning for decoder is explored for better task adaptation. Our
* outperforms previous methods on twoand three-talker LibriMix and
  LibriSpeechMix datasets for both tasks, and delivers
  * acceptable zero-shot performance on multi-talker ASR on AishellMix Mandarin

# 3. Experimental Setup

## 3.1. Datasets

* The experiments are conducted on three multi-talker public datasets, namely
* LibriMix [34] and LibriSpeechMix [13] in English, and Aishell1Mix in zh
* Audio exceeding Whisper’s maximum handling duration of 30 seconds are time-
  stretched to conform to this limit.
* For target-talker ASR on LibriMix and LibriSpeechMix, we randomly trim
  three-second clips from LibriSpeech as enrollment speech for each talker.

### LibriMix. The dataset simulates audio mixtures in a left-aligned manner,

* two or three speakers from the LibriSpeech-clean corpus. Thus,
* the shorter source speech is entirely overlapped with the longer one from the
* We focus on its two-speaker-mixed and three-speaker-mixed clean subset,
  denoted as Libri2Mix and Libri3Mix in the following.

### LibriSpeechMix. The utterances are simulated from LibriSpeech, comprising

* mixtures from two or three speakers.
* Unlike LibriMix, the delay time for each speaker is randomly sampled,
  ~> partially overlapped mixtures.
* only the dev and test sets are released, we created our training set 2
  https://github.com/huangzj421/Aishell1Mix from the 960-hour LibriSpeech
  following the same protocol as in [13], except that the mixtures are kept
  under 30 seconds.

### Aishell1Mix. It is a Mandarin multi-talker speech dataset,

* source from Aishell1 corpus
* It simulates mixtures with a same protocol of the LibriMix
* We focus on its two-speaker-clean subset for analysis, denoted as AishellMix
