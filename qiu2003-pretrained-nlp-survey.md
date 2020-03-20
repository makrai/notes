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

### Convolutional models

### Sequential models. Sequential models usually adopt

### Graph-based models. Different from the above models, graph-based models
take

* word[s] as nodes and learn the contextual representation with a
* pre-defined linguistic structure between words, e.g. syntactic structure
  [146, 161] or semantic relation [111]
* more straightforward [ is ] self-attention mechanism, which implicitly

#### Analysis Both convolutional and sequential models learn the contextual

* Transformer ... is easy to overfit on small or modestly-sized datasets [130,
  49]
  49. Qipeng Guo, Xipeng Qiu, Pengfei Liu, Yunfan Shao, Xiangyang Xue, and
  Zheng Zhang. Star-transformer. In NAACLHLT, pages 1315–1325, 2019
  130. Alec Radford, Karthik Narasimhan, Tim Salimans, and Ilya Sutskever
  Improving language understanding by generative pre-training. 2018

## 2.3 Why Pre-training?

* Pre-training provides a better
  * initialization, which usually leads to a better generalization performance
    and speeds up convergence on the target task
  * regularization to avoid overfitting on small data [39]

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
  rest parameters of the main model are still trained from scratch
* Ramachandran+ [134] found the seq2seq models can be significantly improved by
  unsupervised pre-training. The weights of both encoder and decoder are
  initialized with pretrained weights of two language models and then
  fine-tuned with labeled data
* ULMFiT (Universal Language Model Finetuning) [62] attempted to fine-tune
  pre-trained LM for text classification (TC) and achieved SOTA results on six
  widely-used TC datasets
  * ULMFiT consists of 3 phases:
    1. pre-training LM on general-domain data;
    1. fine-tuning LM on target data;
    1. fine-tuning on the target task. ULMFiT also investigates some effective
  * fine-tuning strategies, including discriminative fine-tuning, slanted
    triangular learning rates, and gradual unfreezing
  * Since ULMFiT, fine-tuning has become the mainstream approach to adapt PTMs
    for the downstream tasks
* very deep PTMs have shown their powerful ability in learning universal
  * OpenAI GPT (Generative Pre-training) [130] and
  * BERT (Bidirectional Encoder Representation from Transformer) [32]
* Besides LM, an increasing number of self-supervised tasks (see Section 3.1)
  are proposed to make the PTMs capturing more knowledge form large scale text

# 3 overview of PTMs and categorization of PTMs

* differences between PTMs are the usages of contextual encoders (2.2),
  pre-training tasks, and purposes. We have briefly
* In this section, [ pre-training tasks and ] a taxonomy of PTMs

## 3.1 Pre-training Tasks

3. Self-Supervised learning: predict any part of the input from other parts in

### 3.1.3 Permuted Language Modeling (PLM)

* Yang+ [194] claimed that some special tokens used in [masked LM], like
  [MASK], are absent when the model is applied on downstream tasks, leading to
  a gap between pretraining and fine-tuning. To overcome this issue,
* Permuted Language Modeling (PLM) [194] is a pre-training objective to replace
  * random permutation of input sequences. Given a sequence, a permutation is
* two-stream self-attention is introduced for target-aware representations

### 3.1.5 Contrastive Learning (CTL)

* Contrastive learning [140]
* assumes some observed pairs of text that are more semantically similar than
* Compared to LM, CTL usually has less computational complexity, and therefore
* Collobert+ [24] proposed pairwise ranking task to distinguish real and fake
  phrases. The model need to predict a higher score for legal phrase than an
* Mnih and Kavukcuoglu [118] trained word embeddings efficiently with
  Noise-Contrastive Estimation (NCE) [51], which trains a binary classifier to
* idea of NCE is also used in the well-known word2vec embedding [116]
* recently proposed CTL tasks in the following paragraphs

#### Deep InfoMax (DIM) Deep InfoMax (DIM) [59] is

* original proposed for images, which improves the quality of the
* maximizing the mutual information between an image representation and local
  regions of the image
* Kong+ [83] applied DIM to language representation learning. The global

#### Replaced Token Detection (RTD) Replaced Token Detection (RTD) is

