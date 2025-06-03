SRL4E – Semantic Role Labeling for Emotions: A Unified Evaluation Framework
Cesare Campagnano, Simone Conia, Roberto Navigli
ACL 2022 Dublin, Ireland

https://github.com/SapienzaNLP/srl4e

# Abstract

* a single sentence may express multiple, sometimes contrasting, sentims & emos
  * each with its own experiencer, target and/or cause
  * manually annotated data in order to investigate the capabilities
  * systems to capture the semantic constituents of emos
  * hE datasets are heterogeneous in size, domain, format, splits, emo categs,
    and role labels ~> comparisons across different works are difficult
* we: a unified evaluation framework focused on
  Semantic Role Labeling for Emotions (SRL4E), in which
  * we unify several datasets tagged with emotions and semantic roles by using
    a common labeling scheme
* we evaluate how modern pretrained language models perform + analysis

# 1 Intro

* applications of the automatic text emo identification, categ and analysis
  * hate speech detection (Markov+ 2021), 
  * sarcasm detection (Chauhan+ 2020),
  * modeling political discourse (Cabot+ 2021)
* Deep Learning techniques in emotion detection (Chatterjee+ 2019)
* annotate corpora with emotions manually (Bostan and Klinger, 2018)
* a short text, even a single sentence, may contain multiple – at times
  concurring, at other times contrasting – sentiments and emotions
  * two emotions in the same sentence may be experienced, targeted, and/or
    caused by different semantic constituents which,
  * similarly to predicate-argument structures in Semantic Role Labeling (SRL),
    can be linked to form abstract semantic structures
* potential applications in social media analysis, abuse detection, and other
  actively studied areas in NLP (Rajamanickam+ 2020) of such
* datasets aimed at investigating the capabilities of modern systems to parse
  emotional events (Oberländer+ 2020)
* heterogeneous structures and characteristics: size, domains, file format,
  splits and, most importantly, non-overlapping emotion categories
* we introduce a unified framework for Semantic Role Labeling for Emotions
  * In SRL4E, we unify several gold but heterogeneous datasets that contain
    annostations both for emotions and for their semantic constituents, so as
  * a new homogeneous dataset that covers diverse domains and that can be used
    to train, validate and evaluate current and future work
* contributions can be summarized as follows:
  * a unified gold benchmark for training and evaluating a system on Semantic
    Role Labeling for Emotions (SRL4E);
  * We show the inadequacy of training a model on domain-specific data
    and the benefits of our unified framework;
  * We show the advantages of bilingual transfer from English to Chinese, and
    vice versa, in SRL4E

# 2 Related Work

## Emotion classification datasets. Currently, there are a wide variety of

* different domains and using different annotation schemes. Among others,
  * emotional experiences (Scherer and Wallbott, 1994)
  * children’s fairy tales (Alm+ 2005)
  * news headlines (Strapparava and Mihalcea, 2007)
  * blog posts (Aman and Szpakowicz, 2007, 2008)
  * news (Lei+ 2014)
  * social media posts and reviews (Buechel and Hahn, 2017)
  * dialogs (Li+ 2017; Chatterjee+ 2019)
  * Facebook posts (Preoţiuc-Pietro+ 2016)
  * tweets (Mohammad, 2012; Mohammad and Bravo-Marquez, 2017;
    CrowdFlower, 2016; Liu+ 2017; Schuff+ 2017)
    * dense emotional content
* Bostan and Klinger (2018) created a unified resource for emotion classif
  comprising many of the aforementioned datasets, while
* Tafreshi and Diab (2018) added an additional clause-level annotation layer to
  some existing resources
* More recent efforts, such as

|------------------------------|----------------------------------|
|GoEmotion (Demszky+ 2020)     | Reddit comments                  |
|XED (Öhman+ 2020)             | multilingual subtitles           |
|CancerEmo (Sosea Caragea 2020)| blog posts about health problems |


  * their annotations are sentence-level
    * an oversimplification: they indicate only the overall sentiment and/or
      emotion that appears in a given text, neglecting the cases in which a
      short text, even a single sentence, may express multiple emotions
    * not indicate which part of the text elicits an emotion and who
      experiences, is the target of, or causes that emotion. As a con-
    * predictions are hard to interpret and more difficult to use in real-world
* we rely on resources that not only indicate emotions, but also identify their
  semantic constituents, namely, emotional CUEs, EXPERIENCER s, TARGETs and
  STIMULI

## Emotion Taxonomy

* Ekman (1992) proposed a set of six categories: anger, disgust, fear, joy,
  sadness and surprise
* Plutchik (1980): the same set with two additions: anticipation and trust
* Russell (1980) proposed the circumplex model where every emotion can be
  described by three continuous values: arousal, dominance and valence. More
* more fine-grained sets of emotions, ranging
  from 12 (Cowen+ 2019b) to 28 categories (Cowen and Keltner, 2020),
  * devised depending on the modality of the study,
    eg speech prosody and facial expressions
* analysis of Demszky+ (2020) over a fine-grained set of 28 emotions suggests
  * a large number of categories results in more frequent disagreements on
    similar classes (such as anger and annoyance, or excitement and joy) ~>
    * low inter-annotator agreement and 
    * unbalanced distributions among some of these categories
* we adopt Plutchik’s Wheel of Emotions (Plutchik, 2001), which provides
  clearly distinct and well-defined coarse-grained categories, whose
  composition can be used to virtually describe all other fine-grained sets
  * some datasets in SRL4E (Mohammad+ 2014; Kim and Klinger, 2018;
    Bostan+ 2020) already use Plutchik’s or Plutchik-based categories

## Emotions and SRL. Over the past few years, automatic systems for

