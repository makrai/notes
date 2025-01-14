Uniform Information Density Effects on Syntactic Choice in Hindi
Ayush Jain, Vishal Singh, Sidharth Ranjan, Rajakrishnan Rajkumar, Sumeet Agarwal
ACL WS

# Abstract

* Uniform information density hypothesis (UID, Levy & Jaeger 2007; Jaeger 2010)
  * speakers tend to distribute information density across the signal uniformly
    while producing language
  * Levy & Jaeger studied syntactic reduction in language production at
    particular choice points in a sentence
* we use a variant of the above UID hypothesis in order to investigate the
  extent to which word order choices in Hindi are influenced by the drive to
  minimize the variance of information across entire sentences
  * multiple lexical and syntactic measures (at both word and constitue levels)
    to capture the uniform spread of information across a sentence
  * we incorporate these measures in machine learning models aimed to
    distinguish between a naturally occurring corpus sentence and its
    grammatical variants (expressing the same idea)
  * Our results indicate that our UID measures are not a significant factor in
    predicting the corpus sentence in the presence of lexical surprisal, a
    competing control predictor
  * in the light of other recent works, we conclude with a discussion of
    reasons for UID not being suitable for a theory of word order

# 1 Intro

* The UID hypothesis has a long history in the literature and
  * Ferrer-i-Cancho (2017) traces the idea to the pioneering work of August and
    Gertraud Fenk (Fenk and Fenk-Oczlon, 1980) and developed further in
    subsequent articles (Fenk-Oczlon, 2001, for an overview). In recent years,
  * substantial traction with the work on syntactic reduction done by Florian
    Jaeger and colleagues (Levy and Jaeger, 2007; Jaeger, 2010). They show that
    speakers achieve uniformity of information across utterances either by
    omitting optional function words (like the that complementizer) or by
    explicitly mentioning them
* we examine a variant of the UID hypothesis stated above in the
    case of entire sentences created by syntactic alternations
* In this work, we test the hypothesis that
  reference sentences obtained from a corpus of naturally occurring written
  text exhibit greater uniformity in the spread of information in comparison to
  grammatical variants expressing the same idea. To this end,
  * we propose five distinct UID measures quantifying the uniformity of
    information density at both syntactic and lexical levels
    * inspired from Collins (2014),
    * two different versions of these measures at word as well as constituent
      boundaries. We examine the impact our UID measures in predicting
    * in Hindi, an Indo-Aryan language with predominantly SOV word order and
      case-marking postpositions. This is the first work on the Hindi language
      (to the best of our knowledge), which studies its information-theoretic
      properties pertaining to syntactic choice. In
      comparison to English (SVO order and prepositions), Hindi has
      * relatively flexible word order (Agnihotri, 2007; Kachru, 2006)
* written data from the Hindi-Urdu Treebank (HUTB) corpus (Bhatt+ 2009) con-
  * newswire text. Hence the sentences used in our study are by default set in
    a given context.  In addition to production ease, the language production
    system also factors in communicative considerations pertaining to
    facilitating comprehension for listeners (ie audience design) and for the
    speakers themselves (Jaeger and Buz, in press). Moreover, written text is
    often edited, taking into account comprehensibility considerations
    explicitly 1 . From the perspective of
* in online language comprehension, processing difficulty is quantified by
  surprisal (Hale, 2001; Levy, 2008)
* We examine whether the UID measures we defined are significant predictors of
  syntactic choice even amidst lexical and syntactic surprisal as control
  * classifying Hindi data into reference sentences and artificial generated
    variants created by linearizing dependency trees corresponding to reference
    sentences in the HUTB corpus.  Our UID measures were deployed as features
    in machine learning models to perform this binary classification task
* Our results indicate that
  logistic regression models containing lexical surprisal along with our
  lexical and syntactic UID measures (across words as well as constituents) do
  not significantly outperform a strong baseline model containing only lexical
  surprisal (estimated using a simple trigram model over words)
  * Weak effects of both lexical and syntactic UID measures are attested in
    some non-canonical word order sequences involving object fronting. However,
  * hE not in the expected direction ie corpus sentences are characterized by
    spikes and troughs in information across words compared to their
  * This result is very similar to that reported by Maurits+ (2010), where the
    * object-first orders are in conflict with their formulation of the UID
    * Using a corpus study as well as results from judgement tasks, they show
    * such orders cause troughs in the signal compared to other orders because
      * disproportionate amount of information clustered around the object,
        making subsequent elements of the sentence redundant.  They also point
    * failure of their version of the UID hypothesis in the case of SOV langs
      * They attribute it to the presence of other stronger factors in such
        languages
  * a related note, Ferrer-i-Cancho (2017) discuss how
    predicting the final verb is a stronger processing pressure in verb-final
    languages compared to other competing principles like dependency length
    minimization
* Our result demonstrating lexical surprisal as a robust predictor of Hindi
  syntactic choice, adds support to predictability as a strong determinant of
  syntactic choice. Thus we conclude that the UID hypothesis (as defined by our
  measures) does not shape word order choices in Hindi when other control
  factors like predictability are considered

We discuss possible reasons for this by alluding to the work of
* Ferrer-i-Cancho, (2017) suggests that UID might
  * not be appropriate for a theory of word order of languages and UID might
  * be restricted to account for syntactic reduction phenomena only

# 2 a brief background on the UID hypothesis and surprisal

* Surprisal is mathematically equivalent to information density defined for
  language production, but it is an indicator of human sentence comprehension
  load based on different theoretical assumptions about activation allocation
  (Hale, 2001; Levy, 2008). We use two standard definitions of surprisal in
  this work as described below:
1. Lexical surprisal for word k + 1 is defined using the conditional
   probability of a word given its two word sentential context and
   * estimated using a simple trigram model over words
2. Syntactic surprisal is computed using the probabilistic incremental
   dependency parser developed by (Agrawal+ 2017), which is
   based on the parallel-processing variant of the arc-eager parsing strategy
   (Nivre, 2008) proposed by Boston+ (2011)
   * parser maintains a set of the most probable parses at each word as it
     proceeds through the sentence
   * A maximum-entropy classifier is used to estimate the probability of a
     transition from one parser state to the next, and
     the probability of a parser state is taken to be the product of the
     probabilities of all transitions made to reach that state
   * The syntactic surprisal of the (k + 1) th word is computed as the
     log-ratio of the sum of probabilities of maintained parser states at word
     k to the same sum at word k + 1

# 3 The UID measures we proposed as part of this work

# 4 Datasets and models we used for testing our hypotheses

# 5 Experiments conducted as part of the study and

# 6 Implications of the results obtained for a theory of word order. Finally,

# 7 Conclusions and possible directions of future inquiry
