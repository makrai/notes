UR-FUNNY: A Multimodal Language Dataset for Understanding Humor
Md Kamrul Hasan, Wasifur Rahman, Amir Zadeh, Jianyuan Zhong,
  Md Iftekhar Tanveer, Louis-Philippe Morency, Mohammed (Ehsan)Hoque
EMNLP-IJCNLP, 2019, 2046-2056 arXiv:1904.06618 [cs.LG]

publicly available for research https://github.com/ROC-HCI/UR-FUNNY

# v2 created by removing the nosiy and overlapping data instances. This new

* more context sentences. We have added the link of the raw video here

# Abstract

* Humor is produced in a multimodal manner:
  words (text), gestures (vision) and prosodic cues (acoustic)
* unimodal humor detection is an established research area in NLP
  * the multimodal context is understudied
* we present a diverse multimodal dataset, called UR-FUNNY
  * diverse in both speakers and topics
  * three modalities of text, vision and acoustic
* We study this dataset through the lens of a
  Contextualized Memory Fusion Network (C-MFN)
* Results of our experiments indicate that humor can be
  * better modeled if all three modalities are used together
  * both context and punchline are important in understanding humor

# 1 Introduction

* Figure 1: UR-FUNNY
  * given a sequence of sentences: vision, acoustics, and transcript
  * goal: detect whether or not the sequence will trigger immediate laughter
    * ie whether or not the last sentence constitutes a punchline
    * similar to (Chen and Lee, 2017)

* Humor is a unique communication skill that removes barriers in conversations
  * allows a speaker to 
    * establish rapport (Stauffer, 1999), 
    * grab attention (Wanzer 2010), 
    * introduce a difficult concept without causing confusion (Garner 2005)
    * build trust (Vartabedian and Vartabedian, 1993)
  * multimodal communicative channels:
    words (text), accompanying gestures (vision) and sounds (acoustic)
  * how to mix and align those modalities: many different styles
    * gradually building up to a punchline using text, audio, video or in combo
    * a sudden twist to the story with an unexpected punchline
      (Ramachandran, 1998)
    * a discrepancy between modalities
      (eg, something funny being said without any emotion aka dry humor)
    * just laughing to stimulate the audience to mirror the laughter
      (Provine, 1992)
* Modeling humor using a computational framework is inherently challenging
  * Idiosyncrasy, creativity (Hauck and Thomas, 1972)
    adds to the dynamic complexity of how humor is expressed multimodally
    * Use of words, gestures, prosodic cues and their (mis)alignments are
      toolkits that a creative user often experiments with
  * Contextual Dependencies
    * humor often develops through time as
      speakers plan for a punchline in advance
      * a gradual build up in the story with a sudden twist using a punchline
        (Ramachandran, 1998)
      * Some punchlines when viewed in isolation may not appear funny (fig 1)
      * The humor stems from the prior build up, cross-referencing multiple
        sources, and its delivery
        => a full understanding requires analyzing the context of the punchline
* Understanding the unique dependencies across modalities and its impact
  * multimodal language; a recent research trend in NLP (Zadeh 2018b)
  * explain language from three modalities of text, vision and acoustic
  * we: computational descriptors for text, gestures such as smile, or
    vocal properties such as loudness are measured and put together
* URFUNNY: the first multimodal language  dataset of humor detection
  * text, vision and acoustic modalities
  * performance baselines for this task
  * we demonstrate the impact of using all three modalities together for humor

# 2 Background

## Humor Analysis: an active area of research in both NLP and affective comput

