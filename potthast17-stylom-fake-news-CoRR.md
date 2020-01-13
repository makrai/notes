A Stylometric Inquiry into Hyperpartisan and Fake News
Martin Potthast, Johannes Kiesel, Kevin Reinartz, Janek Bevendorff, Benno Stein
2017

# Intro

* “fake news” encompasses the observation that, 
 * in social media, a certain kind of ‘news’ spread much more successfully
   * typically extremely one-sided (hyperpartisan), inflammatory, emotional,
      and often riddled with untruths
 * social media amplify fake news to outperform real news 
* countermeasures aiming at foreclosing range from displaying warnings, the
  withholding of news items until stakeholders can react, up to their
  complete removal. Countermeasures aiming at discouraging range from
 * By comparison, traditional countermeasures that used to work fairly well in
    offline media are the publication of refutations, either in a different
    venue or in the same
 * In social media, however, [these] are rather ineffective 
   * immediate reaction is crucial.
* fake news detection, but with a twist. While this task is 
 * most commonly tackled by automatic fact-checking, 
* we 
 * approach it from ... the writing style ... in relation to hyperpartisan
 * [show] for the first time [that] 
   * hyperpartisan news can be distinguished by its style from mainstream
   * satire can be distinguished from both
   * fake news can [not] be detected via style alone
 * new approach to assess and visualize writing style similarities of text
    categories based on Unmasking.  This way, we assess the style differences
 * between hyperpartisan left-wing news and hyperpartisan right-wing news,
    showing that the two have significant stylistic similarities
* organization
  2. related work
  3. dataset and how it was constructed
  4. methodology including our variant of Unmasking
  5. results of the aforementioned experiments.

# 2 Related work

* Fake news detection
  * Knowledge-based (also called fact checking)
    * Information retrieval, 
      Etzioni et al., 2008, Magdy and Wanas, 2010, Ginsca et al., 2015
    * Semantic web / linked open data (LOD) 
      Wu et al., 2014, Ciampaglia et al., 2015, Shi and Weninger, 2016
  * Context-based
    * Social network analysis, 
      Acemoglu et al., 2010, Budak et al., 2011, Nguyen et al., 2012, 
      Kwon et al., 2013, Mocanu et al., 2015, Tambuscio et al., 2015
  * Style-based
    * Deception detection 
      Wei et al., 2013, Chen et al., 2015, Conroy et al., 2015, 
      Rubin et al., 2015
    * Text categorization 
      Badaskar et al., 2008, Afroz et al., 2012, Rubin et al., 2016 
      * has hardly been considered in the context of fake news detection,
      * we will close this gap ... classifying news items ... into classes
        corresponding to fake, real, and satire, as well as to hyperpartisan
        and mainstream news.
* Deception detection originates from forensic linguistics and builds on the
  * Undeutsch hypothesis—a result from forensic psychology asserting that
    memories of real-life, self-experienced events differ in content and
    quality from imagined events (Undeutsch, 1967). The hypothesis leads to the
    * (now commonly applied) forensic tools to assess testimony at the
      statement level, such as Criteria-based Content Analysis (CBCA) and
      Scientific Content Analysis (SCAN). Nowadays, technology is being
    * in social media posts: Wei et al.  (2013) propose a model to detect
      tweets that convey uncertain information.  Regarding 
    * fake news detection, 
      * Chen et al. (2015) point out the need for an “automatic crap detector”
      * Rubin et al.  (2015) apply, for the first time, deception detection
        approaches to fake news detection 
        using rhetorical structure theory as a measure of story coherence
* Style-based _text categorization_ was 
  * proposed by Argamon-Engelson et al.  (1998)
  * tasks ranging from author profiling (by age, gender, native language, etc.)
    to broader style categories such as text genre. Since it is hypothesized 
  * Afroz et al.  (2012) attempt to detect texts whose authors tried to
    obfuscate their writing style to deflect author identification
  * Badaskar et al.  (2008) train models to tell real news apart from news ...
    generated using a language model
  * Rubin et al. (2016) contributed the first actual attempt at fake news
    detection by separating satire news ...  from real news 
    * variants of a tf·idf-weighted lexical vector space model
  * We employ this dataset in conjunction with our own in our experiments to
    study the connection of fake news, real news, and satire for the first
    time.
