On the Stability of Fine-tuning BERT:
  Misconceptions, Explanations, and Strong Baselines
Marius Mosbach, Maksym Andriushchenko, Dietrich Klakow
ICLR 2021 arXiv:2006.04884 [cs.LG]

Code to reproduce: https://github.com/uds-lsv/bert-stable-fine-tuning

# Abstract

* fine-tuning is an unstable process: training the same model with
  * multiple random seeds can result in a large variance of the task perf
* Devlin+ (2019); Lee+ (2020); and Dodge+ (2020) identified two poten reasons 
  * catastrophic forgetting and small size of the fine-tuning datasets
* we show that both hypotheses fail to explain the fine-tuning instability
  * we analyze BERT, RoBERTa, and ALBERT,
    fine-tuned on commonly used datasets from the GLUE benchmark, and show that
  * instability is caused by
    optimization difficulties that lead to vanishing gradients
  * the remaining variance of the downstream task performance can be attributed
    to differences in generalization where
    fine-tuned models with the same training loss exhibit noticeably different
    test performance
  * a simple but strong baseline that makes fine-tuning BERT-based models
    significantly more stable than the previously proposed approaches
