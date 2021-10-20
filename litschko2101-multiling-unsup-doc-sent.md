Evaluating Multilingual Text Encoders for Unsupervised Cross-Lingual Retrieval
Robert Litschko, Ivan Vulić, Simone Paolo Ponzetto, Goran Glavaš
ECIR'21 arXiv:2101.08370 [cs.CL]

code and resources available at https://github.com/rlitschk/EncoderCLIR

* Pretrained multilingual text encoders based on neural Transformer architects,
  such as multilingual BERT (mBERT) and XLM, have achieved strong performance
  on a myriad of language understanding tasks
* a go-to paradigm for multilingual and cross-lingual representation learning
  and transfer, rendering
  cross-lingual word embeddings (CLWEs) effectively obsolete
* hE, questions remain to which extent this finding generalizes to
  unsupervised settings and ad-hoc cross-lingual IR (CLIR) tasks
* we present a systematic empirical study on the suitability of the SOTA
  multilingual encoders for cross-lingual document and sentence retrieval tasks
  across a large number of language pairs
* In contrast to supervised language understanding, our results indicate that
  for unsupervised (no relevance judgments for IR-specific fine-tuning)
  * document-level CLIR pretrained encoders fail to significantly outperform
    models based on CLWEs
    * performance also crucially depends on e.g. using sentence/document
      encoders directly versus averaging over constituent words and/or
      subwords
    * results are taskand language-pair-dependent
  * sentence-level CLIR, we demonstrate that SOTA performance can be achieved
    with variants that have been further specialized for sentence understanding

# 2 Related work

## Specialized Multilingual Sentence Encoders. An extensive body of work

* in Artetxe+ (ACL 2019) the multilingual encoder of a sequence-to-sequence
  model is shared across languages and optimized to be language-agnostic, 
* Guo+ (WMT 2018) rely on a dual Transformer-based encoder architectures
  (with tied/shared parameters) to represent parallel sentences
  * minimizes the cosine distance between parallel sentences. 
    * Rather than optimizing for translation performance directly
  * A ranking softmax loss is used to classify the correct (i.e., aligned)
    sentence in the other language from negative samples (non-aligned sentences)
* Yang (AAAI 2019) extend this approach by using a bidirectional dual encoder
  and adding an additive margin softmax function, which 
  serves to push away non-translation pairs in the shared embedding space
  * now widely adopted [20,51,18,39,56], and yields SOTA multilingual sentence
    encoders which excel in sentence-level NLU tasks.  Other recent approaches
* input space normalization, and re-aligning mBERT and XLM with parallel data
  [56,6], or using a 
  * 56. Zhao W; Eger S; Bjerva J; Augenstein I.
    Inducing language-agnostic multilingual representations
    arXiv:2008.09112 (2020)
  * 6. Cao S; Kitaev N; Klein D
    Multilingual alignment of contextual word representations
    ICLR (2020)
* teacher-student framework where a student model is trained to imitate the
  output of the teacher network while preserving high similarity of
  translation pairs (Reimers and Gurevych: Making monolingual EMNLP 2020)
* Yang+ (ACL 2020) combine multi-task learning with a translation bridging
  task to train a universal sentence encoder. We benchmark a series of 
* representative sentence encoders are described in §3.3

# 3 Multilingual Text Encoders

## 3.3 Specialized Multilingual Sentence Encoders

* Off-the-shelf pretrained multilingual Transformers such as mBERT and XLM
  produce poor sentence embeddings yielding sub-par performance in unsup sim
  * need to be fine-tuned on text matching (typically sentence matching)
    datasets [39,6,57], for semantic similarity 
    * supporting tasks that require unsupervised (ad-hoc) semantic text
  * directly produce a semantic embedding of the input text. We provide a

## Language Agnostic SEntence Representations (LASER) [2] adopts a 

* standard sequence-to-sequence architecture typical for neural MT. It is
  trained on 223M parallel sentences covering 93 languages
* The encoder is a multi-layered bidirectional LSTM and the 
  * decoder is a single-layer unidirectional LSTM. The 
  * 1024-dimensional sentence embedding is produced by max-pooling over the
    outputs of encoder’s last layer
* The decoder then takes the sentence embedding as additional input as each
  decoding step
  * The decoder-to-encoder attention and language identifiers on the encoder
    side are deliberately omitted, so that all relevant information gets
    ‘crammed’ into the fixed-sized sentence embedding produced by the encoder.
* In our experiments, we directly use the output of the encoder to represent
  both queries and documents.

## Multilingual Universal Sentence Encoder (m-USE) is 

* a general purpose sentence embedding model for transfer learning and
  semantic text retrieval tasks [51]. It relies on a 
* standard dual-encoder neural framework [9,52] with shared weights, 
  * trained in a multi-task setting with an additional translation bridging
    task
  * two pretrained m-USE instances available 
    * we opt for the 3-layer Transformer encoder with average-pooling.  

## Language-agnostic BERT Sentence Embeddings (LaBSE) [18] is another 

* neural dual-encoder framework, also trained with parallel data. 
* LaBSE training starts from a pretrained mBERT instance
  * Unlike in LASER and m-USE, where the encoders are trained from scratch on
    parallel data, 
* In addition to the multi-task training objective of m-USE, LaBSE
  additionally uses standard self-supervised objectives used in pretraining of
  mBERT and XLM: masked and translation language modelling (MLM and TLM, see §2)

## DISTIL [39] is a teacher-student framework for injecting the knowledge

* techer: monolingual sentence BERT specialized for semantic similarity 
  * specialized using the available semantic sentence-matching datasets
  * specialized for embedding sentence meaning on semantic text similarity [7]
    and natural language inference [48] datasets
* student: non-specialized multilingual transformer (e.g., mBERT).  It first
* In the knowledge distillation (i.e. teaching) step a pretrained multilingual student
  encoder M is trained to mimic the output of the teacher model. For a given
  batch of sentence-translation pairs B “ tps j , t j qu, the teacher-student
  distillation training minimizes the following loss: „
* The student model M trained to produce for both s j and t j the same
  representation that M produces for s j
* We benchmark different DISTIL models in our CLIR experiments, with the
  student M initialized with different multilingual transformers.

## 5.2 Sentence-Level Cross-Lingual Retrieval 10

* Multilingual encoders specialized with parallel data excel in sent-level
  * all of them substantially outperforming the competitive MT-IR baseline.
* best is LASER, which was also trained on parallel data from Europarl,
  * We note that at the same time LASER was the weakest model from this group
    on average in the document-level CLIR task.

## 5.3 Further Analysis

### Layer Selection. All multilingual encoders have multiple layers and one

* For AOC and SEMB, where both models obtain representations by
  contextualizing (sub)words in a sentence, we get the best performance for
  higher layers 
* for document-level retrieval (L9/L12 for mBERT, and L15 for XLM) seem to be
* sentence-level retrieval (L9 for mBERT and L12/L11 for XLM)

### Number of Contexts in AOC

* We construct AOC term embeddings by averaging contextualized representations
  of the same term obtained from different Wikipedia contexts
* plateau rather early – at around 30 and 40 contexts for mBERT and XLM, resp.

### Input Sequence Length in document-level CLIR

* Multilingual encoders have a limited input length and they, unlike static
  * effectively truncate long documents
  * In our main experiments we truncated the documents to first 128 word pieces 
* Somewhat counterintuitively, encoding a longer chunk of documents (256 word
  pieces) yields a minor performance deterioration (compared to the length of
