PEGASUS: Pre-training with Extracted Gap-sentences for Abstractive Summarizaton
Jingqing Zhang, Yao Zhao, Mohammad Saleh, Peter J. Liu
ICML 2020 arXiv:1912.08777 [cs.CL]

# Abstract

* Recent work on pre-training Transformers with self-supervised objectives
  * great success when fine-tuned on downstream NLP tasks including summization
  * hE, no pre-training objectives for abstractive text summarization
  * lack of systematic evaluation across diverse domains
* PEGASUS: we pre-train large Transformer-based encoder-decoder models on
  massive text corpora with a new self-supervised objective
  * important sentences are removed/masked from an input document and are
    generated together as one output sequence from the remaining sentences,
    similar to an extractive summary
* evaluated our best PEGASUS model on 12 downstream summarization tasks
  * news, science, stories, instructions, emails, patents, & legislative bills
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
* relied on large-scale, high-quality datasets of document-summary pairs
  (Hermann+ 2015)
  * promising results (Rush+ 2015; Nallapati+ 2016; See+ 2017)
* new summarization datasets that have
  * more abstractive summaries (Narayan+ 2018)
  * longer documents, (Cohan+ 2018; Sharma+ 2019), utilize
  * multiple documents (Fabbri+ 2019)
  * diverse domains (Grusky+ 2018; Koupaee & Wang, 2018; Kim+ 2019;
    Kornilova & Eidelman, 2019; Zhang & Tetreault, 2019)
* little work on systematic evaluation of models across these broad settings
* we study pre-training objectives specifically for abstractive summarization
  * evaluate on 12 downstream datasets spanning
    * news (Hermann+ 15; Narayan+ 18; Grusky+ 18; Rush+ 15; Fabbri+ 19),
    * science (Cohan+ 2018),
    * short stories (Kim+ 2019),
    * instructions (Koupaee & Wang, 2018),
    * emails (Zhang & Tetreault, 2019),
    * patents (Sharma+ 2019), and
    * legislative bills (Kornilova & Eidelman, 2019)
* Gap Sentences Generation (GSG), a pre-training objective
  * masking whole sentences from a document and
    generating these gap-sentences from the rest of the document
  * In particular, choosing putatively important sentences outperforms lead or
    randomly selected ones
    * As a proxy for importance we compute ROUGE1-F1 (Lin, 2004)
    * encouraging whole-document understanding and summary-like generation
  * PEGASUS = Extracted Gap-sentences for Abstractive SUmmarization seq2seq
* With our best 568M parameter model trained on the recently introduced C4
  (Raffel+ 2019) corpus we
* equal or exceed SOTA on the 12 summarization tasks we consider
* we: newly collected text corpus HugeNews comprised of news-like articles
  * including the highly competitive XSum and CNN/DailyMail summ datasets
* domain adaptation
  * mismatch between research datasets and real-world use-cases
  * i.e. the most common setting is that of low-resource summarization
  * We simulate this setting and show that
    our model is able to adapt very quickly when fine-tuning with few pairs,
    obtaining SOTA results in 6 datasets with only 1000 examples
* Qualitative observation + human evaluation studies
  * PEGASUS summaries >= reference summaries
    for the datasets we assessed – XSum, CNN/DailyMail, and Reddit TIFU –
    even at low-levels of supervision
* contributions:
  * GSG, new self-supervised pre-training objective for abstractive summ
    * we study strategies for selecting the gap sentences
  * evaluation on a broad range of downstream summarization tasks, with
    * careful ablations to choose the best model settings
    * we train a 568M parameter PEGASUS model that
      surpasses or is on-par with the SOTA on all 12 downstream datasets
  * domain adaptation by fine-tuning the PEGASUS model and
    surpassing previous SOTA results on many tasks with only 1000 examples
  * human evaluation studies to validate our experimental design and
    * human-level performance on XSum, CNN/DailyMail, and Reddit TIFU
* from the conclusion
  * We studied several gap-sentence selection methods and identified
    principle sentence selection as the optimal strategy
  * We demonstrated the effects of the
    pre-training corpora, gap-sentences ratios, vocabulary sizes and
    * scaled up the best configuration to
      achieve SOTA results on all 12 diverse downstream datasets considered
  * adapt to unseen summarization datasets very quickly, achieving strong
    results in 1000 examples
  * achieved human performance on multiple datasets using human evaluation

# 2 Related Work

* Dai & Le (2015); Ramachandran+ (2017) used LM and autoencoder pre-training on
  in-domain data to improve performance of RNN sequence models
* pre-training with much larger external text corpora (such as Wikipedia, books,
  or Web-pages) and Transformer-based sequence models has led to a dramatic
  improvement in performance when fine-tuned for both NLU and text gen tasks
  (Radford+ 2018a; Devlin+ 2019; Rothe+ 2019; Yang+ 2019; Joshi+ 2019;
  Song+ 2019; Dong+ 2019; Lewis+ 2019)
