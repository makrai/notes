Don't Use English Dev: On the Zero-Shot Cross-Lingual Eval of Contextual Embeds
Phillip Keung, Yichao Lu, Julian Salazar, Vikas Bhardwaj
EMNLP 2020 arXiv:2004.15001 [cs.CL]

# Abstract

* published results for mBERT zero-shot accuracy vary as much as
  17 points on the MLDoc classification task across four papers
* We show that the standard practice of
  using English dev accuracy for model selection in the zero-shot setting
  makes it difficult to obtain reproducible results on the MLDoc and XNLI tasks
  * English dev accuracy is often uncorrelated (or even anti-correlated) with
    target language accuracy, and
  * zero-shot performance varies greatly during the same fine-tuning run and
    between different fine-tuning runs
  * issues also present for other tasks with different pre-trained embeddings
    (eg, MLQA with XLM-R)
* We recommend providing oracle scores alongside zero-shot results: still
  fine-tune using English data, but choose a checkpoint with the target dev set
  * makes results more consistent by avoiding arbitrarily bad checkpoints

# 1 Intro

* zero-shot := no parallel text or labeled data from the target language
  during model training, fine-tuning, or hyperparameter search
  * Standard practice prohibits the use of target language data for model select
  * the final model is chosen using the English dev set only
* hE, zero-shot mBERT results can vary greatly
  * Tab 1: 4 published baselines for zero-shot cross-lingual doc classif
    on MLDoc (Schwenk and Li, 2018)
  * while English accuracies are basically identical,
    target language performances are very different
  * each experiment starts with the same pre-trained mBERT model and MLDoc data
  * it is clear that these cross-lingual results are not reproducible
