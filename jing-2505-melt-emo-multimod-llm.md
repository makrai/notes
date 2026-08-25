MELT: Towards Automated Multimodal Emotion Data Annotation
  by Leveraging LLM Embedded Knowledge
Xin Jing, Jiadong Wang, Iosif Tsangko, Andreas Triantafyllopoulos, BW Schuller
arXiv:2505.24493 [cs.AI]

* speech emotion recognition (SER) advanced significantly with deep learning,
* annotation remains a major hurdle.
  * Human annotation is not only costly but also subject to inconsistencies
    * annotators often have different preferences and may
    * lack the necessary contextual knowledge, which can lead to
    * varied and inaccurate labels.
* LLMs have emerged as a scalable alternative for annotating text data. However,
  * LLMs to do emotional speech data annotation without human supervision
    has yet to be thoroughly investigated. To address these problems,
* we apply GPT-4o to annotate a multimodal dataset collected from Friends, using
  * only textual cues as inputs. By crafting
  * structured text prompts, our methodology capitalizes on the knowledge
    * incorporating cross-validation and CoT reasoning
      to ensure consistent and accurate annotations
  * GPT-4o can generate accurate and contextually relevant annotations
* we propose MELT, a multimodal emotion dataset fully annotated by GPT-4o.
* We fine-tune four self-supervised learning (SSL) backbones and assessing
  speech emotion recognition performance across emotion datasets.
  * SSL backbone frozen
* our subjective experiments' resu: consistence performance improvement on SER

# 2. Methodology

## 2.1. Data Preparation

* Multimodal EmotionLines Dataset (MELD) [16], built from “Friends”, comprises
  1,433 dialogues and 13,708 utterances. Each utterance is
* seven categories (Joy, Sadness, Fear, Anger, Surprise, Disgust, Neutral) based
  * majority vote among three annotators.
* MELT is derived from MELD using the following steps:
  * utterances shorter than one second were excluded, as
    * classifying short speech remains a significant challenge in SER [17, 18].
      [17] M. D. Pell and S. A. Kotz,
      “On the time course of vocal emotion recognition,”
      PlOS one, vol. 6, no.  11, p. e27256, 2011.
      [18] P. Kumawat and A.  Routray
      “Applying tdnn architectures for
        analyzing duration dependencies on speech emotion recognition.” in
        Interspeech, 2021, pp.  3410–3414.
  * we excluded characters whose names do not provide enough context for GPT-4o
    to maintain consistency.
    * 260 unique characters in the training set and 100 in the test set, with
      some overlap.
    * Certain characters, such as “1st Customer” and “Receptionist,”
      lack clear identifiers like names or gender in the textual modality, which
      conflicted with the prompt design guidelines in Section 2.3.

## 2.2. GPT Model Selection

* We utilize the OpenAI API 1 to access the ‘gpt-4o-2024-08-06’ model with a
  temperature of 1.0 for speech emotion annotation. For simplicity, ‘GPT-4o’
  is used throughout the following sections. GPT-4o, with its 
* October 2023 knowledge base cutoff 2 , integrates updated data, reducing
* ie no reliance on fine-tuning or retrieval-augmented generation (RAG) [8]

## 2.3. Prompt Engineering

* prompt engineering significantly impacts the performance of LLMs [19] To
  * optimize performance while ensuring stability and reproducibility, we adhere
* principles:
  * Clear, Contextual, and Specific: 
    Include as much relevant context as possible while 
    avoiding ambiguity in instructions to enhance the model’s unders of the task
  * Chain of Thought (CoT) Prompting: Break tasks into distinct, logical steps
  * Cross-Validation:
    requests for known or easily verifiable information 
    to reduce the likelihood of generating incorrect or unrelated content.
  * Guide Output with Prefilling Responses: Structure prompts (eg JSON or XML)


  Given the following line of dialogue from a Friends character, the format
  will be:
  "[speaker] at s[season]e[episode] said: [utterance]"

  Please describe how the character’s voice might sound. 
  Include details about:
  - the emotion expressed,
  - the loudness,
  - the pitch,
  - the rhythm speed,
  - the overall emotional impact of the voice.
  Format your response:
  - Provide the character’s name and a brief context.
  - The emotion label must be selected from the following list: 
    [Anger, Disgust, Sadness, Joy, Neutral, Surprise, Fear].

  Format the response in the following JSON
  structure:
  {
    "character": "[Character’s name]",
    "context": "[Simple context of the situation]",
    "elements": {
      "emotion": "[Primary emotion]",
      "loudness": "[Loudness of voice]",
      "pitch": "[Pitch of voice]",
      "rhythm_speed": "[Speed of voice’s rhythm]",
      "emotional_impact": "[Emotional impact created by the voice]"
    }
  }

