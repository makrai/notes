MAD-X: An Adapter-Based Framework for Multi-Task Cross-Lingual Transfer 
Jonas Pfeiffer, Ivan Vulić, Iryna Gurevych, Sebastian Ruder
EMNLP 2020

code and adapters: AdapterHub.ml

# Abstract

* pre-trained multilingual models such as multilingual BERT and XLM-R 
  * main goal is enabling and bootstrapping NLP applications in low-resource
    languages through zero-shot or few-shot cross-lingual transfer.  However,
  * hE limited model capacity, their transfer performance is the weakest
    exactly on such low-resource languages and languages unseen during pre-trai
* propose 
  * MAD-X, an adapter-based framework that enables high portability and
    parameter-efficient transfer to arbitrary tasks and languages by learning
    * modular language and task representations. In addition, we introduce a
  * invertible adapter architecture and
  * a strong baseline method for adapting a pre-trained multilingual model to a
    new language
* exper
  * outperforms the SOTA in cross lingual transfer across
    a representative set of typologically diverse languages on
    named entity recognition and causal commonsense reasoning, and achieves
  * competitive results on question answering

# 1 Intro

* deep pretrained multilingual models (Devlin+ 2019; Conneau and Lample, 2019)
  * SOTA results on cross-lingual transfer, but not represent all languages.
  * Evidence for this is the importance of the vocabulary size (Artetxe+ 2020)
  * curse of multilinguality (Conneau+ 2020)
    * a trade-off between language coverage and model capacity. Scaling up a
  * an issue even for high-resource languages where
    SOTA multilingual models underperform their monolingual variants
    (Eisenschlos+ 2019; Virtanen+ 2019; Nozza+ 2020), and
  * performance decreases further with lower-resource languages covered by the
  * issue arguably most severe for languages that were not included in the
    training data at all (Ponti+ 2020b)

In this paper, we propose Multiple ADapters for Cross-lingual transfer (MAD-X),
a modular framework that leverages a small number of extra parameters to
address the fundamental capacity issue that limits pretrained multilingual
models.

Using a SOTA multilingual model as the foundation, we adapt the model to
arbitrary tasks and languages by learning modular languageand task-specific
representations via adapters (Rebuffi+ 2017; Houlsby+ 2019), small bottleneck
layers inserted between a model’s weights.

In particular, using a recent efficient adapter variant (Pfeiffer+ 2020a;
Rücklé+ 2020), we train 1) language-specific adapter modules via masked
language modelling (MLM) on unlabelled target language data, and 2)
task-specific adapter modules via optimising a target task on labelled data in
any source language. Task and language adapters are stacked as in Figure 1,
allowing us to adapt the pretrained multilingual model also to languages that
are not covered in the model’s (pre)training data by substituting the target
language adapter at inference.

In order to deal with a mismatch between the shared multilingual vocabulary and
target language vocabulary, we propose invertible adapters, a new type of
adapter that is well suited to performing

MLM in another language. Our framework goes beyond prior work on using adapters
for crosslingual transfer (Bapna and Firat, 2019; Artetxe+ 2020) by enabling
adaptation to languages unseen during pretraining and without learning
expensive language-specific token-level embeddings.

We compare MAD-X against SOTA WikiANN NER dataset (Pan+ 2017; Rahimi+ 2019) and
the XCOPA dataset (Ponti+ 2020a) for causal commonsense reasoning, relying on a
representative set of typologically diverse languages which includes
high-resource, lowresource, as well as languages unseen by the pre- trained
model. MAD-X outperforms the baselines on seen and unseen high-resource and
low-resource languages. On the high-resource languages of the challenging XQuAD
QA dataset (Artetxe+ 2020), our framework achieves competitive perfor- mance
while being more parameter-efficient.

Another contribution of our work is a simple method of adapting a pretrained
multilingual model to a new language, which outperforms the standard setting of
transferring a model only from labelled source language data.

In sum, our contributions are as follows. 1) We propose MAD-X, a modular
framework that mitigates the curse of multilinguality and adapts a mul-
tilingual model to arbitrary tasks and languages.

Both code and adapter weights are integrated into the AdapterHub.ml repository
(Pfeiffer+ 2020b). 1 2) We propose invertible adapters, a new adapter variant
for cross-lingual MLM. 3) We demonstrate strong performance and robustness of
MAD-X across diverse languages and tasks.  4) We propose a simple and more
effective baseline method for adapting a pretrained multilingual model to
target languages. 5) We shed light on the behaviour of current methods on
languages that are unseen during multilingual pretraining.
