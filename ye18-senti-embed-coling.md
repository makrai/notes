Zhe Ye, Fang Li, Timothy Baldwin
Encoding Sentiment Information into Word Vectors for Sentiment Analysis
COLING 2018

# Abstract

* methods have been proposed to encode external knowledge into word embeddings
* this paper is to encode sentiment knowledge into pre-trained word vectors
* Our ... method is based on a CNN and an external sentiment lexicon
* Experiments on four popular sentiment analysis datasets show that
  this method improves the accuracy of sentiment analysis
  compared to a number of benchmark methods

# 1 Intro

* deep neural networks, such as CNNs have been widely used for sentiment
* A simple CNN trained over pre-trained word vectors
  achieves highly competitive results (Kim, 2014)
* task-specific vectors through fine-tuning may offer further gains
* Separately, ... learning word embeddings based [on] external knowledge bases
  (Wieting+ 2015; Yu and Dredze, 2014; Xu+ 2014; Bian+ 2014;
  Faruqui+ 2015; Mrkšić+ 2016; Mrkšić+ 2017; Vulić+ 2017)
  * applied to sentiment classification (Rouvier and Favre, 2016; Yu+ 2017)
* Existing methods for encoding external knowledge into word vectors are
  generally trained independently of the downstream task
* we propose a novel method to combine
  a feedforward neural network (denoted “SentiNet”) with a CNN classifier
  to encode sentiment knowledge into word vectors during training
  * tunes word vectors through the CNN and SentiNet, based on
  * independent information from supervised training data and sentiment lex
* we compare our method with competitor methods that use
  antonymy/synonymy lexicons and paraphrase databases
* The major contributions of this paper are as follows:
  1. the sentiment lexicon is encoded into word vectors by a feedforward NN
  1. word vectors are fine-tuned based on supervised training data and the
    sentiment lexicon during the training of the CNN sentiment classifier
  1. we achieve SOTA accuracy over a range of benchmark sentiment analysis DSs

# 2 Related Work

## 2.1 Encoding External Knowledge into Word Vectors

* two categories of encoding external knowledge
  * during the word vector learning stage; and
    * change the objective function of the language model
      or add regularization terms into the original objective function
    * Yu and Dredze (2014) combine CBOW (Mikolov+ 2013) with word relations
      extracted from WordNet and PPDB
    * Xu+ (2014) regard relational knowledge and categorical knowledge as
      learning regularizers, and combine them with the skip-gram objective
      function
    * Bian+ (2014) also combine the objective function of CBOW with external
      syntactic and semantic knowledge
  * into pre-trained word vectors
    * lightweight because they adapt pre-trained word vectors
    * compatible with different kinds of word vectors
    * Wieting+ (2015) learn PARAGRAM word vectors by fine-tuning over
      paraphrase data from PPDB
    * Faruqui+ (2015) use synonym relations extracted from WordNet and other
      resources to construct an undirected graph
      * retrofit the undirected graph to pre-trained word vectors to obtain new
      * resulting vectors should be close to the vectors of their neighbours in
        the semantic graph
    * Antonyms are generally close in vector space, presenting a problem
      * antonym lexicons have been used to fine-tune pre-trained word vectors
      * Mrkšić+ (2016) present a method called counter-fitting to 
        * inject antonymy and synonymy constraints into word vectors trained
          with GloVe (Pennington+ 2014) and PARAGRAM (Wieting+ 2015) 
        * The adapted word vectors trained with PARAGRAM achieve the
          second-highest SimLex-999 (Hill+ 2015) score
      * Mrkšić+ (2017) extend this work using negative sampling, to force
        * synonym pairs to be closer to each other than to their negative
        * antonyms pairs to be further away from each other than from their neg
  * similar linguistic resources such as WordNet (Miller, 1995), FrameNet
    (Baker+ 1998), the Paraphrase Database (“PPDB”: Ganitkevitch+ (2013)), or
    BabelNet (Navigli and Ponzetto, 2012)
* evaluation
  * intrinsic evaluation such as WordSim-353 (Finkelstein+ 2002) and SimLex-999
  * extrinsic tasks such as
    * dialogue state tracking (Mrkšić+ 2016; Mrkšić+ 2017; Vulić+ 2017)
    * sentiment analysis (Faruqui+ 2015; Wieting+ 2015; Yu+ 2017)
    * document classification (Kiela+ 2015), and
    * word sense disambiguation (Rothe and Schütze, 2015)
* [The two method above] both ... before applying word vectors in downstream
  Our method [during] fine-tuning the word vectors in a downstream task

## 2.2 Adapting Word Vectors for Sentiment Analysis

* Maas+ (2011) combine ... a probabilistic document model and a sentiment
  component to learn word vectors
  * The probabilistic document model does not require labelled data
  * The sentiment component uses document-level sentiment annotations to
* Tang+ (2014) changed the objective function of the Collobert+ (2011) model to
  * for Twitter sentiment analysis, by large volumes of distant-supervised twts
* morphological and shape information from words, dos Santos and Gatti (2014)
  concatenate character-level embeddings and word-level embeddings
* Severyn and Moschitti (2015) refine pre-trained word vectors through a CNN
* Zhou+ (2016): the task-specific trained word vectors do not improve the sys
* Ren+ (2016) use a recursive autoencoder to learn topic-enhanced word vectors,
  * the same word can vary in sentiment according to topic
* Rouvier and Favre (2016)
  * lexical embeddings, part-of-speech embeddings, and sentiment embeddings —
* sentiment information as a kind of external knowledge.  They encode sentiment
  * by using customized objective functions or introducing regularization terms
    into objective function of the language model
  * Yu+ (2017) utilize a sentiment lexicon to rerank the nearest neighbors in
  * Tang+ (2016) leveraging a sentiment lexicon instead of distant-supervised
