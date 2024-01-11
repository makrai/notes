Benchmarking for Public Health Surveillance tasks on Social Media
  with a Domain-Specific Pretrained Language Model
Usman Naseem, Byoung Chan Lee, Matloob Khushi, Jinman Kim, Adam G. Dunn
ACL 2022 The First Workshop on Efficient Benchmarking in NLP arXiv:2204.04521

https://huggingface.co/publichealthsurveillance/PHSBERT

# Abstract

* health info on social media to enhance public health surveillance (PHS)
  * identify possible outbreaks, forecast disease trends, monit emergency cases
  * ascertain disease awareness and response to official health correspondence
* pretrained language models (PLMs) have facilitated the development of several
  domain-specific PLMs and a variety of downstream applications
  * no PLMs for social media tasks involving PHS
* We present and release PHS-BERT, a transformer-based PLM
  * compared and benchmarked the performance of PHS-BERT on 25 datasets from
    different social medial platforms related to 7 different PHS tasks
  * PHS-BERT achieved SOTA performance on all 25 tested datasets

# 1 Intro

* Public health surveillance (PHS) is defined by the WHO (Aiello+ 2020)
  * Traditional PHS systems: time required to collect data (Hope+ 2006)
* Social media data provides an abundant source of timely data 
  * surveillance, sentiment analysis, health communication, and analyzing the
    history of a disease, injury, or promote health
  * Systematic reviews of studies that examine personal health experiences
    shared online reveal the breadth of 
    * application domains, which include
    * infectious diseases and outbreaks (Charles-Smith+ 2015), illicit drug use
      (Kazemi+ 2017), and pharmacovigilance support (Golder+ 2015).  These
    * potential in supporting PHS, augmenting adverse event reporting, and as
      the basis of public health interventions (Dunn+ 2018)
* deep learning in natural language processing (NLP)
  * pretrained language models (PLMs) that can be used for many tasks
  * BERT variants (Liu+ 2019; Lan+ 2019; Sanh+ 2019; Naseem+ 2021c)
  * domain-specific PLMs have been presented
    * in the biomedical field
      BioBERT, (Lee+ 2019) and BioALBERT, (Naseem+ 2020, 2021a)
    * BERTweet (Nguyen+ 2020) for 3 downstream tasks, ie part-of-speech
      tagging, named-entity-recognition, and text classification
    * COVID Twitter BERT (CT-BERT, Müller+ 2020) for 5 text classification
      tasks have been trained on datasets from Twitter
    * no for PHS from online text
    * all these LMs were evaluated with the selected dataset
* we present PHS-BERT, a new domain-specific contextual PLM
  trained and fine-tuned to achieve benchmark performance on various PHS tasks
  on social media
  * trained on a health-related corpus collected from user-generated content
  * the first largescale study to train, release and test a domainspecific PLM
    for PHS tasks on social media
  * PHS-BERT outperforms other SOTA PLMs on 25 datasets
    from different social media platforms related to 7 different PHS tasks,

# 2 Related Work

## 2.2 NLP for Public Health Surveillance

* The use of social media in conjunction with advances in NLP for PHS tasks
  (Paul and Dredze, 2017)
  * surveillance of mental disorders,
    eg identifying depression diagnosis, assessing suicide risk and
    stress identification, vaccine hesitancy and refusal,
    identifying common health-related misconceptions, sentiment analysis, and
    the health-related behaviors they support (Naseem+ 2022a,b)
* Rao+ (2020): a hierarchical method that used 
  * BERT with attention-based BiGRU and achieved
  * competitive performance for depression detection
* vaccine-related sentiment classification, Zhang+ (2020) classified
  tweet-level HPV vaccine sentiment using three transfer learning techniques
  (ELMo, GPT, and BERT) and found that a finely tuned BERT produced the best
* Biddle+ (2020) presented a method (BiLSTMSenti) that leveraged
  * contextual word embeddings (BERT) with word-level sentiment
