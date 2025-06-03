Bilingual Learning of Multi-sense Embeddings with Discrete Autoencoders
Simon Šuster, Ivan Titov, and Gertjan van Noord
NAACL, 2016

http://github.com/rug-compling/bimu

# Abstract

* learning multi-sense word embeddings relying both on monolingual and
  bilingual information. Our model consists of an
  * encoder, which
    * uses monolingual and bilingual context (i.e. a parallel sentence) to
      choose a sense for a given word, and a
  * decoder which predicts context words based on the chosen sense.  The
  * two components are estimated jointly
* word representations induced from bilingual data outperform the monolingual
  counterparts across a range of evaluation tasks
  * (crosslingual information is not available at test time)

# Introduction

* [embeddings] in concrete NLP applications
  * Turian et al., 2010
  * Collobert et al., 2011
  * Bansal et al., 2014
    * for dependency parsing
  * Passos et al., 2014)
    * Lexicon infused phrase embeddings for named entity resolution
* polysemy explicitly
  * Huang et al., 2012
  * Tian et al., 2014
  * Neelakantan et al., 2014
  * Chen et al., 2014
    * Xinxiong Chen, Zhiyuan Liu, and Maosong Sun
      2014 EMNLP
      A unified model for word sense representation and disambiguation
  * Li and Jurafsky, 2015
* multilingual data, with largely two distinct goals in mind
  * obtain representations for several languages in the same semantic space,
    * transfer of a model (e.g., a syntactic parser)
    * Klementiev et al., 2012
    * Hermann and Blunsom, 2014
    * Gouws et al., 2014
    * Chandar A P et al., 2014
  * to yield better first-language embeddings
    * Guo et al., 2014
      * Learning sense-specific word embeddings by exploiting bilingual resources
    * Our paper falls in the latter, much less explored category. We adhere to
  * multilingual learning as a means of language grounding
    * Faruqui and Dyer, 2014b
    * Zou et al., 2013
    * Titov and Klementiev, 2012
      * Crosslingual induction of semantic roles
    * Snyder and Barzilay, 2010
    * Naseem et al., 2009
* polysemy ... can be ... partially resolved by looking at the translation
  * Kaji, 2003
    * from bilingual comparable corpora
  * Ng et al., 2003
  * Diab and Resnik, 2002
  * Ide, 2000
  * Dagan and Itai, 1994
  * Brown et al., 1991
    * Word-sense disambiguation using statistical methods
* We propose a
  * model that uses second-language embeddings as a supervisory signal in
    learning multisense representations in the first language
    * autoencoder with a discrete hidden layer encoding word senses
    * flexible as to the form of parallel data used in training
      * both the use of word and sentence-level alignments
  * findings
    * improves ... on a variety of intrinsic tasks for English, with the
      results superior to that of the baseline Skip-Gram model
    * robust across several settings, such as varying dimensionality,
      vocabulary size and amount of data
    * extrinsic POS-tagging ... also offers improvements
      * the standard Skip-Gram embeddings turn out to be the most robust
  * implementation of all the models [and the evaluation scripts are] available

# 2 Word Embeddings with Discrete Autoencoders

## 2.1 Learning and regularization

Optimizing the autoencoding objective is broadly similar to the learning
algorithm defined for multi-sense embedding induction in some of the previous
work (Neelakantan et al., 2014; Li and Jurafsky, 2015). Note though that this
previous work has considered only monolingual context

# 5 Evaluation Tasks

## 5.1 Word similarity

## 5.2 Supersense similarity

## 5.3 POS tagging

* we use the learned word representations to initialize the embedding layer
  of a neural network tagging model
* the same convolutional architecture as Li and Jurafsky (2015):

# 6 Results

We compare three embeddings models, Skip-Gram (S G ), Multi-sense (M U ) and
Bilingual Multi-sense (B I M U ), using our own implementation for each of
them

# 7 Additional Related Work

## Multi-sense models

* lines of research
  * sense induction as a separate, clustering problem that is
    followed by an embedding learning component
    (Huang et al., 2012; Reisinger and Mooney, 2010)
  * sense assignment and the embeddings are trained jointly
    (Neelakantan et al., 2014; Tian et al., 2014; Li and Jurafsky, 2015;
    Bartunov et al., 2015)

## Multilingual models

* [multilingual] multi-sense embedding models
  * Guo et al. (2014) perform a
    1. clustering translations prior to learning word embeddings
    2. sense induction step
      * translations ... are mapped to a source corpus using WSD heuristics
    3. a recurrent neural network is trained
      to obtain sense-specific representations
    * sense induction and embedding learning components are entirely separated
  * Bansal et al. (2012) use bilingual corpora to perform soft word clustering
* Single-sense representations in the multilingual context (Lu+ 15;
  Faruqui and Dyer, 14b; Hill+ 14a; Zhang+ 14; Faruqui and Dyer, 13; Zou+ 13)
  * goal of bringing the representations in the same semantic space
  * related: crosslingual setting
    * leverage training data in one language
      to build models for typically lower-resource languages
      (Hermann and Blunsom, 2014; Gouws et al., 2014; Chandar A P et al., 2014;
      Soyer et al., 2014; Klementiev et al., 2012; Täckström et al., 2012)
* Nalisnick and Ravi (2015)
  * infinite Skip-Gram model
  * embedding dimensionality is stochastic
  * exploit different dimensions to encode different word meanings
* Kawakami and Dyer (2015)
  * use bilingual supervision, but in a more complex LSTM network that is
    trained to predict word translations. Although they do not represent
    different word senses separately, their method produces representations
    that depend on the context. In our work, the second-language signal is
    introduced only in the sense prediction component and is flexible—it can be
    defined in various ways and can be obtained from sentence-only alignments
    as a special case
