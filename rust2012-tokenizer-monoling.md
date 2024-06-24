How Good is Your Tokenizer? On the Monolingual Performance of Multilingual LMs
Phillip Rust, Jonas Pfeiffer, Ivan Vulić, Sebastian Ruder, Iryna Gurevych
arXiv:2012.15613 [cs.CL]

# Abstract

* systematic empirical comparison of pretrained
  multilingual language models versus their monolingual counterparts
  with regard to their monolingual task performance. We study a set of
* nine typologically diverse languages with available pretrained monolingual
* five diverse monolingual downstream tasks
* We
  * establish if a gap between the multilingual and the corresponding
    monolingual representation of that language exists, and subsequently
  * investigate the reason for a performance difference
* To disentangle the impacting variables,
  we train new monolingual models on the same data, but with diff  tokenizers,
  both the monolingual and the multilingual version
* We find that while the
  * pretraining data size is an important factor, the
  * designated tokenizer of the monolingual model plays an equally important rol
  * languages which are adequately represented in the multilingual model's
    vocabulary exhibit negligible performance decreases over their monolingual
    counterparts. We further find that
  * replacing the original multilingual tokenizer with the specialized
    monolingual tokenizer improves the downstream performance of the
    multilingual model for almost every task and language

# 1 Introduction

* large Transformer-based language models (LMs; Vaswani+ 2017) pretrained for
  * English (eg BERT, RoBERTa, T5; Devlin+ 2019; Liu+ 2019; Raffel+ 2020)
  * monolingual language models have been introduced for other languages
    (Virtanen+ 2019; Antoun+ 2020; Martin+ 2020, inter alia), offering
    previously unmatched performance on virtually all NLP tasks.  ∗
* massively multilingual pretrained models with the same architectures and
  training procedures, but covering more than 100 languages in a single model,
  * multilingual BERT (mBERT), XLM-R, multilingual T5
    (Devlin+ 2019; Conneau+ 2020; Xue+ 2020)
* The “industry” of pretraining and releasing new monolingual BERT models
  * despite the fact that the corresponding languages are already covered by
  * justifying the need for monolingual variants is the
    assumption that multilingual models underperform monolingual models in
    monolingual tasks (Virtanen+ 2019; Antoun+ 2020; Rönnqvist+ 2019)
  * curse of multilinguality (Conneau+ 2020; i.e., the
    lack of capacity to represent all languages in an equitable way),
  * hE, little to no compelling empirical evidence with fair comparisons
  * only pointing to the positive results reported for other monolingual BERTs
    (de Vries+ 2019; Virtanen+ 2019; Antoun+ 2020)
* Monolingual BERT models are typically evaluated on downstream NLP tasks
  in comparison to previous monolingual models or mBERT
  (Virtanen+ 2019; Antoun+ 2020; Martin+ 2020), inter alia). While these results
  * show that certain monolingual models can outperform mBERT in certain tasks,
  * we hypothesize that this may substantially vary across different
    languages and language properties, tasks, pretrained models and their
    pretraining data, domain, and size
* an independent and controlled empirical comparison on a diverse set of
  languages and tasks is necessary .  While recent work
* prior work typically lacks either ~ diversity
  language (Rönnqvist+ 2019; Zhang+ 2020) or
  task (Wu and Dredze, 2020; Vulić+ 2020),
* has been argued that mBERT is under-trained
  (Rönnqvist+ 2019; Wu and Dredze, 2020), providing evidence of
  * improved performance when training a monolingual model on more data, it is
    unclear if this is the only important factor that improves the performance
* contributing factor might be the limited vocabulary of a multilingual model
  compared to the sum of tokens of all corresponding monolingual models.  This
  * whether dedicated (i.e., language-specific) tokenizers of monolingual models
    also play a critical role
* Contributions. In summary, our contributions are as follows
  * We systematically compare monolingual versus multilingual pretrained LMs
    * 9 typologically diverse languages on 5 structurally different tasks
  * We train new monolingual models on equally sized datasets but relying on
    different tokenizers (i.e., shared multilingual tokenizers versus dedicated
    language-specific ones)
    * to disentangle the impact of pretraining data size versus tokenization on
  * We isolate factors that contribute to performance difference (eg
    tokenizers’ “fertility”, the number of unseen (sub)words, data size) and
    provide an in-depth analysis of the impact of these important factors

