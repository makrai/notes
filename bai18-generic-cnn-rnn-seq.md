An Empirical Evaluation of Generic Convolutional and Recurrent Networks
  for Sequence Modeling
Shaojie Bai, J. Zico Kolter, Vladlen Koltun
arXiv:1803.01271

# Abstract

* recent results indicate that convolutional architectures can outperform
  recurrent networks on tasks such as audio synthesis and MT
* We conduct a systematic evaluation of generic convolutional and recurrent
  * across a broad range of tasks that are standard for recurrent networks
* Our results indicate that a simple convolutional architecture outperforms
  canonical recurrent networks across a diverse range of tasks and datasets
* effective memory

http://github.com/locuslab/TCN

# Introduction

* recent research in audio synthesis, word-level LM, and MT
  (van den Oord+ 2016; Kalchbrenner+ 2016; Dauphin+ 2017; Gehring+ 2017a;b)
  * whether these successes confined to specific application domains
* our tasks include
  * polyphonic music modeling,
  * word and character-level LM, as well as
  * synthetic stress tests i.e
    deliberately designed and frequently used to benchmark RNNs
* we describe
  * a generic temporal convolutional network (TCN) architecture
    * informed by recent research, but is deliberately kept simple
    * compared to canonical recurrent architectures such as LSTMs and GRUs
  * memory retention characteristics of recurrent networks
  * despite the theoretical ability of recurrent architectures to capture
    infinitely long history, TCNs exhibit substantially longer memory
  * TCN not only more accurate than  LSTMs and GRUs, but
    also simpler and clearer
    * therefore a more appropriate starting point in sequence modeling

# 2. Background 2

* Convolutional networks (LeCun+ 1989)
  * applied to sequences for decades (Sejnowski & Rosenberg, 1987; Hinton 1989)
  * speech recognition in the 80s and 90s (Waibel+ 1989; Bottou+ 1990)
  * part-of-speech tagging and semantic role labelling
    (Collobert & Weston, 2008; Collobert+ 2011; dos Santos & Zadrozny, 2014)
  * More recently to
    * sentence classification (Kalchbrenner+ 2014; Kim, 2014) and
    * document classification
      (Zhang+ 2015; Conneau+ 2017; Johnson & Zhang, 2015; 2017)
    * MT (Kalchbrenner+ 2016; Gehring+ 2017a;b),
      audio synthesis (van den Oord+ 2016), and
      LM (Dauphin+ 2017)
* Recurrent networks (Elman, 1990; Werbos, 1990; Graves, 2012)
  * LM (Sutskever+ 2011; Graves 2013; Hermans & Schrauwen 2013)
  * MT (Sutskever+ 2014; Bahdanau+ 2015)
    * intuitive appeal: the hidden state can act as a representation of
      everything that has been seen so far in the sequence
  * Basicly notoriously difficult to train (Bengio+ 1994; Pascanu+ 2013)
  * LSTM (Hochreiter & Schmidhuber, 1997) and the GRU (Cho+ 2014)
  * Many other architectural innovations and training techniques
    * Hierarchical RNNs for long-term dependencies (El Hihi & Bengio, 1995)
    * Bidirectional RNNs (Schuster & Paliwal, 1997)
    * ...precise timing (Gers+ 2002)
    * clockwork RNN (Koutnik+ 2014)
    * initialize RNNs of rectified linear units (Le+ 2015)
    * Layer normalization (Ba+ 2016)
    * multiplicative integration (Wu+ 2016)
    * Regularizing RNNs by stabilizing activations (Krueger+ 2017)
    * Quasi-recurrent neural networks (Merity+ ICLR 2017)
    * Learning to skip state updates in RNNs (Campos+ ICLR 2018)
* studies to evaluate different recurrent architectures
  * compared LSTM vs. GRU on polyphonic music modeling (PMM) (Chung+ 2014)
  * deep RNN architectures on PMM, charLM, and word-level LM (Pascanu+ 2014)
  * ten thousand RNN architectures on various tasks (Jozefowicz+ 2015)
  * eight LSTM variants on speech r, handwriting r, and PMM (Greff+ 2017)
  * connecting architectures of RNNs
    on character-level LM and on synthetic stress tests (Zhang+ 2016)
  * benchmarked LSTMs on word-level and character-level LM (Melis+ 2018)
  * LSTM wins in three of these
