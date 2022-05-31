T5. Exploring the Limits of Transfer Learning with a Unified txt2txt Transformer
C Raffel, N Shazeer, A Roberts, K Lee, S Narang, M Matena, Y Zhou, W Li, PJ Liu
JMLR arXiv:1910.10683 [cs.LG]

* we release our data set, pre-trained models, and code

# Abstract

* Transfer learning: model is first pre-trained on a data-rich task before
  being fine-tuned on a downstream task, has emerged as a powerful technique
* diversity of approaches, methodology, and practice
* we
  * a unified framework
    * converts all text-based language problems into a text-to-text format
  * compares pre-training objectives, architectures, unlabeled data sets,
    transfer approaches, and other factors on dozens of tasks
  * new Colossal Clean Crawled Corpus
  * SOTA results on summarization, question answering, text classification, etc
* see the Takeaways

# 1 Introduction

* a wide landscape of
  * pre-training objectives
    (Howard and Ruder, 2018; Devlin+ 2018; Yang+ 2019; Dong+ 2019),
  * unlabeled data sets (Yang+ 2019; Liu+ 2019c; Zellers+ 2019),
  * benchmarks (Wang+ 2019b, 2018; Conneau and Kiela, 2018),
  * fine-tuning methods (Howard and Ruder, 2018; Houlsby+ 2019; Peters+ 2019),
* approach is inspired by unifying frameworks casting all text problems as
  question answering (McCann+ 2018), language modeling (Radford+ 2019), or
  span extraction Keskar+ (2019b) tasks
  * the same model, objective, training procedure, and decoding process
* We evaluating performance on a wide variety of English-based NLP problems,
  including question answering, document summarization, and sentiment
* With this unified approach, we can compare the effectiveness of different
  transfer learning objectives, unlabeled data sets, and other factors, while
  exploring the limits of transfer learning for NLP by scaling up models and
  data sets beyond what has previously been considered.
* we
  * goal is not to propose new methods but instead to provide a comprehensive
  * a survey, exploration, and empirical comparison of existing techs
  * explore the limits of current approaches by scaling up the insights
    from our systematic study (training models up to 11 billion parameters) to
    obtain SOTA results in many of the tasks we consider. In order to perform
  * “Colossal Clean Crawled Corpus” (C4), a data set consisting of hundreds of
    gigabytes of clean English text scraped from the web. Recognizing that the
    main utility of transfer learning is the possibility of leveraging
    pre-trained models in data-scarce settings, we release our code, data sets,
    and pre-trained models

# 2 model, implementation, formulating every problem as txt2txt

## 2.3 Downstream Tasks

* MT, question answering, abstractive summarization, and text classification
  * GLUE and SuperGLUE text classification meta-benchmarks
  * CNN/Daily Mail abstractive summarization
  * SQuAD question answering
  * WMT English to German, French, and Romanian translation
* GLUE (Wang+ 2018) and SuperGLUE (Wang+ 2019b) each comprise a collection of
  * Sentence acceptability judgment (CoLA, Warstadt+ 2018)
  * Sentiment analysis (SST-2, Socher+ 2013)
  * Paraphrasing/sentence similarity
    * MRPC (Dolan and Brockett 2005), STS-B (Cer+ 2017), QQP (Iyer+ 2017)
  * Natural language inference (MNLI (Williams+ 2017), QNLI (Rajpurkar+ 2016),
    RTE (Dagan+ 2005), CB (De Marneff+ 2019))
  * Coreference resolution (WNLI and WSC, Levesque+ 2012)
  * Sentence completion (COPA, Roemmele+ 2011)
  * Word sense disambiguation (WIC, Pilehvar and Camacho-Collados, 2018)
  * Question answering
    * MultiRC (Khashabi+ 2018), ReCoRD (Zhang+ 2018), BoolQ (Clark+ 2019)
* GLUE and SuperGLUE benchmarks: we treat all of the tasks as a single task
  * As suggested by Kocijan+ (2019) we also include the Definite Pronoun
    Resolution (DPR) data set (Rahman and Ng, 2012) in the combined SuperGLUE
* CNN/Daily Mail (Hermann+ 2015) data set was introduced as a QA task but was
  adapted for text summarization by Nallapati+ (2016); we use the non-anonymized
  version from See+ (2017) as an abstractive summarization task
* SQuAD (Rajpurkar+ 2016) is a common question-answering benchmark.
  * In our experiments, the model is fed the question and its context and
    asked to generate the answer token-by-token