# 2 Background and Related Work

## Multilingual LMs. The wide usage of pretrained multilingual Transformer-based

* multilingual BERT (Devlin+ 2019) which followed on the success of the
  monolingual English BERT model. mBERT adopted the same pretraining regime as
  monolingual BERT on concatenated Wikipedia data for 104 languages with the
  largest Wikipedias
  * Exponential smoothing was used when creating the subword vocabulary based on
    WordPieces (Wu+ 2016) and a pretraining corpus. By
  * oversampling underrepresented languages and undersampling overrepresented
    languages, the goal is to counteract the imbalance of pretraining data
  * mBERT vocabulary comprises a total of 119,547 subword tokens
* XLM-R (Conneau+ 2020) based on the monolingual RoBERTa model (which is also a
  variant of the original BERT model; Liu+ 2019)
* studies started analyzing mBERT’s and XLM-R’s capabilities and limitations,
  * work surprisingly well for cross-lingual tasks, despite the fact that they
    do not rely on any direct cross-lingual supervision (eg parallel or
    comparable data, translation dictionaries)
    (Pires+ 2019; Wu and Dredze, 2019; K+ 2020)
* limitations of the multilingual models
  * the curse of multilinguality,
    * Conneau+ (2020) observe that, for a fixed model capacity, adding new
      languages increases cross-lingual performance up to a certain point. After
      that point is reached, adding new languages deteriorates performance. This
    * can be attenuated by
      * increasing the capacity of the model (Artetxe+ 2020; Pfeiffer+ 2020c;
        Chau+ 2020) or through
      * additional training for particular language pairs (Pfeiffer+ 2020c;
        Ponti+ 2020). Another observation concerns
  * substantially reduced cross-lingual and monolingual abilities for low-rsrc
    i.e. with smaller pretraining data (Wu and Dredze, 2020; Lauscher+ 2020b)
    * still underrepresented in the
      subword vocabulary and the model’s shared representation space
      despite oversampling.  In general, these findings indicate that
  * it is (currently) not possible to represent (all) languages of the world in
    a single model

## Monolingual versus Multilingual LMs. New monolingual language-specific models

* Arabic (Antoun+ 2020), French (Martin+ 2020), Finnish (Virtanen+ 2019), Dutch
  (de Vries+ 2019), Italian (Polignano+ 2019), to name only a few
* Pyysalo+ (2020) released 44 monolingual WikiBERT models trained on Wikipedia
* how monolingual and multilingual BERTs compare across different languages
  * only a few studies have thus far, either explicitly or implicitly, attempted
  * Here, we briefly summarize previous attempts to understand these differences
* Nozza+ (2020) extracted task results from the respective papers on monolingual
  BERTs, and listed them on a dedicated webpage 1 to facilitate an overview of
  monolingual models, and their comparison to mBERT
  * hE, they simply copy the scores reported in the papers which were obtained
    under diverse experimental setups and training conditions: they have not
* Vulić+ (2020)
  * probed mBERT and monolingual BERT models across
    six typologically diverse languages (de, en, Chinese, ru, Finnish, Turkish)
    for lexical semantics
  * I Vulić, E Ponti, R Litschko, G Glavaš, and A Korhonen
    EMNLP 2020
    Probing pretrained language models for lexical semantics. In Proceedings of
  * pretrained monolingual BERT models encode significantly more lexical
    information than mBERT for a particular language, again hinting that mBERT
* Zhang+ (2020) investigated the role of pretraining data size with RoBERTa;
  * the model already learns most syntactic and semantic features from
    pretraining on the corpora spanning 10M–100M word tokens, but still
    requires massive datasets to encode higher-level semantic and commonsense
* closest to ours is:
  * Rönnqvist+ (2019) compared mBERT to monolingual BERT models for six langs
    (German, English, Swedish, Danish, Norwegian, Finnish) on
    three different tasks. They find that
  * mBERT lags behind its monolingual counterparts on cloze and generation
    * clear differences among the six languages in terms of this gap. For
    * gap is smaller for German than for Finnish
  * Accordingly, they speculate that mBERT is undertrained with respect to
    individual languages. One shortcoming of their evaluation is that their
  * set of tasks is limited, and their language sample is very narrow typologicl
