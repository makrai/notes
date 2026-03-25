Navigating Prompt Complexity for Zero-Shot Classification:
  A Study of LLMs in Computational Social Science
Yida Mu, Ben P. Wu, William Thorne, Ambrose Robinson, Nikolaos Aletras,
  Carolina Scarton, Kalina Bontcheva, Xingyi Song
LREC COLING 2024 Torino, Italia 2024.lrec-main.1055

# Abstract

* training Instruction-tuned LLMs have computational demands
* we evaluate the zero-shot performance of ChatGPT and OpenAssistant
  in six Computational Social Science classification tasks
* we investigate the effects of various prompting strategies
  * the impact of prompt complexity, including the effect of incorporating
    label definitions into the prompt
  * use of synonyms for label names
  * the influence of integrating past memories during foundation model training
* in a zero-shot setting, current LLMs are unable to match the performance of
  smaller, fine-tuned baseline transformer models (such as BERT-large)
* different prompting strategies can significantly affect classif accuracy
  * variations in accuracy and F1 scores exceed 10%
* from the Conclusion
  * More detailed and complex prompts (eg by adding arXiv paper title and
    few-samples) do not necessarily enhance classification performance
  * The selection of specific words or phrases as the class label can
    considerably affect classification outcomes
* ie developing prompts for zero-shot classification presents a challenge
  * we recommend testing different prompt configurations before proceeding
  * keep in mind the
    * time [constraints](https://developers.openai.com/api/docs/guides/rate-limits/)
      * subtitle of the page: Understand API rate limits and restrictions
    * financial costs associated with LLMs (see Table 6)

# 1. Introduction

* Instruction fine-tuning (Ouyang+ 2022) has facilitated transfer learning
  for Large Language Models (LLMs) to unseen tasks at scale
* Social media analysis is an active area of research with complex tasks which
  can be utilised for harm reduction (Waseem+ 2017) and preventing the spread
  of misinformation (Zubiaga+ 2018). LLMs have great potential to assist
  * computational social science (CSS) tasks, both in automatic data annotation
    and social media analysis (Kuzman+ 2023; Reiss, 2023; Törnberg, 2023)
* understand the capabilities and limitations of the latest instruction
  fine-tuned LLMs for addressing such CSS tasks
* research questions (RQ):
  1. ? level of zero-shot performance LLMs can achieve in social media classif
    * compare to smaller SOTA LMs fine-tuned to the specific analysis task
  2. prompt strategies for social media classification tasks in a 0-shot
  3. data leakage. Was the pre-training corpus of the large model already?
* we: a series of controlled experiments to investigate the zero-shot perf of
  two off-the-shelf instruction fine-tuned LLMs using 
  different prompting strategies
  * GPT-3.5-turbo (GPT), the most widely used proprietary instruct fine-tuned
  * OpenAssistant-LLaMA (LLaMAOA, Köpf+ 2023), 
    an open source LLM instruction fine-tuned based LLaMA (Touvron+ 2023)
* six social media analysis NLP tasks to evaluate the classification performance
  * different prompt complexity levels (including providing few-shots examples
    and publication information of benchmark datasets in the prompt)
  * baselines employing standard techniques such as fine-tuning BERT
* Our main findings are:
  1. Task-specific fine-tuned models (eg, BERT-large) still generally tend to
     outperform LLMs in most zeroshot settings, 
     even when the fully fine-tuned model is significantly smaller
  1. prompting ensemble methods (eg, on synonyms) can increase the performance
  1. Detailed and complex prompting strategies are not necessary

# 2 Related work

* Ziems+ (2023) sets a roadmap for employing LLMs as data annotators by
  * prompting best practices and an evaluation of the zero-shot performance of
    13 language models on 24 tasks in computational social sciences. In the
  * we: a different set of benchmarks and various prompt modification strategs,
    * replacing labels with synonyms and 
    * incorporating arXiv paper titles.
* financial domain: Li+ (2023) reveal that ChatGPT and GPT-4 outperform the
  performance of supervised models, which have been fine-tuned
* To evaluate the zero-shot performance of ChatGPT for text classification,
  Kuzman+ (2023) compares against a fine-tuned XLM-RoBERTa model for the task of
  automatic genre classification in English and Slovenian. They show that 
  * ChatGPT outperforms the baseline on unseen datasets and that there is 
  * no drop in performance when provided with Slovenian examples. 
* Ganesan+ (2023) use Facebook posts to classify user personality traits, based
  on openness, conscientiousness, extroversion, agreeableness, and neuroticism.
  * GPT-3 performs poorly on binary and worse yet on tertiary ranking for each
    trait.
* mental health applications. 
  * Lamichhane (2023) evaluate ChatGPT’s ability to classify stress, depression,
    and suicidal inclination from Reddit posts.
    * ChatGPT significantly outperforms the majority baseline
* toxicity detection, Wang and Chang (2022) analyse GPT-3’s generative and
  discriminative zero-shot capabilities, finding that performance is only
  * perf slightly better than a random baseline. However, the authors argue that
  * the generative task allows for nuanced distinction of toxicity in the,
    somewhat subjective, binary setting.
* Törnberg (2023) find that ChatGPT-4 outperforms non-expert annotators in
  identifying the political affiliation of Democratic or Republican party
  members based on their tweets during the 2020 US election. 
* Wu+ (2023) use ChatGPT to rank the conservatism of representatives in the
  116th US Congress through a series of pairwise match ups, showing a 
  high correlation with DWNOMINATE scores.
* identifying machine-generated passages.
  * Mitchell+ (2023) propose DetectGPT, a perturbation-based zeroshot method 
  * Su+ (2023) further develop this approach with DetectLLM-LRR and -NPR,
    * improved efficiency and improved performance respectively.

# 3 Methodology

## 3.1. Prompting Strategies

* Following the prompting approaches described by Child+ (2019); Ziems+ (2023)
  * adding instructions after the context (eg, task description) and
  * using constraints (eg, ‘Only reply with Bragging’ or ‘Not Bragging.’) 
    * can effectively avoid cases of model uncertainty (eg, ‘As an AI model, I
      cannot answer this question.’) and guide models to generate the outputs
* Table 1: Prompt examples across different settings
  * Basic Instruction
    (ie Identify whether or not a tweet includes a bragging statement.)
    + Constraints (ie Only reply (bragging) or (not bragging).)
    + Text (eg, Tweet: Come watch me and @USER face off in 2K best of 3 series
      #braggingrights @USER you next boiiii.)
  * Basic     + T/L Desc
  * Basic Instruction
    + T/L Desc
    * Tweets that have been assigned to the class ‘pro vaccine’ express a
      positive opinion regarding the vaccination
    * Tweets belonging to the ‘anti vaccine’ class express a negative opinion
      towards COVID-19 vaccination
    * The ‘neutral’ class mainly includes news related to the development of
      vaccines, tweets that do not express a clear opinion, such as questions
      regarding the vaccine, informative tweets concerning vaccination
    + Constraints + Text Few-sample
  * Basic Instruction
    + Few-samples
    * Complaint: @USER @USER give the timeline by which I’ll receive my cashback
      which I should have received by 15th October 2017
    * Not Complaint: I just gave 5 stars to Nancy at @USER for the great service
      I received!
    + Constraints + Text Memory Recall
  * Basic Instruction
    + arXiv Paper Title (ie Recall this paper: Hateful symbols or hateful
      people? predictive features for hate speech detection on twitter.)
    + Constraints + Text

## Basic Instruction (Basic)

* adding the prompt before or after the text respectively

## Task and Label Description (T/L Desc): Building upon the Basic Instruction

* we use the labels and task descriptions detailed in the original papers on the
* format: ‘Basic Instruction + Task and Label Descriptions + Constraints + Text’

## Few-sample Prompting (Few-sample): We also test a few-sample prompting

* adding one example selected from the training set for each label.  The prompt
* ‘Basic Instruction + Few-shot Examples + Constraints + Text’. Note that using

## Memory Recall (Recall): We observe that

* both GPT and LLaMA-OA can recall papers published before September 2021
* arXiv papers are part of the training data of the LLMs,
  ~> we also include the title of the source paper in the prompt when evaluating
* ‘Recall this paper [Paper Title] + Basic Instruction + Constraints + Text’
* only perform experiments on datasets published before September 2021
* we examine the variations in performance across different checkpoints
  to assess whether instruction fine-tuning might influence the efficacy of the
  classification task

## 3.2. Synonyms

* Appropriate synonyms were selected by consulting https://www.thesaurus.com
* we substitute the names of each class with words that mean the same or similar
* eg offensive ~> ‘hateful’, ‘toxic’, and ‘abusive’
* two ensemble learning approaches to improve predictive performance by
  combining the outputs from all synonyms settings for each dataset
  * Ensemble Majority: We select the category that has been selected the most
    times across all synonym experiments
  * Ensemble All Agreed: a stricter setting that considers only model outputs
    that are in the same category (i.e., Complaint, Criticism, dissatisfac-
    tion, etc.) using all synonyms. For example, we consider the LLM that uses
    all synonyms predicted as complaints, otherwise they are considered
    non-complaints. We only report this metric for datasets with binary classes

# 6 Results (Sarcasm)

| Model                         | Accuracy |   F1 |
| ----------------------------| -------: | ---: |
| Logistic Regression           |     76.1 | 53.5 |
| BERT-large                    |     78.9 | 58.4 |
| GPT Basic After               |     74.3 | **65.8** |
| GPT Basic Before              |     62.9 | **59.7** |
| GPT T/L Desc                  |     61.3 | 57.9 |
| GPT Memory Recall             |     52.8 | 51.7 |
| GPT Few-sample                |     68.9 | 64.9 |
| LLaMA-OA Basic After          |     41.6 | 41.6 |
| LLaMA-OA Basic Before         |     64.4 | 54.8 |
| LLaMA-OA Basic (OAT 7)        |     61.4 | 38.8 |
| LLaMA-OA T/L Desc             |     75.9 | 49.9 |
| LLaMA-OA Memory Recall        |     78.1 | 43.9 |
| LLaMA-OA Memory Recall (OA 7) |     71.9 | 42.9 |
| LLaMA-OA Few-sample           |     71.3 | 42.6 |


# 7. Error Analysis

* focusing on shared errors across all synonym settings following (Ziems+ 2023)
* We manually check these wrong predictions 
  * unanimous error (Ziems+ 2023) := when the model agreed on an incorrect
    answer using different synonyms
  * some unanimous errors  are caused by incorrect or controversial ground truth
  * tab 5: the number of wrong predictions from the synonyms experiments on GPT
* On the other hand, we observe that LLaMA-OA often defaults to the majority
  * ie ‘not a bragging’ and ‘not sarcasm’
  * higher accuracy but a lower macro-F1 measure
* LLMs can still be utilised as data annotation tools (combined with human)
  * and also to identify incorrect annotations

# Limitations and Future Work

* more SOTA LLMs of various sizes eg GPT-4 13 and Mistral (Jiang+ 2023)
* alterations of the prompts
  * Arora+ (2022), has considered prompt aggregation as well as
  * using LLMs to auto-generate prompts
* chain-of-thought prompting, which improves LM performance by
  encouraging the LLM to output its intermediate reasoning steps
  (Wei+ 2022; Suzgun+ 2022)
* potential data leakage issues (Ziems+ 2023) by testing various prompts to
  verify whether our test sets have been exposed to GPT and OA
