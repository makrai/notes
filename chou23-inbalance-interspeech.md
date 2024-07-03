The Importance of Calibration: 
  Rethinking Confidence and Performance of Speech Multi-label Emotion Classifiers
Huang-Cheng Chou, Lucas Goncalves, Seong-Gyun Leem, Chi-Chun Lee, Carlos Busso
doi: 10.21437/Interspeech.2023-1113 

# Abstract

* The uncertainty in modeling emotions
  makes multi-label speech emotion recognition (SER) systems less reliable. An
  * solution: reject predictions with low confidence.
  * an SER system is well calibrated = highly confident predictions are often
    right and low confident predictions are often wrong. Hence, 
  * ie it is desirable to calibrate the confidence of SER classifiers.
* We evaluate the reliability of SER systems by
  exploring the relationship between confidence and accuracy, using the
  * expected calibration error (ECE) metric. We develop 
  * a multi-label variant of the post-hoc temperature scaling (TS) method to
    calibrate SER systems, while preserving their accuracy
  * The best method combines 
    * an emotion co-occurrence weight penalty function, 
    * a class-balanced objective function, and 
    * the proposed multi-label TS calibration method
* experiments show the effectiveness of our multi-label calibration method
  in terms of accuracy and ECE.
* conclusion
  * surprisingly, multi-label SER systems’ predictions are under-confident
    instead of over-confident.
  * We combined two strategies to simultaneously improve performance and
    calibration
  * the class-balanced loss can not only/but also 
    * calibrate the predictions (7.16 % improvement gain in ECE), 
    * improve classification performance (4.26% improvement gain in macro-F1)
  * The emotion co-occurrence weight penalty function leads to
    further improvements in classification performance. Finally, we proposed
  * the multi-label TS calibration method to separately calibrate the
    prediction of individual emotions. Using this strategy, 
    * the ECE metric improves for all models with gains between 15.4% and 20%.
  * multi-label TS calibration method with the two loss function strategies, we
    obtain the best recognition accuracy (0.401 in macro-F1 score), achieving
    an ECE equal to 0.27
  * Compared to the baseline model, this model has a
    * 13.92% performance gain in macroF1 score and a 
    * 2.22% improvement gain in ECE.

# 1 Intro

* SER with speech reprs with self-supervised pre-training models [1, 2]
  * Wagner+ [2] achieved SOTA performance in predicting sentiment on two
    well-known emotional databases (IEMOCAP [3] and MSP-Podcast [4]) using the
    Wav2vec2.0 architecture [5]. In fact, 
  * the top systems on the emotion recognition (ER) task in the SUPERB
    leaderboard [6] have utilized selfsupervised pre-training models. In
  * hE the uncertainty associated with modeling emotions still opens questions
    about the reliability of SER predictions.  
* Guo+ [7]: predictions of modern neural networks are over-confident (eg high
  confidence for samples with low accuracies), which might affect the
  decision-making of machine learning systems. Studies have 
  * addressed by developing confidence calibration methods [8, 9].
* We use a multi-label SER model using the SOTA SER framework proposed by
  Wagner+ [2] to assess, quantify, and address this calibration problem in SER
  * surprisingly, the predictions of SER systems are under-confident instead of
    over-confident. Having models’ predictions that are 
  * underconfidence is a problem. For example, 
    * strategies relying on a reject option, such as the work of Sridhar and
      Busso [10, 11], may reject too many “low confident” predictions for
      samples that are actually correctly predicted
    * It is important to develop strategies to calibrate the predictions of an
      SER model while improving or at least maintaining its performance.
* we analyze the calibration level of SER systems, exploring potential
  approaches to calibrate their predictions.
  * we use the expected calibration error (ECE) [7] as the calibration metric
    to demonstrate the reliability of multilabel SER systems. We evaluate
    whether the class-balanced objective function and the emotion co-occurrence
    weight penalty function can improve the calibration and classification
    performance of SER systems
  * class-balanced cost function [12] introduces a weight based on the number
    of samples for each class
    * expected to improve the calibration since models trained on imbalanced
      databases are more miscalibrated than the ones trained on balanced
      databases [13]. The 
  * emotion co-occurrence weight penalty function [14] considers frequent
    annotator disagreements between emotional classes, penalizing more
    infrequent emotions that do not co-occur. This loss
    * expected to improve classification performance.
  * we modify temperature scaling (TS) [7] to calibrate the proposed multi-
    label SER systems
    * TS is well-known posthoc calibration method  
    * The original TS method was designed for a single-label task. We develop
    * multi-label: different emotion-dependent “Temperatures” learned to
      calibrate the confidence of the predictions for each individual emotion.