* a careful, systematic study within a controlled experimental setup, a diverse
  language sample and set of tasks is still lacking

# 3 Controlled Experimental Setup

* We compare multilingual BERT with its monolingual counterparts in a spectrum
  of typologically diverse languages and across a variety of downstream tasks
  * isolating and analyzing crucial factors contributing to performance
    eg tokenizers and pretraining data, we conduct unbiased and fair compariso

## 3.1 Language and Task Selection

* languages: several (sometimes competing)
criteria:
* C1) typological diversity;
  * most high-resource languages belong to the same language families, thus
  * Neglecting typological diversity inevitably leads to poor generalizability
    and the induction of biases (Gerz+ 2018; Joshi+ 2020; Ponti+ 2019)
  * recent work in multilingual NLP which pays particular attention to
    typological diversity (Clark+ 2020; Hu+ 2020; Ponti+ 2020, inter alia),
  * we experiment with a language sample covering a broad spectrum of language
    properties
* C2) availability of pretrained monolingual BERT models;
* C3) representation of the languages in standard evaluation benchmarks for a
  sufficient number of tasks
  * tasks driven by lower-level syntactic and higher-level semantic features
    (Lauscher+ 2020b). Second, we also experiment with
  * different task fine-tuning regimes, see later in §3
* summarized:
  * nine languages from eight different language families, as listed in Table 1
  * five downstream NLP tasks: named entity recognition (NER), sentiment analy-
    sis (SA), question answering (QA), universal dependency parsing (UDP), and
    part-of-speech tagging (POS)

## 3.2 Task-Based Fine-Tuning

### Fine-Tuning Setup. We use the

* standard fine-tuning setup of Devlin+ (2019) for all tasks besides UDP: for
  that, we use a transformer-based variant (Glavaš and Vulić, 2020) of the
  standard deep biaffine attention dependency parser (Dozat and Manning, 2017)
* Besides full model fine-tuning, we also evaluate all models within a more
  efficient setup based on adapters
  (Rebuffi+ 2017; Houlsby+ 2019; Stickland and Murray, 2019; Pfeiffer+
  2020a,b,c,d; Lauscher+ 2020a; Rücklé+ 2020a,b, inter alia):
  * additional parameter sets that are fine-tuned while the original pretrained
    model is kept frozen
  * have been shown to perform well for cross-lingual transfer by training
    language-specific adapters (Pfeiffer+ 2020c,d),
  * we here evaluate whether they perform equally well in monolingual setups
* we distinguish between four different setups for each task:
  * fully fine-tune a monolingual BERT model;
  * fully fine-tune mBERT on the task;
  * inject a task adapter into mBERT, and fine-tune by updating the task adapter
    parameters (labeled +A Task henceforth);
  * inject both a dedicated language adapter available via AdapterHub (Pfeiffer+
    2020b), and a task adapter into mBERT, and then fine-tune by updating only
    the task adapter parameters (+A Lang, Task )
* three random initializations on the development set
  * On the test set, we report the results of the initialization that achieved
    the highest score on the development set

### Evaluation Measures. We report

* F 1 scores for NER, accuracy scores for SA and POS, unlabeled and labeled
  attachment scores (UAS & LAS) for UDP, and exact match and F 1 scores for QA

### Hyper-Parameters and Technical Details. We use

## 3.3 Initial results

* lang
  * largest performance gains of monolingual models: FI, TR, KO, and AR 
  * mBERT outperforms the IndoBERT ( ID ) model in all tasks but SA, and performs
  * competitively with the JA and ZH monolingual models on most datasets.  In gen-
* task
  * gap is particularly narrow for POS tagging, where all models score high >95%
  * ID aside, for UDP, with monolingual models out-performing fine-tuned mBERT
    * most notably for FI and TR, and
  * fully fine-tuned mBERT models, in turn, outperforming the adapter-based
* In what follows, we seek to understand the causes of this behaviour in
  relation to different factors such as used tokenizers, corpora sizes, as well
  as languages and tasks in consideration

# 4 Tokenizer vs. Corpus Size 5

## 4.1 Pretraining Corpus Size

