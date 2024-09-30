EASE: Entity-Aware Contrastive Learning of Sentence Embedding
Sosuke Nishikawa, Ryokan Ri, Ikuya Yamada, Yoshimasa Tsuruoka, Isao Echizen
arXiv:2205.04260 [cs.CL] NAACL 2022

source code, pre-trained models, and newly constructed multilingual STC dataset

# Abstract

* We present EASE, a novel method for learning sentence embeddings via
  contrastive learning between sentences and their related entities
* The advantage of using entity supervision is twofold:
  * entities have been shown to be a strong indicator of text semantics and
    thus should provide rich training signals for sentence embeddings;
  * entities are defined independently of languages and thus offer
    useful cross-lingual alignment supervision
* We evaluate EASE against other unsup models both in monolingual and multiling
  * competitive or better performance in English
    semantic textual similarity (STS) and short text clustering (STC) tasks
  * significantly outperforms baseline methods in multilingual settings on a
    variety of tasks

# 1 Intro

* The current dominant approach to learning sentence embeddings is
  fine-tuning general-purpose pretrained LMs, eg BERT (Devlin+ 2019)
  * supervision can be
    * natural language inference data (Reimers and Gurevych, 2019),
    * adjacent sentences (Yang+ 2021)
    * parallel corpus for multilingual models (Feng+ 2020)
* we explore supervision by entity hyperlink annotations from Wikipedia
  * Their advantage is twofold:
    * entities have been shown to be a strong indicator of text semantics
      (Gabrilovich and Markovitch, 2007; Yamada+ 2017, 2018; Ling+ 2020) and
      * rich training signals for sentence embeddings;
    * entities are defined independently of languages and thus offer a useful
      cross-lingual alignment supervision
      (Calixto+ 2021; Nishikawa+ 2021; Jian+ 2022; Ri+ 2022)
    * no need for a parallel resource to train well-aligned multilingual
      sentence embeddings, especially for low-resource languages
* we present EASE (Entity-Aware contrastive learning of Sentence Embeddings),
  * high-quality sentence embeddings in both monolingual and multiling settings
  * sentences are embedded in the neighborhood of their hyperlink entity embeds
    and kept apart from irrelevant entities
  * shared entity embeddings across languages for multilingual models to
    facilitate cross-lingual alignment of the representation
* ie two types of objectives:
  * our novel entity contrastive learning (CL) loss
    between sentences and their related entities (Figure 1);
    * pulls the embeddings of sentences and their related entities close while
      keeping unrelated entities apart
    * expected to arrange the sentence embeddings
      in accordance with semantics capturedby the entities
  * the self-supervised CL loss with dropout noise
* hard negatives
  * To further exploit the knowledge in Wikipedia and improve the embeddings,
  * a method for mining hard negatives based on the entity type
* self-supervised CL objective with dropout noise (Gao+ 2021; Liu+ 2021), is
  combined with the first one to enable sentence embeddings to capture
  fine-grained text semantics
* We evaluate our model against other SOTA unsupervised sentence embedding
  * competitive or better performance
    on semantic textual similarity (STS) and short text clustering (STC) tasks
  * multilingual settings
* new dataset for the high-level semantics of multilingual sentence embeddings,
  * MewsC-16 (Multilingual Short Text Clustering Dataset for News in 16 langs)
* Multilingual EASE is trained using the entity embeddings shared across langs
  * significantly outperforms the baselines in multilingual STS, STC,
    parallel sentence matching, and cross-lingual document classification tasks
* further demonstrate the effectiveness of the multilingual entity CL
  in a more realistic scenario for low-resource languages
  * we fine-tune a competitive multilingual sentence embedding model, LaBSE
    (Feng+ 2020) using multilingual entity CL,, and show that the tuning
  * improves the performance of parallel sentence matching
    for low-resource languages under-supported by the model
* we analyze the EASE model by studying
  * ablated models and the
  * multilingual properties of the sentence embeddings to shed light

# 2 Related Work

## 2.1 Sentence Embeddings

* represent the meaning of sentences in the form of a dense vector
* Paragraph Vector (Le and Mikolov, 2014)
  * sentence embeddings are trained to predict words within the text
* various kinds of training tasks
  * reconstructing or predicting adjacent sentences
    (Kiros+ 2015; Logeswaran and Lee, 2018)
  * natural language inference (NLI, Conneau+ 2017)
