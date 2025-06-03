An Analysis of Annotated Corpora for Emotion Classification in Text
Laura-Ana-Maria Bostan, Roman Klinger
COLING 2018

github.com/sarnthil/unify-emotion-datasets
* a script that downloads and converts the datasets, and
* instrucions on how to obtain datasets where the license requires no redistrib

# Abstract

* datasets annotated and published for classification of emotions differ
  * annotation schemata
    * discrete label sets eg {joy, anger, fear, sadness}
    * continuous values eg {valence, arousal}
  * the domain, and,
  * guidelines and schemata
  * the file formats
* => research gaps: supervised models often only use a subset of the resources
  * no previous work has compared emotion corpora in a systematic manner
* we: a survey of the datasets
  * aggregate them in a common file format with a common annotation schema
  * the first cross-corpus classification experiments
    * some corpora are better classified with models trained on a other corpus
    * For none of the corpora is training on all data altogether better than
      using a subselection of the resources

# 1 Introduction

* Emotion detection and classification = mapping words, sentens, & docs to emos
  * psychological models
    proposed by eg Ekman (1992), Plutchik (1980) or Russell (1980)
  * emerged from a purely research oriented topic
  * applications include
    * dialog systems (chatbots, tutoring systems),
    * intelligent agents,
    * clinical diagnoses of mental disorders (Calvo+, 2017), or
    * social media mining
* domains and differences in text is large
  * tales: empathic storyteller for children stories (Alm+ 2005)
  * Web
    * blogs (Aman and Szpakowicz, 2007)
    * microblogs (Schuff+, 2017; Mohammad, 2012; Wang+, 2012)
  * news articles: Strapparava and Mihalcea (2007) focus on headlines
* annotation procedure
  * crowdsourcing, self-reporting, expert-based, distant labeling
* we perform cross-corpus experiments,
  ie training classifiers on each dataset and evaluating them on others
* contributions
  * describe existing resources,
  * evaluate which SOTA classifiers perform well in a cross-dataset setup
  * evaluate which datasets generalize best to other domains, and
  * compare the datasets qualitatively and quantitatively
* We aim at keeping the unified corpus up to date in the future

# 2 Background & Related work

* tab 1: overview of the resources and previous work
* surveys by Munezero+ (2014) and Santos and Maia (2018) <~ we recommend them
  * Diana Santos and Belinda Maia. 2018
    Language, emotion, and the emotions: A computational introduction.
    Language and Linguistics Compass, 12(6):e12279

## 2.1 Differences in psychological models and annotation schemata

* still debated in psychology (Barrett+, 2018; Cowen and Keltner, 2018)
  * discrete and finite sets of emotions (categorical models) and
  * combinations of different continuous dimensions (dimensional models)
* Early work on emotion detection (Alm+, 2005; Strapparava and Mihalcea, 2007)
  focused on conceptualizing emotions by following Ekman’s model
* Wheel of Emotion (Plutchik, 1980; Plutchik, 2001)
  * followers: 
    Suttles & Ide (2013), Meo & Sulis 2105(2017), & Abdul-Mageed & Ungar (2017) 
  * emotions as a discrete set of eight basic emotions in four opposing pairs:
    joy–sadness, anger–fear, trust–disgust, and anticipation–surprise,
    together with emotion mixtures
* Dimensional models were more recently adopted in NLP
  (Preoţiuc-Pietro+, 2016; Buechel and Hahn, 2017a; Buechel and Hahn, 2017b)
  * The circumplex model (Russell and Mehrabian, 1977)
    puts affective states into a vector space of
    * valence (corresponding to sentiment/polarity),
    * arousal (corresponding to a degree of calmness or excitement), and
    * dominance (perceived degree of control over a given situation)
  * Any emotion is a linear combination of these

## 2.2 annotation procedures

* expert annotation (Aman and Szpakowicz, 2007; Strapparava and Mihalcea, 2007;
  Ghazi+, 2015; Li+, 2017; Schuff+, 2017; Li+, 2017)
* ISEAR dataset: "self reporting"
  * subjects are asked to describe situations associated with a specific emotion
    (Scherer and Wallbott, 1994)
* Crowdsourcing
  * platforms Amazon’s Mechanical Turk1 or CrowdFlower2 , is another way to
  * often lacks sufficient quality control but some 
    * popular datasets have been successfully acquired with this approach, eg
    * Crowdflower for Cortana3 or 
    * the datasets constructed by Milnea+ (2015) and Lapitan+ (2016)
