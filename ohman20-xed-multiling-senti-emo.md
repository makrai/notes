XED: A Multilingual Dataset for Sentiment Analysis and Emotion Detection
Emily Öhman, Marc Pàmies, Kaisla Kajava, Jörg Tiedemann
COLING 2020

https://github.com/Helsinki-NLP/XED

# Abstract

* We introduce XED, a multilingual fine-grained emotion dataset
* human-annotated Finnish (25k) and English sentences (30k), as well as
  projected annotations for 30 additional languages, providing new resources
  for many low-resource languages
* Plutchik’s core emotions to annotate the dataset with the addition of neutral
  * multilabel multiclass dataset
* evaluated using language-specific BERT models and SVMs
  * XED performs on par with other similar datasets
  * a useful tool for sentiment analysis and emotion detection

# 1 Intro

* XED: a cross-lingual fine-grained sentence-level emotion & sentiment dataset
  * parallel manually annotated data for English and Finnish
  * parallel datasets of varying sizes for a total of 32 languages
    created by annotation projection
  * We use Plutchik (1980)’s Wheel of Emotions as our annotation scheme
    (anger, anticipation, disgust, fear, joy, sadness, surprise, trust)
    with the addition of neutral
    on movie subtitle data from OPUS (Lison and Tiedemann, 2016)
* evaluations with
  * fine-tuned cased multilingual and language specific BERT
  * Suport Vector Machines (SVMs)
  * show that
    * the human-annotated datasets behave on par with comparable SOTA datasets
      eg the GoEmotions dataset (Demszky+ 2020)
    * the projected datasets have accuracies that
      closely resemble human-annotated data
      with macro f1 scores of
      0.51 for the human annotated Finnish data and
      0.45 for the projected Finnish data when evaluating with FinBERT
      (Virtanen+ 2019)
* can be used in emotion classification tasks and other applications that can
  benefit from sentiment analysis and emotion detection
  * such as offensive language identification
* data is open source licensed under a Creative Commons Attribution (CC-BY)

# 2 Related work

* Datasets created for sentiment analysis
  * since at least the early 2000s (Mäntylä+ 2018)
  * generally binary or ternary annotation scheme (positive, negative + neut)
  * eg Blitzer+ (2007)
  * traditionally based on review data eg Amazon product reviews, or movie rev
    (Blitzer+ 2007; Maas+ 2011; Turney, 2002)
* emotion: most emotion datasets use Twitter as a source and
  individual tweets as level of granularity
  (Schuff+ 2017; Abdul-Mageed and Ungar, 2017; Mohammad+ 2018)
  * emotion taxonomies used are often based on
    Ekman (1971) and Plutchik (1980, which is partially based on Ekman)

## 2.1 Existing Emotion Datasets

* Bostan and Klinger (2018) analyze 14 existing emotion datasets of which
  * only two are multilabel
    * AffectiveText (Strapparava and Mihalcea, 2007)
    * SSEC (Schuff+ 2017)
* annotation scheme: Nearly all of these datasets based on Ekman (1971; 1992)
  * many adding a few labels often following Plutchik’s theory of emo (1980)
  * A typical emotion dataset consists of 6-8 categories
  * The exception is CrowdFlower with 14 categories
    * created in 2016 but has since been acquired by different companies at
      least twice and is now hard to find. It is currently owned by Appen
  * not mentioned in Bostan+ are eg the
    * SemEval 2018 task 1 subtask c dataset (Mohammad+ 2018) with 11 categs,
      * anger, anticipation, disgust, fear, joy, love, optimism, pessimism,
        sadness, surprise, trust
    * EmoNet with 24 (Abdul-Mageed and Ungar, 2017), and the
    * GoEmotions dataset (Demszky+ 2020) with 27 categories
* tweets and granularity
  * multilabel: A majority of recent papers focus on the SemEval 2018 dataset
    which is based on tweets
  * non-multilabel: Similarly, many of the papers use Twitter data
* Twitter is a good base for emotion classification as tweets are
  * limited in length and generally stand-alone, i.e. the reader or annotator
  * hashtags and emojis are common, which further makes the emotion recognition
    easier for both human annotators and emotion detection and sentiment
    analysis models
* non-twitter
  * Reddit data, as used by Demszky+ (2020), and
  * movie subtitles used by this paper, are
  * not ”selfcontained”
