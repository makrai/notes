A Diagnostic Study of Explainability Techniques for Text Classification
Pepa Atanasova, Jakob Grue Simonsen, Christina Lioma, Isabelle Augenstein
EMNLP 2020

github.com/copenlu/xai-benchmark

# Abstract

* an abundance of new explainability techniques
  * compute saliency scores for the words of an input instance
  * hE no definitive guide on how to choose such a technique
    * given a particular application task and model architecture, and
    * the benefits and drawbacks of using each such technique
* we develop a comprehensive list of diagnostic properties for eval
  * compare a set of diverse explainabil techniques
    on downstream text classification tasks and neural network architectures
  * compare the saliency scores assigned by the explainability techniques with
    human annotations of salient input regions
    * relations between a model’s performance and the agreement of its rationales
      with human ones
  * gradient-based explanations perform best across tasks and model archits,
  * we present further insights into the properties of the reviewed expl techs

# 1 Intro

* greater insight into the models’ reasons for making a particular prediction
  has already proven to be essential for discovering potential flaws or biases
  in medical diagnosis (Caruana+ 2015) and judicial sentencing (Rich, 2016). In
  * European law has mandated “the right ... to obtain an explanation of the
    decision reached” (Regulation, 2016)
* Explainability methods attempt to reveal the reasons behind a model’s
  prediction for a single data point, as shown in Figure 1
  * post-hoc, i.e., with already trained models. Such post-hoc explanation
    * applicable to one specific model (Martens+ 2008; Wagner+ 2019) or
    * applicable to more models (Ribeiro+ 2016; Lundberg and Lee, 2017). They
    * can further be categorised as:
      * some employ model gradients (Sundararajan+ 2017; Simonyan+ 2013), being
      * perturbation based (Shapley, 1953; Zeiler and Fergus, 2014) or
      * through model simplifications (Ribeiro+ 2016; Johansson+ 2004). There
      * textual explanations (Camburu+ 2018) and are trained
      * posthoc or jointly with the model at hand
* varying, sometimes contradicting explanations, as illustrated in Figure 1
* provide a generally applicable and automated methodology for choosing one
  that is suitable for a particular model architecture and application task
  (Jacovi and Goldberg, 2020)
* Robnik-Šikonja and Bohanec (2018): a list of property definitions for
  explainability techniques, but it remains
  a challenge to evaluate them in practice
* setups for probing varied aspects of explainability techniques
  (DeYoung+ 2020; Sundararajan+ 2017)
* existing studies evaluating explainability methods are discordant [!agree]
  and do not compare to properties from previous studies. In our work,
* we consider properties from related work and extend them to be applicable to
  a broader range of downstream tasks
* to create a thorough setup for evaluating explainability methods, one should
  * groups of explainability methods
    (explanation by simplification, gradient-based, etc.)
  * downstream tasks, and
  * model architectures
  * hE, existing studies usually consider at most two of these aspects, thus
* We propose a number of diagnostic properties for explainability methods and
  evaluate them in a comparative study. We consider explainability methods from
  groups, all widely applicable to most ML models and application
  tasks. We conduct an evaluation on three text classification tasks, which
  contain human annotations of salient tokens
* annotations available/not in NLP/vision
  * Such annotations are available for Natural Language Processing (NLP) tasks,
    as they are relatively easy to obtain. This is in contrast to ML sub-fields
  * image analysis: we only found one relevant dataset – 536 manually annotated
    object bounding boxes for Visual Question Answering (Subramanian+ 2020)
* We further compare explainability methods across three of the most widely
  used model architectures – CNN, LSTM, and Transformer
  * Transformer model
    achieves SOTA performance on many text classification tasks but has a
    complex architecture, hence methods to explain its predictions are strongly
    desirable
  * The proposed properties can also be directly applied to Machine Learning
    (ML) subfields other than NLP.  The code for the paper is publicly
* In summary, the contributions of this work are:
  * We compile a comprehensive list of diagnostic properties for explainability
    and automatic measurement of them, allowing for their effective assessment
  * We study and compare the characteristics of groups of expla techs
    in three application tasks and three model architectures
  * We study the attributions of the explainability techniques and human
    annotations of salient regions to
    compare and contrast the rationales of humans and machine learning models
