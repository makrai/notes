Ecco: An Open Source Library for the Explainability of Transformer LMs
J Alammar
ACL | IJCNLP 2021

* Ecco is available at https://www.eccox.io/
* The code is available at https://github.com/jalammar/ecco
* Video demo available at https://youtu.be/bcEysXmR09c

# Abstract

* understanding of Transformer-based NLP models' success
  lags behind our ability to continue scaling these models
* we present Ecco – an open-source library for transformer explainability
  * a set of tools to capture, analyze, visualize, and interactively explore
    the inner mechanics of these models
  * gradient-based feature attribution for natural language generation
  * hidden states and their evolution between model layers
  * convenient access and examination tools for neuron activations in the
    under-explored Feed-Forward Neural Network sublayer of Transformer layers
  * convenient examination of activation vectors
    via canonical correlation analysis (CCA), non-negative matrix factor (NMF),
    and probing classifiers
* We find that syntactic information can be retrieved from BERT’s FFNN reprs
  in levels comparable to those in hidden state representations
  * the model builds up syntactic information in its hidden states even when
    intermediate FFNNs indicate diminished levels of syntactic information

# 1 Intro

* A breakdown of the Transformer architecture is provided by Alammar (2018)
  and will help understand this paper’s details
* Pre-trained language models based on the architecture
  (Liu+ 2018; Devlin+ 2018; Radford+ 2018, 2019; Liu+ 2019; Brown+ 2020)
  continue to push the envelope in various tasks in NLP and, more recently, in
  computer vision (Dosovitskiy+ 2020)
  * understanding why these models work so well hE still lags behind these devs
* Ecco provides tools and interactive explorable explanations 3 aiding the
  examination and intuition of:
  * Input saliency methods that score input tokens importance to generating a
    token are discussed in section 2
  * Hidden state evolution across the layers of the model and
    what it may tell us about each layer’s role. This is discussed in section 3
  * Neuron activations and how individual and groups of model neurons spike in
    response to inputs and to produce outputs. This is discussed in section 4
  * Non-negative matrix factorization of neuron activations to
    uncover underlying patterns of neuron firings, revealing firing patterns of
    linguistic properties of input tokens.  This is discussed in subsection 4.2
* Ecco creates rich, interactive interfaces directly inside Jupyter notebooks
  (Ragan-Kelley+ 2014)
  on pre-trained models from the Hugging Face transformers library (Wolf+ 2020)
  * Currently it supports GPT2 (Radford+ 2018), BERT (Devlin+ 2018), and
    RoBERTa (Liu+ 2019). More models and explainability methods is under devel

# 2 Input Saliency

* methods for assigning feature importance scores to the inputs of an NLP model
  (Li+ 2015; Arrieta+ 2020)
  * these methods assign scores to input tokens. The literature is
  * most often for classification tasks rather than natural language generation
  * Ecco enables generating output tokens and then interactively exploring the
    saliency values for each output token

## 2.1 Saliency View

## 2.2 Detailed Saliency View

### About Gradient-Based Saliency

* feature importance based on Gradients X Inputs (Denil+ 2015; Shrikumar+ 2017)
  * shown by Atanasova+ (2020) to perform well across various datasets for text
    classification in Transformer models
* formula: k∇ X i f c (X 1:n )X i k 2 Where
  * X i is the embedding vector of the input token at timestep i, and
  * ∇ X i f c (X 1:n ) is the backpropagated gradient of the score of the token
  * vector is then aggregated into a score via calculating the L2 norm as
  * this was shown by Atanasova+ (2020) to perform better than other methods

# 3 Hidden States Examination

## 3.1 Canonical Correlation Analysis (CCA)

* Canonical Correlation Analysis (Hotelling, 1992) to examine LM internal reprs
  * Voita+ (2019) used hidden state to
    analyze the flow of information inside Transformers and
    how the informational content of hidden states compares across tasks
  * Singh+ (2019) examined internal representations of multilingual BERT
  * Wu+ (2020) compared the internal representations of multiple NLP models
  * these works used recently developed methods like
    SVCCA (Raghu+ 2017), PWCCA (Morcos+ 2018) and CKA (Kornblith+ 2019)