* the same as NCE but predicts whether a token is replaced given its context
* CBOW with negative sampling (CBOW-NS) [116] can be viewed as a simple version
* ELECTRA [22] ... utilizing a generator to replacing some tokens of a sequence
  * generator G and a discriminator D are trained following a two-stage
    1. Train only the generator with MLM task for n 1 steps;
    1. Initialize the weights of the discriminator with the weights of the G
  * Then train the discriminator with a discriminative task keeping G frozen
  * G is thrown after pre-training, and only D be fine-tuned on downstream
* RTD is also an alternative solution for the mismatch problem the network sees
  [MASK] during pre-training but not when being fine-tuned in downstream tasks
* Similarly, WKLM [188] replaces words on the entity-level instead of token-lev
  * replaces entity mentions with names of other entities of the same type and

#### Next Sentence Prediction (NSP) Punctuations are the natural separators of

* distinguish whether two input sentences are continuous segments from the corp
* benefit downstream tasks, such as Question Answering and NLI
* necessity of the NSP task has been questioned [72, 194, 105, 86]
  * Yang+ [194] found the impact of the NSP task unreliable, while
  * Joshi+ [72] found that single-sentence training without the NSP loss is
    superior to sentence-pair training with the NSP loss
  * Liu+ [105] ... shows that when training with blocks of text from a single
    document, removing the NSP loss matches or slightly improves performance on
    downstream tasks

#### Sentence Order Prediction (SOP) To better model intersentence coherence,

* ALBERT [86] replaces the NSP loss with a sentence order prediction (SOP)
  * conjectured in Lan+ [86], NSP conflates topic prediction and coherence
    prediction in a single task
  * topic prediction is easier to learn compared to coherence prediction, which
  * SOP uses ... consecutive segments but with their order swapped as negative
  * consistently outperforms BERT on various downstream tasks
* StructBERT [180] and BERTje [29] also take SOP as their self-supervised

### 3.1.6 Others

* sentiment label-aware MLM for sentiment analysis [78], gap sentence
  generation (GSG) for text summarization [197], disfluency detection [179] and
  so on. In addition, some
* auxiliary pre-training tasks are designed to incorporate factual knowledge,
  * denoising entity auto-encoding (dEA) in ERNIE(THU) [199],
  * entity linking (EL) in KnowBERT [123]
* multimodal pre-trained model: visual-based MLM, masked visual-feature
  modeling and visual-linguistic matching are widely used in multi-modal
  * VideoBERT [152], VisualBERT [95], ViLBERT [107] and so on

## 3.2 Taxonomy of PTMs 7

* perspective:
  1. the type of word representation used by PTMs,
  1. the backbone network used by PTMs,
  1. the type of pre-training tasks used by PTMs, and
  1. the PTMs designed for specific types of scenarios or inputs. Figure 3

# 4 extensions of PTMs 10

## 4.1 Knowledge-Enriched PTMs

* external knowledge ranges from
  * linguistic [87, 78, 123, 178],
  * semantic [92],
  * commonsense [48],
  * factual [199, 123, 101, 188, 182], to
  * domain-specific knowledge [54]
* injecting knowledge during pre-training. Early studies  focused on
  * joint learning knowledge graph embeds and word embeds [183, 202, 187, 190]
  * Since BERT, some auxiliary pre-training tasks are designed to incorporate
    * LIBERT [87] (linguistically-informed BERT) incorporates linguistic
    * sentiment
      * Ke+ [78] integrated sentiment polarity of each word to extend the MLM
        to Label-Aware MLM (LA-MLM)`:` SentiLR, achieves SOTA performance on
        several sentenceand aspect-level sentiment
    * SenseBERT (Levine+ [92]) is pre-trained to predict MLM + supersenses in
    * entity
      * ERNIE(THU) [199] integrates entity embeddings pre-trained on a
        knowledge graph with corresponding entity mentions in the text
      * KnowBERT [123] trains BERT jointly with an entity linking model to
        incorporate entity representation in an end-to-end fashion
      * KEPLER (Wang+ [182]) jointly optimizes knowledge embedding and LM
        * inject structure information of knowledge graph via entity embed-
      * K-BERT [101] explicitly injects related triples extracted from KG into
        the sentence to obtain an extended tree-form input for BERT.  Moreover,
      * Xiong+ [188] adopted entity replacement identification to encourage the
        model to be more aware of factual knowledge
  * these methods ... may suffer from catastrophic forgetting when injecting
    * To address this, K-Adapter [178] injects multiple kinds of knowledge by
      training different adapters independently for different pre-training
      tasks, which allows continual knowledge infusion
