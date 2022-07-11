Leveraging Pre-trained Checkpoints for Sequence Generation Tasks
Sascha Rothe, Shashi Narayan, Aliaksei Severyn
TACL arXiv:1907.12461 [cs.CL]

* our models and predictions on various benchmarks will be available at
  https://github.com/google-research/google-re search/tree/master/bertseq2seq

# Abstract

* We developed a Transformer-based sequence-to-sequence model
  * compatible with publicly available pre-trained BERT, GPT-2 and RoBERTa chps
  * initializing our model, both encoder and decoder, with these checkpoints
* extensive empirical study on its utility
* new SOTA results on Machine Translation, Text Summarization,
  Sentence Splitting, and Sentence Fusion

# 1 Introduction

* Unsupervised and self-supervised pre-training methods have established a
  qualitatively new level of baseline performance for many benchmarks
* argued that the pre-training objective used by BERT is not well suited for
  conditional text generation in machine translation and summ (Yang+ 19)
* remains unclear, how beneficial for sequence-to-sequence generation models
* what is the best way to leverage publicly available pre-trained checkpoints
  for warm-starting sequence generation models?
  * eg BERT checkpoint to initialize the encoder and GPT-2 model as the decodr
  * we rigorously experiment with a large number of settings to
    combine BERT, GPT and RoBERTa pre-trained checkpoints
    to initialize our Transformer-based model
* three canonical conditional text generation tasks of increasing complexity
  * sentence-level fusion (DiscoFuse, Geva+ 2019) and
  * splitting (WikiSplit, Botha+ 2018)),
  * WMT14 En↔De machine translation
    using most common eval sets: newstest2014 and newstest2016, and
  * abstractive summarization using three datasets:
    * Gigaword (Napoles+ 2012),
    * CNN and DailyMail (Hermann+ 2015) and
    * BBC extreme (Narayan+ 2018a)
* significant improvements over randomly initialized models
* new SOTA results
* a pre-trained encoder is an essential component for sequence generation tasks
* often these tasks benefit from sharing the weights between encoder & decoder
* over 300 experiments spending thousands of TPU v3 hours
* Training a language specific BERT model also improves perf over multilgual

# 2 Models and Pre-trained Checkpoints

* If not stated otherwise, the implementation of the
  decoder layers are also identical to the BERT implementation
  with two adjustments
  * the self-attention mechanism is masked to look only at the left context
  * we add an encoder-decoder attention mechanism
* All models were fine-tuned on the target task using
  * Adam with a learning rate of 0.05
  * linear learning rate warmup with 40k steps,
    normalization by the square root of the hidden size, and a
    square root decay
  * no tuning of these hyperparameters (except for §5)
* batch size and the number of training steps will be reported for each task

# 3 Investigated Model Variants

* GPT, a decoder-only architecture
  * We treat the input as a conditioning prefix of a language model
  * the memory footprint of this model is smaller compared to encoder-decoder

# 4 Experiments and Results 4

## 4.4 Abstractive Summarization 6

* We evaluate our setups on three summarization datasets of varying charistics
  * Gigaword (Napoles+ 2012),
    * 3.8M _sentence_-summary training pairs
  * CNN and DailyMail (Hermann+ 2015), and
    * 287k document-summary pairs
    * bullet-point story highlights with a high degree of extraction,
    * requiring the models to learn to copy from the source documents
  * BBC extreme (Narayan+ 2018a)
    * 204k document-summary pairs
    * extreme, in that the documents are summarized into single-sentence summs
    * high level of abstractiveness
    * requires document-level inference, abstraction, and paraphrasing
* not anonymize entities
* casing
  * original cased versions of CNN/DailyMail and BBC datasets
  * Gigaword: lowercased version to match the pub available lowercased test
* truncation
  * input documents: to 512 tokens for CNN/DailyMail and BBC, and to 128 tokens
  * summaries was limited to 128 tokens for CNN/DailyMail, 64 for BBC, and 32
* global batch size of 128 document-summary pairs for CNN/DailyMail and BBC, &
* number of training steps depending on the training data sizes
  * 500k, 300k and 200k steps for the Gigaword, CNN/DailyMail and BBC
* standard publicly available test sets; these consists of
  * 1951 instances for Gigaword, 11490 for CNN/DailyMail and 11334 for BBC
* We report on the ROUGE F 1 scores (Lin and Hovy, 2003); in particular
  * ROUGE-1 and ROUGE-2 for informativeness and ROUGE-L for fluency in Table 5

### Document understanding 7