# 3. The MELT Corpus

* Following Section 2.1, MELT retains
  42 unique speakers across both the training and test sets, ensuring
  consistency and fair evaluation. As summarized in
* Table 1, approximately 70% of the original utterances in MELD preserved.
  * #Utt, #Spk, #Avg. Sec. represents utterance number, speaker number, and
* Table 2 compares the label distribution and statistical characteristics of
  the MELT and filtered MELD datasets.
  * Both datasets are dominated by the ‘neutral’ emotion, followed by ‘joy’,
    while ‘anger’, ‘sadness’, and ‘fear’ are underrepresented. Notably,
  * MELT shows a more balanced distribution, with
    training and test sets maintaining an approximate 4:1 ratio across labels.
* Fig. 1,
  * Confusion matrix and inter-label transition matrix of the training and test
    dataset
  * nearly half of MELD’s utterances align with GPT-4o’s annotations, and
  * the overall label proportions between the two datasets are similar for most
    emotions. However,
  * hE ‘sad’ and ‘anger’ exhibit significant reannotation, with
    most samples being relabeled as ‘neutral’ and ‘surprise’, respectively.
  * likely reflects overlapping features or ambiguous original annotations.
  * labels such as ‘neutral’ and ‘joy’ remain consistent, emotions like
  * ‘fear’ and ‘disgust’ are more frequently reannotated,
    potentially due to inherent ambiguity.
* The percentage of label changes is
  * comparable in both datasets (46.43% in training and 47.52% in testing), with
  * slightly higher changes in the test set.

# 4. Experiments

## 4.1. Subjective Experiment

* 20 participants (11 males and 9 females): a Mean Opinion Score (MOS) exper.
* instructed to watch the video clips and presented with
  two options—MELT and MELD annotations, without knowing their sources —from
  asked to select the description they deemed more appropriate.

## 4.2. Objective Experiments

## 4.2.1. Objective Evaluation system

* The SER evaluation system in Fig. 2 consists of two main components:
  * a pretrained Self-supervised learning (SSL) backbone, which is initialized
    by the pretrained weight on huggingface.co 3 and
  * a classification module.
* four pretrained SSL weights:
  ‘facebook/wav2vec2-base-960h[20]’ (wav2vec 2.0 base) ,
  ‘audeering/wav2vec2-large-robust-12-ft-emotion-msp-dim [21]’ (wav2vec 2.0 Aud),
  ‘facebook/hubert-base-ls960 [22]’ (Hubert Base), and
  ‘microsoft/wavlm-base-plus [23]’ (WavLM Base+).
* The classification module consists of
  two fully connected layers with a ReLU activation function between them.
  * dynamically adjusted to match the number of emotion categories in the test
  * the weighted sum of hidden states as the input of this classification module

## 4.2.2. Datasets

* Training Datasets: Both MELT and MELD are employed as training datasets in our
  * for fair comparison, we impose two conditions on data filtering:
    * only emotion categories present in the test set are retained by filtering
    * training data is restricted to audio samples that are common to both
      datasets.