* incorporate external knowledge into pre-trained models without retraining
  * K-BERT [101] allows injecting factual knowledge during fine-tuning on
  * Guan+ [48] employed commonsense knowledge bases, ConceptNet and ATOMIC, to
    enhance GPT-2 for story generation
  * Yang+ [192] proposed a knowledge-text fusion model to acquire related
    linguistic and factual knowledge for machine reading comprehension
* extended language model to prediction conditioned on knowledge graph. These
  * knowledge graph language model (KGLM, Logan IV+ [106]) and
  * latent relation language model (LRLM, Hayashi+ [53]) respectively, both of

## 4.2 Multi-Modal PTMs

* such as videos with spoken words or images with captions, incorporating
  * VideoBERT [152] and CBT [151] are joint video and text models. To obtain
  * videos are pre-processed by CNN-based encoders and off-the-shelf speech rec
  * UniViLM [109] proposes to bring in generation tasks to further pre-train
* image-text pairs, aiming to fit downstream
  * tasks like visual question answering(VQA) and visual commonsense reasoning
  * two separate encoders for image and text representation independently e.g
    ViLBERT [107] and LXMERT [162].  While other methods like
  * single-stream unified Transformer, e.g.  VisualBERT [95], B2T2 [2], VLBERT
    [150], Unicoder-VL [94] and UNITER [16]
  * MLM and image-text matching, are introduced in these approaches
  * images are converted into sequences of regions by applying RoI or bounding
    box retrieval techniques before encoded by pre-trained Transformers
* audio-text pairs, such as SpeechBERT [20]. This work tries to build an
  * end-to-end Speech Question Answering(SQA) model by
  * encoding audio and text with a single Transformer encoder, which is
    pre-trained with MLM on speech and text corpus and fine-tuned on QA

## 4.3 Model Compression

* Table 3 distinguishes some representative compressed PTMs in detail

### pruning, which removes less important parameters,

* Gordon+ [47] explored [when to prune] (during pre-training, after downstream
  fine-tuning) and the pruning regimes
* Li and Eisner [96] compressed ELMo word token embeddings using variational
  information bottleneck
* Michel+ [115] and Voita+ [174] tried to prune the entire self-attention heads
  in the transformer block

### weight quantization [36], which uses fewer bits to represent the parameters

* Shen+ [143] and Zafrir+ [196]. Often requires compatible hardware

### parameter sharing across similar model units

* ALBERT [86] uses cross-layer parameter sharing and factorized embedding
  parameterization to reduce the parameters of PTMs

### knowledge distillation [57]: student model learns from outputs from the org

* teacher model can be an ensemble of many models and usually well pre-trained

#### Distillation from soft target probabilities

* Bucilua+ [15]
* A common method is approximating the logits of the teacher model
* DistilBERT [139]
* can also be used in task-specific models, e.g. information retrieval [108],
  and sequence labeling [168]

#### Distillation from other knowledge. Distillation from soft target

* not regard the teacher model as a black box

#### Distillation to other structures

* Generally, the structure of the student model is the same [just smaller]
* simplifying model structures from Transformer to RNN [164] or CNN [18] can

## 4.4 Domain-Specific PTMs

* PTMs trained on specialty corpora, such as
  * BioBERT [91] for biomedical text
  * SciBERT [10] for scientific text
  * ClinicalBERT [64, 3] for clinical text
* adapt available pre-trained models to target applications, such as biomedical
  entity normalization [68], patent classification [90], progress notes
  classification and keyword extraction [163]

## 4.5 Multilingual and Language-Specific PTMs

