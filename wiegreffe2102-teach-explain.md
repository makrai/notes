Teach Me to Explain: A Review of Datasets for Explainable Natural Language Processing
Sarah Wiegreffe, Ana Marasović
NeurIPS 2021 arXiv:2102.12060 [cs.CL]

# Abstract

* Explainable NLP (ExNLP)
* collecting human-annotated textual explanations
* explanations are used downstream in three ways: as
  * data augmentation to improve performance on a predictive task
  * supervision to train models to produce explanations for their predictions
  * a ground-truth to evaluate model-generated explanations
* we identify 65 datasets with three predominant classes of textual explanats
  (highlights, free-text, and structured),
  * organize the literature on annotating each type,
    * strengths and shortcomings of existing collection methodologies
  * recommendations for collecting ExNLP datasets in the future

# 1 Intro

* Models that produce justifications for their individual predictions
  (sometimes referred to as local explanations)
  can be inspected for the purposes of debugging, quantifying bias and
  fairness, understanding model behavior, and ascertaining robustness and
  privacy [83]
  * datasets that contain human justifications (overviewed in Tables 3–5)
  * human justifications are used for three goals:
    * to aid models with additional training supervision [142],
    * to train interpretable models that explain their own predictions [20],
    * to evaluate plausibility of model-generated explanations by measuring
      their agreement with human explanations [29]
* Dataset collection is the most under-scrutinized [examine] compon of ML [93]
  * 92% of ML practitioners encounter data cascades, or downstream problems
    resulting from poor data quality [109]
  * evaluate and standardize data collection practices [13, 39, 95]
    * particularly valuable when many related datasets are released contemporan
      eg ExNLP datasets
* This is a survey on collecting textual explanations
  * complements other explainable AI (XAI) surveys and critical retrospectives
    * definitions, methods, and/or evaluation
      [33, 15, 77, 1, 103, 51, 42, 133, 26, 44, 82, 121, 12, 86, 54, 19],
      but not on datasets
  * modeling ExNLP datasets for the three goals mentioned above requires NLP
    techniques
  * Datasets and methods for explaining
    fact checking [65] and reading comprehension [117] have been reviewed;
  * we are the first to review all datasets with textual explanations
    regardless of task
* majority of the work reviewed has originated in the last 1-2 years,
  * explosion of interest in collecting datasets for ExNLP . We provide
  * we: effort to promote standardization and consistency
  * a starting resource for newcomers to ExNLP, and for further discussions

# 2 ExNLP terminology (§2)

* explain “why is [input] assigned [label]?”
* explanations can vary in format. We identify three types in the ExNLP
* An example of each type is given in Table 1
* no consensus on terminology

## Highlights are subsets of the input elements (words, phrases, or sentences)

* Lei+ [73] coin them extractive rationales, or
  subsets of the input tokens of a textual task that satisfy two properties:
  * compactness, they are short and coherent, and
  * sufficiency, they suffice for prediction as a substitute of the orig text
* Yu+ [141] introduce a third criterion,
  * comprehensiveness, that
    all the evidence that supports the prediction is selected, not just a suffi
* the term “rationale” implies human-like intent,
  * Jacovi and Goldberg [55] argue to call this type of explanation highlights
    to avoid inaccurately attributing human-like social behavior to AI systems
* also called evidence in fact-checking and multi-document QA [65]
* the community has settled on criteria (i)–(iii) for highlights,
  * hE the extent to which collected datasets (Table 3) reflect them varies
    * we will discuss in §4. Table 2 gives examples of sufficient vs
      non-sufficient and comprehensive vs. non-comprehensive highlights

## Free-text explanations are free-form textual justifications

* not constrained to the words or modality of the input instance
* more expressive and generally more readable than highlights
* useful for explaining reasoning tasks where
  explanations must contain information outside the input sent/doc [20, 128]
* also called textual [62] or natural language explanations [20],
  * terms overloaded [98]
* Synonyms, free-form [20] or abstractive explanations [87]

### structured explanations

* not entirely free-form although they are still written in natural language
* eg constraints placed on the explanation-writing process, such as the
  required use of specific inference rules
