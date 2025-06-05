Dimensional Emotion Detection from Categorical Emotion
Sungjoon Park, Jiseon Kim, Seonghyeon Ye, Jaeyeol Jeon, Hee Young Park,
  Alice Oh
arXiv:1911.02499

# Abstract

* We present a model to predict fine-grained VAD emotions
  with a corpus with categorical emotion annotations
  * continuous dimensions of valence, arousal, and dominance (VAD)
  * trained by minimizing the Earth Mover's Distance (EMD) loss between
    the predicted VAD score distribution and
    the categorical emotion distributions sorted along VAD
  * can simultaneously classify the emotion categories and predict VAD scores
    for a given sentence
  * pre-trained RoBERTa-Large fine-tuned on three corpora with categ labels
  * evaluation on EmoBank corpus with VAD scores
    * categorical: comparable performance to that of the SOTA classifiers
    * VAD: significant positive correlations with the ground truth VAD scores
  * further training with supervision of VAD labels leads to improved perf
    especially when the dataset is small
* We also present examples of predictions of appropriate emotion words
  that are not part of the original annotations

# 1 Intro

* basic emotions and VAD
  * basic emotions eg happy (Ekman, 1992; Plutchik, 2001)
  * hE we can feel and express more subtle and complex emotions beyond them
  * emotions can be systematically represented with the Valence-Arousal-Domin
    * model maps emotional states to 3-dimensional continuous VAD space
    * measurable distances between emotions (Russell and Mehrabian, 1977),
    * covering a wider range of subtle emotions
      compared to the categorical models with a finite set of basic emotions
    * could benefit
      * clinical NLP (Desmet and Hoste, 2013; Sahana and Girish, 2015),
      * emotion regulation such as psychotherapy (Torre and Lieberman, 2018)
        * 'affect labeling': analyzing the client’s utterance and
          acknowledging the negative emotion as ‘neglected’ rather than ‘sad’,
          would reduce negative physiological, behavioral, and psycho responses
          resulting from that emotional state
* lack of annotated resources
  * a small sentence-level corpus with full VAD annot (Buechel and Hahn, 2017),
  * a corpus annotated with V and A dimensions
    (Preoţiuc-Pietro+ 2016a; Yu+ 2016a), and
  * one only with V (Lykousas+ 2019)
  * We could build additional resources by labeling VAD scores
    by Best-Worst Scaling (Kiritchenko and Mohammad, 2017)
* our method predicts VAD scores
  from existing corpora annotated with categorical emotions
  * Scherer and Wallbott, 1994; Alm+ 2005; Aman and Szpakowicz, 2007;
    Mohammad, 2012; Sintsovaa and Musata, 2013; Li+ 2017; Schuff+ 2017;
    Shahraki and Zaiane, 2017; Mohammad+ 2018
* we propose a framework to learn the VAD scores of the label words obtained
  from the NRC-VAD lexicon (Mohammad, 2018)
  * fine-tuning a pre-trained language model RoBERTa (Liu+ 2019)
  * we learn conditional VAD distributions
    through supervision of categorical labels and
    use them to compute VAD scores as well as to
    predict the emotion labels for a given sentence
* contributions
  * a framework which enables learning to predict VAD scores as well as
    categorical emotions from a sentence only with categorical emotion labels
  * significant positive correlations to corresponding ground truth VAD scores
  * Our model outperforms SOTA dimensional emotion detection models
    by fine-tuning with supervision of VAD scores
    when the training dataset size is limited

# 2 Approach

## Overview

* categorical labels can be mapped to word-level VAD scores
  by using NRC-VAD lexicon (Mohammad, 2018)
  * categorical emotion as a point in the VAD space
  * Then we sort the labels by each VAD dimension for Earth-Mover Distance

## Model Architecture (Fig 1a)

* Formally, an emotion detection model is P(e|X) where
  * e is an emotion drawn from a set of pre-defined categorical emotions e ∈ E
  * X = {x1 , x2 , ..., xn } is a sequence of symbols xi representing the input
  * Usually e is a one-hot vector in emotion classification
