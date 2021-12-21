Charformer: Fast Character Transformers via Gradient-based Subword Tokenization
Yi Tay, VQ Tran, S Ruder, J Gupta, H Won Chung, D Bahri, Z Qin, al, & D Metzler
arXiv:2106.12672 [cs.CL]

code implemented in Mesh Tensorflow [Shazeer+ 2018], and compatible with the T5
https://github.com/google-research/google-research/tree/master/charformer
* This codebase will be subsequently updated with a Jax version of Charformer

* SOTA models in NLP rely on separate rigid subword tokenization algorithms,
  * limit their generalization ability and adaptation to new settings. In this
* we propose a new model inductive bias that learns a subword tokenization
  end-to-end as part of the model. To this end, we introduce a
  * soft gradient-based subword tokenization module (GBST) that automatically
    learns latent subword representations from characters data-driven
  * enumerates candidate subword blocks and learns to score them in a
    position-wise fashion using a block scoring network.  We additionally
* we introduce Charformer, a deep Transformer model that integrates GBST and
  operates on the byte level
* extensive experiments on English GLUE, multilingual, and noisy text datasets,
  * Charformer outperforms a series of competitive byte-level baselines while
  * generally on par and sometimes outperforming subword-based models
* fast, improving the speed of both vanilla byte-level and subword-level
  Transformers by 28%-100% while maintaining competitive quality. We believe

# 1 Intro

* data-driven subword-based tokenization algorithms
  [Schuster & Nakajima 2012, Sennrich+ 2016, Wu+ 2016, Kudo & Richardson 2018]
* expert-crafted segmentation algorithms are still commonly used in languages
  without whitespaces such as Chinese, Thai, Korean [Lample and Conneau, 2019]
* without taking into account lexical or semantic similarity. As a result,
* brittle to rare words [Gong+ 2018] and perturbations, both natural and
  adversarial [Belinkov and Bisk, 2018, Pruthi+ 2019, Sun+ 2020]. In
* multilingual models: tokens in low-resource languages are split into many
  * impacts performance on those languages and deteriorates crossling transfer
    [Hu+ 2020, Wang+ 2021]. Finally, a separate tokenization algorithm leads to
* mismatch between the pre-training and downstream distribution of words
  when adapting pre-trained language models to new settings, which requires
* character-level modelling into pre-trained language models in turn results in
  severely increased computational and memory complexity
  due to an increased sequence length and generally lower performance
* prior tokenization-free methods [Clark+ 2021],
* other byte-based models [Xue+ 2021]
* we propose gradient-based subword tokenization (GBST), a new method that
  combines the compositionality of character-level representations with the
  efficiency of subword tokenization while enabling end-to-end learning
  * learns latent subword representations from characters
    using large amounts of unlabeled data. Specifically, GBST learns a
  * position-wise soft selection over candidate subword blocks by
    * scoring subwords with a scoring network.  In contrast to
  * interpretable latent subwords, which enables easy inspection of lexical
* Charformer, a Transformer encoder-decoder model that uses GBST to operate
  directly on the byte level
  * additionally a re-scaled variant of Charformer which
    * allocates additional capacity to the encoder
      to make up for the lack of discrete subword embeddings
* evaluate our model on a range of standard and non-standard English, and multi
  * English GLUE and long document classification tasks, Charformer
    * outperforms strong byte-level baselines and overall achieves performance
      on par with subword-based models such as BERT [Devlin+ 2019] and T5
  * toxicity detection in social media datasets [Borkan+ 2019, Wulczyn+ 2017],
    Charformer outperforms byte-level baselines as well as subword-based
  * multilingually pre-trained Charformer performs on par or outperforms strong
    subword-based multilingual baselines on standard cross-lingual datasets
* Charformer is more efficient compared to byte-level and subwordbased models
  with similar numbers of parameters
  * ByT5: On a comparable setup, Charformer outperforms a baseline similar to
    the recent SOTA byte-level model ByT5 [Xue+ 2021] while being 2 times more
    memory efficient and 10% to 93% faster
  * mT5
    * Charformer trains 28% faster than the subword-level mT5 model [Xue+ 2020]
    * three times less parameters and achieves
    * comparable quality on well-established benchmarks. Finally, we
