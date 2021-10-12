Evaluating Multilingual Text Encoders for Unsupervised Cross-Lingual Retrieval
Robert Litschko, Ivan Vulić, Simone Paolo Ponzetto, Goran Glavaš
ECIR'21 arXiv:2101.08370 [cs.CL]

* Pretrained multilingual text encoders based on neural Transformer
  architectures, such as multilingual BERT (mBERT) and XLM, have achieved strong
  performance on a myriad of language understanding tasks. Consequently, they
* a go-to paradigm for multilingual and cross-lingual representation learning
  and transfer, rendering 
  cross-lingual word embeddings (CLWEs) effectively obsolete.  
* hE, questions remain to which extent this finding generalizes 1) to
  unsupervised settings and 2) for ad-hoc cross-lingual IR (CLIR) tasks.
* we present a systematic empirical study focused on the suitability of the
  SOTA multilingual encoders for cross-lingual document and sentence retrieval
  tasks across a large number of language pairs
* In contrast to supervised language understanding, our results indicate that
  for unsupervised 
  * document-level CLIR -- a setup with no relevance judgments for IR-specific
    fine-tuning -- pretrained encoders fail to significantly outperform models
    based on CLWEs. For 
  * sentence-level CLIR, we demonstrate that SOTA performance can be achieved.
    with variants that have been further specialized for sentence understanding