* since the VAD dimensions are nearly independent (Russell and Mehrabian,
  1977), we simply assume mutual independence

## Model Training (Fig 1b)

* we need to obtain target conditionals for each P(v|X), P(a|X), P(d|X)
  from categorical emotion labels
* sorted one-hot labels can be treated as a proxy of target conditionals
* we minimize the distances between the true and predicted P(·|X)s
  * Since we sorted the labels, there is ordering among the classes
  * This should be taken into account during optimization, so
    we minimize the squared Earth Mover’s Distance (EMD) loss (Hou+ 2017)
    between them to consider the order of labels

## Predicting Continuous VAD Scores (Fig 1d)

* We compute the expectations of each predicted conditional distris of V, A, D
  to predict the continuous VAD scores

## Predicting Categorical Emotion Labels (Fig 1c)

* pick
  * single-label, Eq 9: the emotion label with the maximum prob
  * multiple labels: those with probability over a certain threshold
    * The threshold is a hyperparameter of the model, set to 0.51/3
    * ie geometric mean of the three distributions

# 3 Experiments

## 3.1 Dataset

### SemEval 2018 E-c (SemEval). A multi-labeled categorical emotion corpus

* 10,983 tweets
* labels for presence or absence of 11 emotions (Mohammad+ 2018)

### ISEAR. A single-labeled categorical emotion annotated corpus

* 7,666 sentences. A label
* 7 categorical emotions (Scherer and Wallbott, 1994)
* split in a stratified fashion in terms of the labels
* The train, valid, test set is split by the ratios (0.7:0.15:0.15)

### GoEmotions. A multi-labeled categorical dataset

* 58,009 reddit comments with 28 emotion labels including neut (Demszky+ 2020)
* hE the original dataset with 28 emotion labels has
  large disparity in terms of emotion frequencies
  (admiration is 30 times more frequent that grief )
* To reduce the side-effects from this property, we choose the ‘Ekman’ option
  of the dataset provided by the authors which consists of
  * 7 emotion labels including neutral class
* We use pre-splits of train, valid, test set of the dataset

### EmoBank. Sentences paired with continuous VAD scores as labels

* 10,062 sentences collected across 6 domains and 2 perspectives
* Each sentence has three scores representing VAD in the range of 1 to 5
* Unless otherwise noted, we use the weighted average of VAD scores as truth
  * recommended by EmoBank authors
* We use pre-splits of train, valid, test set of the dataset
  (Buechel and Hahn, 2017)

## 3.2 Dimensional Emotion (VAD) Prediction

### 3.2.1 "Zero-shot" (transfer) VAD Prediction

* not trained over the EmoBank train-set, only
  using the EmoBank test-set for evaluation
* could be interpreted as how much a model can generalize the categorical
  emotions into the continuous VAD space
  using only |E| fixed points in the space

### 3.2.2 VAD Prediction with Supervision

* We continuously train our zero-shot models with the train-set of the EmoBank,
  and compare their performance with other methods which relies on the direct
  supervision from them
* allow us to compare the zero-shot prediction performances against them, and
  * how much the zero-shot prediction model could be improved if VAD
    annotations are available
* We also compare data scarce scenarios, only using a part of Emobank train set

## 3.3 Categorical Emotion Prediction

## 3.4 Experimental Details

# 4 Results

## Zero-Shot VAD Prediction

## VAD prediction with Supervision

## Categorical Emotion Prediction

# 5 Ablation

* the effect of model architecture, pre-training and fine-tuning
  * We show the result for SemEval dataset because
    it gave the best performance for zero-shot score prediction
  * Validation set results are shown in Appendix
* In Table 3, we present six models for ablation study
* Model 1: RoBERTa trained on SemEval with our framework except
  EMD loss replaced with cross-entropy which does not consider the order
  * our model shows better correlations in overall (+.022)