* experiments on the MSP-Podcast corpus [4]. Compared to a baseline model, the
  * class-balanced objective function leads to an improvement gain of
    * 7.16% in ECE, which shows better calibration, and an improvement gain of
    * 4.26% in macro-F1 scores, which shows better performance. We observe the
  * best performance with class-balanced objective + emotion co-occurrence
    weight penalty
    * ECE gains between 15.43% and 20%. We summarize the three main
* contributions of the paper: 
  * we demonstrate the need for model calibration in SER, 
  * we show that integrating a class-balanced objective function during the
    training process can improve the calibration and performance
  * we introduce a multi-label TS calibration method to improve the confidence
    of multi-label SER classifiers while preserving the classification
    performance

# 2. Background

## 2.1. Multi-Label Emotion Classification explored across many domains

* facial expression classification [15], and text emotion classification [16].
* Emotion perception is highly subjective, so 
  * annotator disagreements often exist in annotations [17–19], which are then
  * ~> a sentence conveying more than one emotion [20].
* most previous SER studies regard disagreements as noise, relying on 
  * consensus labels to decide a single-label emotion class based on rules such
    as the majority vote or plurality rule [21–23]. Studies
* benefits of using labels that do not agree with the consensus label [18, 21,
  24–26]
* we follow Chou+ [14, 27] to formulate the SER task as a multi-label problem.
  * [14] H.-C. Chou, C.-C. Lee, and C. Busso, “ Exploiting co-occurrence
    frequency of emotions in perceptual evaluations to train a speech emotion
    classifier Interspeech 2022, Incheon, South Korea, September 2022, pp.
    161–165.
  * [27] H.-C. Chou, W.-C. Lin, C.-C. Lee, and C. Busso, “ Exploiting
    annotators’ typed description of emotion perception to maximize utilization
    of ratings for speech emotion recognition,” in ICASSP 2022 IEEE
    International Conference on Acoustics, Speech and Signal

## 2.2. Calibration of the Model Confidence

* Deep neural networks in decisionmaking processes in many classification
  applications, such as speech recognition [28] and self-driving cars [29]. In
* the output probabilities of the model’s predictions for each class can be
  regarded as confidence scores. The decision-making process might be
* if the confidence in the model’s predictions cannot reflect the accuracy of
* Guo+ [7]: the predictions of neural networks are often over-confident in
  image and document classification tasks
* calibration of the confidence of a model to obtaining reliable systems [30]
* hE only for a single-label task instead of a multilabel task.
* we modify a well-known posthoc TS calibration method [7] to work for
  multi-label classification tasks.

# 3 Methodol

* Our goal is not only/but also to 
  * reveal the relationships between the confidence and the accuracy of
    multi-label SER systems
  * calibrate confidence and improve the classification performance of SER
* We add two existing objective functions and 
  * develop one calibration method to train and calibrate multi-label SER

## 3.1. Task Definition and Multi-Hot Label Processing

## 3.2. Class-Balanced Objective Function

* Spontaneous emotional databases collected in natural settings reflect the
  imbalance between emotions in their labels. This is the case for the
  * eg MSP-Podcast corpus (Sec. 4.1), as can be seen in Figure 1. 
  * Most previous studies on SER have ignored imbalanced class distribution,
    which might cause miscalibration in the model predictions. This paper first
* we whether considering class-balanced loss (CBL) during training SER can
  improve classification performance and get better calibrated SER systems.
  * integrate the “class-balanced sigmoid cross-entropy loss” in the study of
    Cui+ [12], but we did not conduct other existing class-balance objective
    functions.
  * The idea is to add a weighting factor to adjust the values of the used loss
    based on the inverses of the class frequency. The factor is 
  * $1−β/1−β^{n_j}$, where nj is the number of positive samples in the j th
    emotion class in the train set, and β ∈ (0, 1] is a hyperparameter.  For
  * The CBL value can be calculated as $\sum factor * L_BCE^(j)$

## 3.3. Loss Function with the Co-occurrence Weight Matrix

* the relationships between emotions are hardly explored
* Chou+ [14] recently proposed an objective function that relies on the
  co-occurrence of emotional classes observed in the individual labels
  provided by the annotator. This cost function 
  * increases the penalty for cases when the models predict infrequent
    co-occurring emotions. The approach 
  * first calculates the K × K co-occurrence matrix by counting the frequencies
  * we, to remove noise in the labels, use the cooccurring emotions after the
    label processing step presented in Section 3.1 (the original implementation
    used all annotations to estimate the co-occurrence matrix).
  * transforms the co-occurrence matrix into a penalization matrix, P .
  * P is integrated into the loss function.
  * We use the BCE variant presented in Chou+ [14] (Eq. 3), where Pjz are the
    entries in matrix P ,.
