LaBSE: Language-agnostic BERT Sentence Embedding
Fangxiaoyu Feng, Yinfei Yang, Daniel Cer, Naveen Arivazhagan, Wei Wang
arXiv:2007.01852 [cs.CL]

https://tfhub.dev/google/LaBSE

* We adapt multilingual BERT to produce language-agnostic sentence embeddings
  for 109 languages
* While English sentence embeddings have been obtained by fine-tuning, such
  models have not been applied to multilingual sentence embeddings
* Our model
  * masked language model (MLM) and translation language model (TLM) pretraining
    with a translation ranking task using bi-directional dual encoders
  * improves average bi-text retrieval accuracy over 112 languages to 83.7%,
    well above the 65.5% achieved by the prior SOTA on Tatoeba
  * new SOTA results on BUCC and UN bi-text retrieval

# 1 Intro

* pretrained MLMs do not intrinsically produce good sentence-level embeddings
  * the production of sentence embeds from MLMs must be learned via fine-tuning,
  * SentenceBERT (Reimers and Gurevych, 2019) fine-tunes a monolingual BERT
    based dual-encoder on natural language inference (NLI)
    * excellent performance on measures of sentence embedding quality such as
      * semantic textual similarity (STS) benchmark (Cer+ 2017) and
      * sentence embedding based transfer learning (Conneau and Kiela, 2018)
* multilingual sentence embedding models incorporate similar dual encoders,
  * none explore MLM pretraining
  * trained on translation pairs
    * directly (Artetxe and Schwenk, 2019b; Guo+ 2018; Yang+ 2019a), or
      * require large amounts of parallel training data
    * combined with monolingual input-response prediction
      (Chidambaram+ 2019; Yang+ 2019b)
* multilingual universal sentence encoder (m-USE) is trained on multiple langs
  * often perform worse than
    similar models only targeting a single language pair (Yang+ 2019a)
* multilingual BERT has demonstrated surprisingly good cross-lingual performance
  without training on parallel translation data (K+ 2020)
* we present a novel method for training multilingual sentence-level embeddings
  * combining existing SOTA methods for multilingual sentence embeddings with
    MLM and translation language model (TLM, Conneau and Lample, 2019)
    pretrained encoders
  * dual-encoder framework which consist of paired encoders feeding a
    combination function.  Such models are
    * well suited for learning effective cross-lingual sentence embeddings
      using an additive margin softmax loss (Yang+ 2019a)
    * Source and target sentences are encoded separately using a
      shared BERT based encoder (Devlin+ 2019)
    * The final layer [CLS] representations are taken as the sentence
      embeddings for each input
    * The similarity between the source and target sentences is scored using
      cosine over the sentence embeddings produced by the BERT encoders
* outperforms the previous SOTA, which are mostly bilingual models,
  on large bitext mining tasks e.g
  the United Nations corpus (Ziemski+ 2016) and BUCC (Zweigenbaum+ 2018),
  containing pools with 10Ms and 100,000s of translation candidates, resp
* Both tasks cover fr, de, es, ru, and zh, languages all having plenty of
  training data available
* We evaluate LaBSE on the Tatoeba retrieval task (Artetxe and Schwenk, 2019b)
  covering 112 languages, but with smaller pools of only between 100 to 1000
  * Compare to LASER (Artetxe and Schwenk, 2019b), the new model achieves
    * matching performance on languages with plenty of training data, but does
    * significantly better on languages with limited data, boosting the averaged
      accuracy on the entire 112 language evaluation to 83.7% from the 65.5%
  * performs strongly on the Tatoeba task for 30+ languages
    for which we have no monolingual or bilingual training data
    * 109 training languages cover language families containing the unseen langs
    * as long as the text can be segment to the wordpiece tokens reasonably
* contributions
  * A combination of pre-training and finetuning strategies
    * boost the performance of a dual encoder translation ranking model to the
      SOTA performance on bi-text mining;
  * A single massively multilingual model spanning 109 languages
    * cross-lingual transfer even to zeroshot cases
  * A thorough analysis and ablation study to understand the impact of
    data quality, data quantity, pre-training and negative sampling strategies
* conclusion
  * the additive margin softmax is a key factor for training the model,
  * parallel data quality matters, but
  * the amount parallel data required could be largely diminished with the
    masked language model pre-training

# 5 Analysis

### Additive Margin

* The additive margin (Yang+ 2019a) is still a very important part for learning

### Pre-training

* pre-training also leads to a significant less requirement of the parallel data

### Comparison to Multilingual BERT

