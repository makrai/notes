Multi-Modal Sarcasm Detection and Humor Classification in Code-Mixed Conversat
Manjot Bedi; Shivani Kumar; Md Shad Akhtar; Tanmoy Chakraborty
IEEE Transactions on Affective Computing (Volume: 14, Issue: 2, Apr-Jun 2023)

# Abstract

* Sarcasm detection and humor classification <~ contextual and non-verbal info
  * languages such as Hindi: lack of qualitative annotated datasets
* we make two major contributions considering the above limitations
  * a Hindi-English code-mixed dataset, MaSaC for
    multi-modal sarcasm and humor detection in conversat dialog
    * utterances adopted from a popular Indian television comedy show
    * We , cleaned, and annotated more than 15000 utterances across 1190 dials
  * MSH-COMICS, an attention-rich neural archit for the [bina] utterance classif
    * utterance representation utilizing a hierarchical attention mechanism
      that attends to a small portion of the input sentence at a time
    * dialog-level contextual attention mechanism
      to leverage the dialog history for the multi-modal classification
* experiments
  * extensive experiments for both tasks by
    varying multi-modal inputs and various submodules of MSH-COMICS
  * superior performance over the existing models by
    * > 1 F1-score point for the sarcasm detection and
    * 10 F1-score points in humor classification
* We diagnose our model and perform thorough analysis of the results to
  understand the superiority and pitfalls
* future: multi-lingual embeddings for the efficient code-mixed reprs

# 1 Introduction

* previous attempts [10, 11, 12] on sarcasm classification involved multi-modal
  information in a conversation to leverage the context and extract the
  incongruity between the surface and expressed semantics
  * [13, 14] employed images and visual frames along with the text to detect
    humor
  * Surveys on multi-modal analysis [15, 16, 17, 18, 19, 20] reveal
    two prime objectives while handling multi-modal contents:
    * to leverage the distinct and diverse information offered by each modality
    * to reduce the effect of noise among the multi-modal information sources
* India is a multi-lingual country, and
  a vast population are comfortable with more than one language. Their comfort
  * regular usage of words from multiple languages to form a single sentence
    in both writing and speaking
  * eg ‘Sachin ne 21 years pehle apna debut match khela tha.’
    ‘Sachin played his debut match twenty one years ago.’) has
    * three English words (ie ‘years’, ‘debut’, and ‘match’),
    * one named-entity
    * the rest of the words are part of romanized Hindiy language
  * common to switch languages for the consecutive sentences as well
  * These two variants are termed as the code-mixed and code-switched resp
  * pre-BERT pipeline
    1. language identification of each word. Dictionary-based lookup is a
      * hE a token (in transliterated form) is a valid word in more than one
        language. For example, the word ‘main’ has the meaning ‘important’ in
        English, while it also means ‘I’ in Hindi. Once the language is
    2. literature suggests language-specific processing for the downstrea tasks
* handling multilingual inputs in a deep neural network architecture has paved
  * multilingual/cross-lingual word representation techniques [21, 22]
* Most of the existing datasets for the multi-modal sarcasm and humor detection
  involve only monolingual data (primarily English). To explore the challenges
* we: MaSaC, a new multimodal contextual sarcasm and humor classif dataset
  in English-Hindi code-mix environment
  * ∼1,200 multi-party dialogs extracted from a popular Indian television show
    ‘Sarabhai vs. Sarabhai’
  * ∼15,000 utterance exchanges (primarily in Hindi) among the speakers
  * We manually analyze all the utterances and mark the presence/absence of
    sarcasm and humor for each of them (cf Section V for detailed description)
* MSH-COMICS, a multi-modal hierarchical attention framework for the utterance
  classification in conversational dialogs
  1. encode the textual utterance representation
    using a hierarchy of localized attention over the tokens in a sentence
  2. learn the modality-specific dialog sequence using LSTM [23] layers
  * to leverage the contextual information, we employ three attention mechs
    that learn the importance of preceding utterances with respect to each of
    the textual, acoustic, and textual+acoustic modalities
  * a simple gating mechanism that aims to filter the noise in accordance with
    the interactions among the modalities
  * Finally, we utilize the filtered representations for the sarcasm and humor
    classification
