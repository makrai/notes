Sarcasm in Sight and Sound:
  Benchmarking and Expansion to Improve Multimodal Sarcasm Detection
Swapnil Bhosale, Abhra Chaudhuri, Alex Lee Robert Williams, Divyank Tiwari,
  Anjan Dutta, Xiatian Zhu, Pushpak Bhattacharyya, Diptesh Kanojia
arXiv:2310.01430 [cs.CL]

code, extended data, and SOTA benchmark models are made public

* MUStARD++, have identified sarcasm to be a multi-modal phenomenon -- expressed
  * natural language text + manners of speech (like tonality and intonation) and
    visual cues (facial expression). With this work, we aim to perform
* we: a rigorous benchmarking of the MUStARD++ dataset by considering SOTA
  language, speech, and visual encoders, for fully utilizing the totality of the
* 2 % improvement in macro-F1 over the existing benchmark
* imbalance in the `sarcasm type' category in MUStARD++,
* we propose an extension, which we call  _MUStARD++ Balanced_, benchmarking the
  same with instances from the extension split across both train and test sets,
  achieving
* a further 2.4 % macro-F1 boost. The
* new clips taken from a novel source -- the TV show, House MD, which
  adds to the diversity of the dataset, and were
  manually annotated by multiple annotators with substantial inter-annotator
  agreement in terms of Cohen's kappa and Krippendorf's alpha

# 1 Intro

* many NLP tasks under the sentiment umbrella through multimodality [3–6]
* MUStARD [1], a multi-modal sarcasm detection dataset, was introduced; and it
  * information from all three associated modalities, ie, text, speech, and
    video. Additionally,
  * MUStARD++ [Ray+ 2] recognized underlying emotions to be a crucial
    * an extension of MUStARD with emotion annotations, and an expansion on the
      number of instances. The associated benchmarking performed in
    * the above works encode the individual modalities through independent text,
      speech, and vision modules, and combining their respective representations
      via a fusion layer [7]. We identify
* two limitations in the existing multi-modal sarcasm detection benchmarking
  * only classical encoding approaches of the individual modalities. For
    instance, MUStARD++, which is one of the most recent benchmarks in the
    literature, used Mel Frequency Cepstral Coefficients (MFCC), Mel spectrogram
    (using the Librosa library [8]), prosodic features from OpenSMILE [9] for
    speech, and ResNet-152 [10] for videos, which cannot fully leverage the
    complementarity in the multi-modal information available in the datasets
  * the ‘sarcasm type’ category in MUStARD++ exhibits an imbalance. Through this
* we aim to bridge these gaps by rigorous benchmarking based on SOTA vision,
  speech, and language encoders. We also aim to expand the MUStARD++ dataset by
  adding new instances that alleviate this imbalance to a certain degree
* large-scale self-supervised pre-training can often generalize much better than
  even supervised pre-training. The introduction of
  * CLIP [11] enabled this for multi-modal vision-language tasks as well
* we propose to perform a benchmarking for multi-modal sarcasm detection that
    is more in tune with the current SOTA in multi-modal learning
  * ViFi-CLIP [12], a SOTA CLIP-based model for encoding videos in a
    common video-text representation space. We use
  * Wav2vec 2.0, a transformer-based self-supervised speech representation
    * masked learning objective for audio. With our proposed benchmarking, we
  * we achieve > 2% gain in macro-F1 over the existing benchmark
* we cure the ‘sarcasm type’ category imbalance in MUStARD++, we propose an
  extension, we call, MUStARD++ Balanced. The
  * publicly available clips in our extension are taken from the TV show, House
    MD, which, apart from curing the imbalance, also adds diversity to the
  * annotated by three independent annotators who show a substantial
    inter-annotator agreement in terms of Cohen’s kappa and Krippendorf’s alpha
  * We split the clips in our extension across both train and test sets, and
  * further benchmarking using our proposed setup. Our experiments revealed a
  * further 2.4% boost to macro-F1 from using our extension, and show that this
* additional expers quantify the distribution shift introed by our extension
* contributions:
  * rigorous benchmarking for multi-modal sarcasm detection on the MUStARD++
    * using SOTA vision, speech, and language models;
  * MUStARD++ Balanced: an extension to the MUStARD++ dataset, that we call ,
    * to cure the ‘sarcasm type’ imbalance in the former, and for data
      diversity; and
  * extensive experiments that show the
    significant gains in macro-F1 obtained by using our proposed benchmarking
    strategy, as well as from using our novel, balanced extension

# Related Work

## 2.1 Sarcasm Detection

* linguistic perspective to sarcasm detection
  * [15] used a pattern-based approach for the task, while emphasizing the role
    of four sets of features obtained based on different sarcasm types. This
    * 83.1% accuracy and 91.1% precision on the task of sarcasm detection. Since
  * [16] and [17] used a Naive Bayes and Decision Tree model, respectively, in
    * the best F1 scores over 70 on their chosen datasets
* SemEval 2018 Shared Task 3
  * [18], [19] offered an RCNN-RoBERTa methodology, where a
    * RoBERTa transformer was used with BiLSTM to enhance task performance
    * F1-score of 90.0 on the Riloff dataset [20]
* Several recent methods for sarcasm detection using text are discussed by [21]
  * A BERT [22] model without concatenated layers,
    BERT encodings with a Logistic Regression model, and other language models
  * IAN [23] that are trained and assessed on a Twitter-based sarcastic dataset
  * F1-score of 73.4 in those evaluations, the BERT language model, without any
    additional layers, performs the best. Some existing literature investigates
  * in Arabic [24], where an extensive set of experiments are performed on
    different transformer architectures, that include mBERT, XLM-RoBERTa [25]
    and language-specific models like MARBERT [26]. In this low-resource setting
    * F1-score of 58.4, which shows the need to investigate sarcasm in a
    * A weighted average Ensemble of a CNN, LSTM, and Gated Recurrent Unit (GRU)
      based architectures is trained with GloVe [27] word embeddings to identify
      sarcasm, as demonstrated in [28]
    * outperformed comparative studies by up to 8% on SARC [29], Reddit

# 2.2 Multi-modal Learning

* Hazarika+ [35]: a Conversational Memory Network (CMN) to leverage contextual
* multimodal neural architectures [36, 37] and
* multimodal fusion approaches [38, 39] have propelled the deployment of
* more efficient multimodal fusion approaches [40–42]
* datasets and approaches in detail [43]
* The MUStARD dataset [44] provides clips compiled from popular TV shows,
  * MUStARD++ [Ray+ 45] extend upon this dataset by adding emotion labels and
    additional clips while also benchmarking for the multimodal sarcasm
  * Ray+ utilise feature fusion [7] and a feed-forward network to predict the
  * F1-score of 70.2% points using audio, text and video modalities

# 3 Dataset details

* benchmarks on the MUStARD dataset [46, 1, 2] do not consider the latest
  developments in multi-modal vision-language fusion [11, 12] and speech
  processing [47]. 
  * Chauhan+ [48] annotated MUStARD with 9 emotion labels, which was 
  * refined and extended by Ray+ [2] in MUStARD++ by adding valence and arousal
    information, which are important indicators for recognizing the emotion
    * as well as adding further data points. Table 1 summarizes the statistics
