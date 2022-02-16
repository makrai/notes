Scale Efficiently: Insights from Pre-training and Fine-tuning Transformers
Yi Tay, M Dehghani, J Rao, W Fedus, S Abnar, H Won Chung, S Narang, D Yogatama,
  A Vaswani, D Metzler
ICLR 2022 + Updated Checkpoint Release

over 100 pretrained checkpoints of different T5 configurations

* many open questions on the scaling behaviour of Transformers
  * computational cost has both financial and/or environmental impact
  * we: scaling insights from pretraining and finetuning Transformers
* Kaplan+: a comprehensive study of the scaling behaviour of Transformer LMs,
  * only on the upstream (pretraining) loss
  * still unclear if these findings transfer to downstream task
* our key findings
  * aside from only the model size, model shape matters for downstream fine-tun
  * scaling protocols operate differently at different compute regions,
  * widely adopted T5-base and T5-large sizes are Pareto-inefficient
    * we present improved scaling protocols whereby
      our redesigned models achieve similar downstream fine-tuning quality
      while having 50% fewer parameters and training 40% faster
      compared to the widely adopted T5-base model
