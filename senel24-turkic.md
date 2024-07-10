Kardeş-NLU: Transfer to Low-Resource Languages with the Help of a High-Resource
  Cousin – A Benchmark and Evaluation for Turkic Languages
Lütfi K Senel, Benedikt Ebing, Konul Baghirova, Hinrich Schuetze, Goran Glavaš
EACL 2024

# Abstract

* Cross-lingual transfer (XLT) driven by massively multilingual language models
  (mmLMs) has been shown largely ineffective for low-resource (LR) target langs
  * low-res = little (or no) representation in mmLM’s pretraining, 
    especially if they are linguistically distant from the high-resource (HR)
    source language.
* Much of the recent focus in XLT research has been dedicated to LR language
  families, ie, families without any HR languages (eg families of African
  languages or indigenous languages of the Americas). In this work, in
* we investigate a configuration that is arguably of practical relevance for
  more of the world’s languages: XLT to LR languages that do have a close HR
  relative.
  * introduce Kardeş-NLU, an evaluation benchmark with 
    * language understanding datasets in five LR Turkic languages: Azerbaijani,
      Kazakh, Kyrgyz, Uzbek, and Uyghur; and 
  * investigate (a) intermediate training and (b) fine-tuning strategies that
    leverage Turkish in XLT to these target languages. Our experimental 
    * integrating Turkish
    * results show that both yield substantial improvements in XLT to LR Turkic
* we benchmark cutting-edge instruction-tuned large language models on
  Kardeş-NLU, showing that 
  * their performance is highly task- and language-dependent
