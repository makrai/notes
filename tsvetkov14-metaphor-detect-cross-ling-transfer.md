Yulia Tsvetkov, Leonid Boytsov, Anatole Gershman, Eric Nyberg, Chris Dyer
Metaphor Detection with Cross-Lingual Model Transfer
2014

# Abstract

* whether a syntactic construction is meant literally or metaphorically
* using lexical semantic features of the words
* we
  * obtain state-of-the-art performance
  * model transfer approach by pivoting through a bilingual dictionary
    * identify metaphoric expressions in other languages
    * three new test sets in Spanish, Farsi, and Russian
* conclusion: metaphors are conceptual, rather than lexical, in nature

# 1 Intro

* Lakoff and Johnson (1980) characterize metaphor
* importance
  * proportion of words used metaphorically ranges from 5% to 20%
    (Steen+ 2010)
  * choice of metaphors affects decision making (Thibodeau and Boroditsky 2011)
* applications
  * information extraction, machine translation, dialog systems,
    sentiment analysis, and text analytics
* problem
  * subjective component: humans may disagree (Shutova, 2010)
  * [whether a phrase is metaphorical can be] context-dependent
* approaches
  * manually created linguistic resources (Mason, 2004; Gedigian+ 2006;
    Krishnakumaran and Zhu, 2007; Turney+ 2011; Broadwell+ 2013) and
  * corpus-based approaches (Birke and Sarkar, 2007; Shutova+ 2013; 
    Neuman+ 2013; Shutova and Sun, 2013; Hovy+ 2013)
* We
  * develop a new state-of-the-art English metaphor detection system that
    * uses conceptual semantic features
      e.g. degree of abstractness and semantic supersenses
  * create new metaphor-annotated corpora for Russian and English
  * provide support for the hypothesis that metaphors are conceptual
    * using a paradigm of model transfer
      (McDonald+ 2011; Täckström+ 2013; Kozhenikov and Titov, 2013)

# 2 Methodology

* two syntactic constructions:
  * subject-verb-object (SVO) and
  * adjective-noun (AN) tuples
  * account for a substantial proportion of all metaphoric expressions,
    approximately 60% and 24%, respectively
    (Shutova and Teufel, 2010; Gandy+ 2013)
* we will use coarse-grained conceptual [features],
  rather than fine-grained lexical features, in our classifier
  * Conceptual features pertain to concepts and ideas
    as opposed to individual words or phrases ... in a particular language
* Each SVO (or AN) instance will be represented by a triple (duple) from which
  * feature vector ... consist of the concatenation of the
    * conceptual features (which we discuss below) for all participating words,
    * conjunction features for word pairs. 6
  * For example, to generate the feature vector for the SVO triple
    `(car, drink, gasoline)`, we compute
    * all the features for the individual words car, drink, gasoline and
    * the conjunction features for the pairs car drink and drink gasoline
* three main feature categories
  1. abstractness and imageability
    * shown to be useful in detection of metaphors
      (it is easier to invoke mental pictures of concrete and imageable words)
      (Turney+ 2011; Broadwell+ 2013)
      We expect that abstractness, used in conjunction features
      (e.g., ... that the subject is abstract and the verb is concrete),
      is especially useful
    * Although often correlated with abstractness,
      imageability is not a redundant property e.g.,
      * _vengeance_ `bosszú` calls up an emotional image,
      * _torture_ calls up emotions and even visual images
      * concrete things that are hard to visualize too, for example,
      * e.g. abbey is harder to visualize than banana
        (B. MacWhinney, personal communication)
  2. supersenses
    * coarse semantic categories originating in WordNet
      45 classes: 26 for nouns and 15 for verbs, for example,
      e.g. noun.body, noun.animal, verb.consumption, or verb.motion
      (Ciaramita and Altun, 2006)
    * English _adjectives_ do not, as yet, have a [supersense] partitioning in
      WordNet, thus
      we use a 13-class taxonomy of adjective supersenses (Tsvetkov+ 2014)
    * preserved in translation (Schneider+ 2013),
  3. unsupervised vector-space word representations

