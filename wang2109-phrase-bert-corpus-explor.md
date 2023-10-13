Phrase-BERT: Improved Phrase Embeddings from BERT
  with an Application to Corpus Exploration
Shufan Wang, Laure Thompson, Mohit Iyyer
EMNLP 2021 arXiv:2109.06304 [cs.CL]

* Phrase representations derived from BERT often do
  not exhibit complex phrasal compositionality,
  as the model relies instead on lexical similarity to determine sem relatedn
* we propose a contrastive fine-tuning objective that
  enables BERT to produce more powerful phrase embeddings. Our approach
  * relies on a dataset of diverse phrasal paraphrases, which is 
    automatically generated using a paraphrase generation model, as well as a
    large-scale dataset of phrases in context mined from the Books3 corpus.
* outperforms baselines across a variety of phrase-level similarity tasks,
  * increased lexical diversity between nearest neighbors in the vector space.
* case study, we show that Phrase-BERT embeddings can be easily integrated with
  a simple autoencoder to build a phrase-based neural topic model that
  * topics as mixtures of words and phrases by performing a nearest neighbor
    search in the embedding space
* Crowd-sourced evaluations demonstrate that this phrase-based topic model
  * more coherent and meaningful topics than baseline word and phrase-level
    topic models, further validating the utility of Phrase-BERT. 
