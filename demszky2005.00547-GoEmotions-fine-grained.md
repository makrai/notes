GoEmotions: A Dataset of Fine-Grained Emotions
Dorottya Demszky, Dana Movshovitz-Attias, J Ko, Alan Cowen, G Nemade, S Ravi
ACL 2020 arXiv:2005.00547 [cs.CL]

# Abstract

* Understand emo for eg empathetic chatbots or detecting harmful online behav
* large-scale datasets with a fine-grained typology
  * adaptable to multiple
* We introduce GoEmotions, the largest manually annotated dataset
  * 58k English Reddit comments, labeled for 27 emotion categories or Neutral
  * We demonstrate the high quality of the annotations
    via Principal Preserved Component Analysis
  * transfer learning experiments with existing emotion benchmarks to show that
    our dataset generalizes well to other domains and different emo taxonomies
* Our BERT-based model achieves an average F1-score of .46 across our taxonomy,
  * much room for improvement

# 1 Intro

* Emotion expression and detection are central to social interaction
  * a handful of words can express subtle and complex emotions
  * affect and emotion have thus been a long-term goal in NLP (Picard, 1997)
* datasets for language-based emotion classification for a variety of domains
  * news headlines (Strapparava and Mihalcea, 2007)
  * tweets (CrowdFlower, 2016; Mohammad+ 2018)
  * narrative sequences (Liu+ 2019)
* hE, existing available datasets are
  * mostly small: up to several thousand instances, and
  * cover a limited emotion taxonomy, with coarse classification into
    Ekman (Ekman, 1992b) or Plutchik (Plutchik, 1980) emotions
* Bostan and Klinger (2018) have aggregated 14 popular emotion classif corpora
  * unified framework allows direct comparison of the existing resources
  * annotation quality gaps in CrowdFlower (2016)
    * the largest manually annotated emotion classification dataset
    * 40K tweets labeled for one of 13 emotions
  * need for a large-scale, consistently labeled emotion dataset over a
    fine-grained taxonomy, with demonstrated high-quality annotations
* we compiled GoEmotions, the largest human annotated dataset
  * 58k carefully selected Reddit comments, labeled for 27 emotion cat or Neut
  * comments extracted from popular English subreddits. Table 1: a sample
  * our emotion taxonomy considering both
    related work in psychology and coverage in our data
  * Ekman’s taxonomy, includes only one positive emotion (joy),
  * our taxonomy includes many positive, negative, and ambiguous emotion categs
  * suitable for downstream conversation understanding tasks
    * for tasks that require a subtle understanding of emotion expression
    * eg analysis of customer feedback or the enhancement of chatbots
* thorough analysis of the annotated data and the annot quality
  * Via Principal Preserved Component Analysis (Cowen+ 2019b), we show
    a strong support for reliable dissociation among all 27 emotion categories,
  * suitable for building an emo classif model
* hierarchical clustering on the emotion judgments, finding that
  * emotions related in intensity cluster together closely and that
  * the toplevel clusters correspond to sentiment categories
  * allow for potential grouping into higher-level categories
    * if desired for a downstream task
* strong baseline for modeling finegrained emotion classification
  * By fine-tuning a BERT-base model (Devlin+ 2019)
  * average F1-score of
    * .46 over our taxonomy
    * .64 over an Ekman-style grouping into six coarse categories and
    * .69 over a sentiment grouping
    * much room for improvement:
      task not yet fully addressed by current SOTA NLU models
* transfer learning experiments with existing emotion benchmarks show that
  our data can generalize to different taxonomies and domains,
  eg tweets and personal narratives
  * given limited additional data labeled for emo classif in spec domains,
    our data can provide baseline emotion understanding
    and contribute to increasing model accuracy for the target domain
* Future work
  * cross-cultural robustness of emotion ratings, and
  * other languages and domains

# 2 Related Work

## 2.1 Emotion Datasets

* emotion datasets vary in size, domain, and taxonomy (Bostan & Klinger, 2018)
* Affective Text (Strapparava and Mihalcea, 2007) was the first benchmark for
  emotion recognition
* majority of emotion datasets are constructed manually
  * The largest manually labeled dataset is CrowdFlower (2016), with
    * 39k labeled examples
    * found by Bostan and Klinger (2018) to be noisy in comparison with other
* automatically weakly-labeled, based on emotion-related hashtags on Twitter
  (Wang+ 2012; Abdul-Mageed and Ungar, 2017)
* We build our dataset manually, making it the largest human annotated
  * multiple annotations per example for quality assurance
* domains
  * Twitter: informal language and expressive content, such as emojis and hashtag
  * news headlines (Strapparava and Mihalcea, 2007)
  * dialogs (Li+ 2017)
  * fairytales (Alm+ 2005)
  * movie subtitles (Öhman+ 2018)
  * sentences based on FrameNet (Ghazi+ 2015)
  * self-reported experiences (Scherer and Wallbott, 1994)
  * Reddit comments: We are the first to use them for emotion prediction

## 2.2 Emotion Taxonomy

* The vast majority of existing datasets contain annotations for
  * minor variations of the 6 basic emotion categories by Ekman (1992a) and/or
    * joy, anger, fear, sadness, disgust, and surprise
  * along affective dimensions (valence and arousal) that underpin the
    circumplex model of affect (Russell, 2003; Buechel and Hahn, 2017)
