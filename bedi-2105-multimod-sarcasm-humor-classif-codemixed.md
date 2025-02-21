Multi-Modal Sarcasm Detection and Humor Classification in Code-Mixed Conversat
Manjot Bedi; Shivani Kumar; Md Shad Akhtar; Tanmoy Chakraborty
IEEE Transactions on Affective Computing (Volume: 14, Issue: 2, Apr-Jun 2023)

# Abstract

* Sarcasm detection and humor classification <~ contextual and non-verbal info
  * languages such as Hindi: lack of qualitative annotated datasets
* we make two major contributions
  * a Hindi-English code-mixed dataset, MaSaC for
    multi-modal sarcasm and humor detection in conversational dialog
    * utterances adopted from a popular Indian television comedy show
    * We cleaned, and annotated more than 15000 utterances across 1190 dialogues
  * MSH-COMICS, an attention-rich neural archit for binary utterance classif
    * utterance representation utilizing a hierarchical attention mechanism
      * attends to a small portion of the input sentence at a time
    * dialog-level contextual attention mechanism
      to leverage the dialog history for the multi-modal classification
* experiments
  * extensive experiments for both tasks by
    * varying multi-modal inputs and various submodules of MSH-COMICS
  * superior performance over the existing models by
    * > 1 F1-score point for the sarcasm detection and
    * 10 F1-score points in humor classification
* We diagnose our model and perform thorough analysis of the results
* future: multi-lingual embeddings for the efficient code-mixed reprs

# 1 Introduction

* previous attempts [10, 11, 12] on sarcasm classification involved
  multi-modal information in a conversation to leverage the context and
  extract the incongruity between the surface and expressed semantics
  * [13, 14] employed images and visual frames along with the text
    to detect humor
  * Surveys on multi-modal analysis [15, 16, 17, 18, 19, 20] reveal
    two prime objectives while handling multi-modal contents:
    * to leverage the distinct and diverse information offered by each modality
    * to reduce the effect of noise among the multi-modal information sources
* India is a multi-lingual country, and
  a vast population are comfortable with more than one language
  * regular usage of words from multiple languages to form a single sentence
    in both writing and speaking
  * eg ‘Sachin ne 21 years pehle apna debut match khela tha.’
       ‘Sachin played his debut match twenty one years ago.’)
    * three English words (ie ‘years’, ‘debut’, and ‘match’),
    * one named-entity
    * the rest of the words are part of romanized Hindi language
  * common to switch languages for the consecutive sentences as well
  * These two variants are termed as the code-mixed and code-switched resp
  * pre-BERT pipeline
    1. language identification of each word. Dictionary-based lookup
      * hE a token (in transliterated form) is a valid word in >1 language
        eg ‘main’ means ‘important’ in English, and ‘I’ in Hindi
    2. literature suggests language-specific processing for the downstream tasks
* handling multilingual inputs in a deep neural network architecture
  * multilingual/cross-lingual word representation techniques [21, 22]
* Most of the existing datasets for the multi-modal sarcasm and humor detection
  involve only monolingual data (primarily English)
* we: MaSaC, a new multimodal contextual sarcasm and humor classif dataset
  in English-Hindi code-mix environment
  * ∼1,200 multi-party dialogs extracted from a popular Indian television show
    ‘Sarabhai vs. Sarabhai’
  * ∼15,000 utterance exchanges (primarily in Hindi) among the speakers
  * We manually analyze all the utterances and mark the presence/absence of
    sarcasm and humor for each of them (cf Section V for detailed description)
* MSH-COMICS, a multi-modal hierarchical attention framework for the
  utterance classification in conversational dialogs
  1. encode the textual utterance representation
    using a hierarchy of localized attention over the tokens in a sentence
  2. learn the modality-specific dialog sequence using LSTM [23] layers
  * to leverage the contextual information, we employ three attention mechs
    that learn the importance of preceding utterances with respect to each of
    the textual, acoustic, and textual+acoustic modalities
  * a simple gating mechanism aims to filter the noise
    in accordance with the interactions among the modalities
  * Finally, we utilize the filtered representations
    for the sarcasm and humor classification
* significant performance for both the sarcasm and humor classification tasks
  * We also evaluate MaSaC on the existing multi-modal contextual sentence
    classification systems
  * MSH-COMICS yields superior performance compared to the baselines
    for both the tasks
* contributions
  * MaSaC, a qualitative multi-modal dataset
    for sarcasm detection and humor classification
  * novel architecture for the multi-modal contextual sentence classification
  * strong baselines for the two tasks on the proposed dataset
  * detailed analysis of the experimental results and the reported errors

# 2 Problem Definition

# 3 Related Work

## Sarcasm Detection has gained significant attention in the last few years

* [24, 25, 26, 27, 28, 29]
* Earlier work: lexical aspects of the text expressing sarcasm [24]
  * the influence of adjectives, adverbs, interjections, and punctuation marks
    * their presence have positive correlation (though small) with sarcasm
  * Tsur+ [26] proposed a semi-supervised approach for sarcasm discovery in
    Amazon product reviews: punctuation and pattern-based features
    * kNN classifier
  * A similar study on tweet was proposed in [25]
  * sentiment shift or contextual incongruity is an important factor [27]
  * Son+ [30] proposed a hybrid Bi-LSTM and CNN based neural architecture
* context
  * for the implicit case, more often than not,
    the context is of utmost importance [31, 32, 33]
  * Joshi+ [31] exploited the historical tweets of a user to predict sarcasm in
    their tweet. They investigated the sentiment incongruity in the current
    and historical tweets, and proposed it to be a strong clue for sarcasm
  * Ghosh+ [34] employed an attention-based recurrent model to identify sarcasm
    in the presence of a context
    * two separate LSTMs-with-attention for the sentence and the context, and
  * context was also leveraged by [32]
    * a CNN-BiLSTM based hybrid model to exploit the contextual clues
    * they investigated the psychological dimensions of the user in sarcasm
      using 11 emotional states (eg, upbeat, worried, angry, depressed, etc.)
