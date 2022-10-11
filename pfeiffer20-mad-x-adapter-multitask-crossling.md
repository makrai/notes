MAD-X: An Adapter-Based Framework for Multi-Task Cross-Lingual Transfer
Jonas Pfeiffer, Ivan Vulić, Iryna Gurevych, Sebastian Ruder
EMNLP 2020

code and adapters: AdapterHub.ml

# Abstract

* pre-trained multilingual models such as multilingual BERT and XLM-R
  * main goal is enabling and bootstrapping NLP applications in low-resource ls
    through zero-shot or few-shot cross-lingual transfer
  * hE limited model capacity, transfer performance is the weakest exactly on
    such low-resource languages and languages unseen during pre-training
* we propose
  * MAD-X, an adapter-based framework that enables high portability and
    parameter-efficient transfer to arbitrary tasks and languages
    * modular language and task representations
  * invertible adapter architecture
  * a strong baseline method
    for adapting a pre-trained multilingual model to a new language
* exper
  * outperforms the SOTA in cross lingual transfer across
    a representative set of typologically diverse languages on
    named entity recognition and causal commonsense reasoning
  * competitive results on question answering

# 1 Intro

* deep pretrained multilingual models (Devlin+ 2019; Conneau and Lample, 2019)
  * SOTA results on cross-lingual transfer, but not represent all languages
  * Evidence for this is the importance of the vocabulary size (Artetxe+ 2020)
  * curse of multilinguality (Conneau+ 2020)
    * a trade-off between language coverage and model capacity
  * issue even for high-resource languages where
    SOTA multilingual models underperform their monolingual variants
    (Eisenschlos+ 2019; Virtanen+ 2019; Nozza+ 2020), and
  * performance decreases further with lower-resource languages covered by the
  * issue arguably most severe for languages that were not included in the
    training data at all (Ponti+ 2020b)
* we propose Multiple ADapters for Cross-lingual transfer (MAD-X), a
  * modular framework that leverages a small number of extra parameters to
    address the fundamental capacity issue that limits pretrained multiling mds
* Using a SOTA multilingual model as the foundation,
    we adapt the model to arbitrary tasks and languages
    by learning modular languageand task-specific representations via adapters
    (Rebuffi+ 2017; Houlsby+ 2019)
    * small bottleneck layers inserted between a model’s weights
* using a recent efficient adapter variant (Pfeiffer+ 2020a; Rücklé+ 2020),
    we train
    * language-specific adapter modules via masked language modelling (MLM) on
      unlabelled target language data, and
    * task-specific adapter modules via optimising a target task on labelled data
      in any source language
  * Task and language adapters are stacked as in Figure 1,
    allowing us to adapt the pretrained multilingual model also to languages
    that are not covered in the model’s (pre)training data
    by substituting the target language adapter at inference
* to deal with a mismatch between the shared multilingual vocabulary and target
  * invertible adapters, a new type of adapter that is
    well suited to performing MLM in another language. Our framework
  * goes beyond prior work on using adapters for crosslingual transfer
    (Bapna and Firat, 2019; Artetxe+ 2020) by enabling
  * adaptation to languages unseen during pretraining and
    without learning expensive language-specific token-level embeddings
* We compare MAD-X against
  * WikiANN NER dataset (Pan+ 2017; Rahimi+ 2019) and the
  * XCOPA dataset (Ponti+ 2020a) for causal commonsense reasoning, relying on a
    * typologically diverse languages which includes high-resource,
      lowresource, as well as languages unseen by the pre-trained model
* MAD-X outperforms the baselines on seen and unseen high~ and low-resource and
  * On the high-resrc langs of the challenging XQuAD QA dataset (Artetxe+ 2020)
    * competitive performance while being more parameter-efficient
* a simple method of adapting a pretrained multilingual model to a new lang,
  * outperforms the standard setting of transferring a model
    only from labelled source language data
* In sum, our contributions are as follows
  * MAD-X, a modular framework that mitigates the curse of multilinguality and
    adapts a multilingual model to arbitrary tasks and languages
    * code and adapter weights are integrated into the AdapterHub.ml repository
      (Pfeiffer+ 2020b)
  * We propose invertible adapters, a new adapter variant for cross-ling MLM
  * strong performance and robustness across diverse languages and tasks
  * simple and more effective baseline method
    for adapting a pretrained multilingual model to target languages
  * We shed light on the behaviour of current methods
    on languages that are unseen during multilingual pretraining