* Mohammad (2012) designs two detailed online questionnaires and
  annotate tweets by crowdsourcing
* social networks ~> distant supervision (aka self-labeling in this context),
  * Mohammad and Kiritchenko, 2015; Abdul-Mageed and Ungar, 2017;
    De Choudhury+, 2012; Liu+, 2017
  * Twitter: one could add a “#joy” hashtag to a happy tweet or on
  * Facebook: one could tag personal posts with a “feeling” and people can show
    an emotional “surprised reaction”
    * ie both the reader’s and the writer’s emotional state
* More challenging is to acquire such data for other domains
* distinguish between writers’ and readers’ emo (Buechel & Hahn 2017a, 2017b)
* some of these assessment approaches exist in parallel
* standardized psychological instruments exist (Bradley and Lang, 1994)

## 2.3 domains and topics

* different domains and topics
  * self reported emotional events (Scherer and Wallbott, 1994)
  * news (Lei+, 2014; Buechel+, 2016)
  * news headlines (Strapparava and Mihalcea, 2007)
  * blogs (Aman and Szpakowicz, 2007)
  * tales (Alm+, 2005)
  * micro-blog posts (ie tweets, Wang+, 2012) to different domains
    * eg health, politics (Mohammad, 2012) and stock markets (Bollen+, 2011)
* Aman and Szpakowicz (2007) use blog posts
  * identify the emotion, category, intensity and cue words and phrases
* Mishne and de Rijke (2005), Balog+ (2006) and Nguyen+ (2014) works on
  LiveJournal data to develop predictive models for moods
* social media
  * electoral tweets annoted (Mohammad+ 2015; Mohammad and Bravo-Marquez 2017b)
    for sentiment, intensity, semantic roles, style, purpose and emo
  * De Choudhury+ (2012) identify more than 200 moods frequent on Twitter
  * Twitter distantly labeled data used by Mohammad (2012), Mohammad+ (2015),
    Wang+ (2012), Volkova and Bachrach (2016)
  * Liu+ (2017) analyzed the role of context that grounds sentiment in tweets,
    * whether the effect of weather and news events relate to the emotion
      expressed in a given tweet
  * EmoNet is claimed to be the largest dataset constructed of tweets
    (Abdul-Mageed and Ungar, 2017)
* Facebook is also used eg
  * Preoţiuc-Pietro+ (2016) create a dataset of Facebook posts and train
    prediction models for valence and arousal
  * Pool and Nissim (2016) and Krebs+ (2017) make use of the reaction feature
    in Facebook to collect labeled data for distant supervision of a classifier
  * Polignano+ (2017) labeled posts with emoticons mapped to Ekman’s model
* dialogues
  * Li+ (2017) manually label a dataset of conversations
  * Wang+ (2016) introduce EmotionPush, a system that automatically conveys the
    emotion of received text on mobile devices, deployed on Facebook’s
    messenger app. From the same domain, but on a different topic is the study
  * patients’ emotional states dynamics expressed by their Facebook posts
    (Lombardo+, 2017)
* emotion in literature. One of the first datasets is the
  * tales corpus by Alm+ (2005)
  * Kim+ (2017): the relationship between literary genres and emotions

## 2.4 prediction methods

### Rule-based Algorithms

* typically builds on top of lexical resources of emotionally charged words
  * transparency and straightforward use
  * These dictionaries can originate from crowdsourcing or expert curation
* expert
  * WordNetAffect (Strapparava+, 2004) and
  * SentiWordNet (Esuli and Sebastiani, 2007), both of which stem from expert
    annotation. Partly built on top of them is the
  * NRC Word-Emotion Association Lexicon (Mohammad+, 2013), which uses the
    eight basic emotions (Plutchik, 1980)
* Warriner+ (2013) use crowdsourcing to assign values of VAD (Russell, 1980)
* concreteness and abstractness (Köper+, 2017)
  * Brysbaert+ (2014) publish a lexicon based on crowdsourcing, where the task
    was to assign a rating from 1 to 5 of the concreteness of 40,000 words
  * Köper and Schulte im Walde (2016) automatically generate affective norms of
    abstractness, arousal, imageability, and valence for 350,000 German lemmas
* Linguistic Inquiry and Word Count (LIWC) is a set of 73 lexicons
  (Pennebaker+, 2001), built to gather aspects of lexical meaning regarding
  psychological tasks