* Multilingual BERT 3) (M-BERT) is pre-trained by MLM with the shared
  vocabulary and weights on Wikipedia text from the top 104 languages. Each
  * no CL objectives specifically designed nor any cross-ling data
  * CL generalization surprisingly well [127]
  * lexical overlap between languages plays a negligible role K+ [74] in the
  * MASS [147] pretrained on multiple languages
    * significant improvement for unsupervised NMT
* XLM [25] improves M-BERT by incorporating a crosslingual task, translation
  language modeling (TLM), which performs MLM on a concatenation of parallel
  bilingual sentence pairs
* Unicoder [63] further propose three new crosslingual (CL) pre-training tasks,
  * CL word recovery, CL paraphrase classification, and CL masked LM
* PTMs trained on a single language significantly outperform the multilingual
  [112, 88, 173]
  * For Chinese, which does not have explicit word boundaries, modeling
  * larger granularity [26, 33, 184] and multigranularity [157, 158] word repr
  * Kuratov and Arkhipov [85] ... adapt a multilingual PTM to a [Russian] PTM
  * monolingual PTMs pre-trained on language-specific corpus for French [112,
    88], Finnish [173], Dutch [29, 31] have been released

# 5 To downstream tasks 13

## 5.1 Transfer Learning

* types of transfer learning in NLP, such as domain adaptation, cross-lingual
  learning, multi-task learning, and so on

## 5.2 How to Transfer?

### 5.2.1 Choosing appropriate pre-training task, model architecture and corp

* [with] BERT, it is hard to generate language

### 5.2.2 Choosing appropriate layers

* RNN-based models, Belinkov+ [9] and Melamud+ [114] showed that
* transformer-based PTMs, Tenney+ [166] found BERT represents the steps of the
  traditional NLP pipeline: basic syntactic information appears earlier in the
  network, while high-level semantic information appears at higher layers
* three ways to select the representation:
  * Embedding Only. One approach is to choose only the pre-trained static
  * Top Layer.  The most simple and effective way
  * automatic choose the best layer in a soft version, like ELMo [122]: r t = γ
    * where α l is the softmax-normalized weight for layer l and γ is a scalar

### 5.2.3 To tune or not to tune

* two common ways of model transfer:
  * feature extraction (where the pre-trained parameters are frozen), and
    * it is important to expose the internal [most transferable ] layers [124]
  * fine-tuning (where the pre-trained parameters are unfrozen and fine-tuned)
    * usually more general and convenient for many different downstream tasks

## 5.3 Fine-Tuning Strategies

* Since ULMFit and BERT, fine-tuning has become the main adaption method of
  * distinct random seeds can lead to substantially different results [34]
* Besides standard fine-tuning, there:

### Two-stage fine-tuning An alternative solution is two-stage transfer, which

* first stage [with] an intermediate task or corpus. In the
* second stage, the transferred model is fine-tuned to the target task
* Sun+ [154]: “further pretraining” on the related-domain corpus (BERT) and
  * SOTA performance on eight widely-studied text classification datasets
* Phang+ [126] and Garg+ [44]: intermediate supervised task related to the tg
  * large improvement for BERT, GPT, and ELMo

### Multi-task fine-tuning: Liu+ [103] fine-tuned BERT [demonstrating that]
multi-task learning and pre-training are complementary technologies

### Fine-tuning with extra adaptation modules The

* main drawback of fine-tuning is its parameter inefficiency: every downstream
  task has its own fine-tuned parameters. Therefore, a better
* solution is to inject some fine-tunable adaptation modules into PTMs while
  * original parameters are fixed
* shared BERT projected attention layers (PALs, Stickland and Murray [149])
  * PAL: small additional task-specific adaptation modules, shared BERT with
  * matches separately fine-tuned models on the GLUE benchmark with roughly 7
    times fewer parameters. Similarly,
* adapter modules to the pre-trained BERT (Houlsby+ [61])
  * Adapter modules yield a compact and extensible model; they add only a few
    trainable parameters per task, and new tasks can be added without
    revisiting previous ones. The parameters of

### Others Instead of fine-tuning all the layers simultaneously,

