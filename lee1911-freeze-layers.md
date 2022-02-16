What Would Elsa Do? Freezing Layers During Transformer Fine-Tuning
Jaejun Lee, Raphael Tang, Jimmy Lin
arXiv:1911.03090 [cs.CL]

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