* digital humanities

### 2.4.2 Machine Learning

* features: word n-grams, character n-grams, word embeddings, affect lexicons,
  negation, punctuation, emoticons, or hashtags (Mohammad, 2012)
* classifiers such as naive Bayes, SVM (Mohammad, 2012), MaxEnt and others
* deep learning, SOTA models for emotion classification are often based on
  * Schuff+ (2017) applied
    * models from the classes of CNN, BiLSTM (Schuster and Paliwal, 1997), and
      LSTM (Hochreiter and Schmidhuber, 1997) and
    * compared to linear classifiers (SVM and MaxEnt), where the
    * BiLSTM show best results with the most balanced precision and recall
  * Abdul-Mageed and Ungar (2017) claim the highest F1 following Plutchik’s
    emotion model with gated recurrent unit networks (Chung+, 2015)
* transfer learning; to make use of similar resources and then transfer
  * Felbo+ (2017) present a neural network model trained on emoticons which is
    * transfered to sentiment, sarcasm, and emotions

# 3 Unified Dataset of Emotion Annotations 5

* our interpretation might differ from the author’s original description
  (though we aimed at avoiding that)

## 3.1 Datasets Overview

### AffectiveText (Strapparava and Mihalcea 2007) is built on news headlines

* 1,250 instances
  * Training/developing data amounts to 250, eval on another 1,000 instances
* classification of emotions and valence in news headlines
  * Ekman’s basic emotions, complemented by valence
* multi-label annotated via expert annotation
* free download, the license is not specified
* emotion score from 0 to 100

### Blogs (Aman and Szpakowicz 2007)

* 5,205 sentences from 173 blogs
* Instances are annotated with one emotion label each, emotion intensity and
  emotion indicators
  * six fundamental Ekman emotions to which no emotion is added
* can be obtained through contacting the authors

### CrowdFlower. The dataset “The Emotion in Text, published by CrowdFlower”

* 39,740 tweets
* Part of this data has been used in Microsoft’s Cortana Intelligence Gallery
* The set of labels is non-standard (see Table 4)
* annotated via crowdsourcing with one label per tweet
* free download, the license is not specified
* noisy: the data is comparably noisy

### DailyDialogs (Li+ 2017), is built on conversations

* 13,118 sentences
* Ekman, complemented by “no emotion”
* single label annotated via expert annotation and
* free download for research purposes
* additional annotations for communication intention and topic

### Electoral-Tweets (Mohammad+ 2015)

* 100,000 responses to two detailed online questionnaires
  (target: emotions, purpose, and style in electoral tweets)
* crowdsourcing
* set of labels for emotion is non-standard (see Table 1)
  * 19 emotions and the authors provide a mapping to Plutchik’s set
* annotation level:
  document-level annotations + tweets are annotated with emotion words
* free download for research purposes

### EmoBank (Buechel and Hahn 2017a) builds on multiple genres and domains

* 10,548 sentences manually annotated
* both the emotion which is expressed by the writer/perceived by the readers
* valence-arousal-dominance model
* A subset of the corpus is AffectiveText:
  * both discrete or dimensional representations

### EmoInt (Bravo-Marquez 2017a) builds on social media content

* 7,097 tweets altogether
* main goal: associate text with various intensities of emotion
* crowdsourcing
* intensities of anger, joy, sadness, and fear, while
* most tweets are only annotated with one emotion
* free download for research purposes

### Emotion-Stimulus (Ghazi+ 2015)

* two subsets
  * 820 sentences annotated both with emotions and their causes, and
  * 1,549 sentences marked only with their emotion
* Ekman’s basic emotions + shame
* annotated using FrameNet’s emotions-directed frame with
  one emotion label per sentence
* download for research purposes

### fb-valence-arousal (Preoţiuc-Pietro+ 2016) is built on Facebook posts

* 2,895 posts stratified by age and gender
* valence and arousal, nine point scale, expert annotation,
  available for download
* Each message is written by a distinct user and
  all messages are from the same time interval

### Grounded-Emotions (Liu+ 2017) is built on social media

* 2,557 single labeled instances published by 1,369 unique users
* main goal: context of other factors including
  weather, news events, social network, user predisposition, and timing
* The set of labels is happy and sad
* annotated by the authors

### ISEAR. The “International Survey on Emotion Antecedents and Reactions”