* gradual unfreezing [62] layers of PTMs starting from the top layer
* Chronopoulou+ [19] proposed [the simpler] sequential unfreezing, which
  * first fine-tunes only the randomly-initialized task specific layers, and
    then unfreezes the hidden layers of PTM, and finally unfreezes the
    embedding layer
* Motivated by ... ensemble models, Xu+ [191]: self-ensemble and self-distill

# 6 Related resources on PTMs: open-source systems, paper lists 15

# 7 Applications across NLP tasks 15

## 7.1 General Evaluation Benchmark

* The General Language Understanding Evaluation (GLUE) benchmark (Wang+ 19)
  * nine tasks, including
    * single-sentence classification tasks (CoLA and SST-2)
    * pairwise text classification tasks (MNLI, RTE, WNLI, QQP, and MRPC)
    * text similarity task (STSB)
    * and relevant ranking task (QNLI). GLUE benchmark is well-designed for
* SuperGLUE [176]: more challenging tasks and more diverse task formats (e.g.,
  coreference resolution and question answering)

## 7.2 Machine Translation

* Conneau and Lample [25] initialize the entire encoder and decoder by a
  multilingual pre-trained BERT model and shows a significant improvement on
  unsupervised MT and English-Romanian supervised MT
* Edunov+ [37] used ELMo to set the word embedding layer in the NMT
  * English-Turkish and English-German NMT model by using a pre-trained
    language model for source word embedding initialization
* Clinchant+ [23] : examining the best strategy to utilize BERT on the encoder
  * some improvement by using BERT as an initialization of the encoder. Also,
  * better performance on the out-of-domain dataset
* Imamura and Sumita [65] proposed a two stages BERT fine-tuning method for NMT
  1. encoder is initialized by a pre-trained BERT model and they only train the
  decoder on the training set
  2. whole NMT model is jointly fine-tuned on the training set. By experiment,
* Zhu+ [204] suggested using pre-trained BERT as an extra memory in NMT models
  * they first encode the input tokens by a pre-trained BERT and use the output
    of the last layer as an extra memory. Then, the
  * NMT model can access the memory via an extra attention module in each layer
    of both encoder and decoder
  * noticeable improvement on supervised, semi-supervised and unsupervised MT
* Song+ [147] proposed a masked sequence-to-sequence pre-training method (MASS)
  to pre-train the encoder and decoder jointly.  In the experiment, this
  * surpass the BERT-style pre-training proposed by Conneau and Lample [25]
    both on unsupervised MT and English-Romanian supervised MT

## 7.3 Question Answering

* Question answering (QA), or a narrower concept machine reading comprehension
* Generally,
  * encoder parameters in the proposed QA model are initialized through a PTM,
  * other parameters are randomly initialized
* From easy to hard, there are three types of QA tasks:
  * single-round extractive QA (SQuAD) [133],
  * multi-round generative QA (CoQA) [135], and
  * multi-hop QA (HotpotQA) [193]
* extractive
  * BERT transforms the extractive QA task to the spans prediction task [32]
  * PTM as an encoder for predicting spans has become a competitive baseline
  * Zhang+ [200] proposed a retrospective reader architecture and initialize
    the encoder with PTM (e.g., ALBERT). For
* multi-round generative QA
  * “PTM + Adversarial Training + Rationale Tagging + Knowledge Distillation”
    (Ju+  [73])
* multi-hop QA,
  * “Select, Answer, and Explain” (SAE) system, Tu+  [169] proposed, interpretb
  * PTM acts as the encoder in the selection module

## 7.4 Sentiment Analysis

* BERT outperforms previous SOTA models by simply fine-tuning on SST-2, which
  is a widely used dataset for sentiment analysis (SA) [32]
* Bataa and Wu [8] utilized BERT with transfer learning, new SOTA in Japanese
* aspect-based sentiment (ABSA) shows less significant improvement [153]. To
  * Sun+ [153] [ transforming ABSA ] to a sentence pair classification task
  * Xu+ [189] proposed post-training to adapt BERT to the ABSA domain and tasks
  * Rietzler+ [137] analyzing the behavior of cross-domain post-training with
    ABSA performance
  * Karimi+ [76] showed that the performance of post-trained BERT can be
    further improved via adversarial training
  * Song+ [148] added an additional pooling module, which can be implemented as
    either LSTM or attention mechanism, to leverage BERT intermediate layers
    for ABSA.  In addition,
  * Li+ [97] jointly learned aspect detection and sentiment classification
    towards end-to-end ABSA
