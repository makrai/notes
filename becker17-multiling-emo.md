Multiling emotion classif using supervised learning: Comparative experiments
Karin Becker, Viviane P.Moreira, Aline G.L.dos Santos
Information Processing & Management Volume 53, Issue 3, May 2017, Pages 684-704

# Abstract

* emotion mining broadening the potential market already proven for opinion min
* we apply Multilingual Sentiment Analysis to emotions
* experiments involving machine translations over corpora originally written in
  two languages
* Our experimental framework  assesses variations on
  * the language of the original text and its translations;
  * strategies to combine multiple languages to overcome losses due to translat
  * options for data pre-processing
    (tokenization, feature representation and feature selection)
  * classification algorithms, including meta-classifiers
  * performance improve significantly with the use of texts in multiple langs,
    particularly by adopting a stacking of weak monolingual classifiers
  * we shed light into the impacts of data preparation strategies and their
    combination with classification algorithms
  * differences between polarity and emotion classification
    in the same experimental settings

# 1 Intro

* opinion as opposed to sentiment 
  * a positive/negative judgemental attitude towards a given target
  * Opinion mining involves
    * identifying in documents a target,
    * identifying the related subjective piece of text, and
    * classifying the respective sentiment in terms of polarity (neg/pos)
      (Tsytsarau & Palpanas, 2012)
  * A major challenge: establishing the proper correspondence between the
    opinion target and the valence (ie polarity) of the respective sentiment
    (Liu & Zhang, 2013)
* Popular emotion models are
  * basic emotions (Ekman, 1992),
  * emotion dimensions (Russell & Mehrabian, 1977) and
  * cognitive-appraisal categories (Ortony & Turner, 1990)
* applications of emotion mining is increasingly recognized in a full range
  * Mohammad (2016) highlights interesting applications:
    * health (eg, detection of suicidal clues)
    * social analysis (eg, identification of pedophiles)
    * writing assistance (eg, to avoid misinterpretations on emails)
    * education, literary analysis (Mohammad, 2012)
  * electoral tweets annotated for sentiment (Mohammad+ 2015) shows that
    emotions can convey a richer context to understand opinions
    (eg, most negative opinions express disgust)
  * sentiment-based prediction: emotions can be more discriminant than polarity
    (Asur+ 2010, Bollen+ 2011, Tumasjan+ 2010)
  * in the software engineering field, such as
    * detection of burnout/productivity in software projects (Mäntyl+ 2016)
    * identification of software usability from reviews (El-Halees, 2014)
    * relationship between affective states expressed in bug tickets and the
      mean time to solve them (Ortu+ 2015)
* both emo mining and opinion
  * extraction of relevant textual features from documents used to express affc
  * classification of the respective sentiment
* emo opposed to polarity classification (Mohammad, 2016)
  * no consensus on the most appropriate model to classify emotions
  * => resources must be directed towards the model adopted, and
    results are not comparable
  * emotion words are fairly more specific with regard to the affect state
    * a slight change in the vocabulary may result in a different perception
    * polarity: a full range of diverse vocabulary, with very distinct
      semantics, are summarized into a positive/negative label
  * the presence of one emotion does not preclude others, ie,
    * mixed feelings such as surprise and joy are possible even in tiny texts
    * Several opinions may be contained in a single document, but
      from a polarity classification perspective, the task involves
      selecting between mutually exclusive polarity labels
* we investigate whether automatic translation introduces noise
  that affects the recognition of the emotion(s) expressed
  * we focus only on the sentiment classification task based on
    textual features extracted from original/translated texts
* The most common approaches for sentiment analysis are
  machine learning and sentiment lexicons (Tsytsarau & Palpanas, 2012), where
  both require sentiment-based resources (annotated corpora and lexicons, resp)
* Multilingual sentiment analysis (MLSA)
  * generation of polarity-based resources for other languages
    (Banea+ 2008, Molina-González+ 2013, Schulz+ 2010, Steinberger+ 2012);
  * language-independent opinion mining
    (Go+ 2009, Lin+ 2014, Solakidis+ 2014)
  * cross-language opinion mining
    (Hajmohammadi+ 2014, Wan, 2011)
  * machine translation-based opinion mining
    (Balahur+ 2014, Banea+ 2010, Bautin+ 2008)
    * popular, as free, SOTA translators are available
      (eg, Google Translate, Yahoo Babelfish, and Microsoft Bing)
    * fairly accurate results (Balahur+ 2014, Schulz+ 2010)
    * most/other works
      * translations to a single target language
      * combined use of texts in different languages improve polarity classif
        (Balahur+ 2014, Banea+ 2010)
        * as they provide more context to allow for term disambiguation
  * All these MLSA works address sentiments expressed in terms of polarity
  * challenges for an automatic translation approach
    * the specifics of the vocabulary used to express given emos,
    * a given text might convey multiple, concomitant emotions
      * texts that can be interpreted differently when it comes to emotion
    * the validity of previous findings on MLSA for polarity classification
      remains to be confirmed for emotions
* we investigate whether translation-based MLSA also delivers reliable emo
  * using a supervised machine learning approach
  * experiments involving machine translations over corpora originally written
    in two languages (English and Portuguese)
    * corpora annotated according to Ekman’s basic emotions model (Ekman, 1992)
    * automatically translated to French, Spanish and, Portuguese or English
  * we thoroughly analyzed the effects of different
    * data preparation strategies
      (ie, feature extraction, representation, and selection)
    * classification algorithms, including meta-classifiers
* questions:
  1. classification performance of automatically translated texts
    compared to monoling emotion classification
  2. combination of languages to improve emo classif:
    * which combination strategy is better?
  3. Compared to polarity classification results, does
    automatic translation affect emotion classification in different ways?
* findings With regard to translation
  * emotion classification results on automatically translated texts are
    slightly (but still statistically) inferior when compared to the results
    achieved on the original texts, but
  * nL can be improved with the combination of translations of multiple langs
  * stacking (Wolpert, 1992) of multiple monolingual classifiers performed
    better, compared to the combination of features from different languages
  * losses imposed by automatic translat are equiv to those in polarity classif
    * Despite the more specific vocabulary to convey emotions
    * confirms machine translation as an effective approach for different
      types of sentiment analysis, despite their differences
* These are strong evidences derived from an experimental evaluation
  on corpora originally written and annotated in two different languages
  * different data preparation strategies and supervised learning algorithms
  * we extended the analysis framework proposed by Balahur and Turchi (2014) to
    develop a more in-depth analysis of the effects of
    tokenization strategies, feature selection, weighting schemes, and a wider
    variety of classification algorithms, including meta-classifiers

# 2 Related work

# 3 Design of the experiments and their rationale

# 4 Results

# 5 Conclusion and future work
