Kawin Ethayarajh
How Contextual are ...? Comparing the Geometry of BERT, ELMo, and GPT-2
EMNLP 2019

#Abstract

* Are there infinitely many context-specific representations for each word, 
  * or are words essentially assigned one of a finite number of word-sense[s]
* In all layers of ELMo, BERT, and GPT-2, on average, 
  less than 5% of the variance in a word's contextualized representations can
  be explained by a static embedding

# 1 Intro

* linear probing models trained on frozen contextualized representations can
  predict linguistic properties of words almost as well as SOTA models 
  (Liu+ 2019a; Hewitt and Manning, 2019).  Still, these representations remain
* findings: 
  1. In all layers of all three models, the contextualized word representations
     of all words are not isotropic: they are 
     * not uniformly distributed with respect to direction. Instead, they are
     * occupying a narrow cone in the vector space. The anisotropy 
     * in GPT-2’s last layer, two random words will on average have almost
       perfect cosine similarity! Given that 
     * isotropy has both theoretical and empirical benefits for static
       embeddings (Mu+ 2018), the extent of anisotropy in contextualized
  2. upper layers of contextualizing models produce more context-specific 
    * Occurrences of the same word in different contexts are more dissimilar
      [in cosine similarity] to each other in upper layers. This suggests
    * like how upper layers of LSTMs produce more task-specific (Liu+ 2019a)
  3. Context-specificity manifests very differently in ELMo, BERT, and GPT-2. In
     * ELMo, representations of words in the same sentence grow more similar to
       each other as context-specificity increases in upper layers; in 
     * BERT, they become more dissimilar to each other in upper layers but are
       still more similar than randomly sampled words are on average; in 
     * GPT-2, however, words in the same sentence are no more similar to each
       other than two randomly chosen words.
  4. After adjusting for the effect of anisotropy, on average, 
    * less than 5% of the variance in a word’s contextualized representations
      can be explained by their first principal component.  This holds 
    * across all layers of all models. Still,
    * static embeddings created by taking the first principal component of a
      word’s contextualized representations outperform GloVe and FastText
      embeddings on many word vector benchmarks.
