Don't Stop Pretraining: Adapt Language Models to Domains and Tasks
S Gururangan, A Marasović, S Swayamdipta, K Lo, I Beltagy, D Downey, NA Smith
ACL 2020 arXiv:2004.10964 [cs.CL]

Our code as well as pretrained models for multiple domains and tasks are public

* Language models pretrained on text from a wide variety of sources
* we investigate whether it is still helpful to tailor a pretrained model to
  the domain of a target task. We present a study across
  * four domains
    (biomedical and computer science publications, news, and reviews)
  * eight classification tasks (two in each domain)
  * high~ and low-resource settings
    * low: ≤ 5K labeled training examples, and no additional unlabeled data
  * a second phase of pretraining in-domain (domain-adaptive pretraining) leads
    to performance gains,
  * adapting to the task's unlabeled data (task-adaptive pretraining) improves
    performance even after domain-adaptive pretraining
* adapting to a task corpus augmented using simple data selection strategies is
  an effective alternative
  * especially when resources for domain-adaptive pretraining are unavailable

# 1 Intro

* Do the latest large pretrained models work universally or
  is it still helpful to build separate pretrained models for specific domains?
* benefit of continued pretraining on domain-specific unlabeled data (Lee+ 19)
  * only consider a single domain at a time
  * language model pretrained on a smaller and less diverse corpus than the
    most recent language models
  * not known how the benefit of continued pretraining may vary with
    the amount of available labeled task data, or
    the proximity of the target domain to the orig pretraining corpus: Fig 1
* We address this question for RoBertA (Liu+ 2019) (§2)
  * domain-adaptive pretraining (DAPT) consistently improves performance
* def domain
  * Above, we consider domains defined around genres and forums, but
    it is also possible to induce a domain from a given corpus used for a
    task, such as the one used in supervised training of a model
* ie whether pretraining on a corpus more directly tied to the task can improve
  * task-adaptive pretraining (TAPT) on a smaller but directly task-relevant
    * compared to domain-adaptive pretraining
  * the unlabeled task dataset (§4), drawn from the task distribution
  * has been shown effective (Howard and Ruder, 2018), but is
    not typically used with the most recent models
  * large performance boost for RoBertA, with or without domain-adaptive
* the benefits from task-adaptive pretraining
  increase with additional unlabeled data from the task distribution that has
  been manually curated by task designers or annotators
* we propose ways to automatically select additional task-relevant unlabeled
  text, and show how this improves performance in certain low-resource cases
  (§5)
* On all tasks, our results using adaptive pretraining techniques are
  competitive with the SOTA
* contributions include:
  * a thorough analysis of domain~ and task-adaptive pretraining
    across four domains and eight tasks, spanning low~ and high-resource
  * an investigation into the
    transferability of adapted LMs across domains and tasks
  * study highlighting the importance of pretraining on human-curated datasets
    * a simple data selection strategy to aut approach this performance

# 2 Background: Pretraining

# 3 Domain-Adaptive Pretraining 2

## 3.1 Analyzing Domain Similarity

* similarity of the target domain to RoBertA’s pretraining domain
* We consider domain vocabularies containing the top 10K most frequent unigrams
  (excluding stopwords) in comparably sized
* Figure 2 shows the vocabulary overlap across these samples
  * RoBertA’s pretraining domain has
    strong vocabulary overlap with NEWS and REVIEWS, while
    CS and BIO MED are far more dissimilar to the other domains
  * suggests the degree of benefit to be expected by adaptation
    * the more dissimilar the domain, the higher the potential for DAPT

## 3.2 Experiments

* We train RoBertA on each domain for 12.5K steps
  = a single pass on each domain dataset, on a v3-8 TPU; other details in App B
* This phase results in four domain-adapted LMs, one for each domain
* MLM loss of RoBertA on each domain before and after DAPT in Table 1
  * decreases in all domains
    except NEWS after DAPT, where we observe a marginal increase
* We discuss cross-domain masked LM loss in Appendix §E

## 3.3 Domain Relevance for DAPT

* we compare DAPT against a setting where for each task, we adapt the LM to a
  domain outside the domain of interest
  * controls for the case in which the improvements over RoBertA might be
    attributed simply to exposure to more data, regardless of the domain. In
  * We use the vocabulary overlap statistics in Figure 2 to guide the choice
  * for NEWS, we use a CS LM; for REVIEWS, a BIO MED LM; for CS, a NEWS LM;
    for BIO MED, a REVIEWS LM
