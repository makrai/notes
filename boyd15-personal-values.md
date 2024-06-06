Values in Words: Using Language to Evaluate and Understand Personal Values
Ryan L Boyd, SR Wilson, JW Pennebaker, M Kosinski, DJ Stillwell, R Mihalcea
Proceedings of the Ninth International AAAI Conference on Web and Social Media

# Abstract

* People’s values: a decision-making framework that helps guide their actions
  * tenuous [slight] relationships with everyday behaviors
  * Most popular methods of assessing values show
* Using a new Amazon Mechanical Turk dataset (N = 767) consisting of
  * people’s language, values, and behaviors, we explore the degree
  * to which degree is attaining “ground truth” possible
    with regards to such complicated mental phenomena
* We then apply our findings to
  a corpus of Facebook user (N = 130, 828) status updates
  * how core values influence the personal thoughts and behaviors
  * self-report questionnaires for values are inadequate for painting
  * Free response language data and language modeling show greater promise
    * understanding both the structure and content of concepts such as values
    * predicting

# Intro

## Values and Value Research

* Psychologists, historians, and other social scientists have long argued that
* people’s basic values predict their behaviors
  (Ball-Rokeach, Rokeach, and Grube 1984; Rokeach 1968)
* generalize across broad swaths of time and culture (Schwartz 1992)
  * deeply embedded in the language that people use on a day-to-day basis
    (Chung and Pennebaker 2014; Lepley 1957)
* In psychological research, the term _value_ is typically defined as
  a network of ideas that a person views to be desirable and important
  (Rokeach 1973)
  * Values are relatively abstract, giving rise to a broad constellation of
    related attitudes and behaviors. Eg “honesty”
  * Kristiansen and Zanna, 1988). Such core values are pervasive
  * often internalized at a very young age (Aronson 2004)
* reliable indicators of how they will think and act in value-relevant situs
  (Rohan 2000)
* frameworks that cover nearly all core human values (Rokeach 1968)
  * One of the most accepted and widely used of these is by Schwartz+ (2012)
  * ten primary values organized into a circumplex
  * the umbrella under which the majority of human value judgments fall
* These 10 value types are as follows
  * Self-direction (S-D)
  * Stimulation (Stim)
  * Hedonism (Hed)
  * Achievement (Achiev)
  * Power (Pow)
  * Security (Sec)
  * Conformity (Conf)
  * Tradition (Trad)
  * Benevolence (Benev)
  * Universalism (Univ)
* Schwartz’s 10-value model has seen great success in psychological research
  * The basic circumplex model has been applied to the understanding of 
    culture (Schwartz 1994; 2004), religion (Schwartz and Huismans 1995),
    cognitive development (Bubeck and Bilsky 2004), and 
    politically-motivated behaviors (Caprara+ 2006), to name but a few domains
  * Schwartz Value Survey (SVS)
    * the vast majority of this research has been built upon the
    * an internally reliable self-report questionnaire commonly used to assess
      the theorized ten core human values (Schwartz 1992)
  * now the common currency of values researchers around the world
  * constructed on the foundation of people's self-theories
  * people evaluate themselves along a predetermined group of 10 values
  * values assumed to take a specific structure and content
  * this structure and content are imposed upon research participants:
    * inherently built into the questionnaire and its scoring methods
    * a necessary practice for nearly all self-report questionnaires
* vs simply asking people for their own thoughts on the question of
  “What are your personal values that guide your decisions and behaviors?”
  * answer may be “to work hard”, “be faithful to my religion”, or “be a good
    mother”: professed values
  * not inherently contradictory to the SVS
* relationship between values and behaviors
  * hE most studies have simply compared self-reported SVS values with other
    self-report attributes such as personality, likes, and dislikes
  * ~> just the relationships between different facets of people’s explicit
    self-concepts
    rather than studying more organic and real-world instantiations of values
    and behaviors
  * nL Butenko and Schwartz (2013) seek to build a set of self-report behaviors
    that correspond to the values measured by the SVS
  * hE many of the self-reported behaviors thus far have been
    general abstractions rather than concrete behaviors
    * For example, the behavioral measure for the value of
    * “stimulation” <~ “change plans spontaneously”
    * “humility” <~ “play down my achievements or talent”
