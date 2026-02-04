SpeechPrompt v2: Prompt Tuning for Speech Classification Tasks
Kai-Wei Chang, Yu-Kai Wang, Hua Shen, Iu-thing Kang, Wei-Cheng Tseng,
  Shang-Wen Li, Hung-yi Lee
arXiv:2303.00733 [eess.AS]

* Prompt tuning tunes a small set of parameters to steer a pre-trained LM to
  directly generate the output for downstream tasks. Recently, prompt tuning has
  * storage and computation efficiency in both NLP and speech processing fields
  * serving pre-trained LM for multiple tasks in a unified manner
* SpeechPrompt shows its high parameter efficiency and competitive performance
  on a few speech classification tasks
  * whether SpeechPrompt is capable of serving a large number of tasks
* we propose SpeechPrompt v2, a prompt tuning framework capable of performing a
  wide variety of speech classification tasks, covering
  * multiple languages and prosody-related tasks
  * performance on par with prior works with less than 0.15M trainable
    parameters in a unified framework
* from the Conclu:
  * We introduce a learnable verbalizer in SpeechPrompt to enhance classif
  * experiments with two types of spoken language models, GSLM and pGSLM. The

# 1. INTRODUCTION

* self-supervised (SSL) pre-trained models have become an important component of
  * generate general-purpose reprs learned from large-scale unlabeled corpus
    (Mohamed, Lee, Borgholt,  Havtorn, Edin, Igel+ review arXiv:2205.10643)
* pre-train, fine-tune” paradigm. Under this paradigm, a task-specific
  * SOTA performance on various speech processing tasks. However, this
  * hE requires a delicately-designed downstream model and loss function for
    each task, causing an increasing burden of human labor. Also, it
  * heavy computation and storage resources when the number of tasks scales
* the prompting paradigm [2] as an alternative method to utilize pre-trained
  * a taskspecific template or instruction to steer a pre-trained LM without
    modifying its architecture and parameters. The prompting method can serve
  * either in a masked prediction or generative manner. For instance, in
  * eg sentiment classification, an input sentence `<S>` can be fit into a
    template: “`<S>`. It was _.” and then fed into a pre-trained LM
  * The LM’s output (e.g., great, terrible) is then transformed into sentiment
    classes (positive, negative) by a verbalizer, which is
    * typically a hand-crafted mapping function. This approach enables us to
  * benefits over the typical “pre-train, fine-tune” paradigm. For instance, we
    * no longer need to design a downstream model for each task. All tasks can
    * computationally and storage efficient. Under the premise of fixing the
  * prompt tuning updates a small number of continuous prompt vectors has been
  * eg prefix-tuning [3] performs deep prompt tuning, where
    trainable prompts are concatenated at the input of the LM’s Transformer
    layers
* SpeechPrompt [4] applies prompt tuning
  on Generative Spoken Language Model (GSLM) [5] to perform
  speech classification and sequence generation tasks
  * hE only in limited speech processing tasks and datasets. To this end, we
* we: prompting paradigm on a wide range of speech classification tasks. We
  * SpeechPrompt v2, a prompt tuning framework capable of performing various
  * including content and prosody-related tasks, covering various languages
* contributions are threefold:
  * SpeechPrompt v2, a prompt tuning framework capable of performing a wide
    range of speech classification tasks with
    performance comparable to prior works using
    uniformed model architectures and limited trainable parameters
  * a collection of speech classification tasks
    to evaluate self-supervised spoken generative models.  The tasks
    * include content-related and prosody-related tasks in multiple languages
  * a learnable verbalizer that consistently improves the performance
    for prompting spoken language models. Also, an (ablation) analysis

# 2. RELATED WORKS

## 2.1. Generative Spoken Language Models model various speech characteristics

* Generative Spoken Language Model (GSLM) [5] performs
  generative language modeling on
  discrete units which serve as pseudo text carrying phonetic information
  encoded by SSL speech models
* prosody-aware Generative Spoken Language Model (pGSLM) [6] further extends the
  * A multi-stream Transformer was proposed to simultaneously model the
    discrete units, duration, and pitch information of the speech signal
* These spoken LMs perform in a generative manner and can be regarded as
  * speech versions of GPTs [6]
  * prompting in the speech processing field

## 2.2. Prompting and Reprogramming in Speech Processing

* prompting has also been explored in the speech processing field
* WAVPROMPT [7] adopts GPT-2 as the backbone LM and
  encodes audio into the prompt to perform spoken language understanding (SLU)