* WMT English
  * to German, we use the same training data as (Vaswani+ 2017) and
    newstest2013 as a validation set (Bojar+ 2014)
  * to French, we use the standard training data from 2015 and
    newstest2014 as a validation set (Bojar+ 2015)
  * to Romanian, we use the train and validation sets from WMT 2016 (Bojar+)
  * we only pre-train on English data, so in order to learn to
    translate a given model will need to learn to generate text in a new
    language

# 3 experiments that explore the field of transfer learning for NLP

## 3.7 combine insights from our systematic study to obtain SOTA results on a
wide variety of benchmarks

# 4 summary of our results and a look towards the future

## 4.1 Takeaways

* text-to-text framework obtained
  comparable performance to task-specific architectures and
  SOTA results when combined with scale
* Architectures
  * original encoder-decoder form worked best in our text-to-text framework
  * twice as many parameters as “encoder-only” (e.g. BERT) or
    “decoder-only” (language model) architectures, but similar computational cst
  * sharing the parameters in the encoder and decoder:
    no substantial performance drop while halving the total parameter count
* Unsupervised objectives
  * most “denoising” objectives performed similarly in the text-to-text setup
  * we suggest using objectives that produce short target sequences
    so that unsupervised pre-training is more computationally efficient
* Data sets. We introduced the
  * “Colossal Clean Crawled Corpus” (C4), which comprises
    heuristically-cleaned text from the Common Crawl web dump
  * training on in-domain unlabeled data could boost performance in a few
    downstream tasks, but
  * performance can degrade when the small data set is repeated many times
    over the course of pre-training
* Training strategies
  * the basic approach of updating all of a pre-trained model’s parameters
    during fine-tuning outperformed methods that are designed to update fewer
    parameters, although updating all parameters is most expensive
  * rather than training the model on multiple tasks at once
    * primary concern in multi-task learning is setting the proportion of tasks
    * We ultimately did not find a strategy for setting mixing proportions
    * fine-tuning after pre-training on a mixture of tasks produced comparable
      performance to unsupervised pre-training
* Scaling. We compared various strategies
  * more data, larger model, or an ensemble of models
  * each approach conferred a significant boost in performance
  * smaller model on more data was often outperformed
    by a larger model for fewer steps
  * ensemble of models can provide substantially better results than a single
    * an orthogonal means of leveraging additional computation
    * Ensembling models that were fine-tuned from the same base pre-trained
      model performed worse than pre-training and fine-tuning all models
      completely separately, though fine-tune-only ensembling still
      substantially outperformed a single model
* We combined our above insights and trained
  substantially larger models (up to 11 billion parameters) to achieve
  SOTA results across many of the benchmarks we considered
  * pre-training: we extracted text from our C4 data set and applied a
    denoising objective that corrupts contiguous spans of tokens
  * We pre-trained on a multi-task mixture before fine-tuning on indiv tasks.
    Overall, our models were trained on over 1 trillion tokens

## 4.2 Outlook

### The inconvenience of large models, unsurprising but important

* larger models tend to perform better
  * hardware is continually getting cheaper and more powerful
  * continue to be a promising way to achieve better performance (Sutton, 2019)
* applications and scenarios where smaller or less expensive model is helpful,
  * client-side inference or federated learning (Konečnỳ+ 2015, 2016)
  * low-resource tasks
* methods that achieve stronger performance with cheaper models
  * distillation (Hinton+ 2015; Sanh+ 2019; Jiao+ 2019),
  * parameter sharing (Lan+ 2019), and
  * conditional computation (Shazeer+ 2017)
    * activating only some of the units in a network, in an input-dependent way
    * e.g. if we think we're looking at a car, we only need to compute the
      activations of the vehicle detecting units, not of all features

### More efficient knowledge extraction

* one of the goals of pre-training is to provide general-purpose “knowledge”
* denoising corrupted spans of text may not be a very efficient way
* efficiency by pre-training a model to distinguish between real and
  machine-generated text (Clark+ 2020)

### Formalizing the similarity between tasks

* pre-training on unlabeled in-domain data can improve performance (Section 3.4)
* relies on e.g. that SQuAD was created using data from Wikipedia
* formulate a more rigorous notion of the “similarity”
* in computer vision (Huh+ 2016; Kornblith+ 2018; He+ 2018)
* could also help choose supervised pre-training tasks, which
  has been shown to be helpful for the GLUE benchmark (Phang+ 2018)

### Language-agnostic models

* English-only pre-training did not achieve SOTA results on the
  translation tasks we studied
* issue: need to specify which languages a vocabulary can encode ahead of time
* Conclusion: combination of a straightforward and unified text-to-text
  framework, our new C4 data set, and insights from our systematic study
