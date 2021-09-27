What Have We Achieved on Text Summarization?
Dandan Huang, Leyang Cui, Sen Yang, Guangsheng Bao, Kun Wang, Jun Xie, Yue Zhang
Accepted by EMNLP 2020 arXiv:2010.04529 [cs.CL]

We release the
  * test set, which includes 10 system outputs and their manually-labeled errors
    based on PolyTope, and a
  * user-friendly evaluation toolkit to help future summ/eval research

# Abstract

* to gain more understanding of summarization on a fine-grained synt and sem, we
  * consult the Multidimensional Quality Metric (MQM) and
  * quantify 8 major sources of errors on 10 representative models manually
    * under similar settings, extractive summarizers are in general better than
      their abstractive counterparts thanks to strength in faithfulness and
      factual-consistency;
    * milestone techniques such as copy, coverage and hybrid
      extractive/abstractive methods do bring specific improvements but also
      demonstrate limitations;
    * pre-training techniques, and in particular sequence-to-sequence
      pre-training, are highly effective for improving text summarization, with
      BART giving the best results

# 1 Intro

* neural architectures have been investigated for both
  * extractive (Cheng and Lapata, 2016; Xu and Durrett, 2019) and
  * abstractive (Nallapati+ 2016; Lewis+ 2019; Balachandran+ 2020) summarization
* standard benchmarks such as Gigaword (Graff+ 2003), NYT (Grusky+ 2018) and
  CNN/DM (Hermann+ 2015) over the years, it is commonly accepted that the
* ROUGE has been shown insufficient as a precise indicator on summarization
  quality evaluation (Liu and Liu, 2008; Böhm+ 2019). In the research
* uncertain what we have achieved overall and what fundamental changes each
  milestone technique has brought
* We aim to address the above issues by
  quantifying the primary sources of errors over representative models. In
  * following MQM (Mariana, 2014),
    * a framework for declaring and describing human writing quality which
      stipulates a hierarchical listing of error types
      restricted to human writing and translation
  * we design PolyTope, 8 metrics on the Accuracy and Fluency aspects
* Models are analyzed by the overall error counts on a test set according to
  * Lead-3, TextRank (Mihalcea and Tarau, 2004)
  * Sequenceto-sequence with Attention (Rush+ 2015)
  * SummaRuNNer (Nallapati+ 2017)
  * Point-Generator (See+ 2017)
  * Point-Generator-with-Coverage (Tu+ 2016; See+ 2017)
  * Bottom-Up (Gehrmann+ 2018)
  * BertSumExt (Liu and Lapata, 2019)
  * BertSumExtAbs (Liu and Lapata, 2019) and BART (Lewis+ 2019)
  * neural structures with traditional preneural ones, and abstractive models
    with their extractive counterparts, discussing the effectiveness of
* we find that:
  1. Preneural vs Neural: Traditional rule-based methods are still strong
     baselines given powerful neural architectures
  2. Extractive vs Abstractive
    * Under similar settings, extractive approaches outperform abstractive
    * main shortcoming is
      * unnecessary parts for extractive models, and
      * omission and intrinsic hallucination for abstractive models
  3. Milestone Techniques:
    * Copy works effectively in reproducing details. It also reduces duplication
      on the word level but tends to cause redundancy to a certain degree
    * Coverage solves repetition errors by a large margin, but shows limits in
      faithful content generation
    * Hybrid extractive/abstractive models reflect the relative strengths and
      weaknesses of the two methods
  4. Pre-training
    * better even without copy and coverage mechanisms
    * joint pre-training combining text understanding and generation gives the
      most salient advantage, with the
    * BART model achieving by far the SOTA results
      on both automatic and our human evaluations

# 7 Conclusion 9
