Explanation in Computational Stylometry
Walter Daelemans
2013 International Conference on Intelligent Text Processing

# Abstract

* applications in diverse areas
  * literary science, forensics, language psychology, sociolinguistics, even
    medical diagnosis
* many of the basic research questions are not studied systematically
* we suggest a reinterpretation of current and historical methods
  in the framework and methodology of machine learning of NLP

# 1 Meta-knowledge Extraction from Text

* factors. Content (topic), text type (genre, register)
  * psychological
    * personality, mental health, and being a native speaker or not;
  * sociological aspects of the author of the text
    * age, gender, education level, and region of language acquisition
* different linguistic levels
  * lexical choice, syntactic structures, discourse coherence
* It remains to be seen whether
  * the correlations are consistent over time
  * there are style features that are unconscious and cannot be controlled
* can be used to develop systems that detect
  * the identity of authors (authorship attribution and verification) or
  * their psychological or sociological properties (profiling)
* potentially useful in many areas: literary science, sociolinguistic research,
  language psychology, social psychology, forensics, medical diagnosis
* introductions to modern computational methods in stylometry
  2. Stamatatos, E. (2009) A survey of modern authorship attribution methods
  3. Koppel, M., Schler, J., Argamon, S.:
    Computational methods in authorship attribution. JASIST 60(1) (2008) 9–26
  4. Juola, P.:
    Author attribution. Foundations and Trends in Information Retrieval
    1(3) (2008) 233–334
  5. Pennebaker, J. (2011) The Secret Life of Pronouns
* Feature types include simple character n-grams, punctuation, token n-grams,
  semantic and syntactic class distributions and patterns, parse trees,
  complexity and vocabulary richness measures, and even discourse features
* three types of knowledge we distinguish that can be extracted from text are:
  * objective knowledge (answering the who, what, where, when, questions),
  * subjective knowledge (who has which sentiment or opinion about what?),
  * metaknowledge (what can we extract about the author?)
    * Computational stylometry belongs in the latter category
* much computational stylometry research is still linked to
  * automatic text categorization (Sebastiani 2002)
    * used in document filtering and routing applications
  * rather than to supervised machine learning of language
    (unsupervised and semi-supervised learning methods will not be discussed
    here)
* A good example of reinterpretation in ML terms
  * reinterpretation of Burrow’s delta as memory-based learning [11]
    leads to increased understanding of the method and to new useful variations
  * unmasking [12] and variants would be framed as instances of
    stacked classifiers and ensemble learning
* In a supervised machine learning approach to computational stylometry, we have
  * features, feature selection, weighting and construction methods,
    machine learning algorithm optimization,
  * ensemble methods, active learning, joint learning, structured learning,
    one-class learning etc
  * evaluation methods
*  modern authorship studies have not yet produced solid, scientific, and
   steadily progressing studies (Rudman 1997; 2010)

# 2 Problems in Computational Stylometry 4

* unsolved basic research questions we will not go into in this paper
  * Is style invariant or does it change with age and language experience?
    * see (Stamou, 2008) for an overview
    * no large-scale systematic studies
    * individual style changes over time, which seems to be the case
  * Is style largely unconscious or can it be imitated?
    * adversarial stylometry, but not enough work for clear conclusions
    * obfuscation reduces authorship identification methods to random behaviour
      (Brennan+ 2012)

## short texts and Character n-grams

* Authorship attribution and profiling work reasonably well when
  large amounts of text are available, and
  few candidate authors for an unattributed text are present
  * with short texts (e.g. or e-mails), and many potential authors
    attribution accuracy quickly decreases to levels that are too low for
    practical applications (Luyckx, K., Daelemans, 2011)
* simple character n-grams are more scalable than lexical and syntactic
* More work on scalability (with better reported results) in (Koppel+ 2011)
* scalability issues apply to profiling in computational stylometry
* character n-grams
  * often outperform more complex feature sets (Luyckx+ 2011)
  * combine information about punctuation, morphology, lexicon (function
    words are often short), context (when extracting n-grams at sentence level)
* authorship attribution should not be framed as a multi-class learning
  * but as a binary _one-class_ learning problem (Luyckx+ 11)
  * the fundamental problem: ‘Given two (possibly short) documents,
    determine if they were written by a single author (Koppel 12)

## 2.2 Cross-genre stylometry 5

* how style, content, and genre interact (Koppel+ 2012)
* “unmasking” technique (Koppel +07; Stein+ 11)
  * we want to verify that a text X was written by the author of a text A
  * split both texts in chunks, and train a classifier to distinguish
  * If we get low generalization accuracy, X and A were probably written by
  * not to work very well because a limited number of features can wrongfully
    maximize the differences between two texts written by the same author
  * As a solution, [12] proposed a stacked classifier approach, in which a new
    classifier is built by removing the most discriminative features
  * works well for longer texts and for plagiarism detection, but
    not for shorter texts below 10,000 words in size [25]
  * didn’t work very well for the cross-genre case

## 2.3 Explanation

* In early profiling work on gender assignment, Koppel+ (03) provided a
  plausible explanation for their success in distinguishing male from female
  * women use more relational language, and
  * men more informative (descriptive) language
    * more frequent use of nouns, determiners, prepositions etc.  Figure 1
    * similar frequent features in Dutch

# 3 Detecting Harmful Content in Social Media

* identify possibly threatening situations in social networks sites (SNS)
  by text and image analysis
  * (especially for children and adolescents)
  * cyberbullying, sexually transgressive behavior, and
    depression and suicidal behavior
* as instances of computational stylometry
  * e.g. for the detection of transgressive behavior by pedophiles,
    detect age and gender of the text in order
    to check the information provided in the profile
* challenging because the utterances are short and written in chat language
* shown how much different chat language is from standard language
  for different age groups, genders and regions in the chat data
* CLEF, a shared task was organized in 2012 on pedophile detection
  * illustrates many of the problems with data collection in shared tasks
  * By collecting negative and positive data from different sources
