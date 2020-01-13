Fahim Dalvi, Nadir Durrani, Hassan Sajjad, Yonatan Belinkov, A Bau, James Glass
What is one grain of sand in the desert?
  analyzing individual neurons in deep nlp models
AAAI 2019

code is publicly available1 as part of the NeuroX toolkit (Dalvi+ 2019)
https://github.com/fdalvi/NeuroX

# Abstract

* We propose two methods:
  * Linguistic Correlation Analysis
    * most relevant neurons with respect to a [supervised] extrinsic task, and
  * Cross-model Correlation Analysis, an
    * unsupervised method to extract salient neurons wrt the model itself
* We evaluate the effectiveness of our techniques by
  ablating the identified neurons and reevaluating the network’s performance
  for two tasks: neural machine translation (NMT) and neural language modeling
  (NLM). We further present a comprehensive analysis of neurons with the aim to
* questions:
  1. how localized or distributed are different linguistic properties in the
  1. are certain neurons exclusive to some properties and not others?
  1. is the information more or less distributed in NMT vs. NLM? and
  1. how important are the neurons identified through the linguistic
     correlation method to the overall task? Our

# Intro

* methods to facilitate neuron analysis. First, we perform an
  * Linguistic Correlation Analysis
    * extrinsic correlation analysis through supervised classification on a
      number of [important] linguistic properties
    * e.g. morphology lies at the heart of modeling various NLP problems)
    * extracts important individual (or groups of) neurons
  * Cross-model Correlation Analysis
    * for neurons that share similar patterns in independently trained
      networks, based on the assumption that [these capture] important properts
    * helpful ... in the case when annotated data (supervision) may not [exist]
* ablation experiments: masking out important neurons [or] removing them
  1. open class categories such as verb (part-of-speech tag) and location
     (semantic entity) are much more distributed across the network
     compared to closed class categories such as coordinating conjunction
     (e.g., “but/and”) or a determiner (e.g., “the”),
  1. the model recognizes a hierarchy of linguistic properties
    and distributes neurons based on it, and
  1. important neurons extracted from the [two methods] overlap
   * e.g. position as salient. In summary, we make the following
* contributions:
  * A general methodology for identifying linguistically meaningful neurons
  * An unsupervised method for finding important neurons in neural networks,
    * quantitative evaluation of the retrieved neurons
  * Application to various test cases, investigating core language properties
    through part-of-speech (POS), morphological, and semantic tagging
  * An analysis of distributed vs. focused information in NMT and NLM models

# Related Work

* what NNs learn about various language properties
  * word and sentence embeddings
    (Adi+ 2016; Qian, Qiu, and Huang 2016b; Conneau+ 2018)
  * recurrent neural network (RNN) states
    (Shi, Padhi, and Knight 2016; Wang, Chung, and Lee 2017)
  * and NMT representations (Belinkov+ 2017a; 2017b; Dalvi+ 2017)
* language properties mainly analyzed are
  * morphological (Qian, Qiu, and Huang 2016b; Vylomova+ 2016)
  * semantic (Qian, Qiu, and Huang 2016b) and
  * syntactic
    (Shi, Padhi, and Knight 16; Linzen, Dupoux, and Goldberg 16; Conneau+ 18)
* Most of this work used an
  extrinsic supervised task and target entire vector representations. We study
* Some recent work on neural LM and MT analyzes specific neurons of
  * length (Qian, Qiu, and Huang 2016a; Shi, Knight, and Yuret 2016) and
  * sentiment (Radford, Jozefowicz, and Sutskever 2017). However, not much work
* In computer vision, ... visualizing and analyzing individual units such as
  * filters in CNNs (Zeiler and Fergus 2014; Zhou+ 2016)
  * doubts were cast on the importance of individual units (Morcos+ 2018),
  * ablation studies similar to the ones we conduct (Zhou+ 2018)

# Methodology 2

* e.g. in an NMT system, M could be the encoder, x the input word embeddings,
  and z the hidden states. Our goal is to study individual neurons in the
* Linguistic Correlation Analysis method to find neurons specific to a task
* Cross-model Correlation Analysis method for
  ranking based on the correlations between neurons from different networks

## Linguistic Correlation Analysis

* classification task where the goal is to predict a property l in a property
* e.g. word-structure (morphology) or semantic information in an NMT model
* we have supervision for the task in the form of labeled examples {x i , l i }
* logistic regression classifier on the {z i , l i } pairs using the
  cross-entropy loss. We opt to train a
  * linear model because of its explanability; the learned weights can be
    * non-linear models present similar trends
      (Qian, Qiu, and Huang 2016b; Belinkov+ 2017a)
  * elastic net regularization (Zou and Hastie 2005) as an additional
    * enjoys the sparsity effect as in Lasso regularization, which helps
    * takes groups of highly correlated features into account similar to Ridge
    * a good balance between localization and distributivity. This is
    * particularly useful [analyzing neural networks]:
      both individual focused neurons and a group of distributed neurons,

### Ranking Neurons: Given the trained weights of the classifier θ ∈ R D×L

* for an individual property, We consider the top n neurons  that cumulatively
  contribute to some percentage of the total weight mass as salient neurons
* To extract a ranking of neurons w.r.t. all of the labels in P, we use an
  iterative process `for percent in 1..100: for label in P`

