Matthew E. Peters, Mark Neumann, Luke Zettlemoyer, Wen-tau Yih
Dissecting Contextual Word Embeddings: Architecture and Representation
EMNLP 2018

#Abstract

* the choice of neural architecture (e.g. LSTM, CNN, or self attention)
* both end task accuracy and qualitative [intrinsic] properties
* there is a tradeoff between speed and accuracy
  * between LSTMs and the other alternatives,
    but the effect is relatively modest and all three networks work in practice
* all architectures
  * outperform word embeddings for four ... NLP tasks
  * representations ... vary with network depth,
    * exclusively morphological based at the word embedding layer through
    * local syntax based in the lower contextual layers to
    * longer range semantics such coreference at the upper layers

#Intro

* Language model pre-training has been shown to substantially improve tasks
  * question answering, coreference resolution, and semantic role labeling
    (Peters+ 2018)
  * text classification (Dai and Le, 2015; Howard and Ruder, 2018)
  * sequence tagging (Peters+ 2017)
  * sequence-to-sequence learning (Ramachandran+ 2017)
  * constituency parsing (Kitaev and Klein, 2018; Joshi+ 2018)
* relative error reductions range from 10–25%
* architectures
  * Previous work on learning contextual representations: LSTM-based biLMs, but
  * [there are] more computationally efficient networks ... for sequence modeln
    * including gated CNNs for language modeling (Dauphin+ 2017) and
    * feed forward self-attention based approaches for machine translation
      (Transformer; Vaswani+ 2017)
    * RNNs are forced to compress the entire history into a hidden state vector
  * each architecture will represent information in a different manner
  * we study whether more efficient architectures can [achieve] high quality
* what the different networks learn
  * detailed quantitative evaluation
  * a rich hierarchy of contextual information throughout the layers
  * analogous [to] deep CNNs trained for image classification
    (Zeiler and Fergus, 2014)
    * constituent structure [is] more local than coreference (Kuncoro+ 2017)
  * the word embedding layer of deep biLMs focuses exclusively on morphology
    * in contrast to traditional word vectors which encode some semantics
  * the lowest contextual layers of biLMs focus on local syntax, while the
  * upper layers can be used to induce more semantic content such as
    * within-sentence pronominal coreferent clusters
    * phrase representations useful for syntactic tasks
  * both at the word and span level

#2 Contextual word representations from biLMs

* To learn contextual word representations, we follow previous work
  1. training a biLM on a large text corpus (Sec. 2.1). Then,
  2. the internal layer activations from the biLM are transferred to downstream

##2.1 Bidirectional language models

* biLM combines a forward and backward LM to jointly maximize the log likelihud
* first produce a context-insensitive token representation or word embedding
  (with either an embedding lookup or in our case a character aware encoder)
* Then ... L layers of context-dependent representations h k,i
  using a RNN, CNN or feed forward network (see Sec. 3)
* top layer output h k,L is used to predict the next token using Softmax
* concatenate the forward and backward states to form
  L layers of contextal representations, or context vectors
* When training, we tie the weights of the word embedding layers and Softmax,
  but maintain separate weights for the contextual layers

##2.2 Character based language models

* Fully character aware models (Kim+ 2015)
* considerably more parameter efficient then word based models but
* more computationally expensive then word embedding based methods
* embeddings for a large vocabulary and only
  falling back to the full character based method for rare words
* Overall, for a large English language news benchmark,
  character aware models have slightly better perplexities then word based
  * differences tend to be small (Józefowicz+ 2016)

##2.3 Deep contextual word representations

* Peters+ (2018) introduced ELMo word representations
  * all of the layers are combined with a weighted average pooling operation

#3 Architectures for deep biLMs

##3.1 LSTM

* Among the RNN variants, LSTMs ... provide SOTA performance 
  for several benchmark LM tasks (Józefowicz+ 2016; Merity+ 2018; Melis+ 2018)
* LSTM with projection (Sak+ 2014)
  * use a large hidden state while reducing the total number of parameters
  * adopted by Peters+ (2018) for computing ELMo representations