* significant performance for both the sarcasm and humor classification tasks
  * We also evaluate MaSaC on the existing multi-modal contextual sentence
    classification systems. The comparative study reveals that MSH-COMICS
    yields superior performance compared to the baselines for both the tasks
* contributions of the current work are as follows:
  * MaSaC, a qualitative multi-modal dataset
    for the sarcasm detection and humor classification
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
    Amazon product reviews: punctuation and pattern-based features to classify
    * kNN classifier
  * A similar study on tweet was proposed in [25]
  * the presence of sentiment shift or the contextual incongruity to be an
    important factor in accurate sarcasm prediction [27]
  * Son+ [30] proposed a hybrid Bi-LSTM and CNN based neural architecture
* context
  * for the implicit case, more often than not,
    the context in is of utmost importance [31, 32, 33]
  * Joshi+ [31] exploited the historical tweets of a user to predict sarcasm in
    his/her tweet. They investigated the sentiment incongruity in the current
    and historical tweets, and proposed it to be a strong clue in the sarcasm
  * Ghosh+ [34] employed an attention-based recurrent model to identify sarcasm
    in the presence of a context. The authors trained
    * two separate LSTMs-with-attention for the sentence and the context, and
  * context was also leveraged by [32]
    * a CNN-BiLSTM based hybrid model to exploit the contextual clues
    * they investigated the psychological dimensions of the user in sarcasm
      using 11 emotional states (eg, upbeat, worried, angry, depressed, etc.)
* Hindi or other Indian languages [35, 36].  One of the prime reasons for
  * Bharti+ [36] developed a sarcasm dataset of 2,000 Hindi tweets. For the
    baseline evaluation, they employed a rule-based approach that
    classifies a tweet as sarcastic if it contains more positive words than the
    negative words, and vice-versa
  * Swami+ [35] collected and annotated more than 5,000 Hindi-English
    code-mixed tweets. They extracted n-gram and various Twitter-specific
    features to learn SVM and Random Forest classifiers. Though the dataset
    * no context, unimodal
* multi-modal analysis [10, 11]
  * Cai+ [10] proposed a hierarchical fusion model to identify the presence of
    sarcasm in an image in the pretext of its caption
    * exploited the incongruity in the semantics of the two modalities as the
      signals of sarcasm.  Another application of the multi-modal sarcasm
* in the conversational dialog system. During the conversation, it is crucial
  for a dialog agent to be aware of the sarcastic utterances and respond
  accordingly
  * Castro+ [11] developed a multi-speaker conversational dataset for the
    sarcasm detection. For each sarcastic utterance in the dialog, the authors
    identified a few previous utterances as the context for sarcasm (English)
    * we: instead of defining the explicit context, we let the model learn the
      appropriate context during training

## Humor Detection

* contextual information plays an important role in detection [14, 13]
  * hE it is complex to process the contextual information
  => many of the earlier studies aim to identify humorous contents in
  standalone text without consulting the context [37, 38, 39, 40]
* inputs are one-liners or punchlines which usually have rich comic or rhetoric
  content to attract someone’s attention
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
* Dario+ [42] treated the humor classification task as sequence labelling and
  * conditional random field
* Indian languages, the study on humor classification is limited
  * Khandelwal+ [45] is one of the first studies that involve humor
    classification in Hindi-English code-mixed language. They developed
    * a dataset of ∼3,500 tweets with almost equal number of humorous and
      non-humorous tweets. The authors bench-marked the dataset on
    * SVM classifier using bag-of-word features
  * Sane+ [46] improved the SOTA on the same dataset using neural models. In
  * the dataset of Kandelwal+ [45] lacks both the contextual as well as
    multi-modal information. Furthermore, MaSaC has significantly more
    instances, and annotations for two tasks, ie sarcasm and humor detection

# 4 Methodology 4

# 5 Dataset Preparation 5

# 6 Experimental results and analysis 6

## E. Error Analysis 10

# 7 Conclusion
