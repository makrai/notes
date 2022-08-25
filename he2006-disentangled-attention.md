DeBERTa: Decoding-enhanced BERT with Disentangled Attention
Pengcheng He, Xiaodong Liu, Jianfeng Gao, Weizhu Chen
arXiv:2006.03654 [cs.CL]

# Abstract

* model architecture DeBERTa: Decoding-enh BERT with dis-entangled attention
  * disentangled attention: each word is represented using two vectors that
    encode its content and position, respectively, and
    the attention weights among words are computed using disentangled matrices
    on their contents and relative positions
  * enhanced mask decoder is used to incorporate absolute positions in the
    decoding layer to predict the masked tokens in model pre-training
* significantly improve the
  * efficiency of model pre-training and the
  * performance of both natural language understand (NLU) and generation (NLG)
  * Compared to RoBERTa-Large, a DeBERTa model trained on half of the data
    * NLP tasks, achieving improvements on
      * MNLI by     +0.9% (90.2% vs. 91.1%),
      * SQuAD v2.0  +2.3% (88.4% vs. 90.7%), and
      * RACE by     +3.6% (83.2% vs. 86.8%)
    * NLG tasks, DeBERTa improves the perplexity
      from 21.6 to 19.5 on the Wikitext-103 dataset
  * scale up DeBERTa to 1.5 billion parameters
    * on the SuperGLUE benchmark (Wang+ 19)
      * outperforms Google's T5 with 11 billion params 0.6% (89.3% vs. 89.9%)
      * surpasses the human performance (89.9 vs. 89.8)

# 1 Introduction

* large-scale Transformer-based Pre-trained Language Models (PLMs), such as
  * GPT (Radford+ 2019; Brown+ 2020)
  * BERT (Devlin+ 2019)
  * RoBERTa (Liu+ 2019c)
  * XLNet (Yang+ 2019)
  * UniLM (Dong+ 2019)
    * Unified language model pre-training for natural language understanding
  * ELECTRA (Clark+ 2020)
  * T5 (Raffel+ 2020)
  * ALUM (Liu+ 2020)
    * Adversarial training for large neural language models. arXiv:2004.08994
  * StructBERT (Wang+ 2019c) and ERINE (Sun+ 2019)
    * Structbert: Incorporating language structures into pre-training
      for deep language understanding. arXiv preprint arXiv:1908.04577, 2019c
* fine-tuned using task-specific labels and created new SOTA in many downstream
  (Liu+ 2019b; Minaee+ 2020; Jiang+ 2020; He+ 2019a;b; Shen+ 2020)
* disentangled self-attention mechanism
  * BERT: each word in the input layer is represented using a vector which is
    the sum of its word (content) embedding and position embedding
  * DeBERTa: two vectors that encode its content and position, respectively, and
    * attention weights among words are computed using disentangled matrices
      based on their contents and relative positions
  * motivated by the observation that the
    attention weight of a word pair depends on not only their contents but
    their relative positions
    * For example, the dependency between the words “deep” and “learning” is
      much stronger when they occur next to each other than when in diff sents
* we enhance the output layer of BERT for pre-training
  to address a limitation of relative positions
  * DeBERTa incorporates absolute word position embeddings in the softmax layer
    where the model decodes the masked words
    based on the aggregated contextual embeds of word contents and positions
* substantially improve the efficiency of pre-training and the downstream perf

## 3.2 Two extensions of the disentangled attention

* address a limitation of the relative positions
  which have been fully captured by the disentangled attentions
  * eg “A new store opened near the new mall” with the
  * words _store_ and _mall_ masked for prediction
  * both words are right after the word _new_ with the exact relative position
  * two ways to introduce the absolution positions
    * BERT model incorporates the absolute positions in the input layer
    * DeBERTa, we propose an alternative to consider it
      right after all the Transformer layers but
      right before the softmax for masked token decoding, as shown in Figure 2
      * ie relative positions in all the Transformer layers and
        absolute position only as a complementary in the softmax decoding layer
    * We call this new approach as Enhanced Mask Decoder (EMD)
    * In our empirical studies, the new approach in DeBERTa is much better
    * We conjecture the early introduction of the absolute position will
      undesirably hamper the model from learning accurate relative positions
    * new design will enable us to introduce additional information besides
      positions to the pre-training: will be explored in future
* enable generation tasks and a multi-task learning objective
  * To enable the autoregressive generation, we follow (Dong+ 2019) by using a
    triangular matrix for self-attention and
    set the upper triangular part of the self-attention mask to -∞

### 4.3.1 Ablation study

* To verify our experimental setting, we pre-train the RoBERTa base model from
  scratch. We call the re-pre-trained RoBERTa RoBERTa-ReImp base
* we design three variations:
  * -EMD is the DeBERTa base model without EMD
  * -C2P is the DeBERTa base model without the content-to-position term
  * -P2C is the DeBERTa base model without the position-to-content term
    * close to XLNet plus EMD
* Table 5 summarizes the results on four benchmark datasets
  * RoBERTa and RoBERTa-ReImp perform similarly across all the four benchmark
  * removing any one component in DeBERTa results in a sheer performance drop

## 4.4 Scale up to 1.5 billion parameters

* parameter sharing
  * we share the projection matrices of relative position embedding
    W k,r , W q,r with W k,c , W q,c , respectively, in all attention layers
    to reduce the number of model parameters
  * ablation study in table 12 on the base-sized models shows the
    projection matrix sharing reduces the model size while retaining the perf
* a convolution layer is added aside with the first transformer layer
  to induce n-gram knowledge of sub-word encodings and
  their outputs are summed up before feeding to next transformer layer
* new adversarial training algorithm, Scale-Invariant-Fine-Tuning (SiFT),
  * a variant to the algorithm described in (Miyato+ 2018; Jiang+ 2020), for
    fine-tuning
  * adversarial examples created by making small perturbations to the input
    * When fine-tuning DeBERTa to a downstream NLU task, the model is
      regularized so that given a task-specific example the model produces the
      same output distribution as it produces on an adversarial perturbation
  * SiFT adds a normalization layer right before the perturbation layer
    * the perturbation is applied to normalized embedding vectors
    * Unlike existing adversarial training methods
      that apply perturbations directly on the embeddings of input words,
    * substantially improves the performance of the fine-tuned models in expers
    * A more comprehensive study of SiFT will be described in our future work
* SuperGLUE (Wang+ 2019a) is one of the most popular NLU benchmarks
  * NLU tasks, including
    * Question Answering (Clark+ 2019; Khashabi+ 2018a; Zhang+ 2018)
    * Natural Language Inference
      (Dagan+ 2006; Bar-Haim+ 2006; Giampiccolo+ 2007; Bentivogli+ 2009)
    * Word Sense Disambiguation (Pilehvar & Camacho-Collados, 2019)
    * Reasoning (Levesque+ 2011; Roemmele+ 2011)
  * Table 6 reports the test results of SuperGLUE
  * better than the
    * SOTA pre-trained T5 11 billion parameters SuperGLUE score (89.9 vs. 89.3)
    * human performance in overall score (89.9 vs. 89.8) for the first time
