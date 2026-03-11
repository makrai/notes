 SarcasmBench: Towards Evaluating Large Language Models on Sarcasm Understanding
                 Yazhou Zhang, Chunwang Zou, Zheng Lian, Prayag Tiwari, Jing Qin
                 arXiv:2408.11319 [cs.CL]

* LLMs: the task of _System I_ has been argued to be successfully solved
  * ie the fast, unconscious, and intuitive tasks,
    eg sentiment analysis, text classification, etc
* sarcasm, as a subtle linguistic phenomenon
* rhetorical devices like hyperbole and figuration to convey true sentiments
* we select eleven SOTA LLMs and eight SOTA pre-trained language models (PLMs)
  * comprehensive evaluations on six widely used benchmark datasets
  * different prompting approaches
    * zero-shot input/output (IO) prompting
    * few-shot IO prompting
    * chain of thought (CoT) prompting. Our results highlight three key
* findings:
  * LLMs underperform supervised PLMs based sarcasm detection baselines
    across six sarcasm benchmarks
  * GPT-4 consistently and significantly outperforms other LLMs
    across various prompting methods
    * average improvement of 14.0%↑
    * Claude 3 and ChatGPT demonstrate the next best performance after GPT-4
  * Few-shot IO prompting method outperforms zero-shot IO and few-shot CoT
    bec sarcasm detection, being a holistic, intuitive, and non-rational
    cognitive process, is argued
    not to adhere to step-by-step logical reasoning, making CoT less effective
    * compared to its effectiveness in mathematical reasoning tasks

## 4.1. Dataset

| Dataset                  | Train | Valid | Test | Sarcas| Not   |cited|
|--------------------------|------:|------:|-----:|------:|------:|-----|
| iSarcasmEval (Farha+ 22) |   821 |   280 |  299 |   200 |  1200 |  130|
| SemEval 2018 Task 3      |  2910 |   924 |  784 |  2222 |  2396 |  477|
| Ghosh (2016)             | 32708 |  8687 | 2000 | 19546 | 23839 |  406|
| IAC-V2 (Oraby+ 2017)     |  4031 |  1008 | 1481 |  3260 |  3260 |  184|
| IAC-V1 (Lukin& 2017)     |  1214 |   304 |  417 |   973 |   962 |  139|
| Riloff (2013)            |   276 |   100 |  113 |    77 |   412 |  928|

## IAC-V1 [31] and IAC-V2 [32] are from the Internet Argument Corpus (IAC) [37],

* sarcastic remarks within online debates and discussions
* balanced

## Ghosh [33] consists of 51,189 tweets (24,453 sarcastic and 26,736 non-sarc)

* sarcastic tweets are automatically collected from Twitter
  with sarcastic and ironic hashtags (eg #irony, #sarcasm). In this work,
* we have conducted a thorough double-check of this dataset and
* we successfully filtered out 7,804 noisy tweets

## iSarcasmEval [34] is the first shared task to target sarcasm detection

* Each sample in this dataset is labelled by the authors of the texts
* For sarcastic texts, there is a rephrase that conveys the same message
* For English sarcastic texts, there is a label specifying the category

## Riloff [35]

* 1,600 tweets that contain #sarcasm or #sarcastic
* and another 1,600 without these tags
* human annotators for final labelling

## SemEval 2018 Task 3 [36] is collected using irony-related hashtags

* #irony, #sarcasm, #not
* subsequently manually annotated
* It emhpasizes the challenges inherent in identifying sarcasm within the
  constraints of MUStARD’s concise format and
  highlights the importance of context and linguistic subtleties

## Bib

* S Lukin, M. Walker, 
  Really? well. apparently bootstrapping improves the performance of sarcasm and
  nastiness classifiers for online dialogue
  arXiv:1708.08572 (2017)
* S Oraby, V. Harrison, L. Reed, E. Hernandez, E. Riloff, M Walker, 
  Creating and characterizing a diverse corpus of sarcasm in dialogue, 
  arXiv:1709.05404 (2017).
* A Ghosh, T. Veale, 
  Fracking sarcasm using neural network
  2016 workshop on comp approaches to subjectivity, sentiment and social
* I A. Farha, S. Oprea, S. Wilson, W. Magdy, Semeval-2022 task 6: 
  iSarcasmEval, intended sarcasm detection in English and Arabic
  SemEval 2022
* E Riloff, A. Qadir, P. Surve, L. De Silva, N. Gilbert, R. Huang, 
  Sarcasm as contrast between a positive sentiment and negative situation
  EMNLP 2013 
* C Van Hee, E. Lefever, V. Hoste, Semeval-2018 task 3: 
  Irony detection in english tweets
  SemEval 2018
