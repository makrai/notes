Towards universal paraphrastic sentence embeddings
John Wieting Mohit Bansal Kevin Gimpel Karen Livescu
ICLR 2016

http://ttic.uchicago.edu/~wieting

# Abstract

* general-purpose, paraphrastic sentence embeddings
  based on supervision from the Paraphrase Database (Ganitkevitch+ 2013)
* We compare six compositional architectures,
  evaluating them on annotated textual similarity datasets
  * both in and cross-domain
  * on the in-domain data LSTM networks, perform best
  * in out-of-domain scenarios,
    simple architectures such as word averaging vastly outperform LSTMs
  * Our simplest averaging model is even competitive with systems tuned for the
    particular tasks while also being extremely efficient and easy to use
* further experiments on three supervised NLP tasks:
  sentence similarity, entailment, and sentiment classification
  * word averaging outperforms LSTMs for sentence similarity and entailment,
  * on sentiment classification, LSTM performs very strongly
    * new SOTA performance on the Stanford Sentiment Treebank
* We combine our pretrained sentence embeddings with these supervised tasks,
  using them both as a prior and as a black box feature extractor
* performance rivaling the SOTA
  on the SICK similarity and entailment tasks


# 1 Intro

* domain independent? embeddings used effectively for many downstream tasks
  * Turian+ (2010) Word representations: A general method for semi-supervised
  * Socher+ (2011) Dynamic pooling & unfolding recursive autoencod for paraphr
  * Kim, (2014) CNNs for sentence classification EMNLP
  * Bansal+ (ACL 2014) continuous word representations for dependency parsing 
  * Tai+ (2015) Improved semantic representations from tree-structured LSTMs
* representations for word sequences such as phrases or sentences based on
  * simple operations like addition
    (Mitchell & Lapata, 2010; Yu & Dredze, 2015; Iyyer+ 2015)
  * richly-structured functions like recursive neural networks (Socher+ 2011),
    convolutional neural networks (Kalchbrenner+ 2014), and
    recurrent neural networks using long short-term memory (LSTM) (Tai+ 2015)
  * but little work on simple sentence representations across domains
* We consider six compositional architectures based on neural networks and
  train them on noisy phrase pairs from the Paraphrase Database
  (PPDB; Ganitkevitch+ 2013)
* models spanning the range of complexity from word averaging to LSTMs
  * word averaging model, there are no additional compositional parameters
    * word vectors learned to produce effective sequence embeddings
  * variants of deep averaging networks (Iyyer+ 2015)
  * several recurrent network variants, culminating in
  * LSTMs that have been found to be effective for many types of
    sequential data (Graves+ 2008; 2013; Greff+ 2015), including
    text (Sutskever+ 14; Vinyals+ 14; Xu+ 15a; Hermann+ 15; Ling+ 15; Wen+ 15)
* we find that learning word embeddings in the context of vector averaging
  performs much better than simply averaging pretrained, SOTA word
  embeddings
  * Our average Pearson’s r over all 22 SemEval datasets is
    17.1 points higher than averaging GloVe vectors 2 and
    12.8 points higher than averaging PARAGRAM-SL 999 vectors

# 2 Related work

* vector for a word sequence
  * Mitchell & Lapata (2008; 2010) comparing many functions
  * Blacoe & Lapata (2012) found that vector addition performed strongly
  * compositional architectures based on distributional semantics
    (Baroni+ 2014; Paperno+ 2014; Polajnar+ 2015; Tian+ 2015)
  * neural bag-of-words models (Kalchbrenner+ 2014),
  * deep averaging networks (DANs) (Iyyer+ 2015),
  * feature-weighted averaging (Yu & Dredze, 2015),
  * recursive neural networks based on
    * parse structure (Socher+ 11; 12; 13; İrsoy & Cardie, 14; Wieting+ 15)
    * non-syntactic hierarchical structure (Zhao+ 2015; Chen+ 2015b),
  * convolutional neural networks
    (Kalchbrenner+ 14; Kim, 14; Hu+ 14; Yin & Schütze, 15; He+ 15)
  * LSTMs (Tai+ 2015; Ling+ 2015; Liu+ 2015)
  * In this paper, we compare six architectures: word averaging,
    word averaging followed by a single linear projection, DANs, and
    three variants of recurrent neural networks, including LSTMs
* general purpose, domain independent embeddings for word sequences
  * autoencoder in an attempt to learn the latent structure of the sequence,
    * sentence with a parse tree (Socher+ 2011), or a
    * longer sequence such as a paragraph or document (Li+ 2015b)
  * sequence representations that are predictive of words inside the sequence
    or in neighboring sequences
    * paragraph vectors (Le & Mikolov, 2014) and
    * skip-thought vectors (Kiros+ 2015) a cikk egyik fő vetélytársa
      * capture similarity in terms of discourse context
    * provide features for text classification or sentence similarity tasks
* a large body of related work on learning input representations
  in order to maximize similarity in the learned space
  (Weston+ 10; Yih+ 11; Huang+ 13; Hermann & Blunsom, 14; Socher+ 14;
  Faruqui & Dyer, 14; Bordes+ 14b;a; Lu+ 15) and our prior work (Wieting+ 15)

# 4 Experiments

## 4.2 Transfer learning

## 4.3 Paragram-phrase xxl

## 4.4 Using representations in learned models

# 5 Discussion

* length
  * while the LSTM models do perform better on the shortest text pairs, they
    are still outperformed, at all lengths, by the PARAGRAM-PHRASE model.

# 6 Qualitative analysis

* To explore differences between PARAGRAM-PHRASE and PARAGRAM-SL 999 vectors
  that were used for initialization,
  we inspected lists of nearest neighbors in each vector space.
* in PARAGRAM-PHRASE embeddings, content words, such as _poverty,
  kidding, humanitarian, 18_, and _july_ have the largest `L_2` norms, while
  words such as of, it, to, hereby and the have the smallest.
  Pham et al.  (2015) noted this same phenomenon in their closely-related
  compositional model
  * this weighting explains much of the success of our model.
  * In order to quantify exactly how much, we scaled PARAGRAM-SL 999 vecs,
  * at least 64.76% of the improvement is due to weighting tokens
  * We also trained a model in which we only a learn a single multiplicative
    parameter for each word in our vocabulary, keeping the word embeddings
    fixed to the PARAGRAM - SL 999 embeddings
    * The resulting average Pearson’s r, is slightly lower than using the
      absolute value of each PARAGRAM - PHRASE vector as the weight
  * the connection between these multiplicative weights and word frequency. To
    * we used the reciprocal of the probability scores
    * indicating that learned weights are more sophisticated than inv freq

# 7 Conclusion

* Future work will focus on improving our embeddings by
  * effectively handling undertrained words
  * generalize even better to the large suite of text similarity tasks
