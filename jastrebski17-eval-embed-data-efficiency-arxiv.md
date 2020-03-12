Stanisław Jastrzebski, Damian Leśniak, Wojciech Marian Czarnecki
How to evaluate word embeddings?
  On importance of data efficiency and simple supervised tasks
2017

Results [and scripts] will be posted online upon publication

# Abstract

* Maybe the single most important goal of representation learning is making
  subsequent learning faster. Surprisingly, this fact is
  * not well reflected in the way embeddings are evaluated. In addition,
* recent [work] points towards importance of learning specialized [embeds]
* evaluation should focus on data efficiency and simple supervised tasks,
  where the amount of available data is varied [as common] in transfer learning
* comprehensive evaluation of selected word embeddings is presented
* word similarity (WS) or analogy (WA) [cab be decoded by a non-linear 
  downstream model]
  * questions the cosine–based, unsupervised, evaluation methods

# 1 Introduction

* relatively simple algebraic structure [of embeddings] (Arora+ 2016)
  * words can be decomposed into an overcomplete basis
* tune algorithm, corpus and hyperparameters towards the target task
  (Lai+ 2016, Sharp+ 2016b), which challenges [unsup pretrain]
* extrinsic and intrinsic [evaluation] (Schnabel and Labutov, 2015)
* both ... are criticized (Tsvetkov+ 2015a, Faruqui+ 2016)
* Recent research ... on representative or interpretable set of tasks
  (Nayak+ 2016, Köhn, 2015a)
  * analysing intrinsic evaluation (Chiu+ 2016, Faruqui+ 2016),
  * improvements to intrins eval (Avraham and Goldberg, 2016, Tsvetkov+ 2015b)
* In this paper we employ a transfer learning view
  * main goal of representation learning is to make subsequent learning fast,
  * sample complexity (Bengio+ 2013, Glorot+ 2011)
    * Alternative goals might include maximizing interpretability, or
      analysing unsupervised corpora
  * performance under varying (benchmark) dataset sizes and model classes
    * notable exceptions (Andreas and Klein, Qu+ 2015, Amir+ 2017)
* we ... propose focusing only on simple (supervised) tasks, as
  * complex downstream tasks are challenging to interpret. In addition, we
  * propose principled improvements to WS and WA tasks, which try to
    * address some of the critiques (Faruqui+ 2016), in authors’ opinion
      mostly due to their purely unsupervised nature

# 2 Proposal

* argument[s] for data efficiency focused evaluation
  * pretrained word embeddings provide little benefit [in] deep learning models
    (Zhang+ 2015, Zhang and Wallace, 2015, Andreas and Klein 2014). We
    * measuring performance after seeing just a subset of the supervised
      dataset is crucial for comparing word embeddings. Another argument is the
  * how easily accessible is the information in various embeddings
    * should be even stronger for sparse representations,
      * for which feature dimensions can have very strict semantic meaning
        (Faruqui and Dyer, 2015a)
    * injective (and thus not losing information) embedding ... (see Appendix)
* focus on simple supervised tasks to directly evaluate useful ...  content
  * specialized embeddings
    * In certain applications, like tagging [they are] crucial
      (Sharp+ 2016a, Lample+ 2016)
      * R Sharp, M Surdeanu, P Jansen, P Clark,  M Hammond
        Creating causal embeddings for QA with minimal supervision. 
        CoRR 2016b http://arxiv.org/abs/1609.08097
      * G Lample, M Ballesteros, K Kawakami, S Subramanian, C Dyer
        Neural architectures for named entity recognition.
        NAACL 2016
    * trade off ... between different information
      [our] hypothesis: specialization of word embeddings can be best evaluated
      by checking what simple information is most easily recoverable
  * word level classification problems (like noun classification) (Köhn, 2015b)
  * we also suggest [testing] relations between words (e.g. in WS and WA)
  * algebraic structure that is encoded in word representation space
    * embeddings have useful information only in a small subspace
      (Sattigeri & Thiagarajan, 2016, Rothe & Schütze, 2016, Astudillo+ 2015)
* include representatives of typical model classes (nonlinear and linear ones)
* report AUC of learning curve for each task, and pick [interesting] tasks

# Experiments

In this section we define specific metrics and tasks
* three main points of proposal:
  * supervised versions of WA and WS benchmarks
  * How stable is the ranking of embeddings under changing dataset size?
  * Are there embeddings that benefit from nonlinear models?
    * if any embeddings encode information in a “non-linear” fashion
* one of the main goals of representation learning is disentangling factors of
  variation, usually learned representations are entangled and dense