# 3 Model and Feature Extraction

## Classification using Random Forests

* random forest classifier (Breiman, 2001),
  * an ensemble of decision tree classifiers
    learned from many independent subsamples of the training data
    Given an input, each tree classifier assigns a probability to each label;
    those probabilities are averaged to compute the probability distribution
  * particularly suitable [to avoid] overfitting,
    they produce a limiting value of the generalization error
    as the number of trees increases, and
    * no hyperparameter tuning is required
  * learn non-linear responses to inputs and
    often outperform logistic regression (Perlich+ 2003)
  * probability ... threshold
  * scikit-learn toolkit to train our classifiers (Pedregosa+ 2011)

## Feature extraction

* The MRC psycholinguistic database is a large dictionary listing linguistic
  and psycholinguistic attributes obtained experimentally (Wilson, 1988)
  * among other data, [abstractness and] imageability
* Similarly to Tsvetkov+ (2013), we use a logistic regression classifier 
  to propagate abstractness and imageability scores from MRC ratings 
  to all words for which we have vector space representations
* We binarize these posteriors into abstract-concrete (or (un)imageable) 
  [using] thresholds .8 and .9
* Supersenses of nouns and verbs
  * A lexical item can belong to several synsets, which are associated with
    different supersenses
    * Degrees of membership in different supersenses are represented by feature
      vectors, where each element corresponds to one supersense
    * [e.g. the noun] _head_ ... participates in 33 synsets,
      three of which are related to the supersense noun.body
      The value of the feature corresponding to this supersense is 3/33 ≈ 0.09
* Supersenses of adjectives
  * WordNet lacks coarse-grained semantic categories for adjectives
  * Tsvetkov+ (2014) use 13 top-level classes
    from the adapted taxonomy of Hundsnurscher and Splett (1982), which is
    incorporated in GermaNet (Hamp and Feldweg, 1997)
    * For example, the top-level classes in GermaNet include:
      adj.feeling (e.g., willing, pleasant, cheerful);
      adj.substance (e.g., dry, ripe, creamy);
      adj.spatial (e.g., adjacent, gigantic)
  * For each adjective type in WordNet, they produce a vector with a classifier
    posterior probabilities corresponding to degrees of membership of this word
    in one of the 13 semantic classes,
    similar to the feature vectors we build for nouns and verbs
    * e.g. for _calm_ the top-2 categories ... are adj.behavior and adj.feeling

## Vector space word representations

We employ 64-dimensional vector-space word representations
  * constructed by Faruqui and Dyer (2014). Vector construction algorithm is a
  * variation on traditional latent semantic analysis (Deerwester+ 1990)
  * uses multilingual information to produce representations

## Cross-lingual feature projection

* We used the Babylon dictionary, which is a proprietary resource, but
  any bilingual dictionary can in principle be used
* For a non-English word in a source language, we
  1. obtain all translations into English
  2. average all feature vectors related to these translations
  * e.g a Russian word ... is translated as `head` and `brain1`
    There are 38 such synsets (33 for head and 5 for brain)
    Four of these synsets are associated with the supersense noun.body
    Therefore, the value of the feature noun.body is 4/38 ≈ 0.11

# 4 Dataset

## 4.1 English training sets

* To train an SVO metaphor classifier, we employ the TroFi (Trope Finder)
  dataset
  * 3,737 manually annotated English sentences from the Wall Street Journal
    (Birke and Sarkar, 2007).  Each sentence contains either
  * literal or metaphorical use for one of 50 English verbs
  * we
    1. use a dependency parser (Martins+ 2010) to extract SVO relations. Then
    2. filter extracted relations to eliminate parsing-related errors, and
       relations with verbs which are not in the TroFi verb list
    * After filtering, there are 953 metaphorical and 656 literal SVO relations
