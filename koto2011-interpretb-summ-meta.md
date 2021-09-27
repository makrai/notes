FFCI: A Framework for Interpretable Automatic Evaluation of Summarization
Fajri Koto, Timothy Baldwin, Jey Han Lau
arXiv:2011.13662 [cs.CL]

Data and code can be accessed at https://github.com/fajri91/ffci

* FFCI comprises four elements:
  * faithfulness (degree of factual consistency with the source, Maynez+ 2020)
  * focus (precision of summary content relative to the reference)
  * coverage (recall of summary content relative to the reference)
  * inter-sentential coherence (document fluency between adjacent sentences)
* We construct a novel
  * dataset for focus, coverage, and inter-sentential coherence, and develop
  * automatic methods for evaluating each of the four dimensions of FFCI
    based on cross-comparison of evaluation metrics and model-based eval methods
    * including question answering (QA) approaches, STS, next-sentence
      prediction (NSP), and scores derived from 19 pre-trained language models
  * evaluating a broad range of summarization models across two datasets

# 1 Intro

* abstractive summarization (Nallapati+ 2016; See+ 2017; Gehrmann+ 2018; Liu &
  Lapata, 2019; Zhang+ 2020a; Lewis+ 2020) continue to rely on ROUGE
* the only real mainstream alternative to ROUGE being manual evaluation
  (Hsu+ 2018; Chen & Bansal, 2018; Hardy & Vlachos, 2018; Celikyilmaz+ 2018;
  Krishna & Srinivasan, 2018)
* focus, coverage, and inter-sentential coherence
  * inspired by manual eval in previous work (Peyrard & Gurevych, 2018; Hsu+
    2018; Celikyilmaz+ 2018; Narayan+ 2018b; Chen & Bansal, 2018)
  * previous work summarized by Hardy+ (2019)
* We first revisit recent work on faithfulness, and propose a simpler auto eval
  * Recent work has used question generation (QG) and question answering (QA) to
    (Wang+ 2020; Durmus+ 2020). However, we argue that this
  * hE, unavailable in languages other than English. As an alternative,
  * we extend the experiments of Zhang+ (2020b) and Durmus+ (2020)
  * scores from a broad range of pre-trained language models (computed between
    summary and article) and find them to be more reliable than QA-based
    methods
* Secondly, we propose focus and coverage relative to the reference summary
* Lastly, we address the automatic evaluation of linguistic quality in
  multi-sentence summaries
  * Previous work has looked at aspects including readability, fluency, and
    clarity (Hardy+ 2019)
  * hE, inter-sentential coherence is more important for evaluating abstractive
    * pre-trained language models are highly adept at generating fluent sents,
      but global coherence beyond the sentence is not a given.  Second,
    * inter-sentential coherence subsumes sub-sentence coherence,
      as disfluent sentences will break the global discourse coherence
* contributions are:
  * dataset for evaluating focus, coverage, and inter-sentential coherence;
  * for faithfulness, focus and coverage, we benchmark
    * traditional metrics such as ROUGE, METEOR, and BLEU with
    * model-based metrics, including question-answering (QA) methods, semantic
      textual similarity (STS), and
    * scores from 19 different pre-trained language models;
  * we adapt the next sentence prediction (NSP) for evaluating inter-sentential
    coherence; and
  * we re-evaluate a broad range of contemporary summarization models over
    CNN/DailyMail and XSUM based on FFCI, with a number of surprising findings
* conclusion
  * BERTScore (roberta-base) is the most robust metric for evaluating faithfulns
  * BERTScore (gpt2-xl) for focus and coverage, and
  * NSP-score for inter-sentential coherence.  Our general finding is that
  * since the LSTM-based seq2seq, modern abstractive summarization systems over
    CNN/DailyMail have
    * largely improved on focus, with
    * coverage not being much better than Lead3 until recent systems (e.g
      ProphetNet). Our FFCI framework found
* three competitive SOTA systems: BART, PEGASUS, and ProphetNet, with
  * PEGASUS and ProphetNet having generally higher focus and coverage resp

# 2 Related Work

## 2.1 Aspects on Summarization Evaluation

* Automatic evaluations of language generation systems have been based on the
* BLEU (Papineni+ 2002) is a precision-based metric in machine translation task,
* ROUGE (Lin, 2004) is the de facto metric for summarization systems
* In the other text generation tasks such as
  caption generation (Xu+ 2015) and question generation (Du+ 2017),
  CIDEr (Vedantam+ 2015) and SPICE (Anderson+ 2016) are used
  to complement BLEU and ROUGE
* pre-trained embedding based evaluation metrics such as
  BERTScore (Zhang+ 2020b) and MoverScore (Zhao+ 2019) have also been proposed