## Datasets and models

* Datasets [in] 4 categories: Similarity, Analogy, Sentence and Single word
  * Sentence and Single word datasets have binary targets
* 15 datasets
* Similarity: SimLex999 (Hill+ 15), MEN (Bruni+ 14),
  WordSimilarity353 (Finkelstein+ 01) and Rare Words (Luong+ 13)
* Analogy: 4 categories from WordRep (Gao+ 14)
  * We experimented with MSR and Google datasets and observed that
    models easily overfit if the train and test sets share the same words (not
    3-tuples). WordRep dataset is a set of pairs which we split into disjoint
    sets
* Sentence: Stanford Sentiment Treebank (Socher+ 13) and
  News20 (3 binary datasets) (Tsvetkov+ 15a)
* Single word: 
  Datasets constructed from lexicons collected in (Faruqui and Dyer 15b):
  * POS tagging (3 datasets for verb, noun and adjective)
  * word sentiment (1 dataset)
  * word color association (1 dataset) and
  * WordNet synset membership (2 datasets)
* Models for each datasets include both nonlinear and linear variants
  * When model is nonlinear, for robustness we include in search a fallback
    to a simpler linear or constant model
  * Analogy 3CosAdd and 3CosMul
* classifiers:
  * Similarity: cosine similarity, Random Forest (RF), Support Vector Regression
    (SVR) with RBF kernel 6 
  * Analogy: 3CosADD , 3CosMUL (Levy+ 2015) and
    regression neural network ..., see Appendix for further information
  * Sentence:
    * Logistic Regression,
    * Support Vector Machine (SVM) with RBF kernel taking as input avg(`w_i`)
    * Convolutional Neural Network (CNN) (Kim, 2014) taking conc(`w_i`)
  * Single word: RF, SVM (with RBF kernel), Naive Bayes,
    k-Nearest Neighbor Classifier and Logistic Regression
    
## Embeddings

* “shallow” pretrained embeddings: 
  * GloVe (100 and 300 dimensions) (Pennington+ 2014), 
  * Hellinger PCA (HPCA) (Lebret and Collobert 2014), 
  * PDC (100 and 300 dimensions) and 
  * HDC (300 dimensions) (Sun+ 2015)
* [pretrained] “deep” embeddings
  * Neural Translation Machine (NMT, activations of the deep model are
    extracted as word embeddings) (Hill+ 2014), 
  * morphological embeddings (morph ...) (Luong+ 2013) and 
  * HPCA variant trained using autoencoder architecture (Lebret & Collobert 15)
* In some experiments we additionally include publicly available pretrained
  skip-gram embeddings on 
  * Google News corpora and ...  on 
  * Wikipedia corpora (Ling+ 2015) (used commonly in syntax demanding tasks,
    like tagging).

TODO

## 3.4 Learnable Similarity and Analogy tasks

* analogy: In the case of HasContext and InstanceOf datasets...

## 3.3 Rank stability under changing dataset size

* Mean absolute value of change of ranking is approximately (averaged over all
  categories) 0.6 with standard deviation of 0.2. This means that usually an
  embeddings has a changed rank after training
* [but] averaged over many experiments, final ordering of embeddings tends to
  be similar, see Tab. 1 and Fig. 3. This is mainly because (tested) embeddings
  * different data efficiency properties for different tasks, i.e. none of
* standard deviation of both rank at the end and beginning is around 2.5, which
  further reinforces findings from (Schnabel and Labutov, 2015) that embeddings
  orderings are very task dependent.
* data efficiency [ exemplified by differences between GloVe 100 and ] 300
  (elaborated on in the next section)

## 3.6 Linear vs non–linear models

* there [are] embeddings especially fitted for use with linear models, Fig. 1.  
  * typically used evaluation does not answer [whether there is] information
    about task X in the embedding Y” 
  * e.g. difference in performance between two pretrained GloVe embeddings of
    different dimensionality (100 and 300)
    * shown previously that lower dimensional GloVe embeddings are better at
      syntactic tasks (Lai+ IEEE 2016), but 
      our evaluation reveals more complicated picture,
    * significantly better rank of GloVe 100 at the beginning [than] at the end 

## 3.7 Discussion

* algebraic interpretation of word embeddings (Arora+ 2016)
  * decompose word embedding space into a set of concepts 
  * (so each word vector can be well approximated by a sum of few concepts) 9 .
  * can be obtained using standard methods like k-SVD.
  * Theoretically, tasks ... should test for existence of such concepts

# 4 Conclustion

* e.g. differences between different size GloVe embeddings
