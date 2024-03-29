Beyond bilingual: Multi-sense word embeddings using multilingual context
Shyam Upadhyay, Kai-Wei Chang, James Zou, Matt Taddy, Adam Kalai
2017 Rejected from ICLR, Best Paper at Workshop on Repl4NLP

# Abstract

* sense identification
* We present a multiview Bayesian non-parametric algorithm
  1. using multilingual corpora to significantly improve sense embeddings
     beyond what one achieves with bilingual information, and
  2. uses a principled approach to learn a variable number of senses per word,
     in a data-driven manner
* Ours is the first approach with the ability to leverage multilingual corpora
  efficiently for multi-sense representation learning
* our models combine different parallel corpora to leverage multilingual
  context
* performance comparable to a SOTA monolingual model trained on five times
  more training data

# 1 Introduction

* infer multi-sense word representations by modeling the
  sense as a latent variable in a Bayesian non-parametric framework
  (Reisinger and Mooney, 2010; Neelakantan+ 2014; Li and Jurafsky, 2015)
* learn multi-sense embeddings by exploiting the fact that different senses of
  the same word may be translated into different words in a foreign language
  * Guo+ 2014a;
  * Šuster, Titov, and van Noord, (2016)
    * sets a fixed number of senses for each word
* our approach
  * we concatenate multiple parallel corpora to obtain a large multiling corpus
  * parameters are estimated in a Bayesian nonparametric framework
    * only associate a word with a new sense vector when evidence (from either
      same or foreign language context) requires it

# 2 Related work

* two broad categories
  * two-staged approaches and
    (Reisinger and Mooney, 2010; Huang+ 2012)
    * induce multi-sense embeddings by first clustering the contexts and then
      using the clustering to obtain the sense vectors
    * contexts can be
      * topics induced using latent topic models
        (Liu, Qiu, and Huang, 2015; Liu+ 2015)
      * Wikipedia (Wu and Giles, 2015) or
      * coarse part-of-speech tags (Qiu+ 2014)
    * retrofitting (Faruqui+ 2015; Jauhar, Dyer, and Hovy, 2015), which
      * infuse semantic ontologies from resources like WordNet (Miller, 1995)
        and Framenet (Baker, Fillmore, and Lowe, 1998)
        into embeddings during a post-processing step
      * ontologies list (albeit not exhaustively) the senses of a word, and
        by retro-fitting it is possible to tease apart the different senses of
        a word
      * the number of senses of a word is highly dependent on the task and
        cannot be pre-determined using a lexicon (Kilgarriff, 1997)
      * parallel text for retrofitting sense-specific embeddings (Ettinger,
        Resnik, and Carpuat, 2016), their procedure requires creation of sense
        graphs, which introduces additional tuning parameters
  * joint learning approaches (Neelakantan+ 2014; Li and Jurafsky, 2015)
    jointly learn the sense clusters and embeddings, non-parametric
    * The closest non-parametric approach to ours is that of (Bartunov+ 2016),
      * a multisense variant of the skip-gram model
      * Our work can be viewed as the multi-view extension of their model
      * we compare our model to monolingually trained version of their model
* crosslingual distributional information ... for learning word embeddings,
  * improves performance on several downstream tasks
    (Faruqui and Dyer, 2014; Guo+ 2016; Upadhyay+ 2016)
  * multi-sense embeddings using crosslingual signals (Bansal, DeNero, and Lin,
    2012; Guo+ 2014a; Šuster, Titov, and van Noord, 2016)
    * only Šuster, Titov, and van Noord, (2016) being a joint approach
    * Kawakami and Dyer, (2015) also used bilingual distributional signals in a
      deep neural architecture to learn context dependent representations for
      words, though they do not learn separate sense vectors