* how to measure behaviors efficiently and effectively
  * problem with Self-reports of behaviors via forced choice questionnaires
    * the same as other self-report measures: the questionnaires 
    * only questions that researchers think to ask. By adopting such an
    * potentially skewed and inaccurate structure on behavioral patterns. These
    * features are intractable by closed-format self-report questionnaires. In
* objective behavioral measures such as
  buying behaviors, movement information, and even reading pattern data
  * open-ended reports of mental life in the form of social media
    * ecologically valid and entirely in their own words
* we examine values and behaviors that emerge from open-ended text
* two projects
1. relies on an online survey that involved multiple randomized tasks that
  1. asking people to describe in detail the basic values that guide them
  1.   ... to describe the behaviors in which they engaged within the past week
  1. participant completion of the self-reported SVS
  * For this study, we also collected data in the form of
    closed questionnaires about recent behaviors from all participants
    * These items corresponded very strongly with the free-response behavioral
      reports provided by participants. Results are available from the authors
  * Using a topic modeling technique called the
    meaning extraction method (MEM, Chung & Pennebaker 08; Kramer & Chung 11),
    values & behaviors were inductively extracted from the texts
  * Value and behavior-relevant thematic factors were then
    compared with each other and with the SVS data
2. adapted the results of the first project to Facebook status updates
  * status updates from over 130,000 Facebook users
    * part of the myPersonality project (Kosinski+ 2013)
  * a relatively small number of the cases (N = 1, 260) included the SVS,
  * the primary analyses revealed
    intuitive links between the MEM-derived values and MEM-derived behaviors
* ie a proof-ofconcept study demonstrating the utility of relying on ling
  markers of abstract psychological phenomena, including values, to better
  predict and understand their connections to behaviors and thought

# Project 1: Values and Behavior in an Online Survey Sample 2

1. how well the SVS captures core personal values
  * ie prevalent values as described by people when discussing the things that
    are most important to them in their own words
2. explore the links
  * between
    * values (both from the SVS and people’s free responses) and
    * behaviors as they manifest themselves in reality, including language use
  * we designed a social survey using the Qualtrics Research Suite
    * the survey was then distributed using Amazon Mechanical Turk (AMT)
    * series of randomized tasks that included the following
* Values Essay. To assess participants’ values in their own words. Prompt:

> For the next 6 minutes (or more), write about your central and most important
> values that guide your life. Really stand back and explore your deepest
> thoughts and feelings about your basic values. You might think about the
> types of guiding principles that you use to make difficult decisions,
> interact with other people, and determine the things that are important in
> your life and the lives of those around you.  Try to describe each of these
> values and their relationship to who you are. Once you begin writing, try to
> write continuously until time runs out.”

* Schwartz Value Survey Respondents were asked to
  assign integers in the range [-1,7] to the 57 items of the SVS:
  how important they perceived them to be as principles in their own lives
  * higher numbers indicate greater personal importance, Likert-type scale
  * Scores for the ten values were then calculated by taking the mean 
    * centering (Schwartz 2009) to address respondents’ diffs in scale use
  * Tasks were presented in a randomized fashion between participants
  * Participants were allowed to take as much time as needed to complete each
  * encouraged to be as comprehensive as possible in their responses
  * to filter out spam and careless responses, multiple “catch” items
    randomly interspers eg “For this question, please select the third option”
* essay writing samples were manually checked for coherence and plagiarism
* May to July, 2014, surveys successfully completed by 767 respondents
  (64.5% female, 77.1% Caucasian, 70.0% aged 26-54) were retained

## Anal