* Scherer and Wallbott (1994)
* questionnaires answered by people with different cultural backgrounds
  * people report on their own emotional events
* 3,000 respondents, for a total of 7,665 sentences labeled with single emo
* labels are joy, fear, anger, sadness, disgust, shame, and guilt
* available for download

### SSEC. The Stance Sentiment Emotion Corpus (Schuff+ 2017)

* an annotation of the SemEval 2016 Twitter stance and sentiment dataset
  (Mohammad+, 2017)
* 4,868 tweets
* The main goal: the relations between emotions and other factors
* expert annotation with multiple emotion labels per tweet following Plutchik
* majority annotation + the individual information for all annotators

### Tales (Alm+ 2005) is built on literature

* 15,302 sentences from 185 fairytales by B. Potter, H.C. Andersen and the
  brothers Grimm
* all annotators agree only on 1,280 sentences
* Ekman’s six basic emotions. In the final data angry and disgust are merged
* free download for research purposes

### Twitter Emotion Corpus (TEC, Mohammad 2012) is built on social media

* 21,051 tweets
* main goal: if emotion-word hashtags can successfully be used as emo labels
* Ekman’s model of basic emotions
  * hashtags corresponding to the six Ekman emotions
    #anger, #disgust, #fear, #happy, #sadness, and #surprise
* ie distantly single-label annotated. It free download for research purposes

## 3.2 Analysis 7

* tab 1
* tab 2: distribution of labels is different in the corpora
  * before and after having applied the mapping to a unique set of emotions
    (see Table 4 in the Appendix A)
  * In many corpora, `joy` dominates, followed by `sadness, surprise, anger`
    * Exceptions are SSEC, Electoral-Tweets, and EmoInt,
      in which negative emotions are more frequent
      * SSEC, this is because of its origin as a stance dataset
      * Electoral-Tweets shows a polarizing nature of political debates with
        `disgust` and `anger` being more common
* Figure 1: a quantitative similarity comparison of the data
  * We represent each dataset by its term distribution, taking the top 5,000
    most common words from each dataset and calculating the cosine similarity
    * inspired by Ruder and Plank (2017) and Plank and Van Noord (2011)
  * Twitter corpora are more similar to each other than to other domains
    * ie EmoInt and CrowdFlower are the most similar to TEC
    * exception of SSEC, which is the most dissimilar to the other tweet dsets
  * DailyDialogs is more similar to the tweets than to ISEAR and Blogs
* column `All` stands for
  the union of all datasets except the one that is being compared to
  * the most dissimilar is
    * AffectiveText
      * a small dataset compared to the tweet-based corpora
      * specific topic, headlines
    * Grounded-Emotions is also notably dissimilar
  * Most similar to All is EmoInt, followed closely by TEC and Blogs, which
    * blog posts and not tweets

## 3.3 Aggregation 8

* To provide a standardized access to the datasets, we define
  {joy, anger, sadness, disgust, fear, trust, surprise, love, confusion,
  anticipation and noemo} as our common label set
  * Where availble from the original publication, we follow proposed mappings
    (eg Electoral-Tweets with 19 emotions and a mapping to Plutchik’s)
  * Table 4 in Appendix A summarizes the mapping
  * We include valence, arousal, and dominance where annotated
    * we do not map the categorical emotion models onto the dimensional ones
* Each instance in the unified dataset contains, in addition, a
  * unique id, the source corpus name, the text, and an assignment of a
  * real number to each of the 11 emotion variables
    * In most datasets, each instance is only annotated discretely with single
      * exceptions are SSEC and AffectiveText
    * multi-labeled datasets: several emotions can be marked
    * For datasets with annotated emotion intensity, values can range 0..1
    * multiple annotator information: we follow the authors' recommendations ie
      * SSEC: accepting a label if at least one annotator assigned it
      * Tales
        * authors provide a gold annotation, `angry` and `disgust` merged
        * We handle them separately, and accept a label iff all annotators agree
      * Blogs, we take the examples of the dataset with the high agreement
  * domain and annotation style information, as well as additional,
  * dataset specific attributes (eg the story from which an instance is)
* Our unified data includes all datasets for which the licenses are available;
  * some datasets are not redistributable, but free to download,
    => we provide a script for interactively download and conversion
* An excerpt of the data is depicted in Appendix B

# 4 Experiments 9

1. within-corpus emotion classification
   * cross-validation
