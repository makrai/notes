Word emotion induction for multiple languages as deep multi-task learning
S Buechel, U Hahn
NAACL 2018

code base + resulting experimental data is freely available
https://github.com/JULIELab/wordEmotions

# joemzhao/ultradensifier says

https://github.com/joemzhao/ultradensifier says: *Orthogonal Constraint*:
> Buechel+ 2018 reports that enforcing the orthogonal constraint introduces no
> difference on performance. Similar observations occur in this implementation
> * Releasing the orthogonal constraint means we now can touch the norm of `Q`
>   so probably we need to regularize the `l2` norm of `PQ` such that the loss
>   does not go to `-\infty`. Again, no improvements are observed in this case
> * The orthorgonal constraint probably is not significantly helpful when
>   the evaluation metric is ranking based

# Abstract

* Predicting the emotional value of lexical items is a well-known problem
  * research has focused on polarity for quite a long time
  * more expressive models (eg Basic Emotions or Valence-Arousal-Dominance)
  * heterogeneous formats and small-sized, non-interoperable resources
    (lexicons and corpus annotations, Buechel and Hahn, 2017)
    Sven Buechel and Udo Hahn. 2017
    EmoBank: Studying the impact of {annotation perspective
      and representation format} on dimensional emotion analysis
    EACL 2017
    * limitations in size hampered the application of deep learning methods
* We: word emotion induction as a multi-task learning (MTL) problem
  * each independent emotion dimension is considered as an individual task
  * hidden layers are shared between these dimensions
  * comparing our model against alternative emo and polarity induction methods
  * 9 typologically diverse languages and a total of 15 conditions
  * Our model turns out to outperform each one of them
    * largest gain on the smallest data sets, merely composed of 1000 samples
* organization of the main part
  * we first validate our claim that MTL is superior to single-task learning
    for word emotion induction
  * large-scale evaluation of our model featuring
    9 typologically diverse languages and multiple publicly available embeds
  * 15 conditions
  * Our MTL model surpasses the current SOTA for each of them, and even
    performs competitive relative to human reliability
  * largest benefit on the smallest data sets, comprising merely 1 K
  * competitive to human annotation reliability
    in terms of inter-study as well as split-half reliability

# 1 Introduction

* terms _polarity_ and _emotion_ here
  * polarity: “semantic orientation” (Hatzivassiloglou and McKeown, 1997)
    (the positiveness or negativeness) of affective states
  * emotion: based on some of the many more elaborated representational systems
    for affective states
    * Basic Emotions (Ekman, 1992) or the
    * Valence-Arousal-Dominance model (Bradley and Lang, 1994)
* multi-task learning (MTL; Caruana 1997) for word-level emotion prediction
  * greatly decrease the risk of overfitting (Baxter, 1997), works well
  * for various NLP tasks
    * Setiawan+ 2015
      H Setiawan, Z Huang, J Devlin, T Lamar, R Zbib, R M. Schwartz, J Makhoul
      Statistical machine translation features with multitask tensor networks
    * Liu+ 2015
      Xiaodong Liu, Jianfeng Gao, Xiaodong He, Li Deng, Kevin Duh, Ye-Yi Wang
      Repr learning using multi-task DNNs for semantic classification and IR
    * Søgaard and Goldberg, 2016
      Anders Søgaard and Yoav Goldberg. ACL 2016
      Deep multi-task learning with low level tasks supervised at lower layers
    * Cummins+ 2016
      Ronan Cummins, Meng Zhang, and Ted Briscoe. ACL 2016
      Constrained multi-task learning for automated essay scoring
    * Liu+ 2017
      PengFei Liu, Xipeng Qiu, and Xuanjing Huang. ACL 2017
      Adversarial multi-task learning for text classification
    * Peng+ 2017
      Hao Peng, Sam Thomson, and Noah A. Smith. ACL 2017
      Deep multitask learning for semantic dependency parsing

# 2 Related work 2

## 2.1 Emotion Representation and Data Sets

* Psychological models of emotion can typically be subdivided into
  * discrete (or categorical) and
    * with particular sets of emotional categories
    * Ekman (1992) eg identifies six Basic Emotions
      (Joy, Anger, Sadness, Fear, Disgust and Surprise)
  * dimensional ones (Stevenson+ 2007; Calvo and Mac Kim, 2013)
    * emotions to be composed of several influencing factors (mainly 2 or 3)
      * often VAD (Bradley and Lang 1994)
        * Valence (a positive–negative scale),
        * Arousal (a calm–excited scale), and
        * Dominance (perceived degree of control over a (social) situation)
      * Many contributions though omit Dominance (the VA model, Russell, 1980)
      * we will still use the term “VAD” to jointly refer to both variants
