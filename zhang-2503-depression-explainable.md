Explainable Depression Detection in Clinical Interviews
  with Personalized Retrieval-Augmented Generation
Linhai Zhang, Ziyang Gao, Deyu Zhou, Yulan He
ACL 2025 arXiv:2503.01315 [cs.CL]

* clinical interviews are the gold standard for depression assessment. However,
* attempts to improve interpretability use post-hoc LLM generation but suffer
  from hallucination. To address these limitations, we propose
* we: RED, a Retrieval-augmented generation framework for Explainable depres Det
  * retrieves evidence from clinical interview transcripts, providing
    explanations for predictions. Traditional query-based retrieval systems use
    a one-size-fits-all approach, which may not be optimal for depression
    detection, as user backgrounds and situations vary. We introduce a
  * personalized query generation module that
    combines standard queries with user-specific background inferred by LLMs,
    tailoring retrieval to individual contexts. Additionally, to enhance LLM
  + retrieving relevant knowledge from a social intelligence datastore
    using an event-centric retriever.
* Experimental results on the real-world benchmark demonstrate RED's

# 2 Related Work

## 2.1 Depression detection is challenging due to its subtle nature, with

* data: clinical interviews or social media data
  (Gratch+ 2014; Burdisso+ 2020; Salas-Zárate+ 2022). Recent approaches focus on
* multi-modal data from interviews, combining text, audio, and video for better
  (Gratch+ 2014; Burdisso+ 2020; Salas-Zárate+ 2022). These methods
* aggregate features at various levels (word or utterance) to capture more
* Early risk detection is also gaining traction, using techniques like
  incremental classifiers and risk window-based methods to predict depression
  before full symptoms emerge (Burdisso+ 2019a,b; Sadeque+ 2018)
  * enable timely interventions by detecting consistent patterns over time.
* LLMs are fine-tuned on mental health datasets to capture complex ling cues
  * LLMs with multimodal data for both depression detection and early interven
    (An+ 2020; Yoon+ 2022)
  * D-vlog: Multimodal vlog dataset for depression detection.

# 4 Exper

## Datasets

* corpus for clinical depression detection: the
  Distress Analysis Interview Corpus-Wizard of Oz (DAICWoZ, Gratch+ 2014),
  * widely utilized English-language dataset comprising
  * interviews from 189 participants, with data available in the form of
  * transcripts, audio recordings, and videos.
  * After the interaction, participants are asked to complete the PHQ-8
    questionnaire (Kroenke+ 2009), which assesses eight specific symptoms
    related to depression. These symptoms include loss of interest, feelings of
    depression, sleep disturbances, fatigue, loss of appetite, feelings of
    failure, lack of concentration, and reduced movement.
    > 10 ~> depressed, while those < 10 ~> control.
  * Detailed statistic of the dataset can be found in Appendix A.2.
* splits:  Following the prior research (Chen+ 2024) and the specificity of our
  * both the development and training sets are utilized for evaluation, as the
    labels for the test set are unavailable.
* We do not employ EATD
  * another interview-based depression detection dataset EATD (Shen+ 2022a)
  * not fully the clinical setting, where each participant was only asked three
    questions, making the dialogue content too short for retrieval.
* social intelligence enhancement module, we employ
  COKE, a cognitive knowledge graph for machine theory of mind (Wu+ 2024)
  * contains a series of cognitive chains to describe human mental activities
    and behavioral/affective responses in social situations.
  * we, In RED
    * query: we concat situation and clue in COKE as the query for retrieval, and
    * values: the rest of the elements as values.
  * Detailed for the dataset can be found in Appendix A.2.

## 4.3 Baselines

### NN-based method

* ω-GCN (Burdisso+ 2023) is an approach for weighting self-connecting edges in a
  Graph Convolutional Network (GCN)
* EATD-Fusion (Shen+ 2022b) is a bi-modal model that utilizes both speech
  characteristics and linguistic content from participants’ interviews.
* MFM-Att(Fang+ 2023) is a multimodal fusion model with a multi-level
  attention mechanism (MFM-Att) for depression detection, aiming to
  effectively extract depression-related features.
* HCAG (Niu+ 2021) is a hierarchical ContextAware Graph Attention Model model
  that utilizes the Graph Attention Network (GAT) to capture relational
  contextual information from both text and audio modalities.
* SEGA (Chen+ 2024) transforms clinical interviews into a directed acyclic graph
  and enhances it with principle-guided data augmentation using large language
  models (LLMs)

### LLM-based methods.

* Direct Prompt is a promptlearning method designed to guide LLMs in making
  judgments about depression.
* Naive RAG is a technique that integrates the RAG framework with LLMs. It uses
  a retriever to search for relevant evidence from a knowledge base or dataset,
  which is then fed into an LLM to make judgments or generate appropriate
  responses.
* Personal RAG builds upon the previous method by enhancing the query generation
  process, which is now based on the user profile, ensuring more personalized
  and contextually relevant evidence retrieval.

---

* The details for the implementation can be found in Appendix A.3.
