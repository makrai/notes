MLSUM: The Multilingual Summarization Corpus
Th Scialom, P Dray, S Lamprier, B Piwowarski, J Staiano
arXiv:2004.14900 [cs.CL]

* Obtained from online newspapers, it contains 1.5M+ article/summary pairs
  * 5 languages -namely, French, German, Spanish, Russian, Turkish
  * Together with English newspapers from the popular CNN/Daily mail dataset,
* cross-lingual comparative analyses based on SOTA systems
* highlight existing biases which motivate the use of a multi-lingual dataset
* strong baselines from multilingual abstractive text generation models;
* cross-lingual analysis of the results obtained by different approaches

# 1 Intro

* summarization task requires several complex language abilities:
  * understand, discriminate what is relevant, and write a short synthesis
* Over the last few years, rising popularity of this task
  (See+ 2017; Kryściński+ 2018; Scialom+ 2019)
* transfer learning techniques
  enabled by the availability of pre-trained multilingual language models
  * the de-facto paradigm in NLP (Guzmán+ 2019)
  1. LM pre-trained on a large corpus of texts in multiple languages
  2. model fine-tuned in one or more pivot languages
    for which the task-specific data are available
  3. inference: model applied to the different pre-training languages seen
* significant performance gap between English and the target language, e.g. for
  classification (Conneau+ 2018) and
  * Question Answering (Lewis+ 2019) tasks. A similar
  * summarization (Chi+ 2019) obtaining, again, a lower performance than for
* For specific NLP tasks, evaluation datasets in several target languages,
  allowing to evaluate the progress of the field in zero-shot scenarios
* future work, we plan to add
  * other languages including Arabic and Hindi, and to
  * adaptation of neural metrics to multilingual summarization

# 2 Related Work 2

## 2.1 Multilingual Text Summarization

* Radev+ (2002) developed MEAD, a multi-document summarizer: English, Chinese
* Litvak+ (2010): genetic algorithm
* A community-driven initiative, MultiLing (Giannakopoulos+ 2015), benchmarked
  summarization systems on multilingual data. While the
  * 40 languages, it provides relatively few examples (10k in the 2019 release)
    Mostly extractive approach given the
* lack of a multilingual corpus to train abstractive models (Duan+ 2019)
* recently, with the rapid progress in automatic translation and generation,
  abstractive methods for multilingual summarization have been developed
  * Ouyang+ (2019): three low-resource languages (Somali, Swahili, & Tagalog),
    by using an automated translation of the New York Times dataset..  Although
  * slight improvements over a baseline which considers translated outputs of an
    English summarizer, results remain still far from human performance
  * Summarization models from translated data usually under-perform, as
    translation biases add to the difficulty of summarization
* multi-lingual pre-trained models for NLP tasks, such as Multilingual BERT
  (M-BERT, Pires+ 2019) or XLM (Lample and Conneau, 2019), Chi+ (2019) proposed
  to fine-tune the models for summarization on English training data.  The
  assumption is that the summarization skills learned from English data can
  transfer to other languages on which the model has been pre-trained. However a
  * significant performance gap between English and the target language is
  * need of multilingual training data for summarization

## 2.2 Existing Multilingual Datasets for other tasks

* below both i) rely on human translations, and ii) only provide evaluation data

### The Cross-Lingual NLI Corpus The

* SNLI corpus (Bowman+ 2015) is a large scale dataset for NLI. It is composed of
  a collection of 570k human-written English sentence pairs, associated with
  their label, entailment, contradiction, or neutral. The
* MultiGenre Natural Language Inference (MultiNLI) corpus is an extension of
  SNLI, comparable in size, but including a more diverse range of text
* Conneau+ (2018) introduced the Cross-Lingual NLI Corpus (XNLI)
  to evaluate transfer learning from English to other languages:
  based on MultiNLI, a collection of 5,000 test and 2,500 dev pairs were
  translated by humans in 15 languages

### MLQA

* Given a paragraph and a question, the Question Answering (QA) task
* Large scale datasets such as (Rajpurkar+ 2016; Choi+ 2018; Trischler+ 2016)
  have driven fast progress.  2 However, these datasets are only in English. To
* other languages, Lewis+ (2019) recently proposed MLQA, an evaluation dataset
  for cross-lingual extractive QA composed of 5K QA instances in 7 languages

### XTREME The Cross-lingual TRansfer Evaluation of Multilingual Encoders

* 40 languages over 9 tasks. The summarization task is not included

### XGLUE In order to train and evaluate their performance across

* a diverse set of cross-lingual tasks, Liang+ (2020) recently released XGLUE,
* both Natural Language Understanding and Generation scenarios. While
  * no summarization task is included, it comprises
  * a News Title Generation task: data is crawled from a commercial news website
  * 5 languages (German, English, French, Spanish and Russian)

