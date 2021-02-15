PEGASUS: Pre-training with Extracted Gap-sentences for Abstractive Summarization
Jingqing Zhang, Yao Zhao, Mohammad Saleh, Peter J. Liu
ICML 2020 arXiv:1912.08777 [cs.CL]

# Abstract

* Recent work on pre-training Transformers with self-supervised objectives
  * great success when fine-tuned on downstream NLP tasks including summarizatio
  * hE, no pre-training objectives for abstractive text summarization
  * lack of systematic evaluation across diverse domains
* PEGASUS: we pre-train large Transformer-based encoder-decoder models on
  massive text corpora with a new self-supervised objective
  * important sentences are removed/masked from an input document and are
    generated together as one output sequence from the remaining sentences,
    similar to an extractive summary
* evaluated our best PEGASUS model on 12 downstream summarization tasks spanning
  news, science, stories, instructions, emails, patents, and legislative bills
  * SOTA performance on all 12 downstream datasets measured by ROUGE scores
  * surprising performance on low-resource summarization,
    * surpassing previous SOTA results on 6 datasets with only 1000 examples
* human evaluation show that our model summaries
  achieve human performance on multiple datasets

# 1 Intro

* In abstractive summarization, sequence-to-sequence (Sutskever+ 2014) has
  become a dominant framework using encoder-decoder architectures based on
  * RNNs (Chung+ 2014; Hochreiter & Schmidhuber, 1997) and more recently
  * Transformers (Vaswani+ 2017)
* relied on large-scale, high-quality datasets of supervised document-summary
  pairs (Hermann+ 2015) and achieved 
  * promising results (Rush+ 2015; Nallapati+ 2016; See+ 2017). In recent years,
* new summarization datasets that have
  * more abstractive summaries (Narayan+ 2018), have
  * longer documents, (Cohan+ 2018; Sharma+ 2019), utilize
  * multiple documents (Fabbri+ 2019), and are sourced from
  * diverse domains (Grusky+ 2018; Koupaee & Wang, 2018; Kim+ 2019; Kornilova &
    Eidelman, 2019; Zhang & Tetreault, 2019); however, there has been
* little work on systematic evaluation of models across these broad settings
* we study pre-training objectives specifically for abstractive summarization
  * evaluate on 12 downstream datasets spanning
    * news (Hermann+ 15; Narayan+ 18; Grusky+ 18; Rush+ 15; Fabbri+ 19),
    * science (Cohan+ 2018),
    * short stories (Kim+ 2019),
    * instructions (Koupaee & Wang, 2018),
    * emails (Zhang & Tetreault, 2019),
    * patents (Sharma+ 2019), and
    * legislative bills (Kornilova & Eidelman, 2019). We find that
* Gap Sentences Generation (GSG), a pre-training objective
  * masking whole sentences from a document and 
    generating these gap-sentences from the rest of the document 
  * In particular, choosing putatively important sentences outperforms lead or
    randomly selected ones
    * encouraging whole-document understanding and summary-like generation. We
  * PEGASUS = Extracted Gap-sentences for Abstractive SUmmarization seq2seq
* With our best 568M parameter model trained on the recently introduced C4
  (Raffel+ 2019) corpus we
* equal or exceed SOTA on the 12 summarization tasks we consider. We further
* we: newly collected text corpus HugeNews comprised of news-like articles we
  * including the highly competitive XSum and CNN/DailyMail summarization
    datasets
* domains adaptation:
  * mismatch between research datasets and real-world use-cases
  * i.e. the most common setting is that of low-resource summarization
  * We simulate this setting and show that
    our model is able to adapt very quickly when fine-tuning with few pairs,
    obtaining SOTA results in 6 datasets with only 1000 examples
* Qualitatively we observed high quality outputs from our best models and
  validated this in human evaluation studies
  * PEGASUS summaries >= reference summaries for the datasets we assessed –
    XSum, CNN/DailyMail, and Reddit TIFU – 
    even at low-levels of supervision
* contributions:
  * GSG, new self-supervised pre-training objective for abstractive summ
    * we study strategies for selecting the gap sentences
  * evaluation on a broad range of downstream summarization tasks, with
    * careful ablations to choose the best model settings, which
    * we train a 568M parameter PEGASUS model that
      surpasses or is on-par with the SOTA on all 12 downstream datasets
  * domain adaptation by fine-tuning the PEGASUS model and 
    surpassing previous SOTA results on many tasks with only 1000 examples
  * human evaluation studies to validate our experimental design and demonstrate
    * human-level performance on XSum, CNN/DailyMail, and Reddit TIFU
