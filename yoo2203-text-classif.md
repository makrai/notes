Detection of Word Adversarial Examples in Text Classification:
  Benchmark and Baseline via Robust Density Estimation
KiYoon Yoo, Jangho Kim, Jiho Jang, Nojun Kwak
Findings of ACL 2022 arXiv:2203.01677 [cs.CL]

https://github.com/anoymous92874838/text-adv-detection

# Abstract

* Word-level adversarial attacks have shown to
  drastically decrease the performance of transformer-based models recently
* As a countermeasure, adversarial defense has been explored, but
* detect adversarial examples: relatively few efforts have been made to
  may be crucial for eg review sentiment analysis
* we release a dataset for four popular attack methods on four datasets and
  four models to encourage further research in this field. Along with it, we
  * competitive baseline based on density estimation that has the
    highest AUC on 29 out of 30 dataset-attack-model combinations

# 1 Intro

* Adversarial examples in NLP refer to
  seemingly innocent texts that alter the model prediction to a desired output,
* word-level adversarial attacks have shown success in NLP models,
  drastically decreasing the performance of transformer-based models in
  sentence classification tasks with increasingly smaller perturbation rate
  (Jin+ 2020; Li+ 2020; Garg and Ramakrishnan, 2020; Ren+ 2019). In the
* image domain, two main lines of research exist to counteract adversarial att
  * adversarial example detection and defense. The goal
  * detection: discriminate an adversarial input from a normal input, whereas
    * only few efforts have been made in techniques for the sole purpose of
      detection
  * defense intends to predict the correct output of the adversarial input
    * some progress in NLP (Zhou+ 2021; Keller+ 2021; Jones+ 2020),
* applications, in which alerting the victim of an existence of adversarial
  * eg review sentiment analysis, news headline classification, etc) are
  * gain information about the true data-generating population (eg consumers,
    news media, etc), rather than the adversary
  * attaining outputs of an adversarial input ~~ whether correct or not ~~ may
    turn out to be harmful to the system. Accordingly, the
    discard-rather-than-correct strategy would be a good countermeasure
  * detection may be a step towards building a more robust defense model as the
    popular defense paradigm, adversarial training, usually suffers from
    degraded performance on normal inputs (Bao+ 2021)
    * the normal and adversarial inputs can be processed by two separate
      mechanisms as proposed by Zhou+ (2019)
* Many/some existing works that employ detection as an auxiliary task for defense
  * require adversarial samples for training, which may be a restrictive
    scenario given the variety of attack methods and sparsity of advers samples
  * focus on a single type of attack (Le+ 2021) or is
  * limited to character-level attacks (Pruthi+ 2019),
    both of which do not abide the two key constraints (semantics and
    grammaticality) in order to be imperceptible (Morris+ 2020a)
  * carefully crafted word-level adversarial attacks can
    maintain original semantics and remain unsuspicious to human inspectors. To
* we release a benchmark for wordlevel adversarial example detection
  on four attack methods across four NLP models and
  four text classification datasets. We also propose a
  * simple but effective detection method that utilizes
    density estimation in the feature space as shown in Fig. 1 without any
  * no assumption of the attack algorithm or
  * not requiring adversarial samples for training or validation
* related work
  * We summarize the existing works in Table 1
  * Mozes+ (2021), rely on word frequency to assess the likelihood of
    sentence(s)
* we model the probability density of the entire sentence(s). To achieve this,
  * we fit a parametric density estimation model to the features obtained from
    a classification model (eg BERT) to yield likelihoods of each sample as
    shown by Fig. 2
  * inspired by classic works in novelty detection (Bishop, 1994), which
    utilizes generative models to find anomalies
  * hE, simply fitting a parametric model suffers from curse of dimensionality
    characterized by
    * sparse data points and spurious features
    * rare outliers that hamper accurate estimation
  * To tackle these issues, we leverage kernel PCA and
    Minimum Covariance Determinant, for robust density estimation (RDE)
* Our attack-agnostic and model-agnostic detection method achieves the
  best performance as of AUC on 29 out of 30 dataset-attack-model combinations
  and best performance as of TPR , F 1 , AUC on 25 of them without any
  assumption on the attacks
* Our contributions are two-fold:
  * an adversarial detection method that does
    not require validation sets of each attack method through robust parameter
    estimation
  * dataset for word-level adversarial example detection on 4 attacks, 4 text
    classification datasets, and 4 models and the
    * source code for experimenting on various experimental protocols
  * analysis on a stronger adversary with partial knowledge of the detection
    method and techniques to counteract the adversary. Last,
  * we investigate the method’s applicability on character-level attacks