* SRL: impressive performance in predicate-argument relation labeling
  (Shi and Lin, 2019; Conia and Navigli, 2020; Blloshmi+ 2021; Conia+ 2021)
  * has long become useful tools in several downstream tasks, from
    Question Answering (He+ 2015) to Machine Translation (Marcheggiani+ 2018)
  * Defined by Màrquez+ (2008) as “Who did What to Whom, Where, When and How?”
  * almost a natural choice for the extraction of the semantic constituents of
    those events that elicit emotional states. Indeed,
  * emotional CUEs can be seen as particular types of predicates, and their
    semantic constituents as their arguments
* datasets for emotion detection that also provide this kind of more granular
  semantic information
  * Aman and Szpakowicz (2007) and Liew+ (2016) released corpora that indicate
    multiple emotions and their corresponding emotion CUEs in each sentence;
  * Ghazi+ (2015) and Gao+ (2017) indicate the cause of an emotion, with the
    latter providing such annotations both in English and in Chinese
  * Mohammad+ (2014), Mohammad+ (2015), Kim and Klinger (2018) and
    Bostan+ (2020)
    * annotations for emotion CUEs, EXPERIENCERs, TARGETs and STIMULI,
    * hE different sets of emotions in different domains
* btw
  * Bostan and Klinger (2018) for sentence-level Emotion Classification
  * Raganato+ (2017) for Word Sense Disambiguation
* SRL4E, not only/but
  * aggregate the resources under the same task formulation
  * manually correct their inconsistencies and unify the different emo schemes

# 3 SRL4E

## 3.3 Sources

,,,

### NTCIR 13 ECA.  A part of the NTCIR 13 Emotion Cause Analysis task

* 1,826 unique sentences from English novels and
* 2,022 unique sentences from Chinese news, annotated using Ekman’s classes
* emotion keywords and causes are annotated, CUE and STIMULUS respectively

### REMAN. Relational EMotion ANnotation by Kim and Klinger (2018), a corpus

* 1,720 fictional text excerpts from Project Gutenberg. These documents were
* annotation scheme includes emotion categories based on Plutchik’s set, CUE,
  EXPERIENCER, TARGET, STIMULUS, named entities, events and coreferences,
* For some sentences, we automatically identified and manually corrected some
  typos in order to increase the overall quality of this dataset

# 4 Data Analysis

## Emotion classes distribution. Fig 2

* Depending on the dataset, the distribution of emotion classes changes drastic
* eg
  * Elections, which contains random tweets related to an American election
    * almost 45% of samples are tagged with disgust, as one might expect: this is
    * the second most used class is trust in the tweets in favor of candidates
  * GNE, where the most frequent category is surprise, highlighting the
    sensationalistic tone typically found in newspaper headlines
* our unified dataset
  * the only category that appears more often is joy (20%), while
  * all the others are between 6% and 10%, approximately

## Other statistics. Table 4: heterogeneity in text and role lengths

* datasets containing sentences from similar domains share similar values
  * REMAN and the English version of NTCIR both come from novels and they have
    comparable text lengths, from 58 to 59 words on average. Instead,
  * Blogs (from online blog posts), Elections and EmoTweet (from tweets) have
    much shorter sentences, from 14 to 16 words, approximately
* almost all CUEs are very short, usually around 1-2 words
  * only those datasets involving tweets have a much higher value. In fact, in
    EmoTweet and Elections, CUEs contain 4 and 8 words on average,
  * dense emotional content and, therefore, their more trigger expressions. It
* all datasets feature a similar average length for STIMULI, regardless of the

## Borderline examples. Explicit CUE?

* SRL4E’s formulation is based on the presence of CUEs within sentences, which
  * even if it may be difficult to identify, as we want to be able to model
    multiple, sometimes opposite, emotions in the same sentence
  * the trigger of the emotion in that context
  * suits those domains where emotions are expressed explicitly, such as GNE,
    NTCIR and REMAN. However, handling CUEs becomes non-trivial in some
  * hE social networks (Elections and EmoTweet) and blog posts (Blogs). In
    * numerous implicit references and ironic content, where the mere presence
    * an emoji or a particular punctuation mark completely changes the context
* eg “@user Quieter. My sis, brother in law and habibti are going back to
  Ireland this afternoon [CUE ;/ ] Tennis doubles [sounds fun]!  CUE [Enjoy ]!
  #Juice!
  * the sadness emotion is associated only with the first CUE, which is “;/”,
  * the joy emotion is associated with the other two. Even if a CUE is composed

# 5 Experiments

## 5.4 Result Analysis

* Results generally benefit from a unified resource
* emotion classification and STIMU LUS identification almost always struggle
  in outof-domain evaluations, while they perform
  * better when the model is trained on all the datasets at the same time
* The only exception is CUE identification
  * when our model is trained on all the data in SRL4E, the performance drops
    when measured on each dataset separately. This is to be expected: while
  * because CUE s appear in very different forms (eg
    * Twitter usually contains highly informal language with explicit emotions,
    * news headlines tend to try to describe events objectively, making
      emotions more implicit)
  * when the datasets share a similar domain, the model is able to generalize
    * even in cross-lingual settings (such as the English and Chinese versions
      of NTCIR), highlighting once again the advantages of unification

# 6 Conclusion and Future Work

* emotions in NLP have been gaining interest, due to their potential for
  * application to downstream tasks, but also for
  * enhancing the interpretability of automatic outputs, especially when
    emotions are accompanied by information about their semantic constituents,
* we collect, clean, and unify the annotation schemes of six datasets that
  provide information about emotions and their semantic roles, making it easy
* experiments demonstrate that our unified scheme is beneficial in each subtask
  * emotion classification and role (experiencer, target, stimulus)
    identification,
  * especially in bilingual settings (English-Chinese). With SRL4E, we hope to
    stimulate future research in this complex area at the intersection of