* initializing from multilingual BERT model
  * perform strongly on the head languages in UN and BUCC tasks, with high 80s
  * significantly underperforms on Tatoeba tasks, with -2.8 average accuracy on
    the 36 language set and average accuracy on the all language set
* Our pre-training approach improves over multilingual BERT on tail languages
  * a much larger vocab , 500k versus 30K -> multilngual perf (Conneau+ 2019)
  * TLM in addition to MLM -> cross lingual transfer (Conneau and Lample 2019)
  * we pretrain on common crawl which is much larger, albeit noiser, than wiki

### Importance of the Data Selection

* The LaBSE models are trained with data selected by a pre-trained contrastive
  data selection (CDS) model
* In order to understand how the data selection affect the model performance,
  * we also train a model with the original web crawled translation pairs
    without CDS selection, which are still good enough to train reasonably good
    NMT models
  * doesn’t perform well on the retrieval task even from a 100 candidates pool
    * indicates that the dual encoder model training is sensitive to quality
  * Note that the CDS selection is not only based on the quality but also based
    on a domain match with the training data (Wang+ 2018), so that the selected
    data could possibly falls into a narrow domain where is the CDS training
    data from. A dedicated translation quality model could improve the data
    selection stage further or increase the coverage, we leave this to future

## 5.1 Zero-shot Transfer to Languages without Training Data 7

* total of 30+ such languages 13
* performance is surprisingly good for most of the languages with an
  * average accuracy around 60% on those languages. Nearly one third of them
    have accuracy larger than 75%, and only 7 of them have accuracy lower than
    25%. Such positive language transfer across languages is only possible due
  * We analyze effect of vocabulary by inspecting the
    unknown token rate, average token length in characters, and average sentence
    length in tokens of all languages (Arivazhagan+ 2019)
    * unknown token rates are surprisingly low for all languages, indicating a
      good coverage of the built vocab
    * Languages with low performance tend to have shorter token lengths and
      longer sequence lengths indicating sub-par vocab coverage
    * A better vocab could potentially benefit those languages

### Negative Sampling, cross-accelerator negative sampling

* We also briefly explore using hard rather than random negatives
* Guo+ (2018) explored hard negative mining in the dual encoder framework for
  learning crosslingual embeddings
  * default setup for followup works (Chidambaram+ 2018; Yang+ 2019a)
* We experiment the hard negative mining for Spanish (es) following Guo+ (2018)
  within this LaBSE setup
  * negative mining
    * A weaker dual encoder using the deep averaging network is trained
      to mine the negatives from the bilingual pool of en-es
    * Similar to the cross-accelerator negatives,
      the mined negatives are also appended to each example
    * Due to the memory constraint, we only append 3 mined hard negatives in es
      languages for each en source sentence
    * Since the amount of examples increased 4x per en sentence in es batches,
  * We also decrease batch size from 128 to 32 in the hard negative experiment
  * To get fair comparison, we trained 200k steps for the experiment
    instead of 50k in other experiments
  * For languages other than `es`, batch size was decreased to 32
* Removing the cross-accelerator sampling hurts the model performance slightly
  * hard negatives don't help the LaBSE model’s performance

## 5.2 Semantic Similarity 8

* the English Semantic Textual Similarity (STS) benchmark (Cer+ 2017)
  * intermediate values capturing carefully defined degrees of meaning overlap
  * broadly used to evaluate the quality of sentence-level embeddings
* distance measures
  * Within prior work,
    * m-USE, USE and ConvEmbed use `arccos` distance to measure embedding space
    * InferSent and SentenceBERT use cosine similarity.  Table 7
    * ours is computed as the `arccos` distance between the pair
    * we include numbers for SentenceBERT when it is fine-tuned for the STS task
      as well as ConvEmbed when an additional affine transform is trained to fit
      the embeddings to STS
    * tuning toward STS informs the extent to which the information required to
      assess semantic similarity is captured in any way within the model
* We observe that LaBSE performs
  * worse on pairwise English semantic similarity than other sentence embeddings
  * excellent performance on crosslingual bi-text retrieval
  * m-USE model notably achieves the best overall performance, even
    outperforming SentenceBERT when SentenceBERT is not fine-tuned for the STS
* We suspect training LaBSE on translation pairs biases the model to excel at
  detecting meaning equivalence, but not at distinguishing between fine grained
  degrees of meaning overlap
  * m-USE is trained similarity to LaBSE but also contains additional
    monolingual training data on the prediction of input-response pairs
    * has been shown to produce excellent sentence embedding representations as
      assessed by semantic similarity tasks (e.g., ConvEmbed (Yang+ 2018))
