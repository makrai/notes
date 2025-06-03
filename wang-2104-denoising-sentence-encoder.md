TSDAE: Using Transformer-based Sequential Denoising Auto-Encoder
  for Unsupervised Sentence Embedding Learning
Kexin Wang, Nils Reimers, Iryna Gurevych
arXiv:2104.06979 [cs.CL]

https://github.com/UKPLab/sentence-transformers/

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

# 1 Intro

* previous approaches
  * supervised, heavily relied on labeled data to train sentence embedding
    * InferSent (Conneau+ 2017),
    * Universial Sentence Encoder (USE) (Cer+ 2018) and
    * SBERT (Reimers and Gurevych, 2019)
  * unsupervised approaches have been proposed which learn to embed sentences
* We propose a new approach: Transformer-based Sequential Denoising Auto-Encoder
* evaluation, A crucial shortcoming of previous unsupervised approaches
  * mainly on the Semantic Textual Similarity (STS) task from SemEval (Li+ 2020;
    Giorgi+ 2021; Carlsson+ 2021; Gao+ 2021). As we argue in Section 4, we
    * not include sentences with domain specific knowledge, i.e., it remains
      unclear how methods will perform on more specific domains
    * artificial score distribution, and the
    * performance does not correlate with downstream task performances (Reimers+
      2016). In conclusion, it remains unclear, how well unsupervised sentence
* we compare TSDAE with previous unsupervised sentence embedding approaches on
  three different tasks
  (Information Retrieval, Re-Ranking and Paraphrase Identification), for
  heterogeneous domains and different text styles
* TSDAE
  * outperform other SOTA unsupervised approaches by up to 6.4 points
  * on-par or even outperform existent supervised models like USE-large, which
  * works well for domain adaptation and as a pre-training task
  * significant performance improvement compared to other pre-training tasks
    like Masked Language Model (MLM)
* contributions are three-fold
  * novel unsupervised method, TS-DAE based on denoising auto-encoders. We show
    * outperforms the previous best approach by up to 6.4 points on diverse data
  * compare recent unsupervised sentence embedding methods for various tasks on
    heterogeneous domains
    * To the best of our knowledge, we are the first
  * TSDAE outperforms other methods including MLM by a large margin as a
    pre-training and domain adaptation method