2. pairwise-corpus evaluation: training on the entire (not just train) data of
   one corpus and evaluating on all (not just test) the data of an other one,

## 4.1 Experimental settings

* Previous work: linear classifiers are nearly _en par_ with neural methods
  (Schuff+, 2017)
  => We use maximum entropy classifiers as implemented in scikit-learn with
  bag-of-words (BOW) features for these experiments for simplicity and reproduc
  * L2 regularization and
  * balance the classes in the training data with instance weights
  * Training/test splits are 80%/20%. Cross-validation is 10-folds stratified
  * For datasets in which the labels do not align following our mapping, we use
    the intersection of labels in the train and test data
  * We do not discard any instances
  * For datasets that are designed for other tasks than emotion classification
    such as EmoInt and Emotion-Stimulus, we do not change the setting of our
    classification task
* For experiments in which we transfer from/to, what kind of classif
  * from a multi-label setting to a single-label
    * multiple binary classifiers from which
      we only accept, in the prediction phase, the highest scoring emotion
  * from a single-label setting to a multi-label setting, we as well train
    * separate binary classifiers and
      accept all emotions for which the binary classifiers output one
  * from multi-label to multi-label works analogously
  * from single-label to single-label, we use one multi-class MaxEnt model

## 4.2 Results

### Within-corpus emotion classification. Tab 3 + the diagonal of Figure 2

* should be interpreted in context to the similarity analysis in Figure 1
  * some datasets and domains are more difficult to be modeled than others
* “easiest” dataset seems to be Emotion-Stimulus, followed by EmoInt
  <~ these 2 datasets are constructed for diff tasks (stimulus and intensity)
  ~> our task [formulation?] does not suit these two very well
  * Next are Blogs and DailyDialogs
  * CrowdFlower and Electoral-Tweets seem to be the most challenging
    * For CrowdFlower, the results are due to the larger label set
      * Mostly, the emotions that occur less frequently (like `surprise`) show
      * In addition, manual inspection shows that this data is comparably noisy
      * generally worse performance on Twitter data than on most other domains
* as for annotation procedures: these experiments allow almost for no judgement
  * most of the datasets use expert annotation
  * the crowdsourced datasets are more difficult: might be due to a more noise

### Cross-corpus emotion classification

* lower f1 than the in-corpus results
* exception is Electoral-Tweets, where the same performance is observed by
  training on a different corpus, Blogs
* Models trained on Twitter data perform slightly better on other Twitter sets,
  * exception of Electoral-Tweets <~ different label distribution
    * `disgust` dominating the set
* easy tgt, good src
  * EmoInt, Emotion-Stimulus, Grounded-Emotions ISEAR, and SSEC are
    easier to classify (high performance when used for testing) while
  * DailyDialogs, Blogs, CrowdFlower, and Tales are more informative:
    training on them and classifying other datasets leads to better results
  * Models trained on ISEAR and SSEC perform comparably well
* DailyDialogs best classif with training on other, Blogs
* do not train on Emotion-Stimulus and Grounded-Emotions as long as the
  specific properties of these datasets are not required: bad transfer to other
  * Grounded-Emotions has different labels
  * Emotion-Stimulus was designed for a different purpose
* Pearson corr between the similarity measure and model performance: r = 0.32
  (mediocre)

### All vs one cross-corpus emotion classification: the All column of Figure 2

* classify while training on all the other datasets
* shows which datasets are easier to classify: DailyDialogs, Blogs, and EmoInt
* It might seem intuitive that adding more and diverse training data could be
  helpful in classifying almost all datasets
* Especially difficult
  * the multi-labeled datasets AffectiveText and SSEC
  * the datasets that were the most transformed (ie many labels unified) during
    the aggregation process, such as Electoral-Tweets and CrowdFlower

# 5 Conclusion 10

* opens up the possibility of transfer learning and domain adaptation
  between domains and label sets
* From the collected unified datasets one could learn how to
  * select the most suitable dataset
    for a given new domain and
  * evaluate it across different classification models, domains, and annotation
    procedures, easier than it was possible until now
* this work will help emotion detection to become a standard task
  * similarly to eg sentiment classification, which plays this role already
  * to explore the current state of the emotion analysis field
* future work
  * conversion between the different emotion models
  * transfer learning experiments between datasets, domains, and annot proceds
  * qualitatively analyze the different realizations of emotions
    across annotation schemata and domains
