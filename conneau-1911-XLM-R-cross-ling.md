XLM-RoBERTa: Unsupervised Cross-lingual Representation Learning at Scale
Alexis Conneau, Kartikay Khandelwal, Naman Goyal, Vishrav Chaudhary,
  G Wenzek, F Guzmán, E Grave, M Ott, L Zettlemoyer, V Stoyanov
ACL 2020 arXiv:1911.02116

# Abstract

* pretraining multilingual language models at scale leads to
  significant performance gains for a wide range of cross-lingual transfer task
* a Transformer-based masked language model on one hundred languages, using
  more than two terabytes of filtered CommonCrawl data
* significantly outperforms multilingual BERT (mBERT) on cross-lingual benchmks
  * +13.8% average accuracy on XNLI, +12.3% average F1 score on MLQA, and
    +2.1% average F1 score on NER
* performs particularly well on low-resource languages,
  improving 11.8% in XNLI accuracy for Swahili and 9.2% for Urdu
* We empirically evaluate the key factors that are required to achieve this
  * trade-offs between
    * positive transfer and capacity dilution and
    * the performance of high and low resource languages at scale
* very competitive with strong monolingual models on the GLUE and XNLI
* code, data, and models publicly available
* conclusion: importance of key hyperparameters i.e. vocabulary size

# 1 Intro

* goal of this paper is to improve cross-lingual language understanding (XLU),
  by carefully studying the effects of training
  unsupervised crosslingual representations at a very large scale
* XLM-R, a transformer-based multilingual masked language model pre-trained on
  * 100 languages
  * SOTA performance on cross-lingual classification, sequence labeling and QA
* Multilingual masked language models (MLM), large Transformer models (Vaswani)
  * mBERT (Devlin+ 2018) and
  * XLM (Lample and Conneau, 2019) have pushed the SOTA on cross-lingual NLU
* effective in cross-lingual
  * natural language inference (Bowman+ 2015; Williams+ 2017; Conneau+ 2018)
  * QA (Rajpurkar+ 2016; Lewis+ 2019)
  * named entity recognition (Pires+ 2019; Wu and Dredze, 2019)
* limited scale: all of these studies pre-train on Wikipedia
  * especially for lower resource languages
* we first present a comprehensive analysis of the
  trade-offs and limitations of multilingual language models at scale
  * inspired by recent monolingual scaling efforts (Liu+ 2019)
  * trade-off between high-resource and low-resource languages
  * the curse of multilinguality
    * impact of language sampling and vocabulary size
    * trade-off as we scale the number of languages for a fixed model capacity
    * more languages leads to better cross-lingual performance on low-resource
      languages up until a point, after which the overall performance on
      monolingual and cross-lingual benchmarks degrades
  * can be alleviated by simply increasing model capacity
* Our best model XLM-RoBERTa (XLM-R) outperforms mBERT on cross-lingual
  * classification by up to 21% accuracy
    on low-resource languages like Swahili and Urdu
  * XNLI: It outperforms the previous SOTA by 3.9% average accuracy
  * 2.1%average F1-score on Named Entity Recognition, and
  * 8.4% average F1-score on cross-lingual Question Answering
* monolingual fine tuning on the GLUE and XNLI benchmarks, where XLM-R obtains
  * competitive with SOTA monolingual models, including RoBERTa (Liu+ 2019)

# 2 Related Work

* transformer based language models (Radford+ 2018; Devlin+ 2018), unsupervised
  * cross-lingual understanding
    (Mikolov+ 2013a; Schuster+ 2019; Lample and Conneau, 2019)
  * mBERT (Devlin+ 2018) and XLM (Lample and Conneau 2019)
    * masked language models trained on multiple languages,
      without any cross-lingual supervision
  * Lample and Conneau (2019):
    * translation language modeling (TLM) as a way to leverage parallel data and
    * a new SOTA on XNLI benchmark (Conneau+ 2018)
  * unsupervised machine translation and pretraining for sequence generation
  * effectiveness of mBERT on sequence labeling tasks (Pires+ 2019)
  * cross-lingual multi-task learning: Huang+ (2019) showed gains over XLM
  * cross-lingual data augmentation for cross-lingual NLI
    * Singh+ (2019) demonstrated the efficiency of
  * relatively modest scale, in terms of the amount of training data
* scaling language model pretraining (size of the model and the training data)
  * monolingual case, Jozefowicz+ (2016) show large-scale LSTM models
    * trained on billions of tokens
  * GPT (Radford+ 2018) also highlights the importance of scaling the data and
  * RoBERTa (Liu+ 2019) trains BERT longer on more data
  * we show that mBERT and XLM are undertuned
    * cleaned CommonCrawls (Wenzek+ 2019), which
      increase the amount of data for low-resource languages by two orders of m
  * Similar data has also been shown to be effective for learning high quality
    word embeddings in multiple languages (Grave+ 2018)
