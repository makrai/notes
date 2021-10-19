TSDAE: Using Transformer-based Sequential Denoising Auto-Encoder 
  for Unsupervised Sentence Embedding Learning
Kexin Wang, Nils Reimers, Iryna Gurevych
arXiv:2104.06979 [cs.CL]

* we present TSDAE, a new SOTA unsupervised method
  * based on pre-trained Transformers and Sequential Denoising Auto-Encoder
  * outperforms previous approaches by up to 6.4 points
  * up to 93.1% of the performance of in-domain supervised approaches
* TSDAE is a strong pre-training method for learning sentence embeddings,
  significantly outperforming other approaches like Masked Language Model
* A crucial shortcoming of previous studies is the narrow evaluation
  * the single task of Semantic Textual Similarity (STS)
    * not require any domain knowledge
  * we evaluate TSDAE and other recent approaches on four different datasets
    from heterogeneous domains
