Sparse Overcomplete Word Vector Representations
Manaal Faruqui, Yulia Tsvetkov, Dani Yogatama, Chris Dyer, Noah Smith
acl 2015

#Abstract

* Current distributed representations of words
  * dense and uninterpretable
  * [unlike] theories of lexical semantics
    * largely based on familiar, discrete
      classes (e.g., supersenses) and relations (e.g., synonymy and hypernymy)
* We propose methods that transform word vectors into sparse
  (and optionally binary) vectors

#1 Introduction

* most lexical semantic theories ... focus on identifying
  * classes of words (Levin, 1993; Baker+ 1998; Schuler, 2005) and
  * relationships among word meanings (Miller, 1995)
* discrete theories seem incommensurate with the distributed approach,
  problem now receiving much attention
  * Lewis and Steedman, 2013;
      Mike Lewis and Mark Steedman
      Combined distributional and logical semantics
      ACL 2013
  * Kiela and Clark, 2013;
  * Vecchi+ 2013;
  * Grefenstette, 2013;
  * Lewis and Steedman, 2014;
      Mike Lewis and Mark Steedman
      Combining formal and distributional models of temporal and intensional
      ACL 2014
  * Paperno+ 2014
* recent approaches of incorporating semantics in distributional word vectors
  * (Yu and Dredze, 2014; Xu+ 2014; Faruqui+ 2015),
  * rely on any external information source
* Now:
  * longer, sparser vectors, sometimes called an
    “overcomplete” representation (Olshausen and Field, 1997)
  * Sparse, overcomplete representations have been
    motivated in other domains as a way to increase
    * separability and interpretability,
      * each instance (here, word) having few active dimesions
        (Olshausen and Field, 1997; Lewicki and Sejnowski, 2000)
    * stability in the presence of noise (Donoho+ 2006)
* sparsity as a useful form of inductive bias in NLP and machine learning
  (Kazama and Tsujii, 2003; Goodman, 2004; Friedman+ 2008;
  Glorot+ 2011; Yogatama and Smith, 2014)
* Introducing sparsity in word vector dimensions has been shown to improve
  * dimension interpretability (Murphy+ 2012; Fyshe+ 2014) and
  * usability of word vectors as features in downstream tasks (Guo+ 2014)
* The word vectors we produce are more than 90% sparse;
* we also consider binarizing transformations that bring them
  closer to the categories and relations of lexical semantic theories
* a suite of standard benchmark evaluation tasks (§3)
  * Using a number of state-of-the-art word vectors as input,
  * we find consistent benefits of our method
* [also] in a word intrusion experiment with humans (Chang+ 2009) (§4)
  * our sparse vectors are more interpretable than the original vectors

#2 Sparse Overcomplete Word Vectors

##2.1 Sparse Coding, method A
* four initializing methods for these vectors, discussed in Appendix A
* loss for each word vector ... can be optimized ... in parallel (§2.3)
* Note that this problem is not convex
##2.2 Sparse Nonnegative Vectors, method B
* Nonnegativity ... has often been shown to correspond to interpretability
  (Lee and Seung, 1999; Cichocki+ 2009; Murphy+ 2012;
  Fyshe+ 2014; Fyshe+ 2015)
* we use a variation of the nonnegative sparse coding method (Hoyer, 2002)
##2.3 Optimization
* online adaptive gradient descent (AdaGrad; Duchi+ 2010)
* In order to speed up training we use asynchronous updates
  * in parallel for every word vector
    * (Duchi+ 2012; Heigold+ 2014)
* to an l1-regularized objective, We use the AdaGrad variant of the
  regularized dual averaging algorithm (Xiao, 2009)
##2.4 Binarizing Transformation
* as an optimization problem
  * a mixed integer bilinear program, ... NP-hard (Al-Khayyal and Falk, 1983)
* relaxation to this hard problem is to
  1. constrain the continuous representation A to be nonnegative
  2. project nonzero values to 1, preserving the 0 values
* Table 2 shows a random set of word clusters obtained by
  * (i) applying our method to Glove initial vectors and
  * (ii) applying k-means clustering (k = 100)
  * In §3 we will find that these vectors perform well quantitatively
##2.5 Hyperparameter Tuning
* parameters
  * l1-regularization penalty λ, the
  * l2-regularization penalty τ , and
  * length of the overcomplete word vector representation K
* grid search on λ ∈ {0.1, 0.5, 1.0} and K ∈ {10L, 20L},
  * on one “development” word similarity task (WS-353, discussed in §B)
  * while achieving at least 90% sparsity in overcomplete vectors
* τ was tuned on one collection of initializing vectors
  * (Glove, discussed in §A)
  * so that the vectors in D are near unit norm
* These hyperparameters were chosen for method A and retained for method B

#3 Experiments

* seven other tasks were used to evaluate the quality
  * The first of these is a word similarity task, where the
    score is correlation with human judgments, and the
  * others are classification accuracies of an
    l2-regularized logistic regression model
  * These tasks are described in detail in Appendix B

