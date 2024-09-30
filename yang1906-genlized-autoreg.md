XLNet: Generalized Autoregressive Pretraining for Language Understanding
Zhilin Yang, Zihang Dai, Yiming Yang, J Carbonell, R Salakhutdinov, Quoc V Le
NeurIPS 2019

# Abstract

* BERT ie denoising autoencoding based pretraining
  * capability of modeling bidirectional contexts
  * better performance than pretraining approaches based on autoregressive LM
  * hE, relying on corrupting the input with masks, BERT
    neglects dependency between the masked positions
    * pretrain-finetune discrepancy
* XLNet, a generalized autoregressive pretraining method that
  * enables learning bidirectional contexts by maximizing the expected
    likelihood over all permutations of the factorization order and
  * overcomes the limitations of BERT thanks to its autoregressive formulation
  * integrates ideas from Transformer-XL, the SOTA autoregressive model, into
    pretraining
* Empirically, under comparable experiment settings, XLNet
  outperforms BERT on 20 tasks, often by a large margin, including
  QA, natural language inference, sentiment analysis, and document ranking
