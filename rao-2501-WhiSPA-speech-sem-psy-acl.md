WhiSPA: Semantically and Psychologically Aligned Whisper
  with Self-Supervised Contrastive and Student-Teacher Learning
Rajath Rao, A Ganesan, O Kjell, J Luby, A Raghavan, S Feltman, W Ringwald,
  RL Boyd, B Luft, C Ruggero, N Ryant, R Kotov, HA Schwartz
ACL 2025 arXiv:2501.16344 [eess.AS]

Personal communication: jövőre lesz elérhető a korpusz

TL;DR: a speech encoder whith similar performance to a text-based LM

# Abstract

* Current speech encoding pipelines often rely on an additional text-based LM
* nL SotA speech-to-text models often have a LM within
* we improve the LM within an audio model
  ~> the subsequent text-LM is unnecessary
* We introduce WhiSPA (Whisper with Semantic and Psychological Alignment)
* a novel audio training objective:
  contrastive loss with an LM embedding as a teacher.
* Using over 500k speech segments from mental health audio interviews
* aligning Whisper's latent space with
  * SBERT semantic representations from a text autoencoder (SBERT) and
  * lexically derived embeddings of basic psychological dimensions:
    emotion and personality
* eval: self-supervised affective tasks and downstream psychological tasks,
  * surpasses current speech encoders
  * average error reduction of 73.4% and 83.8%, respectively

# Intro

* AI integration of modalities is often fragmented (Lazaro+ 2021; Gu+ 2017).
* Speech to text models, like Whisper (Radford+ 2022), are often pipelined into
  text-based language models (LMs, Chuang+ 2020) in order to get the most
  accurate speech-based representations (see Figure 1). This often results in
  * redundant computational costs from having two LMs in the pipeline, and
    representations remain incomplete of the full spectrum of human
    expressions (Zhang+ 2023; Lian+ 2023).
* psychological and social scientific applications where representations from
  text-based LMs demonstrate superior performance than direct speech
  representations (Lukac, 2024; Chen+ 2024).
* we seek to bridge the semantic and psychological representation gap between
  speechbased LMs present in audio models and text-based LMs. We introduce
  * a speech encoding model,
  * WhiSPA (Whisper with Semantic and Psychological Alignment), which
  * aligns a pretrained speech recognition model, Whisper (Radford+ 2022), with
    the latent dimensions from SBERT (Reimers and Gurevych, 2019), intended to
    better capture semantics and deeper psychological information (V Ganesan+
    2022; Park+ 2014).
* main idea repeated: Such alignment reduces computational and memory
  inefficiencies, circumventing the need for a second text encoder, as it
  enables a unified crossmodal representation between speech and language
  models. Still, since text is derivable from speech, speech should
  intrinsically be mappable to the same rich semantic features from the text.
* focus on psychological or human-level tasks reflects a
  * growing demand for foundation models to better understand the intrinsic
    qualities of hucommunication (Soni+ 2024).
  * As Clark and Schober (1992) put it,
    “The common misconception is that language has to do with words and what
    they mean. It does not. It has to do with people and what they mean.”
  * how well the representations capture information about the people
    communicating (Hovy and Yang, 2021; Soni+ 2022). More specifically,
  * mental health attributes are highly multimodal as they are influenced by
    subtle nuances in voice and content (Sartori and Orrù, 2023; Chen+ 2024).
* significant accuracy improvements
  in self-supervised tasks and downstream psychological tasks
  over systematically tested variants of WhiSPA. We find that:
  * SotA person-level psychological assessments;
  * a Noise Contrastive Estimation loss yielded a more optimal convegence in
     aligning Whisper’s latent space with semantic and psychological dimensions.
  * for downstream psychological tasks, there was
    almost no benefit in utilizing SBERT representations on top of WhiSPA’s,
    ie the same information from a text LM can be captured with the LM of the
    audio model and thus it is not necessary to pipeline another text LM

# Background

* Whisper (Radford+ 2022), OpenAI’s SotA automatic speech recognition (ASR)
  * alternatives such as HuBERT and Wav2Vec2-BERT, since previous works  have shown that
  * Whisper has a stronger language encoding module at capturing speaker attribs
    (Kyung+ 2024; Yang+ 2023)
    * due to its pretraining objective of transcription/translation.
