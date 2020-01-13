Context-Dependent Sense Embedding
Lin Qiu and Kewei Tu and Yong Yu
2016 acl

# Abstract

* recent work on sense embedding uses
  * context clustering methods to determine the senses of words, which is
    heuristic in nature
  * Other work creates a probabilistic model and performs word sense
    disambiguation and sense embedding iteratively. However, most of the
    previous work has the problems of learning sense embeddings based on
    imperfect word embeddings as well as ignoring the _dependency between sense
    choices_ of neighboring words.  In this paper,
* we propose a novel probabilistic model for sense embedding that is not based
  on problematic word embedding of polysemous words and takes into account the
  dependency between sense choices. Based on our model, we derive a
  * dynamic programming inference algorithm and an Expectation-Maximization
    style unsupervised learning algorithm. The empirical studies show that our
  * outperforms the state-of-the-art model on a word sense induction task by a
    13% relative gain

# 1 Intro

* embeddings have been proven helpful in many NLP tasks
  * Collobert and Weston, 2008
  * Turian et al., 2010
  * Collobert et al., 2011
  * Maas et al., 2011
    * Andrew L Maas, R E Daly, P T Pham, D Huang, A Y Ng, and Christopher Potts
    * 2011.  Learning word vectors for sentiment analysis
  * Chen and Manning, 2014)
* Early work on sense embedding (
  * Reisinger and Mooney, 2010
  * Huang et al., 2012
  * Chen et al., 2014
    * Xinxiong Chen, Zhiyuan Liu, and Maosong Sun
    2014 EMNLP
    A unified model for word sense representation and disambiguation
  * Neelakantan et al., 2014
  * Kageback et al., 2015
    * Mikael Kageback, Fredrik Johansson, Richard Johansson, and D Dubhashi
      2015 NAACL
      Neural context embeddings for automatic discovery of word senses
  * Li and Jurafsky, 2015)
  * proposes context clustering methods which determine the sense of a word by
    clustering aggregated embeddings of words in its context.  This kind of
    methods is heuristic in nature and relies on external knowledge from
    lexicon like WordNet (Miller, 1995)
* complete probabilistic models and well-defined learning objective functions
  * Tian et al., 2014
  * Bartunov et al., 2016
  * Jauhar et al., 2015) become more
    * Sujay Kumar Jauhar, Chris Dyer, and Eduard Hovy
    2015 NAACL
    Ontologically grounded multi-sense representation learning for sem VSMs
  * choice of senses of the words in a sentence as hidden variables. Learning
    is therefore done with expectationmaximization style algorithms, which
    alternate between inferring word sense choices in the training corpus and
    learning sense embeddings
* common problem with these methods is that they
  * model the sense embedding of each center word dependent on the word
    embeddings of its context words. As we previously explained, word embedding
    of a polysemous word is not a good representation
  * choose the sense of each word in a sentence independently,
* we
  * similar structure to a high-order hidden Markov model. It contains a
    sequence of observable words and latent senses and models the dependency
    between each word-sense pair and between neighboring senses in the
    sequence. The energy of neighboring senses can be modeled using existing
    word embedding approaches
  * Given the model and a sentence, we can perform exact inference using
    dynamic programming and get the optimal sense sequence of the sentence. Our
    model can be learned from an unannotated corpus by optimizing a max-margin
    objective using an algorithm similar to hard-EM
  * determine the numbers of senses of polysemous words according to an
    existing sense inventory)
  * performance of our model on contextual word similarity task is
    competitive with previous work and we obtain a 13% relative gain compared
    with previous state-of-the-art methods on the word sense induction task of
    SemEval-2013

