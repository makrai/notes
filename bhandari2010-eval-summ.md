Re-evaluating Evaluation in Text Summarization
Manik Bhandari, Pranav Gour, Atabak Ashfaq, Pengfei Liu, Graham Neubig
EMNLP 2020 arXiv:2010.07100 [cs.CL]

# Abstract

* we re-evaluate the evaluation method for text summarization: assessing the
  reliability of automatic metrics using top-scoring system outputs, both
  abstractive and extractive, on recently popular datasets
  for both system-level and summary-level evaluation settings
* conclusions about evaluation metrics on older datasets do not necessarily
  hold on modern datasets and systems

# 6 Conclusion and Future

* future directions:
  * The choice of metrics depends not only on different tasks (e.g,
    summarization, translation) but also on different
    * datasets (e.g., TAC, CNNDM) and
    * system-level vs summary-level
  * Metrics easily overfit on limited datasets
    * Multidataset meta-evaluation can help us better understand each metric
      for diverse scenarios
  * Our collected human judgments can be used as supervision to instantiate
    the most recently proposed pretrain-then-finetune framework
    (originally for machine translation, Sellam+ 2020),
    learning a robust metric for text summarization