* speech recognition vastly improved (Radford+ 2022; Hsu+ 2021). However, they
  * hE limited ability to capture deeper semantics and speaker attributes
    compared to a text-based language model (Chen+ 2024; Dong+ 2022).
  * Prior works that have addressed this have targeted a very narrow scope of
    psychological attributes (Busso+ 2008).
  * need for bridging speech encoders’ acoustic robustness
    with the psychological depth of text-based language models—a challege we
    ie embedding fundamental psychological dimensions present in one’s speech.
* Multi-level fusion architectures leveraging both acoustic and lexical features
  * improve performance in emotion recognition, speaker identification, and
    other downstream tasks. For instance, (
  * Zhao+ (2022) demonstrates that
    coattention-based early fusion and late fusion using Wav2Vec2.0 (Baevski+
    2020; Schneider+ 2019) and BERT (Devlin+ 2019) outperform SotA emotion
    recognition benchmarks. Other recent works
  * text only-input
    * inject acoustic nuances into language models using textual descriptions of
      speech characteristics (Wu+ 2024) or
    * common-sense reasoning through historical utterances from the speaker
      (Fu, 2024). However, this approach does
    * not fully leverage the cross-modal dependencies between text and audio, as
* cross-modal alignment provide foundational insights for this integration.
  * Compositional Contrastive Learning (Chen+ 2021)
    distilled audio-visual knowlege into video representations
    by aligning teacher-student embeddings across modalities,
    embedding rich semantics from teacher-audio and image models into the
    studentvideo model.
  * Dong+ (2022): intent classification of spoken language
    * contrastive loss using both speech and language features. These works
  * sum
    * the cross-modal alignment objective embeds information from different
      modalities into shared spaces to capture their relationships, while
    * contrastive learning aids in
      grouping related inputs across different modalities (eg audio and text
      segments) while
      separating unrelated pairs (Ye+ 2022).
  * align text and audio include
    * SpeechBERT (Chuang+ 2020), which
      BERT’s framework adapted (Devlin+ 2019) to paired speech-text data, and
    * SLAM (Speech-Language Aligned Models, Bapna+ 2022), which
      optimized joint embedding spaces
      to improve downstream tasks like speech recognition and audio-text retriev
* we are the first work to perform cross-modal learning to endow the
  foundational speech model with richer semantic and psychological reprs

# 3 Data & Tasks

## Audio Dataset: two psychological, mental health-focused datasets

* for training and evaluation:
* WTC-Segments (WTC, Kjell+ 2024) and
  * recordings were completed by patients in a clinic for World Trade Center
    (9/11) responders who came for a health monitoring visit.
* HiTOP-Segments (HiTOP, Kotov+ 2022).
  * interviews were completed by outpatients with psychiatric diagnoses who were
    recruited by the study team to complete a research interview.
* Both datasets consist of paired audio-text data, ensuring alignment
* From its source, WTC was curated from ∼6 minute interview recordings, on
  average, of patients responding to both personal and general questions in
  a structured manner (Kjell+ 2024).
* != HiTOP followed a semi-structured format, where
  patients described experiences on set topics while
  also organically conversing with the interviewer. Once
  * [after?] filtering for audio segments solely spoken by patients,
  * interviews generally ranged from 45 to 90 minutes, yielding
    a voluminous and broadened set of audio segments (Kotov+ 2022). The
* diarized using NVIDIA NeMo and transcribed with whisper-large-v2.

## Psychological Assessments. For each dataset, psychological measures were

* WTC, each subject completed the selfreported PTSD CheckList (PCL), yielding
  scores for four specific subscales: Re-experiencing (REX), Avoidance (AVO),
  Negative Alterations in Mood (NAM), Hyperarousal (HYP).
* HiTOP, trained interviewers provided ratings for the following
  six psychopathology scales: Internalizing (INT), Disinhibition (DIS),
  Antagonism (ANT), Somatoform (SOM), Thought-Disorder (THD), and Detachment
  (DET), (Kotov+ 2022, 2024).
* Three random audio segments containing more than 5 uttered words from each
  user were sampled from each dataset and were
  annotated by two individuals with a background in psychology using the
  affective circumplex scale (Figure 8).
  This resulted in 300 audio segments, equally split between the two datasets.

## Self-Supervised PsychEmb

* For each audio/text pair in our datasets, we extract theoretically derived
  psychological features using PsychEmb
* PsychEmb: pre-trained lexica (V Ganesan+ 2022), which we
  * broadly covers three domains of psychological constructs
    measured at different temporal granularity:
  * states, which reflect the emotional condition of the person
    at a point in time;
  * dispositions, which are slightly more stable than states and reflect the
    tendencies of humans to behave in certain ways and finally
  * the traits, which are
    long term stable characteristics (Park+ 2014).
* The ten dimensions of PsychEmb are Valence (VAL), Arousal (ARO), Openness
  (OPE), Consciousness (CON), Extraversion (EXT), Agreeableness (AGR),
  Neuroticism (NEU), Anger (ANG), Anxiety (ANX), and Depression (DEP), each
  represented with scalar values.
* After extracting self-supervised PsychEmb dimensions for each segment across
  both datasets, we perform a 80:10:10 (train/val/test) split.

# 4 Methodology

* Aligning audio representations directly with a text-based language model
  ~> infuse the audio model’s latent space with the rich semantic and affective
  details typically provided by text representations, thereby eliminating the
* not explicitly leverage the unique acoustic features of speech, it prioritizes
* efficiency: avoiding redundant processing and
* consistently semantically enriched representation—an advantage that is
  particularly critical for psychological and social scientific applications
  (Lukac, 2024; Chen+ 2024)

## 4.0 Model Architecture: Fig 2

* We begin with the Whisper encoder-decoder backbone (Radford+ 2022), which
  * Whisper-384 version, whisper-tiny
  * does not run autoregressively.
  * we denote the pre-trained Whisper model as Whisper-384, where
  * the numeric suffix refers to the embedding dimensionality.
* audio segments are previously transcribed with whisper-large-v2, making it
* SBERT and PsychEmb representations were encoded using these transcriptions. As
* Whisper (Student)
* mean pooling layer to the last hidden state of Whisper’s decoder
* then learnable dense layer, and the output serves as our embedding during
  alignment. This aggregated representation is
* aligned to
  * the pooled representations from pre-trained SBERT for semantic alignment and
  * the PsychEmb’s dimensions for psychological alignment.

## 4.1 Alignment Objective

* two suitable candidate objective functions

### 4.1.1 Cosine Similarity Loss (CS)

* rel work: success of the cosine similarity-based approach in building
  geometrically robust representations in SBERT
  (Reimers and Gurevych, 2019; Sanh+ 2020)

### 4.1.2 Noise Contrastive Estimation Loss (NCE)

* to increase the cosine similarity between a pair of audio embedding and its
  corresponding text embedding
  while simultaneously increasing the differentiation between the audio
  embedding and randomly sampled text embeddings in that batch
  (Ye+ 2022; Chen+ 2020; Khosla+ 2021)
* temperature τ represents a tunable scalar parameter which is set to 0.1.

## 4.2 Whisper Semantically Aligned (WhiSA-384)

* student-teacher model paradigm (Hinton+ 2015; Sanh+ 2020) to
  align Whisper’s audio-based embeddings with SBERT’s text-based embeddings,
  * teacher = SBERT encodes corresponding text sentences into semantically rich
    embedding vectors, which serve as T in the above equations during training.
  * Whisper’s embeddings (A in the above equations), derived from its decoder’s
    last hidden state, are aligned to these SBERT embeddings
    using the loss functions described above. This process is
  * aim: WhiSA to learn robust semantic representations directly from audio
  * by minimizing the cosine distance between Whisper and SBERT embeddings as

## 4.3  Adding Psychological Alignment (WhiSPA)

* WhiSPA extends the WhiSA framework
  by augmenting PsychEmb dimensions into Whisper’s.
* maintaining the semantic alignment objective, WhiSPA injects the PsychEmb
* two settings:
  * replacement: a naive strategy (WhiSPA-384 r to refer to this)
    * replacing the first ten dimensions of SBERT’s embedding with the PsychEmb
      dimensions
      to maintain the same number of latent dimensions between both models. We use
  * projection: (WhiSPA-394)
    * concatenate the PsychEmb dimensions to the text embedding from SBERT.
    * requires a 384 × 10 learnable projection matrix, P ,
      to transform Whisper embeddings of dimensionality 384 to 394, which is
      then passed through a TanH activation. This model goes by the name
* numerical instability issues from modeling the PsychEmb dimensions in its
  absolute range, we
  ~> standardize and scale them to match SBERT’s distribution of embeds, see A.2

# 5 Results & Discussion

* 3 popular, robust speech encoders as baselines (W2V2B, HuBERT, Whisper-384)
  * Wav2Vec2-BERT 4 (Communication+ 2023; Chung+ 2021)
  * HuBERT 5 (Hsu+ 2021)
  * Whisper (Radford+ 2022)
* metric: Pearson correlation coefficient (r) and mean squared error (mse)
  over a 10-fold cross-validated ridge regression model for each task. For each
  model variant, we encode audio segments for each participant and aggregate
  them with a statistical mean to represent person-level embeddings for the
  tasks in Table 2 and Table 3.

## Alignment improved the models’ ability to capture psychological dimensions
from language. We evaluated the speech-based models’ ability to capture the
psychological dimensions of language by comparing our models’ predictions to
PsychEmb derived values at the segment level. As summarized in Table 2, we found
that both semantic (WhiSA) and psychological alignments (WhiSPA) significantly
outperformed traditional speech-based models (W2V2B and Whisper) across all
ten dimensions on both metrics. Compared to Whisper, which was evidently a
stronger baseline than W2V2B (Avg∆ = 36 Pearson points for WTC & 21 points for
HiTOP), our semantic alignment method showed a marked improvement in
performance, with an average of 11 in Pearson points for WTC and 2 in HiTOP. A
paired t-test was used to confirm that all improvements over W2V2B and all
improvements over Whisper, except for 4 outcomes in HiTOP, were statistically
significant (p < .05). This result highlighted our alignment methods improved
the speech model’s ability to capture psychological dimensions in language
(PsychEmb).
Interestingly, deriving psychological estimates from semantic dimensions
(WhiSPA-394) was consistently better than the replacement (WhiSPA384 r) of 10
semantic dimensions with PsychEmb dimension. This shows the importance of
curating the semantic dimensions before replacing them with different
embeddings.
* the alignment increased the overlap between the latent space of the speech and
  text embeddings, as shown in Figure 3. Before alignment (Figure 3a), speech
  and text embeddings show distinct contours with very little overlap in their
  dense regions, highlighting a clear modality gap and a lack of shared
  contextual meaning. After alignment (Figure 3b), the contours exhibit greater
  overlap, indicating a unified embedding space with reduced variance.
Figure 3 demonstrates that the alignment process effectively bridges the
semantic gap between the two modalities.

## Semantic-Psychological alignment is SotA for speech-based psychological
assessments. Table 3 shows that the improvements brought by our aligned models
over traditional models were preserved even when
* evaluated on a spectrum of downstream psychological assessment tasks. In
  * a stark increase in capturing deeper psychological conditions such as INT
    (internalizing) (≥ 16 Pearson points) and DIS (disinhibition) (≥ 20 Pearson
    points) from very long durations of speech data. Consistent with behaviours
    exhibited with PsychEmb dimensions, in Table 2,
* which method, tab 2
  * semantic-psychological alignment from semantically-derived psychological
    dimensions (WhiSPA-394) performed the best, followed by
  * semantic-psychological alignment from replacement (WhiSPA-384 r) and finally
  * semantic-only alignment (WhiSA-384).
    For these tasks, we averaged the segment-level representations of the
    interview audio file to produce a person-level embedding. These embeddings
    were used to perform 10-fold cross-validation with a ridge regression model,
    and its performance was measured using Pearson correlation coefficient (r)
    and mean squared error (mse).
* psychological feature alignment complements semantic alignment
  by explicitly encoding affective dimensions such as valence and arousal. The
  improvements in outcomes like INT and DIS further support this interpretation
  * these constructs often rely on subtle vocal cues, such as
    pause distribution, pitch variability, and vocal tone as estab (Kotov+ 2024)
* By injecting dimensions with psychological relevance into the alignment
  process, the model bridges the gap between the prosodic information in speech
  and the textual semantics used to train baseline models like WhiSA. This dual
  alignment likely enhances the model’s ability to capture both the what
  (semantic content) and the how (affective delivery) of speech, enabling more
  accurate predictions of psychological scales.

## Contrastive loss criteria led to richer representations of audio (Table 4)

* Noise Contrastive Estimation (NCE) consistently produced a better-aligned
  than cosine similarity (CS). This is
  likely because NCE optimizes for discriminative learning,
  encouraging more separation between positive and negative samples in the
  embedding space (Ye+ 2022), enhancing the model’s ability to encode nuanced
  semantic and psychological cues. When
* comparing WhiSPA-394 and WhiSPA-384, we notice the
  * recurring trend with NCE granting a greater optima during alignment than CS
    as exemplified in Table 4.
  * WhiSPA-384 holds its ground in HiTOP, achieving comparable correlations.

## WhiSPA effectively scales to larger dimension-
alities. To investigate the effects of utilizing a
larger teacher LM, we conducted experiments with
all-roberta-large-v1 (∼330M) paired with
whisper-medium (∼796M) as the audio backbone,
each with 1024 embedding dimensions. Table 5
shows that the distillation process remains effective
for aligning larger student-teacher model configura-
tions, further validating its scalability and general-
izability for the downstream task. When comparing
Whisper-384 to WhiSPA-394, we observe an aver-
age error reduction of 83.38%, while the 1024-
sized models show an even greater reduction of
86.61%. A larger audio backbone also improves
the consistency with which the student model out-
performs its language-based teacher, likely due to
enhanced context retention afforded by a larger
parameter space. For example, WhiSPA-394 sur-
passes its teacher in only 2 of 11 outcomes, whereas
WhiSPA-1034 does so in 7 of 11 psychological
assessments. These findings underscore the effec-
tiveness of our distillation strategy, particularly for
larger models offering greater embedding dimen-
sionality.

## WhiSPA captures semantics without the need
for appending SBERT representations. The
last row in Table 6 underscores the marginal in-
crease in correlations after appending SBERT em-
beddings to WhiSPA. WhiSPA, trained through
a student-teacher alignment paradigm, appears
to reach a semantic and psychological optimum
during convergence. This is evident in its sub-

## WhiSPA’s representations are interpretable
through language semantically associated with
psychological dimensions. Table 7a shows that
n-grams known to be indicative of PTSD severity
from prior studies (Kjell+ 2024) —including
first-person pronouns, experienced symptoms, psy-
chological distress, and negative affect – yield sig-
nificantly higher correlations with WhiSPA’s pre-
dictions compared to Whisper. In contrast, Table 7b
reveals that language discussing relationships and
positive affect is more negatively associated with
WhiSPA’s scores. These findings indicate that the
contrastive loss training effectively aligns the la-
tent space with rich semantic and psychological
representations, capturing psychologically relevant
linguistic markers more robustly. The highly se-
mantic latent spaces of text-based LMs are reflected
in WhiSPA’s representations, especially for psycho-
logical nuances in spoken language. More quan-
titative analysis of our model can be found in Ap-
pendix subsection A.4

# 7 Limitations

* potentially limiting its capacity to capture critical acoustic information.
  * lexical bias, beneficial for aligning with language-based models, raises an
  * ? can WhiSPA’s embeddings be further refined to incorporate affective
    context for psychological prediction?  Given that
  * vocal prosody and acoustic features convey essential emotional and
    psychological cues beyond textual content (Low+ 2020), incorporating
* strong alignment with text-based language models may introduce an imbalance,
  diminishing the richness of acoustic cues that are particularly valuable for
  * enhance its representational capacity by preserving acoustic features. To
  * future work will explore a multi-weighted dual loss objective, ensuring that
    WhiSPA retains a broader spectrum of information beyond textual
  * We suspect this refinement would not only/but also
    improve its efficacy in psychological modeling but also
    enhance its versatility for general-purpose speech tasks
    eg automatic speech recognition (ASR) and emotion recognition in
    conversation (ERC), where both linguistic and acoustic cues are essential.

# 8 Ethical Implications

* significant potential for improving mental healthcare assessments
  by providing rich insights into individuals’ states of mind through speech
* hE ethical considerations due to the richer and more diverse forms of
  personally identifiable information (PII) they capture compared to unimodal
* can inadvertently reveal sensitive details like gender, ethnicity, emotional
  state, and health conditions. This expanded data scope
* risk of re-identification, making it essential to implement stringent data
  security and handling, including compliance with privacy regulations such as
  GDPR and HIPAA.

## Security & Privacy. Moreover, the potential for misuse or unauthorized

* ethical guidelines needed for its storage, processing, and application.
* Transparency in how these models are trained and used is critical to building
* algorithmic biases and ensure fairness are important, as
* errors in multimodal assessments could dispropimpact vulnerable populations,
  or lead to incorrect diagnoses if not carefully managed.
* This work was part of a study approved by SBU’s Institutional Review Board
  (IRB `#`1157153 World Trade Center Responder Language and Health Study) and
  (IRB `#`2022-00391: iHiTOP).

## Software. Adhering to the ideals of

* open and reproducible science, we will make the WhiSPA software
  code base, along with the trained models and secure dimensional
  representations of the data, openly available. These representations strictly
  * no individual can be identified nor any anonymity safeguard compromised.
* direct access to the underlying data restricted for privacy and security
* AI-based tools were employed throughout the project
  to assist in code development and report formulation, including the use of
