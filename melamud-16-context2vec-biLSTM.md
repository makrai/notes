context2vec: Learning Generic Context Embedding with Bidirectional LSTM
Oren Melamud, Jacob Goldberger, Ido Dagan
CoNLL 2016

# 1 Intro

* The context representations used in such tasks are commonly just a simple
  * collection of the individual embeddings of the neighboring words in a
    window around the target word, or a
  * (sometimes weighted) average of these embeddings. We note that such
  * no mech for optimizing the repr of the entire sentential context as a whole
* In supervised settings, various NLP systems use labeled data to learn how to
  consider context word representations in a more optimized task-specific way
  This was done in tasks, such as chunking, NER, semantic role labeling, and
  co-reference resolution (Turian+ 2010; Collobert+ 2011; Melamud+ 2016),
  mostly by considering the embeddings of words in a window around the target
  * bidirectional recurrent neural networks, and specifically
  * bidirectional LSTMs, were used in such tasks to learn internal
    representations of wider sentential contexts
    (Zhou and Xu, 2015; Lample+ 2016)

* using word embeddings that were pre-trained on large corpora, improves
  performance significantly

Yet, pre-trained word embeddings carry limited information regarding the
inter-dependencies between target words and their sentential context as a
whole. To model this (and more), the supervised systems still need to rely
heavily on their albeit limited supervised data

* we present context2vec, an unsupervised model and toolkit for
  * efficiently learning generic context embedding of wide sentential contexts,
    using bidirectional LSTM. Essentially, we use large plain text corpora to
* pre-train a neural model that
  embeds entire sentential contexts and target words in the same low-dim space,
  * optimized to reflect inter-dependencies between targets and their entire
    sentential context as a whole. To demonstrate their high quality, we show
* with a very simple application of our context representations, we are able to
  surpass or nearly reach SOTA results on
  sentence completion, lexical substitution and word sense disambiguation
  * substantially outperforming the common average-of-word-embeddings
    representation (denoted AWE). We further hypothesize that
* both unsupervised and semi-supervised systems may benefit from using our
  pre-trained models,
  instead or in addition to individual pre-trained word embeddings
