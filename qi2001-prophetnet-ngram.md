ProphetNet: Predicting Future N-gram for Sequence-to-Sequence Pre-training
Weizhen Qi, Yu Yan, Yeyun Gong, Dayiheng Liu, Nan Duan, Jiusheng Chen, Ruofei Zhang, Ming Zhou
EMNLP 2020 Findings. Project page: this https URL

https://github.com/microsoft/ProphetNet

* a new sequence-to-sequence pre-training model called ProphetNet, which
  * self-supervised objective named future n-gram prediction
  * n-stream self-attention mechanism. Instead of optimizing one-step-ahead
    * n-step ahead prediction that predicts the next n tokens simultaneously
    * prevent overfitting on strong local correlations
* We pre-train ProphetNet using
  a base scale dataset (16GB) and a large-scale dataset (160GB), respectively
* experiments on CNN/DailyMail, Gigaword, and SQuAD 1.1 benchmarks for
  abstractive summarization and question generation tasks.  Experimental results
  * new SOTA results on all these datasets
    compared to the models using the same scale pre-training corpus
