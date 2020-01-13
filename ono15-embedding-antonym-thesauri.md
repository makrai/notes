M Ono, M Miwa, Y Sasaki
Word Embedding-based Antonym Detection using Thesauri and Distri Info
HLT-NAACL, 2015

# Abstract

evaluation results on the GRE antonym question task show that our model
outperforms the state-of-the-art systems and it can answer the antonym
questions in the F-score of 89%

# Intro

* embeddings have shown to capture
  * synonyms and analogies (Mikolov+ 2013b; Mnih and Kavukcuoglu, 2013;
    Pennington+ 2014)
  * named entity recognition (Turian+ 2010; Guo+ 2014),
    adjectival scales (Kim and de Marneffe, 2013) and
  * text classification (Le and Mikolov, 2014)
  * sentiment analysis (Tang+ 2014) and
  * dependency parsing (Bansal+ 2014; Chen+ 2014)
* antonym detection [with] thesauri information
  * state-of-the-art systems achieved over 80% in F-score on GRE antonym tests
  * Yih+ (2012) proposed a Polarity Inducing Latent Semantic Analysis
    * incorporated polarity information in two thesauri in LSA mx
    * used context vectors [not embed for] out-of-vocabulary words
  * Zhang+ (2014) proposed a Bayesian Probabilistic Tensor Factorization
    (BPTF) model to combine thesauri information and [pre-trained] word embeds
* We propose two models:
  * Word Embedding on Thesauri information (WE-T) model and a
    * supervised [learning of] synonym and antonym pairs in thesauri
  * Word Embeddings on Thesauri and Distributional information (WE-TD) model
    * incorporates corpus-based contextual information
