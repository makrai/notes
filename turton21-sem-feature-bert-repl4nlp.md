Deriving Contextualised Semantic Features from BERT (and Other Transformer[s])
Jacob Turton, Robert Elliott Smith, David Vinson
ACL 2021 | IJCNLP | RepL4NLP

# Abstract

* Binder+ (2016) proposed an intuitive embedding space where
  * each dimension is based on one of 65 core semantic features
  * a small data-set of 535 words, limiting its uses
* Utsumi, 2018, 2020; Turton+ 2020: Binder features can be derived from static
  embeddings and successfully extrapolated to a large new vocabulary
* this paper demonstrates that Binder features can be derived from the BERT
  * insights into how semantic features are represented across layers
  * The results supported the findings of Jawahar+ (2019) that
    semantic information tends to be represented in the later layers of BERT

# 1 Introduction

* efforts for more interpretable embeddings eg (Şenel+ 2020; Panigrahi+ 2019),
  * the general approach has been to interpret them in relation to each-other
  * eg, the distance between word embeddings can indicate their semantic sim
    (Schnabel+ 2015)
* dim reduction techniques to visualise the embedding space (Liu+ 17)

# 2 Related Work

## 2.1 Binder Semantic Features

* Through a meta-analysis, Binder+ (2016) identified 65 semantic features
  * all believed to, and some demonstrated to, have neural correlates
  * 535 words scored by participants across the 65 features
  * features ranged from concrete object properties eg visual and auditory, to
    more abstract properties such as emotional aspects

# 3 Experiment 1a: Deriving Binder Embeddings from BERT and other Transformers

## 3.5 Discussion

* Binder features derived from BERT embeddings outperform static Numberbatch
  * interesting as Numberbatch embeddings make use of additional human pro-
    vided information from a concept network
* The poor performance of GPT-2 is not surprising
  due to its uni-directional attention architecture
* how the different semantic features are represented across the layers of BERT
  * In line with the findings of Jawahar+ (2019), semantic features tended to be
    better represented by the later layers
  * hE, a small subset of features were better represented by the middle layers
  * Clustering the features according to these behaviours did
    * not match the Binder categories
    * eg Cluster 3 (Human, Face, Speech, Body) relating to people and
      * Cluster 2 captures 6 of the 7 features relating to audition
* Variation in how well different features were predicted by the models
  * more difficult to explain conclusively
  * it may be that certain features are better represented by the transformer
  * there is also variation in the underlying distributions of the different
    Binder features, with some more equally distributed across the score range
    * certain features have very unbalanced distributions

# 4 Experiment 1b: Towards Contextualised Binder Features

# 5 Experiment 2: Predicting Contextualised Features

## 5.1 Introduction

* data-set of contextualised semantic features for words in context pairs
  (Van Dantzig+ 2011) can be used
  * In each context pair a
    property word eg _abrasive_ is paired an
    object word eg _lava_ and
    participants scored the property word across five semantic features
  * the object should influence the meaning of the property word
  * Each property is paired with two different objects giving two word-pairs
* we feeding the property-object pairs into the transformer models
* static version of its embedding can be created by taking the mean of the 2

# 6 Experiment 3: Evaluation of Contextualised Binder Embeddings
