Richard Socher, Milind Ganjoo, Hamsa Sridhar, Osbert Bastani, Christopher D. Manning, Andrew Y. Ng
2013
Zero-Shot Learning Through Cross-Modal Transfer

# Abstract

* recognize objects in images even if no training data ... for the object class
* knowledge about unseen visual categories comes from unsupervised text
* operate on a mixture of seen and unseen classes
* result
  * state of the art performance on classes with thousands of training images
  * reasonable performance on unseen classes
* does not require any manually defined semantic or visual features
* Images are mapped to be close to word vectors corresponding to their classes
* two novelty detection strategies;
  * the first gives high accuracy on unseen classes, while
  * the second is conservative in its prediction of novelty and
    * keeps the seen classes’ accuracy high

# 1 Introduction

* classify instances of an unseen visual class, called zero-shot learning,
* semantic space of words is learned by a neural network model [15]
* result
  * state of the art accuracy on known classes as well as
  * reasonable performance on unseen classes

# 2 Related Work

* low-level image features
* Domain Adaptation:
  * e.g., in sentiment analysis one could train a classifier for movie reviews
    and then adapt from that domain to book reviews
* Deep Boltzmann Machines
* multimodal distributional methods
  * [11, 22]
  * Most recently, Bruni+ [5]:
    * joint models are better to predict the color of concrete objects

# 3 Word and Image Representations

* vectors of distributional characteristics
  * most often their co-occurrences with words in context
  * have proven very effective in natural language processing tasks such as
    * sense disambiguation (Torralba+ NIPS 2012), thesaurus extraction [23, 8]
      * A. Torralba R. Salakhutdinov, J. Tenenbaum
      * Learning to learn with compound hierarchical-deep models
    * cognitive modeling
* Coates+ [6] to extract image features from raw pixels
* a zero-shot olytályokhoz használt szavak előre adottak

# 5 Zero-Shot Learning Model

* softmax classifier

# 6 Experiments

6.1 Seen and Unseen Classes Separately
6.2 Influence of Novelty Detectors on Average Accuracy
6.3 Combining predictions for seen and unseen classes
6.4 Comparison to attribute-based classification
6.5 Novelty detection in original feature space
6.6 Extension to CIFAR-100 and Analysis of Deep Semantic Mapping
6.7 Zero-Shot Classes with Distractor Words

# 7 Conclusion