* visualization that the latent subwords learned by Charformer are interpretabl
  to some extent

# 3 Experiments 5

## 3.3 Multilingual Experiments

### Results

* Charformer Tall,LongPT outperforms subword-based models on TyDiQA-GoldP
  (in-language multi-task). Additionally, in the translate-train setting C
  HARFORMER T all,LongP T is on par with subword models on XQuAD and MLQA, and
  close to parity on PAWS-X. Furthermore, Charformer outperforms other
  character-level models in the zero-shot setting. However, we observe that
  this setting still remains a challenge for token-free models in general. We
  hypothesize that model size may be a major factor here. Finally, we note that
  small character-level models generally perform poorly on PAWS-X. However, C
  HARFORMER ’s ability to freeze GBST weights during fine-tuning greatly
  improves its performance in this setting (see Table 15)

# 4 Analyses 8

## 4.1 Speed, Memory and Parameters

## 4.2 Comparing Downsampling Approaches

## 4.3 Latent Subwords

* fig 3: We visualize the scores the multilingual Charformer has learned to
  assign to subword blocks of different sizes for the string ‘on subword
  tokenization’ and to a translation of ‘subword tokenization’ into smp Chinese
* single-character subword blocks predominantly to
  vowels and whitespace in English and to the
  beginning of each character byte sequence in Chinese.  Moreover, in English
  * larger subword blocks to the beginning and end consonants of a subword
* dynamically mix between byte-level and subword-level features. Such behaviour
  could also parallel the relative importance attributed to consonants for word
  identification observed during reading in humans [Lee+ 2001, Carreiras+ 2008]

## 4.4 Ablations

# 5 Related Work

## Subword tokenization. Standard algorithms for deterministic subword

* Byte Pair Encoding [BPE; Sennrich+ 2016], Wordpiece [Wu+ 2016], and
  SentencePiece [Kudo and Richardson, 2018]. Prior work has highlighted
* issues with some of these algorithms [Bostrom and Durrett, 2020] and has
  * not cope well with variation in language [Sun+ 2020]. To make a model more
* probabilistic segmentation algorithms such as
  subword regularization [Kudo, 2018] and BPE-dropout [Provilkov+ 2020] have
  * sample different segmentations during training
* Recent methods propose to make models more robust for downstream tasks by
  * enforcing prediction consistency between deterministic and probabilistic
    segmentations [Wang+ 2021] and propose to
  * update the tokenizer based on the downstream loss under different
    segmentations [Hiraoka+ 2020, 2021]
* [He+ 2020] proposed DPE (dynamic programming encoding),
  * a segmentation-based tokenization algorithm based on dynamic programming
  * large computation costs due to reasons such as
    * multiple forward passes needed for each segmentation of an example
    * DP computation, which make them unsuitable for pre-training

## Character-level models

* For RNNs
  * pure char-level [Graves, 2013, Zhang+ 2015, Hwang and Sung, 2017] have
  * character-aware methods that
    compute a token-level representation using a CNN over characters
    [Kim+ 2016, Jozefowicz+ 2016, Peters+ 2018] due to poor performance when
    * applied to deep Transformer models [El Boukkouri+ 2020, Ma+ 2020].  These
    * still require tokenization for pre-processing and
    * cannot be directly applied to languages without whitespace separation
* learned segmentation as part of the model but did not scale very well
  [Wang+ 2017, Kawakami+ 2019]
* tokenization-free approaches such as CANINE [Clark+ 2021]
  revisit the original character-level setting
  in the context of large pre-trained language models with a
  focus on multilingual models
  * downsampling

## Multilingual models. Current multilingual models are

* generally analogues to successful monolingual Transformers [Ruder+ 2021]

## Efficient Transformers. Moving from subwords to characters may potentially

* quadratic complexity of self-attention. A
* potpourri of efficient self-attention models have been proposed [Choromanski+
  2020, Wang+ 2020, Zaheer+ 2020] to tackle this problem; see [Tay+ 2020b,a]
  for a comprehensive overview. Notably, the
* CANINE model uses local attention [Parmar+ 2018], which could also be swapped
  with another efficient Transformer variant. We note that the problem of
* models should learn locally meaningful compositions