* massively multilingual machine translation models from large parallel corpora
  * high and low resource trade-off and the problem of capacity dilution
    (Johnson+ 2017; Tan+ 2019)
  * most similar to ours is Arivazhagan+ (2019),
    a single model in 103 languages trained on over 25 billion parallel sentenc
  * encoder of a massively multilingual machine translation system obtains
    similar results to mBERT on cross-lingual NLI (Siddhant+ 2019)

# 3 Model and Data

* In this section, we present the training objective, languages, and data we use
* We follow the XLM approach (Lample and Conneau, 2019) as closely as possible

## Masked Language Models

* We use a Transformer model (Vaswani+ 2017) trained with the
  multilingual MLM objective (Devlin+ 2018; Lample and Conneau, 2019) using
  only monolingual data
  We sample streams of text from each language and train the model to predict
  the masked tokens in the input
* subword tokenization directly on raw text data using Sentence Piece (Kudo and
  Richardson, 2018) with a unigram language model (Kudo, 2018) We sample
* batches from different languages using the same sampling distribution as
  Lample and Conneau (2019), but with α = 0.3. Unlike Lample and Conneau
* not use language embeddings, which allows our model to better deal with
  code-switching We use a
* large vocabulary size of 250K with a full softmax and train
  * two different models: XLM-R Base (L = 12, H = 768, A = 12, 270M params) and
    XLM-R (L = 24, H = 1024, A = 16, 550M params). For all of our
* ablation studies, we use a BERT Base architecture with a vocabulary of 150K
  tokens

## Scaling to a hundred languages. XLM-R is trained on 100 languages; we

* languages and associated statistics in Appendix A.  Figure 1 specifies the
  iso codes of 88 languages that are shared across XLM-R and XLM-100, the model
  from Lample and Conneau (2019) trained on Wikipedia text in 100 languages
* we replace some languages with more commonly used ones such as
  * romanized Hindi and traditional Chinese
  * ablation studies on the 7 languages for which we have classification and
    sequence labeling evaluation benchmarks: en fr de ru zh sw ur
    * a suitable range of language families and includes low-resource languages
  * larger sets of 15, 30, 60 and all 100 languages
    * high-resource = average of English and French results
    * by low-resource, we refer to the average of Swahili and Urdu results

## Scaling the Amount of Training Data

* Following Wenzek+ (2019), we build a clean CommonCrawl Corpus in 100 langs
* internal language identification model in combination with the one from
  fastText (Joulin+ 2017)
* one CommonCrawl dump for English and twelve dumps for all other languages
  * significantly increases dataset sizes, especially for e.g. Burmese and Swah
* monolingual Wikipedia corpora are too small to enable unsupervised represent
  * As we show in Section 5.3
* few hundred MiB of text data is usually a minimal size for learning a BERT

# 4 Evaluation

## Cross-lingual Natural Language Inference (XNLI)

* 15 languages, and a ground-truth English training set. The
* training set has been machine-translated to the remaining 14 languages,
  providing synthetic training data for these languages as well
* We evaluate our model on cross-lingual transfer from English to other
  languages.  We also consider
* three machine translation baselines:
  * translate-test: dev and test sets are machine-translated to English and a
  * translate-train (per-language):
    the English training set is machine-translated to each language and we
    fine-tune a multiligual model on each training set
  * translate-train-all (multi-language): we fine-tune a multilingual model on
    the concatenation of all training sets from translate-train
    * For the translations, we use the official data provided by the XNLI proj

## Named Entity Recognition

* CoNLL-2002 (Sang, 2002) and CoNLL2003 (Tjong Kim Sang and De Meulder, 2003)
* English, Dutch, Spanish and German
* We fine-tune multilingual models either on
  * the English set to evaluate cross-lingual transfer,
  * each set to evaluate per-language performance, or
  * all sets to evaluate multilingual learning
* We report the F1 score, and
  compare to baselines from Lample+ (2016) and Akbik+ (2018)

## Cross-lingual Question Answering: the MLQA benchmark from Lewis+ (2019),

* extends the English SQuAD benchmark to
  Spanish, German, Arabic, Hindi, Vietnamese and Chinese
* We report the F1 score as well as the exact match (EM) score for cross-ling

## GLUE Benchmark (Wang+ 2018), we evaluate the English performance

* GLUE multiple classification tasks, such as
  MNLI (Williams+ 2017), SST-2 (Socher+ 2013), or QNLI (Rajpurkar+ 2018)
* We use BERT Large and RoBERTa as baselines

# 5 Analysis and Results of multilingual masked language models 4

