Kawin Ethayarajh
How Contextual are ...? Comparing the Geometry of BERT, ELMo, and GPT-2
EMNLP 2019

                                extracting some use from contextualizing models

#Abstract

* Are there infinitely many context-specific representations for each word,
  * or are words essentially assigned one of a finite number of word-sense[s]
* In all layers of ELMo, BERT, and GPT-2, on average,
  less than 5% of the variance in a word's contextualized representations can
  be explained by a static embedding

# 1 Intro

* linear probing models trained on frozen contextualized representations can
  predict linguistic properties of words almost as well as SOTA models
  (Liu+ 2019a; Hewitt and Manning, 2019)
* [our] findings:
  * In all layers of all three models, the contextualized word representations
    of all words are not isotropic: they are
    * not uniformly distributed with respect to direction. Instead, they are
    * occupying a narrow cone in the vector space. The anisotropy
    * in GPT-2’s last layer, two random words will on average have almost
      perfect cosine similarity!
    * isotropy has both theoretical and empirical benefits for static
      embeddings (Mu+ 2018), the extent of anisotropy in contextualized
  * upper layers of contextualizing models produce more context-specific
    * Occurrences of the same word in different contexts are more dissimilar
      [in cosine similarity] to each other in upper layers
    * like how upper layers of LSTMs produce more task-specific (Liu+ 2019a)
  * Context-specificity manifests very differently in ELMo, BERT, and GPT-2
    * ELMo, representations of words in the same sentence grow more similar to
      each other as context-specificity increases in upper layers
    * BERT, they become more dissimilar to each other in upper layers but are
      still more similar than randomly sampled words are on average
    * GPT-2, however, words in the same sentence are no more similar to each
      other than two randomly chosen words
  * After adjusting for the effect of anisotropy, on average,
    * less than 5% of the variance in a word’s contextualized representations
      can be explained by their first principal component
    * across all layers of all models
    * static embeddings created by taking the first principal component of a
      word’s contextualized representations outperform GloVe and FastText
      embeddings on many word vector benchmarks

# 2 Related Work

## Contextualized Word Representations Given the limitations of static word

* ELMo (Peters+ 2018), BERT (Devlin+ 2018), and GPT-2 (Radford+ 2019) are deep
  * ELMo ... by concatenating the internal states of a 2-layer biLSTM trained
  * BERT and GPT-2 are bi-directional and uni-directional transformer-based LMs
    * transformer layer
      * of 12layer BERT (base, cased) and 12-layer GPT-2 creates a
      * by attending to different parts of the input sentence
        (Devlin+ 2018; Radford+ 2019). BERT – and subsequent iterations on
    * BERT (Liu+ 2019b; Yang+ 2019) – have achieved SOTA on e.g. QA & sentiment

## Probing Tasks

* Our work ... is more similar to Mimno and Thompson (2017), which studied the
  geometry of static word embedding spaces

# 3 Approach 3

## 3.4 Adjusting for Anisotropy 4

* isotropy [is important] when discussing contextuality
  * SelfSim ` (w) = 0.95 would suggest that w’s representations were poorly
* To adjust for the effect of anisotropy, we use three anisotropic baselines,
  one for each of our contextuality measures
  * for self-similarity and intra-sentence similarity,
    the baseline is the average cosine similarity
    between uniformly randomly sampled words from different contexts
  * For maximum explainable variance (MEV), the baseline is
    the proportion of variance in uniformly randomly sampled word reprs
    that is explained by their first principal component. The more anisotropic
* we calculate separate baselines for each layer as well
  * We then subtract from each measure its respective baseline
* references to contextuality measures in the rest of the paper refer to the
  anisotropy-adjusted measures
* both the raw measure and baseline are
  estimated with 1K uniformly randomly sampled word representations

# 4 Findings 4

## [From the Conclusion]

* increased context-specificity is always accompanied by increased anisotropy
  * anisotropy-adjusted similarity between words in the same sentence is
    highest in ELMo but almost non-existent in GPT-2

## 4.1 (An)Isotropy

* Contextualized representations are anisotropic in all non-input layers
* the greater the anisotropy, the narrower this cone (Mimno and Thompson, 2017)
* almost all layers of BERT, ELMo and GPT-2, the representations of all words
  * The only exception is ELMo’s input layer, which produces
    static character-level embeddings
    without using contextual or even positional information (Peters+ 2018). It
* Contextualized representations are generally more anisotropic in higher lays
  * average cosine similarity between uniformly randomly words is
    * roughly 0.6 in layers 2 through 8 but
    * increases exponentially from layers 8 through 12.  In fact, word
  * representations in GPT-2’s last layer are so anisotropic that any two words
    have on average an almost perfect cosine similarity!
  * pattern holds for BERT and ELMo as well, though there are exceptions:
    e.g., the anisotropy in BERT’s penultimate layer is much higher than last
* theoretical and empirical benefits for [isotropy in] static word embeddings
  * theory, it allows for stronger “self-normalization” during training
    (Arora+ 2017), and in
  * practice, subtracting the mean vector from static embeddings leads to
    improvements on several downstream NLP tasks (Mu+ 2018)
* anisotropy is inherent to, or least a by-product of, the process of
  contextualization

# 5 Future Work 9

* anisotropy
  * Mu+ (2018) found that making static embeddings more isotropic –
    * by subtracting their mean from each embedding –
    * leads to surprisingly large improvements in performance on downstream
  * isotropy ... may also have benefits for contextualized word
    representations,
    * anisotropy penalty to the language modelling objective
* static word representations from contextualized ones
  * challenges to deploying large models such as BERT in production, 
    both with respect to memory and run-time

# 6 Conclusion