##3.2 Transformer

* Transformer (Vaswani+ 2017)
* a feed forward self-attention based architecture [originally for MT]
* constituency parsing (Kitaev and Klein, 2018) and SRL (Tan+ 2018)
* Each identical layer in the encoder
  * multi-headed attention between a given token and all other [history] tokens
  * position wise feed forward network
* To adapt the Transformer for bidirectional language modeling, we
  * mask out future tokens for the forward language model and [vice versa]
* Concurrent with, Radford+ (2018) trained a large forward Transformer LM and
  fine tuned it for a variety of NLP tasks

##3.3 Gated CNN

* competitive results for sequence modeling
  * e.g.~sequence-to-sequence machine translation (Gehring+ 2017)
  * Dauphin+ (2017): using Gated Linear Units (GLU), 
    perplexities comparable to large LSTMs on large scale language modeling
* To adapt the Gated CNN for bidirectional language modeling, we
  * closely followed the publicly available ConvSeq2Seq implementation,
  * modified to support causal convolutions (van den Oord+ 2016) for both dirs
  * wide receptive field at the top layer

##3.4 Pre-trained biLMs

* first time that the Transformer [provides] competitive results for LM
* our goal is to compare representations [of approximately equal] perplexity
* The Transformer and CNN based models are 3--5x faster than the LSTM ones
* While the CNN and Transformer implementations are ... well optimized, the
  LSTM biLM [does not use an optimized CUDA kernel due to] the projection cell
* the faster architectures will allow training to scale to large unlabeled txt
  * improve the quality of biLM [] for syntactic tasks (Zhang and Bowman, 2018)

#4 Evaluation as word representations 4

* four benchmark NLP tasks
* we ... swapping out pre-trained GloVe vectors (Pennington+ 2014) 
  for contextualized word vectors from each biLM
  by applying the learned weighted average ELMo pooling from Peters+ (2018)
* not fine tune the LM weights
* Table 2 shows the results. Across all tasks,
  * LSTM architectures perform the best
  * All architectures improve significantly over the GloVe only baseline, with
    relative improvements of 13% – 25% for most tasks and architectures
  * gains for MultiNLI are more modest
    6% for the Gated CNN to 13% for the 4-layer LSTM

##4.1 MultiNLI

* The MultiNLI dataset (Williams+ 2018) contains
  * crowd sourced textual entailment annotations
  * five diverse domains for training + five domains for testing
* Our model is a re-implementation of the ESIM sequence model (Chen+ 2017)
  * biLSTM to encode the premise and hypothesis, then computes an
  * attention matrix followed by a local inference layer,
  * another biLSTM inference composition layer, and
  * finally a pooling operation before the output layer
  * With the 2-layer LSTM ELMo, it is SOTA for SNLI (Peters+ 2018)
  * [now] Transformer accuracies 0.2% / 0.6% (matched/mismatched) less
  * reduce the matched/mismatched performance differences [between] domains
  * 4-layer LSTM ELMo-like embeddings sets a new SOTA

##4.2 Semantic Role Labeling

* The Ontonotes 5.0 Dataset (Pradhan+ 2013) contains
* predicate argument annotations for a variety of types of text, including
  conversation logs, web data, and biblical extracts
* we use the deep biLSTM from He+ (2017) who modeled SRL as a BIO tagging task
* With ELMo representations, it is SOTA for this task (Peters+ 2018)
* LSTM based word representations perform the best, with 0.6% of the 4-layer

##4.3 Constituency parsing

* The Penn Treebank (Marcus+ 1993) contains phrase structure annotation for
  40k sentences sourced from the Wall Street Journal
* Our model is the Reconciled Span Parser (RSP; Joshi+ 2018), which,
  * using ELMo representations, achieved state of the art performance for this
* LSTM based models demonstrate the best performance with a
  0.2% and 1.0% improvement over the Transformer and CNN models, respectively
* the explicit recurrence structure modeled with the biLSTM in the RSP
  is [not] important for parsing, see Sec.~5.3

