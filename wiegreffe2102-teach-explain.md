Teach Me to Explain: A Review of Datasets for Explainable Natural Language Processing
Sarah Wiegreffe, Ana Marasović
NeurIPS 2021 arXiv:2102.12060 [cs.CL]

# Abstract

Explainable NLP (ExNLP) has increasingly focused on
* collecting human-annotated textual explanations. 
* explanations are used
  downstream in three ways
  * as data augmentation to improve performance on a predictive task
  * as supervision to train models to produce explanations for their predictions
  * as a ground-truth to evaluate model-generated explanations
* we identify 65 datasets with three predominant classes of textual explanats
  (highlights, free-text, and structured),
  * organize the literature on annotating each type, 
    * strengths and shortcomings of existing collection methodologies, and give
  * recommendations for collecting ExNLP datasets in the future. 

# 1 Intro

* Models that produce justifications for their individual predictions
  (sometimes referred to as local explanations)
  can be inspected for the purposes of debugging, quantifying bias and
  fairness, understanding model behavior, and ascertaining robustness and
  privacy [83]
  * datasets that contain human justifications for the true label
    (overviewed in Tables 3–5)
  * human justifications are used for three goals: 
    * to aid models with additional training supervision [142], 
    * to train interpretable models that explain their own predictions [20], and 
    * to evaluate plausibility of model-generated explanations by measuring
      their agreement with human explanations [29].
* Dataset collection is the most under-scrutinized [examine] compon of ML [93]
  * 92% of ML practitioners encounter data cascades, or downstream problems
    resulting from poor data quality [109]. It is important to constantly
  * evaluate and standardize data collection practices critically [13, 39, 95].
    * particularly valuable when many related datasets are released contemporan
      eg E X NLP datasets.
* This is a survey on collecting textual explanations, highlight
  what has been learned to date, and give recommendations for future dataset co
  * complements other explainable AI ( XAI ) surveys and critical
    retrospectives that focus on definitions, methods, and/or evaluation
    [33, 15, 77, 1, 103, 51, 42, 133, 26, 44, 82, 121, 12, 86, 54, 19],
    but not on datasets. We call such datasets E X NLP datasets, because
  * modeling ExNLP datasets for the three goals mentioned above requires NLP
    techniques
  * Datasets and methods for explaining
    fact checking [65] and reading comprehension [117] have been reviewed;
  * we are the first to review all datasets with textual explanations
    regardless of task

# 2 E X NLP terminology (§2) 

# 3 65 existing datasets (§3), accompanied with a live version of the tables as
a website accepting community contributions: https://exnlpdatasets.github.io.

* We next analyze what can be learned from existing data collection methodologs
* In §4 and §5, we highlight two points that we expect to be particularly
  important to the current ExNLP research. Specifically, §4 discusses
* motivated by E X NLP modeling and evaluation choices,

# 4 the traditional process of collecting explanations by asking annotators to
highlight parts of the input, and its
  * discrepancies with evaluating model-generated highlight explanations. We
  * how assumptions made for collecting free-text explanations (introduced in
    §2) influence their modeling, and
  * call for better documentation of explanation collection. In §5, we

# 5 not all template-like free-text explanations are incorrect, and

* call for embracing the structure of an explanation when appropriate.  Unlike
  discussions

* the rest of this paper reflects on relevant points from a broader NLP researc

# 6 proposal for controlling quality in explanation collection, and in §7,

# 7 recommendations from related subfields: diversity

* reduce data artifacts by increasing diversity of collected explanations.
