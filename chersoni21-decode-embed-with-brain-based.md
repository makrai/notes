Decoding Word Embeddings with Brain-Based Semantic Features

Emmanuele Chersoni, Enrico Santus, Chu-Ren Huang, Alessandro Lenci
CL 2021

# Abstract

* we explore the semantic properties encoded in word embeddings by
  mapping them onto interpretable vectors, consisting of
  explicit and neurobiologically motivated semantic features (Binder+ 2016)
  * different types of embeddings, including factorized count vectors and
    predict models (Skip-Gram, GloVe, etc.), as well as the most recent
    contextualized representations (ie, ELMo and BERT). In our analysis,
  * evaluate the quality of the mapping in a retrieval task, then we
  * shed light on the semantic features that are better encoded in each embed
  * A large number of probing tasks is finally set to assess
    how the original and the mapped embeddings perform in discrimin sem categs
    * For each probing task, we identify the most relevant semantic features
    * there is a correlation between the embedding performance and how they
      encode those features

# 1 Intro

* Binder+ (2016) proposed a set of cognitively motivated semantic primitives
  (henceforth, Binder features)
  derived from a wide variety of modalities of neural information processing
  * provided human ratings about the relevance of each feature for a set of
    English words (henceforth, Binder data set)
* We use these ratings to represent the words with continuous vectors of
  * learn a map from word embeddings dimensions to Binder features
  * Such mapping provides a human-interpretable correlate of word embeddings
  * question
    1.identifying which semantic features are best encoded in word embeddings;
    2.explaining the performance of embeddings in semantic probing tasks
* rel work mapping word embeddings onto semantic features
  (Făgărăs, an, Vecchi, and Clark 2015; Utsumi 2020), but to the best of our
  we: use mapped featural representations to interpret the semantic information
  learned by probing classifiers and to explain the embedding behavior in probin
  * ie we establish a bridge between the
    * research on semantic features and the challenge of
    * enhancing the interpretability of distributed representations, by
  * showing that featural semantic representations can work as an important key
    to open the black boxes of word embe
* The aim of the analysis is to
  * identify the most important semantic features for a given task
  * whether there is a correlation between the system performance and how those
    features are encoded by the embeddingsddings and of the tasks in which they

# 2 the main typologies of DSMs and related work on vector decoding. In Section

# 3 the Binder features, the method used to map word embeddings onto Binder
feature vectors, and we evaluate the mapping accuracy

# 4 which Binder features are best encoded by each type of embedding.  In

# 5 a series of probing tasks

* to verify how the original and mapped embeddings encode semantic categories
* eg animate/inanimate or positive/negative sentiment
* Some/other probing tasks focus on static embeddings/the token vectors
  produced by contextualized embeddings
