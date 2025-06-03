A PhD Student's Perspective on Research in NLP in the Era of Very Large LMs
O Ignat, Z Jin, A Abzaliev, L Biester, S Castro, N Deng, X Gao, A Gunal, J He,
  A Kazemi, M Khalifa, N Koh, A Lee, S Liu, D June Min, S Mori, J Nwatu,+
arXiv:2305.12544 [cs.CL]

* generative NLP applications. At the same time, it has also led to a
* misleading public discourse that ``it's all been solved.'' Not surprisingly,
* we: a compilation of NLP research directions that are rich for exploration,
  * reflecting the views of a diverse group of PhD students in an acad res lab
  * we do not cover tasks where LLMs’s performance is limited (Bang+ 2023a)

# 2 Multilinguality and Low-Resource Languages

# 3 Reasoning 4

* reasoning types, including deductive, inductive, abductive, quantitative,
  causal, and moral reasoning. Improving reasoning skills in NLP is vital for
* tasks such as question answering, reading comprehension, and dialogue
  systems, as it can enhance a model’s generalization ability in unseen
* from early rule-based and symbolic approaches to statistical methods in the
  1990s, which utilized probabilistic models and machine learning algorithms.
  In recent years, deep learning and neural networks have revolutionized the
* challenges remain in attaining humanlike reasoning and generalization

## Gaps

* impressive performance on many reasoning benchmarks (Brown+ 2020b; Ouyang+
  2022; Zhang+ 2022; Touvron+ 2023a; OpenAI, 2023), there are still several
* formal reasoning (Jin+ 2022b; Stolfo+ 2023; Jin+ 2023a), as we often see LLMs
  * errors that a formal or symbolic system would not make.
* lack grounding in real-world experiences when reasoning (Ignat+ 2021).
* distinguishing empirical knowledge and rational reasoning: how LLMs reason?

## Research Directions

1. Robust formal reasoning. Formal reasoning has long been a challenging task
   for neural networks. LLMs are far from complete mastery of formal
  * tasks such
    * numerical reasoning (Stolfo+ 2023; Miao+ 2020),
    * logical reasoning (Jin+ 2022b), and
    * causal inference (Jin+ 2023a,c), often making
  * obvious mistakes (Goel+ 2021; Jin+ 2020). To this end, a robust model
    should know how to generalize. To robustly manage formal reasoning, one
  * combining the strengths of neural networks and symbolic AI. A popular line
  * integrate external reasoning systems, such as
    * calculators, python interpreters, knowledge retrieval from databases, or
      search engines (Schick+ 2023; Mialon+ 2023)
2. Grounded reasoning in the physical real world. While current models generate
  * linguistically plausible responses that are nonsensical or unrealistic in
    practice. To address this issue, one direction is to explore ways to
  * incorporate external knowledge sources, multimodal data, or simulated world
3. Responsible reasoning in social contexts.  With increasing numbers of
   applications that use NLP models, it is foreseeable that
  * models will need to make complicated decisions that involve moral reasoning
    as intermediate steps. For example,
  * when creating a website, there may be moral choices to consider such as
    catering towards certain subpopulations, or overly optimizing for user
    attention or click-through rates
  * These decision principles are pervasive in our daily life, across small and
  * different social contexts and cultural backgrounds
    (Jin+ 2023b; Hendrycks+ 2021)
  * interdisciplinary collaboration with domain experts and policymakers needed
4. Formally defining reasoning and designing proper evaluation framework. There
  * LLMs start to make the difference between knowledge and reasoning blurry –
  * when a model memorizes a reasoning pattern, does it count as the mastery of
  * increasing mastery of templated solutions by pattern matching, which seems
    to be the reasoning that many want. Fundamentally, it leads to a question
  * what are the sparkles of intelligence that humans excel at, and how
    different are these from empirically learning how to do template matching.
  * then how to test models’ reasoning skills. We face problems such as
  * data contamination, Goodhart’s law (a dataset failing to reflect the skill
    once it is exploited), and a
  * lack of reliable metrics to evaluate multi-step reasoning.
5. Analyzing how prompts help reasoning.  There are
  * two types of prompting to inspect: in-context learning and chain of thought
  * conditioning on in-context examples has a similar effect to finetuning the
    model (Akyürek+ 2022), and researchers start to
  * decode the mechanisms that models start to pick up from the given context,
    such as induction heads (Olsson+ 2022).  Apart from the in-context
  * prompt LLMs with intermediate steps using chain-of-thought prompting. This
    * breaks down reasoning tasks into smaller sub-problems, similar to human
      problem-solving. However, it is
    * debatable whether language models truly reason
      or just generate statistically-alike sequences, and
    * to what extent AI systems can learn to reason from fewshot exemplars.

# 4 Knowledge Bases

# 5 Language Grounding

# 6 Computational Social Science

