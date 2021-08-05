Deriving Contextualised Semantic Features from BERT (and Other Transformer Model) Embeddings 
Jacob Turton, Robert Elliott Smith, David Vinson
ACL 2021 | IJCNLP | RepL4NLP

# Abstract

* Binder+ (2016) proposed an intuitive embedding space where 
  * each dimension is based on one of 65 core semantic features. Unfortunately,
  * for a small data-set of 535 words, limiting its uses.  Previous work
* Utsumi, 2018, 2020; Turton+ 2020: Binder features can be derived from static
  embeddings and successfully extrapolated to a large new vocabulary.  Taking
* this paper demonstrates that Binder features can be derived from the BERT
  * provides insights into how semantic features are represented across layers
    * The results supported the findings of Jawahar+ (2019) that 
      semantic information tends to be represented in the later layers of BERT.

# 1 Introduction

* efforts for more interpretable embeddings e.g. (Şenel+ 2020; Panigrahi+ 2019),
  * the general approach has been to interpret them in relation to each-other.
    For example, the relative distance between word embeddings can indicate
    their semantic similarity (Schnabel+ 2015).  
* dimensionality reduction techniques to visualise the embedding space (Liu+ 17)

# 2 Related Work

## 2.1 Binder Semantic Features

* Through a meta-analysis, Binder+ (2016) identified 65 semantic features 
  * all believed to, and some demonstrated to, have neural correlates within the
  * 535 words scored by participants across the 65 features.  The features
  * ranged from concrete object properties such as visual and auditory, to more
    abstract properties such as emotional aspects.  This resulted in a

# 3 Experiment 1a: Deriving Binder Embeddings from BERT and other Transformers

## 3.5 Discussion

* Binder features derived from BERT embeddings, outperforming static Numberbatch
  * interesting as Numberbatch embeddings make use of additional human pro-
    vided information from a concept network, whereas BERT and the other models
* The poor performance of GPT-2 is not surprising 
  due to its uni-directional attention architecture. GPT-2 has shown success
* how the different semantic features are represented across the layers of BERT.
  * In line with the findings of Jawahar+ (2019), semantic features tended to be
    better represented by the later layers
  * hE, a small subset of features were better represented by the middle layers.
  * Clustering the features according to these behaviours did 
    * not match the Binder categories. However, the Binder categories are not
    * e.g. Cluster 3 (Human, Face, Speech, Body) relating to people and 
      * Cluster 2 captures 6 of the 7 features relating to audition.  
* Variation in how well different features were predicted by the models is 
  * more difficult to explain conclusively. 
  * it may be that certain features are better represented by the transformer
  * there is also variation in the underlying distributions of the different
    Binder features, with some more equally distributed across the score range
    * certain features with very unbalanced distributions, this may have had a

# 4 Experiment 1b: Towards Contextualised Binder Features

# 5 Experiment 2: Predicting Contextualised Features

## 5.1 Introduction

* data-set of contextualised semantic features for words in context pairs 
  (Van Dantzig+ 2011) can be used. 
  * In each context pair a 
    property word e.g. _abrasive_ is paired an 
    object word e.g. _lava_ and 
    participants scored the property word across five semantic features in a
  * the object should influence the meaning of the property word, in turn
  * Each property is paired with two different objects giving two word-pairs for
* we feeding the property-object pairs into the transformer models, the
* static version of its embedding can be created by taking the mean of the 2

# 6 Experiment 3: Evaluation of Contextualised Binder Embeddings
