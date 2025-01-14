Transformer models for text-based emotion detection: a review of BERT-based appr
Francisca Adoma Acheampong, Henry Nunoo-Mensah, and Wenyu Chen
Artificial Intelligence Review (2021)

# Abstract

* models discussed: the Generative Pre-training (GPT) and its variants,
  Transformer-XL, Cross-lingual Language Models (XLM), and
  the Bidirectional Encoder Representations from Transformers (BERT)
  * recent works in which researchers proposed various BERT-based models

# Introduction

* Akhtar+ (2020) detect the intensities of emotions using a stacked ensemble of
  convolutional neural network (CNN), LSTM, and gated recurrent unit (GRU)
* Emotion Detection (ED) is a branch of sentiment analysis (SA) that seeks to
  extract fine-grained emotions from either speech/voice, image, or text data
  * issues
    * absence of voice modulation, facial expressions, etc
    * unavailability of a practical context extraction approach for texts
    * some texts convey multiple emotional expressions
* pre-trained transformer-based models
* we review some of these transformer-based models
  * datasets used, model architecture, results obtained, and limitations

# 2 Models of emotions and the concept of text-based emotion detection

* discrete and dimensional form
* Discrete representations place emotions into finite categories
  * agreed that emotions arose due to how individuals perceived events, and
    those emotions vary according to their degree of intensity
  * Ekman (1999) places emotions into six basic categories, ie,
    happiness, sadness, anger, disgust, surprise, and fear
    * these emotions are independent of each other, basic, and can produce
      complex emotions by combinations
  * Plutchik (1980)
    * like Ekman, primary emotions, and their combinations: complex emotions
    * hE 8 primary emotions instead of 6 by Ekman which occured
      * in opposite pairs. The 8 primary emotions as proposed by Plutchik
      * joy--sadness, trust--disgust, anger--fear and surprise--anticipation
  * Orthony, Clore, and Collins (1990, OCC) disagreed with the analogy of ’basic
    emotions’ as presented by Ekman and Plutchik
    * 22 emotions, adding 16 emotions to Ekman's essential ones
    * additional classes of relief, envy, reproach, self-reproach,
      appreciation, shame, pity, disappointment, admiration, hope,
      fears-confirmed, grief, gratification, gloating, like and dislike
* dimensional models place emotions into a uni~ or multi-dimensional space
  * The spatial order depicts the relationship between emotions and
    their relative degree of occurrence
  * Circumplex of Affect proposed by Russell (1980) is a profound example
    * 2-dimensional circular wheel in an arousal-valence domain
  * Russell and Mehrabian (1977) also presented a 3-D emotional model
    * valence, arousal, and dominance with
      * valence differentiating emotions by pleasantness and unpleasantness,
      * arousal differentiating emotions by activations and deactivations,
      * dominance: the degree to which experiencers control their emotions
  * The Hourglass of Emotions revisited model presented by Susanto+ (2020) is
    * an improvement over the original Hourglass of Emos by Cambria+ (2012)
    * both classify unknown concepts based on known features
    * issues with the Susanto+ proposal
      * uncanny color associations of the original model, the presence of
      * neutral and ambiguous emotions, the
      * absence of polar emotions such as calmness and eagerness
      * wrong associations of antithetic emotions eg
        * anger and fear (which were both negatives) or
        * surprise and anticipation
          (opposite in terms of meaning but not in terms of polarity)
      * low polarity scores for compound emotions and the
      * absence of self-conscious or moral emotions
    * tested on three sentiment benchmarks
      (ie, Blitzer dataset, Pang and Lee dataset, and Amazon dataset)
      * The Cambria+ hourglass model demonstrated the highest scores in all
      * 94.72%, 93.29%, and 89.85% for the Blitzer, Pang and Lee, and Amazon
    * Figure 1 illustrated the revised hourglass model
