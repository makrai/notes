Argument Mining: A Survey
John Lawrence, Chris Reed
Computational Linguistics (2020) 45 (4): 765–818

# Abstract

* Argument mining is the automatic identification and extraction of the
  structure of inference and reasoning expressed as arguments presented in
* domains as diverse as financial market prediction and public relations
* This survey explores the techniques that establish the
  foundations for argument mining, provides a review of recent advances in
  * challenges faced in automatically extracting a deeper understanding of

# 1. Introduction

* online fora increasingly serving as the primary media for argument and debate,
* opinion mining and sentiment analysis provide techniques are successful
  in marketing and public relations, and in financial market prediction, with
  * only tell us what opinions are being expressed and not why
* reasons for claims is the domain of argumentation theory, which studies
  * normative and empirical methodologies; and from
  * philosophical, linguistic, cognitive and computational perspectives. Though
  * pedigree = history (see van Eemeren+ [2014] for a compendious review), we
* turning unstructured text into structured argument data, giving an
  * understanding not just of the individual points being made, but of the
    relationships between them and
    how they work together to support (or undermine) the overall message
* aids comprehension of large volumes of data, the
  * manual extraction of argument structure is a skilled and time-consuming
  * Robert Horn, talking about the argument maps he produced on the debate as to
    whether computers can think, quotes a
    student saying “These maps would have saved me 500 hours of time my first
    year in graduate school”; 1 however, Metzinger (1999) notes that over 7,000
    hours of work was required in order for Horn and his team to create these
* as opposed to increasing the speed of manual argument analysis, it is clearly
  * impossible to keep up with the rate of data being generated across even a
  * argument mining,2 the automatic identification and extraction of
    argument components and structure.  The field of argument mining has been
* ACL workshops on the topic being held annually, from the first in 2014,3 up to
  * complemented by further workshops organized in Warsaw,5 Dundee,6 Dagstuhl,7
  * tutorials at IJCAI,8 ACL 2016,9 ACL 2019,10 and ESSLLI.11 ) This increasing
* Previous reviews, including
  * Palau and Moens (2009) and Peldszus and Stede (2013a), predated this explosi
  * contemporary reviews are aimed at different audiences:
    * Budzynska and Villata (2017) at the computational argumentation community
    * Lippi and Torroni (2016) at a general computational science audience
    * Stede and Schneider (2018) have, in their 2018 tour de force, assembled an
      extensive review of performance on tasks in/related to argument mining
  * Our goal here is to update and extend, introducing
    * reorganization where more recent results -> different ways of conceptualiz
    * intended audience are those already familiar with computational ling, so
* move on from Stede and Schneider (2018) in three ways. First, we bring the
  * up to date with the newest results based on approaches such as
    Integer Linear Programming, transfer learning, and
    new attention management methods, and cover a
    * much larger range of data sources: For a discipline that is so
      * , we review annotated data sources covering over 2.2 million words
  * greater depth in discussion of foundational topics—covering both the rich
    * philosophical research in the analysis and understanding of argumentation,
    * areas and techniques in computational linguistics that lay the groundwork
    * network view of subtasks in argument mining and
      focus on the interconnections and dependencies between them.  view of
      * instead of simple pipeline, more sophisticated and interconnected techs

# 2 existing work in areas that form the foundation

* sentiment analysis, citation mining, and argumentative zoning. In
* these areas are somewhat different in their goals and approach, they all offer
  * techniques that at least form a useful starting point for determining
  * not aim to present a comprehensive review of these techniques in this
    but to highlight their key features and how they relate to argument mining

## 2.1 opinion mining, focusing specifically on its connection to argument minin

## 2.2 Controversy Detection, an extension of opinion mining that aims to
identify topics where opinions are polarized

## 2.3. Citation mining

* label them with their rhetorical roles in the discourse

## 2.4 argumentative zoning,

* scientific papers are annotated at the sentence level with
  labels that indicate the rhetorical role of the sentence (criticism or support
  for previous work, comparison of methods, results or goals, etc.)

# 3 manual argument analysis, considering the steps involved and tools

* limitations of manually analyzing large volumes of text
* argument diagramming tools (Scheuer+ 2010) has been developed to allow an
  * identify the argumentative sections of the text and diagram the structure
    that they represent (Kirschner, Buckingham-Shum, and Carr 2003; Okada, Shum,
    and Sherborne 2008). The
  * advantages discussed in Harrell (2005), though there is varied (and
    conflicting evidence of) impact on the the day-to-day activity within
    domains in which these tools are applied, such as law, pedagogy, scientific
    writing (Lauscher, Glavaš, and Eckert 2018; Lauscher, Glavaš, and Ponzetto
    2018), and design (Scheuer+ 2010). The majority of these tools,
  * such as Araucaria (Reed and Rowe 2004)
    * Rationale (van Gelder 2007)
    * OVA (Bex+ 2013)
    * Carneades (Gordon, Prakken, and Walton 2007)
  * require the analyst to manually
    * identify the propositions involved in the argument being made and then
    * connect them identifying the premises and conclusion. In many cases, this
    * can then be extended with more specialized information, depending on the
      nature of the analysis task being performed; for example, giving details
      * argumentation schemes (Walton, Reed, and Macagno 2008) used or details
      * dialogue: participants and their dialogical moves (e.g. question/assert)