* combine aspects of RNN and CNN architectures
  * Convolutional LSTM (Shi+ 2015)
    * replaces the fully-connected layers in an LSTM with convolutional layers
      to allow for additional structure in the recurrent layers; the
  * Quasi-RNN model (Bradbury+ 2017) that
    interleaves convolutional layers with simple recurrent layers; and the
  * dilated RNN (Chang+ 2017)
* comparison of convolutional and recurrent approaches
  * to sequence modeling, we are not aware of a thorough one
  * Yin+ (2017) for sentence-level and document-level classification

# 3. Temporal Convolutional Networks 3

* a generic architecture for convolutional sequence prediction
* distill the best practices in convolutional network design into a simple arch
* the term temporal convolutional network (TCN, Lea+ 2017)
  * not a new architecture, but a descriptive term for a family
  * causal constraint: no information “leakage” from future to past
  * map a sequence of any length to an output sequence of the same length,
    just as with an RNN
  * very long effective history sizes using a combination of very deep
    networks (augmented with residual layers) and dilated convolutions
* Our architecture is
  * informed by recent convolutional architectures for sequential data
    (van den Oord+ 2016; Kalchbrenner+ 2016; Dauphin+ 2017; Gehring+ 2017a;b)
  * design principles:
    simplicity, autoregressive prediction, and very long memory
* comparison
  * much simpler than WaveNet (van den Oord+ 2016)
    * no skip connections across layers, conditioning, context stacking, or
      gated activations
  * to the LM architecture of Dauphin+ (2017),
    TCNs do not use gating mechanisms and have much longer memory
* causal modeling does not capture MT, or sequence-to-seq prediction in general
* essentially the same architecture as the
  time delay neural network (Waibel+ 1989), with the sole tweak of zero padding
* in order to achieve a long effective history size, we need an
  extremely deep network or very large filters,
  neither of which were particularly feasible in 1989

## 3.4. Residual Connections

* A residual block (He+ 2016)
  `o = Activation(x + F(x))`
* allows layers to learn modifications to the identity mapping
  rather than the entire transformation, which has
  repeatedly been shown to benefit very deep networks

## 3.3. Dilated Convolutions

* dilated convolutions (van den Oord+ 2016) enable an
  exponentially large receptive field (Yu & Koltun, 2016)

## 3.5. Discussion