* emotion lexicons have emerged from psychological/NLP research labs
  for diverse languages
  * listed in Table 1 and Buechel and Hahn (2018)
    Sven Buechel and Udo Hahn
    Representation mapping:
      A novel approach to generate high-quality multi-lingual emotion lexicons
    LREC 2018
* regression, not as a classification problem (Buechel and Hahn 2016)
* we focus on the VAD format for the following reasons:
  1. Valence exactly corresponds to polarity (Turney and Littman, 2003)
    * emotion prediction can be seen as a generalization over classical
  2. diversity of available emotion lexicons with VAD encodings is largest

## 2.2 Word Embeddings

* Word2vec (with its variants SGNS and CBOW): an extremely trimmed NN
* FastText is a derivative of Word2vec, also incorporating sub-words
* GloVe trains word vectors directly on a word co-occurrence matrix
* Somewhat similar, SVD-PPMI (Levy+ 2015)
* we rely on embedding models pretrained on very large corpora
  * SGNS model trained on the Google News corpus (Google), the
  * FastText model trained on Common Crawl (Common), as well as the
  * FastText models for a wide range of languages trained on the Wikipedias
    * different training and vocabulary sizes (see Grave+ (2018))
      Edouard Grave, Piotr Bojanowski, Prakhar Gupta, Armand Joulin, T Mikolov
      Learning word vectors for 157 languages
      LREC 2018
  * Additionally, the English embedding model from Sedoc+ (2017, Giga), a
    strongly related contribution (see below)
    João Sedoc, Daniel Preoţiuc-Pietro, and Lyle H. Ungar
    Predicting emotional word ratings using distri reprs and signed clustering
    EACL 2017 Valencia, Spain, April 3- 7, 2017, volume 2: Short Papers 564–571
    * trained on the English Gigaword corpus (Parker+ 2011)

## 2.3 Word-Level Prediction, the one we focus on in this contribution 3

* polarity
  * based on its PMI to a set of positive and negative seed words,
    * introduced by Turney and Littman (2003)
    * still popular today (Köper and Schulte im Walde, 2016)
  * SemEval-2015 Task 10E: polarity induction on Twitter (Rosenthal+ 2015)
    * best system relied on support vector regression (SVR)
      using a radial base function kernel (Amir+ 2015)
      * embedding vector of the target word as features
    * beaten by the Densifier algorithm (Rothe+ 2016)
    * Hamilton+ (2016) developed SentProp (graph-based, semi-supervised)
      * polarity information is propagated through the graph
  * their evaluation,
    * Densifier seems to be superior overall, yet
    * SentProp produces competitive only when the resource is very small
      * resource: the seed lexicon or
        the corpus the word embeddings are trained on
* word emotion induction
  * graph-based
    * very similar approach to SentProp has been proposed by Wang+ (2016a)
    * Sedoc+ (2017) approach based on signed spectral clustering
      * word graph is constructed based on word similarity + affective info
      * emotion value computed based on the seed words in its cluster
      * outperform the results from Wang+ (2016a)
* IALP 2016 Shared Task on Chinese word emotion induction (Yu+ 2016b)
  * the best system of the employed a simple feed-forward neural network (FFNN)
    with one hidden layer in combination with boosting (Du and Zhang, 2016)
* supervised: Li+ (2017) propose ridge regression, again using word embeddings

## 2.4 Sentence-Level and Text-Level Prediction 4

* DL approaches
* fully established as the method of choice (Wang+ 2016b;
  Abdul-Mageed and Ungar, 2017; Felbo+ 2017; Mohammad and Bravo-Marquez, 2017)
* cannot easily be transferred to solve word emotion
* adapted to sequential or spatially arranged input data
  * sequential (typical for RNN, LSTM, GRNN and related architectures) or
  * spatially arranged (as with CNN architectures)
  * hE, for word embeddings (the default input for word emotion induction),
    no meaningful order of the components

# 3 reference methods and our proposed deep MTL model

## 3.1 Reference Methods

(two originally polarity-based adapted for VAD prediction)

### Linear Regression Baseline (LinReg)

### Ridge Regression (RidgReg),

* Li+ (2017) propose it for word emotion
* identical to linear regression during prediction, but introduces L 2 regu

### Turney-Littman Algorithm (TL)

* one of the earliest contributions in the field, Turney and Littman (2003)
* a simple PMI-based approach to determine the semantic polarity of a word w
`SP T L (w) = \sum pmi(w, s) − \sum pmi(w, s)`
* still popular today (Köper and Schulte im Walde, 2016),
* we here provide a novel modification for adapting to vectors
  1. we replace PMI-based association by their cos similarity `sim`
  2. adapted to an n-dimensional emotion format
  3. introduce a normalization term
    such that emo(w) T L lies within the range of the seed lexicon

### Densifier

