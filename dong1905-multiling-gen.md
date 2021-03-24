Unified LM Pre-training for Natural Language Understanding and Generation
Li Dong, Nan Yang, Wenhui Wang, Furu Wei, Xiaodong Liu, Yu Wang, Jianfeng Gao,
  Ming Zhou, Hsiao-Wuen Hon
NeurIPS-19 arXiv:1905.03197 [cs.CL]

[overview](https://github.com/microsoft/unilm) 
[The code and pre-trained models](https://github.com/microsoft/unilm/tree/master/unilm-v1)


# Abstract

* This paper presents a new Unified pre-trained Language Model (UniLM) that
  can be fine-tuned for both natural language understanding and generation
  * pre-trained using three types of language modeling tasks:
    unidirectional, bidirectional, and sequence-to-sequence prediction
  * unified by employing a shared Transformer network and utilizing specific
    self-attention masks to control what context the prediction conditions on
* compares favorably with BERT on the GLUE benchmark, and the SQuAD 2.0 and CoQA
* new SOTA results on five natural language generation datasets, including
  * CNN/DailyMail abstractive summarization ROUGE-L to 40.51 (2.04 absolute)
  * Gigaword abstractive summarization ROUGE-L to 35.75 (0.86 absolute improvem)
  * CoQA generative question answering F1 score to 82.5 (37.1 absolute improvem)
  * SQuAD question generation BLEU-4 to 22.12 (3.75 absolute improvement), and
  * DSTC7 document-grounded dialog response generation NIST-4 to 2.67 (human
    performance is 2.65)

# 1 Introduction

* Although BERT significantly improves the performance of many NLU tasks [9],
  its bidirectionality nature makes it difficult to be applied to NLG [44]
* we propose a new Unified pre-trained Language Model (UniLM) that
  * can be applied to both natural language understanding (NLU) and NLG tasks
* a multi-layer Transformer network, jointly pre-trained with
* three types of unsupervised language modeling objectives as shown in Table 2
  * In particular, we design a set of cloze tasks [42] with masked words
  * left-to-right unidirectional LM, the context is the words on its left
    right-to-left unidirectional LM, the context is the words on the right
    a bidirectional LM, the context consists of the words on both
  * sequence-to-sequence LM, the context of a word in the target sequence
    consists of all the words in the source sequence and
    the words on the left in the target sequence
* can be fine-tuned (with additional task-specific layers if necessary) to adapt
  * can be configured, using different self-attention masks (Section 2), to
    aggregate context for different types of language models, and thus can be
    used for both NLU and NLG tasks
* three main advantages
  * the unified pre-training procedure leads to a single Transformer LM that
    uses the shared parameters and architecture for different types of LMs
  * parameter sharing makes the learned text representations more general
  * as a sequence-to-sequence LM (Section 2.3), a natural choice for NLG,
    such as abstractive summarization and question generation
* Experimental results show that our model, used
  * as a bidirectional encoder, compares favorably with BERT
    on the GLUE benchmark and two extractive QA tasks (SQuAD 2.0 and CoQA)
  * five NLG datasets, where it is used as a sequence-to-sequence model,
    * new SOTA results on
      * CNN/DailyMail and Gigaword abstractive summarization,
      * SQuAD question generation,
      * CoQA generative question answering, and
      * DSTC7 dialog response generation

# 2 Unified Language Model Pre-training

## 2.1 Input Representation

* The input x is a word sequence, which is either a
  * text segment for unidirectional LMs or a
  * pair of segments packed together for bidirectional LM and sequence-to-sequence LM.
* We always add a special
  * start-of-sequence ([SOS]) token, end-of-sequence ([EOS]) token

## 2.5 Fine-tuning on Downstream NLU and NLG Tasks

* For NLU tasks, we fine-tune UniLM as a bidir Transformer encoder, like BERT.
* For NLG tasks, we take the sequence-to-sequence task as an example. The
  * [EOS], can also be masked during fine-tuning, thus when this happens, the
    model learns when to emit [EOS] to terminate the generation process of the
    target sequence.

# 3 Experiments 5

## 3.1 Abstractive Summarization

* We fine-tune UniLM as a sequence-to-sequence model following the procedure
  described in Section 2.5 by concatenating document (the first segment) and
  summary (the second segment) as input which is truncated to a pre-defined
  maximum length
* We use the F1 version of ROUGE [25] as the evaluation metric for both datasets
  * Table 3: UniLM against the baseline and several SOTA models on CNN/DailyMail
  * LEAD-3 is a baseline model that extracts the first three sentences
  * PGNet [37] is a sequence-to-sequence model based on the pointer-generator
  * S2S-ELMo [13] uses a seq-to-seq model augmented with pre-trained ELMo
    * termed as SRC-ELMO+SHDEMB in [13]
  * Bottom-Up [16] is a sequence-to-sequence model
    augmented with a bottom-up content selector for selecting salient phrases
  * the best reported extractive summarization result [27] on the dataset
  * our model outperforms
    * all previous abstractive systems,
      creating a new SOTA abstractive summarization result on the dataset
    * the best extractive model [27] by 0.88 point in ROUGE-L
* Table 4, we evaluate on Gigaword with different scales (10K and 3.8M)
  * Transformer [43] and OpenNMT [23] implement standard attentional seq-to-seq
  * Re3Sum [4] retrieves summaries as candidate templates, and then use an
    extended sequence-to-sequence model to generate summaries
  * MASS [39] is a pre-trained sequence-to-sequence model based on Transformer
* UniLM achieves better performance than previous work. Besides, in the
  low-resource setting (i.e., only 10,000 examples are used as training data),
  our model outperforms MASS by 7.08 point in ROUGE-L

# 4 Conclusion and Future Work

* future work
  * more epochs and larger models on web-scale text corpora. At the same time,
  * more experiments on end applications as well as ablation experiments to
    investigate the model capability and the benefits of pre-training multiple
    language modeling tasks with the same network
  * extending UniLM to support cross-lingual tasks
    (Zewen Chi+ ArXiv, abs/1909.10481)
  * multi-task fine-tuning on both NLU and NLG tasks, which is
    a natural extension of Multi-Task Deep Neural Network
    (MT-DNN, Xiaodong Liu+ CoRR, abs/1901.11504)