##3.1 Effects of Transforming Vectors

* (method A)
  * Table 3 shows consistent improvements of sparsifying vectors
  * exceptions are on the SimLex task, where our sparse vectors are
    * worse than the skip-gram initializer and
    * on par with the multilingual initializer
  * beneficial across all of the text classification tasks
* Binarized vectors (from method B) are
  * also usually better than the initial vectors, and
  * tend to outperform the sparsified variants,
    * except when initializing with Glove

##3.2 Effect of Vector Length

* K = αL where α ∈ {1, 2, 3, 5, 10, 15, 20}
* K = 3 000 (α = 10) gives the best result

##3.3 Alternative Transformations

#4 Interpretability

##4.1 Word Intrusion experiment (Chang+ 2009)

* kakukktojás
  * naval, industrial, technological, marine, identity
* The words are selected by the experimenter by
  * choosing one dimension j of the learned representation, then
  * ranking the words on that dimension alone. The dimensions are chosen in
    decreasing order of the variance of their values across the vocabulary.
  * Four of the words are the top-ranked words according to j, and
  * the “true” intruder is a word from the bottom half of the list
    * a word that appears in the top 10% of some other dimension

##4.2 Qualitative Evaluation of Interpretability

* focusing on individual dimensions

#5 Related Work

* overcomplete features have been widely used in
  * image processing, computer vision
    * (Olshausen and Field, 1997; Lewicki and Sejnowski, 2000) and
  * signal processing (Donoho+ 2006)
* Nonnegative matrix factorization is often used for interpretable coding
  (Lee and Seung, 1999; Liu+ 2003; Cichocki+ 2009)
* Sparsity constraints are ... useful in NLP problems
  * in general
    (Kazama and Tsujii, 2003; Friedman+ 2008; Goodman, 2004)
  * POS tagging (Ganchev+ 2009),
  * dependency parsing (Martins+ 2011),
  * text classification (Yogatama and Smith, 2014), and
  * representation learning (Bengio+ 2013; Yogatama+ 2015)
  * Bayesian models of lexical semantics like LDA
    * in the form of sparse Dirichlet priors has been shown to be useful for
      * downstream tasks like POS-tagging (Toutanova and Johnson, 2007)
      * improving interpretation
        (Paul and Dredze, 2012; Zhu and Xing, 2012)

#A Initial Vector Representations (X)

* Glove
  * 6 billion words from Wikipedia and English Gigaword and are of length 300
* Skip-Gram (SG)
  * Huffman code
  * 100 billion words of Google news data and are of length 300
* Global Context (GC)
  * learned using a recursive neural network that
  * incorporates both local and global (documentlevel) context features
    (Huang+ 2012)
  * trained on the first 1 billion words of English Wikipedia
  * length 50
* Multilingual (Multi)
  * Faruqui and Dyer (2014) learned vectors by
    * first performing SVD on text in different languages,
    * then applying canonical correlation analysis
      * on pairs of vectors for words that align in parallel corpora
  * These vectors were trained on WMT-2011 news corpus
    * containing 360 million words and are of
  * length 48

#B Evaluation Benchmarks

* Word Similarity
  * two word similarity tasks
    * WS-353 dataset (Finkelstein+ 2001), which contains
      * 353 pairs of English words that have been [rated] by humans
      * [here] used to tune sparse vector learning hyperparameters
    * more recent dataset, SimLex-999 (Hill+ 2014)
      * specifically focus on similarity (rather than relatedness)
      * balanced set of noun, verb, and adjective pairs
  * We
    * calculate cosine similarity between the vectors of two words
    * report Spearman’s rank correlation coefficient
      * (Myers and Well, 1995)
      * [with] the human rankings
* Sentiment Analysis (Senti)
  * Socher+ (2013)
  * treebank ... annotated with fine-grained sentiment labels
    * on phrases and sentences from movie review excerpts
  * The coarse-grained treebank of positive and negative classes has been
    * split into training, development, and test datasets
  * We use average of the word vectors of a given sentence as feature
  * tuned on the dev. set and accuracy is reported on the test set
* Question Classification (TREC)
  * six different question types
  * about a location, about a person, or about some numeric information
    (Li and Roth, 2002)
* 20 Newsgroup Dataset
  * three binary categorization tasks from the 20 Newsgroups dataset
    * (1) Sports: baseball vs. hockey (958/239/796)
    * (2) Comp.: IBM vs. Mac (929/239/777)
    * (3) Religion: atheism vs. christian (870/209/717)
  * We use average of the word vectors of a given sentence as features
* NP bracketing (NP)
  * Lazaridou+ (2013) constructed a dataset
  * from the Penn Treebank (Marcus+ 1993) of
  * noun phrases (NP) of three words , where
  * the first can be an adjective or a noun and the other two are nouns
  * The task is to predict the correct bracketing in the parse tree
  * _local (phone company)_ and _(blood pressure) medicine_