* Rothe+ (2016) train an orthogonal matrix Q ∈ R n×n
* To adapt this algorithm to dimensional emotion formats,
  we construct a positive and a negative seed set,
  * M v be the mean, SD v be the standard deviation and β ∈ R, β ≥ 0
  * all entries greater than M v + βSD v are assigned to seeds + v
  * Q is fitted individually for each emotion dimension v
* we did not apply the proposed re-orthogonalization after each training step,
  * (following Hamilton+ (2016))
    William L. Hamilton, Kevin Clark, Jure Leskovec, and Daniel Jurafsky
    Inducing domain-specific sentiment lexicons from unlabeled corpora
    EMNLP 2016
    since we did not find any evidence that this improves performance
  * α and β were set to .7 and .5 (respectively) for all experiments
    based on a pilot study. Since the original
  * implementation is not accessible, we devised our own using tensorflow.org

### Boosted Neural Networks (ensembleNN)

* Du and Zhang (2016) propose simple FFNNs in combination with a boosting
* Boosting: several weak estimators are combined to form a strong estimator
* The authors used FFNNs with a single hidden layer of 100 units and
  rectified linear unit (ReLU) activation
  * boosting algorithm AdaBoost.R2 (Drucker, 1997) was used to train the
  * Our re-implementation copies theirs exactly using scikit-learn

## 3.2 Multi-Task Learning Neural Network

* We use leaky ReLU activation (LReLU) as nonlinearity (Maas+ 2013)
* dropout (Srivastava+ 2014) is applied during training
* 15, 000 iterations (well beyond convergence on each data set)
* Adam optimizer (Kingma and Ba, 2015)
  * .001 base learning rate,
  * batch size of 128
  * Mean-Squared-Error loss
  * weights are initialized from a normal distri with a standard deviation .001
  * biases are uniformly initialized as .01
  * Tensorflow is used for implementation

# 4 Results 7

* In this section, we
  * validate our assumption that MTL is superior to single-task learning
  * we compare our proposed MTLNN model in a large-scale evaluation
* Performance figures will be measured as Pearson correlation (r)

## 4.1 Single-Task vs Multi-Task Learning

* each combination of model and data set displays a satisfactory performance of
  at least r ≈ .75 after 15,000 steps compared to previous work (see below)
* Overall, performance is higher for the smaller EN lexicon
  * counterintuitive but consistent with prior work (Sedoc+ 2017; Li+ 2017)
  * smaller lexicons comprise a larger portion of strongly emotion-bearing
* the MTLNN model does indeed outperform the single task model on both dsets
  * gain is larger on smaller data sets
  * regularizing effect, since the SepNN model shows signs of overfitting
    * SepNN needs fewer training steps before convergence
  * Yet, even when the separate model does not overfit (EN+), MTLNN better
  * MTLNN model converging in about a minute on a middle-class GPU
    * only about a third as many parameters as the separate model SepNN

## 4.2 Comparison against Reference Methods

* We combined each lexicon with each applicable publicly available embedding
  * the embedding model provided by Sedoc+ (2017) will be used separately
* For each of these conditions, we performed a 10-fold cross-validation (CV)
  for each of the 6 methods presented in Section 3
  * each method is presented with the identical data splits, paired t-tests
  * the methods we compare ourselves against comprise the current SOTA in both
    polarity and emotion induction (as described in Section 2)
* Valence and Arousal for ES+ [?] and ZH, VAD for the others
* our proposed MTLNN model outperforms all other approaches in each condition
* improvements are especially pronounced on smaller data sets
  containing 1--2 thousand entries (EN, ES, IT, PT, ID)
  * ~10%-points improvement over the respective second-best system
* relative ordering of the affective dimensions,
  * Valence dimension are usually much higher than for Arousal and Dominance
    * in line with former studies (Sedoc+ 2017; Li+ 2017)
  * ordering between Arousal and Dominance
    * eg to EN, EN+ and IT: V > D \approx avg > A
    * eg PL, NL and ID, less clear though Valence still stands out
    * We observe the same general pattern for the reference methods
* comparison to Sedoc+ (2017), arguably one of most related contributions
  * MTLNN using the Common model achieves about 10%points better on VA
  * using their smaller embedding model, MTLNN still clearly outperforms
* comparison to human performance, MTLNN achieves also very strong results
  * inter-study reliability
    * Warriner+ (2013) (who created EN+) report ~ between the EN and the EN+
    * our proposed method did actually outperform human reliability for
      Dominance and is competitive for Valence and Arousal, as well
  * split-half reliability data
    * For the EN+ data set, Warriner+ (2013) report  r = .914, .689 and .770
    * our MTLNN model performs very competitive with r = .870, .674 and .758

# 5 Conclusion 9

* future work: other format of emotion representation than VAD