* from the conclusion
  * model-agnostic and can be adapted to any current pre-trained multilingual
    model as foundation

# 2 Related Work

## Cross-lingual Representations Research in modern cross-lingual NLP is

* general-purpose cross-lingual representations: can be applied to many tasks,
  * word level (Mikolov+ 13; Gouws+ 15; Glavaš+ 19; Ruder+ 19; Wang+ 20) and
  * sentence level (Devlin+ 19; Conneau and Lample, 2019; Cao+ 2020).  More
* large Transformer (Vaswani+ 2017) models pretrained on much multiling data
  * eg multilingual BERT (Devlin+ 2019)
  * perform surprisingly well when transferring to other languages
    (Pires+ 2019; Wu and Dredze, 2019; Wu+ 2020) and
  * the current SOTA model, XLM-R is competitive with the performance of
    monolingual models on the GLUE benchmark (Conneau+ 2020)
  * hE still perform poorly on cross-lingual transfer across many lang pairs .
    (Hu+ 2020), 
    * main reason: lack of capacity in the model to represent all languages
      equally in the vocabulary and representation space
      (Bapna and Firat, 2019; Artetxe+ 2020; Conneau+ 2020)

## Adapters Adapter modules have been

* originally studied in computer vision tasks where they have been
  * restricted to convolutions and used to adapt a model for multiple domains
    (Rebuffi+ 2017, 2018)
* In NLP, adapters have been mainly used
  for parameter-efficient and quick fine-tuning of a base pretrained
  Transformer model
  * to new tasks (Houlsby+ 2019; Stickland and Murray, 2019) and
  * new domains (Bapna and Firat, 2019),
  * avoiding catastrophic forgetting (McCloskey and Cohen, 1989; Santoro+ 2016)
  * to fine-tune and recover performance of a multilingual NMT model on
    high-resource languages (Bapna and Firat 2019)
    * approach cannot be applied to languages that were not seen during pretrai
  * to transfer a pretrained monoling model to an unseen langs (Artetxe+ 2020)
    * learn new token-level embeddings, which do
      not scale to a large number of languages
* Pfeiffer+ (2020a) combine the information stored in multiple adapters for
  more robust transfer learning between monolingual tasks.  In their
* contemporaneous work, Üstün+ (2020) generate adapter parameters from language
  embeddings for multilingual dependency parsing.

# 3 Multilingual Model Adaptation for Cross-lingual Transfer

# 4 Adapters for Cross-lingual Transfer

* Our framework comprises three types of adapters:
  language, task, and invertible adapters
* As in previous work (Rebuffi+ 2017; Houlsby+, 2019), adapters are trained
  while keeping the parameters of the pretrained multilingual model fixed. Our
  framework thus enables learning language~ and task-specific transformations
  in a modular and parameter-efficient way. We show the full framework as
  part of a standard Transformer model in Figure 1 and describe the three
  adapter types.

# 5 Experiments

# 6 Results and Discussion

## Named Entity Recognition

* aggregated results: tab 2 
  * we average the cross-lingual transfer results of each method for each
    source language across all 16 target languages on the NER dataset.
  * appendix
    * detailed results for all methods across each single language pair as well
    * comparison of methods on the most common setting with English as source
* XLM-R performance is indeed lowest for unseen languages (the right half)
  * XLM-R Base MLMSRC performs worse than XLM-R, which indicates that
    source-language finetuning is not useful for cross-lingual transfer in genl
    * However, there are some examples (eg JA , TK ) where it does yield slight
  * XLM-R Base MLM-TRG is a stronger transfer method than XLM-R on average,
    * gains in 9/16 target languages.
    * gains seem to vanish for low-resource languages. Further, there is
      another disadvantage, outlined in §3: XLM-R Base MLMTRG requires
      fine-tuning the full large pretrained model separately for each tgt lang
      * can be prohibitively expensive.
* MAD-X without language~ and invertible adapters performs on par with XLM-R
  for almost all languages present in the pretraining data (left half)
  * This mirrors findings in the monolingual setting where task adapters have
    been observed to achieve performance similar to regular fine-tuning while
    being more parameter-efficient (Houlsby+, 2019). However, looking at
  * hE unseen languages, the performance of MAD-X that only uses task adapters
    deteriorates significantly compared to XLM-R. This shows that
    * ie task adapters alone are not expressive enough to bridge lang discrep