* advantages of using TCNs for sequence modeling
  * Parallelism. Unlike in RNNs..., convolutions can be done in parallel
  * Flexible receptive field size
  * Stable gradients: no exploding/vanishing gradients
    (which led to the development of LSTM, GRU, &
    Hessian-Free RNN (HF-RNN ,Martens & Sutskever, 2011)
  * Low memory requirement for training
  * Variable length inputs
* disadvantages to using TCNs
  * Data storage during evaluation
  * Potential parameter change for a transfer of domain

# 4. Sequence Modeling Tasks

* the adding problem (Hochreiter & Schmidhuber, 1997) has been used repeatedly
  as a stress test for sequence models (Le+ 2015; Arjovsky+ 2016; Zhang+ 2016)
* We used the PennTreebank (Marcus+ 1993) for characterand word-level LM
* Wikitext-103. Wikitext-103 (Merity+ 2016) is almost 110 times as large
  * about 103 million words for training, 218K words for validation, and 246K
  * designed to reward models that capture long-term dependencies?
    http://www.offconvex.org/2018/07/27/approximating-recurrent/
* LAMBADA (Paperno+ 2016)
  * 10K passages extracted from novels, with an average of 4.6 sentences as
    context, and 1 target sentence the last word of which is to be predicted
  * a person can easily guess the missing word when given the context,
    but not when given only the target sentence
    * Most of the existing models fail on LAMBADA (Paperno+ 2016; Grave+ 2017)
  * The training data for LAMBADA is 200M words. The vocabulary size is 93K

# 5 Experiments

* experiments varying the depth of the network `n` and occasionally `k`
* We use an exponential dilation `d = 2^i` for layer i in the network

## 5.1. Synopsis of Results

* on several of these tasks, the generic, canonical recurrent architectures we
  study (e.g., LSTM, GRU) are not the state-of-the-art. (See the supplement)

## 5.3. Polyphonic Music and Language Modeling

* These domains are dominated by recurrent architectures, with
  * many specialized designs developed for these tasks
  (Zhang+ 16; Ha+ 17; Krueger+ 17; Grave+ 17; Greff+ 17; Merity+ 17)

### Polyphonic music

* On Nottingham and JSB Chorales, the TCN with virtually no tuning
  * outperforms
    * the recurrent models by a considerable margin, and even outperforms
    * some enhanced RNN architectures for this task such as HF-RNN
      (Boulanger-Lewandowski+ 2012) and Diagonal RNN (Subakan & Smaragdis 2017)
  * Deep Belief Net LSTM perform better still (Vohra+ 2015);
    * likely due to the fact that the datasets are relatively small, and thus
    * the right regularization method or generative modeling procedure can
      improve performance significantly. This is largely orthogonal to the
      RNN/TCN distinction, as a similar variant of TCN may well be possible

### Word-level LM

* recent works on LSTMs for this task (Krueger+ 2017; Merity+ 2017)
* we follow standard practice that ties the weights of encoder
  and decoder layers for both TCN and RNNs (Press & Wolf, 2016), which
  significantly reduces the number of parameters in the model
* On PTB corpus, an optimized LSTM architecture (with recurrent and
  embedding dropout, etc.) outperforms the TCN
* on the larger Wikitext-103 corpus and the LAMBADA dataset (Paperno+ 16),
  TCN outperforms the LSTM results of Grave+ (2017) in perplexity
  without any hyperparameter search

### Character-level LM (PTB and text8)

* accuracy measured in bits per character
* TCN outperforms regularized LSTMs and GRUs
* Specialized architectures exist that outperform all of these, see the supplmt

## 5.4. Memory Size of TCN and RNNs

* We focus on
  1. the copy memory task, which is a stress test designed to evaluate long-
  2. the LAMBADA task, which tests both local and non-local textual understand
* We used models of size 10K for both TCN and RNNs
* TCN outperforms LSTMs and vanilla RNNs by a significant margin in perplexity
  on LAMBADA, with a substantially smaller network and virtually no tuning
* SOTA results with additional memory mechanisms (Grave+ 2017) are even better

# 6. Conclusion

* Numerous advanced schemes for regularizing and optimizing LSTMs proposed
  (Press & Wolf, 2016; Krueger+ 2017; Merity+ 2017; Campos+ 2018)
* The TCN has not yet benefitted from this concerted community-wide investment
* The preeminence enjoyed by recurrent networks in sequence modeling may be
  largely a vestige of history

# Supplementary Material

## A. Hyperparameters Settings
## B. State-of-the-Art Results
## C. Effect of Filter Size and Residual Block

* we kept the model size and depth exactly the same for different models
* tasks: copy memory, permuted MNIST (P-MNIST), and Penn Treebank word-level
* both factors (filter size and residual connections) contribute to sequence

### Filter size k

* copy memory and the P-MNIST tasks, we observed
  faster convergence and better accuracy for larger filter sizes
* LM, a smaller kernel with filter size of k = 3 works best
  * local context is especially important for PTB LM
  * the very success of n-gram models

### Residual block

* stabilized training and brought faster convergence with better final results
  * In all three scenarios that we compared here
* Especially in LM performance (See Figure 6f)

## D. Gating Mechanisms

* gated activation (van den Oord+ 2016; Dauphin+ 2017)
  * in prior work on convolutional architectures for LM
  * not used in the generic TCN model
  * We now examine this choice more closely
* Dauphin+ (2017) adopted gated linear units (GLU) in their
  non-dilated gated ConvNet
* we now compare TCNs using ReLU and TCNs with gating (GLU),
* GLU represented by an elementwise product between two convolutional layers,
  with one of them also passing through a sigmoid function σ(x)
  * twice as many convolutional layers as the ReLU-TCN
* we kept the number of model parameters at about the same size
* GLU does
  * further improve TCN accuracy on PTB LM datasets
    * agrees with prior work
  * no benefits on other tasks, such as PMM or synthetic stress tests, copy
    that require longer information retention