## 2.3 Existing Summarization datasets

### Document Understanding Conference

* Several small and high-quality summarization datasets in English (Harman and
  Over, 2004; Dang, 2006) have been produced in the context of the Document
  Understanding Conference (DUC). 3 They are built by associating
* newswire articles with corresponding human summaries.  A
* multiple reference summaries, distinctive feature of the DUC datasets is the
  * Rankel+ (2013), the correlation between qualitative and automatic metrics,
    such as ROUGE (Lin, 2004), decreases significantly when only a single
    reference is given.  However, due to the
* small number of training data available, DUC datasets are
  often used in a domain adaptation setup for models first trained on larger
  datasets such as Gigaword, CNN/DM (Nallapati+ 2016; See+ 2017) or with
  unsupervised methods (Dorr+ 2003; Mihalcea and Tarau, 2004; Barrios+ 2016a)

### Gigaword

* Again newswire, the english Gigaword (Napoles+ 2012; Rush+ 2015; Chopra+ 2016)
* large size and the high diversity in terms of sources. Since the samples are
  not associated with human summaries, prior works on summarization have
  trained models to generate the headlines of an article, given its incipit,
  which induces various biases for learning models

### New York Times Corpus

* This large corpus for summarization consists of hundreds of thousand of
  articles from The New York Times (Sandhaus, 2008), spanning over 20 years. The
