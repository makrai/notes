Transformer models for text-based emotion detection: a review of BERT-based approaches
Francisca Adoma Acheampong, Henry Nunoo-Mensah & Wenyu Chen
Artificial Intelligence Review (2021)

# Abstract

* The models discussed include the Generative Pre-training (GPT) and its
  variants, Transformer-XL, Cross-lingual Language Models (XLM), and the
  Bidirectional Encoder Representations from Transformers (BERT). Considering
  * recent works in which researchers proposed various BERT-based models. The

# Introduction

* in Akhtar+ (2020), where the intensities of emotions were detected using a
  stacked ensemble of convolutional neural network (CNN), LSTM, and gated
  recurrent unit (GRU). However, this approach required a ground-up
* Emotion Detection (ED) is a branch of sentiment analysis (SA) that seeks to
  extract fine-grained emotions from either speech/voice, image, or text data
  * issue has been partly due to the
    * absence of voice modulation, facial expressions, etc., which may present
    * unavailability of a practical context extraction approach for texts
    * some texts convey multiple emotional expressions. Recently,
* pre-trained transformer-based models
* this paper is to review some of these transformer-based models that are being
  * datasets used, model architecture, results obtained, and limitations

# 2 the models of emotions and the concept of text-based emotion detection

# 3 a brief introduction to the concept of transformers

# 4 some transformer-based models, their pros and cons 7

# 5 text-based emotion detection works with transformer-based pre-train 15

* Yang+ [32], proposed a contextual emotion classifier, EmotionX-KU, which was
  applied to the EmotionX 2019 challenge shared task for detecting
* Huang+ [37] for detecting emotions in dialogue utterances used the
  EmotionLines dataset. The dataset was the same as the one
* Huang+ [38]. The competition consisted
* Malte and Ratadiya [45] using BERT to detect cyber abuse in English and Hindi
* Park+ [48] learn dimensional valence arousal dimension (VAD) scores from the
  corpus with categorical emotion labels. The
* Matero+ [55] assessed suicide risks using multi-level dual-context language
  and BERT. The
* Jwa+ [59] designed the BAKE and exBAKE model to automatically detect fake news
  using BERT through the scrutiny of headlines and body
* Yang+ [65] detected humor in paragraphs by implementing a three-level approach
  of data augmentation with paragraph de-
* Vlad+ [68] classified emotions and detected propaganda news in the NLP4IF-2019
* Gupta+ [72] proposed the ensemble of neural architectures and BERT to de-
* identification of speaker sensitive utterance, a significant challenge in
  Conversational Emotion Recognition (CER), Li+ in [78] de-
* Luo and Wang [81] adopted the BERT pre-trained model to classify emotions in
  the Friends and EmotionPush datasets during the EmotionX-2019,
* Cambria+ [82] designed a commonsense knowledge-based architecture made up of
  an ensemble of Bi-LSTM and BERT so that deep learning architec-
* Kazameini+ [102] extracted contextualized word embeddings from text data using
  BERT and the bagged-SVM classifier to predict the personality
* Using the Big Five Essay dataset and the Myers-Briggs’ type indicator Kaggle
  Dataset, Mehta+ [103] proposed integration of deep learning models
* Fadel+’s JUSTers model evaluated the performance of five pre-trained
  transformer models against commonsense validation and explanation at the Se-

# 6 concludes the paper and points out some recommendations to improve research

* BERT is the most explored transformer-based model for text-based emotion
  * BERT variants present to resolve BERT’s associated weaknesses, the paper
  * An ensemble of these variants using various ensemble techniques is recommend
* XLNet significantly outperforms other BERT variants in related NLP tasks, but
* a robust semi-supervised learning architecture could be efficient for an
  in-depth exploration of this available data [107].  The use of the
  * 107. A. Hussain and E. Cambria,
    Semi-supervised learning for big social data analysis
    Neurocomputing, vol. 275, pp. 1662–1673, 2018
* GPT possesses lexical robustness and is SOTA in related tasks
