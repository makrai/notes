James Foulds
Mixed Membership Word Embeddings for Computational Social Science
arXiv:1705.07368 cs.CL

# Abstract

* I propose a probabilistic model-based word embedding method which can recover
  interpretable embeddings, without big data. The key insight is to leverage
  mixed membership modeling, in which
  * individual entities (i.e. dictionary words) [use shared global
    representations to] differing degrees
* a combination of SOTA training techniques for word embeddings and topic models
* experimental results show an improvement in prediction
  * language modeling of up to 63% in MRR over the skip-gram
  * supervised learning
  * interpretability of the models illustrated with computational social
    science case studies on State of the Union addresses and NIPS articles

# 1 Introcuction

* embeddings follow a long line of research in data-driven semantic repr
  * latent semantic analysis (Deerwester+ 1990) and
  * its probabilistic extensions (Hofmann, 1999a; Griffiths+ 2007)
  * topic models (Blei+ 2003) have found broad applications in
    * computational social science (Wallach, 2016; Roberts+ 2014) and the
    * digital humanities (Mimno, 2012), where interpretable representations
* embeddings have not yet supplanted topic models in comp social science
  * this is due to two primary factors:
    reliance on big data, and a lack of interpretability
    * in this work, I develop new models to address both of these limitations
* “big” datasets are not always available in computational social science
  * data of interest are often obtained from sources such as
    press releases (Grimmer, 2010), academic journals (Mimno, 2012),
    books (Zhu+ 2015), and
    transcripts of recorded speech (Brent, 1999; Nguyen+ 2014; Guo+ 2015)
* need for effective word embeddings for small datasets,
  so that the most relevant datasets can be used for training
* Now an interpretable word embedding model, and an associated topic model,
  * data-efficient parameter sharing scheme via mixed membership modeling,
  * inspiration from topic models. Mixed membership models provide a flexible
    yet efficient latent representation, in which
  * entities are associated with shared, global representations, but to
    uniquely varying degrees
  * skipgram corresponding to a certain naive Bayes topic model, which
    leads to mixed membership extensions,
    allowing the use of fewer vectors than words
* performance measured by
  * predictive performance (when the context is leveraged for prediction), as
  * interpretable latent representations that are highly valuable
    * arises from defining word and hence doc embeddings in terms of topic
      embeddings

# Background on word embeddings, topic models, and mixed membership models

* Topic models such as latent Dirichlet allocation (LDA, Blei+ 2003) 
  * a class of probabilistic language models that 
    have been used for semantic representation (Griffiths+ 2007). 
  * unsupervised multinomial naive Bayes, in which
    a latent cluster assignment for each document selects a multinomial
    distribution over words, referred to as a topic
    words are assumed to be generated with topics
  * LDA topic models improve over naive Bayes by a mixed membership model,
    * the assumption that all words in a document d belong to the same topic is
      relaxed, and replaced with a distribution over topics θ (d)
    * generative process, for each word i in document d, a topic assignment z i
      is drawn via θ (d), then the word is drawn from the chosen topic φ (z i) 
    * a useful compromise between model flexibility and statistical efficiency:
      the K topics φ (k) are shared across all documents, thereby sharing
      statistical strength, but each document is free to use the topics to its
      own unique degree. Bayesian inference further aids data efficiency, as
      uncertainty over θ (d) can be managed for shorter documents
* combine topic models and word embeddings (Das+ 2015; Liu+ 2015)
  * not to address the small data problem
