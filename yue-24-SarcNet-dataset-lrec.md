SarcNet: A Multilingual Multimodal Sarcasm Detection Dataset
Tan Yue, Xuzhao Shi, Rui Mao, Zonghai Hu, Erik Cambria
joint LREC-COLING 2024 Torino, Italia

# Abstract

* the first multilingual and multimodal sarcasm detection dataset.
* social networks have propelled the utilization of multimodal data
* multimodal sarcasm detection datasets, 
* a single label is assigned to a multimodal instance
* may be not suitable for the associated text or image. In
* SarcNet, a multilingual and multimodal sarcasm detection dataset in English
  and Chinese, consisting of 3,335 image-text pair samples. We provide
  * annotations for sarcasm in visual, textual, and multimodal data,
  * facilitates a more accurate and reasonable assessment of uniand multimodal
* 10,000 labeled instances

# 1 Intro

* Sarcasm: to mock, insult, or convey contempt by expressing the opposite of
  what is meant. 
* extensively utilized in social media Because of its pragmatic effect in
  conveying opinions and sentiments (Mao+ 2022, 2023b), sarcasm is 
* textual + image content (Cambria+ 2017; Yue+ 2021; Frenda+ 2022).
  * Both modalities can provide clues for detecting the conflict (Yue+ 2023).
* unimodal analysis methods overlook the intricate interactions (Wang+ 2022)
* multimodal information fusion (Radford+ 2021; Yue+ 2022b; Gandhi+ 2023),
  yielding notable advancements.
* dataset quality, 
  * a majority of these studies have relied on a single dataset for
    * potentially inconclusive findings and raising 
    * concerns regarding the generalization capabilities of several models
      (Xu+ 2020; Pan+ 2020; Wang+ 2020; Liang+ 2022)
  * only English text, which is insufficient for social networks that contain
    multiple languages.
  * a growing appeal within the research community for the development of new
    datasets to propel advancements in the field (Liu+ 2022).
  * shortcomings in the labeling method. The existing labeling method only
    defines a unified label for a multimodal instance. The subsequent
    * ? use the unified label to test both unimodal and multimodal models.
* eg Tab 1
  * the factual information (a picture of a cloudy day) and 
  * the statement made (wonderful weather), as elements
  * the ground truth label set of the given multimodal instance should be
    {0, 0, 1}, denoting {image label, text label, multimodal label}, respec-
  * other cases such as {0, 1, 1} or {1, 0, 1}, see Section 3.3.
* SarcNet, a new multilingual and multimodal sarcasm detection dataset,
  * 3,335 image-text pairs in English (1,270) and Chinese (2,065). We label
  * 3 x n  = 10,005 labels
  * two independent annotators, Each sample is cross-labeled by
  * substantial or higher levels of agreement in the annotation tasks, as
    * Cohen’s Kappa values of 0.9032, 0.7129, and 0.9769 for textual, visual,
      and multimodal labels, respectively.
* benchmark models: Well-known unimodal and multimodal
  * image data, we examined CNN-based (ResNet) and Transformer-based (ViT)
  * text data were evaluated using CNN, RNN, and Transformers.
  * Transformerbased models such as XLM-RoBERTa, endowed with a larger
    number of parameters, achieved superior accuracy (76.88%) and F1-score
    (73.36%).
  * Multimodal models facilitate enhanced integration of image and text
    information, resulting in improved performance, with 
    DT4MID leveraging XLM-RoBERTa attaining the best results (accuracy of
    82.73% and F1-score of 84.40%).

# 2. Related Works

## 2.1. Multimodal Sarcasm Detection

* beginning: textual data (Riloff+ 2013), utilizing techniques such as
  sentiment analysis, contextual embeddings, and linguistic feature extraction
  (Ghosh and Veale, 2016; Baziotis+ 2018). Models like 
  * BERT (Devlin+ 2019) achieving significant progress in this domain.
* in social media platforms, text often coexists with images and the
  * multimodal affective computing (Fan+ 2024), there is a need for multimodal
  * Schifanella+ (2016) introduced combining visual and textual information,
  * Cai+ (2019) presented a hierarchical fusion model. Subsequent studies have
* models capable of processing both text and images, such as 
  * eg CLIP (Radford+ 2021) and BLIP-2 (Li+ 2023), has provided more
    approaches for multimodal sarcasm detection. These models utilize the
    complementary nature of information in visual and textual data to enable a
  * pre-training on a large amount of multimodal data, these models can get
    better joint representation and semantic alignment of image-text
* attention mechanisms and fusion strategies has been instrumental in refining
  * Attention mechanisms allow models to weigh the importance of different
    modalities, while 
  * fusion strategies enable the effective integration of multimodal features.
  * Pan+ (2020): a BERT-based model, incorporating inter-modality attention to
    * discern both intra and inter-modality incongruities. Similarly, 
  * Wang+ (2020) developed a 2D-Intra-Attention mechanism to extract the
    relationships between text and images.
  * DT4MID (Tomás+ 2023) integrated textual and visual transformers within a
    deep neural network framework to achieve superior multimodal in-
  * Malik+ (2023) conducted an analysis to ascertain the necessity of image
    information in comprehending the sarcastic intent embedded within the
    text. 
  * Research has sought to optimize the balance between text and image,

## 2.2. Dataset Limitation and Motivation

* Most current multimodal sarcasm detection models (Pan+ 2020; Wang et al.,
  2020; Liang+ 2021; Liu+ 2022) are tested using only one dataset
  * The dataset was developed by Cai+ (2019), containing image and text data
    from Twitter.
* single-language textual data and inappropriate labeling schema restrict
  evaluation and interpretability in multimodal sarcasm detection.

# 3 SarcNet-Dataset

## 3.1. Dataset Collection and Annotation

* We collected 3,335 samples from WeiBo and Twitter in total. The data were
  by searching topics such as “#irony”, “#sarcasm”, and
  “# 讽刺” (sarcasm in Chinese)

## 3.2. Quality Control

* To assess the quality of our data annotation, we employ Cohen’s Kappa

## 3.3. Dataset Analysis

* there are a few cases with
  non-sarcastic multimodal labels and sarcastic unimodal labels such as
  {0, 1, 0} or {1, 0, 0}. 
  * {1, 0, 0}: When there exists information about sarcasm in the image
    but the textual content has stated that it is being sarcastic, we do not
    * e.g., “I asked MemeCreator to generate a sarcastic image” (non-sarcastic
      text) with a sarcastic image (). The instances with 
  * {0, 1, 0} labels are typically due to the
    very weak connections between text and images. As a result, 
    * their combina- tions cannot be identified as sarcasm.