* Adding language adapters to MAD-X improves its performance across the board,
  * especially pronounced for low-resource languages.  Language adapters help
  * Even for high-resource languages: substantial improvements
* invertible adapters provide further gains and
  generally outperform only using task and language adapters: for instance, we
  * eg gains with MAD-X over MAD-X – INV on 13/16 target languages
* Overall, the full MAD-X framework improves upon XLM-R by more than 5 F 1
* To demonstrate that our framework is model-agnostic, we also employ two other
  strong multilingual models, XLM-R Large and mBERT as foundation for MAD-X and
  * stronger base pretrained models.
  * Table 2. MAD-X shows consistent improvements
* different languages
  * fig 3 shows its relative performance against XLM-R in the standard setting
  * largest differences in performance when transferring from high-resource to
    low-resource and unseen languages (top-right quadrant of Figure 3), which
  * In particular, we observe strong gains when transferring
    * from Arabic, whose script might not be well represented in XLM-R’s vocab
    * in the in-language monolingual setting (diagonal) for low-resource langs
    * competitively even when the target language is high-resource. 6
* appendix plots relative performance of the full MAD-X method (with all three
  adapter types) versus XLM-R Base MLM-TRG across all language pairs. The
  * similar conclusions as before: the
    * largest benefits of MAD-X are observed for the set of low-resource target
    * the proposed XLM-R Base MLM-TRG transfer baseline is more competitive
      than the standard XLM-R transfer across a substant number of lang pairs

## Causal Commonsense Reasoning We show re-
sults on transferring from English to each target
language on XCOPA in Table 3. For brevity, we
only show the results of the best fine-tuning set-

## Question Answering The results on XQuAD
when transferring from English to each target lan-
guage are provided in Table 4. The main finding is
that MAD-X achieves similar performance to the

XLM-R baseline. As before, invertible adapters
generally improve performance and target language
adaptation improves upon the baseline setting. We
note that all languages included in XQuAD can
be considered high-resource, with more than 100k

Wikipedia articles each (cf. Wikipedia sizes of

NER languages in Table 1). The corresponding
setting can be found in the top-left quadrant in Fig-
ure 3 where relative differences are comparable.

These and XCOPA results demonstrate that,
while MAD-X excels at transfer to unseen and low-
resource languages, it achieves competitive perfor-
mance even for high-resource languages and on
more challenging tasks. These evaluations also hint
at the modularity of the adapter-based MAD-X ap-
proach, which holds promise of quick adaptation
to more tasks: we use exactly the same language-
specific adapters in NER, CCR, and QA for lan-
guages such as English and Mandarin Chinese that
appear in all three evaluation language samples.

# 7 Further Analysis

## Impact of Invertible Adapters We also analyse
the relative performance difference of MAD-X
with and without invertible adapters for each source
language–target language pair on the NER data
set (see Section D in the appendix). Invertible
adapters improve performance for many transfer
pairs, and particularly when transferring to low-
resource languages. Performance is only consis-
tently lower with a single low-resource language as
source (Maori), likely due to variation in the data.

Sample Efficiency The main adaptation bottle-
neck of MAD-X is training language adapters and
invertible adapters. However, due to the modularity
of MAD-X, once trained, these adapters have an
advantage of being directly reusable (ie “plug-
and-playable”) across different tasks (see the dis-
cussion in §6). To estimate the sample efficiency of
adapter training, we measure NER performance on
7661several low-resource target languages (when trans-
ferring from English as the source) conditioned on
the number of training iterations. The results are
given in Figure 4. They reveal that we can achieve
strong performance for the low-resource languages
already at 20k training iterations, and longer train-
ing offers modest increase in performance.

Moreover, in Table 5 we present the number
of parameters added to the original XLM-R Base
model per language for each MAD-X variant. The
full MAD-X model for NER receives an additional
set of 8.25M adapter parameters for every language,
which makes up only 3.05% of the original model.

# Conclusions

* future work, we will apply MAD-X to
  * other pre-trained models, and employ
  * adapters that are particularly suited for langs with eg with dif scripts).
  * evaluate on additional tasks, and investigate
  * leveraging pre-trained language adapters from related languages for
    improved transfer to truly low-resource languages with limited monoling dat