|Dataset          | #Pos #Neg   |Mod    |type       | #spk | paper              |
|-----------------|-------------|-------|-----------|------|--------------------|
|16000 One-Liners | 16000 16000 |{l}    | joke      |  ~   | Mihalcea and Strapparava, 2005	|
|Pun of the Day   |  2423  2423 |{l}    | pun       |  ~   | Yang 2015	      |
|PTT Jokes        |  1425  2551 |{l}    | political |  ~   | Chen and Soo, 2018	|
|Ted Laughter     |  4726  4726 |{l}    | speech    | 1192 | Chen and Lee, 2017	|
|Big Bang Theory  | 18691 24981 |{l,a}  | tv show   |  <50 | Bertero 2016	    |
|UR-Funny         |  8257  8257 |{l,a,v}| speech    | 1741 | 	                  |

* Table 1: Comparison between UR-FUNNY and notable humor detection datasets
* datasets in this area
  * different perspectives
  * eg “16000 One-Liner” and “Pun of the Day” focus on joke detection
    (joke vs not joke binary task)
  * “Ted Laughter” focuses on punchline detection
    (whether or not punchline triggers laughter)
    * Similar to “Ted Laughter”, UR-FUNNY focuses on punchline detection
    * Furthermore, punchline is accompanied by context sentences
      to properly model the build up of humor
  * negative samples were drawn from a different domain,
    * UR-FUNNY uses a challenging negative sampling case: from the same videos
    * UR-FUNNY is the only humor detection dataset which incorporates all three
      modalities of text, vision and audio
* modeling aspect, humor detection is done using
  * hand-crafted and non-neural models (Yang 2015)
  * RNN and CNN models for detecting humor
    in Yelp (de Oliveira 2017) and TED talks (Chen and Lee, 2017)
  * Chen and Soo (2018) used highway networks
    “16000 One-Liner” and “Pun of the Day” datasets
  * very few attempts at using extra modalities alongside language
    * adding simple audio features (Rakov and Rosenberg, 2013; Bertero 2016)
    * restricted to certain topics and domains
      eg “Big Bang Theory” TV show (Bertero 2016)

## Multimodal Language Analysis

* a recent research trend in natural language processing (Zadeh 2018b)
* novel multimodal neural architectures
  (Wang 2019; Pham+ 2019; Hazarika+ 2018; Poria+ 2017; Zadeh+ 2017),
* multimodal fusion approaches
  (Liang 2018; Tsai+ 2018; Liu+ 2018; Zadeh+ 2018a; Barezi+ 2018)
* resources
  (Poria 2018a; Zadeh+ 2018c, 2016; Park+ 2014; Rosas+ 2013; Wöllmer 2013)
* datasets mostly target
  * sentiment analysis (Poria 2018b),
  * emotion recognition (Zadeh 2018c; Busso+ 2008), and
  * personality traits recognition (Park 2014)
    * Sunghyun Park, Han Suk Shim, M Chatterjee, Kenji Sagae, L-Ph Morency.
      Computational analysis of persuasiveness in social multimedia:
        A novel dataset and multimodal prediction approach.
      International Conference on Multimodal Interaction, 2014 pages 50–57 ACM
* UR-FUNNY dataset is similar to the above datasets in diversity (speakers
  and topics) and size, with the main task of humor detection

## Non-NLP applications in multimodal ML

* language and vision studies, robotics, image captioning, and
  media description (Baltrušaitis 2019)

# 6 Results and Discussion

* The results of our experiments are presented in Table 4
* both context and punchline information are important: C-MFN outperforms
* Punchline is the most important component for detecting humor
  * the performance of C-MFN (P) is significantly higher than C-MFN (C)
* Models that use all modalities (T+A+V) outperform models that use only 1 or 2
  (T, T+A, T+V, A+V)
  * T > A + V
  * Most of the cases T + V, T + A > T
  * ie each neural component of the C-MFN model is useful
* human performance on the UR-FUNNY dataset is 82.5%
  * This is calculated by averaging the performance of two annotators
    over a shuffled set of 100 humor and 100 non-humor cases
    * The annotators are given the same input as the machine learning models
      (similar context and punchline).  The annotators agree 84% of times
  * still a large gap between human-level performance with SOTA
