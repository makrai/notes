Mixing and Matching Emotion Frameworks
  Investigating Cross-Framework Transfer Learning for Dutch Emotion Detection
Luna De Bruyne, Orphée De Clercq, and Véronique Hoste
Special Issue Emerging Application of Sentiment Analysis Technologies 2021

# Abstract

* emotion classification performance tends to be rather low,
  esp with emotion categories that are tailored to specific tasks and domains
* we propose the use of the dimensional emotion representations (VAD), in an
  emotion regression task.  
  * Hypothesis:
  * VAD can improve performance of the classification task
  * VAD might be used as a pivot mechanism to map towards any emo framework,
    * allows tailoring emotion frameworks to spec applications
* we examine three cross-framework transfer methodologies
  * multi-task learning, in which
    VAD regression and classification are learned simultaneously
  * meta-learning, where
    VAD regression and emotion classification are learned separately and
    predictions are jointly used as input for a meta-learner;
  * a pivot mechanism, which
    converts the predictions of the VAD model to emotion classes
* We show that dimensional representations can indeed boost performance for
  emotion classification, especially in the meta-learning setting
  * up to 7% macro F1-score compared to regular emotion classification
  * The pivot method was not able to compete with the base model, but
  * categories do benefit from the additional VAD information,
  * hE the opposite does not hold
    * ie the VAD model is more robust than the classification model
  * further inspection suggests that it could be efficient, provided that the
    VAD regression model is further improved
  * gold VAD + rule-based mapping: performance on par with the base model
    ie the pivot method could be efficient, 
    provided that the VAD regression model is further improved

# 1 Intro

* apparent arbitrariness with which an emotion framework is chosen in NLP [9]
  * a data-driven motivation or experimentally grounded choice is lacking
  * nL benefits shown in tailoring the emotion label set to the task at hand
  * eg in crisis communication it would be appropriate to employ the
    crisis-related emotion framework of Jin+ [10], as proposed by Hoste+
* challenges of application/domain specific labels
  * resources will need to be created for every specific application and domain
  * emotion detection resources will be scattered over different frameworks,
  * emotion detection systems will not be generalizable
* Cross-framework transfer learning methods could mitigate these challenges
  * Finetuning pre-trained models, multi-task learning or label space mapping
* A straight-forward approach to shift between frameworks is to
  map discrete categories into a three-dimensional space
  * 3D space corresponds to Mehrabian and Russell’s claim that all affective
    states can be represented by the dimensions valence, arousal and dominance
  * This mapping to and from the VAD space can be regarded as a pivot
  * mapping technique (eg linear regression, kNN or lexicon-based mappings),
  * predicted VAD values can be converted to any categorical emotion label set
* Dutch emotion detection revealed that the
  * classification of emotional categories (anger, etc) is very challenging
  * more promising results were found for VAD regression [13]
  * Transferring information from the regression task to improve performance on
    the classification task would therefore be an interesting line of research
* two research questions: can dimensional reprs
  * serve as an aid in the prediction of emotion categories and
  * contribute in tailoring label sets to specific tasks and domains?
* we make use of the EmotioNL dataset [13]
* We examine three cross-framework transfer methodologies, namely
  * multi-task setting, the VAD regression task and classification task are
    learned simultaneously
  * meta-learner approach, two systems are trained separately, one for VAD
    regression and one for emotion classification. We will investigate whether
  * pivot method, using solely dimensional representations.  The code is

# 2 related work on the combination of categorical and dimensional

* Our previous work on Dutch emotion detection focused on the prediction of the
  classes {joy, love, anger, fear, sadness, or neutral} and VAD
  * in Dutch Twitter messages and captions from reality TV-shows [13]
  * classification results were low
    (54% accuracy for tweets and 48% for captions)
  * nL results for emotional dimensions were more promising (0.64 Pearson’s r)
* Multi-task learning in tasks related to emotion and sentiment [14,15]
  * not many studies perform transfer learning with multiple emo frameworks
  * various studies employ multitask learning by jointly training
    emotion detec with sentiment analysis [16,17] or other related tasks [18]
  * these studies suggest that multi-task frameworks outperform single-task
* deal with disparate label spaces
  * mapping between categorical and dimensional frameworks
    eg Stevenson+ [19] and Buechel and Hahn [20,21]
    * scores for valence, arousal and dominance were used to predict
      intensity values for the basic emotion categories
      {happiness, anger, sadness, fear, and disgust},
      and vice versa
    * linear regression [19], a kNN model [20] and
      a multi-task feed-forward network [21] were used
    * ff network provided promising results
      * Pearson corr = 0.877/0.853 for mapping dimensions to/from categories
