Language Modeling with Deep Transformers
Kazuki Irie, Albert Zeyer, Ralf Schlüter, Hermann Ney
Interspeech 2019

* We explore deep autoregressive Transformer models in language modeling for
  speech recognition. We focus on two aspects
  * we revisit Transformer model configurations specifically for LM
    * We show that well configured Transformer models outperform our baseline
      models based on the shallow stack of LSTM recurrent neural network
      layers
    * experiments on the open-source LibriSpeech 960hr task, for both 200K
      vocabulary word-level and 10K byte-pair encoding subword-level language
      modeling
    * We apply our word-level models to conventional hybrid speech recognition
      by lattice rescoring, and the subword-level models to attention based
      encoder-decoder models by shallow fusion
  * Second, we show that
    deep Transformer language models do not require positional encoding
    * The positional encoding is an essential augmentation for the
      self-attention mechanism which is invariant to sequence ordering.
    * hE, in autoregressive setup, as is the case for language modeling, the
      amount of information increases along the position dimension, which is a
      positional signal by its own
    * The analysis of attention weights shows that
      deep autoregressive self-attention models can automatically make use of
      such positional information
    * removing the positional encoding even slightly improves the performance
