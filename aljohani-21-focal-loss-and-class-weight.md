A novel focal-loss and class-weight-aware convolutional neural network
  for the classification of in-text citations
Naif Radi Aljohani nraljohani@kau.edu.sa, Ayman Fayoumi, and Saeed-Ul Hassan https://orcid.org/0000-0002-6509-9190View all authors and affiliations
2021 Journal of Information Science Volume 49, Issue 1

# Abstract

* citations have different reasons and functions
* dataset: 10K citation contexts annotated by human experts, extracted from the
  Association for Computational Linguistics repository, we present a deep
  learning–based citation context classification architecture. Unlike all
  existing SOTA feature-based citation classification models, our proposed
* CNN with fastText-based pre-trained embedding vectors uses only the citation
  context as its input to outperform them in both binary(important and
  non-important) and multi-class (Use, Extends, CompareOrContrast, Motivation,
  Background, Other) citation classification tasks. Furthermore,
* we propose using focal-loss and class-weight functions in the CNN model
  to overcome the inherited class imbalance issues in citation classification
  * using the focal-loss function with CNN adds a factor of $(1-p_t)^\gamma$ to
    the cross-entropy function
* Our model improves on the baseline results by achieving an encouraging
  * binary: 90.6 F1 score with 90.7% accuracy and a
  * multi-class: 72.3 F1 score with a 72.1% accuracy score, respectively, for

# 1. Introduction
# 2. Literature review
# 3. Data and methodology

### 3.2.3. Techniques for addressing the class imbalance in CNN

* Weight balancing is the mechanism used to balance our dataset
* Focal loss [42]
  * Tsung-Yi Lin, Priya Goyal, Ross Girshick, Kaiming He, Piotr Dollar
    Focal loss for dense object detection
    In: Proceedings of the IEEE international conference on computer vision,
    Venice, 22-29 October 2017, pp. 2980–2988. New York: IEEE
  * puts more emphasis on hard-classified examples than well-classified samples
    * In our dataset, we had some data samples that were easy to classify: ~99%
      efficac

# 4. Experimentations and results
# 5. Concluding remarks
# Acknowledgments
