MLSUM: The Multilingual Summarization Corpus
Th Scialom, P Dray, S Lamprier, B Piwowarski, J Staiano
arXiv:2004.14900 [cs.CL]

* Obtained from online newspapers, it contains 1.5M+ article/summary pairs in
  * 5 languages -namely, French, German, Spanish, Russian, Turkish.  
  * Together with English newspapers from the popular CNN/Daily mail dataset,
    the collected data form a large scale multilingual dataset which can enable
    new research directions for the text summarization community. We report
* cross-lingual comparative analyses based on SOTA systems. These 
* highlight existing biases which motivate the use of a multi-lingual dataset. 
* strong baselines from multilingual abstractive text generation models;
* cross-lingual analysis of the results obtained by different approaches.

# 1 Intro

* summarization task requires several complex language abilities: understanding
  * discriminating what is relevant, and writing a short synthesis
* Over the last few years, rising popularity of this task
  (See+ 2017; Kryściński+ 2018; Scialom+ 2019)
* transfer learning techniques 
  enabled by the availability of pre-trained multilingual language models. This
  * the de-facto paradigm in NLP (Guzmán+ 2019).
  1. LM pre-trained on a large corpus of texts in multiple languages. Then, the
  2. model fine-tuned in one or more pivot languages 
    for which the task-specific data are available. At 
  3. inference: model applied to the different pre-training languages seen
* significant performance gap between English and the target language, e.g. for
  classification (Conneau+ 2018) and 
  * Question Answering (Lewis+ 2019) tasks. A similar 
  * summarization (Chi+ 2019) obtaining, again, a lower performance than for
* For specific NLP tasks, evaluation datasets in several target languages,
  allowing to evaluate the progress of the field in zero-shot scenarios.
* future work, we plan to add 
  * other languages including Arabic and Hindi, and to
  * adaptation of neural metrics to multilingual summarization.

# 2 Related Work 2

# 3 MLSUM 3

# 4 Models 5

# 5 Evaluation Metrics 6

# 6 Results and Discussion 7 

* The results presented below allow us to compare the models across languages,
* factors to explain differences in the results:
  1. data, independently from the language, such as the 
    * structure of the article, the abstractiveness of the summaries, quantity
    * have more to do with domain adaptation
  2. language – either due to 
    * metric biases (e.g. due to a different morphological type) or to 
    * biases inherent to the model.  
    * motivates further the development of multilingual datasets, since they are
      the only mean to study such phenomenon.
* Table 2 the ROUGE-L and METEOR scores by each model for all languages. We note
  * the overall order of systems (for each language) is preserved when using
    either metric (modulo some swaps between Lead 3 and Pointer Generator, but
    with relatively close scores)

### Russian, the low-resource language in MLSUM 

* For all experimental setups, the performance on Russian is comparatively low.  
* can be explained by at least two factors.  First, the 
  * corpus is the most abstractive (see Table 1, limiting the performance
    figures obtained for the extractive models (Random, LEAD-3, and Oracle).
  * one order of magnitude less training data is available for Russian than for
    * can explain the impressive improvement of performance (+66% in terms of
      ROUGE-L, see Table 2) 
      between a not pretrained (Pointer Gen) and a pretrained model (M-BERT)

## 6.1 How abstractive are the models?

## 6.2 Model Biases toward Languages 8

## 6.3 Possible derivative usages of MLSUM 9