* The approaches for recognizing emotions from texts as
  * outlined by Acheampong+ (2020)
  * SOTA: deep learning techniques in the lead
  * remaining issues with deep learning
    * extracting the relationship between long term dependent texts
    * parallel processing of text sequence
    * integration of logical reasoning within these techniques

# 3 The concept of transformers

# 4 Some transformer-based models, their pros and cons 7

## 4.1 Transformer-XL

## 4.2 Generative Pre-Training (GPT)

## 4.3 Bidirectional Encoder Representations from Transformers (BERT)

## 4.4 Cross-Lingual Language Model (XLM)

## 4.5 XLNet

## 4.6 Robustly Optimized BERT pre- training Approach (RoBERTa)

## 4.7 DistilBERT

# 5 Text-based emotion detection works with transformer-based pre-training 15

* Yang+ [32]: a contextual emotion classifier, EmotionX-KU, which was
  applied to the EmotionX 2019 challenge shared task
* Huang+ [37] detecting emotions in dialogue utterances (EmotionLines dataset)
* Huang+ [38] competition
* Malte and Ratadiya [45] using BERT to detect cyber abuse in English and Hindi
* Park+ [48] learn dimensional valence arousal dimension (VAD) scores
  from a corpus with categorical emotion labels
* Matero+ [55] assessed suicide risks using multi-level dual-context language
  and BERT
* Jwa+ [59] designed the BAKE and exBAKE model to automatically detect fake news
  using BERT through the scrutiny of headlines and body
* Yang+ [65] detected humor in paragraphs
  * three-level approach
    * data augmentation with paragraph dedecomposition (PD),
    * fine-tuning BERT with task-specific label and
    * ensemble for inference
  * Three datasets
    * CCL2019 Chinese Humor Computation (XIAONIU) dataset
      * The XIAONIU dataset is a Chinese humor dataset made up of 21, 552 human
        written jokes mixed with machine written ones. It is also composed of
        21, 885 jokes labeled in three levels for tri-classification problems
    * FUN (Blinov+ 2019) dataset
      * a Russian dataset containing 313, 210 samples collected from Russian
        social media websites and labeled binary classif
    * HAHA (Humor Analysis based on Human Annotation, Chiruzzo+ 2019) dataset
      * a Spanish dataset that contains 30, 000 tweets,
        out of which 11, 595 is labeled as humorous
* Vlad+ [68] classified emotions and detected propaganda news in NLP4IF-2019
* Gupta+ [72] proposed the ensemble of neural architectures and BERT
* identification of speaker sensitive utterance, a significant challenge in
  Conversational Emotion Recognition (CER), Li+ in [78] de-
* Luo and Wang [81] adopted the BERT pre-trained model to classify emotions in
  the Friends and EmotionPush datasets during the EmotionX-2019,
* Cambria+ [82]: a commonsense knowledge-based architecture
  made up of an ensemble of Bi-LSTM and BERT
* Kazameini+ [102] extracted contextualized word embeddings from text data using
  BERT and the bagged-SVM classifier to predict the personality
* Using the Big Five Essay dataset and the Myers-Briggs’ type indicator Kaggle
  Dataset, Mehta+ [103] proposed integration of deep learning models
* Fadel+’s JUSTers model evaluated the performance of five pre-trained
  transformer models against commonsense validation and explanation at the Se-

# 6 Conclusion and recommendations to improve research

* BERT is the most explored transformer-based model for text-based emotion
  * BERT variants present to resolve BERT’s associated weaknesses
  * An ensemble of these variants using various ensemble techniques is recommend
* XLNet significantly outperforms other BERT variants in related NLP tasks
* a robust semi-supervised learning architecture could be efficient for an
  in-depth exploration of this available data [107]
  * 107 A Hussain and E Cambria,
    Semi-supervised learning for big social data analysis
    Neurocomputing, vol. 275, pp. 1662–1673, 2018
* GPT possesses lexical robustness and is SOTA in related tasks