* Model 3 is fine-tuned on EmoBank without pretrained weights of RoBERTa,
  * highly underperforming result compared to Model 5 (+.302)
  * performance still comparable to that of AAN (Zhu+ 2019)
* Model 4 uses BERT (Devlin+ 2018) pre-trained weights
  * slightly lower performance than Model 5 (+.027)
* Model 6 shows comparable performance compared to Model 5 when using full
  train-set

# 6 Qualitative Examples

* In Table 4, we show examples predicted from our model trained on SemEval
  * annotated tweets from SemEval test set,
    corresponding predicted categorical labels, and
    5 nearest neighbor emotional words with respect to the predicted VAD
  * For these three tweets, our model correctly predicted the categ emo labels
* We elaborate how we find the nearest neighbor words from the VAD scores

# 7 Related work

* word-level VAD annotation of English words
  (Bradley and Lang, 1999; Warriner+ 2013; Mohammad, 2018)
* sentence-level VA or VAD annotated corpora
  (Buechel and Hahn, 2017; Preoţiuc-Pietro+ 2016b; Yu+ 2016b)
* predict VAD scores from sentences based on
  * variational autoencoders (Wu+ 2019),
  * adversarial learning (Zhu+ 2019),
  * ensemble learning (Akhtar+ 2019)
* sentences annotated with basic categorical emotions for VAD score prediction
  * Scherer and Wallbott, 1994; Alm+ 2005; Aman and Szpakowicz, 2007;
    Mohammad, 2012; Sintsovaa and Musata, 2013; Li+ 2017; Schuff+ 2017;
    Shahraki and Zaiane, 2017; Mohammad+ 2018; Demszky+ 2020
  * more common than VAD
  * commonly used for emotion classification
    * we use them to predict VAD scores from categorical model of emotion
* dataset related to emotion, all of these are cateogrical annotations
  * in healthcare (Sosea and Caragea, 2020),
  * relation between emoji and emotion (Shoeb and de Melo, 2020)
  * from social media (Ding+ 2020)
  * multimodal emotion detection (Zhang+ 2020),
  * emotion in conversation (Ishiwatari+ 2020), and
  * emotion change in a paragraph (Brahman and Chaturvedi, 2020)
* various types of label sets. To train model across the various inventories
  * aggregate various format of emotion dataset into a common annotation schema
  * better performance using unified dataset
    (Bostan and Klinger, 2018; Belainine+ 2020)
  * hE still the labels are mapped to other predefined emotions
  * Buechel and Hahn (2018) convert categorical emotions into VAD
    * using simple Feed-Forward Neural Networks
    * with dataset labeled with both emotion categories and VAD

# 8 Discussion and Conclusions

## Robustness. Our framework could be applied to multimodal datasets

* If we apply our framework to IEMOCAP (Busso+ 2008), the zero-shot VAD
  predictions are significantly correlated with ground truths
  (V: 0.396, A: 0.241, D: 0.197)
  * hE performance is rather low
    since our model does not leverage other modalities such as audio or videos
* which word-level resources
  * We use NRC-VAD to estimate distance between emotions because it is
    constructed very carefully to locate words in VAD space
  * If we use ANEW (Redondo+ 2007), we observe positive results as well
    (V: 0.682, A: 0.270, D: 0.296)

## Ethical Considerations: understand and regulate emotional states

* manipulating the semantic emotive content of user news feeds
  * can affect the choices of both individuals and groups on the platform to
    engage and interact (Stark and Hoey, 2020)
* problems might occur from the inaccurate results of the model
  * Mispredictions of the models could result in harmful outcomes
* languages with relatively low resources
  * quality  of emotion detection resources would degrade
  * cultural nuances to defining emotions vary
* guidelines for the ethical use of emotional AI technologies
  * a checklist for anyone engaged with data about human emotion
  * Stark and Hoey (2020)
  * McStay and Pavliscak (2019) include a number of salutary suggestions
    for taking action as a practitioner
* resources using multilingual corpora with categorical emotion labels
  (Öhman+ 2018)
