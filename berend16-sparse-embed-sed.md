Sparse Coding of Neural Word Embeddings
  for Multilingual Sequence Labeling
TACL 2016 arXiv:1612.07130v1 [cs.CL] 21 Dec 2016
Gábor Berend

#Abstract

* (near) state-of-the art performance for
  * both part-ofspeech tagging and named entity recognition
  * for a variety of languages
    * reasonable results for more than 40 treebanks for POS tagging,
    * NER: 33 treebanks for 29 languages
* model relies only on a few thousand sparse coding-derived features,
  * without applying any modification of the word representations employed for
    the different tasks
  * favorable generalization properties on small training data

#Intro

* our proposed model performs substantially better than traditional
  feature-rich models in the absence of abundant training data
* sparse coding has been utilized in NLP prior to us
  * Faruqui+ 2015;
  * Chen+ 2016
    * Berend az egyetlen hivatkozó
    * Yunchuan Chen, Lili Mou, Yan Xu, Ge Li, and Zhi Jin
      Compressing neural language models by sparse word representations
      2016 ACL
  * we are the first to propose a sequence labeling framework incorporating it
* we rigorously compare
  * different sparse coding approaches
  * differently trained continuous word embeddings
* we release the sparse word representations
  `https://begab.github.io/sparse_embeds`

#2 Related work

* polyglot (Al-Rfou+ 2013)
  * embeddings for more than 100 languages
  * log-linear model
* dictionary learning for sparse coding (Mairal+ 2010)
  * SPArse Modeling Software 1 (SPAMS)
* close resemblance to (Faruqui+ 2015)

##Distributed word representations

* a plethora of approaches
  * Bengio+ 2003
  * Lebret and Collobert, 2013
    * Word emdeddings through hellinger PCA. CoRR,
  * Mnih and Kavukcuoglu, 2013
  * Collobert and Weston, 2008
  * Mikolov+ 2013a
  * Pennington+ 2014
* Prediction-based vs count-based
  * prediction-based has superior performance (Baroni+ 2014)
  * on par:
    * Lebret and Collobert (2014):
    Rehabilitation of count-based models for word vector representations
    * Levy+ (2015) and
      * effect [of] hyperparameters and other design choices
    * Qu+ (2015)
      * Lizhen Qu, Gabriela Ferraro, Liyuan Zhou, Weiwei Hou, Nathan Schneider,
        and Timothy Baldwin. 2015 CoNLL. Big data small data, in domain out-of
        domain, known word unknown word: The impact of word representations
        on sequence labelling tasks
* task-general embeddings
  * Collobert+ (2011)
    * POS tagging, named entity recognition, semantic role labeling and
      chunking
    * unsupervised pre-training
    * for English

##2.2 Sparse coding

* sparse coding
  * express signals in the form of sparse linear combination of basis vectors
  * the task of finding an appropriate set of basis vectors is referred to as
    the dictionary learning problem (Mairal+ 2010)
* D \in convex set of matrices
  * comprising of column vectors having a pre-defined upper bound on their norm
* Faruqui+ (2015): different objective function
  * In Section 4, we compare the effects of employing different sparse coding
    paradigms including the ones in Faruqui+ (2015)
  * see page 9
* Yogatama+ (2015) proposed an efficient learning algorithm for
    determining hierarchically organized sparse word representations using
    stochastic proximal methods
* Sun+ (2016) have proposed an
  * online learning algorithm using regularized dual averaging to directly
    obtain l1-regularized continuous bag of words (CBOW) representations
    (Mikolov+ 2013a)
    * without the need to determine dense CBOW representations first

#3 Sequence labeling framework

* not apply any features based on gazetters, capitalization patterns or
  character suffixes
* Once the dictionary matrix D is learned, the sparse linear combination
  coefficients α i can easily be determined for a word embedding vector w i by
  solving an l1-regularized linear least-squares minimization problem
  (Mairal+ 2010). We define
* features based on vector α i by taking the signs and indices of its non-zero
  coefficients,
* linear chain CRF (Lafferty+ 2001) using CRFsuite (Okazaki, 2007)
  * default coefficients of CRFsuite  for l1 and l2 regularization

#4 Experiments

* m: number of the basis vectors and the
  * Starting with m = 256 and doubling it at each iteration, ... a steady
    growth in the usefulness ...  plateauing at 1024,
* λ regularization coefficient affecting the sparsity of α

##4.1 Baseline methods

