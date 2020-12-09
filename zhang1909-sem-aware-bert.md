Semantics-aware BERT for Language Understanding
Zhuosheng Zhang, Yuwei Wu, Hai Zhao, Zuchao Li, Shuailiang Zhang, Xi Zhou, 
  Xiang Zhou
AAAI-2020 arXiv:1909.02209v3 [cs.CL]

* incorporating structured semantic information can provide rich semantics
  for language representation
* we 
  * propose to incorporate explicit contextual semantics 
    * from pre-trained semantic role labeling, and 
  * introduce an improved language representation model, 
    Semantics-aware BERT (SemBERT), which is capable of 
    * explicitly absorbing contextual semantics over a BERT backbone. SemBERT
    keeps the light fine-tuning without substantial task-specific modifications.
* SOTA or substantially improved results on ten reading comprehension and NLI ts

# 1 Intro

* deep contextual language model (LM) achieving SOTA results in NLU tasks. Some
  * Embedding from Language models (ELMo, Peters+ 2018)
  * Generative Pre-trained Transformer (OpenAI GPT, Radford+ 2018)
  * Bidirectional Encoder Representations from Transformers (BERT, Devlin+ 2018) and
  * Generalized Autoregressive Pretraining (XLNet, Yang+ 2019). Providing
* incorporating extra knowledge to pre-trained language models (Zhang+ 2020b).  
* deep learning models might not really understand texts (Mudrakarta+ 2018)
  * vulnerably suffer from adversarial attacks (Jia and Liang 2017). Through
  * great attention to non-significant words and ignore important ones. For
  * question answering challenge (Rajpurkar+ 2016), we observe a number of
    answers produced by previous models are semantically incomplete (As shown in
    Section 6.3), which suggests that the current NLU models suffer from
* semantic role labeling (SRL) naturally matches e.g. question answering tasks,
  * who did what to whom, when and why with respect to the central meaning 
  * questions are usually formed with who, what, how, when and why 
* SemBERT consists of three components:
  * an out-of-shelf semantic role labeler
  * an sequence encoder where a pre-trained language model is used
    * semantic role labels are mapped to embedding in parallel;
  * a semantic integration component to integrate the text representation with
    the contextual explicit semantic embedding
* evaluated on 11 benchmark datasets involving natural language inference,
  question answering, semantic similarity and text classification. SemBERT
  obtains new SOTA on SNLI and also obtains significant gains on the GLUE
  benchmark and SQuAD 2.0. 
* Ablation studies