* Most similar to our approach are Transformer encoder-decoder models
  pre-trained on some masked input pre-training objective

## MASS (Song+ 2019) proposed masked sequence-to-sequence generation that
reconstructs a sentence fragment given the remaining part of the sentence. A
single sentence fragment was randomly selected

## UniLM (Dong+ 2019) proposed jointly training on three types of ML tasks:

* unidirectional (left-to-right and right-to-left),
* bidirectional (word-level mask, with next sentence prediction), and
* sequence-to-sequence (word-level mask) prediction

## T5 (Raffel+ 2019) generalized text-to-text to a variety of NLP tasks

* scaling up model size (to 11 billion parameters) and
  pre-training corpus, introducing C4, a massive text corpus
  * which we also use in some of our models
* pre-trained with randomly corrupted text spans of varying mask ratios and
  sizes of spans

## BART (Lewis+ 2019) introduced a denoising autoencoder to pre-train seq2seq

* corrupted text with an arbitrary noising function and learned to reconstruct
  the original text. For generation tasks, the noising function was text
  infilling which used single mask tokens to mask random sampled spans of text

## In contrast to MASS, UniLM, BART and T5, the proposed PEGASUS

* masks multiple whole sentences rather than smaller continuous text spans. In
* we deterministically choose sentences based on importance
* As in T5, PEGASUS does not reconstruct full input sequences, and
  * only generates the masked sentences as a single output sequence
* we focus entirely on downstream summarization (generative) tasks

* some work on the low-resource, summarization setting using the CNN/DailyMail
* Radford+ (2018b): a large Transformer language model pre-trained on Web text
  could generate summaries if prompted with ”TL;DR”, achieving a ROUGE-2 of 8.27
  on CNN/DailyMail
* Khandelwal+ (2019) pre-trained a Transformer language model on Wikipedia, and
  fine-tuned using 3000 examples, achieving 13.1 ROUGE-2

# 3 Pre-training Objectives

* recent success in masking words and contiguous spans (Joshi+ 19; Raffel+ 19),
* we select and mask whole sentences from documents, and concatenate the
  gap-sentences into a pseudo-summary. The corresponding position of each
  selected gap sentence is replaced by a mask token [MASK1] to inform the model
* Gap sentences ratio, or GSR, refers to the number of selected gap sentences to
  the total number of sentences in the document, which is
  * similar to mask rate in other works
* 3 primary strategies for selecting `m` gap sentences
  without replacement from a
  * Random: Uniformly select `m` sentences at random
  * Lead: Select the first `m` sentences
  * Principal: Select top-`m` scored sentences according to importance
    * As a proxy for importance we compute ROUGE1-F1 (Lin, 2004) between the
      sentence and the rest of the document, s i = rouge(x i , D \ {x i }), ∀i
    * sentences are scored
      * independently (Ind) and the top `m` selected OR
      * sequentially (Seq) as in Nallapati+ (2017) by
        greedily maximizing the ROUGE1-F1 between selected and remaining sents
    * When calculating ROUGE1-F1, we also consider n-grams
      as a set (Uniq) instead of
      double-counting identical n-grams as in the original implementation (Orig)
    * results in four variants of the principal sentence selection strategy,
      choosing Ind/Seq and Orig/Uniq options

# 5 Downstream Tasks/Datasets

* public abstractive summarization datasets, and access them through
  * TensorFlow Summarization Datasets 1 , which provides publicly reproducible
    code for dataset processing and train/validation/test splits. We used
* train/validation/test ratio of 80/10/10 if no split was provided, and
  * 10% train split as validation if there was no validation split

## XSum (Narayan+ 2018) consists of 227k BBC articles from 2010 to 2017

* a wide variety of subjects
* along with professionally written single-sentence summaries

## CNN/DailyMail (Hermann+ 2015) dataset contains

* 93k articles from the CNN, and 220k articles the Daily Mail newspapers
* Both publishers supplement their articles with bullet point summaries
* We use the non-anonymized variant used in See+ (2017)

## NEWSROOM (Grusky+ 2018) is a large dataset containing

* 1.3M article-summary pairs written by authors and editors in the newsrooms of
  38 major publications between 1998 and 2017

## Multi-News (Fabbri+ 2019) is a multi-document summarization dataset

* 56k pairs of news articles and their human-written summaries
  from the site newser.com

## Gigaword (Rush+ 2015) contains 4M examples extracted from news articles
(seven publishers) from the Gigaword corpus (Graff+ 2003). The
* task is to generate the headline from the first sentence

## arXiv, PubMed (Cohan+ 2018) are two long document datasets of scientific
publications from arXiv.org (113k) and PubMed (215k). The
* task is to generate the abstract from the paper body