* we compare how much data each monolingual model was trained on
  with the amount of data in the respective language that mBERT has seen. Given
  * mBERT was trained on entire Wikipedia dumps 8, we estimate the latter by
    the total number of words across all articles listed for each Wiki 9 
  * For the monolingual models, we extract information on pretraining data from
    the model documentation.  If no exact numbers are explicitly stated, and the
    pretraining corpora are unavailable to us, we make estimations based
* Figure 1. For
  * EN, JA, RU, and ZH, the two models were trained on similar amounts of
  * AR, ID, FI, KO, and TR monolingual models were trained
    from about twice ( KO) up to more than 40 times ( TR ) as much data

## 4.2 Tokenizer

* monolingual tokenizers are typically trained by native speaking experts aware
  of relevant linguistic phenomena exhibited by their target language. We thus
  inspect how this affects the tokenizations of monolingual data produced by our
  sample of monolingual models and mBERT
* We tokenize examples from Universal Dependencies (Nivre+ 2016, 2020) v2.6
  (Zeman+ 2020) treebanks (further details given in Appendix A.3) and compute
* two metrics (Ács, 2019). The first metric is the
1. subword fertility, measuring the average number of subwords
  produced per tokenized word
* Table 2
* mBERT has
  * similar fertility values as the monolingual for EN, ID, JA, ZH . In
  * much higher fertility for AR, FI, KO, RU, and TR, indicating that
  * lowest for EN, which is likely due to
    * mBERT having seen the most data in this language during training, as
    * English being a morphologically poor language in comparison to languages
  * JA model is the only monolingual one with a fertility higher than mBERT
    because the JA tokenizer is characterbased and thus by design produces a
    maximum number of word pieces
2. The second metric is the proportion of words in the corpus where the
   tokenized word is continued across at least two sub-tokens (denoted by)
  * Figure 3 show similar trends as with the fertility statistic
  * In addition to AR, FI, KO, RU, and TR, where there were already
    conspicuous differences in fertility, mBERT also produces a proportion of
    continued words more than twice as high as the monolingual model for ID 
* We discuss additional tokenization statistics, further highlighting the
  differences (or lack thereof) between the individual monolingual tokenizers
  and the mBERT tokenizer, in Appendix B.1

## 4.3 New Pretrained Models 7

* to disentangle the effects of these two factors,
  we pretrain new models for the languages that exhibited the largest discrepanc
  on Wikipedia data
  * AR, FI, ID, KO, and TR
* three model variants for each language. First, we train
  * two new monolingual BERT models on the same data,
    * one with the original monolingual tokenizer ( wiki-mono-mono ) and
      * to compare against the monolingual models trained on significantly more
        data but with the same tokenizer, we implicitly disentangle the effect
    * one with the mBERT tokenizer ( wiki-mono-mBERT ). 11 Additionally,
  * 3rd: we retrain the embedding layer of mBERT with the respective monolingual
    tokenizer ( wiki-mBERT-retrained )

# 5 Further Analysis

## 5.1 Qualitative Analysis

* When choosing a monolingual tokenizer that scores significantly lower in
  fertility and the proportion of continued words than the mBERT tokenizer
  (such as for AR, FI, ID, KO, TR ), performance gains can be made
  relatively consistently, irrespective of whether the models themselves are
  monolingual ( wiki-mono-mono versus wiki-mono-mbert ) or multilingual (
  wiki-mbert-retrained versus fully fine-tuned mBERT)
* Whenever the differences between monolingual models and mBERT
  with respect to the tokenizer (as measured by the fertility or prop of conted)
  and the pretraining corpus size are small, such as for EN, JA, and ZH, the
  performance gap is typically also small
  * In QA, we even find mBERT to be favorable for these languages. Therefore, we

## 5.2 Correlation Analysis

* correlation between the individual factors (pretraining data size, subword
  fertility, proportion of continued words) and the downstream performance
* not enough data points to be statistically representative, we argue that the
  correlation coefficient can still provide reasonable indications and reveal
  patterns in our results not immediately evident by looking at the tables
* Figure 4 shows that
  * both decreases in the proportion of continued words and the fertility
    correlate with an increase in downstream performance
    relative to fully fine-tuned mBERT across all tasks.  The
    * stronger for UDP and QA, where we find models with monolingual tokenizers
      to outperform their counterparts with the mBERT tokenizer consistently
    * weaker for NER and POS tagging, which is also expected, considering the
      inconsistency of the results. 14 Overall, we find that the