* Ecco bundles these methods (cca(), svcca(), pwcca(), and cka()) to allow
  convenient similarity comparison of language model representations
  * compare either hidden state representations or neuron activations
  * (Ecco pays special attention to the neurons after the largest dense FFNN
    layer as can be seen in Section 4)
* Figure 6 shows a comparison of the hidden states and FFNN neuron activations
  as the model processes textual input
* All three CCA methods take two activation vectors (be they hidden states or
  neuron activations) and assign a similarity score from zero (no correlation)
  to one (the two inputs are linear transformations of each other)

## 3.2 Ranking of Output Token Across Layers

* Nostalgebraist (2020): compelling visual treatments showcasing the evolution
  of token rankings, logit scores, and softmax probabilities for the evolving
  hidden state through the various layers of the model. The author
  * by projecting the hidden state into the output vocabulary using the
    language model head (which is typically used only for the output of the
    final layer)
* Ecco enables creating such plots as can be seen in Figure 7
  * More examples showcasing this method can be found in (Alammar, 2021)

## 3.3 Comparing Token Rankings

* which of two tokens the model chooses to output for a specific position
  * eg questions of subject-verb agreement like those posed by Linzen+ (2016)
> The keys to the cabinet _
* The only acceptable answers are 1) _is_ 2) _are_
* visualize the rankings of is and are using ecco.rankings watch(), which
  * Figure 8. The first column shows the rankings of the token is as the
  * five layers fail to rank _are_ higher than _is_

# 4 Neuron Activations

* The Feed-Forward Neural Network (FFNN) sublayer is
  one of the two major components inside a Transformer block (other: self-att)
* It often makes up two-thirds of a Transformer block’s parameters, thus
* Karpathy+ 2015; Strobelt+ 2017; Poerner+ 2018; Radford+ 2017; Olah+ 2017,
  2018; Bau+ 2018; Dalvi+ 2019; Rethmeier+ 2020
  examined neuron firings inside deep neural networks in both the NLP & vision
* Ecco makes it easier to examine neuron activations by collecting them and
  providing tools to analyze them and
  reduce their dimensionality to extract underlying patterns

## 4.1 Probing classifiers

* Probing classifiers (Veldhoen+ 2016; Adi+ 2016; Conneau+ 2018) are
  the most commonly used method for associating NLP model components with
  linguistic properties (Belinkov and Glass, 2019)
* Ecco currently: linear probes with control tasks (Hewitt & Liang 2019)
* Section 5 is a case study: probe FFNN representations for part-of-speech

## 4.2 Uncovering underlying patterns with NMF

* steps to shed light on how various neuron groups respond to input tokens
  * capturing the activations of the neurons in FFNN layers of the model and
  * decomposing them into a more manageable number of factors through NMF, we
* Figure 9: intuitively interpretable firing patterns
  extracted from raw firings through NMF
  * ten factors applied to the activations of layer #0 in response to a text
    passage,
    helps us identify neurons that respond to syntactic and semantic properties
  * The factor highlighted in this screenshot, factor 5, corrs with pronouns
* This interface can compress a lot of data that showcase the excitement levels
  of factors (and, by extension, groups of neurons)
  * sparklines (Tufte, 2006) on the left give a snapshot of the excitement
    level of each factor across the entire sequence
  * Interacting with the sparklines (by hovering with a mouse or tapping)
    displays the activation of the factor on the tokens in the sequence on the
    right

## 4.3 About Matrix Factorization of Neuron Activity

* Figure 10 explains the intuition behind dimensionality reduction using NMF
  * reveal underlying behavior common to groups of neurons
  * can be used to analyze the entire network, a single layer, groups of layers

# 5 Case study: Probing FFNN neuron activations for PoS information