## BIGPATENT (Sharma+ 2019) consists of 1.3 million U.S. patents
along with human summaries under nine patent classification categories

## WikiHow (Koupaee & Wang, 2018) is a large-scale dataset of

* instructions from the online WikiHow.com website. Each of
* 200k examples consists of multiple instruction-step paragraphs
  along with a summarizing sentence
* task is to generate the concatenated summary-sentences from the paragraphs

## Reddit TIFU (Kim+ 2019) contains 120K posts of informal stories

* from the TIFU sub-reddit from 2013-Jan to 2018-Mar. The sub-reddit posts
* strictly follow the rule of writing a descriptive ”TL;DR” summary and has
  higher quality than Völske+ (2017), which used more subreddits
  based on our manual inspection
* We uses the TIFU-long subset (using TLDR as summaries) in the work

## AESLC (Zhang & Tetreault, 2019) consists of 18k email bodies and their subjct
from the Enron corpus (Klimt & Yang, 2004), a collection of email messages of
employees in the Enron Corporation

## BillSum (Kornilova & Eidelman, 2019) contains 23k US Congressional bills and
human-written reference summaries from the 1993-2018 sessions of Congress
* We do not use the California test set which is out-of-distribution

# 6 Experiments 5

## 6.1 Ablations on PEGASUS BASE

* choices of pre-training corpus, pre-training objective, and vocabulary size

### 6.1.1 Pre-training corpus

### 6.1.2 Effect of pre-training objectives

#### GSG We compared

* six variants of GSG (Lead, Random, Ind-Orig, Ind-Uniq, Seq-Orig, Seq-Uniq)
  * Ind-Orig achieved the best performance followed by Seq-Uniq
  * Lead had
    * decent performance on the two news datasets but was
    * significantly worse on the two non-news datasets, which
    * agrees findings of lead bias in news datasets (See+ 2017; Zhong+ 2019)
* gap-sentences ratio (GSR)
  * A significant hyper-parameter in GSG
  * A low GSR makes the pre-training less challenging and computationally efficn
  * high GSR loses contextual information necessary to guide the generation
    * We compared GSRs from 15% to 75%
    * For a fair comparison, the original documents were truncated to have up to
      400 words. The maximum input length, L input in the encoder and the
      maximum target length, L target in the decoder were set as 512 tokens
  * different downstream datasets had slightly different optima
    * always had GSR lower than 50%
    * 15% gap sentences achieved the highest ROUGE scores on CNN/DailyMail,
    * XSum/Reddit TIFU and WikiHow did better with 30% and 45% respectively
    * When scaling up to PEGASUS LARGE (Section 6.2), we chose 30%

#### MLM

* can either be applied solely or together with GSG. We jointly trained MLM with
  GSG Ind-Orig (MLM & Ind-Orig), which masks 30% sentences and extra 15% tokens
* improved fine-tuning performance at early pre-training checkpoints (100k 200k
  steps), but inhibited further gains
* not to include MLM in PEGASUS LARGE

### 6.1.3 Effect of vocabulary

* We compared two tokenization methods
  * Byte-pair encoding algorithm (BPE, Wu+ 2016; Sennrich+ 2016), and
  * SentencePiece Unigram algorithm (Unigram) proposed in Kudo (2018)
    * with different vocabulary sizes ranging from 32k to 256k
* BPE and Unigram were
  * comparable on news datasets while
  * Unigram outperformed BPE on non-news datasets, especially WikiHow
  * XSum and CNN/DailyMail, Unigram 96k achieved the highest ROUGE scores
  * WikiHow and Reddit TIFU, the best configurations were Unigram 128k and 64k r
* we used the overall best vocabulary option Unigram 96k in PEGASUS LARGE

## 6.2 Larger Model Results 6

* larger
  * hidden size (H: 768 → 1024, F: 3072 → 4096, A: 12 → 16)
  * number of layers (L: 12 → 16) and traversed
  * much more data
    * larger batch size (B: 256 → 8192, same number of pre-training steps, 500k)
* We adopted the best practices found in the PEGASUS BASE ablation studies
  using
  * GSG (Ind-Orig) pre-training objective without MLM and Unigram vocabulary
    size of 96k. In total, PEGASUS LARGE had 568M parameters
* To encourage the model to copy
  * an important aspect of the more extractive datasets,
  * we left 20% of selected sentences unchanged in the input
  * We increased the GSR to 45% to achieve a similar number of “gaps” as the
    optimal 30% found above
  * We reported the performance of the models pre-trained on HugeNews and C4
    separately
  * hyper-parameter sweep of learning rate and length penalty, α, when
    fine-tuning PEGASUS LARGE on each downstream dataset
