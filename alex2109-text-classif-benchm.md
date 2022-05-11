RAFT: A Real-World Few-Shot Text Classification Benchmark
N Alex, E Lifland, L Tunstall, A Thakur, P Maham, C Jess Riedel, E Hine,
  C Ashurst, P Sedille, A Carlier, M Noetel, A Stuhlmüller
arXiv:2109.14076 [cs.CL]

RAFT datasets and leaderboard: https://raft.elicit.org
# Abstract

* Existing benchmarks are not designed to measure progress in applied settings,
* The RAFT benchmark (Real-world Annotated Few-shot Tasks) focuses on naturally
  * evaluation setup that mirrors deployment.  Baseline evaluations on RAFT
* current techniques struggle with
  * reasoning over long texts and tasks with many classes
* Human: some classification tasks are difficult for non-expert humans,
* hE even non-expert human baseline F1 scores exceed GPT-3 by an average of
  0.11
* leaderboard will track which model improvements benefit the real-world

# 1 Intro

* few-shot classification benchmarks are typically designed to
  highlight areas where models fall short [29] or to
  study particular model abilities [5, 37, 21]. The tasks and evaluation setup
  * eg SuperGLUE [32] and the few-shot equivalent FewGLUE [29]
    mainly include short texts
    * applied tasks sometimes requires reasoning over long texts
    * Existing systems struggle with long texts due to a limited context window,
      especially in the few-shot setting where some systems learn from examples
      presented in context
* The evaluation may both under- and overestimate
  * under
    * closed-book setting (eg, no retrieval from online sources) and using
    * uninformative labels (eg, 0/1 instead of “about literature” vs. “movies”)
  * overestimate model capability by using
    many more than a few examples for setting hyperparameters during validation
    [24]
* RAFT is a real-world few-shot text classification benchmark designed to
  * labeling is inherently valuable to someone, and they may have challenges
  * need for information retrieval, domain expertise, parsing long documents,
    and making use of instructions. Table 1 shows the real-world challenges
  * For each task, we release a
    * public training set with 50 examples and a larger unlabeled test set 2 
      We encourage unsupervised pre-training on the unlabelled examples and
      open-domain information retrieval. We keep the test-set labels private
    * automated evaluation through a Hugging Face leaderboard 3 
  * The crowdsourced baseline reveals that RAFT includes a mix of moderate to
    difficult tasks
    * difficulties in collecting human crowdsourced baselines on some datasets,
      particularly when domain expertise is important, which suggests that