* The BERT SHARE setup with shared encoder and decoder parameters achieves
  better performance than BERT 2 BERT on all three datasets
  * gains are larger on the BBC dataset than on the Gigaword and CNN/DailyMail
  * probably because the BBC summary sentences follow a distribution that is
    similar to that of the sentences in the document, whereas
    this is not necessarily the case for the Gigaword headlines and the
    CNN/DailyMail bullet-point highlights
* ROBERTA SHARE performs ?> to BERT SHARE
  * superior on the CNN/DailyMail and BBC datasets
  * competitively on the Gigaword dataset where the input is sentences

### Summarization with GPT checkpoints

* GPT (decoder-only) ?> RND 2 GPT , BERT 2 GPT or ROBERTA 2 GPT (enc-dec)
  * better by a large margin for generating CNN/DailyMail extracts, but
  * poorer for generating BBC abstracts
  * encoder-decoder architecture where the input document is modeled separately
    is better equipped for document-level abstraction
    than the decoder-only architectures
    where the input document is a conditioning prefix of a language model
* Initialization with different checkpoints, eg BERT 2 GPT
* Gigaword: ROBERTA SHARE performs the best
  * on par with the current SOTA MASS model (Song+ 2019)
* BBC extreme: The ROBERTA SHARE setup sets a new SOTA,
  outperforming all existing baselines by a large margin
* CNN/DailyMail dataset:
  * The best model outperforms the Pointer Generator network (See+ 2017) and
    the pre-trained single-decoder model with TransformerLM (Khandelwal+ 2019)
  * lags behind the
    * Bottom-Up system (Gehrmann+ 2018)
      with a task-specific module for content selection
      along with the copy mechanism (Gu+ 2016)
    * UniLM model (Dong+ 2019)
      * BERT-Large pre-trained for Bidirectional, unidirectional and seq2seq LM
      * also fine-tuned with an additional extractive summarization objective
        to predict relevant sentences in the document
        * this objective could be beneficial to generate the CNN/DailyMail extr

# 5 Discussion on Ablation Studies 8

## Combining Different Checkpoints

* Combining BERT and GPT-2 into a single model (BERT 2 GPT) did not work
* presumable because the model has to learn two different vocabularies
  * backed by the fact that for MT de→en the BERT 2 GPT setup performed well
    * two vocabularies have to be learned anyways and
    * the output is English, where GPT-2 was trained on

## Tuning GPT-2 Based Models

* setups using the GPT-2 checkpoint performed relatively poorly given that it
* we tuned the learning rate, the warmup steps, and the optimizer ∈ {Adam,
  Adafactor} for the GPT-2 based setups ( RND 2 GPT , GPT , BERT 2 GPT ) on the
  DiscoFuse dataset
* slightly higher numbers but not at a magnitude that would suggest a
  previously suboptimal setting.  Specifically, we got a
* SARI score of 88.8 compared to 88.4 for BERT 2 GPT , 88.1 compared to 88.0
  for GPT and 87.7 compared to 86.5 for RND 2 GPT

## Initializing only Embeddings

* almost no improvement over the fully randomly initialized model RND 2 RND

## Initializing only Layers

* sometimes the vocabulary given from a public checkpoint might not be optimal
  for a certain task
* the BERT vocabulary was already optimal for DiscoFuse
* GPT: still behind the fully initialized setup
* Finally, we tried a more sensitive way of training the model
  * for 100k steps, we only train the new word embeddings
  * then we fine-tune the entire model for another 300k steps
  * still way behind the fully initialized setup

## Initializing a Subset of Layers

* still has more parameters then the base model, but can be trained with the
  same batch size, in a comparable amount of time (3 min/1000 iterations)
* hyperparameter search on the evaluation set using CMA-ES (Hansen, 2016) to
  find an optimal subset of layers to use. The best setup used the following
  layers: 9, 10, 13-18, 23, 24; and achieved a SARI score of 89.1
* still outperformed by the base BERT model

# 6 Analysis of Abstractive Summaries 9

## Human Assessment of Summary Quality

* Our participants found the ROBERTA SHARE summaries to be the best in terms of
  their overall quality; the BERT SHARE summaries ranked second
* whether system differences are statistically significant

## Summary Lengths and Repetitions

* All models generated summaries of comparable lengths
  * ROBERTA SHARE summaries were closest to the GOLD summaries in length
* we estimated the percentage of summaries with at least one repetition of rare
  or content words. We discarded the 500 most common words from the model
  generated and reference summaries, the rests were considered as rare/content
* BERT SHARE and ROBERTA SHARE summs are unequivocally better than RND 2 GPT
  * in terms of both automatic evaluations (ROUGE) and human evaluation

# 7 Related Work 12
