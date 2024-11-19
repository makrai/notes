in Speech and Language Processing. Daniel Jurafsky & James H. Martin
Draft of January 12, 2022

# 9 Deep Learning Architectures for Sequence Processing

* Language is an inherently temporal phenomenon
  * Spoken language is a sequence of acoustic events over time,
  * reflected in the metaphors we use; we talk of the flow of conversations,
    news feeds, and twitter streams, all of which emphasize that lang is a seque
  * in some/other of the algorithms we use to process language
    * eg Viterbi algorithm applied to HMM part-of-speech tagging,
      * proceeds through the input a word at a time, carrying forward
        information gleaned along the way
    * other ML approaches, assume simultan access to all aspects of the input
      eg those we’ve studied for sentiment analysis or other text classif tasks
  * The feedforward networks of Chapter 7 also assumed simultaneous access
    * had a simple model for time
    * we applied feedforward networks to language modeling by having them look
      only at a fixed-size window of words, and then sliding this window
      * independent predictions along the way
      * Fig. 9.1, reproduced from Chapter 7, shows a
        neural language model with window size 3 predicting what word follows
      * At each time step t the network converts N context words, each to a
        d-dimensional embedding, and
        * concatenates the N embeddings together to get the Nd × 1 unit input
      * The output of the network is a probability distribution over the vocab
        representing the model’s belief with respect to each word being the next
    * By using embeddings as inputs, it does solve the main problem of n-gram
      * generalize across contexts of similar words
      * hE still share another weakness of n-gram approaches: limited context
    * many language tasks require access to info that can be arbitrarily distant
    * windows makes it difficult for networks to learn systematic patterns
      arising from phenomena like constituency and compositionality
    * the phrase _all the_ appears in one window in eg the second and third pos,
      and in the next window in the first and second positions, forcing the
      network to learn two separate patterns for what should be the same item
* This chapter introduces two important deep learning architectures
  * recurrent neural networks and transformer networks
  * Both have mechanisms to deal directly with the sequential nature of language
    * capture and exploit the temporal nature of language
  * recurrent network offers a new way to represent the prior context,
    allowing the model’s decision to depend on information from hundreds of
    words in the past
  * transformer offers
    self-attention and positional encodings
    that help represent time and
    help focus on how words relate to each other over long distances
  * We’ll see how to apply both models to the task of
    * language modeling, to
    * sequence modeling tasks like part-of-speech tagging, and to
    * text classification tasks like sentiment analysis

## 9.1 Language Models Revisited

* In this chapter, we’ll begin exploring the RNN and transformer architectures
  through the lens of probabilistic language models, so let’s briefly remind
  * probabilistic language models predict the next word in a sequence
  * eg P(fish|Thanks for all the)
  * such a conditional probabilities a distribution over the entire vocabulary
  * assign probabilities to entire sequences with the chain rule: P(w 1:n ) = n
  * evaluate language models by examining how well they predict unseen text
    * good models are those that assign higher probabilities to unseen data (are
    * perplexity is the inverse probability that θ assigns to the test set,
      normalized by the test set length

## 9.2 Recurrent Neural Networks

## 9.3 RNNs as Language Models

## 9.4 RNNs for other NLP tasks

## 9.5 Stacked and Bidirectional RNN architectures

## 9.6 The LSTM

* LSTMs accomplish this by first adding an explicit context layer to the
  architecture (in addition to the usual recurrent hidden layer), and through
  the use of
  specialized neural units that make use of gates to control the flow of
  information into and out of the units that comprise the network layers
  * implemented through the use of additional weights that operate
    sequentially on the input, and previous hidden layer, and previous context
    layers

### 9.6.1 Gated Units, Layers and Networks

## 9.7 Self-Attention Networks: Transformers

* / sqrt(d_k)
  * The result of a dot product can be an arbitrarily large (positive or neg)
  * Exponentiating such large values can lead to numerical issues
    and to an effective loss of gradients during training. To avoid this, the
  => dot product needs to be scaled in a suitable fashion. A scaled dot-product
    * divide the result of the dot product by a factor related to the size of
      the embeddings before passing them through the softmax
      * eg by the square root of the dimensionality of the query and key vectors
        Eq. 9.37:

### 9.7.1 Transformer Blocks

### 9.7.2 Multihead Attention

### 9.7.3 Modeling word order: positional embeddings

## 9.8 Transformers as Language Models

### 9.9.1 Applying Transformers to other NLP tasks

## 9.9 Contextual Generation and Summarization

## 9.10 Summary

* recurrent neural networks and transformers
  * how they can be applied to language problems. Here’s a summary of the main
* In simple Recurrent Neural Networks
  sequences are processed one element at a time, with the
  output of each neural unit at time t based both on the current input at t and
  the hidden layer from time t − 1
* RNNs can be trained with a straightforward extension of the backpropagation
  * known as backpropagation through time (BPTT)
* Simple recurrent networks fail on long inputs because of problems like
  * vanishing gradients; instead modern systems use more complex
    gated architectures such as LSTMs that
    explicitly decide what to remember and forget in their hidden and context
    layers
* Transformers are non-recurrent networks based on self-attention
  * self-attention layer maps input sequences
    to output sequences of the same length, using
    attention heads that model how the surrounding words are relevant for the
    processing of the current word
* A transformer block consists of
  a single attention layer followed by
  a feed-forward layer with residual connections and
  layer normalizations following each
  * can be stacked to make deeper and more powerful networks
* Common language-based applications for RNNs and transformers include:
  * Probabilistic language modeling: assigning a probability to a sequence, or
    to the next element of a sequence given the preceding words
  * Auto-regressive generation using a trained language model
  * Sequence labeling like part-of-speech tagging, where
    each element of a sequence is assigned a label
  * Sequence classification, where an entire text is assigned to a category
    * spam detection, sentiment analysis or topic classification

# Bibliographical and Historical Notes

* The transformer (Vaswani+ 2017) was developed drawing on two lines:
  self-attention and memory networks
* Encoder-decoder attention
  * ie the idea of using a soft weighting over the encodings of input words to
    inform a generative decoder (see Chapter 13) was developed by
    * Graves (2013) in the context of handwriting generation, and
    * Bahdanau+ (2015) for MT. This idea was
  * extended to self-attention
    by dropping the need for separate encoding and decoding sequences and
    * instead seeing attention as a way of weighting the tokens in collecting
      information passed from lower layers to higher layers
    (Ling et al., 2015; Cheng+ 2016; Liu+ 2016)
* the terminology of key, query, and value, came from memory networks (MN)
  * MN: a mechanism for adding an external read-write memory to networks, by
    using an embedding of a query to match keys representing content in an
    associative memory (Sukhbaatar+ 2015; Weston+ 2015; Graves+ 2014)
* MORE HISTORY TBD IN NEXT DRAFT