* A straightforward approach is to map discrete categories directly into VAD
  * corresponds to Mehrabian and Russell’s claim that all affective states
    can be represented by the dimensions valence, arousal and dominance [12]
  * Figure 1 shows the positions of Ekman’s basic emotions in the VAD space,
    based on the scores of these terms in Mehrabian and Russell [12]
  * Calvo and Mac Kim apply this idea directly to emotion detection [22]
    * lexicon scores for emotion words related to the categories
      {anger/disgust, fear, joy, and sadness} by looking them up in the
      Affective Norms for English Words (ANEW) [23], and
      map the center of each of these categories
    * Then, they calculate VAD scores for sentences (again using ANEW)
    * By computing cosine similarity between the sentence and the emo categs
  * no annotated categories are needed, in contrast to the previously discussed
* unification of disparate label spaces in emotion and sentiment resources
  * [24–26] for emotion lexica and [27] for emotion datasets
  * Techniques: Bayesian models [24], variational autoencoders [25,26] and
    rule-based combination techniques [27] to map lexica or datasets

## 3.1 Materials and methods of our study and the data used

* EmotioNL: Dutch data in two domains:
  * Twitter posts (Tweets subcorpus)
    * 1000 tweets that all contain at least one out of a list of 72 emojis
  * utterances from reality TV-shows (Captions subcorpus)
    * 1000 utterances from transcriptions of three emotionally loaded Flemish
      reality TV-shows (Blind getrouwd; Bloed, zweet en luxeproblemen; Ooit)
      * more or less equally distributed over the shows (335/331/334 instances)
* All data were annotated with both categorical labels and dimensions. Eg tab 1
  * categorical annotation: 1 of {joy, love, anger, fear, sadness, or neutral}
  * The dimensional annotations are real-valued scores from 0 to 1

## 3.2 Experimental setup

### 3.2.2. Multi-Task Learning

* In this setting, the classification (categories) and regression (dimensions)
  models are trained simultaneously (see Figure 2). We use 
  * the same architecture and hyperparameters as in the base model. 
  * The RobBERT feature encoder allows for hard parameter sharing where the
    learning of features for the emotion classes and VAD prediction happens
    simultaneously, but has separate task-specific output layers
* loss weights
  * Binary Cross Entropy for emotion classification and 
  * Mean Squared Error loss for VAD) are 
  * averaged according to pre-defined weights. 
  * We test three different ratios: one where 
    * VAD and classification are weighed equally (both 0.5), one where
    * classification outweighs VAD (0.75 for classification and 0.25 for VAD)
    * VAD has the largest weight (0.75 for VAD and 0.25 for classification).

### 3.2.3. Meta-Learner (fig 3)

* no parameters are shared between the tasks
* a stacking ensemble is used in which two base models are trained, one for VAD
* The predictions (or probabilities in the case of classification) are
  concatenated (six values for classification and three values for VAD) and
  used as input for a meta-learner algorithm, in this case an
  SVM for classification and a linear regression model for VAD
* Nested cross-validation is used for this approach
  * training data of the meta-learner
    * when training the base models, for every test fold, a model is trained on
      eight folds and predictions are saved on the remaining fold
    * This is repeated, so that, for every test fold, predictions for the other
      nine folds have been made
    * These predictions will be used in the training phase of the meta-learner
  * test data of the meta-learner
    * the model is trained again using regular cross-validation, in order to
      save predictions for the test fold, based on training on nine folds

### 3.2.4. Pivot Method

* VAD predictions are transformed to classes by means of a rule-based mapping
  (see Figure 4)
  * several mapping techniques have been investigated in related work (Sec 2),
    hE these approaches are not eligible for a pivot method, as
    they all rely on data in a bi-representational format
* The rule-based mapping works as follows
* we look up the emotion terms from our label set {anger, fear, joy, love, sa}
  in the definition list with VAD scores of Mehrabian and Russell [12] and
  scale them to a range from 0 to 1 to match the VAD annotation of the dataset
  * The scores can be found in Table 2
  * Following [22], we place both the textual instances to be classified and
    the vectors for the categorical emotion terms in the 3D space
* We start by drawing some general rules for anger, fear, joy and sadness, as
  shown in Table 3 (at this point, love and neutral are not taken into consid)

