Sentence-T5: Scalable Sentence Encoders from Pre-trained Text-to-Text Models
Jianmo Ni, GH Ábrego, Noah Constant, Ji Ma, KB Hall, Daniel Cer, Yinfei Yang
arXiv:2108.08877 [cs.CL]

* We investigate three methods for extracting T5 sentence embeddings: 
  * two utilize only the T5 encoder and one uses the full T5 encoder-decoder
* encoder-only models outperforms BERT-based sentence embeddings on both
  transfer tasks and semantic textual similarity (STS). Our 
* encoder-decoder method achieves further improvement on STS
* Scaling up T5 from millions to billions of parameters is found to produce
  consistent improvements on downstream tasks
* we introduce a two-stage contrastive learning approach that 
  * achieves a new SOTA on STS using sentence embeddings, outperforming both
    Sentence BERT and SimCSE