* Out-of-domain Datasets: We additionally perform crosscorpus testing on the
  following datasets to test the generalizability of the trained models.
  * IEMOCAP [24]
    * we use a subset of the original labels by merging ‘happy’ and ‘excited’,
      * following the convention in the literature to
    * 5,531 utterances, with four labels
      (1,103 angry, 1,636 happy, 1,708 neutral, and 1,084 sad)
  * TESS [25]: The set consists of
    * 2,800 clips representing seven emotions:
      anger, disgust, fear, happiness, pleasant surprise, sadness, and neutral.
    * we set the data labeled ‘pleasant surprise’ to ‘surprise’.
      * To align with MELT ,
  * RAVDESS [26]'s speech portion
    * 1,440 utterances across 8 emotion categories:
      * neutral, calm, happy, sad, angry, fearful, surprise, disgust.  During
    * we excluded the ‘calm’ category, resulting
    * 1,248 utterances in test set.
  * CREMA-D [27]: It contains
    * 7,442 clips recorded, featuring
    * both facial and vocal expressions across six basic emotional states:
      * happy, sad, angry, fearful, disgust, and neutral.

## 4.3. Experiment Settings

* Adam optimizer with a batch size of 32, a learning rate of 0.001, and a
  dropout rate of 0.2 for 100 epochs.
* Audio data are resampled to 16 kHz and randomly cropped or padded to 5 secs.
* test: batch size was set to 1, and no length adjustment was required. All
* Python 3.10.8 and PyTorch 2.  environment on a single Nvidia RTX 3090 GPU.

# 5. Results and Analysis

## 5.1. Performance

* The overall MOS result is shown in Fig. 3: preference for MELT annotations
  * high agreement (> 70%) for ‘anger’ and ‘surprise’ indicates that
    GPT-4o effectively integrates internet-sourced knowledge to capture the
    diversity in expressions. However, an
  * hE opposite trend is observed for ‘fear’ and ‘sadness’, as
    they mostly transition to ‘neutral’, as shown in Fig. 1.
  * These reannotated audio clips often feature
    lower arousal and subtler emo contexts
  * The comparable preferences suggest possible biases stemming from GPT-4o’s
    reliance on internet-derived emotional knowledge.
* Classification results are summarized in Table 3.
  * metrics: unweighted accuracy recall (UAR), accuracy (ACC), and F1 score, are
  * in-domain results trained on MELT generally outperform the original MELD,
    ie our annotation improves upon the self-supervised (SSL) benchmark
    architect [28]
* TESS and RAVDESS: MELT shares the same emotion classes, there existed
  two patterns in the experimental results. For
  * RAVDESS, all models demonstrated considerable and consistent perf improvem
  * TESS showed a mixed outcome: while
    * wav2vec 2.0 Base and HuBERT Base achieved substantial UAR perf gains
      (19.25% and 23.74%, respectively),
    * the remaining two models exhibited minimal improvements in UAR and ACC,
      * slight decline in F1 scores compared to results on the MELD dataset. For
  * IEMOCAP and CREMA-D, which only partially overlap with MELT , the
    * test performance varies across different model backbones.
      * wav2vec 2.0 Aud achieves the most substantial performance improvement on
        both datasets, while
      * wav2vec 2.0 Base shows relatively modest gains.
        ie pretraining is important in enhancing model performance,
        particularly if limited or partial alignment to the training annot

## 5.2. Audio characteristic

* now we analyze the annotation performance of the GPT-4o on audio charistics,
  * query generation pipeline proposed by ParaCLAP [29]
    to categorize descriptions and
    extract the extended Geneva Minimalistic Acoustic Parameter Set (eGeMAPS)
    [30] using openSMILE [31].
* pitch and loudness attributes are binned according to their distribution
  (bottom 30 %, middle 40 %, top 30 %) and pseudo-captions are mapped
  accordingly (i. e., low/mid/high).
* Across both the training and test sets,
  all metrics consistently surpass random guessing, demonstrating that
  ie GPT-4o effectively captures relevant characistics from its embedded knowl
  * the performance of pitch exceeds that of loudness,
    likely reflecting human preferences in voice descriptions [32], which may
* still falling short of SOTA results, nL showcase the potential of LLMs with
  further refinement for tasks traditionally dominated by handcrafted features.

# 6. Conclusion

* Mean Opinion Score MOS and classification results
* concerns about model-specific biases and hallucinations can affect annotation
* Future work: hybrid annotation that combine LLMs with human-inthe-loop methods