##4.4 Named entity recognition

* The CoNLL 2003 NER task (Sang and Meulder, 2003)
* 20K sentences from the Reuters RCV1 news corpus
* Our model is a re-implementation of the SOTA system in Peters+ (2018) with a
  * character based CNN word representation, two biLSTM layers and a
  * conditional random field (CRF) loss (Lafferty+ 2001). For this task, the
  * 2-layer LSTM performs the best, with
    averaged F_1 0.4% 0.8% higher then the other biLMs

#5 Properties of contextual vectors 6

* In this section, we examine the intrinsic properties of contextual vectors
  * focusing on those that are independent of the architecture details
  * how ... linguistic information
    * morphology in the word embedding layer, to
    * local syntax in the lowest contextual layers, to
    * semantic relationships such as coreference in the upper layers
* organization
  1. inter-sentence contextual similarity of words and phrases (Sec. 5.1)
  2. in contrast to traditional word vectors, the biLM word embeddings capture
     little semantic information (Sec. 5.2)
  3. [semantics] is instead represented in the contextual layers (Sec. 5.3)
  * beyond single tokens: a simple span representation based on the context
    vectors captures elements of phrasal syntax

##5.1 Contextual similarity

* Nearest neighbors using cosine similarity,
  we can apply a similar method to context vectors

###Intra-sentence similarity

* e.g. the words in the noun phrase “the new international space station” are
  clustered together
* all of the verbs (“says”, “can”, “afford”, “maintain”, “meet”) have high
  similarity suggesting the biLM is capturing partof-speech information
* coreference resolution: high contextual similarity of “it” to “government”,
* Section 5.3 provides empirical support for these observations

###Span representations

* use [the biLM’s context vectors] to form representations of spans
* we compute a span representation s(s_0, s_1),i at layer i by concatenating
  the first and last context vectors with
  the element wise product and difference of the first and last vectors
* Figure 2 shows a t-SNE (Maaten and Hinton, 2008) visualization of span reprs
  * 3,000 labeled chunks and 500 spans not labeled as chunks
    from the CoNLL 2000 chunking dataset (Sang and Buchholz, 2000),
    from the first layer of the 4-layer LSTM. As we can see, the
  * spans are clustered by chunk type confirming our intuition
* Sec. 5.3 evaluates whether we can use these span reprs for constituency pars

###Unsupervised pronominal coref

* contextual [repr] of coreferential mentions should be similar,
  as in many cases it is possible to replace them with their referent. If true,
  we should be able to use [them for] unsupervised coreference resolution
* experiment as follows
  * to rule out trivial ... similarities due to lexical overlap, we
    restricted to pronominal coreference resolution
  * took all sentences from the development set of the OntoNotes annotations in
    the CoNLL 2012 shared task (Pradhan+ 2012) that had a third-person
    personal pronoun and antecedent in the same sentence (904 sentences)
  * upper bound on performance, the [SOTA supervised] coreference model from
    Lee+ (2017) finds an antecedent span with the head word 64% of the time
  * lower bound
    * closest noun ... before the pronoun has an accuracy of 27%, and
    * first noun in the sentence has an accuracy of 35%
    * If we [restrict to antecedent nouns to match] in number, the
      accuracies increase to 41% and 47% respectively
* To use contextual representations to solve this task, we
  * compute the mean context vector of the smallest constituent with more
    then one word containing the pronoun and
    subtract it from the pronoun’s context vector. This step is
    * motivated by the above observation that
      local syntax is the dominant signal in the contextualized word vectors,
      and removing it improves the accuracies of our method. Then, we
  * choose the noun with the highest contextual similarity to the adjusted
    context vector that occurs before the pronoun and matches it in number
