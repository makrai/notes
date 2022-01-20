in Speech and Language Processing. Daniel Jurafsky & James H. Martin.
Draft of January 12, 2022.

# 9 Deep Learning Architectures for Sequence Processing

* Language is an inherently temporal phenomenon.
  * Spoken language is a sequence of acoustic events over time, and we
  * reflected in the metaphors we use; we talk of the flow of conversations,
    news feeds, and twitter streams, all of which emphasize that lang is a seque
  * in some/other of the algorithms we use to process language. For example,
    * eg Viterbi algorithm applied to HMM part-of-speech tagging,
      * proceeds through the input a word at a time, carrying forward
        information gleaned along the way. Yet
    * other ML approaches, assume simultan access to all aspects of the input
      eg those we’ve studied for sentiment analysis or other text classification
  * The feedforward networks of Chapter 7 also assumed simultaneous access, al-
    * had a simple model for time
    * we applied feedforward networks to language modeling by having them look
      only at a fixed-size window of words, and then sliding this window over
      * independent predictions along the way
      * Fig. 9.1, reproduced from Chapter 7, shows a
        neural language model with window size 3 predicting what word follows
      * At each time step t the network converts N context words, each to a
      d-dimensional embedding, and
      concatenates the N embeddings together to get the Nd × 1 unit input vector
      x for the network
      The output of the network is a probability distribution over the vocab
      representing the model’s belief with respect to each word being the next
    * By using embeddings as inputs, it does solve the main problem of n-gram
      * generalize across contexts of similar words)
      * hE still share another weakness of n-gram approaches: limited context.
    * many language tasks require access to info that can be arbitrarily distant
    * windows makes it difficult for networks to learn systematic patterns
      arising from phenomena like constituency and compositionality: the way the
    * the phrase all the appears in one window in eg the second and third pos,
      and in the next window in the first and second positions, forcing the
      network to learn two separate patterns for what should be the same item.
* This chapter introduces two important deep learning architectures designed to
  * recurrent neural networks and transformer networks.
  * Both have mechanisms to deal directly with the sequential nature of language
    * capture and exploit the temporal nature of language.  The
  * recurrent network offers a new way to represent the prior context,
    allowing the model’s decision to depend on information from hundreds of
    words in the past
  * The transformer offers
    self-attention and positional encodings
    that help represent time and help focus on how words relate to each other
    over long distances
  * We’ll see how to apply both models to the task of
    * language modeling, to
    * sequence modeling tasks like part-of-speech tagging, and to
    * text classification tasks like sentiment analysis.

## 9.1 Language Models Revisited

## 9.2 Recurrent Neural Networks

## 9.3 RNNs as Language Models

## 9.4 RNNs for other NLP tasks

## 9.5 Stacked and Bidirectional RNN architectures

## 9.6 The LSTM

### 9.6.1 Gated Units, Layers and Networks

## 9.7 Self-Attention Networks: Transformers

### 9.7.1 Transformer Blocks

### 9.7.2 Multihead Attention

### 9.7.3 Modeling word order: positional embeddings

## 9.8 Transformers as Language Models

### 9.9.1 Applying Transformers to other NLP tasks

## 9.9 Contextual Generation and Summarization