* Our results are shown in Table 3, where the last column (¬ DAPT ) corresponds
  * For each task, DAPT significantly outperforms adapting to an irrelevant
  * generally observe that ¬ DAPT results in worse performance than RoBertA
  * two tasks (S CI ERC and ACL-ARC) in which ¬ DAPT marginally improves
    * in some cases, continued pretraining on any additional data is useful
      (Baevski+ 2019)

## 3.4 Domain Overlap

* boundaries between domains are in some sense fuzzy
* we also qualitatively identify documents that overlap cross-domain
* pretraining beyond conventional domain boundaries could result in more
  effective DAPT; we leave this investigation to future work

# 4 Task-Adaptive Pretraining 5

* Datasets curated to capture specific tasks of interest
  tend to cover only a subset of the text available within the broader domain
  * eg the CHEM PROT dataset for extracting relations between chemicals and pro
    focuses on abstracts of recently-published, high-impact articles from
    hand-selected PubMed categories (Krallinger+ 2017, 2015)
  * trade-off between domain-adaptive pretraining and task-adaptive approach
  * smaller pretraining corpus, but one that is much more task-relevant
    (assumed that the training set represents aspects of the task well)
    => TAPT much less expensive to run than DAPT, and as we show
  * performance of TAPT is often competitive with that of DAPT

## 4.1 Experiments

* second phase of pretraining RoBertA, but only on the task training data
  * 100 epochs
  * masking different words (masking probability of 0.15) across epochs
    * We artificially augment each dataset by this
* results are shown in the TAPT column of Table 5
* TAPT consistently improves the RoBertA baseline for all tasks across doms
  * Even on the news domain, which was part of RoBertA pretraining corpus,
  * differences between TAPT and DAPT
    * DAPT is more resource intensive (see Table 9 in §5.3), but
      TAPT manages to match its performance in some of the tasks, eg SCI ERC
    * In RCT, HYPER PARTISAN, AGN EWS, HELPFULNESS, and IMDB, the results
      even exceed those of DAPT, highlighting the efficacy

### Combined DAPT and TAPT

* begin with RoBertA and apply DAPT then TAPT under this setting
  * the most computationally expensive of all our settings (see Table 9)
  * the best performance on all tasks (Table 5)
* we speculate that TAPT followed by DAPT would be susceptible to
  catastrophic forgetting of the task-relevant corpus (Yogatama+ 2019)
  * D Yogatama, C de Masson d’Autume, J Connor, T Kociský, M Chrzanowski,
      L peng Kong, A Lazaridou, W Ling, L Yu, C Dyer, P Blunsom
    2019
    Learning and evaluating general linguistic intelligence
  * alternate methods of combining the procedures
    may result in better downstream performance
  * Future work may explore pretraining with
    a more sophisticated curriculum of domain and task distributions

### Cross-Task Transfer We complete the comparison between DAPT and TAPT by

* whether adapting to one task transfers to other tasks in the same domain. For
* in Table 6, we see that TAPT optimizes for single task performance, to the
  detriment of cross-task transfer. These results
  * demonstrate that data distributions of tasks within a given domain might
    differ
  * could also explain why adapting only to a broad domain is not sufficient,

# 5 Augmenting Training Data for Task-Adaptive Pretraining 6

* In §4, we continued pretraining the LM for task adaptation using only the
  training data for a supervised task. Inspired by the success of TAPT, we
  next investigate another setting where a larger pool of unlabeled data from
  the task distribution exists, typically curated by humans.

## 5.1 Human Curated-TAPT

* for three tasks (RCT, HYPER PARTISAN, and IMDB) we use this larger pool of
  unlabeled data from an available human-curated corpus

### Results We compare Curated-TAPT to TAPT and DAPT + TAPT in Table 7.

* Curated-TAPT further improves our prior results from §4 across all three
  datasets
* Applying Curated-TAPT after adapting to the domain results in the largest
  boost in performance on all tasks
  * in HYPER PARTISAN, DAPT + Curated-TAPT is within standard deviation of
    Curated-TAPT
