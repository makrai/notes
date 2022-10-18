MAD-X: An Adapter-Based Framework for Multi-Task Cross-Lingual Transfer
Jonas Pfeiffer, Ivan Vulić, Iryna Gurevych, Sebastian Ruder
EMNLP 2020

code and adapters: AdapterHub.ml

# Abstract

* pre-trained multilingual models such as multilingual BERT and XLM-R
  * main goal is enabling and bootstrapping NLP applications in low-resource ls
    through zero-shot or few-shot cross-lingual transfer
  * hE limited model capacity => transfer performance is the weakest exactly on
    such low-resource languages and languages unseen during pre-training
* we propose
  * MAD-X, an adapter-based framework that enables high portability and
    parameter-efficient transfer to arbitrary tasks and languages
    * modular language and task representations
  * invertible adapter architecture
  * a strong baseline method
    for adapting a pre-trained multilingual model to a new language
* experiments
  * outperforms the SOTA in cross lingual transfer
    across a representative set of typologically diverse languages
    on named entity recognition and causal commonsense reasoning
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
  * performance decreases further with lower-resource languages covered by LM
  * issue arguably most severe for languages that were not included in the
    training data at all (Ponti+ 2020b)
* we propose Multiple ADapters for Cross-lingual transfer (MAD-X)
  * modular framework that leverages a small number of extra parameters to
    address the fundamental capacity issue that limits pretrained multiling mds
* Using a SOTA multilingual model as the foundation,
  we adapt the model to arbitrary tasks and languages
  by learning modular language~ and task-specific representations via adapters
  (Rebuffi+ 2017; Houlsby+ 2019)
  * small bottleneck layers inserted between a model’s weights
* using a recent efficient adapter variant (Pfeiffer+ 2020a; Rücklé+ 2020),
  * A Rücklé, G Geigle, M Glockner, T Beck, J Pfeiffer, N Reimers, I Gurevych
    AdapterDrop: On the Efficiency of Adapters in Transformers
    2020 arXiv
  * we train
    * language-specific adapter modules via MLM on unlabelled target lang data
    * task-specific adapter modules via optimising a target task
      on labelled data in any source language
  * Task and language adapters are stacked as in Figure 1,
    allowing us to adapt the pretrained multilingual model also to languages
    that are not covered in the model’s (pre)training data
    by substituting the target language adapter at inference
* to deal with a mismatch between the shared multilingual vocabulary and target
  * invertible adapters, a new type of adapter that is
    well suited to performing MLM in another language
  * adaptation to languages unseen during pretraining and
    without learning expensive language-specific token-level embeddings
  * goes beyond prior work on using adapters for crosslingual transfer
    (Bapna and Firat, 2019; Artetxe+ 2020)
* experiments
  * WikiANN NER dataset (Pan+ 2017; Rahimi+ 2019) and the
  * XCOPA dataset (Ponti+ 2020a) for causal commonsense reasoning
  * typologically diverse languages which includes
    high-resource, lowresource, as well as languages unseen by the pre-trained
* MAD-X outperforms the baselines on seen and unseen high~ and low-resource
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
  * model-agnostic and can be adapted to any current pre-trained multiling mod

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
  * hE still perform poorly on cross-lingual transfer across many lang pairs
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
  embeddings for multilingual dependency parsing

# 3 Multilingual Model Adaptation for Cross-lingual Transfer

## Standard Transfer Setup (cross-lingual transfer with SOTA large multiling)

* multilingual BERT or XLM-R is
  1. to fine-tune it on labelled data of a downstream task in a source language
  2. apply it directly to perform inference in a target language (Hu+, 2020). A
* hE the multilingual initialisation balances many languages.  It is thus
  * not suited to excel at a specific language at inference time
* We propose a simple method to ameliorate this issue by allowing the model to
  additionally adapt to the particular target language

## Target Language Adaptation

* Similar to finetuning monolingual models on the task domain (Howard and
  Ruder, 2018)
* we propose to finetune a pretrained multilingual model via MLM on unlabelled
  prior to taskspecific fine-tuning in the source language
* A disadvantage of this approach is that it
  no longer allows us to evaluate the same model on multiple target languages
  as it biases the model to a specific target language. However, this approach