* Naseem+ (2021b) presented a model that uses domain-specific LM and captures
  commonsense knowledge into a context-aware bidirectional gated recurrent netw
* an ordinal hierarchical attention model for Suicide Risk Assessment
  (Sawhney+ 2021)
  * text embeddings obtained by Longformer were fed to BiLSTM with attention
  * ordinal loss as an objective function
  * abstract: neural methods for assessing suicide risk on social media ignore
    the inherent ordinal nature across fine-grain levels of suicide risk
    * we reformulate suicide risk assessment as an Ordinal Regression problem,
* no PLM trained on health-related text collected from social media that
  directly benefit the applications related to PHS

## 3.3 Fine-tuning for downstream tasks

* We applied the pretrained PHS-BERT in the binary and multi-class classif of
  different PHS tasks 
  eg stress, suicide, depression, anorexia, health mention classification,
  vaccine, and covid related misinformation and sentiment analysis. We
* fine-tuned the PLMs in downstream tasks. Specifically, we used the
  * ktrain library (Maiya, 2020) to fine-tune each model indep for each dataset
* We used the embedding of the special token [CLS] of the last hidden layer as
  the final feature of the input text.  We adopted the
  * multilayer perceptron (MLP) with the hyperbolic tangent activation function
  * Adam optimizer (Kingma and Ba, 2014).  The models are trained with a
  * one cycle policy (Smith, 2017) at a maximum learning rate of 2e-05 with
    momentum cycled between 0.85 and 0.95

# 4 Experimental Analysis

## 4.1 Tasks and Datasets

* 7 different PHS classification tasks 
  * stress, suicidal ideation, depression, health mention, vaccine, covid
    related sentiment analysis, and other health-related tasks
  * collected from popular social platforms (eg Reddit and Twitter)
* 25 datasets (see Table 1) crawled from social media (eg Reddit and Twitter)
* Below we briefly discussed each task and dataset used in our study
  (appendix A for details)

1. Suicide: The widespread use of social media for expressing personal thoughts
   and emotions makes it a valuable resource for assessing suicide risk on
   social media. We used the following dataset to evaluate the performance of
   * R-SSD (Cao+ 2019) dataset to evaluate the performance of our model
2. Stress: It is desirable to detect stress early in order to address the
   growing problem of stress.  To evaluate stress detection using social media,
  * the Dreaddit (Turcan and McKeown, 2019) and SAD (Mauriello+ 2021) datasets
3. Health mention classification
  * people often use disease or symptom terms in ways other than to describe
  * identify posts where users discuss health conditions rather than using
    disease and symptom terms for other reasons
  * PHM (Karisani and Agichtein, 2018), HMC2019 (Biddle+ 2020) and
    RHMD 5 health mention-related datasets
4. Vaccine sentiment: Vaccines are a critical component of public health. On
  * vaccine hesitancy and refusal can result in clusters of low vaccination
     coverage, diminishing the effectiveness of vaccination programs
  * VS1 (Dunn+ 2020) and VS2 (Müller and Salathé, 2019) vaccine-related Twitter
5. COVID related: Due to the ongoing pandemic, there is a higher need for tools
  * identify COVID-19-related misinformation and sentiment on social media
    Misinformation can have a negative impact on public opinion and endanger
  * COVID Lies (Hossain+ 2020), Covid category (Müller+ 2020), and
    COVIDSenti (Naseem+ 2021d) 6 datasets to test our model
6. Depression: User-generated text on social media has been actively explored
   for its feasibility in the early identification of depression.  We used
  * eRisk T3 (Losada and Crestani, 2016), eRisk T1 (Losada and Crestani, 2016),
    Depression_Reddit_1 (Naseem+ 2022a) 7 , Depression_Reddit_2 (Pirina and
    Çöltekin, 2018), Depression_Twitter_1 8 , and Depression_Twitter_2 9