* We discuss the recent emergence of structured explanations in §5
* no common definition; we elaborate on dataset-specific designs in §3
* An example is given in the bottom row of Table 1

# 3 65 existing datasets (§3)

* accompanied with a live table as https://exnlpdatasets.github.io
  * accepting community contributions
* by explanation type: highlights (Table 3), free-text explanations (Table 4),
  and structured explanations (Table 5)
* non-English: SCAT [139], the rest is in English
* license: The authors of ∼66% papers cited in Tables 3–5 report in paper/repo
  * 45.61% use common permissive licenses; for more information see Appendix B
* For each dataset, we report the number of instances (input-label pairs) and
  the number of explanations per instance (if > 1)
  * annotation procedure used to collect each dataset is reported as:
    * crowd-annotated (“crowd”)
    * automatically annotated through a web-scrape, database crawl, or merge of
      existing datasets (“auto”)
    * annotated by others (“experts”, “students”, or “authors”)
* Some authors perform semantic parsing on collected explanations (denoted ∗);
  we classify them by the dataset type before parsing and list the collection
  type as “crow + authors”
* the dominant collection paradigm (≥90%) is via human (crowd, student,..) ann

## Highlights (Table 3) The granularity of highlights depends on the task

* majority of authors do not place a restriction on granularity, allowing
  words, phrases, or sentences of the original input document to be selected
* The coarsest granularity in Table 3 is one or more paragraphs in a longer
  document [68, 24]. We exclude datasets that include an associated document as
  evidence without specifying the location of the explanation within the
* Some highlights are re-purposed from annotations for a different task
  * eg M ULTI RC [60] originally to assess that each question in the dataset
    requires multi-sentence reasoning to answer
  * S TANFORD S ENTIMENT T REEBANK [ SST ; 113] which contains crowdsourced
    * Word phrases that have the same sentiment label as the review can be
      heuristically merged to get phrase-level highlights [23]. Other
* wording of these instructions
  * highlight words justifying, constituting, indicating, supporting, or
    determining the label, or words that are essential, useful, or relevant for
  * In §4, we discuss how one difference in annotation instructions (requiring
    comprehensiveness or not) can be important

## Free-Text Explanations (Table 4) This is a

* popular explanation type for both textual and visual-textual tasks
* Most free-text explanations are generally no more than a few sentences
  * exception is LIAR-PLUS [5], which contains the conclusion paragraphs of
    web-scraped human-written fact-checking summaries

## Structured Explanations (Table 5): dataset-specific forms

* common approaches is to construct a
  * chain of facts that detail the reasoning steps to reach an answer
  * place constraints on the textual explanations that annotators can write,
    such as requiring the use of certain variables in the input ("semi-struct")
* WorldTree datasets [57, 132]: explaining elementary-school science questions
  with a combination of chains of facts and semi-structured text, termed
  “explanation graphs”
  * The facts are individual sentences written by the authors that are
    centered around a set of shared relations and properties
  * authors can construct an explanation graph by linking shared words in the
    question, answer, and explanation
    * Given the chain of facts for an instance (6.3 facts on average)
* OpenBookQA [OBQA; 81] uses single WorldTree facts to prime annotators to
  write QA pairs
* each question in QASC [61] contains two associated science facts from a
  corpus selected by human annotators who wrote the question
* Jhamtani and Clark [58] extend OBQA and QASC with two-fact chain explanation
  annotations, which are automatically extracted from a fact corpus and
  validated with crowdsourcing
  * The resulting datasets, EQASC and EOBQA, contain
    multiple valid and invalid explanations per instance, as well as
    perturbations for robustness testing (EQASC-PERTURBED)
* supplement datasets for reading comprehension
  * Ye+ [138] collect semi-structured explanations for N ATURAL Q UESTIONS [68]
    and SQ U AD [102]
    * require annotators to use phrases in both the input question and context,
      and limit them to a small set of connecting expressions
  * Inoue+ [53] collect R 4 C, fact chain explanations for H OTPOT QA [137]
  * Lamm+ [70] collect explanations for N ATURAL Q UESTIONS that follow a
    linguistically-motivated form (see the example in Table 1)
* We discuss structured explanations further in §5

                                      ***

