Information-Theoretic Probing with Minimum Description Length 
Elena Voita, Ivan Titov
EMNLP 2020

# Abstract

* probes do not substantially favour pretrained representations over randomly
  initialized ones. Analogously, their 
* accuracy can be similar when probing for genuine linguistic labels and probing
  for random synthetic tasks. 
* To see reasonable differences in accuracy with respect to these random
  baselines, previous work had to constrain either the amount of probe training
  data or its model size. Instead, 
* we propose information-theoretic probing with minimum description length (MDL)
  * training a probe to predict labels is recast as teaching it to effectively
    transmit the data. Therefore, 
  * the measure of interest changes from probe accuracy to the 
    description length of labels given representations.  In addition to probe
    * evaluates “the amount of effort” needed to achieve the quality. This
    * characterizes either (i) size of a probing model, or (ii) the amount of
      data needed to achieve the high quality.  We consider 
* two methods for estimating MDL which can be easily implemented on top of the
  standard probing pipelines: variational coding and online coding.  We show
  * these methods agree in results and are 
  * more informative and stable than the standard probes.

# 1 Introduction

* compare pretrained reprs with randomly initialized ones (Zhang & Bowman, 2018)
* probing for tags randomly associated to word types 
  (‘control tasks’, Hewitt and Liang (2019)). 
* To see differences in the accuracy with respect to these random baselines, prv
  * reduce the amount of a probe training data (Zhang and Bowman, 2018) or use
    smaller models for probes (Hewitt and Liang, 2019).  
* information-theoretic view
  * Any regularity in representations with respect to labels can be exploited
    both to make predictions and to compress these labels, i.e., reduce length
    of the code needed to transmit them. Formally, we recast learning a model of
    data (i.e., training a probing classifier) as training it to transmit the
    data (i.e., labels) in as few bits as possible. This naturally leads to a
    change of measure: instead of evaluating probe accuracy, we evaluate minimum
    description length (MDL) of labels given representations, i.e.  the minimum
    number of bits needed to transmit the labels knowing the representations.
  * since labels are transmitted using a model, the model has to be
    transmitted as well (directly or indirectly).

Thus, the overall codelength is a combination of the quality of fit of the model
(compressed data length) with the cost of transmitting the model itself.

Intuitively, codelength characterizes not only the final quality of a probe, but
also the ‘amount of effort’ needed achieve this quality (Figure 1). If rep-
resentations have some clear structure with respect to labels, the relation
between the representations and the labels can be understood with less effort;
for example, (i) the ‘rule’ predicting the label (i.e., the probing model) can
be simple, and/or (ii) the amount of data needed to reveal this structure can be
small. This is exactly how our vague (so far) notion of ‘the amount of effort’
is translated into codelength. We explain this more formally when describing the
* variational coding and online coding; they differ in a way they incorporate
  model cost: directly or indirectly.

* Variational code explicitly incorporates cost of transmitting the model (probe
weights) in addition to the cost of transmitting the labels; this joint cost is
exactly the loss function of a variational learning algorithm (Honkela and
Valpola, 2004). As we will see in the experiments, close probe accuracies often
come at a very different model cost: the ‘rule’ (the probing model) explaining
regularity in the data can be either simple (i.e., easy to communicate) or
complicated (i.e., hard to communicate) depending on the strength of this
regularity.  
* Online code provides a way to transmit data without directly transmitting
  the model. Intuitively, it measures the ability to learn from different
  amounts of data. In this setting, the data is transmitted in a sequence of
  portions; at each step, the data transmitted so far is used to understand
  the regularity in this data and compress the following portion. If the
  regularity in the data is strong, it can be revealed using a small subset of
  the data, i.e., early in the transmission process, and can be exploited to
  efficiently transmit the rest of the dataset. The online code is 
  * related to the area under the learning curve, which plots quality as a
    function of the number of training examples.  
* previous work manually tuned (i) model size and/or (ii) the amount of data, we
  * these were indirect ways of accounting for the ‘amount of effort’ component
    of (i) variational and (ii) online codes, respectively.  Interestingly,
* our experiments show that, differently from accuracy, conclusions made by MDL
  probes are not affected by an underlying probe setting, thus no manual search
  for settings is required.

We illustrate the effectiveness of MDL for different kinds of random
baselines. For example, when considering control tasks (Hewitt and Liang, 2019),
while probes have similar accuracies, these accuracies are achieved with a small
probe model for the linguistic task and a large model for the random baseline
(control task); these architectures are obtained as a byproduct of MDL
optimization and not by manual search.

## 3.2

### Architecture: sparse for linguistic, dense for control. The method for the