## Cross-model Correlation Analysis

* to identify neurons salient to the model M independent of any property. In
* according to their importance to the task the model M is trained on
* We hypothesize that salient neurons ... are shared across several models. To
  * we train multiple models ... with differing training data and init
  * rank neurons in one of the models M i by their best correlation coefficient
    with any neuron from a different model

## Evaluation using Neuron Ablation

* Given the list of neurons from a trained model M, we evaluate the rankings
* We clamp the value of a subset of neurons to zero as in (Morcos+ 2018)
* We apply ablation to both
  * the classifier (to evaluate property-specific rankings) and
  * the original model M (to evaluate model-level rankings)

### Ablation in Classification

* we keep N% top or bottom neurons and
  * set the activation values of all other neurons to zero in the test set OR
  * We also retrain the classifier. Purposes:
    * it confirms the results from the zeroing-out method,
    * it shows that much of the performance can be regained
    * it facilitates the analysis of how distributed a particular property is

### Ablation in Neural Model M:

* [we report the drop] in terms of BLEU scores (for NMT) or perplexity (NLM)

# Experimental Settings 4

* two architectures:
  * NMT based on sequence-to-sequence learning with attention
    (Bahdanau, Cho, and Bengio 2014)
  * LSTM based NLM (Hochreiter and Schmidhuber 1997)
* leave ... the Transformer (Vaswani+ 2017) or QRNN (Bradbury+ 2017) for future

## Language Properties

* part-of-speech (POS), morphological and semantic tagging
* Additionally we considered some general properties
  e.g. position of words in a sentence and predicting a months of year tag

# Evaluation 4

* In this section, we present the evaluation of our techniques:

## Linguistic Correlation Analysis

### Classifier Performance: We first evaluate the classifier performance

* to ensure that the learned weights are actually meaningful for further
* higher accuracies compared to the local majority baseline 7 (MAJ) in all
* [params of the] elastic net regularization, we need to tune the values for λ
  * λ 1 introduces further sparsity whereas higher values of
  * λ 2 encourage selection of groups of correlated neurons
  * Our aim is to find a balance between
    * selecting individual neurons and a group of neurons while
    * maintaining the original accuracy of the classifier without any
      regularization (λ 1 , λ 2 = 0). Figure 2 presents the results of a grid

## Neuron Ablation in the Classifier:

# Analysis and Discussion 6

The rankings produced by the linguistic correlation and cross-correlation anal
give ... the most important neurons for an auxiliary task or the overall model

## Focused versus Distributed Neurons:

* Recall that our linguistic-correlation method provides
  * an overall ranking w.r.t. a property set (POS/SEM tagging), and also
  * for each individual property
* We choose the neurons for each label that cumulatively represent 25% weight
* Here, we look at the number of salient neurons (extracted from the NMT mod)
* Figure 6.  For example, in
  * POS
    * open-class categories such as nouns (NN/NOM), verbs (VB/VER.simp/VVPP)
      and adjectives (JJ/ADJ): several dozen nodes
    * end of sentence marker (SENT) or WH-Adverbs (WRB) and post-positions
      (APPO in German) required fewer than 10 neurons. We observed similar
  * semantic tags: information about
    * closed0-class categories such as months of year (MOY) is localized in
      just a couple of neurons. In contrast, an
    * open category like location (LOC) is very distributed

## Shared Neurons within and across Properties: Since some information is

* we expect to see some neurons that are common across various properties, and
  others that are unique to certain properties.  To investigate this, we
* e.g
  * some common neurons across all forms of adjectives, but
  * some neurons specifically designated to e.g. comparative (JJR) and superlat
* across tasks (POS vs.  Morph), we found
  * multiple neurons targeting [verb number]
  * a single neuron targeting the future tense verb tag (VER:futu) in POS

## Retraining Classifier with the Selected Neurons

* with the top or bottom N% neurons alone
* Table 4 shows the results after retraining.  There are several points to note
  * The classifier is able to regain performance substantially (compared to
    ALL), even using only 10% [top] neurons
  * Using the bottom N% neurons also restores performance (although not as much
    as using the top neurons)
* using only 20% of the top neurons, the classifier is able to regain much
  * our method could be useful for model distillation purposes

## Cross-model Correlation Ranking

* word position
  * we found several neurons corresponding to the position of the word in a s
  * an important property in NMT (Shi, Knight, and Yuret 2016). The fact that
    our method ranks position neurons among the top ranking neurons shows its
  * top position neurons identified by our Linguistic Correlation method are
    the same as identified by the Cross-model correlation method. Lastly, we
* some of the remaining top Cross-model neurons
  correspond to fundamental structural properties in a sentence, like
  relations, conjunctions, determiners and punctuations

## Comparing NMT vs.~NLM: There is

* difference between top and bottom neurons ... averaged over all properties,
  * NMT neurons are 12.8% (absolute) better accuracy than the bottom 10%
  * NLM neurons are 25.5% better than the bottom 10% neurons
* We speculate that
  * NMT model distributes the information more, compared to the NLM model OR
  * difference in the architecture of NLM (unidirectional) and NMT (bidir)

# Conclusion and Future Work

* successfully manipulate verb tense neurons and control output (Bau+ 2019)

# Acknowledgments We thank Preslav Nakov and the anonymous reviewers
