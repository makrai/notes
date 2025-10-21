Sequential Modeling by Leveraging Non-Uniform Distribution of Speech Emotion
Wei-Cheng Lin; Carlos Busso
February 2023 IEEE/ACM Transactions on Audio Speech Lang Porocess Vol: 31

# Abstract

* The expression and perception of human emotions are not uniformly distributed
  over time ~>
  * tracking local changes of emotion within a segment can lead to better SER,
    even in sentence-level prediction of the emotional content. A challenge
  * most existing emotional corpora only provide sentence-level annotations
* our framework splits a sentence into a fixed number of chunks, generating
  chunk-level emotional patterns. The approach relies on
  * emotion rankers to unveil the emotional pattern within a sentence, creating
    continuous emotional curves.
  * Our approach
    1. uses the pretrained emotion rankers to generate the emotional curves
    2. it uses the chunk-based curves as labels to train the seq-to-seq SER
* sequence-to-sequence formulation
  by leveraging the retrieved emotional curves
  * we achieve the best concordance correlation coefficient (CCC) prediction
    performance for arousal (0.7120), valence (0.3125), and dominance (0.6324)
    on the MSP-Podcast corpus
  * experiments on the IEMOCAP and MSP-IMPROV databases: validated
  * We compare the retrieved curves with time-continuous emotional traces
  * the chunk-label curves display a time-consistency property that is
    similar to time-continuous traces annotated by human listeners

# I.  Introduction

# II.  Related Work

## A. Nonuniform Externalization: expression and perception of emotions.

* Lee+ [25] explored phoneme-level patterns in the expression of emotion.
  Their analysis demonstrated that vowels such as /aa/ have larger variability
  across emotions than vowels such as /iy/, which are more constrained by the
  articulatory movements (ie, placement of the tongue in the palette).
* Busso+ [7] demonstrated that nasal phonemes have more restricted emotional
  modulation than other phonemes given the rigid configuration of the nasal
  cavity. The modulation of emotions is also dictated by the
* strong relationship between facial expressions and acoustic features [26].
  Busso and Narayanan [6] found that the externalization of emotions in prosody
  and facial expression is emphasized when the vocal tract is physically
  constrained by speech articulation, showing a multimodal compensatory effect.
* suprasegmental acoustic features.
  * Wang+ [8] discovered a common pattern of raising the fundamental frequency
    at the end of a sentence for happy sentences.
  * Cowie+ [5] stated that emotions can change either gradually or sharply over
    time. They designed the FEELTRACE toolkit to continuously annotate the

* frameworks to leverage the nonuniform externalization of emotions for SER
  * Lee+ [25] used phoneme-class dependent HMM classifiers trained with
    Mel-frequency cepstral coefficients (MFCCs) features. Their results showed
    * better discrim compared to the generic utterance-level HMM classifier.
  * Lotfian and Busso [27] used synthetic speech as a reference for emotionally
    neutral speech to contrast localized emotional differences in the
    sentences. Another direction is to
* directly identify emotionally salient regions (ie, hotspots) within a
    sentence [18].
  * Parthasarathy and Busso [17], [28] proposed a deep learning framework to
    recognize these emotional hotspots in speech.
    * They first defined hotspot regions using the concept of qualitative
      agreement (QA) [29], searching for emotional trends.
    * Then, an ensemble of bidirectional long short-term memory (BLSTM)
      regressors was trained and combined to detect the emotional hotspots. The
    * high recognition performance (F1-score = 60.9%) demonstrated a promising
      application to continuously track emotions during human interaction.

## B. Sequence-to-One and Sequence-to-Sequence SER Tasks, Tab I

* The most common formulation for SER is a sequence-to-one formulation
  * A popular approach consists of extracting low-level descriptors (LLDs).
  * LLDs are frame-level acoustic features such as the fundamental frequency,
    energy, and Mel-frequency cepstral coefficients (MFCCs). Then,
  * a high dimensional sentence-level feature representation is created by
    extracting high-level descriptors (HLDs) or functionals (eg mean or
    variance of the fundamental frequency) [35], [36], [37]. A
  * recently: deep networks directly extract feature representations
    from either raw features (ie, raw waveform or spectrogram) or LLDs
    * can jointly optimize the feature extraction and target discriminative
      task.
    * a powerful feature representation space and provides SOTA performance.
  * deep learning architectures have been applied for SER that have their own
    * convolutional neural networks (CNNs) can capture local variations between
      acoustic patterns [31], and
    * recurrent neural network (RNN), often implemented with LSTM, are
      effective for dealing with temporal dynamic information [32]. Some
    * hybrid architectures such as CNN-RNN can handle both spatial and temporal
      information in the features [30], [38].
  * these methods assume that the emotional content within a sentence can be
    represented with a single descriptor, which consistently reflects the