* SpeechPrompt [4] performs prompt tuning on GSLM
  for speech classification and sequence generation tasks
  * verbalizer: A heuristic frequency-based verbalizer is introduced to
    map the GSLM’s vocabulary units to the classes of the downstream task
  * hE not significantly outperform the random-mapping method. To this end,
* we propose a learnable verbalizer in SpeechPrompt v2 to improve performance
* model reprogramming. In
  * bib
    * [8] C. H.Yang, Y.Tsai, and P.Chen, “
      Voice2series: Reprogramming acoustic models for time series classifi-
      ICML. 2021, vol. 139 of Proceedings of Machine Learning Research, pp
    * [9] H.Yen, P.Ku, C. H.Yang, H.Hu, S. M.Siniscalchi, P.Chen, and Y.Tsao, “
      A study of low-resource speech commands recognition
        based on adversarial reprogramming,” CoRR, vol. abs/2110.03894, 2021
  * the input data (target domain) is first transformed with a task-specific
    function
    The pre-trained acoustic model is then capable of generating labels
    for the reprogrammed data
  *  labels (source domain) are then mapped to the classes of downstream tasks
     (target domain) by a mapping function
  * This function serves the same role as the verbalizer in the prompting method
  * usually a random mapping

# 3 Method: bringing prompting techniques to speech

* we learn task-specific prompt vectors P. By conditioning the LM M on the input
* the LM’s output, which is then mapped to task labels using a verbalizer v to
* In SpeechPrompt v2, we adopted GSLM and pGSLM as our backbone LMs, and in the
  following, we explain the implementation details of SpeechPrompt v2 for

## 3.1. Prompt Tuning

* In GSLM and pGSLM, an utterance is first encoded into discrete units u
  by an SSL model and a K-means quantizer. The difference between GSLM and pGSLM
  * pGSLM also extracts
    duration d and pitch information f (log fundamental frequency) from the
* Prompt vectors p I are then concatenated at the input
* deep prompt tuning [3, 4] to enhance the prompt’s instruction ability
  * Given the j th Transformer layer that takes the embedding x j as input,
    we concatenate the prompt vectors p K and p V to manipulate the key and the
    value in the attention function Attn(Q, K, V )

## 3.2. Learnable Verbalizer

* in prompting, verbalizer connects the LM’s output to downstream classes
* v maps the LM’s vocabulary to classes of tasks. For example, in
* eg sentiment classification, the word “great” is mapped to the positive
* SpeechPrompt [4] leverages a statistical frequency-based mapping as the
* hE information loss problem (Fig. 2) and does
  not consistently outperform random mapping method. In
* we, SpeechPrompt v2: a learnable linear model to implement the verbalizer v. v
  * input the output distribution over the vocabulary of spoken LMs and maps the
  * output: the classes of downstream tasks
* prompt vectors P and the verbalizer v are optimized jointly with a loss
* use cross-entropy for every task

# 4. EXPERIMENTAL SETUP

## 4.1. Tasks and Datasets

* we evaluate SpeechPrompt v2 on 10 speech classification tasks from 14 datasets
  * different languages and speech properties. Following, we briefly describe
    these tasks 1 

> The experiment conducted was solely to evaluate model capabilities
> based on established benchmarks and labels
> The established labels don’t provide a holistic landscape about gender and
> emotion
> Predicting binary gender based on audio risks misgendering people and is
> not inclusive of the whole range of gender identities,
> including nonbinary people
> Also, the apparent emotions are not universal, but are instead culturally
> dependent, and may be expressed in audio differently by different people

* Speech Commands Recognition, SCR: which keyword is presented in a given
  * Google Speech Commands [20] and several lowresource datasets in diff langs,
    including Grabo Speech Commands [21], Lithuanian Speech Commands [22], and
    Arabic Speech Commands [23]
* Intent Classification, IC: Fluent Speech Commands dataset [24], where each
  * three labels: action, object, and location
* Language Identification, LID: Voxforge dataset [25] consisting of 6 languages
* Fake Speech Detection, FSD: FSD aims to distinguish real speech from synthetic
  * We used the Logical Access (LA) part of the ASVspoof dataset [26],
* Emotion Recognition, ER: IEMOCAP [27] is adopted in this work
* Accent Classification, AcC: the AccentDB dataset [14], containing 4
  Indian-English accents, 4 nativeEnglish, and 1 metropolitan Indian-English
* Sarcasm Detection, SD: two datasets, MUStARD [15] and MUStARD++ [16]
  * The latter is an extension of the former