1. most of the analysis on XNLI, which we found to be representative
2. results of XLM-R on cross-lingual understanding and GLUE
3. compare multilingual and monolingual models
4. results on low-resource languages

## 5.1 Improving and Understanding Multilingual Masked Language Models

* work done on understanding the crosslingual effectiveness of mBERT or XLM
  (Pires+ 2019; Wu and Dredze, 2019; Lewis+ 2019) has focused on
  * analyzing the performance of fixed pretrained models on downstream tasks
* we present a comprehensive study of different factors that are important to
  * trade-offs and limitations of these models as we scale to one hundred langs

### Transfer-dilution trade-off and Curse of Multilinguality

* Model capacity is constrained by memory and speed during training and inf
* per-language capacity decreases as we increase the number of languages
  * low-resource language performance can be improved by adding
    similar higher-resource languages
  * overall downstream performance suffers from this capacity dilution
    (Arivazhagan+ 2019)
* Figure 2, which shows XNLI performance vs the number of languages
  * from 7 to 15 ... improves performance, especially on low resource
  * Beyond this point ... degrades performance across all languages
  * same trend can be observed for models trained on the larger CommonCrawl
* issue is even more prominent when the capacity of the model is small
  * we pretrain models on Wikipedia Data in 7, 30 and 100 languages
  * As we add more languages, we make the Transformer wider
    by increasing the hidden size from 768 to 960 to 1152
  * Figure 4: added capacity allows XLM-30 to be on par with XLM-7, thus
  * The added capacity for XLM-100, however, is not enough and it still lags
    behind due to higher vocabulary dilution
    (recall from Sec 3 that we used a fixed vocab size of 150K for all models)

### High-resource/Low-resource trade-off

* allocation of the model capacity across languages is controlled by
  * training set size, the
  * size of the shared subword vocabulary, and the
  * rate at which we sample training examples from each language
* We study the effect of sampling on the performance of
  high-resource (English and French) and low-resource (Swahili and Urdu)
  languages for an XLM-100 model trained on Wikipedia
  * similar trend for the construction of the subword vocab
  * varying the α parameter which controls the exponential smoothing of the
    language sampling rate. Similar to Lample and Conneau (2019), we use a
    * sampling rate proportional to the number of sentences in each corpus
    * higher values of α see batches of high-resource languages more often
    * overall: in performance, we found 0.3 to be an optimal value for α

### Importance of Capacity and Vocabulary Size 5

* scaling the size of the shared vocabulary (the vocabulary capacity) can
  improve the performance of multilingual models on downstream tasks
* we train XLM-100 models on Wikipedia data with different vocabulary sizes
  * We keep the overall number of parameters constant by adjusting the width
* Figure 6
  * fixed capacity, we observe a 2.8% increase in XNLI average accuracy as we
    increase the vocabulary size from 32K to 256K
* i.e. multilingual models can benefit from allocating a higher proportion of
  the parameters to the embedding layer
* With bigger models, we believe that using a vocabulary of up to 2 million
  tokens with an adaptive softmax (Grave+ 2017; Baevski and Auli, 2018) should
  improve performance even further, but we leave this exploration to future
* we use a vocabulary of 250k for XLM-R
* same transformer architecture (BERT Base) but with different vocabulary
  * more than 3% gains in overall accuracy on XNLI
    by simply increasing the vocab size from 128k to 512k

### Importance of large-scale training with more data 6

* Figure 1, the Common-Crawl Corpus that we collected has significantly more
  monolingual data than the previously used Wikipedia corpora
* Figure 3 shows significantly better performance for the same BERT Base
* training MLMs longer: Liu+ (2019) also showed the benefits of
  * we observed similar effects of large-scale training, such as increasing
    batch size (see Figure 7) and training time, on model performance
  * multilingual MLM in Lample and Conneau (2019) undertuned because of
    * validation perplexity as a stopping criterion for pretraining caused the
* we were able to improve the performance of Lample and Conneau (2019)
  from 71.3% to more than 75% average accuracy on XNLI, which was
  on par with their supervised translation language modeling (TLM) objective
  * given our focus on unsupervised learning, we decided to not use the TLM obj

### Simplifying multilingual tokenization with Sentence Piece

* different language-specific tokenization tools used by mBERT and XLM-100
  * make these models more difficult to use on raw text
  * we train a Sentence Piece model (SPM) and apply it directly on raw text
  * no loss in performance
    compared to language-specific preprocessing and byte-pair encoding (fg 7)

## 5.2 Cross-lingual Understanding Results 6

### XNLI

