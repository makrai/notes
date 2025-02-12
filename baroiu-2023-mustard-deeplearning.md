Comparison of Deep Learning Models for Automatic Detection of Sarcasm Context
  on the MUStARD Dataset
Alexandru-Costin Băroiu and Ștefan Trăușan-Matu
Electronics 2023, 12(3), 666; https://doi.org/10.3390/electronics12030666 

# Abstract

* Sentiment analysis and its sub-area of sarcasm detection has received growing
* approaches from basic machine learning to multi-modal deep learning solutions,
* Context has proven to be instrumental for sarcasm .  However, no NLP research has
* we: detection of sarcasm context, aiming to develop models that can correctly
* on MUStARD, multiple models are trained and benchmarked to find 
* the best performer for sarcasm-context detection is an attention-based LSTM
* F1 score of 60.1
* Furthermore tested on the SARC dataset and 
  * compared with other results reported in the literature to better assess the
* Future: a conversational agent that could identify and even respond to sarcasm

#  1. Introduction [Related work]

* approaches that model a profile of the speaker and account for their previ [8]
  * model the profile of the audience and its ability to perceive sarcasm [9,10]
Context is an essential condition for sarcasm. The incongruity between an
utterance and the context in which it occurs determines it to be sarcastic.
* context is necessary for an utterance to be considered sarcastic [11,12,13]
* only papers that identify context as an important topic are presented and
  * Ghosh+ [14] carried out some early work on sarcasm detection using
    conversation context. They used modeled conversations to determine which
    parts of a phrase established sarcasm. They also tried to determine which
    sentence in a multi-sentence message made it sarcastic. Other approaches
  * include dialogue context in sarcasm detection. This method was applied by
    Avvaru+ [15], using transformer-based models. They used the Twitter and
    Reddit datasets from the 2nd Workshop on Figurative Language Processing’s
    sarcasm-detection shared challenge to carry out their research.
    Context, response, and label fields are all included in these datasets.
    Avvaru+ trained different models after preprocessing the data: long
    short-term memory (LSTM) [16], bidirectional LSTM (BiLSTM), stacked LSTM,
    convolutional neural network LSTM (CNN–LSTM), bidirectional encoder
    representations from transformers (BERT) [17], and XLNet [18]. For each
    dataset, BERT was the top performing model, with BERT-5 for Reddit and
    BERT-7 for Twitter.
* Other datasets, such as the Internet Argument Corpus (IAC), were used in
  * Eke+ [19] proposed three methods to improve sarcasm recognition using IAC
    and two Twitter datasets. The first suggested model 
    1. combined a BiLSTM architecture with GloVe
    2. a pre-trained representation of BERT. The third model used 
    3. a context-based feature strategy that combined BERT-generated features
       with traditional machine learning techniques to increase
       sarcasm-detection performance. In comparison with the baseline models,
       the suggested methods exhibited improvement.
* context separators [21]. That solution, presented by Dadu and Pant [21], was
  * part of the FigLang2020 workshop. They used a RoBERTa-large model to detect
  * adding separation tokens between the context and the target utterance
    enhanced the model’s performance on the Reddit dataset.
* Yao+ [22] tackled Twitter sarcasm detection 
  by mimicking the brain’s cognition of sarcasm. Their paper proposed a
  * multimodal, multi-interactive, and multi-hierarchical model that was
  * trained on Twitter, image, image-caption, and text-in-image data. They
  * the brain’s perception of sarcasm, which requires multiple modalities. In
* Alathur+ [23] studied the implications of metaphors on electronic
  participation in healthcare, in the context of the COVID-19 pandemic. They
  * a lack of automated tools and region specificity limited the use of
    metaphors for awareness assessment.
* MUStARD (Castro+ [24]) is the main publication upon which the present paper is
  * multimodal dataset for sarcasm recognition based on a famous comedy series,
  * goal of bringing the sarcasm-detection problem closer to real-life situs.
  * tagged audiovisual utterances, each with its own context. The goal was to
  * incorporate sarcastic indications into the analysis, such as
    drawn-out syllables, shifts in tone, or straight expressions. 
  * When contextual signals are unavailable, humans employ these paralinguistic
    cues, such as facial expressions and vocal prosody, to communicate sarcasm.
  * when there are adequate contextual clues, such paralinguistic cues are not
    required. Therefore, based on the knowledge in the field and the previous
* ? Which of the Deep Learning architectures considered in this paper best
  performs for Automatic Sarcasm Context Detection on the MUStARD dataset?
