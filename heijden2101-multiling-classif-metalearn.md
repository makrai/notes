Multilingual and cross-lingual document classif: A meta-learning approach
Niels van der Heijden, Helen Yannakoudakis, Pushkar Mishra, Ekaterina Shutova
EACL 2021 arXiv:2101.11302 [cs.CL]

* we propose a meta-learning approach to document classification in
  limited-resource setting and demonstrate its effectiveness in two different
* 2 settings
  * few-shot, cross-lingual adaptation to previously unseen languages; and
  * multilingual joint training when limited target-language data is available
    during training. We conduct a
* systematic comparison of several meta-learning methods, investigate
  * multiple settings in terms of data availability and show that
  * meta-learning thrives [prosper] in settings with a heterogeneous task distr
  * We propose a simple, yet effective adjustment to existing meta-learning
    methods which allows for better and more stable learning, and set a
  * new SOTA on several languages while performing on-par on others, using only
    a small amount of labeled data. 

# 1 Intro

* cross-lingual transfer learning, hE either/or
  * not close the gap with performance in a single high-resource language
    (Artetxe and Schwenk, 2019; Conneau+ 2019; van der Heijden+ 2019), e.g.,
    because of cultural differences in languages which are not accounted for,
  * impractically expensive (Lai+ 2019).
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
* meta-learning for cross-lingual few-shot learning is the one by
  (Nooralahzadeh+ 2020), focusing on NLI and multilingual question answering.
  * focus on applying meta-learning to learn to adapt a monolingually trained
    classifier to new languages. In contrast to this work,
  * we instead show that, in many cases, it is more favourable to not
    initialize the meta-learning process from a monolingually trained
    classifier, but rather reserve its respective training data for
    metalearning instead.
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
    using only a small amount of data.
