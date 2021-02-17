Cross-Lingual Natural Language Generation via Pre-Training
Zewen Chi, Li Dong, Furu Wei, Wenhui Wang, Xian-Ling Mao, Heyan Huang
AAAI-20 arXiv:1909.10481

https://github.com/CZWin32768/xnlg

# 1 Intro

* cross-lingual sentence encoders
  (Johnson+ 2017; Conneau+ 2018; Lample and Conneau 2019)
  * encode multilingual texts into a shared vector space
  * promising results on cross-lingual classification problems,
  * for NLG tasks, cross-lingual pre-trained models are relatively understudied
* The cross-lingual generation problem is challenging due to
  * encoder and the decoder should be pre-trained together
  * increases language pairs with the square of the number of languages
  * prediction space is much larger than classification
* Previous work mainly relies on machine translation (MT)
  * in a pipeline manner (Wan, Li, and Xiao 2010)
    * inputs are first translated to English, and fed into the NLG model that is
      trained by English data. Then the generated English texts are translated
      back to the target language
    * generate pseudo training data for other language pairs that lack it
      (Shen+ 2018; Duan+ 2019)
* we propose a
  * cross-lingual pre-trained model (named as XNLG) in order to
  * transfer monolingual NLG supervision to other pre-trained languages
    by fine-tuning
    * shares the same sequence-to-sequence model across languages, and is
    * pre-trained with both monolingual and cross-lingual objectives
    * learns to understand multilingual input
    * can also generate specific languages by conditioning on the encoded sem
  * Figure 1 demonstrates how to use XNLG to perform cross-lingual transfer
    * enables us to fine-tune the pre-trained model on monolingual NLG data, and
      then evaluate it beyond a single language,
      including zero-shot crosslingual generation
  * explore several fine-tuning strategies to make a compromise between
    cross-lingual ability and task ability
  * eval in two crosslingual NLG datasets: QA, & abstractive summarization, AS
    * English, Chinese, and French
* Experiments: XNLG achieves competitive performance compared with the
  machine-translation based pipeline model in zero-shot cross-lingual settings

# 2 Related Work 2

## Cross-Lingual NLG

* cross-lingual abstractive summarization
  * Shen+ (2018) and Duan+ (2019) use translated documents or summaries as
    pseudo training data
  * Junnan+ (2019) incorporate monolingual summarization and machine translation
    to improve cross-lingual summarization
    * only generate summaries with different languages from the input language,
      rather than transferring supervision signals across all language pairs
* Kumar+ (2019) use training data annotated in multiple languages to
  jointly train a sequence-to-sequence model for question generation

## Monolingual Pre-Training

* Various pretraining objectives for general-purpose representations, such as
  * LM (Peters+ 2018; Radford+ 2018; Devlin+ 2019; Joshi+ 2019; Yang+ 2019),
  * auto-encoding (Liang+ 2019), and
  * machine translation (McCann+ 2017)
  * Apart from pre-training encoders,
    several pre-trained models (Dong+ 2019; Song+ 2019) are proposed for
    generation tasks
    * Dong, L.; Yang, N.; Wang, W.; Wei, F.; Liu, X.; Wang, Y.; Gao, J.;
      Zhou, M.; and Hon, H.-W
      Unified LM pre-training for natural language understanding and generation
      arXiv preprint arXiv:1905.03197
    * Song, K.; Tan, X.; Qin, T.; Lu, J.; and Liu, T.-Y
      arXiv preprint arXiv:1905.02450
      Mass: Masked sequence to sequence pre-training for language generation

## Cross-Lingual Pre-Training

* mBERT shows a surprising ability (Wu and Dredze 2019)
* Lample and Conneau (2019) extend mask language modeling pre-training to
  cross-lingual settings, which shows
  significant improvements on cross-lingual classification and unsup MT
  * By comparison, we pretrain both encoder and decoder for cross-lingual
    generation tasks, rather than only focusing on encoder
* Artetxe and Schwenk (2018) use the sequence encoder of the multilingual
  translation model (Johnson+ 2017) to produce cross-lingual sentence embeds
  * However, as shown in the experiments (Section 4),
    it is difficult to control the target language by directly fine-tuning the
    pre-trained translation model on downstream NLG tasks

# 3 Methods 2

* As shown in Figure 2, XNLG is a pre-trained sequence-to-sequence model,
  which is based on Transformer (Vaswani+ 2017)
  * Both the encoder and the decoder are supposed to support multiple languages
  * we use language tag embeddings to distinguish the source and target langs,
    following (Lample and Conneau 2019),
  * Given a sentence and its corresponding language tag,
    XNLG encodes the input into vector representations
  * By conditioning on the encoding vectors and a specific language tag, the
    decoder generates the output sequence in the target language

## 3.1 Pre-Training Tasks

### Monolingual MLM The masked language modeling

### Denoising Auto-Encoding (DAE) We use the denoising

### Cross-Lingual MLM (XMLM) Similar to monolingual

### Cross-Lingual Auto-Encoding (XAE) If only DAE is

## 3.2 Pre-Training Protocol

## 3.3 Fine-Tuning on Downstream NLG Tasks

### Fine-Tuning for Any-to-Others NLG Ideally, the model

* In practice, we found that the proposed fine-tuning method prevents the
  model from only decoding English words for the Any-to-Others setting

### Fine-Tuning for Any-to-English NLG For the Any-to-

# 4 Experiments

## 4.3 Abstractive Summarization

* we use English/French/Chinese Gigaword 2 to extract the first sentence and
  the headline of each article, and regard them as input document and pre-
  dicted summaries, respectively. For each language, we sample 500k/5k/5k
  examples for training/validation/test.

## 4.4 Ablation Studies

* we first fine-tune XNLG on the English AS data, and
  then fine-tune it on the French or Chinese AS data
  * compare with the monolingual supervised model that XNLG is
    only fine-tuned on the dataset of the target language
  * Figure 3: cross-lingual supervision improves performance for few-shot AS
    * As the training data size becomes larger, the performances of the
      two models are getting closer