* Recent advances in psychology have offered
  new conceptual and methodological approaches to capturing the
  more complex “semantic space” of emotion (Cowen+ 2019a) by studying the
  distribution of emotion responses to a diverse array of stimuli
  via computational techniques
  * 27 distinct varieties of emotional experience conveyed by short videos
    (Cowen and Keltner, 2017)
  * 13 by music (Cowen+ in press)
  * 28 by facial expression (Cowen and Keltner, 2019)
  * 12 by speech prosody (Cowen+ 2019b)
  * 24 by nonverbal vocalization (Cowen+ 2018). In this work, we build on these

## 2.3 Emotion Classification Models

* feature-based and neural models have been used for automatic emotion classif
  * Feature-based models often make use of handbuilt lexicons, such as the
    Valence Arousal Dominance Lexicon (Mohammad, 2018)
  * BERT (Devlin+ 2019) reached SOTA perf on several tasks, including emotion
    * the top-performing models in the EmotionX Challenge (Hsu and Ku, 2018)
      all employed a pre-trained BERT model. We also use the BERT model
    * we find that BERT outperforms our biLSTM model

# 3 GoEmotions

## 3.1 Selecting & Curating Reddit comments

## 3.2 Taxonomy of Emotions: we seek to jointly maximize the following

1. greatest coverage in terms of emotions expressed in our data
   * we manually labeled a small subset of the data, and ran a pilot task where
     raters can suggest emotion labels on top of the pre-defined set
2. greatest coverage in terms of kinds of emotional expression
  * We consult psychology literature on emotion expression and recognition
    (Plutchik, 1980; Cowen and Keltner, 2017; Cowen+ 2019b)
  * no research that identifies principal categories for emo recog from text
    * see Section 2.2
    * we consider those emotions that
      * identified as basic in other domains (video and speech) and that 
      * apply to text as well
3. Limit overlap among emotions and limit the number of emotions
  * not include emotions that are too similar
    * makes the annotation task more difficult
    * combinations would result in an explosion in annotated labels
* The final set of selected emotions is listed in Table 4, and Figure 1
  * Appendix B for more details on our multi-step taxonomy selection procedure

## 3.3 Annotation

# 4 Data Analysis

## 4.1 Interrater Correlation

## 4.2 Correlation Among Emotions

* We obtain N dimensional vectors for each emotion by averaging raters’
  judgments for all examples labeled with that emotion. We calculate Pearson
* Figure 2 shows that 
  * emotions that are related in intensity (e.g. annoyance and anger, joy and
    excitement, nervousness and fear) have a strong positive correlation.
  * emotions that have the opposite sentiment are neg- atively correlated.
* We also perform hierarchical clustering to un- cover the nested structure of
  * We use correlation as a distance metric and ward as a linkage method,
* dendrogram on the top of Figure 2 shows that 
  * emotions that are related by intensity are neighbors, and that 
  * larger clusters map closely onto sentiment categories. Interestingly,
  * emotions that we labeled as “ambiguous” in terms of sentiment (e.g. sur-
    prise) are closer to the positive than to the negative category. This
    * ie in our data, ambiguous emotions are more likely to occur in the
      context of positive sentiment than that of negative sentiment.

## 4.3 Principal Preserved Component Analysis

* To better understand
  agreement among raters and the latent structure of the emotion space,
  we apply Principal Preserved Component Analysis (PPCA, Cowen+ 2019b)
  * extracts linear combinations of attributes (here, emotion judgments), that
    maximally covary across two sets of data that measure the same attributes
    (here, randomly split judgments for each example)
  * allows us to uncover latent dimensions of emotion
    that have high agreement across raters
* Unlike Principal Component Analysis (PCA), PPCA examines the cross-covariance
  between datasets
  rather than the variance-covariance matrix within a single dataset
* We obtain the principal preserved components (PPCs) of two datasets
  (matrices) X, Y ∈ RN ×|E| , where
  N is the number of examples and
  |E| is the number of emotions,
  by calculating the eigenvectors of the symmetrized cross covariance matrix
  X T Y + Y T X

## 4.4 Linguistic Correlates of Emotions

* We extract the lexical correlates of each emotion by calculating the
  log odds ratio, informative Dirichlet prior (Monroe+ 2008) of all tokens for
  each emotion category contrasting to all other emotions
  * Since the log odds are z-scored,
    all values greater than 3 indicate highly significant (>3 std) association
    with the corresponding emotion
* We list the top 5 tokens for each category in Table 3
  * those emotions that are highly significantly associated with certain tokens
    (eg gratitude with “thanks”, amusement with “lol”) tend to
    have the highest interrater correlation (see Figure 1)
  * Conversely, emotions that have fewer significantly associated tokens
    (eg grief and nervousness) tend to have low interrater correlation
  * ie certain emotions are more verbally implicit and may require more context

# 5 Modeling

## 5.1 Data Preparation

### Grouping emotions. We create a hierarchical grouping of our taxonomy

* we evaluate the model performance on each level of the hierarchy
* sentiment level: 4 categories – positive, negative, ambiguous and Neutral –
  * Neutral category intact, and the rest of the mapping as shown in Figure 2
* Ekman level: the Neutral label and the following 6 groups:
  * anger (anger, annoyance, disapproval), 
  * disgust (disgust),
  * fear (fear, nervousness), 
  * joy (all positive emotions),
  * sadness (sadness, disappointment, embarrassment, grief, remorse) and
  * surprise (all ambiguous emotions)

## 5.2 Model Architecture

## 5.3 Parameter Settings

## 5.4 Results

# 6 Transfer Learning Experiments

## 6.1 Emotion Benchmark Datasets

## 6.2 Experimental Setup

## 6.3 Results