* In the case of AN relations, we construct and make publicly available a
  training set containing 
    * 884 metaphorical AN pairs and 884 pairs with literal meaning. It was
    * collected by two annotators using public resources (collections of
      metaphors on the web)
    * [cleaned] by removing duplicates, weak metaphors, and metaphorical
      phrases ... whose interpretation depends on the context

## Multilingual test sets

* We
  * collect and annotate metaphoric and literal test sentences in four langs
  * compile eight test datasets, four for SVO relations, and four for AN
* Each dataset [is balanced for] metaphors and non-metaphors,
* English (EN) and Russian (RU) datasets have been compiled by our team and are
  publicly available
* Spanish (ES) and Farsi (FA) datasets are published elsewhere
  (Levin+ 2014, Lori Levin, not Beth Levin)
* procedure to compile the EN and RU test sets
  * seed lists of 1000 most common verbs and adjectives
  * extract sentences with words that frequently co-occurred with [seed] words
    * SketchEngine, TenTen Web corpus
    * removed sentences
      * that contained more than one metaphor [candidate?]
      * with non-SVO and non-AN metaphors
    * Remaining sentences were annotated by several native speakers
      * we filtered out low-agreement (<.8) sentences
      * test candidate sentences were selected by a person
        who did not participate in the selection of the training samples

# 5 Experiments

* performance of the three feature categories and their combinations
  * accuracy in the 10-fold cross validation
* performance over previous state-of-the-art results
  * SVO task, the cross-validation accuracy is about 10% better than that of
    Tsvetkov+ (2013)
  * AN task, the cross validation accuracy is better by 8% than Turney+ (2011)

## English experiments

* experiments on out-of-domain data are crucial
  * suggests that our classifier is portable across domains and genres
* Abstractness and Imageability features work better for adjectives and nouns,
  which is in line with previous findings
  (Turney+ 2011; Broadwell+ 2013)
* VSM features are very effective
  * in line with results of Hovy+ (2013)

## Comparison to baselines

* In this section, we compare our method to state-ofthe-art methods of
  Tsvetkov+ (2013) and of Turney+ (2011), who focused on
  classifying SVO and AN relations, respectively
  * SVO: Our approach is different from that of Tsvetkov+ (2013)
    * additional features (vector space word representations) and a
    * different classification method (we use random forests while
      Tsvetkov+ (2013) use logistic regression)
  * AN: Turney+ (2011) train logistic-regression employing
    only abstractness ratings as features
    * almost all of the judge-specific f-scores are slightly higher for our
      system,

## Cross-lingual experiments

## Examples

diaper `pelenka`

# Related Work

* a historic overview and a survey of common approaches to metaphor detection,
  (Shutova, 2010; Shutova+ 2013). Here we focus only on recent approaches
* Shutova+ (2010)
  * starts from a set of seed metaphors and seeks phrases where verbs and/or
    nouns belong to the same cluster as verbs or nouns in seed examples
* Turney+ (2011)
  * abstractness scores ... used to detect metaphorical AN phrases
* Neuman+ (2013) describe a Concrete Category Overlap algorithm, where
  co-occurrence statistics and Turney’s abstractness scores are used to
  determine WordNet supersenses that correspond to literal usage of a given
  adjective or verb
* Broadwell+ (2013)
  * idea: metaphors are highly imageable words
    that do not belong to [the] discussion topic
  * they extend MRC imageability scores to all dictionary words using links
    among WordNet supersenses (mostly hypernym and hyponym relations)
* Strzalkowski+ (2013)
  * experiments in a specific (government-related) domain
  * four languages: English, Spanish, Farsi, and Russian
* Hovy+ (2013)
  * tree kernels [and] WordNet supersenses
  * not ... restricted to detection of only SVO and AN
* Tsvetkov+ (2013)
* WSD
  * most cross-lingual WSD methods employ parallel corpora (Navigli, 2009)

# 7 Conclusion

* Future work
  * including nominal metaphoric relations
  * incorporating contextual features
  * more careful cross-lingual feature projection
