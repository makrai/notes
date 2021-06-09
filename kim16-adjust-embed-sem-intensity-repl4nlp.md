JK Kim, MC de Marneffe, E Fosler-Lussier
Adjusting word embeddings with semantic intensity orders
repl4nlp 2016

# Abstract

we adjust word vectors using the semantic intensity information in addition to
synonyms and antonyms from WordNet and PPDB, and show
improved performance on judging semantic intensity orders of adjective pairs on
three different human annotated datasets.  1

# 1 Introduction

Word embedding models ...  directly used in word-level NLP tasks such as
  * antonym detection (Ono+ 2015; Pham+ 2015; Chen+ 2015)
  * knowledge relations (Toutanova+ 2015; Socher+ 2013; Bordes+ 2013)
  * and semantic scale inference (Kim and de Marneffe, 2013)
* approaches using semantic lexicons ... to adjust word vectors have recently
  * Faruqui+ (2015) adjusted each word vector to be in the middle between the
    initial position and its synonymous words.
  * Mrkšić+ (2016) used max-margin approaches to adjust each word vector with
  * Ono+ (2015), Pham+ (2015), and Liu+ (2015) jointly train [skip-gram] models
  * adjust words that are not listed in the semantic lexicons (Pham+ 2015), the
  * post-processing models are much more efficient and
    can be applied to word vectors from any kinds of models, which can
    perform better than the joint training models (Mrkšić+ 2016).
* modeling [as synonyms or antonyms is insufficient for an] intensity scale
  e.g. assume that “great” is erroneously between “bad” and “good”
* information about semantic scales can also provide accurate inferences: when
  * answers to a yes/no question that contains a gradable adjective does not
    (Horn, 1972; Hirschberg, 1985; de Marneffe+ 2010). For example, for the
* we infer semantic intensity orders with de Melo and Bansal (2013)’s approach
  and then use the intensity orders to adjust the word vectors.
* Evaluating on three different human annotated datasets, we show that the
  adjustment with intensity orders in addition to adjustments with synonyms and
  antonyms performs best in representing semantic intensities.