### 6.2.2 Development of new CSS-aiding abstractions, concepts, and methods.

* Word and sentence-level embeddings have had a large impact on CSS in recent
* Topic modeling, such as LDA (Blei+ 2003), and keyword extraction have been
  prevalent in CSS prior to the introduction of embeddings.  These are examples
  of methods that encapsulate generic capabilities at a high abstraction level
  in CSS, as they are frequently used in studies across several subfields of
  CSS. As CSS researchers transition to using more powerful AI technologies,
  the concepts and algorithms that unlock new capabilities for them are yet to
  be developed.

# 7 NLP for Online Environments

# 8 Child Language Acquisition 8

# 9 Non-Verbal Communication

# 10 Synthetic Datasets 11

# 11 Interpretability

# 12 Efficient NLP

# 13 NLP in Education

# 14 NLP in Healthcare 14

## Background

* Applications for NLP in healthcare can be classified by their use and impact
  on key stakeholders such as providers, patients, and public health officials
  (Zhou+ 2022; Olaronke and Olaleke, 2015). When focusing
  * health providers, NLP is often used to support clinical decision making by
    (1) aggregating and consolidating available data and research, and (2)
    extracting relevant information from data. These tasks involve important
    * challenges such as standardization of healthcare data, accurate labeling,
      extraction and retrieval of health concepts as well as
      categorization of patient conditions (Dash+ 2019).
  * patient requests for information on
    * applications such as question answering for health-related questions, and
      retrieval of information relevant to medical treatments or illnesses.
* analysis of language in the mental health space covering both
  * professional therapy (Sharma+ 2020; PérezRosas+ 2017; Min+ 2022) and
  * social media conversations
    (Tabak and Purver, 2020; Lee+ 2021; Biester+ 2020)
* public health
  * surveillance of public health to identify diseases and risk factors or
    at-risk populations (Naseem+ 2022; Jimeno Yepes+ 2015; Yates+ 2014) and
  * moderate aspects such as misinformation or public sentiment online
    (Hou+ 2019; Kazemi+ 2021b).

## Gaps. One of the most glaring limitations of NLP in healthcare is the

* scarcity of high-quality, annotated clinical data. Although
  * social media data can be useful in some contexts,
  * clinical data is essential in developing tools for clinical decision
    * privacy and ethics concerns. Another shortcoming is the
* lack of language diversity as work to date has primarily focused on
  English or other high-resource languages (Mondal+ 2022) but devoted
  * less efforts towards minority languages.
* lack of human evaluation of NLP-based health systems has made it challenging
* automatic evaluation metrics do not necessarily speak to patient outcomes.
* human-centric studies must be conducted in evaluating the efficacy of

## Research Directions.

1. Healthcare benchmark construction. Although the documentation of recent
  * very high performance for various medical question answering benchmarks, or
    medical licensing texts, there are
  * hE many other tasks in healthcare that lack the data required to achieve
    * privacy issues, and therefore other approaches may be required
  * Synthetic datasets are one such option (Chintagunta+ 2021a; Liednikova+
    2020).  Other options including
  * paraphrasing of existing datasets as a form of data augmentatiom; or
  * using LLMs as a starting point to bootstrap datasets. Another open research
  * evaluation of the quality of the benchmarks. Additionally, research is
  * produce new health datasets in low-resource languages or domains effectivel
2. NLP for clinical decisions. NLP systems can used
  * as brainstorming or decision making tools that can assist experts in their
    evaluation and decision process. They can be used
  * to synthesize new knowledge (eg the latest research papers on a medical
    finding), and make that available to the medical practitioners. Further,
  * bringing together general medical knowledge and personal patient
    information requires new strategies for knowledge integration
  * interpretable, to provide clear reasoning behind their predictions
    <~ interdisciplinary collaboration with medical experts to make sure that
    the system aligns with their domain knowledge and clinical practice.
3. Drug discovery. Drug discovery is a critical research area that has
  * often been considered in relation to biomedical and chemical research, but
  * extraction and analysis of information from large amounts of
    scientific literature, patents, social media, clinical records, and
    other biomedical sources
  * identification and prioritization of drug-target interactions, the
    discovery of new drug candidates, the prediction of compound properties,
  * optimization drug design. New NLP methods can also contribute to the
  * identification of novel drug-target associations and can enable more
  * effective drug repurposing efforts.

# 15 NLP and Ethics

# 16 So What Should _I_ Work On?

* technologies that are culture~ and demographic-aware, that are
  robust, interpretable, and efficient, and that are ethical
* How to choose a research direction to work on?
  * Start with your motivation and interests:
  * consider your previous experiences, look around at your community, explore
  * your curiosities about language and about people, and try to find
  * what resonates with you the most. Building on this foundation,
  * tasks and applications in NLP that connect to your motivations & interests