* four stages: segmentation, argument/non-argument, simple structure, refined st
  * may develop a more complex, hybrid approach in practice, the pipeline model
  * in Section 5 we further dissect these steps, presenting a more detailed view
    * and how they relate to the manual annotation process, explaining how
    * the pipeline view oversimplifies complex interdependencies

# 4 data available to those working in the argument mining field

* limitations and challenges that this data presents. In
* lack of large quantities of appropriately annotated arguments
* Green (2014) aims to create a freely available corpus of
  * open-access, full-text scientific articles from the biomedical genetics
    research literature, annotated to support argument mining research. However,
  * challenges: extensive use of biological, chemical, and clinical terminology
    in the BioNLP domain. These
* Green (2015), preliminary work on guidelines for the manual identification of
  10 custom argumentation schemes targeted at genetics research articles is
  * e.g. Failed to Observe Effect of Hypothesized Cause, looks for situations
    where specific properties were not observed, and where it is assumed that a
    specific condition that would result in those properties is present, leading
  * Twenty-three students were assessed on their ability to identify instances
    of these schemes after having read the guidelines, and the results show a
    mean accuracy of only 49%. It can be seen from these results that the
  * nuanced argument schemes is not a straightforward task. This suggests the
* Houngbo and Mercer (2014), a straightforward feature of co-referring
  * collecting pairs of consecutive sentences where the second sentence begins
    with “This method/result/conclusion…,” and then categorizing the first
    sentence in each pair respectively as Method, Result, or Conclusion
  * In order to remove outliers in the data set, a multinomial naïve Bayes
    classifier was trained to classify sentences from the corpus, and sentences
    that were classified with less than 98% confidence were removed.  This
  * used as training data to identify Method, Result, and Conclusion sentences
    using both SVM and naïve Bayes classifiers.  These classifiers show an
    average F-score of 0.97 with naïve Bayes and 0.99 with SVM, and are further
    tested on the corpus used by Agarwal and Yu (2009), where sentences are
    classified in the same way. By using this approach, Houngbo and Mercer are
    able to improve on the results from Agarwal and Yu, whose results show an
    F-score of 0.92 using 10-fold cross-validation. Despite the limited nature
    of this task, only identifying specific types of sentences and not giving
    any idea of the relations between them, these results show that by extending
    the training data available, substantial improvements in classifying
    sentences can be made
* Lawrence and Reed (2017) take a similar approach to Houngbo and Mercer,
  * using discourse indicators (connectives such as “because,” “however,” etc.)
    in place of “this.” In this work, the topic of a given text is first
  * sentences are split on either side of the indicator to give possible
    premise conclusion pairs. Despite this being a noisy data set, with
    potential off-topic sentences and cases where the indicator has been used
  * topic model can be built from large numbers of these pairs, resulting in
    stereotypical patterns of support on the given topic
* Similarly, Habernal and Gurevych (2015) use unlabeled data from online debate
  * By identifying clusters of both sentences and posts from these debate
  * the centroids of these clusters, “prototypical arguments” are identified
* Al-Khatib+ (2016) likewise leverage online debate portals, generating
  annotations by automatically mapping source data, in this case the labeled
  text components from the idebate.org (e.g., “Introduction,” “point,”
  “counterpoint”), to a set of predefined class labels to create a large corpus
  with argumentative and non-argumentative text segments from several domains
* The Argument Annotated Essays Corpus (AAEC Stab and Gurevych 2014a, 2017) and
  * argument-annotated persuasive essays, and features
    topic and stance identification, annotation of argument components, and
    argumentative relations. Drawn from 402 English language essays, the final
    corpus contains 751 major claims, 1,506 claims, and 3,832 premises,
    connected by 3,613 support and 219 attack relations. A random sample of 102
    essays taken from the AAEC have been further annotated, as described in
  * Carlile+ (2018), to also include a
    * persuasiveness score for each argument as well as
    * scores for attributes that potentially impact persuasiveness
      (Eloquence, Specificity, Relevance, and Evidence), the
    * means of persuasion (Ethos, Pathos, or Logos), and the
    * types of both claims and premises. This addition to AAEC has already shown
  * application: automated persuasiveness scoring for essays (Ke+ 2018) and,
  * annotations of Ethos, Pathos, or Logos closely reflect the persuasive
    strength of arguments (Duthie, Budzynska, and Reed 2016; Wachsmuth+ 2018)
