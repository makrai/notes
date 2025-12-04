R Iliev, M Dehghani, E Sagi
Automated text analysis in psychology:
  Methods, applications, and future developments
Language and Cognition, 2014

# Abstract

* measuring psychological and demographic properties
* current [data collection] methods have many disadvantages and pitfalls
  compared to more traditional methods
* nL computational power and the wide availability of textual data will
  inevitably make automated text analysis a common tool for psychologists

# 1. Introduction

## 1.1 the gold standard in natural language processing: human coders

* language to make inferences about properties of the human mind
  (Freud, 1901; Rorschach, 1964 [1921]; Murray, 1943; Van Dijk & Kintsch, 1977;
  Weber, Hsee, & Sokolowska, 1998; Braun & Clarke, 2006)
* Based on what someone says, we make judgments about his or her
  * personality, general knowledge, past, and about
    the value of future interactions with the speaker
  * happy or sad, polite or rude, expert or novice
  * sometimes even infer gender, religion, or political orientation

## 1.2 user-defined dictionaries

* The most popular example in recent years is LIWC (Pennebaker, 2011)
* categories such as leisure, religion, money, or psych processes
* eg when people write about
  * pleasant events the positivity category (Kahn+ 2007)
  * depressed individuals negative emotions (Rude+ 2004)
  * more surprising associations
    * deceptive texts use words from the motion category (Newman+ 2003)
    * extroverted subjects [use less] causality related words (P & King, 1999)
* In addition to content-based categories
  * word count, long words, tense, and function words
  * first person singular pronouns have been associated with negative
    experiences (Rude+ 2004)
  * extroverted authors write longer texts but prefer shorter words and
    less complex language (Pennebaker & King, 1999; Mehl+ 2006)
* scientists to build their own dictionaries
  * Graham, Haidt, and Nosek (2009) [on] the Moral Foundation Theory
    * liberals and conservatives differ in
      what they consider to be part of the moral domain
      * liberals were concerned mainly with harm and fairness, while
      * conservatives in addition were also concerned with loyalty to ingroup,
        authority, and purity
    * In their [study they] compared liberal and conservative sermons
  * historical trends and cultural change
    * often focus on East−West cross-cultural differences that
      can be traced back to ancient philosophical texts (Nisbett, 2004)
    * over the last two centuries,
      * words associated with individualism and independence have become more
        frequent (Greenfield 2013)
      * Kesebir and Kesebir (2012) have found that words expressing concern
        about others and words indicating moral virtue have decreased
* cannot easily capture sarcasm, metaphors, or idiomatic expressions

## 1.3 feature extraction

* character n -grams, single words, short expressions, or tagged POS
* documents are represented as sets of features
* [one domain of applications] is in the analysis of open-ended questions

## 1.4 word co-occurrences

* application of LSA methods for studying differences between authors
  * distance between texts in the semantic space
  * effects are not particularly strong
  * documents from different authors on the same topic are [closer] than
    documents on different topics by the same author
* automated grading
  * ‘mental model’ that a student relies upon
    * In naive physics (McCloskey, 1983; DiSessa, 1993)
    * while there is one normatively correct model, there are several
      categories of non-normative models
* LSA for studying change over time
  * Campbell and Pennebaker (2003) were interested in the relationship
    between writing and health
  * they adjusted the LSA procedure to account for [function words]
  * people who showed less diversity in their writing styles were more likely
    to have negative health outcomes
  * pronouns and particles were the strongest predictors
  * can reflect flexibility in perspective taking and thus re-evaluation
* related to LSA is a generative method called Latent Dirichlet Allocation
  * (LDA; Blei, Ng, & Jordan, 2003)
  * each document is composed of a mixture of topics
  * While the dimensions of LSA are abstract and meaningless, the
    dimensions in LDA are the latent topics that emerge from the corpus
  * LDA can also be used in a supervised, or semi-supervised, manner

## 1.5 other methods

### 1.5.1. Semantic role labeling

* it might be important to know what this person thinks the particular
  causes behind the process are
* information about the author of a text separately from the semantic agents
  and patients in the text
* group dynamics

### 1.5.2. Cohesion

* Coh-Metrix 13 (Graesser, McNamara, Louwerse, & Cai, 2004)
  * semantic overlap between different parts of the text,
    connections between propositions, causal links, and syntactic complexity
  * initially focused on the readability, coherence, and complexity
  * author identification (McCarthy, Lewis, Dufty, & McNamara, 2006)
  * analysis of political speeches (Venegas, 2012)
  * affective states from transcripts
  * essay grading (McNamara, Crossley, & McCarthy, 2010), and
  * evaluation of social skills (Xu, Murray, Smith, & Woolf, 2013)

### 1.5.3. Hybrid methods

* For example, Gill+ (2008) studied emotional content in blogs
  * UDD categories correlate well with joy and anger, but
  * word co-occurrence methods were also able to detect fear
* automated algorithms for building dictionaries
* supervised machine learning techniques
  * For example, Sagea+ (2013) [for] different narrative levels
* network text analysis,
  * combines properties of word co-occurrence methods, semantic role labeling,
    and social network analysis
  * treating text as a network of inter-related concepts
  * stem from the idea that word co-occurrences in text reflect cognitive
    organization of authors’ concepts or thoughts
  * can easily account for different types of contextual information, such as
    location, time period, or social networks

# 3.Conclusions p20

* Technological innovations [for data collection] have facilitated
  theoretical advances in psychological science
  * precise reaction time (Helmholtz, 1850)
  * mechanical control of stimuli exposure (Mueller & Schumann, 1894)
  * measurement of Galvanic skin response (Vigouroux, 1879 ; Jung, 1906)
  * electro-encephalograms (Berger, 1929)
  * fMRI (Ogawa, Lee, Kay, & Tank, 1990) and
  * optical brain imaging (Villringer & Chance, 1997)
* Recently a quantitative change in technology
  * vast amounts of human-related data
    * in analysis-friendly form, such as
      * social network information (Lewis+ 2008; Lerman & Ghosh, 2010)
      * diurnal [napi] activity patterns (Krishnamurthy, Gill, & Arlitt, 2008)
      * reputation (Standifird, 2001)
      * or Facebook ‘likes’ (Kosinski, Stillwell, & Graepel, 2013)
    * human-generated text
      * companies offer specialized software for automated text analysis, and
      * text analysis tools [in] standard statistical packages
        (eg SAS Text Miner, SPSS Text Analytics, R)
* measures of subjective properties [of authors]
  * from clinical psychology, personality and individual differences,
    intelligence, knowledge assessment, lie detection, political attitudes,
    group dynamics, and cultural change
  * organized as follows
    * introduce the idea of using language in general and text in particular
    * three popular approaches for automating such tasks:
      * user-defined dictionaries;
      * feature extraction algorithms
      * patterns of word co-occurrence in a semantic space
    * some less popular, but promising, recent developments