* might be preferable if we only care about performance in a specific (ie
  fixed) target language
* results in improved cross-lingual transfer performance over the standard
  setting (§6)
  * no catastrophic forgetting of the multilingual knowledge already available
    in the pretrained model that enables the model to transfer to other langs
* experimenting with methods that explicitly try to prevent catastrophic
  forgetting (Wiese+, 2017) led to worse performance in our experiments
* inherits the fundamental limitation of the pret LM + standard transfer setup
  * the model’s limited capacity hinders effective adaptation to low-resource
    and unseen languages. In addition, fine-tuning the full model does not
    scale well to many tasks or languages

# 4 Adapters for Cross-lingual Transfer

* Our framework comprises three types of adapters:
  language, task, and invertible adapters
* As in previous work (Rebuffi+ 2017; Houlsby+, 2019), adapters are trained
  while keeping the parameters of the pretrained multilingual model fixed. Our
  framework thus enables learning language~ and task-specific transformations
  in a modular and parameter-efficient way. We show the full framework as
  part of a standard Transformer model in Figure 1 and describe the three
  adapter types

## 4.1 Language Adapters

* fig 1: we employ the recent efficient adapter archit by Pfeiffer+ (2020a)
  * Following Houlsby+ (2019) they define
  * the interior of the adapter to be a simple down~ and up-projection combined
    with a residual connection
  * The language adapter LA l at layer l consists of
    a down-projection D ∈ R h×d where h is the hidden size of the Transformer
    model and d is the dimension of the adapter, followed by
    a ReLU activation and an up-projection U ∈ R d×h at every layer l where h l
    and r l are the Transformer hidden state and the residual at layer l, resp
  * The residual connection r l is the output of the Transformer’s feed-forward
    layer whereas h l is the output of the subsequent layer normalisation
* We train language adapters on unlabelled data of a language using MLM, which
  encourages them to learn transformations that make the pretrained
  multilingual model more suitable for a specific language
* During task-specific training with labelled data, we use the language adapter
  of the corresponding source language, which is kept fixed. In order to
  perform zero-shot transfer to another language, we simply replace the source
  language adapter with its target language component.  For
* eg fig 1 we can simply replace a language-specific adapter trained for
  English with a language-specific adapter trained for Quechua at inference
  time. This, however, requires that the underlying multilingual model does not
  change during fine-tuning on the downstream task. In order to ensure this, we
  additionally introduce task adapters that capture task-specific knowledge

## 4.2 Task Adapters

* the same architecture as language adapters. They similarly consist of a
  down-projection D ∈ R h×d , a ReLU activation, followed by an up-projection
  They are stacked on top of the language adapters and thus receive the output
  of the language adapter LA l as input, together with the residual r l of the
  Transformer’s feed-forward layer 3 :
* Initial experiments showed that this residual connection performs better than
  one to the output of the language adapter
* The output of the task adapter is then passed to another layer normalisation
  component. Task adapters are the only parameters that are updated when
  training on a downstream task (eg NER) and aim to capture knowledge that is
  task-specific but generalises across languages

## 4.3 Invertible Adapters

* The majority of the “parameter budget” of pretrained multilingual models is
  spent on token embeddings of the shared multilingual vocabulary. Despite
  * they underperform on low-resource languages (Artetxe+, 2020; Conneau+ 2020)
  * fare even worse for languages not covered by the model’s training data
* In order to mitigate this mismatch between multilingual and target language
  vocabulary, we propose invertible adapters
  * stacked on top of the embedding layer while their respective inverses
    precede the output embedding layer (see Figure 1)
  * input and output embeddings are tied in multilingual pretrained models,
    => invertibility allows us to leverage the same set of parameters for
    adapting both input and output representations
  * crucial as the output embeddings, which get discarded during task-specific
    fine-tuning might otherwise overfit to the pretraining task
* fig 2: To ensure this invertibility, we employ
  Nonlinear Independent Component Estimation (NICE; Dinh+, 2015)
  * NICE enables the invertibility of arbitrary non-linear functions through a
    set of coupling operations (Dinh+, 2015)
  * For the invertible adapter, we split the input embedding vector e i of the
    i-th token into two vectors of equal dimensionality e 1,i , e 2,i ∈ R h/2
