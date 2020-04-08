Kevin Clark, Minh-Thang Luong, Quoc V. Le, Christopher D.  Manning
ELECTRA: Pre-training Text Encoders as Discriminators Rather Than
https://arxiv.org/abs/2003.10555 arXiv.orgarXiv.org

# Abstract

* we propose replaced token detection. Instead of masking the input, our
  * corrupts [text] by replacing some tokens with 
    plausible alternatives sampled from a small generator
* more efficient than MLM because the task is defined over all input tokens
* substantially outperform BERT given the same model size, data, and compute.
  * particularly for small models; for example, we train a model on one GPU for
    4 days that outperforms GPT (trained using 30x more compute) on the GLUE
* performs comparably to RoBERTa and XLNet while using less than 1/4 of their
  compute and outperforms them when using the same amount of compute