* curated-TAPT achieves 95% of the performance of DAPT + TAPT with the fully
  labeled RCT corpus (Table 5) with only 0.3% of the labeled data
* We recommend that task designers release a large pool of unlabeled task data
  for their tasks to aid model adaptation through pretraining.
  * doesn't that go against generalization?

## 5.2 Automated Data Selection for TAPT

* retrieving related unlabeled data for TAPT, from a large unlabeled in-domain
  corpus, for tasks where extra human-curated data is unavailable
* scenario without
  * large amounts of unlabeled data to adequate TAPT, as well as absence of
    computational resources necessary for DAPT
    (see Table 9 for details of computational requirements for different
    pretraining phases)
* We propose simple unsuper-vised methods to retrieve unlabeled text that
  aligns with the task distribution, from a large in-domain corpus. Our
  * by embedding text from both the task and domain in a shared space, then
    selects candidates from the domain based on queries using the task data.
  * the embedding method must be lightweight enough to embed possibly millions
    of sentences in a reasonable time.
* we employ VAMPIRE (Gururangan+ 2019; Figure 3),
  a lightweight bag-of-words language model
  * We pretrain VAMPIRE on a large deduplicated sample of the domain (1M sents)
  * We then select k candidates of each task sentence from the domain sample,
    * via nearest neighbors selection (k NN TAPT ) 4, or
      * flat search index with cosine similarity between embeddings with the
        FAISS (Johnson+ 2019) library.
    * randomly (RAND TAPT )
* We continue pretraining RoBertA on this augmented corpus with
  both the task data (as in TAPT ) as well as the selected candidate pool.

### Results in Table 8 show that k NN TAPT outperforms TAPT for all cases

* RAND TAPT is generally worse than k NN TAPT,
  but within a standard deviation arising from 5 seeds for RCT and ACLARC
* As we increase k, k NN TAPT performance steadily increases, and approaches
  that of DAPT
  * Appendix F shows examples of nearest neighbors of task data
* Future work might consider a closer study of k NN TAPT,
  more sophisticated data selection methods, and the
  tradeoff between the diversity and task relevance of selected examples.

## 5.3 Computational Requirements

* Table 9
* TAPT is nearly 60 times faster to train than DAPT on a single v3-8 TPU and
* storage requirements for DAPT on this task are 5.8M times that of TAPT .
* Our best setting of DAPT + TAPT amounts to three phases of pretraining, and
  * nL, once the LM has been adapted to a broad domain, it can be reused for
    multiple tasks within that domain, with only a single additional TAPT phase
* CuratedTAPT tends to achieve the best cost-benefit ratio in this comparison,
  hE, one must also take into account the cost of curating large in-domain data.
* k NN TAPT is much cheaper than DAPT

# 6 Related Work 8

# 7 Conclusion 9

* variations for adapting pretrained LMs to domains and tasks within those doms
* summarized in Table 10. Our experiments reveal that
* even a model of 100Ms of parameters struggles to encode the complexity of a
  single textual domain, let alone all of language
* pretraining the model towards a specific task or small corpus can provide
  significant benefits
* we suggest to identify and use domainand task-relevant corpora to specialize
  models. While our results demonstrate how these approaches can improve RO
* future directions, such as
  * better data selection for TAPT,
  * efficient adaptation large pretrained language models to distant domains,
  * reusable language models after adaptation

# Analysis of Cross-Domain Masked LM Loss

In Section §3.2, we provide RoBertA’s masked LM loss before and after DAPT . We
* cross-domain masked-LM loss in Table 12, where we evaluate masked LM loss on
  text samples in other domains after performing DAPT .
* mostly follows our intuition and insights from the paper, i.e.
  RoBertA’s pretraining corpus and NEWS are closer, and BIO MED to CS (relative
  to other domains). However, our analysis in §3.1 illustrates that
* REVIEWS and NEWS also have some similarities. This is
  * supported with the loss of RoBertA that is adapted to NEWS , calculated on
    a sample of REVIEWS .
* hE, RoBertA that is adapted to REVIEWS results in the highest loss for a NEWS
  sample.  This is the case for all domains.  One of the properties that
  * REVIEWS' documents are significantly shorter
* In general, we find that cross-DAPT masked-LM loss can in some cases be a
  noisy predictor of domain similarity.
