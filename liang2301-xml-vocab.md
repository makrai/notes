XLM-V: Overcoming the Vocabulary Bottleneck in Multilingual Masked LMs
Davis Liang, Hila Gonen, Yuning Mao, Rui Hou, Naman Goyal,
  Marjan Ghazvininejad, Luke Zettlemoyer, Madian Khabsa
EMNLP 2023 arXiv:2301.10472 [cs.CL]

# Abstract

* Large multilingual LMs: typically a single vocabulary for 100+ languages. As
  * these models have increased in parameter count and depth,
  * vocabulary size has remained largely unchanged: vocabulary bottleneck
* we introduce a new approach for scaling to very large multiling vocabularies
  * de-emphasizing token sharing between languages with little lexical overlap
  * assigning vocabulary capacity to achieve sufficient coverage for each lang
  * our Tokenizations are typically more semantical and shorter than XLM-R
    * reduces average sequence length, and serves as
* we train XLM-V, a multilingual language model with a one million token vocab
  * outperforms XLM-R on every task we tested on
    * natural language inference (XNLI), question answering (MLQA, XQuAD,
      TyDiQA), to named entity recognition (WikiAnn).  XLM-V is
  * particularly effective on low-resource language tasks and
  * outperforms XLM-R by 11.2% and 5.8% absolute
    on MasakhaNER and Americas NLI, respectively

# 2 Background

* multilingual language models have increased in parameter count and depth over
  time, vocabulary size has largely remained unchanged:
  * mBART (680M parameters; Liu+ 2020)
  * XGLM (7.5B parameters, Lin+ 2021)
  * XLM-R XXL (10.7B parameters; Goyal+ 2021)
  * mT5 XXL (13B parameters; Xue+ 2020); and
  * BLOOM (176B parameters; Scao+ 2022)
* all share the same 250K token vocabulary size as XLM-R base (Conneau+ 2019),
  a 250M parameter model
* For models like mT5 and XLM-R, this 250K vocabulary is shared across 100+
  * Discounting shared tokens, this results in an average of 2,500 unique
    tokens per language, calling into question the vocabulary’s ability to
* eg Chinese
  * 8,105 characters in the Table of General Standard Chinese
  * over 100,000 unique characters in total; the number of
  * commonly used Chinese words (consisting of multiple characters) is even
* vocabulary bottleneck hinders the performance of multilingual models on
  question answering and sequence labeling where in-depth token-level and
  sequence-level understanding is essential (Wang+ 2019)
* we construct a large multilingual vocabulary with 2 principles: (1)
  * vocabularies can be improved by de-emphasizing token sharing between
    languages with little lexical overlap and (2)
  * proper vocabulary capacity allocation for individual languages is crucial
    for ensuring that diverse languages are well-represented
* favorable characteristics including the ability to
  * frequently output semantically meaningful tokenizations while
  * reducing over-tokenization for lowresource languages. Finally,
* we present XLM-V, the first multilingual language model with a 1M token vocab
  trained on 2.5TB of data from Common Crawl (Conneau+ 2019)
* contributions are as follows:
  

## Clustering

* Chung+ (2020) proposed an approach to multi-lingual vocabulary construction
  * balances the trade-off between optimizing for cross-lingual sub-word
    sharing and the need for robust representation of individual languages
* several steps
  * First, the authors train individual sentencepiece models for each lang
  * Then, they create the shared lexicon V L by taking the union
  * Next, for each language l, they construct a binary vector v l of dimension
    |V L | which represents the lexicon of l. Each component of v l corresponds
    to a subword in V L . In other words, the binary vector v l contains a 1
    corresponding to each subword present in the vocabulary of l. An
    illustration of this step is shown in Figure 1. Then, the authors
  * cluster the binary vectors to group lexically similar languages together
  * construct a vocabulary for each cluster and combine the per-cluster
    vocabularies together to form a unified multilingual vocabulary

## 2.3 Vocabulary allocation

* Zheng+ (2021) proposed the average log probability (ALP) to evaluate the
  ability of a vocabulary to represent a particular language. Specifically,
  * where skj is the k-th subword of the sentence sj and
    `p_uni (·)` is the unigram distribution counted on the monolingual corpus
* ALP is highly correlated with downstream task performance and then
* greedy algorithm to determine the desired vocabulary capacity for individual
  languages in the multilingual vocabulary

# 3 Method for constructing large multilingual vocabularies.  Specifically,

* we improve upon the language clustering algorithm from Chung+ (2020) by
  * better vector representations for individual languages and
  * we leverage Zheng+ (2021) to improve the vocabulary capacity assignments
    for each cluster

### 3.1.2 Constructing lexical fingerprints

