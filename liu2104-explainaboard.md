ExplainaBoard: An Explainable Leaderboard for NLP
Pengfei Liu, Jinlan Fu, Yang Xiao, Weizhe Yuan, Shuaicheng Chang, Junqi Dai, Yixin Liu, Zihuiwen Ye, Zi-Yi Dou, Graham Neubig
ACL2021 Demo Track arXiv:2104.06387 [cs.CL]

* leaderboards present a rather simplistic one-dimensional view of the systems,
  * holistic accuracy numbers
* we present a new conceptualization and implementation of NLP evaluation: the
  ExplainaBoard, which in addition to inheriting the functionality of the
  standard leaderboard, also allows researchers to
  * diagnose strengths and weaknesses of a single system (e.g.~what is the
    best-performing system bad at?)
  * interpret relationships between multiple systems. (e.g.~where does system A
    outperform system B? What if we combine systems A, B, and C?) and
  * examine prediction results closely (e.g.~what are common errors made by
    multiple systems, or in what contexts do particular errors occur?)
* So far, ExplainaBoard covers more than 400 systems, 50 datasets, 40 languages,
  and 12 tasks. ExplainaBoard keeps updated and is recently upgraded by
  supporting
  * multilingual multi-task benchmark,
  * meta-evaluation, and
  * more complicated task: machine translation, which reviewers also suggested.}

# 1 Intro

* NLP research has been and is making astounding strides forward.  This is true
  * classical tasks such as machine translation (Sutskever+ 2014; Wu+ 2016), as
  * new
    * tasks (Lu+ 2016; Rajpurkar+ 2016),
    * domains (Beltagy+ 2019), and
      * Iz Beltagy, Kyle Lo, and Arman Cohan. 2019. SciBERT
    * languages (Conneau and Lample, 2019). One way this progress is quantified
* leaderboards include
  * GLUE and SuperGLUE for natural language understanding (Wang+ 2018, 2019),
  * XTREME and XGLUE (Hu+ 2020; Liang+ 2020) for multilingual understanding, the
  * WMT shared tasks (Barrault+ 2020) for machine translation, and
  * GEM and GENIE for NLG (Gehrmann+ 2021; Khashabi+ 2021)
* hE, focus on raising evaluation numbers at the cost of deeper scientific
  understanding of model properties (Ethayarajh and Jurafsky, 2020).
* three major limitations of the existing leaderboard paradigm:
  * Interpretability: strengths and weaknesses of systems
  * Interactivity: Existing leaderboards are static and non-interactive, which
    * more complex evaluation settings (e.g.  multi-dataset, multimetric,
      multi-language
    * relationships between different systems. For example, where does model A
      outperform model B? Would the performance be further improved if we
      combine the Top-3 models?
  * Reliability: Given the increasing role that leaderboards have taken in
    * especially on datasets with small sample sizes, but most current
* we describe ExplainABoard (see Fig.1), a software package and hosted leaderbrd
  * 9 tasks and 41 datasets, and how it can be easily adapted to new tasks
* ExplainABoard will benefit different steps of the research process:
  * System Developement: ExplainABoard provides more detailed information
    * fine-grained results, confidence intervals), allowing system developers to
  * Leaderboard Organization: The E X - PLAINA B OARD software both provides a
    * we have already established an ExplainaBoard 5 for the existing XTREME
  * Broad Analysis and Understanding: Because ExplainABoard encourages
    system developers to provide their system outputs in an easy-to-analyze
    * help researchers, particularly those just starting in a particular NLP
      sub-field, get a broad sense of what current SOTA models can and cannot do