* “Mask and Infill” (Wu+ [186]) based on BERT, for sentiment transfer
  * mask step: disentangle sentiment from content by masking sentiment tokens
  * infill step uses BERT + target sentiment embed to infill the masked positns

## 7.5 Summarization

* Zhong+ [203] introduced transferable knowledge (e.g., BERT) for summarization
* Zhang+ [198] tries to pre-trained a document-level model that predicts
  sentences instead of words, and then apply it on downstream tasks such as
* Zhang+ [197] designed a Gap Sentence Generation (GSG) task for pre-training,
  whose objective involves generating summary-like text from the input
* Liu and Lapata [104] proposed BERTSUM [which] included a novel document-level
  encoder, and a general framework for both extractive summarization and
  abstractive summarization.  In the encoder frame, BERTSUM extends BERT by
  inserting multiple [CLS] tokens to learn the sentence representations.  For
  * extractive: BERTSUM stacks several inter-sentence Transformer layers. For
  * abstractive: two-staged fine-tuning approach using a new fine-tuning schedl

## 7.6 Named Entity Recgonition

* TagLM [121] and ELMo [122] use a pre-trained language model’s last layer
  output and weighted-sum of each layer output as a part of word embedding
* Devlin+ [32] used the first BPE’s BERT representation to predict each word’s
  label without CRF
* Pires+ [127] realized zero-shot NER through multilingual BERT
* Akbik+ [1] used a pre-trained character-level language model to produce
  word-level embedding for NER
* Liu+ [98] used layer-wise pruning and dense connection to speed up ELMo’s
  inference on NER
* Tsai+ [168] leveraged knowledge distillation to run a small BERT for
  NER on a single CPU. Besides, BERT is also used on
* domain-specific NER, such as biomedicine [52, 91], etc

# 8 Challenges and future directions 17

## Upper Bound of PTMs ... by more training steps and larger corpus

* e.g. Megatron-LM [144] (8.3 billion parameters, 72 Transformer layers with a
  hidden size of 3072 and 32 attention heads) and
  Turing-NLG (17 billion parameters, 78 Transformer layers with a hidden size
  of 4256 and 28 attention heads)
* needs ... techniques such as distributed training, mixed precision, gradient
  accumulation, etc. Therefore, a more practical
* [otherr] direction is to design more efficient model architecture,
  self-supervised pre-training tasks, optimizers and training skills
  * ELECTRA [22] is a good solution towards this direction

## Task-oriented Pre-training and Model Compression

* The discrepancy between PTMs and downstream tasks usually lies in two
  aspects: model architecture and data distribution. A larger discrepancy may
* specific model architecture and pre-training tasks for downstream task or
  extract partial task-specific knowledge from existing PTMs
* [teach] task-oriented PTMs with general-purpose existing PTMs

## Architecture of PTMs Transformer has been proved to be an effective

* main limitation of Transformer is its computation complexity: quadratic to
* cannot deal with the sequence longer than 512 tokens
* Breaking this limit e.g.  Transformer-XL [27].  Therefore, searching for more
* neural architecture search (NAS) [205]

## Knowledge Transfer Beyond Fine-tuning Currently, fine-tuning is the dominant

* using PTMs as external knowledge [125] , and so on.  More efficient methods

## Interpretability and Reliability of PTMs Although

* explainable artificial intelligence (XAI) [4] has become a hotspot in general
* attention interpretability is still controversial [66, 142]
* adversarial examples ... with imperceptible perturbations from the original
  * Jin+ [71] successfully attacked the finetuned BERT on text classification
    and textual entailment with adversarial examples
  * universal adversarial triggers (Wallace+ [175])
    [mislead model] when concatenated to any input.  Some triggers can even
  * Sun+ [155] showed BERT is not robust on misspellings. Besides, adversarial

# 9 Conclusion 18