* summaries written by library scientists.  Although (
* Grusky+ (2018) found indications of bias towards extractive approaches,
  used by several efforts (Hong and Nenkova, 2014; Durrett+ 2016; Paulus+ 2017)

### CNN / Daily Mail

* One of the most commonly used dataset for summarization
  (Nallapati+ 2016; See+ 2017; Paulus+ 2017; Dong+ 2019), although
* originally built for Question Answering tasks (Hermann+ 2015a). It consists of
* English articles from the CNN and The Daily Mail
  associated with bullet point highlights from the article
  * the bullet points are typically concatenated into a single summary

### NEWSROOM Composed of

* 1.3M news articles (Grusky+ 2018), and featuring high diversity of publishers
* summaries were extracted from the Web pages metadata: they were
  * originally written to be used in search engines and social media

### BigPatent Sharma+ (2019) collected

* 1.3 million U.S. patent documents, across several technological areas,
  using the Google Patents Public Datasets.  The
* patents abstracts are used as target summaries

### LCSTS The Large Scale Chinese Short Text Summarization Dataset (Hu+ 2015) is

* 2 million short texts from the Sina Weibo microblogging platform.  They are
* summaries given by the author of each text. The dataset includes
* 10k summaries which were manually scored by human for their relevance

# 3 MLSUM 3

* Arabic, there exist the
  * Essex Arabic Summaries Corpus (EASC) (El-Haj+ 2010) and
  * KALIMAT (El-Haj and Koulali, 2013); those comprise circa
  * 1k and 20k samples, respectively
* Spanish, French
  * Pontes+ (2018) proposed a corpus of few hundred samples for Spanish,
    Portuguese and French summaries. To our knowledge,
* the only large-scale non-English summarization dataset is the Chinese LCSTS
  (Hu+ 2015).  With the increasing interest for cross-lingual models, the NLP
  community have recently released
* multilingual evaluation datasets, targeting classification (XNLI) and QA
  (Lewis+ 2019) tasks, as described in 2.2, though still no large-scale dataset
  is avaulable for document summarization.  To fill this gap we introduce
* MLSUM, the first large scale multilingual summarization corpus. Our corpus
  * 1.5 millions articles in French, German, Spanish, Turkish, and Russian
  * similarly built from news articles, and providing a similar amount of
    training samples per language (except for Russian), as the previously
    mentioned CNN/Daily Mail, it can effectively serve as a multilingual
* In the following
  * methodology used to build the corpus.  We then report the
  * corpus statistics and finally interpret the
  * performances of baselines and state-of-the-art models

# 4 Models 5

* supervised and unsupervised methods, extractive and abstractive models. For
* all the experiments, we train models on a per-language basis.  We used the
  recommended hyperparameters for all languages, in order to facilitate
  assessing the robustness of the models
* one model with all the languages mixed together, but we did
  not see any significant difference of performance

## 4.1 Extractive summarization models

### Oracle

* Extracts the sentences, within the input text, that maximise a given metric
  (in our experiments, ROUGE-L) given the reference summary.  It is
* an indication of the maximum one could achieve with extractive summarization
* In this work, we rely on the implementation of Narayan+ (2018b)

### Random

* an unbiased model as a point of reference. To that purpose, we define a simple
* randomly extracts N words from the source document, with
  N fixed as the average length of the summary

### Lead-3 Simply selects the three first sentences from the input text

* Sharma+ (2019), among others, showed that this is a robust baseline for
  several summarization datasets such as CNN/DM, NYT and BIGPATENT

### TextRank

* unsupervised algorithm proposed by Mihalcea and Tarau (2004). It
* consists in computing the co-similarities between all the input sentences
* most central to the document are extracted and considered as the summary
* We used the implementation provided by Barrios+ (2016b)

## 4.2 Abstractive summarization models

Most of the abstractive models are neural sequence to sequence models
(Sutskever+ 2014), composed of
* an encoder that encodes the input text and a decoder that generates the summ

### Pointer-Generator

* See+ (2017) proposed the addition of the copy mechanism (Vinyals+ 2015) on top
  of a sequence to sequence LSTM model.  This mechanism allows to
  * efficiently copy out-of-vocabulary tokens,
    leveraging attention (Bahdanau+ 2014) over the input. We used the
* publicly available OpenNMT implementation,
  * we used it with the default hyper-parameters. However, to avoid biases,
  * we limited the preprocessing as much as possible and did
    not use any sentence separators, as recommended for CNN/DM
  * This explains the relatively lower reported ROUGE

### M-BERT

* Encoder-decoder Transformer architectures are a very popular choice for text
  generation. Recent research efforts have adapted large pretrained
  self-attention based models for text generation (Peters+ 2018; Radford+ 
  2018; Devlin+ 2019).  In particular,
* Liu and Lapata (2019) added a randomly initialized decoder on top of BERT
* Avoiding the use of a decoder, Dong+ (2019) proposed to instead
  add a decoder-like mask during the pre-training to
  unify the language models for both encoding and generating
* Both these approaches achieved SOTA results for summarization. In this paper,
* we only report results obtained following Dong+ (2019), as
  * in preliminary experiments we observed that a
    simple multilingual BERT (MBERT), with no modification, obtained comparable

# 5 Evaluation Metrics 6

### ROUGE Arguably the most often reported set of metrics in summarization

* Recall-Oriented Understudy for Gisting Evaluation (Lin, 2004) computes the
  number of n-grams similar between the evaluated summary and the human ref

### METEOR The Metric for Evaluation of Translation with Explicit ORdering
(Banerjee and Lavie, 2005) was designed for the evaluation of machine
translation output. It is based on the 
* harmonic mean of unigram precision and recall, with 
  recall weighted higher than precision. METEOR is 
* often reported in summarization papers (See+ 2017; Dong+ 2019) in addition to
  ROUGE.

### Novelty 

* Because of their use of copy mechanisms, some abstractive models have been
  reported to rely too much on extraction (See+ 2017; Kryściński+ 2018).  Hence,
* common practice to report the percentage of novel n-grams produced

### Neural Metrics 

* Several approaches based on neural models have been recently proposed. Recent
  works  have proposed to 
  * evaluate summaries with QA based methods (Eyal+ 2019; Scialom+ 2019): the
  * rationale is that a good summary should answer the most relevant questions
* Kryściński+ (2019): a discriminator trained to measure the factualness of the
* Böhm+ (2019) learned a metric from human annotation. 
* All these models were only trained on English datasets, preventing us to
  report them in this paper.  The availability of 
* MLSUM will enable future works to build such metrics in a multilingual fashion

# 6 Results and Discussion 7

* The results presented below allow us to compare the models across languages,
* factors to explain differences in the results:
  1. data, independently from the language
    * structure of the article, the abstractiveness of the summaries, quantity
    * have more to do with domain adaptation
  2. language
    * metric biases (e.g. due to a different morphological type) or
    * biases inherent to the model
    * motivates further the development of multilingual datasets, since
      they are the only mean to study such phenomenon
* Table 2 the ROUGE-L and METEOR scores by each model for all languages
  * the overall order of systems (for each language) is preserved when using
    either metric (modulo some swaps between Lead 3 and Pointer Generator, but
    with relatively close scores)

### Russian, the low-resource language in MLSUM

* For all experimental setups, the performance on Russian is comparatively low
* can be explained by at least two factors
  * corpus is the most abstractive, see Table 1,
    limiting the performance figures obtained for the extractive models
    (Random, LEAD-3, and Oracle)
  * one order of magnitude less training data is available for Russian
    * can explain the impressive improvement of performance
      (+66% in terms of ROUGE-L, see Table 2)
      between a not pretrained (Pointer Gen) and a pretrained model (M-BERT)

## 6.1 How abstractive are the models?

* percentage of novel words in the summary) in Figure 2. As
  * previous works reported (See+ 2017),
    pointer-generator networks are poorly abstractive,
    relying too much on their copy mechanism. It is
    * particularly true for Russian: the lack of data probably makes it easier
      to learn to copy than to cope with natural language generation. As
  * pretrained language models such as M-BERT are consistently more abstractive,
    and by a large margin, since they are exposed to other texts during pretrain

