Audrey Tong, Craig Greenberg, Alvin Martin, Desire Banse, Hui Zhao, George
    Doddington, Daniel Garcia-Romero, Alan McCree, Douglas Reynolds, Elliot
    Singer, Jaime Hernandez-Cordero and Lisa Mason.
Summary of the 
  2015 NIST Language Recognition i-Vector Machine Learning Challenge
2016

## 1 Intro

* task definition: open set
  * The task for the i-vector LRE was language identification instead of lan-
    guage detection. The language identification task was an Nclass problem
    where the system was given the test segment and a list of possible
    languages and was asked to determine which language in the list was spoken
    in the segment, whereas the language detection was a two-class problem
* in section 4
  * We summarize the participation and 
  * briefly mention the approach used by the system with the best performance
* section 5
  * We discuss differences with the traditional track LREs

## 2. Data

* for each of the 65 languages, 
  * 100 random recordings/files were selected for the _test_ set, then 
  * 100 files (or the remainder if less than 100) for the _development_ set, and
  * 300 files (or remainder if less than 300) for the _training_ set after the
    * requirements for the test and development sets were met.  
* This algorithm produced 
  * 65 languages for test and development and 
  * 59 languages for training. 
    * The six languages included in test/development but not in training were
      designated as _out-of-set_
* a confusion matrix was computed for the 59 languages. The pairs of languages
  were ordered from most to least confusable pairs. Every other pair was
  selected, with one language in the pair going into the out-of-set group
  unless that language was already in the group. This yielded an additional
  nine languages for the out-of-set for a total of 15, reducing the training
  set to 50 languages designated as target languages.
* train
  * Language labels were given with the training set for the 50 target
    languages
* devel
  * no language labels were given for the development set. The development set
    intended to provide an additional resource for systems to learn out-of-set
    languages through unsupervised clustering. 
* test set was further divided into two subsets called progress and evaluation
  * with a 30%/70% sub-division. The subdivision was a random selection
  * stratified by language. The purpose of the subdivision in the test set was
    * to provide score feedback on ... _progress_ and 
    * keep ... _evaluation_ blind to assess whether systems overfitted 
* A single segment was extracted from each selected recording/file. 
  * The speech duration of the segments followed a lognormal distribution with
  * a mean of 35 seconds.
* The i-vectors were 
  * 400 dimensional vectors produced by a system developed by the Johns
  * Hopkins University Human Language Technology Center of Excellence and MIT
  * Lincoln Laboratory. More information about the i-vector system can be
  * found in [2]
    * Najim Dehak, Pedro A. Torres-Carrasquillo, Douglas Reynolds, Reda Dehak,
      _Language recognition via ivectors and dimensionality reduction_ 
      2011
* corpora
  * LDC CallFriend corpus contained 
    * 5-30 minute telephone conversations where the speakers, conversing in
    * their native language, knew each other and lived in the same country,
    * typically the U.S., Canada, Puerto Rico, or Dominican Republic, while the
  * LDC CallHome corpus contained up to 30 minutes telephone conversations.
  * Fisher corpus from LDC 
    * 5-minute telephone conversations between two strangers on assigned topics,
    * resulting in a more diverse speaker population as described in [7]. 
  * LDC Mixer corpus was similar to the Fisher corpus except that the 
    * * speakers were bilingual, conducting some conversations in their native
    * * conversations were recorded over multiple microphones as described in [8].
  * OHSU corpus[1], collected by the Oregon Health & Science University,
    * contained telephone conversations of people recruited from various
    * locations in the U.S. to make calls to people they knew, half of whom
    * resided in the U.S.  while the other half resided in other countries. The
  * Babel corpus, collected by Appen, contained telephone conversations
    * recorded in-country for the languages of interest using a variety of
    * handsets (e.g., cell phone, table microphone) and recording conditions
    * (e.g., on the street, in a busy café) as described in [9].  
  * LRE07 contained unused data from CallFriend, Mixer, and OHSU [1]. The 
  * NBBN corpus contained narrowband broadcast speech from MIT Lincoln Laboratory.
  * LRE09 
    * mix of telephone conversations from previously mentioned corpora and
    * narrowband broadcasts from Voice of America in multiple languages.
  * LDC LRE11 corpus 
    * telephone conversations and narrowband broadcasts using similar protocols
    * to those used in CallFriend and VOA as stated in [10].

## 4. Participation

* The system with the best performance observed on the evaluation subset
  * fusion approach that combined multiple sub-systems based on 
    * commonly used techniques in language recognition including 
      * linear discriminant analysis,
      * support vector machines, 
      * multi-layer perceptrons, 
      * deep neural networks, and 
      * multi-class logistic regression. However, this system introduced 
    * two new methods: 
      * (1) one that enhanced out-of-set detection by exploiting the
      * out-of-set distribution from the given unlabeled development set
      * (2) one that transformed the given training data to the score
      * space with respect to all other data points in the training set. 
  * More information about this system can be found in [11].
    * [11] Hanwu Sun, Trung Hieu Nguyen, Guangsen Wang, Kong Aik Lee, Bin
    * Ma, and Haizhou Li, 
    * I2r submission to the 2015 nist language recognition i-vector ch 
    * February 2015.