* general-purpose pretrained language models such as BERT (Devlin+ 2019)
  * common to fine-tune pretrained models to produce high-qual sentence embeds
  * revisiting the aforementioned supervision signals
    (Reimers and Gurevych, 2019; Yang+ 2021)
  * self-supervised objectives based on contrastive learning (CL)
  * we present a CL objective with entity-based supervision. We train our
    EASE model with entity CL together with self-supervised CL with dropout
    noise and show that the entity CL improves the quality of sentence embeds

### Contrastive learning

* idea: pull semantically similar samples close and
  keep dissimilar samples apart (Hadsell+ 2006)
* for sentence embeddings, CL can be classified by the type of positive pairs
  * entailment pairs as positive pairs in NLI datasets (Gao+ 2021; Zhang+ 2021)
* self-supervised methods involve generating positive pairs using
  data augmentation techniques, including
  * discrete operations such as word deletion and shuffling
    (Yan+ 2021; Meng+ 2021)
  * back-translation (Fang+ 2020),
  * intermediate BERT hidden representations (Kim+ 2021), and
  * dropout noise within transformer layers (Gao+ 2021; Liu+ 2021)
  * Contrastive tension (CT)-BERT (Carlsson+ 2021) regards as positive pairs
    the outputs of the same sentence from two individual encoders
  * DeCLUTR (Giorgi+ 2021) uses different spans of the same document
  * our method performs CL between sentences and their associated entities

### Multilingual sentence embeddings

* capture semantics across multiple languages
* Early competitive methods: typically sequence-to-sequence objective
  with parallel corpora to learn multilingual sentence embeddings
  (Schwenk and Douze, 2017; Artetxe and Schwenk, 2019); recently
* fine-tuned multilingual pretrained models have achieved SOTA performance
  (Feng+ 2020; Goswami+ 2021)
* hE they need rich parallel or semantically related sentence pairs, which are
  not necessarily easy to obtain
* we explore the utility of Wikipedia entity annotations: over 300 languages

## 2.2 Learning Representations Using Entity-based Supervision

* Entities have been conventionally used to model text semantics
  (Gabrilovich and Markovitch, 2007, 2006)
* by predicting entities from their relevant text (Yamada+ 2017) or
  entity-masked sentences (Ling+ 2020)
* from the conclusion
  * entity annotations can be used as anchors to learn cross-lingual reprs
    (Calixto+ 2021; Nishikawa+ 2021; Jian+ 2022; Ri+ 2022), and our work is

# 4 Experiment: Monolingual 4

* We first fine-tune monolingual pre-trained LMS using only English Wikipedia

## 4.1. Setup

* we train sentence embedding models from pre-trained checkpoints of
  BERT (Devlin+ 2019) or RoBERTa (Liu+ 2019) and take
  the [CLS] representation as the sentence embedding
  * We add a linear layer after the output sentence embeddings only during
    training, as in Gao+ (2021)
* We compare our method with
  * unsupervised sentence embedding methods
    * average GloVe embeddings (Pennington+ 2014)
    * average embeddings of vanilla BERT or RoBERTa, and
  * previous SOTA approaches such as
    * SimCSE (Gao+ 2021)
    * CT (Carlsson+ 2021)
    * DeCLUTR (Giorgi+ 2021)
* two tasks: 7 STS tasks and 8 STC tasks
  * supposed to measure the degree of sentence embeddings capturing
    fine-grained and broad semantic structures

### Semantic textual similarity

* measure of the capability of capturing graded similarity of sentences
* seven monolingual STS tasks
  * STS 2012-2016 (Agirre+ 2012, 2013, 2014, 2015, 2016)
  * STS Benchmark (Cer+ 2017)
  * SICK-Relatedness (Marelli+ 2014)
* Following the settings of Reimers and Gurevych (2019), we calculate
  Spearman’s rank correlation coefficient between the cosine similarity of the
  sentence embeddings and the ground truth similarity scores

### Short text clustering

* measure the ability to capture categorical semantic structure, ie to
  map sentences from the same categories close together and
  those from different categories far apart (Zhang+ 2021)
* eight benchmark datasets for STC (Zhang+ 2021) to investigate how well our
  method can encode high-level categorical structures into sentence embeddings
  * short sentences, ranging from 6 to 28 average words in length, from a
  * domains such as news, biomedical, and social network service (Twitter)