* Accuracies for the models peak between 52% and 57%, well above the baseline,
  with the Transformer overall having the highest accuracy
  * accuracies only drop 2-3% [if we don't filter by number agreement] and
  * highest at layers near the top of each model

##5.2 Context independent word representation 8

* word analogy task introduced in Mikolov+ (2013) are commonly used as
* we ... compare the word embedding layer from the biLMs to word vectors
* syntactic with examples such as “bird:birds :: goat:goats”, and semantic
* the word embedding layer x k from the biLMs is markedly different
  * syntactic accuracies on par or better then GloVe, but with
  * very low semantic accuracies. To further highlight this distinction, we
* purely orthographically based word vector by hashing all character `3-`-grams
  * near zero accuracy in the semantic portion, but
  * scored well on the syntactic portion

##5.3 Probing contextual information

* In this section, we quantify some of the ... observations made in Sec. 5.1
* a series of linear probes (Belinkov+ 2017) with two NLP tasks
  to test the contextual representations in each model layer for each biLM
* to what extent the span representations capture phrasal syntax
* Our results show that
  * all biLM architectures learn syntax, including span-based syntax; and
  * POS is captured at lower layers then constituent structure

###POS tagging

* Peters+ (2018) showed that the contextual vectors from the first layer of the
  2-layer LSTM plus a linear classifier was near SOTA for POS tagging
* Here, we test whether this result holds for the other architectures
* Accuracies for all of the models are high, ranging from 97.2 to 97.4, and
* similar trend with [resp to which layer is best]

###Constituency parsing

* Our linear model
  * independently predicts the constituent type for all possible spans in a
    sentence using a linear classifier
  * valid tree is built with a greedy decoding step that 
    reconciles overlapping spans with an ILP, similar to Joshi+ (2018)
* The third row in Fig. 3 shows the results
  * independent ... alone has F1 of near 80% for the best layers from each arch

##5.4 Learned layer weights

* Fig. 4 plots the softmax-normalized layer weights s / arch / task
* SRL model weights are omitted as they close to constant
  since we had to regularize them to stabilize training. For
* constituency parsing, s mirrors the layer wise linear parsing results
  * largest weights near [to] as maximum linear parsing
* For both NER and MultiNLI, the
  * Transformer focuses heavily on the word embedding layer and the first contl
* the maximum layer weights occur below the top layers as the most transferable
  * the top layers specialize for language modeling

#6 Related work 9

* McCann+ (2017) learned contextualized vectors with an NMT system (CoVe)
* biLM based representations outperformed CoVe in all considered tasks
  (Peters+ 2018)
* Liu+ (2018) proposed using densely connected RNNs and layer pruning to speed
  * applicable to other architectures, it could also be combined with our apprc
* examine the learned representations in RNNs
  * Karpathy+ (2015) trained a character LSTM language model on source code
    * individual neurons in the hidden state track the beginning and end of
      code blocks
  * number agreement in subject-verb dependencies (Linzen+ 2016)
  * Kádár+ (2017)
    * attributed the activation patters of RNNs to input tokens
    * RNN language model is strongly sensitive to tokens with synt functions
  * whether NMT systems learned morphology and POS tags (Belinkov+ 2017) 
    * linear classifiers
  * Concurrent with our work,
    * Khandelwal+ (2018) studied the role of context in influencing LM preds,
    * Gaddy+ (2018) analyzed neural constituency parsers,
    * Blevins+ (2018): whether multi-task RNNs can learn hierarchical syntax,
    * Conneau+ (2018) examined [linguistic features] in sentence
      A Conneau, G Kruszewski, G Lample, L Barrault, and M Baroni. 2018.
      What you can cram into a single vector: 
        Probing sentence embeddings for linguistic properties
      ACL 2018
* attributing network predictions to words in the input sentence
  * Li+ (2016) examined the impact of erasing portions of a network
  * Sundararajan+ (2017) used a gradient based method
  * Murdoch+ (2018) decomposed LSTMs to interpret classification predictions

#7 Conclusions and future work

* future work
  * scaling up model size or data size?
    * As ...  computationally efficient architectures also learn high quality
  * Infusing models with explicit syntactic structure or other linguistically
    motivated inductive biases ... in a multitask or semisupervised manner
  * computer vision style feature re-use and transfer
