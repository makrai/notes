BARThez: a Skilled Pretrained French Sequence-to-Sequence Model
Moussa Kamal Eddine, Antoine J.-P. Tixier, Michalis Vazirgiannis
arXiv:2010.12321 [cs.CL]

# Abstract

* Inductive transfer learning with models such as BERT and BART setting new SOTA
* BARThez, the first large-scale pretrained seq2seq model for French
  * based on BART, BARThez is particularly well-suited for generative tasks
  * trained on 101 GB of text for 60 hours with 128 GPUs
* we evaluate BARThez on
  * five discriminative tasks from the FLUE benchmark and
  * two generative tasks from a novel summarization dataset, OrangeSum
    * more abstractive than traditional summarization datasets
    * can be considered the French equivalent of XSum (Narayan+ 2018)
  * very competitive with SOTA BERT-based French language models such as
    CamemBERT and FlauBERT
* We also continue the pretraining of a multilingual BART on BARThez' corpus,
  * our resulting model, mBARThez, to significantly boost BARThez' generative

# Introduction

* BART (Lewis+ 2019) combined a BERT-like bidirectional encoder with a
  GPT-like forward decoder, and pretrained this seq2seq architecture as a
  denoising autoencoder with a more general formulation of the MLM objectives
  * Since not only BART’s encoder but also its decoder is pretrained,
    BART excels on tasks involving text generation
* already existing BERT-based French language models such as
  CamemBERT (Martin+ 2019) and FlauBERT (Le+ 2019),
* We evaluate BARThez on
  * five sentiment analysis, paraphrase identification, and NLI tasks
    from the recent FLUE benchmark, and
  * two generative tasks from a novel French summarization dataset, OrangeSum,
    that we created for this research
* BARThez is very competitive with CamemBERT, FlauBERT, and mBART
* We also continue the pretraining of an already pretrained multilingual BART on
  BARThez’s corpus. Our resulting model, mBARThez, significantly boosts BARThez’
  performance on generative tasks