* long document
  * longer than the maximum input length (L input = 512 tokens) in
  * CNN/DailyMail, Multi-News, arXiv, PubMed, BIGPATENT datasets contain
  * problem for position embeddings which would never be updated for longer
    input lengths, but
  * sinusoidal positional encodings (Vaswani+ 2017) generalize well when
    fine-tuning PEGASUS LARGE beyond the input lengths observed in training up
    to L input = 1024 tokens
  * further scaling up L input or applying a two-stage approach (Liu+ 2018) may
    improve performance even more, although this is outside the present scope
    * since average input length in BIGPATENT, arXiv, PubMed and Multi-News are
      well beyond 1024 tokens,
* The improvement from a Transformer model without pretraining (Transformer
  BASE) to PEGASUS LARGE was more significant on smaller datasets
  * We further investigate low resource summarization in Section 6.3

## 6.3 Zero and Low-Resource Summarization 7

* we picked the first 10 `k` (`k = 1, 2, 3, 4`) training examples from each
  dataset to fine-tune PEGASUS LARGE (HugeNews).  We fine-tuned the models up
  to 2000 steps with batch size 256, learning rate 0.0005
* in 8 out of 12 datasets,
  with just 100 examples PEGASUS LARGE could be fine-tuned to generate summaries
  at comparable quality to
  Transformer BASE trained on the full supervised datasets i.e. 20k--200k examps
* PEGASUS LARGE also beat previous SOTA results on 6 out of 12 datasets with
  only 1000 fine-tuning examples
* On CNN/DailyMail, with half the number of parameters PEGASUS LARGE
  demonstrated much better zero-shot (ROUGE2-F=13.28) performance than GPT-2
  (ROUGE2-F=8.27)
* Using only 1000 examples, PEGASUS LARGE achieved ROUGE2-F of 19.35,
  * much higher than the 13.1 obtained in Khandelwal+ (2019) with 3000 examples

## 6.4 Qualitative Observations and Human Evaluation 8

* high linguistic quality (in terms of fluency and coherence)
* previous work suggested that maximum likelihood training results in repetitive
  text in model outputs (Welleck+ 2019) we found this to be rare in our outputs
* ROUGE clearly has its draw-backs (Kryscinski+ 2019),
  * over-penalizing abstractive approaches compared to extractive ones and
  * no sense of linguistic quality,
* we found that choosing perplexity-optimized models using aggregated ROUGE
  (rather than directly optimizing ROUGE as in Paulus+ (2017))
  resulted in qualitatively good models
  * Randomly sampled (by a program) model decodes across all datasets and a
    broad range of ROUGE scores can be found in Appendix I
  * even low-ROUGE model summaries often were highquality, Figure G.1
* human evaluation experiments on Amazon Mechanical Turk
  * examples were drawn from the XSum, CNN/DailyMail, and Reddit TIFU datasets;
  * the first two were chosen due to their popularity in past work, and
    the third was chosen for its significant difference in style
  * Workers were asked to rate the summaries on a 1-5 scale,
    and a paired t-test was used to assess whether scores were significantly
* two experiments,
  * PEGASUS LARGE (HugeNews), PEGASUS LARGE (C4), and Transformer BASE vs ref
  * PEGASUS LARGE (HugeNews) fine-tuned using 10, 100, 1000, and all vs ref
  * both PEGASUS LARGE (HugeNews) and PEGASUS LARGE (C4) outputs were
    at least as good as the reference summaries in all cases
    * Even at low-levels of supervision PEGASUS LARGE (HugeNews) was not
      measurably worse than human summaries on XSum and CNN/DailyMail
    * Reddit TIFU case, however, perhaps due to its diverse writing styles,
      human performance required full supervision

## 6.5 Test-set Overlap with Pre-training Corpus 9

* we calculated similarities between all pairs of downstream test set targets
  and pre-training documents
  * ROUGE-2 recall as a similarity measure
    (common 2-grams / test set targets 2-grams): necessarily exact match
  * XSum has significant amount of overlap 15% to 20%, and
    filtering those examples does not change ROUGE scores more than 1%
  * We also manually examined those overlapped examples with similarity of 1.0,
    * models produce very different summaries compared to the human written

## 6.6 Additional PEGASUS LARGE Improvements 9

* we pre-trained a PEGASUS LARGE model on both corpora and
  stochastically sampled important sentences
  * The model was pre-trained on the mixture of C4 and HugeNews
    weighted by their number of examples
  * The model dynamically chose gap sentences ratio uniformly between 15%-45%
  * Importance sentences were stochastically sampled
    with 20% uniform noise on their scores
  * The model was pre-trained for 1.5M steps instead of 500k steps,
    as we observed slower convergence of pre-training perplexity
  * The SentencePiece tokenizer was updated to encode the newline character
* PEGASUS LARGE (mixed, stochastic) model achieved best results
  on almost all downstream tasks, as shown in Table 4