7. Other health related tasks
  * PUBHEALTH (Kotonya and Toni, 2020),
  * Abortion (Mohammad+ 2016) 10 ,
  * Amazon Health dataset (He and McAuley, 2016),
  * SMM4H T1 (Weissenbacher+ 2018), SMM4H T2 (Weissenbacher+ 2018) and
  * HRT (Paul and Dredze, 2012)

## 4.3 Baselines

* BERT (Devlin+ 2019), ALBERT (Lan+ 2019), and DistilBERT (Sanh+ 2019)
* BioBERT (Lee+ 2019) pretrained in the biomedical domain,
* CT-BERT (Müller+ 2020) and BERTweet (Nguyen+ 2020)
  pre-trained on covid related tweets
* MentalBERT (Ji+ 2021) pretrained on corpus from Reddit from mental
  health-related subreddits

# Appendix: Dataset description

1. Depression: We used 6 depression-related datasets in our experiments
  * eRisk T3: We used eRISK, a publicly available dataset, released by
    (Losada and Crestani, 2016) and
    * labeled across 4 depression severity levels using Beck’s Depression
      Inventory (Beck+ 1961) criteria to detect the existence of depression and
      identify its severity level in social media posts. eRISK was
    * later used in the CLEF’s eRISK challenge Task 3 11 on early
      identification of depression in social media
    * in each years’ challenge author released a small number of user’s data
      (ranging from 70-90 users data),
      we combined and used the data of the last 3 years, which is equivalent to
      190 Reddit users, labeled across 4 depression severity levels
  * Depression_Reddit_1: We used new Reddit depression data released by
    Naseem+ (2022a). This dataset consists of
    * 3,553 Reddit posts to identify the depression severity on social media
    * manually labeled data into 4 depression severity levels
      ie (i) minimal; (ii) mild; (iii) moderate; and (iv) severe  using
      Depressive Disorder Annotation scheme (Mowery+ 2015)
  * eRisk T1: The third depression data is from eRisk shared task 1 (Losada and
    Crestani, 2016), which is a public competition for detecting early risk in
    health-related areas. The eRisk data consists of
    * posts from 2,810 users, with 1,370 expressing depression and 1,440 as a
      control group without depression
  * Depression_Reddit_2: The fourth depression dataset used is released by
    Pirina and Çöltekin (Pirina and Çöltekin, 2018). The authors used Reddit
    to collect additional social data, which they combined with previously
    collected data to identify depression
  * Depression_Twitter_1
    * a publicly available
    * collected from Twitter and labeled into 3 labels (e.g., Positive,
      Negative, and Neutral) for depression sentiment analysis
  * Depression_Twitter_2
    * a public dataset 13 , collected from Twitter and labeled into 2 labels
      (e.g., Positive and Negative) for depression detection
2. Health Mention: We used 3 health mention-related datasets in our experiments
  * PHM (Karisani and Agichtein 2018)
    * 7,192 English tweets across 6 diseases and symptoms. They used the
      Twitter API to retrieve the data using the colloquial disease names as
      search keywords
    * They manually annotated the tweets and categorized them into 4 labels
    * In addition to 4 labels, similar to Karisani and Agichtein (2018)
      we also used binary labels for health mention classification
  * HMC2019 (Biddle+ 2020) extending the PHM dataset to include
    19,558 tweets and included labels related to figurative mentions, and
    included 4 more different disease or symptom terms (10 in total) for HMC
  * Reddit health mention dataset (RHMD, Naseem+ 2022b) for HMC task
    * 10K+ Reddit posts manually annotated with 4 labels (personal health
      mention, non-personal health mention, figurative health mention,
      hyperbolic health mention)
    * we used 3 label versions of data released by authors where they merged
      figurative health mention and hyperbolic health mention into 1 class
3. Suicide risk detection: We used the following dataset
  * R-SSD (Cao+ 2019), which contains
  * 500 individuals’ Reddit postings categorized into 5 increasing suicide risk
    classes from 9 mental health and suicide-related subreddits