* Hindi or other Indian languages [35, 36]
  * Bharti+ [36] developed a sarcasm dataset of 2,000 Hindi tweets. For the
    * baseline evaluation, they employed a rule-based approach that
      classifies a tweet as sarcastic if it contains more positive words than
      the negative words, and vice-versa
  * Swami+ [35] collected and annotated > 5,000 Hindi-English code-mixed tweets.
    * n-gram and various Twitter-specific features to learn SVM and Rand Forest
    * no context, unimodal
* multi-modal analysis [10, 11]
  * Cai+ [10] proposed a hierarchical fusion model to identify the presence of
    sarcasm in an image in the pretext of its caption
  * exploited the incongruity in the semantics of the two modalities 
* in the conversational dialog system
  * it is crucial for a dialog agent to be aware of the sarcastic utterances
  * Castro+ [11] developed a multi-speaker conversational dataset for sarcasm
    * For each sarcastic utterance in the dialog, the authors identified
      a few previous utterances as the context for sarcasm (English)
* we: instead of defining the explicit context,
  we let the model learn the appropriate context during training

## Humor Detection

* contextual information plays an important role in detection [14, 13]
  * hE it is complex to process the contextual information
  => many of the earlier studies aim to identify humorous contents in
  standalone text without consulting the context [37, 38, 39, 40]
* inputs are one-liners or punchlines which
  usually have rich comic or rhetoric content to attract someone’s attention
  * extremely difficult (even for humans) to interpret the humorous content
* crucial non-verbal signals such as animated voice, impersonation,
  funny facial expression, difference in acoustic features
  * validated by Amruta+ [41]
  * exploited [13, 14, 42]
* Hasan+ [13] extended humor classification in punchlines by considering
  both the contextual and multi-modal information
  * Transformer’s [43] encoder architecture to model the contextual information
  in addition to the memory fusion network [44] for combining the multi-modal
  signals
* text and acoustic features for contextual humor classification
  (Bertero and Fung [14])
* Dario+ [42] treated the humor classification task as sequence labelling
  * conditional random field
* in Indian languages, the study on humor classification is limited
  * Khandelwal+ [45] is one of the first studies that involve
    humor classification in Hindi-English code-mixed language
    * a dataset of ∼3,500 tweets with ~ equal number of +/- humorous tweets. The
    * SVM classifier using bag-of-word features
  * Sane+ [46] improved the SOTA on the same dataset using neural models
  * the dataset of Kandelwal+ [45] lacks both the context and multi-modality
  * MaSaC has significantly more instances, and 
    * annotations for two tasks, ie sarcasm and humor detection

# 4 Methodology 4

# 5 Dataset Preparation 5

# 6 Experimental results and analysis 6

## D. Comparative Analysis

* comparative analysis by evaluating the existing systems on MaSaC. In
* baseline models
  * SVM [58]: We incorporate an SVM classifier on standalone utterances (without
    any context) as the baseline system.  Depending on the textual
    representation, we evaluate two variants:
    * a) on the average of the constituent word embeddings (T avg ), and
    * b) on the embedding computed using the hierarchical attention module
      `H-ATN^U`. For the acoustic signal, we utilize the raw feature
      representation as mentioned in Section V-C
  * MUStARD [11]: It is
    an SVM-based system that takes an
    * input: utterance and its contextual utterances for the classification
    * eval context: previous five utterances as the context and learn the
    * publicly available implementation 8 provided by Castro+ [11]
  * Ghosh+ [32]: The underlying
    * architecture of Ghosh+ [32] also incorporates the contextual information
    * deep neural network architecture that models the contextual and target
      utterances using two separate CNN-BiLSTM layers
    * the learned representations are combined in DNN for the classification 9 
    * eval context: the previous five utterances
    * implementation of the model was adopted from [32] 10 
  * DialogRNN [59]: The DialogRNN (DRNN) [59] is one of the
    * a recent classification model capable of handling conversational dialog
    * originally proposed for the emotion recognition in conversation (ERC)
    * the closest approach to our modeling of the two tasks, i.e., classifying
      each utterance in the conversational dialog
    * encodes speaker-specific utterances independent of other speakers, and
      subsequently, incorporates each speaker-specific sequence to maintain the
      dialog sequence. We utilize the
    * implementation 11 of DRNN [59] for the evaluation
* Table VI reports the results of above comparative systems. For each
  * both unimodal 12 textual and bi-modal textual+acoustic information. In
  * text:
    * SVM on T avg reports mediocre F1-scores of 22.5% and 35.6% for the
      sarcasm and humor classification, respectively. In contrast,
    * the same SVM classifier improves the performance of two tasks (11% and 6%,
      respectively) by utilizing the embeddings of hierarchical attention module
    * the contextual models (MUStARD [11] and Ghosh+ [32]) yield decent F1-scores
      * 45.1% and 50.0% in sarcasm detection. Similarly,
      * 59.8% and 57.6% F1-scores for the humor classification
      * DialogRNN obtains the best comparative F1-scores of 67.0% and 71.4%,
      * our proposed system reports ∼3% and ∼4.5% improvement over the best
  * similar trends with the bi-modal textual+acoustic inputs for both tasks
    * SVM-based system records the least F1-scores of 24.5% and 37.9%, while
    * DialogRNN [59] reports the best performance with 70.8% and 72.0% F1-scores
    * the proposed system over the comparative system with >1 and 10 points

## E. Error Analysis 10

# 7 Conclusion
