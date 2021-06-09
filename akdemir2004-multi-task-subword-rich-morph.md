Hierarchical Multi Task Learning with Subword Contextual Embeddings for Languages with Rich Morphology
Arda Akdemir, Tetsuo Shibuya, Tunga Güngör
arXiv:2004.12247 [cs.CL]

https://anonymous.4open.science/r/1afb86c7-4340-4c2a-9f0b-f1145f67eb80/

* Morphological information is important for sequence labeling tasks in Natural
  * existing approaches rely heavily on manual annotations or external software to
* we propose using subword contextual embeddings to capture the morphological
  * for languages with rich morphology. In addition, we
  * incorporate these embeddings in a hierarchical multi-task setting which is
  * Evaluated on Dependency Parsing (DEP) and Named Entity Recognition (NER)
    * are shown to benefit greatly from morphological information, our final
  * outperforms previous SOTA models on both tasks for the Turkish language.
    Besides, we show a net improvement of 18.86% and 4.61% F-1 over the
    previously proposed multi-task learner in the same setting for the DEP and
    the NER tasks, respectively. Empirical results for five different MTL
    settings show that incorporating subword contextual embeddings brings
    significant improvements for both tasks. In addition, we observed that
    multi-task learning consistently improves the performance of the DEP
    component.

# 5 Conclusion

* By refining the task-specific components for each task and by incorporating
  the subword contextual embeddings we outperformed SOTA models for both
  Dependency Parsing and Named Entity Recognition for the Turkish language. The
  results also show that incorporating multi-task learning brings further
  improvements.
* future work:
  * other languages with rich morphology. Further gains may be possible by
  * incorporating character-level embeddings and through extending the
    multi-task framework to include more tasks. To promote future research, we
