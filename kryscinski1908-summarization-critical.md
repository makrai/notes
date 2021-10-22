Neural Text Summarization: A Critical Evaluation
Wojciech Kryściński, NS Keskar, B McCann, Caiming Xiong, Richard Socher
EMNLP 2019

# Abstract

* progress on benchmark datasets has stagnated
* We critically evaluate key ingredients of the current research setup:
  * datasets, evaluation metrics, and models
* three primary shortcomings:
  * automatically collected datasets leave the task underconstrained and
    may contain noise detrimental to training and evaluation
  * weakly correlated with human judgment and does
    not account for e.g. factual correctness
  * models overfit to layout biases of current datasets and offer
    limited diversity in their outputs

# 1 Intro

* Two strategies of generating summaries are
  * extractive (Dorr+ 2003; Nallapati+ 2017): salient fragments are copied
  * abstractive (Rush+ 2015; See+ 2017): salient parts are paraphrased
* Advancements in
  * NN archit (Sutskever+ 2014; Bahdanau+ 2015; Vinyals+ 2015; Vaswani+ 2017)
  * large scale data (Sandhaus, 2008; Nallapati+ 2016a; Grusky+ 2018)
* Current approaches to text summarization utilize
  * attention and copying mechanisms (See+ 2017; Tan+ 2017; Cohan+ 2018)
  * multi-task and multi-reward training techniques
    (Guo+ 2018; Pasunuru and Bansal, 2018; Kryściński+ 2018)
  * reinforcement learning strategies
    (Paulus+ 2017; Narayan+ 2018b; Dong+ 2018; Wu and Hu, 2018), and
  * hybrid extractive-abstractive models
    (Liu+ 2018; Hsu+ 2018; Gehrmann+ 2018; Chen and Bansal, 2018)
* benchmark: CNN/DailyMail (Nallapati+ 2016a) news corpus, a popular benchmark
  * evaluated based on n-gram overlap with the ROUGE package (Lin, 2004)
* progress on these benchmarks has stagnated
  * SOTA models only slightly outperform the Lead-3 baseline,
    i.e. extracting the first three sentences of the source document
* research setup involves uncurated, automatically collected datasets and
  non-informative evaluations protocols
* Our motivation is to shift the focus: developing a more robust research setup

# 6 Conclusions

* datasets require additional constraints to have well-formed summaries,
  current SOTA methods learn to rely too heavily on
  layout bias associated with the particular domain of the text
* current evaluation protocol
  reflects human judgments only weakly while also
  failing to evaluate critical features (e.g. factual correctness)
* future research directions
  * datasets, models less fit to a particular domain bias, & evaluation metrics
