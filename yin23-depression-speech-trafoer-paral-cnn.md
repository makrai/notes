Depression Detection in Speech Using Transformer and Parallel CNNs
Faming Yin, Jing Du, Xinzhou Xu and Li Zhao
Electronics 2023, 12(2), 328; https://doi.org/10.3390/electronics12020328

# Abstract

* audio-based depression detection
* most of the existing works focus on stacking deep networks
* we propose a deep learning model based on a parallel CNN and a transformer
  * parallel-CNN module used to focus on local knowledge
  * a transformer module as the other parallel stream to perceive temporal seq
    using linear attention mechanisms with kernel functions
* experiments on two datasets of
  Distress Analysis Interview Corpus-Wizard of OZ (DAIC-WOZ) and
  Multi-modal Open Dataset for Mental-disorder Analysis (MODMA)
* better performance compared with the SOTA strategies

# 1. Introduction

* depression affects a huge number of people in the world [1,2]
  * psychological pain and pessimism, or even self-abuse and suicide [3,4]
  * difficult to diagnose empirically, since it mainly depends on the patient’s
    self-assessment [5] and other evaluation questionnaires [6,7], which
    * may largely be affected by subjective factors
  * objective standard of diagnosis is needed [8]
* automatic depression detection provides feasible methods for this scenario,
  * video-based [9–11], text-based [12,13], audiobased [5,14],
    EEG-based [15,16], and multi-modal fusion [17–22] strategies
  * latent depression factors hidden in speech [23,24]
  * deep models employ stacking CNNs or RNN [25–27]
  * hE
    * single-stream networks are insufficient [28,29]
    * large time complexity and memory footprint [30]
* speech emotion recognition (SER) show the effectiveness in latent represent
  * multi-category features in speech [31–33]
    * Zhao Y, Liang Z, Du J, Zhang L, Liu C, Zhao L
      Multi-Head Attention-Based LSTM for Depression Detection From Speech.
      Front. Neurorobotics 2021, 15, 684037. [CrossRef] [PubMed]
    * Xu X, Deng J, Zhang Z, Fan X, Zhao L, Devillers L, Schuller BW
      Rethinking auditory affective descriptors
        through zero-shot emotion recognition in speech
      IEEE Trans. Comput.  Soc. Syst. 2022, 9, 1530–1541.  [CrossRef]
    * Xu X, Deng J, Cummins N, Zhang Z, Zhao L, Schuller BW
      Exploring zero-shot emotion recognition in speech
        using semantic-embedding prototypes
      IEEE Trans. Multimed. 2022, 24, 2752–2765.  [CrossRef]
  * including parallel structures for depression detection
    through learning from multiple representations [34]
* we propose a convolutional neural network based on a parallel structure and
  transformer model
  * multi-source fusion
  * three streams
    * input: low-level mel-frequency cepstral coefficient (MFCC) features with a
      fixed length as the input to the network
    * a parallel CNN structure for the purpose of perceiving local knowledge
    * an improved transformer with a linear attention mechanism as a third
      * in order to capture temporal sequential information in speech
      * linear attention mechanism utilizes the kernel function in constructing
        the inner product instead of the original scaled dot-product attention,
        in order to reduce the complexity of the attention mechanisms
* compared with existing related works on depression detection in speech, the
  * CNN streams to learn local knowledge while setting a
  * transformer stream for acquiring global sequential information
* contributions
  * a transformer-CNN-CNN (TCC) model for depression detection in speech, with
    two modules of a parallel CNN and transformer
    * linear attention mechanisms instead of the original attention in
      multi-head attention mechanisms to reduce time complexity
    * a fusion layer was then added to merge the outputs from the CNNs and
      transformer to obtain sufficient local and global information for fusion

# 2 Related works for the proposed approach

# 3 Model consisting of a parallel CNN and a transformer based on a parallel
structure, including the improvement scheme of the attention mechanisms

# 4 Databases, experimental setups, and analysis of the experimental results 7

## 4.1. Experimental Setups

* We employed the datasets of
  * Distress Analysis Interview Corpus-Wizard of Oz (DAICWOZ) [78] and
  * Multi-modal Open Dataset for Mental-disorder Analysis (MODMA) [43,79] in
  * one-time training-test splitting was included in the experiments
    in accordance with existing related research [31,80,81]
* The DAIC-WOZ dataset was composed of
  * interview recordings for the clinical diagnosis of psychological stress,
  * Ellie, an animated virtual interviewer, with a sampling rate of 16 kHz
  * 42 randomly selected patients with depression and 47 healthy speakers
  * we eliminated the abnormal short and long speech segments
    * ie less than 3 s and more than 12 s
  * leading to a total of 4401 samples (2156 depression and 2245 normal)
  * 1000 samples were randomly selected as the test set, whereas
    the rest of the samples formed the training part,
    considering the balance of data distribution between the two classes
    as in [31]
* The MODMA dataset 
  * ref
    * Dubagunta SP, Vlasenko B, Doss MM
      Learning voice source related information for depression detection
      ICASSP 2019; pp. 6525–6529
    * Cai H, Gao Y, Sun S, Li N, Tian F, Xiao H, Li J, Yang Z, Li X, Zhao Q,+
      MODMA dataset: A Multi-modal Open Dataset for Mental-disorder Analysis
      arXiv 2020, arXiv:2002.09283
  * 52 subjects, including 23 subjects (7 females; 16–55 years) with depression
    and 29 healthy-control subjects (9 females; 18–55 years)
  * interviewing, reading, and picture description
  * average duration for the segments exceeded 10 s
  * 1321 samples were obtained through eliminating the abnormal samples
  * randomly selected 350 samples as the test set
    * despite [instead of?] the partially speaker-dependent cases in splitting
      the sets, we employed the random splitting, since the unsupervised side
      information (eg, speaker, text, duration, and noise) provides relatively
      low impact on the supervised depression-related information
* Within the experiment, we employed the
  * Hanning window, with a window length of 25 ms in speech framing, and a
    window shift of 10 ms
  * The speech segments with a length of 9 s were intercepted by the Python
    library of Librosa to extract the MFCC features [82]
  * The network employed a batch size of 32 using the
    adaptive moment estimation (Adam) optimizer, with the
    initial learning rate equal to 0.0005

# 5 Conclusion 11
