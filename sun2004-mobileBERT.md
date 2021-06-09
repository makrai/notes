MobileBERT: a Compact Task-Agnostic BERT for Resource-Limited Devices
Zhiqing Sun, Hongkun Yu, Xiaodan Song, Renjie Liu, Yiming Yang, Denny Zhou
ACL 2020 arXiv:2004.02984 [cs.CL]

* MobileBERT is a thin version of BERT_LARGE, while equipped with
  * bottleneck structures and balance between self-attentions and feed-forward
  * we first train a specially designed teacher model, an inverted-bottleneck
    incorporated BERT_LARGE model.  Then, we conduct knowledge transfer from
    this teacher to MobileBERT
* 4.3x smaller and 5.5x faster than BERT_BASE while achieving competitive result
  * a GLUE score o 77.7 (0.6 lower than BERT_BASE), and 62 ms latency on a Pixel
    4 phone
  * SQuAD v1.1/v2.0 question answering task, MobileBERT achieves a dev F1 score
    of 90.0/79.2 (1.5/2.1 higher than BERT_BASE)
