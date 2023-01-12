Multilingual and cross-lingual document classif: A meta-learning approach
Niels van der Heijden, Helen Yannakoudakis, Pushkar Mishra, Ekaterina Shutova
EACL 2021 arXiv:2101.11302 [cs.CL]

# Abstract

* we propose a meta-learning approach to document classification in
  limited-resource setting
* 2 settings
  * few-shot, cross-lingual adaptation to previously unseen languages; and
  * multilingual joint training when limited target-language data is available
    during training
* systematic comparison of several meta-learning methods
  * multiple settings in terms of data availability and show that
  * meta-learning thrives [prosper] in settings with a heterogeneous task distr
  * We propose a simple, yet effective adjustment to existing meta-learning
    methods which allows for better and more stable learning, and set a
  * new SOTA on several languages while performing on-par on others,
    using only a small amount of labeled data

# 1 Intro

* cross-lingual transfer learning, hE either/or
  * not close the gap with performance in a single high-resource language
    (Artetxe and Schwenk, 2019; Conneau+ 2019; van der Heijden+ 2019), eg
    because of cultural differences in languages which are not accounted for,
  * impractically expensive (Lai+ 2019)
* Meta-learning, or learning to learn
  (Schmidhuber, 1987; Bengio+ 1990; Thrun and Pratt, 1998), is a learning
  * focuses on the quick adaption of a learner to new tasks. The idea is that
  * from a few examples on a diverse set of training tasks, the learner can
    also generalize to unseen tasks at test time. Meta-learning has recently
  * a promising technique for few-shot learning for a wide array of tasks
    (Finn+ 2017; Koch+ 2015; Ravi and Larochelle, 2017)
    * NLP (Dou+ 2019; Gu+ 2018). To our best knowledge,
  * no previous work has been done in investigating meta-learning as a
    framework for multilingual and cross-lingual few-shot learning. We propose
* meta-learning for cross-lingual few-shot learning
  * Nooralahzadeh+ (2020) focus on NLI and multilingual question answering
  * focus on applying meta-learning to learn to adapt a monolingually trained
    classifier to new languages. In contrast to this work,
  * we instead show that, in many cases, it is more favourable to not
    initialize the meta-learning process from a monolingually trained
    classifier, but rather reserve its respective training data for
    metalearning instead
* Our contributions are as follows:
  * a meta-learning approach to few-shot cross-lingual and multilingual adapt
    * demonstrated on document classification tasks over traditional supervised
      learning;
  * an extensive comparison of meta-learning methods on multilingual and
    cross-lingual few-shot learning and release our code to facilitate further
  * We analyse the effectiveness of meta-learning under a number of different
    * parameter initializations and settings in terms of data availability, and
    * meta-learning can effectively learn from
      few examples and diverse data distributions;
  * a simple yet effective modification to existing methods and empirically
    * stabilizes training and converges faster to better local optima;
  * new SOTA on several languages and achieve on-par results on others
    using only a small amount of data

# 3 Related work

## 3.1 Multilingual NLP

* dense, lowdimensional vector representations for words (Mikolov+ 2013b) so
  cross-lingual: Mikolov+ (2013a); Faruqui+ (2014). More recently, multilingual
* one shared encoder for multiple languages at once, either/or by
  * explicitly aligning representations with the use of parallel corpora
    (Artetxe and Schwenk, 2019; Lample and Conneau, 2019)
  * jointly training on some monolingual language model objective, such as the
    Masked Language Model (MLM, Devlin+ 2018), in multiple languages (Devlin+
    2018; Conneau+ 2019)
  * create a shared embedding space for multiple languages with the hope that
    fine-tuning in one language does not degrade performance in others
* domain drift
  * Lai+ (2019) argue that just aligning languages is not sufficient to
    generalize performance to new languages due to the phenomenon they describe
  * differences for the same tasks in different languages which cannot be
    captured by a perfect translation system, such as differences in culture
  * They instead propose a multi-step approach which utilizes a
    multilingual teacher trained with Unsupervised Data Augmentation (UDA, Xie+
    2019) to create labels for a student model that is pretrained on large
    amounts of unlabeled data in the target language and domain using the MLM
    objective
  * SOTA results on the
    MLDoc document classification task (Schwenk and Li, 2018) and the
    Amazon Sentiment Polarity Review task (Prettenhofer and Stein, 2010)
* hE high computational cost involved
  * For every language and domain combination:
    * a MT system has to be inferred on a large amount of unlabeled samples;
    * the UDA method needs to be applied to obtain a teacher model to generate
      pseudo-labels on the unlabeled in-domain data;
    * a language model must be finetuned, which involves forwards and backwards
      computation of a softmax function over a large output space
      (eg 50k tokens for mBERT and 250k tokens for XLM-RoBERTa)
    * training the finetuned LM on the pseudo-labels generated by the teacher

# 4 Data

## MLDoc (Schwenk and Li 2018)

* an improved version of the Reuters Corpus Volume 2 (Lewis+ 2004) with
  balanced class priors for all languages
* news stories in 8 languages:
  English, Spanish, French, Italian, Russian, Japanese and Chinese
* manually classified into one of four groups:
  Corporate/Industrial, Economics, Government/Social and Markets
* train datasets contain 10k samples whereas the test sets contain 4k sample
