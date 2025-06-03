Comparison of Deep Learning Models for Automatic Detection of Sarcasm Context
  on the MUStARD Dataset
Alexandru-Costin Băroiu and Ștefan Trăușan-Matu
Electronics 2023, 12(3), 666; https://doi.org/10.3390/electronics12030666

# Abstract

* Sentiment analysis and its sub-area of sarcasm detection
* approaches from basic machine learning to multi-modal deep learning solutions,
* Context has proven to be instrumental for sarcasm
* we: detection of sarcasm context
* on MUStARD, multiple models are trained and benchmarked
* the best performer for sarcasm-context detection is an attention-based LSTM
* F1 score of 60.1
* Furthermore tested on the SARC dataset and
  * compared with other results reported in the literature for better assessment
* Future: a conversational agent that could identify and even respond to sarcasm

#  1. Introduction [Related work]

* approaches that model a profile of the speaker and account for their previ [8]
  * model the profile of the audience and its ability to perceive sarcasm [9,10]
* Context is an essential condition for sarcasm. The incongruity between an
  utterance and the context in which it occurs determines it to be sarcastic
* context is necessary for an utterance to be considered sarcastic [11,12,13]
* this section reviews only papers that identify context as an important topic
  * Ghosh+ [14] carried out some early work on sarcasm detection using
    * conversations modeled to determine
      * which parts of a phrase established sarcasm
      * which sentence in a multi-sentence message made it sarcastic
* dialogue context in sarcasm detection. This method was applied by
  * Avvaru+ [15] used transformer-based models. They used the
    * Twitter and Reddit datasets from FigLang2020
      * 2nd Workshop on Figurative Language Processing’s sarcasm-detection
        shared challenge
    * Context, response, and label fields are all included in these datasets
    * different models after preprocessing the data: long short-term memory
      (LSTM) [16], bidirectional LSTM (BiLSTM), stacked LSTM, convolutional
      neural network LSTM (CNN–LSTM), bidirectional encoder representations
      from transformers (BERT) [17], and XLNet [18]. For each dataset,
    * BERT was the top performing model, with BERT-5 for Reddit and
      * BERT-7 for Twitter
* Internet Argument Corpus (IAC)
  * Eke+ [19] proposed three methods to improve sarcasm recognition using IAC
    and two Twitter datasets
    1. combined a BiLSTM architecture with GloVe
    2. a pre-trained representation of BERT
    3. a context-based feature strategy that
      combined BERT-generated features with traditional machine learning
* context separators (Dadu and Pant [21])
  * part of the FigLang2020 workshop. They used a RoBERTa-large model
  * adding separation tokens between the context and the target utterance
    enhanced the model’s performance on the Reddit dataset
* Yao+ [22]: Twitter sarcasm detection by mimicking the brain’s cognition
  * multimodal, multi-interactive, and multi-hierarchical model
  * trained on Twitter, image, image-caption, and text-in-image data
  * the brain’s perception of sarcasm requires multiple modalities
* Alathur+ [23] studied the implications of metaphors on electronic
  participation in healthcare, in the context of the COVID-19 pandemic
  * a lack of automated tools and region specificity limited the use of
    metaphors for awareness assessment
* MUStARD (Castro+ [24]) is the main publication upon which the present paper is
  * multimodal dataset for sarcasm recognition based on a famous comedy series,
  * goal of bringing the sarcasm-detection problem closer to real-life situs
  * tagged audiovisual utterances, each with its own context
  * incorporate sarcastic indications into the analysis, such as
    drawn-out syllables, shifts in tone, or straight expressions
  * When contextual signals are unavailable, humans employ these paralinguistic
    cues, such as facial expressions and vocal prosody, to communicate sarcasm
  * when there are adequate contextual clues, such paralinguistic cues are not
    required. Therefore, based on the knowledge in the field and the previous
* ? Which of the Deep Learning architectures considered in this paper best
  performs for Automatic Sarcasm Context Detection on the MUStARD dataset?