* We then construct a vector representation of each language using the
  vocabularies of each language as shown in Figure 1
* Unlike Chung+ (2020), where a language is represented by a binary vector
  containing a 1 corresponding to each subword present in the vocabulary of
* we instead use the negative log probability that each token appears in the
  respective language’s monolingual corpus
  * the lexical fingerprint of a language

# 5 Results

* XLM-V outperforms
  * comparable baselines that have the same vocabulary size on XNLI
  * XLM-R on every multilingual language understanding task we tested on
    (including XNLI, WikiAnn, MLQA, XQuAD, and TyDiQA) by an average of 3.5
* performs especially well on low-resource evaluation datasets
  like AmericasNLI and MasakhaNER, outperforming XLM-R
  by 5.8% absolute accuracy and 11.2% absolute F1, respectively

## 5.1 Comparisons using partial training

# 6 Examples and quantitative analysis to compare our new vocabulary to baselns


## The Zipf ceiling

* expanding the vocabulary beyond 1M tokens can degrade downstream performance
* We explored training models with vocabulary sizes greater than 1M tokens but
  * hE comparatively worse performance on downstream tasks
* fig 3 visualizes the diminishing utility of increasing the vocabulary size in
  * vocabularies with 500K, 1M, 1.5M, and 2M tokens using our methodology
  * tokenize the FLoRes-200 dataset.  For vocabulary sizes of 500K, 1M, and 2M,
  * 99% of the content is covered by just 140,337, 197,817, and 243,832 unique
    tokens, respectively
* We hypothesize that since the Unigram LM (Kudo and Richardson, 2018)
  algorithm used to construct the vocabulary iteratively prunes a large initial
  set, as discussed in Section 2, further expanding the vocabulary is
  equivalent to inheriting tokens from the long tail of a Zipfian distribution
  * These token embeddings are trained on significantly less data during the
* example of this is shown in Figure 2 where our model with a 1M token vocab
  outperforms its 1.5M token counterpart trained using an equiv amount of data

## 6.2 Qualitative improvements in tokenization

* Table 5 shows a few tokenized examples from Chinese (zh), English (en),
  French (fr), Spanish (es), and German (de)
* For languages in the same cluster (en, fr, es), our method can separate
  shared roots (eg narco) from the same word in different languages. Notably,
* surprising ability to segment Chinese out-of-the-box, parsing out individual
  * eg 剑 桥 大 学 本 科 生 和 研 究 生, translated as
  Cambridge University undergraduates and postgraduates
  * the output of the XLM-V tokenizer is 剑桥大学(Cambridge University),
    本科生(undergraduates), 和(and), and 研究生(postgraduates)

## 6.3 Over-tokenization

* Representing input data with fewer tokens can
  * speed up inference, longer context, and over-tokenization for low-resource
    (Rust+ 2020)
* Table 6 shows the average number of resulting tokens (post-tokenization) for
  several languages in FLoRes-200.  On average, the
* XLM-V tokenizer returns fewer tokens for high and medium resource languages
  while Chung+ (2020) returns the fewest tokens for low-resource languages
* XLM-V returns 11.5% fewer tokens compared to the baseline XLM-R tokenizer,
  * input sequences are on average 11.5% shorter

## 6.4 Speed vs. size

* For XLM-R, which has a vocabulary size of 250K tokens, the vocabulary
  embedding matrix contains 77% of the model’s trainable parameters
* For XLMV, the 1M token vocabulary accounts for 93% of trainable parameters
* While scaling the vocabulary can markedly increase the number of trainable
  * an efficient form of conditional compute (Bengio+ 2015):
    only a small fraction of the embedding matrix is used for any given input
* fig 4: the relationship between the vocabulary size and training speed in
* By increasing the vocabulary from 250K to 1M tokens, we can increase the
  number of trainable parameters by 3.3x with just a +25% training time

# 8 Conclusion

* 1M token vocabulary. We showed that our model outperforms XLM-R, has outsized
* future, we would like to
  * further investigate the Zipf ceiling discussed in Section 6
    by increasing the vocabulary beyond 2M tokens while also using more data
  * larger multilingual vocabularies for autoregressive language models
  * different clustering methods such as hierarchical clustering

# [9] Limitations

* it can result in increased pre-training times due to the computational
  complexity of the softmax over the entire vocabulary. We believe these
  * can be solved by adopting approximation techniques like adaptive softmax
    (Joulin+ 2017) and adaptive inputs (Baevski and Auli, 2018).  Additionally,
* it can also significantly increase the memory footprint of a model. However,
  * less of a problem with larger models, where the number of non-embedding
    parameters vastly outweigh the size of the vocabulary embedding matrix
