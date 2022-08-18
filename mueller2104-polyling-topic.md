Fine-tuning Encoders
  for Improved Monolingual and Zero-shot Polylingual Neural Topic Modeling
Aaron Mueller, Mark Dredze
NAACL 2021

code and instructions for replicating our dataset and experimental setup

* pre-trained embeddings should be fine-tuned to a given task, it is
* hE not immediately clear what supervision should look like for an unsup task
  such as topic modeling
* we propose several methods for fine-tuning encoders to improve both
  monolingual and zero-shot polylingual neural topic modeling. We consider
  * fine-tuning on auxiliary tasks
  * constructing a new topic classification task
  * integrating the topic classification objective
    directly into topic model training
  * continued pre-training
* We find that
  * fine-tuning encoder representations on topic classification and integrating
    the topic classification task directly into topic modeling improves topic
  * fine-tuning encoder representations on any task is the most important
    factor for facilitating cross-lingual transfer. 

# 1 Intro

* Polylingual topic models (Mimno+ 2009) enable users to consider multilingual
  corpora, and to discover and align topics across languages.

* deep transformer-based language models to encode text documents for a wide
  variety of applications (Xia+ 2020)
  * when trained on multilingual corpora, they have been able to discover
    cross-lingual alignments despite the lack of explicit cross-lingual links
    (Wu and Dredze, 2019).  
  * Models such as multilingual BERT (mBERT; Devlin+ 2018) or XLM-RoBERTa
    (XLM-R; Conneau+ 2019) can produce a representation of text in a shared
    subspace across multiple input languages, suitable for both monolingual and
    multilingual settings, including zero-shot language transfer (Pires+ 2019).

* topic models have increasingly incorporated neural components. This has
  * inference networks which learn representations of the input document (Miao+
    2017; Srivastava and Sutton, 2017) that improve over using bags of words
    directly, as well as replacing bags of words with contextual
    representations. In particular, the latter allows topic models to benefit
    from pre-training on large corpora. For example,
  * contextualized topic models (CTMs, Bianchi+ 2020a) use autoencoded
    contextual sentence representations of input documents.
  * advantage of using encoders in topic models is their latent multilinguality

* Polylingual topic models (Mimno+ 2009) are lightweight in their cross-lingual
  supervision to align topics across languages, but they nonetheless
  * hE require some form of cross-lingual alignment.
* Can topic models become polylingual models by relying on multilingual
  encoders even without additional alignments?

* Bianchi+ (2020a): CTMs based on contextual sentence representations enable
  zero-shot cross-lingual topic transfer. While promising, this line of
  * hE omits a key step in using con-textualized embeddings: fine-tuning. It
  * task specific fine-tuning of pretrained embeddings, even with a small
    amount of supervised data, can significantly improve performance on many
    tasks, including in zero~ and few-shot settings (Howard and Ruder, 2018; Wu
    and Dredze, 2019). However, in the case of unsupervised topic modeling,
    from where are we to obtain task-specific supervised training data?

* we: how supervision should be bootstrapped to improve language encoders for
  monolingual and polylingual topic model learning.  We also propose a set of
  experiments to better understand why certain forms of supervision are
  effective in this unsupervised task.

* contributions include the following:
  1. We fine-tune contextualized sentence embeddings on various established
     auxiliary tasks, finding that many different tasks can be used to improve
     downstream topic quality and zeroshot topic model transfer.
  2. We construct fine-tuning supervision for sentence embeddings through a
     proposed topic classification task, showing further improved topic
     coherence. This task uses only the data on which we perform topic modeling
  3. We integrate a topic classification objective directly into the neural
     topic model architecture (without fine-tuning the embeddings) to un-
     derstand whether the embeddings or the topic classification objective is
     responsible for performance improvements
    * this approach improves topic quality but has
      little effect on cross-language topic transfer.

* We present results for both
  * monolingual topic models and
  * cross-ling topic transfer from English to French, German, Portuguese, Dutch

# 4 Experiments

## Data

* For the document classification task, we use ML- Doc (Schwenk and Li, 2018),
  a multilingual news dataset; we fine-tune on the English data. For NLI, we