* Reddit comments
  * typically longer than one line and therefore provide some context for
    annotators to go by, but
  * often lacks the hashtags and emojis of twitter and
  * can be quite context-dependent as Reddit comments are by definition
    reactions to a post or another comment
* Movie subtitles annotated out of sequence have virtually no context to aid
  the annotator and are supposed to be accompanied by visual cues as well
  * annotating with context can reduce the accuracy of one’s model
    by doubly weighting surrounding units of granularity
    (roughly ’sentences’ in our case, Boland+ 2013)
  * On the other hand,
    contextual annotations are less frustrating for the annotator and
    => likely provide more annotations in the same amount of time (Öhman, 2020)
* table 1: some of the most significant emotion datasets
  * the paper in which the dataset was released (study),
  * source data used (source),
  * model used to obtain the best evaluation scores (model), the
  * number of categories used for annotation (cat),
  * whether the system was multilabel or not (multi), and the
  * macro f1 scores and accuracy score as reported by the paper
    (macro f1 and accuracy respectively)
    * Some papers only reported a micro f1 and no macro f1 score. These scores
      have been marked with a µ
  * direct comparisons are hard to make
    * the fewer the number of categories, the easier the classification task
    * outlier in these datasets is EmoNet (Abdul-Mageed and Ungar, 2017) which
      achieved astonishing accuracies by using 665 different hashtags to
      automatically categorize 1.6 million tweets into 24 categories
      (Plutchik’s 8 at 3 different intensities), unfortunately
      * hE neither the dataset or their model has been made available
* The downside of training on Twitter: overfitting to domain
  * datasets based on less specific data such as XED and those created by
    Tokuhisa+ (2008) and Demszky+ (2020) are better at crossing domains
    at the cost of evaluation metrics

## 2.2 Annotation Projection [ie translation]

* affect categories are quite universal (Cowen+ 2019; Scherer & Wallbott, 1994)
* they should also be to a large degree retained in translation
* Annotation projection has shown reliable results in some NLP and NLU tasks
  (Kajava+ 2020; Yarowsky+ 2001; Agić+ 2016; Rasooli and Tetreault, 2015)
  * sometimes the only feasible way to produce resources for under-resourced
    * taking datasets created for high-resource languages and projecting these
      results on the corresponding items in the under-resourced
  * using parallel corpora, we can create datasets in many languages
  * A parallel corpus for multiple languages enables the simultaneous creation
    of resources for multiple languages at a low cost
* annotator agreement: even with binary or ternary classification schemes,
  human annotators agree only about 70-80% of the time and
  * the more categories there are, the harder (Boland+ 2013; Mozetič+ 2016)
  * eg DENS dataset (Liu+ 2019), only 21% of their annotations full consensus
    * 73.5% having to resort to majority agreement,
    * 5.5% could not be agreed upon and were left to expert annotators
* Some emotions are also harder to detect, even for humans
  * Demszky+ (2020)
    * admiration, approval, annoyance, gratitude had the highest interrater
      correlations at around 0.6, and
    * grief, relief, pride, nervousness, embarrassment had the lowest
      interrater correlations between 0-0.2, with a
    * vast majority of emotions falling in the range of 0.3-0.5
  * Emotions are also expressed differently in text (Alm+ 2005) with
    * anger and disgust expressed explicitly, and
    * surprise in context
* Some emotions are also more closely correlated
  * In Plutchik’s wheel (1980) related emotions are placed on the same dyad
    * eg for anger as a core emotion, there is also
      * rage that is more intense, but highly correlated with anger, and
      * annoyance which is less intense, but equally correlated
  * map more distinct categories of emotions onto larger wholes
    * even more coarsely: map anger to negative
  * This approach has been employed by for example Abdul-Mageed & Ungar (2017)

# 3 Our datasets

# 4 Evaluation

# 5 Discussion

* these types of tasks are challenging for human annotators alike
* XED is a novel state-of-the-art dataset that provides a new challenge in
  fine-grained emotion detection with previously unavailable language coverage
  * many under-resourced languages
  * large number of annotations at high granularity, as
    most other similar datasets are annotated at a much coarser granularity
* movie subtitles as source data means that
  * possible to use the XED dataset across multiple domains (eg social med)
    as the source data is representative of other domains and
    not as restricted to the domain of the source data (movies) as many other