* MEM is an approach to topic modeling
  * demonstrated utility in understanding psychological phenomena, including
    * cognition (Chung and Pennebaker 2008) and
    * behaviors (Ramirez-Esparza+ 2008)
  * the co-occurrence of words can identify
    emergent and psychologically meaningful themes
    * These themes are then treated as independent dimensions of thought along
      which all texts can be quantified
  * the number of themes extracted
    * Like other topic modeling methods, researchers have some degree of leeway
    * For the MEM, theme interpretability is typically a key determining factor
    * does not impact the conclusions that we draw from the current research
  * omits closed-class (function) words and low-frequency open-class (content)
  * software designed specifically to automate topic modeling and lemmatization
    procedures (Meaning Extraction Helper, Boyd 2014a)
* we identified
  * 16 themes from the language generated during the values essay task (Tab 1)
  * 27 themes from the behavior essay task (Table 2)
* tab 3: how the MEM themes correspond to the 10 values as defined in the SVS
  * the rate of words from each theme as they appeared in each essay response
* The established relationships among the SVS values seem to exhibit themselves
  * For each of the SVS value dimensions, the correlations tend to exhibit an
    expected sinusoidal trend against the MEM-derived themes
  * relatively intuitive correlations between MEM-derived values and the SVS
  * eg “religion” theme align well with the SVS Tradition value and fall in
    opposition to the SVS value of Self-Direction
  * small positive correlations between theme-score pairs such as
    Honesty/Benevolence, KnowledgeGain/Universalism, and
    Indulgence/Stimulation
  * hE the correlations between the MEM-derived values and the SVS value scores
    are considerably weaker than would be expected were they reflecting
    identical constructs
    * hypoth: they measure the same broad construct (ie “values”) ~>
      convergence would be expected to a rather high degree, reflected by
      moderately strong effect sizes; this was not the case
    * ie the ideas that people described when asked about their core personal
      values diverge from the top-down, theory driven set of SVS values
* eg Participant Z’s scores along the SVS dimensions (Table 4)
  * SVS dims provide no indication of any particularly strong or cohesive vals
  * nL a casual reading suggests that this respondent does possess a coherent
    network of ideas that they believe guides their daily behaviors
  * the MEM-derived value themes interpr the relative importance of each theme
* we don't suggest an inherent inferiority of the SVS
  * all self-report questionnaires designed to assess personal values would
* tab 6: values inherently influence people’s behavior
  * we also expect to see meaningful relationships between people’s values and
    measurements of common, everyday behaviors in which they engage
  * To examine these links, we performed simple Pearson’s correlations between
    * the 27 behavioral themes extracted from participant behavior essays
    * values as assessed by both the SVS and MEM-derived themes
* the SVS values exhibit low predictive coverage of themes related to behaviors
  * nL the themes extracted from value descriptions show connections (ie effect
    sizes of R2 ≥ .01) to more than twice as many common behavior topics
  * only 6 of the 27 behavioral themes extracted are predicted by SVS scores
  * nL the MEM-derived value themes exhibit correlations with 14 behav themes
  * The behavior themes “Relaxation” and “Meetings” were the only themes that
    exhibited relationships exclusively with SVS values and none of the MEM
* Summary
  * the SVS dimensions are theorized to be universal, consciously accessible
    * they can be explicitly reported by the individual (Schwartz+ 2012)
    * top-down approach, which necessarily captures a limited semantic breadth
  * nL open-ended method for assessing a person’s values where we can rely upon
    ~> a constellation of values not captured
    * better predictive coverage of everyday behaviors

# Project 2: Values in Social Media 5

* goal: conceptually replicate the results from Project 1 in social media
  * 1st: relationship between SVS scores and the 16 MEM-derived value topics
    from our original AMT sample
  * <~ an extensive sample of social media data from myPersonality
    (Kosinski, Stillwell, and Graepel 2013)
    * approximately 150,000 Facebook user’s status updates
    * Additionally, various subsamples of these users have completed some
      portion of a battery of dozens of questionnaires pertaining to
      personality assessment, demographics, and values
