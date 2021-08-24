TSDAE: Using Transformer-based Sequential Denoising Auto-Encoder 
  for Unsupervised Sentence Embedding Learning
Kexin Wang, Nils Reimers, Iryna Gurevych
arXiv:2104.06979 [cs.CL]

* we present a new SOTA unsupervised method
  * based on pre-trained Transformers and Sequential Denoising Auto-Encoder, TSDAE
  * outperforms previous approaches by up to 6.4 points. It can achieve
  * up to 93.1% of the performance of in-domain supervised approaches.  Further,
* TSDAE is a strong pre-training method for learning sentence embeddings,
  significantly outperforming other approaches like Masked Language Model
* A crucial shortcoming of previous studies is the narrow evaluation: Most work
  * the single task of Semantic Textual Similarity (STS), which does
    * not require any domain knowledge
  * we evaluate TSDAE and other recent approaches on four different datasets
    from heterogeneous domains
