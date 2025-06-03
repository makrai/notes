Hierarchical Multi Task Learning with Subword Contextual Embeddings
  for Languages with Rich Morphology
Arda Akdemir, Tetsuo Shibuya, Tunga Güngör
arXiv:2004.12247 [cs.CL]

https://anonymous.4open.science/r/1afb86c7-4340-4c2a-9f0b-f1145f67eb80/

* Morphological information is important for sequence labeling tasks in NLP
  * existing approaches rely heavily on manual annotations or external software
* we propose using subword contextual embeddings to capture morphology
  * for languages with rich morphology
  * incorporate these embeddings in a hierarchical multi-task setting
  * evaluated on Dependency Parsing (DEP) and Named Entity Recognition (NER)
    * are shown to benefit greatly from morphological information
  * outperforms previous SOTA models on both tasks for the Turkish language
    * a net improvement of 18.86% and 4.61% F-1 for the DEP and the NER tasks,
      over the previously proposed multi-task learner in the same setting
  * five different MTL settings show that incorporating subword contextual
  * significant improvements for both tasks. In addition, we observed that
  * multi-task learning consistently improves the performance of the DEP

# 5 Conclusion

* By refining the task-specific components for each task and by incorporating
  the subword contextual embeddings we outperformed SOTA models for both
  Dependency Parsing and Named Entity Recognition for the Turkish language
  * incorporating multi-task learning brings further improvements
* future work:
  * other languages with rich morphology
  * incorporating character-level embeddings and through 
  * extending the multi-task framework to include more tasks