###Brown clustering (Brown+ 1992)

* useful source of feature generation for sequence labeling tasks
  * Ratinov and Roth, 2009; Turian+ 2010; Owoputi+ 2013;
    Stratos and Collins, 2015; Derczynski+ 2015). We should
* note that sparse coding can also be viewed as a kind of clustering
* linear chain CRF
* hierarchical clustering
* generating features from the length-p (p ∈ {4, 6, 10, 20}) prefixes of
  Brown cluster identifiers
  * similar to Ratinov and Roth (2009) and Turian+ (2010)
* implementation by Liang (2005), https://github.com/percyliang/brown-cluster
* Wikipedia articles as input text for determining Brown clusters
  * [also] used for training the polyglot 3 word embeddings
* number of Brown clusters to be identified to 1024, that is
  * the number of basis vectors applied during sparse coding

###Feature-rich representation

* linear chain CRFs that assign standard state-of-the-art feature-rich
  representation to sequences. We apply the very same features and feature
  templates included in the POS tagging model of CRFSuite 4 . We summarize
  these features in Table 1, where ⊕ denotes the binary operator which defines
  features as a combination of word forms at different (not necessarily
  contiguous) positions of a sentence

###Using dense word representations

* similar model to the one proposed in Section 3 except for the fact that we
  used the original dense word representations for inducing features

##4.2 POS tagging experiments

###4.2.1 Experiments using CoNLL 2006/07 data

* bg da de en es hu it nl pt sl sv tr
* mapping the treebank specific POS tags to the Google universal POS tags in
  order to obtain results comparable across languages
  * Google universal part-of-speech tags introduced by Petrov+ (2012)
    * 12 language-independent part-of-speech tags
  * universal dependencies (UD) (Nivre, 2015)
    * 17 categories
* coverage of word embeddings, Figure 1

####Comparing word embeddings p6

* skip-gram (SG), continuous bagof-words (CBOW) and Glove
* train them on the same Wikipedia dumps used for training the polyglot
* hyperparameters identically to polyglot :-(
  * 64 dim, symmetric context window of size 2
* Figure 2, performance is quite insensitive to the choice of λ
  * unless it yields some extreme sparsity level (>99.5%)

####Analyzing the effects of window size

* Figure 3: applying context window sizes of 2 ...  tend to produce better
  overall POS tagging accuracies than applying a larger window size of 10
  * Differences are the most pronounced in case of skip-gram representation,
  * confirming the findings of Lin+ (2015), i.e.  embedding models that
    model short-range context are more effective for POS tagging

#### Comparing dense and sparse representations

* we set the value of λ to 0.1 ... unless stated otherwise
* Table 3
  * dense word representations as features are consistently inferior
  * Table 3b: polyglot embeddings perform the best for dense representations as
    well ?

####Comparing the effects of training corpus size

* first 150, the first 1,500 and all the available training sentences from each
  corpora. Figure 4

####Comparing sparse coding techniques

* constraining D
  * we explicitly constrain D to be a member of the convex set of matrices
    comprising of column vectors having a pre-defined upper bound on their
    norm
  * Faruqui
    * implicitly control for the norms of the basis vectors by an additional
      regularization term affected by an extra parameter τ
    * also formulated a constrained objective function
      * non-negativity constraint on the elements of α
      * but no constraint on D
* lambda
* Figure 5
* Although Murphy+ (2012) mentions _nonnegativity_ as a desired property
  of word representations for cognitive plausibility, Figure 5 reveals that
  our sequence labeling model cannot benefit from it
* sparsity structures,
  * Figure 6a variation in the length of the basis vectors
  * Figure 6b relative frequency of basis vectors taking part in the
    reconstruction of word embeddings
  * Figure 7
    * correlation
      * between the of basis vectors'
        * l2 norm
        * the number of times they are assigned a non-zero coefficient in α for
      * strong for SC-3 and SC-4 but not for SC-1

###4.2.2 Experiments using UD treebanks

* 33 treebanks for 29 languages
* word identity
* Table 5 presents the state-of-the-art results of the bidirectional LSTM
  models by Plank+ (2016)

##4.3 Named entity recognition experiments

* 2002 and 2003 CoNLL shared tasks on multilingual named entity recognition
  * English, Spanish and Dutch datasets
* 17-tag IOBES tagging scheme
  * Similar to Collobert+ (2011)
* comparison to Collobert+ without unsup pre-training
* Figure 8