* Kirschner, Eckle-Kohler, and Gurevych (2015): a corpus of 24 German articles
  from the education research domain, and annotated using a custom designed tool
  * Four types of relation are identified: support, attack, detail, and sequence
    * The first two of these relations are argumentative, whereas the
      latter two are discourse relations similar to
      the sequence and background relations of Rhetorical Structure Theory
      (Mann and Thompson 1987).  The
  * represented as graph structures, and a
  * range of methods to determine inter annotator agreement for these structures
  * specific areas are identified that reduce agreement
    * Similar categories were particularly problematic;
      e.g. support and detail or support and sequence relation.  Although these
* Legal texts are the focus of
  * Walker, Vazirova, and Sanford (2014), marking up
    successful and unsuccessful patterns of argument in U.S. judicial decisions
    * vaccine-injury compensation cases that report factfinding about causation,
      * both scientific and non-scientific evidence and reasoning, patterns of
      reasoning are identified and used to illustrate the difficulty of
      developing a type or annotation system for characterizing these patterns
  * ECHR corpus (Mochales and Ieven 2009), a set of documents extracted from
    legal texts of the European Court of Human Rights (ECHR). The ECHR material,
    * although not annotated specifically for argumentative content, contains a
      standard type of reasoning and structure of argumentation that means that
      the corpus can be easily adapted to serve as data for argument mining
* Kiesel+ (2015), who present a corpus of 200 newspaper editorials annotated
  * model consisting of
    * explicit argumentative units: a segment of the original text containing at
      least one proposition
    * implicit argumentative relations (i.e., support or attack) between them. In
      * the links from one unit to the unit that it most directly supports or at
* Internet Argument Corpus (IAC) (Walker+ 2012) is a corpus for research in
  political debate on Internet forums
  * annotated for topic, stance, agreement, sarcasm, and nastiness, among
  * version 2 (Abbott+ 2016), a collection of corpora for research in political
    * topic annotations, response characterizations (4forums), and stance,
* The most comprehensive and completely annotated existing collection is the
  openly accessible database, AIFdb17 (Lawrence+ 2012), containing
  * over 14,000 Argument Interchange Format (AIF) argument maps, with over 1.6m
  * 160,000 claims in 14 different languages.18 These numbers are growing
    rapidly, thanks to both the increase in analysis tools interacting directly
    with AIFdb and the ability to import analyses produced with the Rationale
    and Carneades tools (Bex+ 2012). Indeed, AIFdb aims to provide researchers
    with a facility to store large quantities of argument data in a uniform way
    * AIFdb Web services allow data to be imported and exported in a range of
    formats to encourage re-use and collaboration between researchers
    independent of the specific tools and data format that they require
* online tools such as DebateGraph, TruthMapping, Debatepedia, Agora, Argunet
  and Rationale Online allow users to create and share argument analyses
  * generally do not offer the ability to access this data and
    each use their own formats for its annotation and storage. At the moment,
* larger “semi-structured” argumentative data sources. The most striking example
  * gathered from the ChangeMyView (CMV) Reddit subcommunity (Tan+ 2016; Hidey
    and McKeown 2018; Musi, Ghosh, and Muresan 2018). These data take the form
  * If the original poster finds that a comment succeeds in changing their
    viewpoint, they can reply with a ‘delta’ symbol indicating this. Although
  * not strictly argumentative, there are strong indicators of arg structure:
    * Direct responses, for example, often include counterarguments to the
    * Hua and Wang (2017) use CMV data to both train and evaluate a model for
      automatically generating arguments of the opposing stance for a statement
* large corpora of unstructured data available that are rich in argumentative
  * Wikipedia, Twitter, Google Books, meeting data from the AMIDA Meeting
    Corpus26 annotated using the Twente Argumentation Scheme (Rienks, Heylen,
    and Weijden 2005), and product reviews from Web sites such as Amazon and
    epinions.com. Although these corpora may be useful for certain argument
* Wikipedia, in particular, represents a considerable amount of data rich in
  * Aharoni+ (2014), work toward annotating articles from Wikipedia using a
    meticulously monitored manual annotation process is discussed. The result is
    * 2,683 argument elements, collected in the context of 33 predefined
      controversial topics, and organized under a simple structure detailing a
      claim and its associated supporting evidence