* We next analyze what can be learned from existing data collection methodologs
* In §4 and §5, we highlight two points
* motivated by ExNLP modeling and evaluation choices,

# 4 Link Between ExNLP Data, Modeling, and Evaluation Assumptions 5

* intro
  * traditional process of collecting explanations by
    asking annotators to highlight parts of the input
  * discrepancies with evaluating model-generated highlight explanations
  * how assumptions made for collecting free-text explanations (introduced in
    §2) influence their modeling, and
  * call for better documentation of explanation collection
* Highlights are usually evaluated following two criteria:
  * plausibility, according to humans, how well a highlight supports a label
    [133, 29], and
  * faithfulness or fidelity:
    * how accurately a highlight represents the decision process [6, 127]
  * Human-annotated highlights (Table 2) are used to measure the plausiblity of
    model-produced highlights
    * the higher the overlap between the two, the more plausible model highligh
  * a highlight that is both
    sufficient (implies the prediction, §2; first example in Table 2) and
    comprehensive (its complement does not imply the prediction, §2)
    is regarded as faithful to the prediction it explains [29, 23]
  * human-annotated highlights are used only for evaluation of plausibility but
    not faithfulness
    => one might expect that the measurement and modeling of faithfulness
    cannot influence how human-authored explanations should be collected
    * this expectation might lead to collecting highlights that are unfitting
      for the goals (ii) and (iii) in §1
    * Typical instructions for collecting highlights encourage sufficiency and
      compactness, but not __comprehensiveness__. eg, DeYoung+ [29] deem M OVIE
      R EVIEWS and E VIDENCE I NFERENCE highlights non-comprehensive
    * Carton+ [23] expect that FEVER highlights are non-comprehensive, in
      contrast to DeYoung+ [29]
    * we observe that the E-SNLI authors collect non-comprehensive highlights,
      since they instruct annotators to highlight only words in the hypothesis
      (and not the premise) for neutral pairs, and consider
      contradiction/neutral explanations correct if at least one piece of
      evidence in the input is highlighted
    * we conclude that post-hoc assessment of comprehensiveness
      from a general description of data collection is error-prone
    * Carton+ [23]: available human highlights are not necessarily sufficient
      nor comprehensive for predictions of highly accurate models. This
  * insufficiency
    * two datasets whose sufficiency Carton+ [23] found to be most concerning:
      neutral E-SNLI pairs and no-attack W IKI A TTACK examples.
      * Neutral E-SNLI cases are not justifiable by highlighting
        because they are obtained only as an intermediate step to collecting
        free-text explanations, and only free-text explanations truly justify a
        neutral label [20]
    * No-attack W IKI A TTACK examples are not explainable by highlighting
      because the absence of offensive content justifies the no-attack label,
    * We recommend (i) avoiding human-annotated highlights with low sufficiency
      when evaluating and collecting highlights, and (ii) assessing whether the
      true label can be explained by highlighting
  * Consider a highlight that is non-comprehensive because it is redundant with
    its complement in the input (e.g., a word appears multiple times, but only
    one occurrence is highlighted)
    * Highlighting only one occurrence of “great” is a valid justification, but
      quantifying faithfulness of this highlight is hard
      because the model might rightfully use the unhighlighted occurrence of
      “great” to make the prediction
      * ie comprehensiveness is modeled to make faithfulness evaluation feasible
      * Non-comprehensiveness of human highlights
* free-text explanations also affected by
  Mutual influence of data and modeling assumptions
  * eg the E-SNLI guidelines have far more constraints than the COS-E guidelins
    * eg requiring self-contained explanations
  * Wiegreffe+ [128]  such data collection decisions can influence
    modeling assumptions
    * not an issue per se, but we should
      be cautious that ExNLP data collection decisions do not popularize
      explanation properties as universally necessary when they are not,
      e.g., that free-text explanations should be understandable without input
      or that highlights should be comprehensive
    * this could be avoided with better documentation,
      e.g., with additions to a standard datasheet [39]
  * Explainability fact sheets have been proposed for models [114], but not for
    datasets
    * eg an E-SNLI datasheet could note that self-contained explanations were
      required during data collection, but that this is not a necessary
      property of a valid free-text explanation
  * emphasize that comprehensiveness is required to simplify faithfulness eval