* sequence-to-sequence task. Most of these studies use
  * time-continuous annotations of emotional attributes [39].
  * Le+ [33]: a multi-task BLSTM model to recognize time-continuous sequences,
    * seqs discretized with the k-mean algorithm at different resolutions.
    * emotional n-gram language model for decoding the final predicted sequence.
    * The sequential decoding procedure smooths the sequence, leading to
      further improvement in CCC
  * Huang+ [34]: an end-to-end convolutional LSTM (ConvLSTM) network
    to handle spatiotemporal information for continuous emotion recognition.
    * outperformed a 3D convolutional model, showing its effectiveness
  * Some studies have aimed to learn a hidden sequence of emotions that aligns
    with the input acoustic frames using only sentence-level labels
    * CTC model [14], [15] is the most conventionally used method to achieve
      * neural network architecture using recurrent units (eg LSTM) to produce
        sequential predictions for the desired categorical labels, which
        correspond to a sequence of probability distributions over time (ie,
        softmax outputs). Then, the model optimizes the 
      * CTC loss [40] to choose the most probable label sequence over all
        possible paths based on the probability distributions (ie, maximizing
        the posterior probability)
    * assumtion: the CTC sequence consists of a series of transitional
      binary states between the
      sentence-level emotion state (Emo) and a non-emotional state (Null). This
    * generally outperforms sequence-to-one modeling approaches [13], [14].
    * binary dichotomization and discrete state assumptio 
      not appropriate formulation for modeling the VAD continuous emo attribs
* Han et al. [41] proposed a framework built on a similar concept as our work.
  * It leverages segment-level information to construct a sentence-level emotion
  recognizer. The approach
  * first extracts the segment-level features by stacking neighbor frames
    together to train a DNN model.
  * Then, they used the trained DNN model to compute the emotional state
    probability distribution for every small segment in each sentence, forming
    a continuous segmentlevel probability curve for each emotion category.
  * Finally, the sentence-level classification model was built with statistic
    descriptions of these probability curves.
  * Unlike this method, our approach is formulated for regression tasks,
    exploiting rankers to directly retrieve continuous emotional curves as the
    training target sequences.

## C. Preference Learning in SER Tasks

* preference learning, which exploits the ordinal nature of emotions [42].
  Conventional SER systems predict absolute emotional labels, which are
  commonly collected with perceptual evaluations from multiple annotators.
* poor annotator agreement in the consensus labels,
  * differences in emotional perception across annotators [43] and the
  * ambiguity in emotions [44] lead to
  * learning trends in the labels [45], [46], [47], [48].
    [45] Y.-H. Yang and H. H. Chen, “Ranking-based emotion recognition for
    music organization and retrieval,” IEEE Trans. Audio, Speech, Lang.
    Process., vol. 19, no. 4, pp. 762–774, May 2011.
    [46] H. P. Martinez, G. N. Yannakakis, and J. Hallam, “Don’t classify rat-
    ings of affect; rank them!,” IEEE Trans. Affect. Comput., vol. 5, no. 3,
    pp. 314–326, Jul.–Sep. 2014.
    [47] S. Parthasarathy, R. Cowie, and C. Busso, “Using agreement on di-
    rection of change to build rank-based emotion classifiers,” IEEE/ACM Trans.
    Audio, Speech, Lang. Process., vol. 24, no. 11, pp. 2108–2121, Nov. 2016.
    [48] H. Cao, R. Verma, and A. Nenkova, “Speaker-sensitive emotion recog-
    nition via ranking: Studies on acted and spontaneous speech,” Comput.
    Speech Lang., vol. 29, no. 1, pp. 186–202, Jan. 2015.
* Preference learning solutions have been presented for emotional
  * categories [48], [49] (eg is one sentence happier than another?) and
  * attributes [22], [46], [50], [51] (eg is one sentence more active?)
* relative labels relying on trends can be more robust than absolute labels,
  rank-based SER systems are often more effective.
* We demonstrate in this paper that this formulation is ideal for retrieving
  relative emotional differences within a sentence. This study
  * we adopt the preference learning method proposed by Parthasarathy and Busso
    [22], which is based on the QA method [29], to train rankers to build our
    chunk-level continuous emotion sequences.

# III.  Proposed Methodology

# IV.  Experimental Setting

# V.  Experimental Results 7

* Table iv: comparison with SOTA results using traditional acoustic features as
input for training the SER model. The table lists other approaches that have
reported ccc performance on the MSP-Podcast corpus (v1.6)

|         | V   | A   | D   |
|---------|-----|-----|-----|
|Sridhar  |.32  |.73  |.66  |

* Table v comparison with SOTA results using pretrained deep features as input
  for training the SER model. The table lists other approaches that have
  reported CCC performance on the MSP-podcast corpus (v1.6)

|                       | V   | A   | D   |
|-----------------------|-----|-----|-----|
|Mitra [64] Wav2vec 2.0 |.46  |.73  |.65  |

# VI. Conclusion

* limitation: computational complexity required to train the models since the
  * emotional rankers required in addition to the emotional regression model.
    * the rankers are not needed during inference, however, this problem is only
  * errors introduced by the retrieved curve may impair emo learning
* future
  * modify our current two-stage framework into an end-to-end formulation
    by treating local emotions as a hidden variable output of the jointly
    trained rankers. Another research direction is to
  * explore the nonuniform externalization of emotion using chunk-based curves.
    * Analyzing emotional salient regions: how we express and perceive emotions.