* Based on the analyses in Chou+ [14], we also use a weight factor, α, in Eq. 4
  to combine the penalized loss function (P L) and the BCE loss (LBCE ), where
  α ∈ R (e.g., 0.2) for better classification performance
  * We did not optimize the alpha value. The penalization matrix can be
    integrated into the classbalanced loss (CBL), and we denote it as the
    LP+CBL in Eq. 5.

## 3.4 3.4. Multi-Label Temperature Scaling Calibration

* The temperature scaling (TS) calibration was originally used to calibrate the
  models’ confidence on single-label tasks
  * We adapt the calibration method for a multi-label task
  * the maximum probabilities of the predictions as the confidence values.
    * following Guo+ [7]
* binary [ie single label?]
  * obtain the predicted probabilities of the model, Y P , which is a N × 2 mx
  * confidence value = the maximum probability of the preds. Then, 
  * we can use the TS value to calibrate the confidence of the predictions. The
    * extract the prediction probabilities from the pre-trained models by
      freezing the models’ weights. Then, we 
    * calculate the logits matrix by using the LogSoftmax activation function.
    * divide the logits vector by the learnable single scalar Temperature (T).
    * the model learns the optimal value for T by minimizing the negative log
      likelihood (NLL) loss on the development set.
* multi-label emotion classification task. We 
  * formulated with multiple binary classification tasks. In this setting, we
  * use the TS calibration approach to learn the scalar parameter for each emo
  * estimate the predicted probabilities of the model, creating N × K
  * convert Its j th column into a N × 2 matrix denoted by Z P (j).
  * The result is a set of K temperatures (T ), one for each emotion.  When T
* When T (j) is larger than 1, it “smooths” the confidence of the predictions.

# 4 Experimental Setting

## 4.2. Speech Emotion Classifier and Implementation Details

* To investigate whether modern SER systems need calibration, 
* we employ the SER architecture proposed by Wagner+ [2].
  * Wagner+ obtained SOTA performance on valence prediction using release 1.7
    of the MSP-Podcast corpus Based on results of the study [2], we choose the
    “wav2vec2-L-robust-12” model, which 
  * only uses the first 12 transformers of the full wav2vec2-large-robust [2].
  * preserves the performance of the full model with half the transformers.
* details
  * one average pooling function for the outputs of the last transfo layer
  * a two-hidden layer with batch normalization, and 
  * one output layer having a sigmoid function
  * We freeze the weights of the convolutional neural network (CNN) layers, and
    fine-tune the parameters of the transformer layers with the MSP-Podcast
  * Adam optimizer with a learning rate of 0.0001 and a batch size of 32. We
  * ten epochs, selecting the best model with the lowest dev loss value 
  * All the other hyper-parameters for training the model are the same as the
    “wav2vec2-L-robust-12” model introduced by Wagner+ [2]. We implement the
  * SER architecture using the HuggingFace library [33]
  * PyTorch using an NVIDIA RTX A6000 GPU.

## 4.3. Evaluation Metric and Statistical Analysis

* we analyze and optimizes both the performance and calibration of the models .
* metrics to study relationships between the accuracy and the confidence of

### Calibration Metric: We use the 

* expected calibration error (ECE) proposed by Guo+ [7] as a metric. The
* a well-used metric to measure the calibration of a model. The ECE 
* can be estimated by the weighted average of the difference between the
  accuracy observed in each bin and its confidence.  Eq. 8 shows this
  * weight: the number of samples in the bth bin.  B X Nb |accuracy b − conf
* The bins split the confidence scores of the predictions into 15 groups (B =
  15) with the same width, fig 2
* For a perfectly calibrated model, having a confidence of 0.6 implies that
  60% of the predictions are correct. We calculate the ECE scores for the
* we report the average across emotions as the final score.

### Classification Performance Metric

* We use the macro-F1 (maF1), micro-F1 (miF1), and weighted-F1 (weF1) scores to

### Statistical Analysis

* We split the test set into 40 subsets to as- sess the stat significance of
  the experimental results
* We report the average predictions of the models across the 40 sub- sets. We
* two-tailed t-test to assign statistical signifi- cance if the p-value≤ 0.05.

# 5 Evaluation

* We evaluate the following loss functions:
  * `L_BCE` (Eq.1): We use the BCE loss to train the SER system.
  * `L_CBL` (Eq.2): We use the CBL loss to train the SER system.
  * `L_P` (Eq.4): We add the PL loss in the loss functions to train the SER
    * α in Eq. 4 = 0.0, 0.2, 0.5, and 0.8.
  * `L_P + CB` (Eq.5): the same setting as the previous scenario, but we
    consider the CBL loss.