* Takeaways
  1. important to precisely report how explanations were collected, e.g.,
     by giving access to the annotation interface, screenshotting it, or giving
     the annotation instructions verbatim
  2. Sufficiency is necessary for highlights, and ExNLP researchers should
     avoid human-annotated highlights with low sufficiency for evaluating and
     developing highlights
  3. Comprehensiveness isn’t necessary for a valid highlight, it is a means to
     quantify faithfulness
  4. Non-comprehensive human-annotated highlights cannot be used to
     automatically evaluate plausibility of highlights that are constrained to
     be comprehensive. In this case, ExNLP researchers should collect and use
     comprehensive human-annotated highlights
  5. Researchers should not make (error-prone) post-hoc estimates of
     comprehensiveness of human-annotated highlights from datasets’ general
     descriptions
  6. ExNLP researchers should be careful to
    not popularize their data collection decisions as universally necessary. We
    * documenting all constraints on collected explanations in a datasheet,
      highlighting whether each constraint is necessary
      * noting how each constraint might affect modeling and evaluation

# 5 Rise of Structured Explanations 7

* intro
  * not all template-like free-text explanations are incorrect, and
  * call for embracing the structure of an explanation when appropriate
* merit of free-text explanations is their expressivity, which
  can come at the costs of underspecification and inconsistency due to the
  difficulty of quality control (stressed by the creators of two popular
  free-text explanation datasets: E-SNLI and COS-E). In this section, we
  highlight and challenge one prior approach to overcoming these difficulties:
  discarding template-like free-text explanations.
* We compare crowdsourcing guidelines for the above-mentioned datasets in
  * two notable similarities between the guidelines for the above-mentioned
    * asked annotators to first highlight input words and then formulate a
      free-text explanation from them, to control quality
    * template-like explanations are discarded because they are deemed
      uninformative
  * The E-SNLI authors assembled a list of
    56 templates (e.g., “There is <hypothesis>”) to identify explanations whose
    edit distance to one of the templates is <10. They
    * re-annotate the detected template-like explanations (11% in the entire
      dataset)
  * The COS-E authors discard sentences “<answer> is the only option that is
    correct/obvious” (the only given example of a template)
  * Template explanations concern researchers because they can result in
    artifact-like behaviors in certain modeling architectures
    * eg a model which predicts a task output from a generated explanation can
      produce explanations that are plausible to a human user and give the
      impression of making label predictions on the basis of this explanation.
    * it is possible that the model learns to ignore the semantics of the
      explanation and instead makes predictions based on the explanation’s
      template type [66, 55]
    => the semantic interpretation of the explanation (that of a human reader)
      is not faithful (an accurate representation of the model’s decision
      process).
* re-annotating, Camburu+ [21] report that E-SNLI explanations still largely
  follow 28 label-specific templates (e.g., an entailment template “X is
  another form of Y”) even after re-annotation.
  * Brahman+ [18] report that models trained on gold E-SNLI explanations
    generate template-like explanations for the defeasible NLI task. These
  * what are the differences between templates
    considered uninformative and filtered out, and
    those identified by Camburu+ [21], Brahman+ [18] that remain after filter?
* structured explanations have been intentionally collected (see Table 5; §3).
  * acknowledge structure as inherent to explaining the tasks they investigate.
  * [ GLUCOSE ; 85] takes the matter further, arguing that explanations should
    not be entirely free-form.
*, we recommend running pilot studies to explore
  how people define and generate explanations for a task
  * If they reveal that informative human explanations are nat structured,
    incorporating the structure in the annotation scheme is useful
  * This turned out to be the case with NLI; Camburu+ [21]
* we also encourage creators of datasets with template-like explanations to
  highlight in a dataset datasheet (§4) that template structure can influence
  downstream modeling decisions
* no all-encompassing definition of explanation, and
  researchers could consult domain experts or follow literature from other
  fields to define an appropriate explanation in a task-specific manner, such
  as in GLUCOSE [85].
  * For conceptualization of explanations in different fields see Tiddi+ [119].