* We cluster the sentence embeddings using K-Means (MacQueen, 1967) and compute
  * clustering accuracy using the Hungarian algorithm (Munkres, 1957)
  * averaged over three independent runs

## 4.2 Results

* Table 1 shows the evaluation results for the seven STS and eight STC tasks
* Overall, our EASE methods
  significantly improve the performance of the base models (ie BERT and
  RoBERTa), and
  on average outperform the previous SOTA methods on all tasks except STC with
  the RoBERTa backbone
* The most significant improvement is observed for EASE-BERT, with an
  average improvement of 61.6% to 63.1% over the previous best result for STC

# 5 Experiment: Multilingual

* we fine-tune multilingual pre-trained language models
  using Wikipedia data in multiple languages

## 5.1 Setup

* We sample 50,000 pairs for each language and use them together as training
  data from the entity-sentence paired data in 18 languages
  * 18 languages  present in both the MewsC-16 dataset (see Section 5.2) and
    the extended version of STS 2017
    (ar, ca, cs, de, en, eo, es, fa, fr, it, ja, ko, nl, pl, pt, ru, sv, tr)
* primary baseline model: SimCSE model trained using the same multilingual data
  as EASE (ie sentences in entity-sentence paired data)
  * Tianyu Gao, Xingcheng Yao, and Danqi Chen
    SimCSE: Simple contrastive learning of sentence embeddings
    EMNLP 2021
* pre-trained checkpoints of mBERT or XLM-R (Conneau+ 2020) and take
  * mean pooling to obtain sentence embeddings for both training and evaluation
    * also tested other pooling methods, but mean pooling was the best in this

## 5.2 Multilingual STS and STC

* We evaluate our method using the
  * extended version of the STS 2017 dataset (Reimers and Gurevych, 2020)
    * annotated sentences for ten language pairs: EN-EN, AR-AR, ES-ES, EN-AR,
      EN-DE, EN-TR, EN-ES, EN-FR, EN-IT, and ENNL
    * Spearman’s rank correlation as in Section 4.1
  * also on our newly introduced multilingual STC dataset described as follows:

### MewsC-16 (Multilingual Short Text Clustering Dataset for News in 16 langs)

* To evaluate the ability of sentence embeddings to encode
  high-level categorical concepts in a multilingual setting
* constructed MewsC-16 from Wikinews
* topic sentences from Wikinews articles in 13 categories and 16 languages
  * More detailed information is available in Appendix E
* clustering and accuracy computation for each language as in Section 4.1
* Tables 2 and 3 show the results of our multilingual STS and STC experiments
  * Overall, EASE substantially outperforms the corresponding base models (ie
    mBERT and XLM-R) on both tasks.  Similar to the results for the monolingual
  * average performance of EASE exceeds that of SimCSE for multilingual STC
    tasks with an
    improvement of 34.1% to 36.0% for mBERT and 31.8% to 35.4% for XLM-R. This
  * ie even in a multilingual setting, EASE encodes high-level categ sem struct
  * significantly outperforms SimCSE in multilingual STS tasks Specifically,
    * EASE-mBERT is better than that of SimCSE-mBERT (50.9 vs 57.2), and that
    * EASE-XLM-R is better than that of SimCSE-XLM-R (54.1 vs 57.1)
    * much more significant than the monolingual setting (Table 1), where the
    * ie effectiveness of language-independent entities as cross-lingual alignm

## 5.3 Cross-lingual Parallel Matching 6

* We evaluate EASE on the Tatoeba dataset (Artetxe and Schwenk, 2019) to assess
  more directly its ability to capture cross-lingual semantics
  * task is to retrieve the correct target sentence for each query sentence,
    given a set of parallel sentences
  * We perform the retrieval using the cosine similarity scores of the sentence
  * For each language-pair dataset, we compute the retrieval accuracy averaged
    over the forward and backward directions (English <-> target language)
* Table 4 shows the evaluation results for the languages in the CL training dat
  * EASE significantly outperforms the corresponding base models and SimCSE for
    all languages
  * the mean performance of EASE-mBERT is better than that of vanilla mBERT by
    13.5 percentage points. This indicates that EASE can capture cross-lingual
  * the performance of SimCSEmBERT is worse than that of vanilla mBERT. We
    conjecture that this is because the SimCSE model is trained using only the
    positive sentence pairs within the same language, which sometimes leads to
    less language-neutral representations
