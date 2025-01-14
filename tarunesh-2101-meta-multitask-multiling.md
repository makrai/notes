Meta-Learning for Effective Multi-task and Multilingual Modelling
Ishan Tarunesh, Sushil Khyalia, V Kumar, Ganesh Ramakrishnan, Preethi Jyothi
EACL 2021 arXiv:2101.10368 [cs.CL]

* NLP tasks benefit from knowledge of other
  * tasks (eg QA from NER in English) and knowledge of other
  * languages (eg question-answering in English from Spanish). Such shared
* typically learned in isolation, either across tasks or across languages. In
* we propose a meta-learning approach to learn the interactions between both
  tasks and languages. We also investigate the role of
  * different sampling strategies used during meta-learning. We present
  * experiments on five different tasks and six different languages from the
    XTREME multilingual benchmark dataset
* Our meta-learned model clearly improves in performance compared to
  competitive baseline models that also include multi-task baselines.  We also
  * zero-shot evaluations on unseen target languages to demonstrate the utility
    * two multi-task baselines while also reinforcing the linguistic insight

# 1 Intro

* multi-task learning
  (Liu+ 2019b; Kendall+ 2018; Liu+ 2019a; Yang and Hospedales, 2017) that
* multi-lingual deep learning models to learn effective embeddings has led to
  (Conneau+ 2020; Conneau and Lample, 2019; Artetxe and Schwenk, 2019);
  * to aid languages in limited resource (Kumar+ 2019; Wang+ 2017; Adams+ 2017)
* Let us say we had access to M tasks across N different languages cf
  * Table 1 outlines such a matrix of tasks and languages from XTREME (Hu+ 20)
  * Are there specific tasks or languages that need to be sampled more freq?
  * we adopt a meta-learning approach for efficiently learning parameters in a
    shared parameter space across multiple tasks and multiple languages. Our
    * tasks are question answering (QA), natural language inference (NLI),
      paraphrase identification (PA), part-of-speech tagging (POS) and named
      entity recognition (NER)
    * a gamut of types of language representations, fig 1
      * inspiration from the Vauquois Triangle (Vauquois, 1968), well-known for
        machine translation, and situating our chosen tasks within such a
      * POS and NER are relatively ‘shallower’ analysis tasks, token-centric
      * QA, NLI and PA are ‘deeper’ analysis tasks that require deeper sem repr
      * For the deeper tasks, the same task in different languages could have
        representations that are closer and hence benefit each other, while
      * for the shallower tasks, keeping the language unchanged and exploring
        different tasks might be more beneficial
      * this is exactly what we find with our meta-learned model and is borne
* We also find that as the model progressively learns, the meta-learning based
  models for the tasks requiring deeper semantic analysis benefit more from
  joint learning compared to the shallower tasks
* how to sample effectively from different tasks and languages also becomes
  * sampling strategies, including a parameterized sampling strategy, to assess
    the influence of sampling across tasks and languages on our meta-learned
    model
* Our main contributions in this work are threefold:
  * a meta-learning approach that enables effective sharing of parameters
    across multiple tasks and multiple languages
    * This is the first work to
      explore the interplay between multiple tasks at different levels of
      abstraction and multiple languages using meta-learning
    * results on the recently-released XTREME benchmark and observe
      consistent improvements across different tasks and languages
    * We also offer rules of thumb for effective meta-learning that
      could hold in larger settings involving additional tasks and languages
  * We investigate different sampling strategies that can be incorporated
    within our meta-learning approach and examine their benefits
  * We evaluate our meta-learned model in zero-shot settings for every task
    * ie target languages that never appear during training and show its
    * superiority compared to competitive zero-shot baselines
* conclusion
  * deeper tasks consistently benefit from meta-learning. Furthermore,
  * shallower tasks benefit from deeper tasks when meta-learning is restricted
    to a single language
  * zero-shot evaluations for several external languages
    * tasks requiring deeper representations tend to collaborate better