## 6.2 Model Biases toward Languages 8

### Consistency among ROUGE scores except for Russian

* Random model obtains comparable ROUGE-L scores across all the languages,
  except for Russian. This can be explained by the aforementioned
  * Russian corpus characteristics: highest novelty, shortest summaries, and
    longest input documents (see Table 1)
* Thus, in the following, for pair-wise language-based comparisons we focus only
  on scores obtained, by the different models, on French, German, Spanish, and
  Turkish – since we cannot draw meaningful interpretations over Russian as

### Abstractiveness of the datasets The Oracle performance can be considered as

* Oracle
  * similar for English and German, and to some extent Turkish, the Oracle
  * lower for French or Spanish
* figure 1, the percentage of novel words are
  similar for German (14.96), French (15.21) and Spanish (15.34). This
  * may indicate that the relevant information to extract from the article is
    more spread among sentences for Spanish and French than for German. This is
  * confirmed with the results of Lead-3:
    German and English have a much higher ROUGE-L – 35.20 and 33.09 – than
    French or Spanish – 19.69 and 13.70

Table 3: Ratios of Rouge-L: T/P is the ratio of TextRank to Pointer-Generator
and B/P is the ratio of MBERT to Pointer-Generator. The results for CNN/DMfull
preprocessing, DUC and NEWSROOM datasets are those reported in Table 2 of
Grusky+ (2018, Pointer-C in their paper is our Pointer-Generator)

### The case of TextRank

* TextRank performance varies widely across the different languages, regardless
  * low performance on German
    whereas, for this language, Lead-3 has a comparatively higher performance
  * performance on English is remarkably high: the ROUGE-L is 33% higher than
    for Turkish, 126% higher than for French and 200% higher than for Spanish
  * TextRank parameters might actually overfit English
* Table 3, we report the performance ratio between
  * TextRank and Pointer Generator on our corpus, as well as on CNN/DM and two
    other English corpora (DUC and NewsRoom). TextRank has a performance close
    to the Pointer Generator on English corpora (ratio between 0.85 to 1.21) but
    not in other languages (ratio between 0.37 to 0.65).% (Pointer-Generator =>
    BERT-M) This suggests that this model, despite its generic and unsupervised
    nature, might be highly biased towards English

### The benefits of pretraining

* We hypothesize that
  the closer an unsupervised model performance to its maximum limit,
  the less improvement would come from pretraining
* In Figure 3, we plot the improvement rate
  from TextRank to Oracle, against that of Pointer-Generator to M-BERT
* correlation emerging from the plot, the hypothesis appears to hold true
  for all languages, including Russian – not plotted for scaling reasons (x =
  808; y = 40), with the
  exception of English. This exception is
  * probably due to the aforementioned bias of TextRank towards the English

### Pointer Generator and M-BERT Finally, we observe in our results that

* M-BERT always outperforms the Pointer Generator. However, the
  * ratio is not homogeneous across the different languages, Table 3. In
  * improvement for German is much more important than the one for French
  * is in line with the results reported for Machine Translation: the
    Transformer (Vaswani+ 2017) ?> ConvS2S (Gehring+ 2017)
    * outperforms significantly for English to German but obtains
    * comparable results for English to French – see Table 2 in Vaswani+ (2017)
* Neither model is pretrained, nor based on LSTM (Hochreiter and Schmidhuber 97)
  * both use BPE tokenization (Shibata+ 1999). Therefore, the
  * main difference is in attention:
    * self-attention mechanism introduced in the Transformer, while
    * ConvS2S used only source to target attention
* We thus hypothesise that self-attention plays an
  important role for German but has a limited impact for French. This
  * could find an explanation in the morphology of the two languages:
    in statistical parsing, Tsarfaty+ (2010) considered German to be very
    sensitive to word order, due to its rich morphology, as opposed to French
  * self-attention might help preserving information for languages with higher
    degrees of word order freedom

## 6.3 Possible derivative usages of MLSUM 9

* Multilingual Question Answering [dataset]
  * So far, no multilingual training dataset has been proposed for QA
  * Originally, CNN/DM was a Question Answering dataset (Hermann+ 2015a). The
  * information in the summary is also contained in the pair article. Hence,
  * questions can be generated from the summary sentences by masking the NEs
  * a masked question should be answerable given the source article
  * a crucial component to employ the neural summarization metrics mentioned in
    Section 5
* News Title Generation
  * the archived news articles also include the corresponding titles. The
    accompanying code for parsing the articles allows to easily retrieve the
    titles and thus use them for News Title Generation
*  Topic detection A
  * topic/category can be associated with each article/summary pair, by simply
    parsing the corresponding URL. A natural application of this data for
* template based summarization (Perez-Beltrachini+ 2019), using it as additional
  features