* The invertible adapter has a similar function to the language adapter,
  but aims to capture token-level language-specific transformations
  * trained together with the language adapters using MLM on unlabelled data of
  * During task-specific training we use the fixed invertible adapter of the
    source language, and replace it with the target-language invertible during
    zeroshot transfer
  * much more parameter-efficient compared to the approach of Artetxe+ (2020),
    which learns separate token embeddings for every new language

# 5 Experiments

# 6 Results and Discussion

## Named Entity Recognition

* aggregated results: tab 2
  * we average the cross-lingual transfer results of each method for each
    source language across all 16 target languages on the NER dataset
  * appendix
    * detailed results for all methods across each single language pair as well
    * comparison of methods on the most common setting with English as source
* XLM-R performance is indeed lowest for unseen languages (the right half)
  * XLM-R Base MLMSRC performs worse than XLM-R, which indicates that
    source-language finetuning is not useful for cross-lingual transfer in genl
    * However, there are some examples (eg JA , TK ) where it does yield slight
  * XLM-R Base MLM-TRG is a stronger transfer method than XLM-R on average,
    * gains in 9/16 target languages
    * gains seem to vanish for low-resource languages. Further, there is
      another disadvantage, outlined in §3: XLM-R Base MLMTRG requires
      fine-tuning the full large pretrained model separately for each tgt lang
      * can be prohibitively expensive
  * Wikipedia sizes of NER languages in Table 1
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
  * stronger base pretrained models
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

## Causal Commonsense Reasoning We show results on transferring

* tab 3: from English to each target language on XCOPA in Table 3
* only shown: the results of the best fine-tuning setting from Ponti+ (2020a)
  * fine-tuning first on SIQA (Sap+, 2019) and on the English COPA training
  * other possible settings in the appendix
* Target language adaptation outperforms XLM-R Base while
* MAD-X Base achieves the best scores
  * in particular for the two unseen langs, Haitian Creole (ht) & Quechua (qu)
  * other languages: also generally competitive or better

## Question Answering (XQuAD) when transferring

* tab 4: from English to each target language are provided in Table 4. The
  * MAD-X achieves similar performance to the XLM-R baseline. As before,
  * invertible adapters generally improve performance and
  * target language adaptation improves upon the baseline setting
  * all languages included in XQuAD can be considered high-resource
    * with more than 100k Wikipedia articles each
    * corresponding to the top-left quadrant in NER Figure 3
      * relative differences are comparable

## Summ XCOPA + XQuAD

* MAD-X excels at transfer to unseen and low-resource languages, it achieves
* competitive performance even for high-resource languages and on more
  challenging tasks. These evaluations also hint at the modularity of the
  adapter-based MAD-X approach, which holds promise of quick adaptation to more
* we use exactly the same languagespecific adapters in NER, CCR, and QA for
  languages that appear in all three evaluation language samples eg En, Mandar

# 7 Further Analysis

## Impact of Invertible Adapters, the relative performance difference of MAD-X

* for each source language–target language pair on the NER data set (see
  Section D in the appendix)
* Invertible adapters improve performance for many transfer pairs, and
  particularly when transferring to low-resource languages. Performance is
* consistently lower perf with a single low-resource language as source (Maori)
  * likely due to variation in the data

## Sample Efficiency The main bottleneck of MAD-X is lang and invb adapters

* nL due to the modularity of MAD-X, once trained, these adapters have an
  advantage of being directly reusable (ie “plug-and-playable”) across
  different tasks (see the discussion in §6). To estimate the sample efficiency
* fig 4: we measure NER performance on several low-resource target languages
  (from En) conditioned on the number of training iterations.  The results are
  * strong perf for the low-resource languages already at 20k train iters
  * longer training offers modest increase in performance
* Table 5 presents the number of parameters added to the original XLM-R Base
  per language for each MAD-X variant
  * The full MAD-X model for NER receives an additional set of 8.25M adp params
    for every language, which makes up only 3.05% of the original model

# Conclusions

* future work, we will apply MAD-X to
  * other pre-trained models, and employ
  * adapters that are particularly suited for langs with eg with dif scripts)
  * evaluate on additional tasks, and investigate
  * leveraging pre-trained language adapters from related languages for
    improved transfer to truly low-resource languages with limited monoling dat