* Gender Identification, GID: the VoxCeleb1 dataset [28] and obtained the label
* Voice Activity Detection, VAD
  * whether an input audio contains speech or background noise. We used
  * Google Speech Commands v2 [20] as speech data and
  * Freesound dataset [29] as background noise data, and
  * we mixed the two for evaluating VAD
* Audio Classification, AuC
  * different environmental sounds across human and nature. We used the
  * ESC-50 [30] with 50 different classes for the task

## 4.2. Implementation Details

* Pre-trained LMs For prompt tuning on GSLM and pGSLM
  * the pre-trained HuBERT [31] with 100 clusters
    and its corresponding pre-trained GSLM and pGSLM. The pretrained speech SSL
    models, quantizers, and the spoken LMs are available on fairseq 2 
* Prompts and Verbalizer To keep the pipeline simple, we do not search the
  * same hyperparameters by task. For every task, we use
  * prompt length l = 5, containing 0.128M parameters. The learnable
  * verbalizer is a simple linear model mapping the discrete units to the
    * negligible number of parameters. Overall,
  * the trainable parameters in each task are less than 0.1% parameters of the
    spoken LMs (∼150M). For
  * baseline methods, SpeechPrompt with GSLM and pGSLM, we use a
    random mapping verbalizer instead of the frequency-based verbalizer. We find
    * not consistently underperform in the preliminary study

# 5. RESULTS

## 5.1. Speech Classification Tasks

* Table 1: the results of SpeechPrompt v2 on a wide range of speech classif
  tasks. The performances of SpeechPrompt v2 can be grouped into three
  categories:
  * Outperform SOTA: SpeechPrompt v2 achieves new SOTA results
    on Lithuanian SCR, Arabic SCR, and Sarcasm Detection (SD)
    * exceptional performance in low-resource languages such as Lithuanian and
      Arabic [9]
  * Competitive with SOTA: SpeechPrompt v2 performs competitively with the SOTA
    on Google SCR, Grabo SCR, Intent Classification (IC), Language
    Identification (LID), Gender Classification (GID), and Voice Activity
    Detection (VAD)
  * Underperform SOTA: SpeechPrompt v2 underperforms compared to SOTA
    on Fake Speech Detection (FSD), Emotion Recognition (ER), Accent
    Classification (AcC), and Audio Classification (AuC). The experiment reveals
    * poor performance on non-speech and speech with diverse variance
* the benefits of using learnable verbalizers in SpeechPrompt. With learnable
  * with GSLM exhibits consistent performance improvements in the majority of
    * hE eg Lithuanian SCR and GID, the introduction of learnable verbalizers in
      pGSLM resulted in performance drops, potentially due to prompt tuning
      instability
  * Sec 5.2 why the inclusion of learnable verbalizers is essential in the
* limitations of SpeechPrompt. Firstly, it suffers from performance drops
  * when dealing with non-speech or speech with diverse variance. This could be
    because the spoken language models are pre-trained on an English-speech-only
  * some variance, as seen in the poor performance of pGSLM on Grabo SC. We
    hypothesize that the instability of prompt tuning training is the cause
    * we did not fine-tune any hyperparameters,
      including prompt length, learning rate, etc., across all experiments
    * stabilizing prompt tuning remains an area for future work
      Possible approaches: hypernetworks [32] and prompt initialization [3]

## 5.2. Learnable Verbalizer Analysis

* this section: Shapley Additive exPlanation [33] (SHAP),
  a popular method to interpret model predictions. In SHAP,
  * the SHAP value is calculated to measure the importance of
    each input feature, here referring to the discrete unit,
    to a single prediction made by the model
* Fig.3 shows the result of SCR on Google SC dataset for three different runs
  We list the top 10 units contributing to the class “YES” and the class “LEFT”
  * [more demonstration](https://ga642381.github.io/SpeechPrompt)
  * the horizontal axis is the SHAP value, while
    the vertical axis indicates the order of importance of each unit from top to
  * Each point refers to the interpretation of a single datapoint
  * The color of a point reflects the magnitude of the value for each input unit
* we observe that
  even in the same class, the importance of each unit varies from prediction to
  prediction. And
  the learnable verbalizer relies on multiple units to determine the output,
  * a many-to-many mapping behavior from units to labels
  * This verifies the possible information loss in the previous work (sec 3.2)
  * the relationship between units and labels does
    not remain consistent in different runs. However,
    nL there are units in common and
    their contribution pattern is similar in different runs
    (e.g. unit 98 has the same pattern for class “YES”). Last,
  * the learnable verbalizer might use one unit to separate different classes
    eg when unit 98 has a lower value, the verbalizer is more likely to predict
    class “LEFT” instead of class “YES”