* Project Debater,27 IBM has made extensive use of Wikipedia and other data to
  create the first AI system that can debate humans on complex topics. Debater
  * by automatically constructing a set of relevant pro/con arguments phrased in
  * e.g. “The sale of violent video games to minors should be banned,”
    an early prototype of Debater
    * scanned approximately 4 million Wikipedia articles and determined the ten
    * scanned all 3,000 sentences in those articles,
      detected sentences that contain candidate claims, assessed their pro and c
    * presented three relevant pro and con arguments,28 with
  * more recent developments also working toward
    * choosing the most convincing of these arguments (Gleize+ 2019),
    * expanding the topic of the debate (Bar-Haim+ 2019), and
    * providing “first principle” debate points,
      commonplace arguments that are relevant to many topics, where specific
      data are lacking (Bilu+ 2019).  These abilities are the result of ongoing
* Levy+ (2014): detecting Context Dependent Claims (CDCs) in Wikipedia articles
  * given a topic and a selection of relevant articles, a selection of “general,
    concise statements that directly support or contest the given topic” can be
  * Rinott+ (2015): extracting supporting evidence from Wikipedia data for a CDC
  * Bar-Haim+ (2017) introduced the task of claim stance classification, that
    * i.e. detecting the target of a given CDC, and the stance toward that
  * Levy+ (2017) removing the need for pre-selected relevant articles, by
    * first deriving a claim sentence query to retrieve CDCs from an unlabed crp
      * this retrieval task is becoming a distinct and challenging task in its
      * applications such as args.me (Wachsmuth+ 2017) and new
      * shared tasks such as Touche driving the area forward.) Such large
      * CDCs can be used both
        * as potential points to be made by the Debater system as well as
        * to aid in the interpretation of spoken material containing breaks,
          repetitions, or other irregularities (Lavee+ 2019).  The method
* Shnarch+ (2018) generate weak labeled data (data of low quality compared to
  * then combined with a smaller quantity of high quality, manually labeled data
  * for topic-dependent evidence detection, suggesting that this kind of data
  * particularly in data-hungry neural network systems
* The annotated data sets used in Project Debater work are all available online
* Bosc, Cabrio, and Villata (2016) defining guidelines to detect tweet-arguments
  among a stream of tweets about a certain topic, before then
  pairing the identified arguments, and finally, providing a
  methodology to identify which kind of relation holds (i.e., support or attack)
  * agreement of α = 0.81 for detecting argumentative tweets, and
    α = 0.67 for argument linking, with
    the resulting DART data set containing 4,000 tweets annotated as
    argument/not-argument with 446 support and 122 attack relations
* Two of the major issues with the data currently available are the lack of a
  * standardized methodology for annotation, and a
  * central location for the storage and retrieval of consistently formatted
  * AIFdb Corpora31 (Lawrence and Reed 2014) aims to address these issues,
    * a range of formats to be converted to AIF and imported into AIFdb and
    * simple interfaces to collect and share corpora. AIFdb Corpora already
    * over 7,000 of the 12,000 analyses contained in AIFdb into a range of
      corpora that are publicly available in perpetuity at fixed permalinks
* A list of the most significant corpora is given in Table 1

# 5 tasks involved in argument mining

# a comprehensive overview of each tasks in sections 6, 7, and 8

# 6. Identifying Argument Components

# 7. Automatic Identification of Clausal Properties

# 8. Automatic Identification of Relational Properties

# 9. Conclusion

* data
* conflicting notions of argument are often problematic. In a
  * qualitative analysis of six different, widely used, argument data sets,
    Daxenberger+ (2017) show that each data set appears to conceptualize claims
    quite differently
* verifiability and reproducibility of results: As a young field, argument
  * no uniformly publicly available algorithms and codebases that would
    encourage incremental advance. Initiatives such as CLARIN (Krauwer and
    Hinrichs 2014) and LAPPSGrid (Ide+ 2015) are trying to tackle this challenge
    across NLP
* a difficult task; as Moens (2018) points out, “a lot of content is not
  expressed explicitly but resides in the mind of communicator and audience.” It
  seems that to overcome this challenge we
  * need to look at the broader picture in which argument occurs. In this
  * holistic “end-to-end” view (Stab and Gurevych 2017; Persing and Ng 2016;
    Potash, Romanov, and Rumshisky 2017) or that aim to harness
  * external data sources (Rinott+ 2015; Lawrence and Reed 2017)
* different levels of argumentative complexity as the domain and task require
  * For each task, a broad range of techniques, including
    statistical and linguistic methods
* We have presented a hierarchy of task types
  based on increasing argumentative complexity
  * identification of argument components and the determination of their boundrs
  * role of individual clauses (both
    * intrinsic, such as whether the clause is reported speech, and
    * contextual, such as whether the clause is the conclusion to an argument)
  * identification of a range of argumentative relations from
    simple premise/conclusion relationships, to
    whether a set of clauses form an instance of an argumentation scheme
* need to be complemented by stronger, knowledge-driven analysis and processing
* the pieces of argumentat mining are starting to take shape.  As the volume of
