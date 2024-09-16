Language models, surprisal and fantasy in Slavic intercomprehension\
Klára Jágrová, Tania Avgustinova, Irina Stenger, Andrea Fischer\
Computer Speech & Language Volume 53, January 2019, Pages 242-275

# Abstract

* monolingual human language processing, the\
  predictability of a word given its surrounding sentential context is crucial
* receptive multilingualism
  * unclear to what extent predictability in context interplays with other
    linguistic factors in understanding a related but unknown language
  * called intercomprehension
  * two dimensions influencing processing effort during intercomprehension:
    surprisal in sentential context and linguistic distance. Based on this
* we formulate expectations regarding the difficulty of designed experimental
  stimuli and
  compare them to the results from think-aloud protocols of experiments
  in which Czech native speakers decode Polish sentences
  by agreeing on an appropriate translation
* orthographic and lexical distances are reliable predictors of linguistic sim
  * we obtain the predictability of words in a sentence\
    with the help of trigram language models
  * linguistic distance (encoding similarity) and in-context surprisal
    (predictability in context) appear to be complementary, with
    * neither factor outweighing the other, and that
    * our distinguishing of these two measurable dimensions is helpful in
      understanding certain unexpected effects in human behaviour

# 1. Introduction

* Statistical models are widely used in psycholinguistic modelli (Keller, 2010)
  * Negative log probabilities assigned by statistical models, typically called
    surprisal scores, correlate well with eg human reading times of texts of
    varying difficulty (Hale, 2001, Levy, 2008) and may thus serve as\
    reasonable indices of the cognitive effort involved in human natural
    language comprehension. Psycholinguistic and neurolinguistic experiments on
  * usually confined to a monolingual setting – one in which the subjects have
    * evaluate the relative difference in processing complexity of various
      formulations that convey effectively the same information
* We study the mutual intelligibility of Slavic languages
  * not clear to what extent and in what form such psycholinguistic results
    translate in case of receptive multilingualism
  * a qualitative empirical study into the role of sentential context during
    reading intercomprehension between selected Slavic languages. We\
    hypothesize that both\
    linguistic distance and surprisal based on sentential context\
    influence the processing effort in reading intercomprehension. To
    investigate the relationship between these two predictors – linguistic
    distance and surprisal – we discuss
* three experiments
  1. a Croatian (HR) sentence which poses morphosyntactic challenges to Russian
     native speakers was presented to respondents with Slavic native languages
     other than HR. They were asked to translate the given sentence into their
     native language. The results of this experiment indicate that
    * words which are apparently orthographically transparent
      may influence translations more than within-context surprisal does
  2. we presented native readers of Czech (CS) with Polish (PL) sentences and
     elicited translations for these sentences
    * data was gathered in a series of two-person think-aloud experiments
      conducted at Charles University in Prague in December 2016
    * We analyse the stimulus sentences in terms of their orthographic and
      lexical distance and\
      compare the translations produced in terms of their information density\
      as modelled by trigram Kneser–Ney LMs (LMs, Kneser and Ney, 1995). We
    * linguistic distance is a critical factor in intercomprehension
    * linguistic distance and in-context surprisal appear to be complementary,
      * neither factor outweighing the other – our think-aloud protocols reveal
        * in cases where a word is highly surprising, but also identical to a
          cognate in their L1 (native language), our test subjects appear to
          have felt misled by the apparently “weird” context, and instead chose
          less surprising translations. In addition to the results from the
      think-aloud translation experiments, we present results from\
  3. web-based cloze tests with the same stimuli sentences 
    * the translation gaps were placed on the words that turned out to be
      problematic in the think-aloud experiments
    * The cloze experiments were conducted over the website freely accessible
      at http://intercomprehension.coli.uni-saarland.de/en/
* The main purpose of this study is to present a method for estimating the
  processing difficulty of sentences in reading intercomprehension, using
  statistical LMs
  * The qualitative analysis does not aim to evaluate a statistically
    significant number of stimuli in an experiment, but rather to\
    investigate why respondents chose certain translations in certain cases
    * Results from web-based cloze experiments for the same stimuli are added
      for a quantitative perspective

# 6. Summary and discussion

* We presented a method for estimating the overall processing difficulty of
  individual words in sentence stimuli\
  resulting from the two orthogonally measurable dimensions of linguistic
  distance and surprisal in context. We applied the method on
  * PL stimuli sentences and translations of them given by Czech respondents in
    reading intercomprehension experiments
  * We analysed the written answers that were given by the respondents as well
    as the audio recordings of the respondents during a translation task in
    think-aloud protocol design
  * Additionally, we evaluated the translations of a number of critical words
    and phrases within the same stimuli sentences that were gathered in
    web-based cloze experiments
  * We compared the predicted difficulties with the experimental results
* Overall, the results show that the\
  predictions do not always agree with the actually observed difficulty of the
  stimuli
  * our expectations: even absolutely transparent words such as
    internationalisms would be comprehensible in no matter which context, we
  * hE high surprisal scores can ruin the intelligibility advantage that
    identical words or words with low orthographic distance actually have. The
  * audio recordings bring further insight into the decoding process than
    if only the written translations of the respondents were considered
    * Although respondents pronounce the correct translations of words such as
      rektor ‘rector’ or auto ‘car’,\
      they do not trust these obvious words, because, in their opinion,\
      these words do not fit very well in the context of the remaining sentence
      or they are simply surprising because they are used rarely
    * nL readers’ opinions about what does and what does not make sense in
      context can differ and that they do\
      not always agree with the surprisal scores determined with LMs
* orthographically distant words with low surprisal scores,\
  surprisal influences readers' performance only to a point until there are
  other linguistic features that can have a more powerful influence on\
  (eg initial letter, neighbourhood density)
  * Knowing how strong the role of context is in these stimuli allows us to\
    draw conclusions about the role of other influencing factors and their domi
* Regarding encoding, our findings suggest that\
  the UID hypothesis does not hold for the translations
  given by the respondents in the three stimulus sentences:\
  they did not avoid peaks and troughs in surprisal
  * nL, the UID hypothesis refers to communicative situations, which was\
    not the case in our experimental design
  * for most stimuli with a high surprisal score of 6 hartley or more,
    respondents showed a tendency to provide translations that would have a
    lower surprisal score. As stated in the introduction, this contribution
  * no claim to provide statistically sufficient data on the understanding of
    PL stimuli sentences by Czech readers
    * just discussion of certain phenomena influencing intercomprehension in
      certain stimuli and it is an attempt to use LMs in order to describe the
      role of context in the stimuli and translations thereof
* further research into the topic of reading intercomprehension of sentences\
  and the role of context
  * instead of absolute surprisal scores, the difference in surprisal to the
    preceding words, especially in frequent collocations,\
    eg chléb ‘bread’ is very predictable after čerstvý ‘fresh’ which leads to a
    decrease in surprisal.  Also, the analysis could be repeated with
  * other n-gram models or with LMs other than n-gram models in order\
    to capture longer contextual influences than only trigrams (eg neural netw)
