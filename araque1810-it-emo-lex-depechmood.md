DepecheMood++: a Bilingual Emotion Lexicon Built Through Simple Yet Powerful Techniques
Oscar Araque, Lorenzo Gatti, Jacopo Staiano, Marco Guerini
arXiv:1810.03660 [cs.CL]

* we contribute
  * two new resources to the community:
    * an extension of an existing and widely used emotion lexicon for English;
    * a novel version of the lexicon targeting Italian. Furthermore,
  * we show how simple techniques can be used, both in supervised and unsup
    * on datasets and tasks of varying degree of domain-specificity

# 1 Introduction

* we build upon the methodology proposed in the publicly available English lex
  * DepecheMood (Staiano and Guerini, 2014; Guerini and Staiano, 2015)
* We perform experiments on six datasets/tasks exhibiting a wide diversity in
  * domain (namely: news, blog posts, mental health forum posts, twitter),
  * languages (English, and Italian)
  * supervised and unsupervised
  * regression and classification
* The results obtained show that:
  1. training straightforward classifiers/regressors from a
     high-coverage/high-precision lexicon, derived from general news data,
     allows to obtain good performances also on domain-specific tasks, and
     provides more challenging baselines for complex task-specific models;
  2. depending on the characteristics of the target language, specific
     pre-processing steps (e.g.  lemmatization in case of morphologically-rich
     languages) can be beneficial;
    * for English building a token-based vocabulary suffices and further
      pre-processing stages do not help, while
    * for Italian, significant improvements when adding a lemmatization step
  3. coverage of the original lexicon can be extended using embeddings, and such
     technique can provide performance improvements

# 5 Discussion

* adding a word frequency cutoff parameter leads to a benefit in the
  performance of the generated lexicon; in our experiments we find an optimal
  value of 10 for both the English and Italian lexica
* additional data would not lead to further improvements, at least for English

# 6 Increasing Coverage through Embeddings

* word embeddings in sentiment analysis (Giatsoglou+ 2017)
* The pre-trained word embeddings used for Italian we use those by
  Tripodi and Li Pira (2017); Figure 2 shows the results of this evaluation
