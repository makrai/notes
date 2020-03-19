Pre-trained Models for Natural Language Processing: A Survey
Xipeng Qiu, Tianxiang Sun, Yige Xu, Yunfan Shao, Ning Dai, Xuanjing Huang
arXiv:2003.08271 [cs.CL]

# 1 Intro

* contributions of this survey can be summarized as follows:
  1. Comprehensive review. We provide a comprehensive review of PTMs for NLP,
     * background knowledge, model architecture, pre-training tasks, various
       extensions, adaption approaches, and applications. We provide detailed
     * descriptions of representative models, make the necessary comparison,
  2. New taxonomy. We propose a taxonomy of PTMs for NLP, which categorizes
    1. type of word representation;
    1. architecture of PTMs;
    1. type of pre-training tasks;
    1.  extensions for specific types of scenarios or inputs
  3. We collect ... open-source systems, paper lists, etc
  4. Future directions. We discuss and analyze the limitations of existing

# 2 background concepts and commonly used notations of PTMs

## 2.1 Language Representation Learning

* representation should capture the implicit linguistic rules and common sense

## 2.2 Neural Contextual Encoders

### Convolutional models.

### Sequential models. Sequential models usually adopt

### Graph-based models. Different from the above models, graph-based models
take

* word[s] as nodes and learn the contextual representation with a 
* pre-defined linguistic structure between words, e.g. syntactic structure
  [146, 161] or semantic relation [111].
* more straightforward [ is ] self-attention mechanism, which implicitly

#### Analysis Both convolutional and sequential models learn the contextual

* Transformer ... is easy to overfit on small or modestly-sized datasets [130,
  49]
  49. Qipeng Guo, Xipeng Qiu, Pengfei Liu, Yunfan Shao, Xiangyang Xue, and
  Zheng Zhang. Star-transformer. In NAACLHLT, pages 1315–1325, 2019.
  130. Alec Radford, Karthik Narasimhan, Tim Salimans, and Ilya Sutskever.
  Improving language understanding by generative pre-training. 2018

## 2.3 Why Pre-training?

* Pre-training provides a better
  * initialization, which usually leads to a better generalization performance
    and speeds up convergence on the target task.
  * regularization to avoid overfitting on small data [39].  
  
## 2.4 A Brief History of PTMs for NLP

### 2.4.2 Pre-trained contextual encoders

* CoVe: McCann+ [113] pre-trained a deep LSTM encoder from an attentional
  sequence-to-sequence model with machine translation (MT). The context vectors
  (CoVe) output by the pretrained encoder can improve the performance of a wide
* ELMo: Peters+ [122] pre-trained 2-layer LSTM encoder with a bidirectional
  language model (BiLM), consisting of a forward LM and a backward LM. The
  contextual representations output by the pre-trained BiLM, ELMo (Embeddings
  from Language Models), are shown to bring large improvements on a broad range
* Akbik+ [1] captured word meaning with contextual string embeddings
  pre-trained with character-level LM.  However, these PTMs are usually used as
  a feature extractor to produce the contextual word embeddings, which are fed
  into the main model for downstream tasks. Their parameters are fixed and the
  rest parameters of the main model are still trained from scratch.
* Ramachandran+ [134] found the seq2seq models can be significantly improved by
  unsupervised pre-training. The weights of both encoder and decoder are
  initialized with pretrained weights of two language models and then
  fine-tuned with labeled data. 
* ULMFiT (Universal Language Model Finetuning) [62] attempted to fine-tune
  pre-trained LM for text classification (TC) and achieved SOTA results on six
  widely-used TC datasets. 
  * ULMFiT consists of 3 phases: 
    1. pre-training LM on general-domain data; 
    1. fine-tuning LM on target data; 
    1. fine-tuning on the target task. ULMFiT also investigates some effective
  * fine-tuning strategies, including discriminative fine-tuning, slanted
    triangular learning rates, and gradual unfreezing. 
  * Since ULMFiT, fine-tuning has become the mainstream approach to adapt PTMs
    for the downstream tasks.  
* very deep PTMs have shown their powerful ability in learning universal
  * OpenAI GPT (Generative Pre-training) [130] and 
  * BERT (Bidirectional Encoder Representation from Transformer) [32].
* Besides LM, an increasing number of self-supervised tasks (see Section 3.1)
  are proposed to make the PTMs capturing more knowledge form large scale text

# 3 overview of PTMs and categorization of PTMs

* differences between PTMs are the usages of contextual encoders (2.2),
  pre-training tasks, and purposes. We have briefly