* fertility and the proportion of continued words have a similar effect on the
  monolingual downstream performance as the corpus size for pretraining.  This
  * the tokenizer plays an equal role as the amount of data a model sees

# 6 Conclusion 9

* performance gap in most but not all languages and tasks, further analysis
* gap is often significantly smaller than previously assumed and only
  exacerbated in certain languages by incorporating substantially more
  pretraining data and using more capable, monolingual tokenizers
* we have disentangled the effect of the pretrained
  corpus size from the tokenizers, in order to identify the importance of either
* We have trained new monolingual models on the same data but with two different
  tokenizers; one being the dedicated tokenizer of the monolingual model
  provided by native speakers; the other being the automatically generated
  multilingual mBERT tokenizer. We find that
  * for (almost) every task and language, the monolingual tokenizer outperforms
    the mBERT tokenizer, establishing that a
  * specialized vocabulary plays an equally important role on the downstream
    performance as the pretraining data set size
* more balancing of individual languages’ representations in the toker's vocab 
  (eg by merging monolingual vocabularies) can
  close the gap between monolingual and multilingual models
  in cases where the tokenizer currently makes the difference

# Appendix 15

# B Further Analyses and Discussions 19

## B.1 Tokenization Analysis

* In our tokenization analysis in §4.2 of the main text, we only include the
  fertility and the proportion of continued words as they are sufficient to
  illustrate and quantify the differences between tokenizers. In support of the
  findings in §4.2 and for completeness, we provide additional tokenization
  statistics here

* Table 9: vocabulary size and the proportion of its vocabulary also contained
  in mBERT. It shows that the tokenizers scoring lower in fertility (and
  accordingly performing better) than mBERT are often not adequately covered by
  mBERT’s vocabulary. For instance, only 5.6% of the AraBERT ( AR ) vocabulary
  is covered by mBERT

* Figure 5: proportion of unknown tokens ( [UNK] ) in the tokenized data. It
  shows that the proportion is generally extremely low, i.e., the tokenizers can
  typically split unknown words into known subwords

* Similar to the work by Ács (2019), the Figures 6 and 7 compare the
  tokenizations produced by the monolingual models and mBERT with the reference
  tokenizations provided by the human dataset annotators with respect to their
  sentence lengths
* the tokenizers scoring low in fertility and the proportion of continued words
  typically exhibit sentence length distributions much closer to the reference
  tokenizations by human UD annotators, indicating they are more capable than
  the mBERT tokenizer. Likewise, the monolingual models’ and mBERT’s sentence
  length distributions are closer for languages with similar fertility and
  proportion of continued words, such as EN, JA, and ZH 

## B.2 Correlation Analysis 20

* the tokenizer metrics seem to be more indicative of high downstream
  performance than the size of the pretraining corpus. We believe that this
  * in parts due to the overall poor performance of the uncased IndoBERT model,
    which we unfairly compare to our cased id-wiki-mono-mono model.  Therefore,
  * we plot the same correlation matrix excluding ID in Figure 4
    * overall correlations for the
      * proportion of continued words and the fertility remain mostly unaffected
      * pretraining corpus size becomes much stronger, confirming that the
        subpar performance of IndoBERT is, in fact, an outlier in this scenario
    * strengthens the indication that the performance in POS tagging correlates
      more with the data size than with the tokenizer, although we argue that
      * misleading: gap is generally very minor in POS tagging. Therefore, the
        Spearman correlation coefficient, which only takes the rank into
* correlation between the three metrics and the downstream performance
  under consideration of all languages and models, including the adapter-based
  fine-tuning settings, to gain an understanding of how pronounced their effects
  are in a more ”noisy” setting
  * the three factors still correlate with the downstream performance in a
    similar manner even when not isolated. This correlation tells us that
  * i.e. even when there may be other factors that could have an influence,
    these three factors are still highly indicative of the downstream performanc
* the correlation coefficients for the proportion of continued words and the
  fertility are nearly identical, which is
  * expected based on the visual similarity of the respective plots (Figs 2 & 3)

## B.3 Effectiveness of Adapter-Based Fine-Tuning 20