```python
if V < 0.5 and A > 0.5 and D > 0.5:
  class ← anger
elif V < 0.5 and A > 0.5 and D < 0.5:
  class ← fear
elif V > 0.5 and A > 0.5 and D < 0.5:
  class ← joy
elif V < 0.5 and A < 0.5 and D < 0.5:
  class ← sadness
else:
  Find class with smallest cosine distance
```

* If a class cannot be matched based on these rules, then we calculate
  cosine distance between the instance that needs to be classified and each
  emotion class vector
  (here love and neutral are included, neutral = {0.5, 0.5, 0.5})

# 4 Results

# 5 Discussion

* The results in Section 4 suggest that
  * VAD dimensions can help in predicting emotional categories, as the
  * VAD regression model seems more robust than the classification model
  * hE, the pivot method did not seem an effective approach to cat emotion
* this section
  * correlation between categories and VAD dimensions as annotated in EmotioNL
  * error analysis on the predictions of the pivot method
  * some suggestions for future research directions

## 5.1. Correlation between Categories and Dimensions

* The point biserial correlation coefficient is used to measure the
  correlation between a continuous and a binary variable
  * Table 8 (Tweets) and Table 9 (Captions)
* Valence. In both domains,
  * anger and sadness show a high negative correlation with valence
  * joy shows a high positive correlation with this dimension
  * For fear and love, the correlation is less obvious
* Arousal is (weakly) positively correlated with anger and joy
  * Sadness has a negative correlation with this dimension in Captions
  * neutral, strikingly, has a notable negative correlation with arousal
    * a bit against our assumption that neutral is the center
    * not completely counter-intuitive that
      neutral sentences had low arousal instead of medium
* dominance more correlated with emotion categories than arousal
  * Contrary to what some studies claim [36]
  * Especially with sadness (r = −0.46 in Tweets and r = −0.45 in Captions)
  * Captions: fear and joy are rather highly negativ correlated with dominance
* summ: correlated, but not for each dimension-category pair and
  certainly not always to a great extent
  * suggests that a mapping could be learned
  * various studies have already successfully accomplished this [19–21]
  * our goal is not to learn a mapping, because then there would still be a
    need for annotations in the target label set
  * a mapping should be achieved without relying on any categorical annotation
  * correlations too low to directly map VAD predictions to categories through
    a rule-based approach, as was proven in the results of the pivot method
* SVM. For comparison, we did try to learn a simple mapping using an SVM
  * similar approach as meta-learn depicted in Figure 3, but now
    only the VAD predictions are used as input for the SVM classifier
  * Results of this learned mapping are shown in Table 10
    * on par with the base model
    * Especially for the Tweets subset
    * suggesting that a pivot method based on a learned mapping could work

## 5.2. Error Analysis

* confusion matrices of the base model, the meta-learner (the best performing
  multi-framework) and the pivot model
  * we randomly select a number of instances and discuss their predictions
  * Tweets/Captions: Figures 9–11/12--14
  * the base model’s accuracy was higher for the Tweets
  * there are less misclassifications per class in Captions
    * overall higher macro F1 score (0.372 compared to 0.347)
* the classifiers perform poorly on the smaller classes (fear and love)
* meta-learner
  * true positives: The most notable improvement is for fear
  * general: fear, love and sadness are the categories that benefit most
* The pivot method clearly falls short
  * Tweets subset, only the predictions for joy and sadness are acceptable,
    while anger and fear get mixed up with sadness
  * Captions subset, the pivot method fails to make good predictions
    for all negative emotions
* tab 11: ten rand instances (5 from the Tweets subcorpus and 5 from Captions)
  * English translation of the instances is given in Appendix A
  * all (except instance 2), the base model gave a wrong prediction,
    while the meta-learner outputted the correct class
  * the first example is interesting, as this instance contains irony
    * sunglasses emoji and the words _politicians never lie_
    * in fact an angry message
    * Probably, the valence information present in the VAD predictions is the
      reason why the polarity was flipped in the meta-learner prediction
    * the output of the pivot method is a negative emotion as well, sadness

## 5.3. Future Work

* other datasets and languages than Dutch
* different model architectures for the pivot method
* The pivot method for mapping to other label sets
* other modalities, eg facial emotion recognition (FER)
  * A well-known problem in FER is the poor performance in real-time testing
    because of the bad quality of datasets [37]

# 6 Conclusion