* In this section, [ pre-training tasks and ] a taxonomy of PTMs.

## 3.1 Pre-training Tasks 

3. Self-Supervised learning: predict any part of the input from other parts in
   
### 3.1.3 Permuted Language Modeling (PLM)

* Yang+ [194] claimed that some special tokens used in [masked LM], like
  [MASK], are absent when the model is applied on downstream tasks, leading to
  a gap between pretraining and fine-tuning. To overcome this issue, 
* Permuted Language Modeling (PLM) [194] is a pre-training objective to replace
  * random permutation of input sequences. Given a sequence, a permutation is
* two-stream self-attention is introduced for target-aware representations.

### 3.1.5 Contrastive Learning (CTL)

* Contrastive learning [140] 
* assumes some observed pairs of text that are more semantically similar than
* Compared to LM, CTL usually has less computational complexity, and therefore
* Collobert+ [24] proposed pairwise ranking task to distinguish real and fake
  phrases. The model need to predict a higher score for legal phrase than an
* Mnih and Kavukcuoglu [118] trained word embeddings efficiently with
  Noise-Contrastive Estimation (NCE) [51], which trains a binary classifier to
* idea of NCE is also used in the well-known word2vec embedding [116].  
* recently proposed CTL tasks in the following paragraphs.  

#### Deep InfoMax (DIM) Deep InfoMax (DIM) [59] is 

* original proposed for images, which improves the quality of the
* maximizing the mutual information 
  between an image representation and local regions of the image.  
* Kong+ [83] applied DIM to language representation learning. The global

#### Replaced Token Detection (RTD) Replaced Token Detection (RTD) is 

* the same as NCE but predicts whether a token is replaced given its context.
* CBOW with negative sampling (CBOW-NS) [116] can be viewed as a simple version
* ELECTRA [22] ... utilizing a generator to replacing some tokens of a sequence 
  * generator G and a discriminator D are trained following a two-stage
    1. Train only the generator with MLM task for n 1 steps; 
    1. Initialize the weights of the discriminator with the weights of the G
  * Then train the discriminator with a discriminative task keeping G frozen.
  * G is thrown after pre-training, and only D be fine-tuned on downstream
* RTD is also an alternative solution for the mismatch problem the network sees
  [MASK] during pre-training but not when being fine-tuned in downstream tasks.
* Similarly, WKLM [188] replaces words on the entity-level instead of token-lev
  * replaces entity mentions with names of other entities of the same type and

#### Next Sentence Prediction (NSP) Punctuations are the natural separators of

* distinguish whether two input sentences are continuous segments from the corp
* benefit downstream tasks, such as Question Answering and NLI 
* necessity of the NSP task has been questioned [72, 194, 105, 86]. 
  * Yang+ [194] found the impact of the NSP task unreliable, while 
  * Joshi+ [72] found that single-sentence training without the NSP loss is
    superior to sentence-pair training with the NSP loss.  
  * Liu+ [105] ... shows that when training with blocks of text from a single
    document, removing the NSP loss matches or slightly improves performance on
    downstream tasks.

#### Sentence Order Prediction (SOP) To better model intersentence coherence,

* ALBERT [86] replaces the NSP loss with a sentence order prediction (SOP)
  * conjectured in Lan+ [86], NSP conflates topic prediction and coherence
    prediction in a single task
  * topic prediction is easier to learn compared to coherence prediction, which
  * SOP uses ... consecutive segments but with their order swapped as negative
  * consistently outperforms BERT on various downstream tasks.
* StructBERT [180] and BERTje [29] also take SOP as their self-supervised
  
### 3.1.6 Others

* sentiment label-aware MLM for sentiment analysis [78], 
  gap sentence generation (GSG) for text summarization [197], 
  disfluency detection [179] and so on. In addition, some 
* auxiliary pre-training tasks are designed to incorporate factual knowledge,
  * denoising entity auto-encoding (dEA) in ERNIE(THU) [199], 
  * entity linking (EL) in KnowBERT [123].  
* multimodal pre-trained model: visual-based MLM, masked visual-feature
  modeling and visual-linguistic matching are widely used in multi-modal
  * VideoBERT [152], VisualBERT [95], ViLBERT [107] and so on.  
  
## 3.2 Taxonomy of PTMs 7

# 4 extensions of PTMs 10

# 5 transfer the knowledge of PTMs to downstream tasks 13

# 6 related resources on PTMs, including open-source systems, paper lists 15

# 7 applications across various NLP tasks 15

# 8 challenges and suggests future directions 17

# 9 Conclusion 18