* we followed the lead of Hardy+ (2019) in conducting a survey of 111
  summarization papers from major NLP conferences over the period 2017–2020, and
* we focus on text summarization and exclude multi-modal summarization systems,
  * source code (Ahmad+ 2020),
  * screen-play summarization (Papalampidi+ 2019, 2020)
* First, as expected, ROUGE is used by more than 95% of papers, while
  * other metrics such as METEOR, BLEU, BERTScore, and MoverScore are rarely
  * 64% of the surveyed papers used manual evaluation to analyze the strengths
* 6 major dimensions of manual evaluation as
  * faithfulness, recall, precision, relevance, coherence, and fluency
  * recall, precision, faithfulness, and fluency are the most frequent dims of
* absolute scoring is more common than relative evaluation.  Absolute benchmark
  * i.e. on a numeric scale, in isolation of any other summaries. With relative
* manual evaluations in Table 1 were conducted with different basis, namely,
  * SCU , reference, article, and reference+article
  * SCU: semantic content units
    * defined in Pyramid (Nenkova & Passonneau, 2004))
    * clauses or sentences manually extracted from the ground-truth summary, and
    * Pyramid method is initially applied to aggregate the human summaries,
    * hE, (Bhandari+ 2020) applied Pyramid in the single-reference setting
* most recent work has used the source article as the basis in assessing
  faithfulness, precision, and recall, rather than reference summaries or SCUs
  * good practice, especially for faithfulness, as 
    * generated summaries can technically contain details not found in reference
  * hE, for precision and recall, it leads to poor inter-annotator agreement
    as a result of the complication in the annotation scheme
    (Nenkova and Passonneau (2004), Fabbri+ (2020))
  * only 7 out of 71 papers describe explicit quality control mechanisms used in

## 2.2 Resource for Summarization Evaluation

* correlation scores such as Pearson, Spearman, or Kendall
* In machine translation (MT),
  BLEU (Papineni+ 2002) and METEOR (Lavie & Agarwal, 2007) were validated based
  on WMT and LDC TIDES 2003 corpora, respectively. While MT metric evaluation
  * resources have been developed progressively over time (e.g. the WMT Metrics
    Task has run annually since 2006), there has been a relative dearth of new
  * for summarization research,
    only recently have Bhandari+ (2020) and Fabbri+ (2020) released datasets
    based on summaries generated by a range of neural summarization models
  * Bhandari+  (2020), Fabbri+ (2020), Maynez+ (2020), Wang+ (2020) releasing
    new data, although
    * dims of eval do not fully align with the common dims of manual eval
    * Bhandari+ (2020) only assess coverage based on SCUs, and
    * Fabbri+ (2020) do not separate out precision and coverage
* Bhandari+ (2020) annotated 100 samples based on the simplified Pyramid
  method (Nenkova & Passonneau, 2004), where
  * semantic content units (SCUs) are manually extracted and
    crowd-workers then count the appearance of SCUs in the summary. This
  * closely related to coverage as proposed in this research, but does
  * not consider focus, faithfulness, and inter-sentential coherence
* Bhandari+ (2020) and Peyrard (2019b) both found that
  evaluation metrics developed based on older datasets do not necessarily
  perform well on modern datasets with more modern summarization systems
* Fabbri+ (2020) 
  * four dimensions of summaries: relevance, consistency, fluency, and coherence
    by annotating 100 CNN/DailyMail samples.  Our FFCI framework further
  * we 
    * decompose relevance into focus and coverage to provide a more fine-grained
    * replace fluency — which measures quality of individual sentences — with
      inter-sentential coherence, which measures the quality of multi-sentence
  * summaries evaluated via crowd-sourcing (Amazon MTurk) and expert (in-house)
    * ultimately base all of their findings on the expert annotations, as they
      found the crowd-sourced annotations to be highly inconsistent
  * their annotation scheme is difficult for crowd-workers, as they are asked to
    judge all four dimensions after reading an article and a system-generated
    summary. Consistency (faithfulness) is found to be particularly difficult
    (and subjective)
  * Maynez+ (2020) have attempted to ease the annotation burden by asking
    crowd-workers to highlight unfaithful spans in the summary
  * Assessing relevance without a ground-truth summary is also hard, as it
    requires crowd-workers to implicitly construct their own summary of the
    article. The second reason is that there is no quality control to verify the
    quality of the annotations, which means they may be potentially unreliable
* we use
  * resource released by Maynez+ (2020) to study faithfulness, and use
  * the customized Direct Assessment framework (Graham+ 2015) to collect judgmnt
  * three additional dimensions: focus, coverage, and inter-sentential coh. The
  * a more intuitive annotation scheme, better quality control, and better
    handling of annotator variance (through z-score normalization)