* if pilot studies do not reveal any obvious structure to human explanations of
  * do our best to control the quality of free-text explanations because low
  * COS-E is collected with notably less annotation constraints and quality
    controls than E-SNLI, and has annotation issues that some have deemed make
    the dataset unusable [87]; see examples in Table 7 of Appendix A
  * positive example of quality control: the annotation guidelines of VCR [143]
    in Table 8 and GLUCOSE [84]
  * In §6 and §7, we give further task-agnostic recommendations for collecting
    high-quality ExNLP datasets, applicable to all three explanation types.
* Takeaways
  1. ExNLP researchers should study how people define and generate explanations
     for the task before collecting free-text explanations.
  2. If pilot studies show that explanations are naturally structured, embrace
     the structure.
  3. no all-encompassing definition of explanation. Thus, ExNLP researchers
     could consult domain experts or follow literature from other fields to
    * should be open for debate on a given task.

                                      ***

* the rest of this paper reflects on relevant points from a broader NLP researc

# 6 Increasing Explanation Quality

* proposal for controlling quality in explanation collection
* When asked to write free-text sentences from scratch for a table-to-text
  annotation task outside ExNLP crowdworkers produce “vanilla targets that lack
  [linguistic] variety” Parikh+ [92]
  * can result in annotation artifacts, which are
    prevalent in the popular SNLI [16] and MNLI [129] datasets [97, 45, 120],
    among others [40]. These authors demonstrate the harms of such artifacts:
* Artifacts can occur from poor-quality annotations and inattentive annotators,
  both of which have been on the rise on crowdsourcing platforms [25, 7, 87].
  * needed: increased diversity of annotators and quality control
  * quality control here and diversity in §7.

## 6.1 A Two-Stage Collect-And-Edit Approach

* While ad-hoc methods can improve quality [20, 143, 84],
* collect annotations in two stages.
  * effective and generalizable method is to
  * applied by a small minority of ExNLP dataset papers [58, 144, 143], who
  1. Collect explanation candidates automatically or from crowdworkers, and
  2. quality-control by having other crowdworkers Judge the quality
    * allows authors to release quality ratings for each instance.
* Collect-and-Edit: Outside ExNLP, Parikh+ [92] use an extended version of this
  2. ask annotators to edit the datapoints
  * Bowman+ [17] use this approach to re-collect NLI hypotheses, and find,
    * reduces artifacts in a subset of MNLI
  * In XAI, Kutlu+ [67] collect highlight explanations for Web page ranking
    with annotator editing
  * We advocate Collect-and-Edit
  * potential to increase linguistic diversity via multiple annotators
    * reduce individual annotator biases, and perform quality control.
* case study of two multimodal free-text explanation datasets, we will
  * collecting explanations automatically without human editing (or judging)
    can lead to artifacts.
  * E-SNLI-VE [32] and VQA-E [75] are two visual-textual datasets for
    entailment and question-answering, respectively
  * E-SNLI-VE combines annotations of two datasets:
    * SNLI-VE [131], collected by replacing the textual premises of SNLI [16]
      with F LICKR 30 K images [140], and
      * every SNLI premise was originally the caption of a F LICKR 30 K photo.
    * E- SNLI [20], a dataset of crowdsourced explanations for SNLI . This
    * hE SNLI ’s hypotheses were collected from crowdworkers who did not see
      the original images, the photo replacement process results in a
      significant number of errors [122]
    * Do+ [32] re-annotate labels and explanations for the neutral pairs in the
      validation and test sets of SNLI-VE
    * hE the dataset remains low-quality for training models [78]
    * With a full EDIT approach, we expect that these artifacts would be
      significantly reduced, and the resulting dataset could have quality
      on-par with E-SNLI
  * Similarly, the VQA-E dataset [75] converts image captions from the VQA V
    2.0 dataset [43] into explanations, but a
    notably lower plausibility compared to a carefully-crowdsourced VCR
    explanations is reported in [78]

## 6.2 Teach and Test the Underlying Task

## 6.3 Addressing Ambiguity

# 7 recommendations from related subfields: diversity

* reduce data artifacts by increasing diversity of collected explanations
