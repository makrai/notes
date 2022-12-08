Fine-Tuned Transformers Show Clusters of Similar Representations Across Layers
Jason Phang, Haokun Liu, Samuel R. Bowman
BlackboxNLP 2021 arXiv:2109.08406 [cs.CL]

# Abstract

* success of fine-tuning pretrained language encoders like BERT for NLU
* still poorly understood how neural networks change after fine-tuning
* we use centered kernel alignment (CKA),
  a method for comparing learned representations, to
  measure the similarity of representations in task-tuned models across layers
* across twelve NLU tasks, we discover
  a consistent block diagonal structure in the similarity of representations
  within fine-tuned RoBERTa and ALBERT models:
  strong similarity within clusters of earlier and later layers, but not
  between them
* The similarity of later layer representations implies that
  later layers only marginally contribute to task performance
* we verify in experiments that
  the top few layers of fine-tuned Transformers can be discarded
  without hurting performance, even with no further tuning
