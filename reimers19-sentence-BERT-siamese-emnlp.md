Nils Reimers, Iryna Gurevych
Sentence-BERT: Sentence Embeddings using Siamese BERT-Networks
EMNLP 2019

# Abstract

* BERT (Devlin+ 2018) and RoBERTa (Liu+ 2019) has set a new SOTA performance
  on sentence-pair regression tasks like semantic textual similarity (STS)
  * requires that both sentences are fed into the network, which causes a
    massive computational overhead: Finding the most similar pair in a
  * unsuitable for semantic similarity search as well as for ... clustering
* we present Sentence-BERT (SBERT), a modification of the pretrained BERT
  * use siamese and triplet network structures to derive semantically
  * sentence embeddings that can be compared using cosine-similarity
  * time complexity [of] finding the most similar pair
    from 65 hours with BERT / RoBERTa to about 5 seconds with SBERT, while
  * evaluate SBERT and SRoBERTa on common STS tasks and transfer learning
    * outperforms other SOTA sentence embeddings methods

# 1 Intro

* BERT uses a cross-encoder: Two sentences are passed to the transformer
  network and the target value is predicted
* derive fixed-size sentence embeddings
  * average the BERT output layer (known as BERT embeddings) or by using the
  * first token (the [CLS] token)
  * often worse than averaging GloVe embeddings (Pennington+ 2014)
* similarity measure like cosine-similarity or Manhatten / Euclidean distance,
* We fine-tune SBERT on NLI data, which creates sentence embeddings that
  significantly outperform other SOTA sentence embedding methods
  like InferSent (Conneau+ 2017) and Universal Sentence Encoder (Cer+ 2018)
  * On seven Semantic Textual Similarity (STS) tasks
  * SentEval (Conneau and Kiela, 2018), an evaluation toolkit for sentence
* SBERT can be adapted to a specific task
  * new SOTA on a
  * argument similarity dataset (Misra+ 2016) and
  * distinguish sentences from different sections of a Wikipedia article
    (Dor+ 2018)

# 2 Related work

BERT, then, we discuss stateof-the-art sentence embedding methods

* BERT (Devlin+ 2018) is a pre-trained transformer network (Vaswani+ 2017), which
set for various NLP tasks new SOTA results, including question
answering, sentence classification, and sentence-pair regression. The
  * input for BERT for sentence-pair regression consists of the two sentences,
    separated by a special [SEP] token. Multi-head attention over 12
    (base-model) or 24 layers (large-model) is applied and the
  * output is passed to a simple regression function to derive the final label
  * new SOTA on the Semantic Textual Semilarity (STS) benchmark (Cer+ 2017)
* RoBERTa (Liu+ 2019) showed, that the performance of BERT can further improved
  by small adaptations to the pre-training process. We also tested
* XLNet (Yang+ 2019) led in general to worse results than BERT [in these tasks]
* derive sentence embeddings from BERT. To bypass this limitations, researchers
  * averaging the outputs (similar to average word embeddings) or by using the
  * CLS token
    * (for example: May+ (2019); Zhang+ (2019); Qiao+ (2019))
  * These two options are also provided by the popular bert-as-a-service
  * so far no evaluation if these methods lead to useful sentence embeddings
* Sentence embeddings are a well studied area with dozens of proposed methods
  * Skip-Thought (Kiros+ 2015) trains an encoder-decoder architecture to
    predict the surrounding sentences
  * InferSent (Conneau+ 2017)
    uses labeled data of the Stanford Natural Language Inference dataset
    (Bowman+ 2015) and the Multi-Genre NLI dataset (Williams+ 2018) to train a
    siamese BiLSTM network with max-pooling over the output
    * consistently outperforms unsupervised methods like SkipThought
  * Universal Sentence Encoder (Cer+ 2018) trains a transformer network and
    augments unsupervised learning with training on SNLI
  * the task on which sentence embeddings are trained significantly impacts
    their quality (Hill+ 2016). Previous work  found
  * the SNLI datasets are suitable for training sentence embeddings
    (Conneau+ 2017; Cer+ 2018)
  * Yang+ (2018) ... train on conversations from Reddit
    using siamese DAN and siamese transformer networks, which yielded
    good results on the STS benchmark dataset
  * Humeau+ (2019) addresses the run-time overhead of the cross-encoder from
    BERT and present a method (poly-encoders) to compute a score between m
    context vectors and precomputed candidate embeddings using attention
    * the score function is not symmetric and the
    * computational overhead is too large for use-cases like clustering, which
* we use the pre-trained BERT and RoBERTa network and only fine-tune it to
  * less than 20 minutes, while yielding better results than comparable methods

# 3 SBERT,

# 4 evaluates on common STS tasks and Argument Facet Similarity (AFS) corpus

# 5 evaluates SBERT on SentEval

# 6 ablation study to test some design aspect of SBERT

# 7 computational efficiency

in contrast to other SOTA sentence embedding methods