* languages not included in the EASE training set (Table 5)
  * EASE performs robustly on these languages as well, which suggests that, in
  * ie crosslingual alignment effect propagates to other languages not used in
    additional training with EASE (Kvapilíková+ 2020)
  * Ivana Kvapilíková, Mikel Artetxe, Gorka Labaka, Eneko Agirre, Ondřej Bojar
    Unsupervised multilingual sentence embeddings for parallel corpus mining
    ACL 2020 Student Research Workshop

## 5.4 Cross-lingual Zero-shot Transfer 7

* For evaluation in this setting, we use MLDoc (Schwenk and Li, 2018), a
  cross-lingual document classification dataset that
  classifies news articles in eight languages into four categories
* We train a linear classifier using sentence embeddings as input features on
  the English training data, and
  * evaluate the resulting classifier in the remaining languages. To directly
  * not update the parameters of the sentence encoder
* The detailed settings are shown in Appendix D
* As shown in Table 6, our EASE models achieve the best average performance
  on both back-bones

## 6 Case Study: Fine-tuning Supervised Model with EASE 7

* multiling sentence representation models trained on a large parallel corpus
  * hE languages that are not included in the training data
  * EASE requires only the Wikipedia text corpus, which is available in > 300
* complement the performance of existing models in low-resource languages by
  exploiting the Wikipedia data in those languages
* To test this possibility, we fine-tune LaBSE (Feng+ 2020), which is
  * LaBSE is trained on both monolingual and bilingual data in 109 languages,
  * fine-tuning with our EASE framework in five low-resource languages
    (kab, pam, cor, tr, mhr). These languages are not present in the original
  * We fine-tune the model using 5,000 pairs each from English and the language
* Figure 2: EASE improves the performance of LaBSE across all target languages,
  * intriguing result considering that LaBSE has already been trained on about
    six billion parallel corpora. These results suggest the potential benefit
    of combining EASE with other models using parallel corpora, especially for
    languages without or with only a few parallel corpora

# 7 Analysis

## 7.1 Ablation Study

* We measure the performance of the models using monolingual STS in the
  monolingual setting and multilingual STS in the multilingual setting,
  without one of the following components:
  the self-supervised CL loss, hard negatives, and Wikipedia2Vec init (Table 7)
* all of the components make an important contribution to the performance
* entity CL alone (ie w/o self-supervised CL) also improves the baseline
  performance significantly
  * multilingual setting are particularly significant
    (49.3 for mBERT and 53.1 for XLM-R) and
    comparable to those for the SimCSE models
    * ie by itself is effective in learning multilingual sentence embeddings

## 7.2 Alignment and Uniformity

* we evaluate two key properties to measure the quality of the reprs obtained
  from contrastive learning (Wang and Isola, 2020):
  * alignment measures the closeness of representations between positive pairs;
  * uniformity measures how well the representations are uniformly distributed
* We compute these metrics using
  * en: BERT-based models on the STS-B development set data
  * multilingual: mBERT-based models on the multilingual STS data used in the
* We compute the averages of alignment and uniformity for each language pair
  * For each setting, we take STS pairs with a score higher than 4 in the
    0-to-5 scale as p pos and all STS sentences as p data
* Figure 3, the trends are similar in both settings:
  * both EASE and SimCSE significantly improve uniformity compared to vanilla
  * EASE is
    inferior to SimCSE in terms of uniformity and
    superior in terms of alignment
  * entity CL does (not) have the effect of
    * not biasing embeddings towards a more uniform distribution
    * aligning semantically similar samples, which leads to the improved perf

## 7.3 Qualitative analysis

* comparing the results of EASE and SimCSE on STS Benchmark
* Table 8a shows typical cases of how EASE improves sentence embeddings
* EASE embeddings are more robust to synonyms and grammatical differences
  since they are more aware of the topic similarity between sentences,
  resulting in more accurate score inference
* hE Table 8b, EASE embeddings are sometimes overly sensitive to topical sim,

# 8 Discussion and Conclusion 8

* Wikipedia as the training data may limit the application to specific domains
  (eg general or encyclopedia domains)
  * To apply EASE to other domains, one may need to annotate text from the
    domain either manually or automatically
* the supervision signal in EASE is inherently noisy
  * Different entities have different characteristics as a topic indicator, and
    sentences that contain the same entity do not necessarily share meaning