* Fabbri+ (2020) stop short of providing guidance as to the best evaluation
  methods for assessing a particular dimension of summary quality
  * we addresse this gap by providing practical advice on the best evaluation
    method for assessing the four dimensions of FFCI

# 3 Existing Evaluation Metrics and Extensions

* traditional string overlap-based evaluation metrics, with a particular
  * focus on ROUGE (Lin, 2004), as it has become the de facto standard for summ
  * We apply the overlap-based metrics in evaluating all four dimensions of FFCI
* recently-proposed QAGS question answeringbased framework for evaluating
  faithfulness (Wang+ 2020), which we extend to also evaluate focus and
  coverage (but not inter-sentential coherence). We then introduce
* two general-purpose string similarity metrics, namely the
  * unsupervised BERTScore (Zhang+ 2020b)
  * supervised STS-Score, which is trained over STS data from SemEval tasks
    (Agirre+ 2012)
  * we use them to evaluate all four dimensions of FFCI. Finally, we introduce
* coherence score of Nayeem and Chali (2017) and Yin+ (2020) as a specialized
  metric for evaluating inter-sentential coherence

## 3.3 BERTScore

* MT eval: Contextualized word embeddings have been shown to be a strong metric
  (Mathur+ 2019; Zhang+ 2020b)
  * Zhang+ (2020b) proposed BERTScore as a means of computing the similarity
  * Zhao+ (2019) proposed Mover-Score as
    * the Euclidean distance between two contextualized BERT representations
* We use BERTScore rather than MoverScore in this study for two reasons:
  * Mover-Score is symmetric (i.e. MoverScore(x, y) = MoverScore(y, x)), and as
    such cannot easily be used to evaluate precision and recall separately; and
  * Fabbri+ (2020) has shown that BERTScore > MoverScore for summarization eval
* the main hyperparameter being layer selection:
  * Zhang+ (2020b) found that this is critical to performance
  * For machine translation and text generation evaluation, Zhang+ (2020b)
    recommend the use of F BERT based on the 24th layer of roberta-large,
    on the basis of experiments over BERT (Devlin+ 2019), RoBERTa (Liu+ 2019b),
    and XLNet (Yang+ 2019)
  * we perform similar layer selection across the three sub-facets of FFCI,
    * we examine 7 model types, that can be categorized as follows:
    * encoder-only = BERT (Devlin+ 2019), RoBERTa (Liu+ 2019b), and XLNet
    * decoder-only = GPT2 (Radford+ 2019); and
    * encoder–decoder = T5 (Raffel+ 2019), BART (Lewis+ 2020), and PEGASUS
    * For each of these, we experiment with different-sized pre-trained models,
      for a total of 19 models. For encoder–decoder models, we only perform
      layer selection over the encoder layers

# 4 FFCI Framework

## 4.1 Faithfulness

* “hallucination” or factual inconsistencies (Maynez+ 2020; Wang+ 2020). Three
* Maynez+ 2020; Durmus+ 2020; Wang+ 2020 independently proposed to evaluate the
  degree of hallucination, as detailed in Table 3
* training data,
  * Maynez+ (2020) released the largest dataset with 2,000 annotated summaries
    generated over XSUM
  * Durmus+ (2020) manually pre-filtered the data to select “meaningful” sents,
    making it difficult to fully automate the method, and no quality controls in
* Maynez+ (2020) conducted a pilot study to train their annotators, and
* Wang+ (2020) applied annotator attention checks, making us more confident in
* We argue that the best way to evaluate faithfulness is by comparing the
  generated summary with the source document (and not with the reference)
* Durmus+ (2020) is the only paper to extensively measure traditional and
  model-based metrics against the source article. However, because of concerns
* our AvgTopn matches sentence t i from the summary with each sentence s j in the
  source document X, and returns the average score for the top-n best-matching
  sentences
* n = 2 works best for ROUGE, and
* n = 3 works best for STS-Score and the pre-trained language model scores

# 6 Experimental Result 19

## 6.1 Faithfulness

* evaluation against the reference performs worse than against the source
* our QAGS implementation (Wang+ 2020) performs better than the QA system of
  Maynez+ (2020) over their dataset
* FA ROUGE-1 and FA ROUGE-2 baselines actually outperform QAGS that is
  computationally expensive, but more importantly that
* the two versions of FA BERTScore perform differently, with
  * our summarization-optimized version resulting in the best overall results
* The best layer for this model is layer-13, as depicted in Figure 3.  After
  conducting model-layer search over 19 models, 24 we found that roberta-base
  (layer 10) to result in the best correlation (based on average rank across
  four summarization models)

# 7 Conclusion 26