* Table 1 shows XNLI results and adds some additional details:
  * number of models the approach induces (#M),
  * data on which the model was trained (D), and
  * number of languages the model was pretrained on (#lg). As we show in our
    results, these parameters significantly impact performance. Column #M
  * whether model selection was done separately on the dev set
    * of each language (N models), or on the
      * not fully zero-shot transfer
      * but in real applications, a small amount of supervised data is often
        available for validation in each language
    * joint dev set of all the languages (single model).  We observe a
    * overall accuracy going from 71.3 to 70.7. We encourage the community to
* new SOTA on XNLI. On
  * cross-lingual transfer, XLM-R obtains 80.1% accuracy > XLM-100 and mBERT
  * Swahili and Urdu: XLM-R outperforms XLM-100 by 13.8% and 9.3%, and
                                        mBERT by 21.6% and 13.7%.  While
  * many langs: outperforms the former SOTA
    Unicoder (Huang+ 2019) and XLM (MLM+TLM),
    * which handle only 15 languages, by 4.7% and 5% average accuracy
    * XLM-R handles 100 languages
* Using the multilingual training of translate-train-all,
  XLM-R further improves performance and reaches 82.4% accuracy, a
  new overall SOTA for XNLI, outperforming Unicoder by 3.9%. Multilingual
  * similar to having training sets in various languages for the same task
  * can be seen as some form of cross-lingual data augmentation (Singh+ 2019),
    similar to back-translation (Xie+ 2019)

### Named Entity Recognition

* Table 2, we report results of XLM-R and mBERT on CoNLL2002 and CoNLL-2003. We
  * basel
    * LSTM + CRF approach from Lample+ (2016) and the
    * Flair model from Akbik+ (2018) as baselines. We evaluate the performance
* three different settings: train on
  * English data only (en)
  * data in target language (each)
  * data in all languages (all). Results of mBERT are reported from Wu and
* we do not use a linear-chain CRF on top of XLM-R and mBERT representations,
* XLM-R model still performs on par with the SOTA,
  outperforming Akbik+ (2018) on Dutch by 2.84 points. On this task, XLM-R also
* average for cross-lingual transfer: outperforms mBERT by 2.1 F1 and
  1.86 F1 when trained on each language
  Training on all languages leads to an average F1 score of 89.18%,
  outperforming cross-lingual transfer approach by more than 8.5%

### Question Answering 7

* new SOTA results on the MLQA cross-lingual QA benchmark Lewis+ (2019). We
  follow their procedure by training on the English training data and
  evaluating on the 7 languages of the dataset. We report results in Table 3
* XLM-R obtains F1 and accuracy scores of 70.0% and 52.2% while the
  previous SOTA was 61.6% and 43.5%. XLM-R also
  outperforms mBERT by 12.3% F1-score and 10.6% accuracy.  It even
  outperforms BERT-Large on English, confirming its strong monolingual perform

## 5.3 Multilingual versus Monolingual 7

* we present results of multilingual XLM models against monolingual BERT models

### GLUE: XLM-R versus RoBERTa i.e. monolingual

* Our goal ... both, cross-lingual understanding tasks as well as monolingual
* Table 4, that XLM-R obtains better average dev performance than BERT Large
  * on par with XLNet Large
  * RoBERTa model outperforms XLM-R by only 1.3% on average

### XNLI: XLM versus BERT

* recurrent criticism against multilingual model is that they obtain
  worse performance than their monolingual counterparts
* we provide the first comprehensive study to assess this claim on XNLI
* 7 languages and compare performance in Table 5
* We train 14 monolingual BERT models on Wikipedia and CommonCrawl, and
  two XLM-7 models
* We add slightly more capacity in the vocabulary size of the multilingual
  model for a better comparison
* backed by further study on internal benchmarks
* multilingual models can outperform their monolingual BERT counterparts
* Table 5, we show that for cross-lingual transfer, monolingual baselines
  outperform XLM-7 for both Wikipedia and CC by 1.6% and 1.3% average accuracy
  However, by making use of multilingual training (translate-train-all) and
  leveraging training sets coming from multiple languages, XLM-7 can outperform
  the BERT models: our XLM-7 trained on CC obtains 80.0% average accuracy on
  the 7 languages, while the average performance of monolingual BERT models
  trained on CC is 77.5%

## 5.4 Representation Learning for Low-resource Languages 8

* Table 5: pretraining on Wikipedia for Swahili and Urdu performed similarly to
  a randomly initialized model; most likely due to the small size of the data
* pretraining on CC improved performance by up to 10 points
  * confirms our assumption that mBERT and XLM-100 rely heavily on cross-lingual
    transfer but do not model the low-resource languages as well as XLM-R
  * in the translate-train-all setting: the biggest gains for XLM models trained
    on CC, compared to their Wikipedia counterparts, are on low-resource
    languages; 7% and 4.8% improvement on Swahili and Urdu respectively

# 6 Conclusion 9
