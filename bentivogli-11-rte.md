The Seventh PASCAL Recognizing Textual Entailment Challenge
Luisa Bentivogli, Peter Clark, Ido Dagan, Danilo Giampiccolo
2011

# Abstract

* exercise proposed in RTE-6, consisting of
  * Main Task
    * Textual Entailment on a real corpus in the Update Summarization scenario;
    * 13 teams participated (33 runs)
  * Novelty Detection Subtask
    * 5 teams (submitting 13 runs)
  * KBP Validation Task, in which RTE systems had to validate the output of
    * 2 participants which submitted 5 runs
* ablation leperálás test experiment to evaluate the impact of
    * knowledge resources used by the systems participating in the Main Task
    * tools

# 1 Introduction

értelmesebben van leírva a követkető szakaszban

* RTE-6 challenge
  * aims
    1. to propose data sets which reflect the natural distribution of
    entailment in a corpus and present all the typical problems in a
    natural setting;
    1. to further explore the contribution to Summarization applications
  * innovations
    * recognizing textual entailment within a corpus
      * given a corpus, a hypothesis H and a set of "candidate" sentences
        retrieved by the Lucene search engine from that corpus for H, RTE
        systems are required to identify all the sentences that entail the H
        among the candidate sentences
    * Novelty Detection Subtask aimed at specifically
      * addressing the needs of the Summarization Update scenario was also
      * judge whether the information contained in each hypothesis H is novel
        with respect to (i.e. not entailed by) the information contained in the
        corpus. Another major innovation in RTE-6 was represented by the
    * Knowledge Base Population (KBP) Validation Pilot Task, in which
      * validate the output of systems participating in the KBP Slot Filling
        Task (an advanced Information Extraction task)
* the same tasks were used in RTE-7 as in RTE-6 without significant changes
  following the well-established practice of not significantly changing the
  task every year
* organization
  * Section 2 the Main Task is presented, describing the
    * data sets, the evaluation methodology, and an analysis of the results
      achieved by the participating systems
  * Section 3: Novelty Detection Subtask
  * KBP Validation Task is described in Section 4
  * Section 5: the RTE-7 ablation tests, together with the RTE Knowledge
    Resources initiative, are presented
  * Conclusions and perspectives on future work are outlined in Section 6

# 2 The RTE-7 Main Task: Recognizing Textual Entailment within a Corpus

* introduced as a pilot task in RTE-5 (see Bentivogli+ 2009b) and
  * became the Main task in 2006,
* finding all the sentences in a set of documents that entail a given Hypoth
* situated in the Summarization application setting,
  * As in RTE-6 which means that
  1. the RTE corpus is taken from the 2009 and 2010 Summarization Task data set
  1. the Hs are standalone versions of sentences in that data set, partly
    * selected among the sentences incorporated into some of the automatic
      summaries created by the systems participating in the Update
      Summarization Task 2 , and partly
    * taken directly from Summarization data set documents

## 2.5 Evaluation Measures

* Precision, Recall, and micro-averaged F-measure

## 2.6 Submitted Systems and Results

# 5 System approaches

* BIU proposes a new version of its transformation-based approach using
  entailment rules and syntactic motivated operations to perform a sequence of
  inference steps from T to H, which is finally validated by a confidence
  model
* A large number of systems exploit similarity measures and matching algorithms
  applied at different levels – lexical, syntactic or semantic
* FBK attempts an approach which moves from token-level to phrase-level
  overlap, also using paraphrases from parallel data as the main source of
  lexical knowledge for mapping
* DFKI approaches lexical similarity by treating T and H as translation of the
  same source sentence and using the METEOR score to define feature templates
  to capture similarity between T and H
* IKOMA system combines entailment scores calculated by lexical matching with
  machine learning, using a filtering mechanism aimed at discarding T-H pairs
  which are not entailing, despite high entailment scores based on lexical
  similarity
* SJTU-CIT uses machine learning algorithms combined with knowledge drawn from
  different resources, such as WordNet, VerbOcean and Wikipedia, and features
  that quantify lexical, syntactic and semantic level matching between T and H
* u_tokyo uses different WordNet based similarity measure to determine the
  entailment judgment.  A distance-based approach is implemented by EDITS, an
  open-source RTE package that was exploited by two groups. CELI proposes a new
* CELI proposes a new version of it, EDIT-GA, extended with genetic algorithms,
  i.e. a direct stochastic method for global search and optimization that
  mimics natural evolution. Also SINAI uses EDITS, integrating Personalized
  Page Rank Vectors (PPVs) by means of rules to provide knowledge about the
  probability of entailment or contradiction between T and H.  Among the
  systems which do
* not use machine learning techniques, two systems adopt a rule-based approach,
  * ICL -which built an inference model based on entailment rules, using also
    syntactic analysis tools and lexical and semantic resources-, and
  * UAIC –which additionally exploits the notion of predication driven entity
    matching.  The remaining systems are
* based on similarity measures or matching algorithm: BUPTT measures the word
  overlap between T and H; and JU_CSE_TAC system is made up by four modules
  that perform lexical word matching and measure syntactic similarity over
  chunks and named entities

# 6 RTE-7 Ablation Tests and RTE Knowledge Resources initiative
