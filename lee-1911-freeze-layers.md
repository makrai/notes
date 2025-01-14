What Would Elsa Do? Freezing Layers During Transformer Fine-Tuning
Jaejun Lee, Raphael Tang, Jimmy Lin
arXiv:1911.03090 [cs.CL]

# Abstract

* Pretrained transformer-based language models have achieved SOTA across tasks
  * at least a hundred million parameters and a dozen layers
  * Recent evidence: only a few of the final layers need to be fine-tuned
  * how many of the last layers do we need to fine-tune?
* We examine BERT and RoBERTa across standard tasks in textual entailment,
  semantic similarity, sentiment analysis, and linguistic acceptability
  * We vary the number of final layers that are fine-tuned
  * only a fourth of the final layers need to be fine-tuned to achieve 90% of
    the original quality
  * fine-tuning all layers does not always help

# 1 Intro

* do we need such a parameter-loaded model, especially on a single downst task?
  * Michel+ (2019): only a few attention heads need to be retained in each
    layer for acceptable effectiveness
  * Kovaleva+ (2019): on many tasks, just the last few layers change the most
    after the fine-tuning process
  * We take these observations as evidence that
    only the last few layers necessarily need to be fine-tuned
* our paper: how many of the last layers actually need fine-tuning
  * Why is this an important subject of study?
  * saves computational memory across fine-tuning multiple tasks, which
    bolsters the effectiveness of existing parameter-saving methods
    (Houlsby+ 2019)
  * understanding the relationship between the number of fine-tuned layers
    and the resulting model quality
* we: comprehensive evaluation of the number of final layers needed for fine-tu
  across multiple pretrained transformers and datasets,
  * on most tasks, we need to fine-tune only one fourth of the final layers
    to achieve within 10% parity with the full model
  * on SST-2, a sentiment classification dataset, we find that
    not fine-tuning all of the layers leads to improved quality

# 5 Conclusion

* future work: similar, more fine-grained analysis on the attention heads