* value-laden language in everyday life (Chung and Pennebaker 2014)
  * we used the MEM-derived value lexicon created within Project 1 as our
    “ground truth” for value-relevant words in Project 2
  * word counting software (Boyd 2014b) to scan user status updates for the
    predetermined value-relevant words = in proj 1
  * all participants were required to have min 200 words used across updates
    (participants meeting criteria: N = 130, 828)
  * demographics: Those users who had completed demographic surveys reported an
    average age of 25.3 years (SD = 11.1), and 56% female
  * SVS: Additionally, a subsample of the myPersonality dataset also completed
    the SVS online (N = 1, 260). Average SVS scores were ~ proj 1' AMT sample

## Anal

* tab 7: SVS scores were correlated with the MEM-derived themes
  * Again, we see only partial coverage of SVS values
  * a decrease in the predictive coverage of the SVS
    with regard to value-laden words in participant status updates
    * as expected – unlike Project 1, participants are not likely to be
      explicitly enumerating their core values
    * these results also suggest that those constructs measured by the SVS may
      not permeate into everyday life to the extent that researchers assumed,
      whereas value-laden language does
* links between core values and other aspects of mental life, primarily behav
  * As was described for the first project:
  * 1st: MEM to extract topical themes from the filtered myPersonality corpus
  * resulted in 30 broad themes found within Facebook user updates (Tab 8)
  * themes not intuitively reflecting cognition or behavior were excluded
    * Extraneous themes largely reflected culture (eg spelling variants eg
      “neighbour” and “arse” from the U.K.) or verbal fries (eg “gurl”, “cuz”)
    * Retention of these themes did not alter the results or conclusions
  * A few/many of these themes have/not analogs to those themes found in the
    AMT behavior essay responses
    * yes (eg “Day to Day” and “Daily Routine”, “Children” and “Family Care”)
    * no: qualitatively novel topics
  * these topics give us insight into the things about which they are thinking
    (eg privacy, national issues, illness)
  * many of the behavioral themes that were extracted from the corpus included
    words that were also found within the MEM-derived value themes found in
    Project 1
    * Many behaviors in which people engage will necessarily be value-laden to
      some degree
    * we sought to minimize effect size inflation due to shared word use
      between Project 1’s MEM-derived value themes and Project 2’s MEM-derived
      behavioral themes
    * words that appeared in both sets of themes were systematically omitted
      from the behavioral themes prior to quantification
    * each Facebook user’s entire set of posts was then quantified along each
      MEM-derived behavioral dimension using the same word counting approach
      As with value-relevant words described above
* analysis parallel to that described for Project 1 in order
  to explore the degree to which the language-derived value themes and SVS
  value scores corresponded to the self-described behaviors and ideas present
* results: tab 9. two primary aspects
  1. conceptual replication of Project 1 in terms of value-behavior relship
    * SVS scores appear to show little correspondence with the actual behaviors
      and ideas
    * language-derived values show considerable and consistent relationships
      with behavioral topics
  2. SVS appears to correspond to rather narrow bands of behavioral themes,
    nL the language-derived values show extensive coverage of behaviors in
    predictive terms
    * ie proj 2 not only conceptually replicates proj 1, but demonstrates the
      applicability of the language-derived value themes to a completely new
      set of themes pertaining to the common thoughts and behaviors of social
      media users in the real world

# Conclusions 8

* We have collected and analyzed
  * one new, crowd-sourced dataset and
  * one archival social media user dataset
  * understand the relationships between people’s values and their behaviors
* the SVS set provides substantially less predictive coverage of behaviors than
  a set of values extracted from people’s own descriptions
  * asking people what is important to them turns out to be more informative
  * the simple word counting approach appears to be a viable method for value
* we examined a large-scale social media data set to explore
  * whether the language of values would continue to exhibit relationships with
    the ideas and behaviors that people share in their Facebook status updates
  * consistently strong support for language-based value–behavior links
* A new set of values has been identified
* our method allows for the simple, intuitive lexical representation of values
  * requires a large enough body of text
  * easily achieved by using more social media data, blog data, and other forms
