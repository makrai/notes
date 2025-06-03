Practical and Ethical Considerations
  in the Effective use of Emotion and Sentiment Lexicons
Saif M. Mohammad
arXiv:2011.03492 [cs.CL]

# 1 Introduction

* Words often convey affect (emotions, sentiment, feelings, and attitudes);
  * explicitly through their core meaning (denotation), eg _dejected_ -> sadness
  * implicitly through connotation, eg _failure_ connotes sadness
* applications in commerce, public health, and
  research (NLP, Psychology, Social Sciences, Digital Humanities, etc)
  * tracking brand and product perception via social media posts,
  * tracking support for controversial issues and policies,
  * tracking buy-in for non-pharmaceutical health measures such as social distan
  * literary analysis, and
  * developing more natural dialogue systems
* I have created and shared a number of word–emotion association lexicons
  (Mohammad+ 2009; Mohammad and Turney, 2010; Mohammad, 2011b, 2012;
  Mohammad and Turney, 2013; Mohammad+ 2013; Mohammad and Kiritchenko, 2015;
  Kiritchenko+ 2014; Salameh+ 2015; Kiritchenko and Mohammad, 2016a,b;
  Kiritchenko+ 2016; Mohammad, 2018a,b)
  * manually curated by crowdsourcing for tens of thousands of English words
    * eg NRC Emotion Lexicon (Mohammad and Turney, 2010, 2013) and the
    * NRC Valence, Arousal, and Dominance (VAD) Lexicon (Mohammad, 2018a)
  * automatically from large text corpora using simple statistical algorithms
* I list some of the practical and ethical considerations involved
  * likely apply to any emotion lexicon, eg
    * General Inquirer (Stone+ 1966)
    * Affective Norms for English Words (Nielsen, 2011; Bradley and Lang, 1999)
      * AFEW
    * LIWC (Pennebaker+ 2001)
    * Multi-perspective Question Answering (Wiebe+ 2005), and
    * the VAD lexicon by Warriner+ (2013)

# 2. Considerations

* Coverage: Some lexicons have a few hundred terms, and some have 10 000s
  * Mostly, they include entries for lemmas, but some also include morphological
  * in specialized domains, one may find that a number of common terms in the
    domain are not listed in the lexicons
* Dominant Sense Priors
  * usually not too problematic because
    most words have a highly dominant main sense
  * In specialized domains, some terms might have a different dominant sense
  * Entries in the lexicon for such terms should be updated or removed
* Associations/Connotations (not Denotations)
* Not Immutable: The associations do not indicate an inherent unchangeable rel
  * Emotion associations can change with time, but these lexicon entries cannot
* Perceptions of emotion associations (not “right” or “correct” associations):
  * We asked the annotators for ‘how speakers of a language perceive the word’
    as apposed to ‘the emotions evoked in the annotator’
    * less variance in responses (higher inter-annotator agreement)
      (Mohammad and Turney, 2013)
* Socio-Cultural Biases: Since the emotion lexicons have been created by people
  * countries, what is the gender distribution, age distribution, etc
* Limitations of Aggregation by Majority Vote
  * can have the effect of only considering the perceptions of the majority
  * I have made available all the disaggregated annotations, where possible
* Inappropriate Biases: Some of the human biases that have percolated into the
  * eg low valence scores for certain demographic groups or social categories
  * when these lexicons are used in specific tasks, care must be taken to
    ensure that inappropriate biases are not amplified or perpetuated
  * If required, remove entries from the lexicons where necessary
* Source Errors
  * Expect a small number of clearly wrong entries <=  Automatic generation
  * in any corpus, there will always be some amount of chance high
    co-occurrences that are not accurate reflections of the true associations
* Errors in Translation (from high-resource language)
  * often automatic translations of English resources are provided
  * eg the automatic translations of the NRC Emotion Lexicon and the VAD
    Lexicon are provided in over 100 languages
  * automatic translations can have errors; and the number of errors can vary
  * Also, as noted earlier, there can be cultural differences in the emotion
  * nL several studies have shown that most emo assocs are fairly consistent
    across many language pairs (Redondo+ 2007; Moors+ 2013; Schmidtke+ 2014;
    Mohammad+ 2016; Sianipar+ 2016; Yu+ 2016; Stadthagen-Gonzalez+ 2017)
* Relative
  * The absolute values of the association scores themselves have no meaning
  * eg the VAD Lexicon that are created by comparative annotations (asking
    annotators to provide relative ordering among a small number of items)
  * no claim that the mid-point valence score separates positive vs neg words

# 3. Pro-tips for effective and appropriate use of emotion lexicons

1. Manually examine the emotion associations
  of the most frequent terms in your data
  * Remove entries from the lexicon that are not suitable
2. Depending on your specific use case, you may choose to re-scale the scores
   * if using the lexicon entries as features in machine learning experiments,
     the scale (0 to 1 or -1 to 1) can make a difference
   * eg how much weight should be assigned to terms with scores close to 0
3. For text analysis, one can calculate various metrics such as the
  * percentage of emotion words (when the lexicons provides a list of words)
  * average emotion intensity (for real-valued associations)
4. When the lexicons provide real-valued association scores, one can calculate
   * average valence of the words in the target text OR
   * separately, the average-score of high/low-valence (positive/neg) words
5. If you are drawing inferences from texts using counts of emotion words:
  * It is more appropriate to make quantitative claims about emotion word usage
    rather than emotions of the speakers. For example, "the use of anger words"
    * no evidence that anger increased by 20%
  * Comparative analysis is your friend
    * compare to data from last year, data from a different person, etc
  * Inferences drawn from lager amounts of text are often more reliable
* See these papers for examples of how some of these lexicons can be used
  (Mohammad, 2011a; Fraser+ 2019; Hipson and Mohammad, 2020; Mendelsohn+ 2020)
  * proceedings of resent shared tasks on emotions such as SemEval-2018 Task 1:
    Affect in Tweets (Mohammad+ 2018) for how emotion lexicons are used
    in combination with training data and the latest machine learning
    techniques for emotion recognition
* applications in the blog post _Ten Years of the NRC Word-Emotion Assoc Lex_
* Mohammad (2020, Section 10) for a brief discussion of
  the broad societal impacts of emotion and sentiment analysis

# 4. Concluding remarks. Emotion lexicons can be simple yet powerful tools