4. Stress detection using social media, we evaluated PHS-BERT on the following
  * Dreaddit (Turcan and McKeown, 2019) collected from 5 Reddit forums
    * 3,553 posts, focus on three major stressful topics:
      interpersonal conflict, mental illness, and financial need
    * Posts in Dreaddit are collected from 10 subreddits,
      including some mental health domains such as anxiety and PTSD
  * SAD (Mauriello+ 2021) dataset, used to recognize everyday stressors
    * 6,850 SMS-like sentences
    * derived from stress management articles, chatbot-based conversation syss,
      crowdsourcing, and web crawling
    * Some of the more specific stressors are
      * work-related issues like fatigue or physical pain,
      * financial difficulties like debt or anxiety,
      * school-related decisions like final projects or group projects, and
      * interpersonal relationships like friendships and family relationships
5. Vaccine sentiment: We used two vaccine-related Twitter datasets
  * VS1: tweets about vaccine dissemination on Twitter
    from January 12, 2017, to December 3, 2019
    * Dunn+ (2020) crawled and labeled this data.  The total tweets count is
      9,212, with 6,683 positive, 1,084 negatives, and 1,445 neural tweets
  * VS2: tweets about measles and vaccinations
    obtained via the Twitter Streaming API between July 2018 and January 2019
    * provided by Müller and Salathé (2019)
    * The total number of tweets is 18,503, with 8,965 pro-vaccine tweets,
      1,976 anti-vaccine tweets, and 7,562 neutral tweets
6. COVID: We used 5 covid related datasets to test our model
  * COVID Lies (Hossain+ 2020)
    * 6761 tweets annotated by experts with known COVID-19 misconceptions
    * tweets that agree, disagree, or express no stance
  * Covid category (Müller+ 2020)
    Martin Müller, Marcel Salathé, and Per E Kummervold
    Covid-twitter-bert: An NLP model to analyse covid-19 content on twitter
    arXiv preprint arXiv:2005.07503
    * Amazon Turk annotators
      * Crowdbreaks was used to perform the annotation
    * tweet texts classified as personal narrative or news
  * COVIDSenti: We used a newly released large-scale sentiment dataset,
    * 90,000 COVID-19-related tweets obtained during the pandemic’s early
      stages, from February to March 2020
    * The tweets are labeled into positive, negative, and neutral sentiment
      * we used 3 subsets (COVIDSentiA, COVIDSentiB and COVIDSentiC) released
        by authors (Naseem+ 2021d)
7. Other health related tasks
  * PUBHEALTH (Kotonya and Toni, 2020)
    * automated fact-checking of public health claims that are explainable
    * labeled with its factuality (true, false, unproven, mixture)
  * Abortion
    * In SemEval 2016 stance detection task (Mohammad+ 2016), 5 target domains:
      legalization of abortion, atheism, climate change, feminism, and Hillary
    * We used the legalization of abortion in our experiments
  * Amazon Health dataset (He and McAuley, 2016) contains
    reviews of Amazon healthcare products and has
    4 classes: strongly positive, positive, negative, and strongly negative
  * Social Media Mining for Health (SMM4H) Shared Task 1 recognizing whether a
    tweet is reporting an adverse drug reaction (Weissenbacher+ 2018)
  * SMM4H T2: Drug Intake Classification (SMM4H Task 2, Weissenbacher+ 2018)
    * tweets manually categorized as definite intake/possible intake/no intake
  * HRT: Health related tweets (HRT, Paul and Dredze, 2012)
    * collected using Twitter and
      manually annot using Mechanical Turk as related or unrelated to health
    * Health-related tweets were further labeled as
      * sick (the text implied that the user was suffering from an acute
        illness, such as a cold or the flu) or
      * health (the text made general comments about the user’s or the other’s
        health, such as chronic health conditions, lifestyle, or diet) and
      * unrelated tweets were further labeled as
        * unrelated (not about a specific person’s health, such as news and
          updates about the swine flu or advertisements for diet pills) and
        * non-English
