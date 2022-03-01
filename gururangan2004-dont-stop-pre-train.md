Don't Stop Pretraining: Adapt Language Models to Domains and Tasks
S Gururangan, A Marasović, S Swayamdipta, K Lo, I Beltagy, D Downey, NA Smith
ACL 2020 arXiv:2004.10964 [cs.CL]

Our code as well as pretrained models for multiple domains and tasks are public

* Language models pretrained on text from a wide variety of sources
* we investigate whether it is still helpful to tailor a pretrained model to
  the domain of a target task. We present a study across
  * four domains (biomedical and computer science publications, news, and
    reviews) and
  * eight classification tasks (two in each domain)
  * high~ and low-resource settings
    * low: ≤ 5K labeled training examples, and no additional unlabeled data
  * a second phase of pretraining in-domain (domain-adaptive pretraining) leads
    to performance gains,
  * adapting to the task's unlabeled data (task-adaptive pretraining) improves
    performance even after domain-adaptive pretraining. Finally, we show that
* adapting to a task corpus augmented using simple data selection strategies is
  an effective alternative
  * especially when resources for domain-adaptive pretraining are unavailable

# 1 Intro

* Do the latest large pretrained models work universally or
  is it still helpful to build separate pretrained models for specific domains?
* benefit of continued pretraining on domain-specific unlabeled data (Lee+ 19)
  * only consider a single domain at a time and use a
  * language model pretrained on a smaller and less diverse corpus than the
    most recent language models
  * not known how the benefit of continued pretraining may vary with factors
    like the amount of available labeled task data, or the proximity of the
    target domain to the original pretraining corpus (see Figure 1)
* We address this question for RoBertA (Liu+ 2019) (§2)
  * domain-adaptive pretraining (DAPT) consistently improves performance on
  * def domain
    * Above, we consider domains defined around genres and forums, but
      it is also possible to induce a domain from a given corpus used for a
      task, such as the one used in supervised training of a model
* ie whether pretraining on a corpus more directly tied to the task can improve
  * task-adaptive pretraining (TAPT) on a smaller but directly task-relevant
  * domain-adaptive pretraining, compared to
  * the unlabeled task dataset (§4), drawn from the task distribution
  * has been shown effective (Howard and Ruder, 2018), but is
    not typically used with the most recent models. We find that TAPT provides
  * large performance boost for RoBertA , with or without domain-adaptive
* the benefits from task-adaptive pretraining increase with additional
  unlabeled data from the task distribution that has been manually curated by
  task designers or annotators
* we propose ways to automatically select additional task-relevant unlabeled
  text, and show how this improves performance in certain low-resource cases
  (§5)
* On all tasks, our results using adaptive pretraining techniques are
  competitive with the SOTA
* contributions include:
  * a thorough analysis of domain~ and taskadaptive pretraining
    across four domains and eight tasks, spanning lowand high-resource
  * an investigation into the transferability of adapted LMs across domains and
    tasks; and
  * a study highlighting the importance of pretraining on human-curated
    datasets
    * a simple data selection strategy to aut approach this performance

# 2 Background: Pretraining

# 3 Domain-Adaptive Pretraining 2

## 3.1 Analyzing Domain Similarity

* similarity of the target domain to RoBertA ’s pretraining domain
* We consider domain vocabularies containing the top 10K most frequent unigrams
  (excluding stopwords) in comparably sized
* Figure 2 shows the vocabulary overlap across these samples
  * RoBertA ’s pretraining domain has
    strong vocabulary overlap with NEWS and REVIEWS , while
    CS and BIO MED are far more dissimilar to the other domains. This simple
  * suggests the degree of benefit to be expected by adaptation
    * the more dissimilar the domain, the higher the potential for DAPT

## 3.2 Experiments

* We train RoBertA on each domain for 12.5K steps
  = a single pass on each domain dataset, on a v3-8 TPU; other details in App B
* This phase results in four domain-adapted LMs, one for each domain. We
* MLM loss of RoBertA on each domain before and after DAPT in Table 1. We
  * decreases in all domains
    except NEWS after DAPT , where we observe a marginal increase
* We discuss cross-domain masked LM loss in Appendix §E

## 3.3 Domain Relevance for DAPT

* we compare DAPT against a setting where for each task, we adapt the LM to a
  domain outside the domain of interest
  * controls for the case in which the improvements over RoBertA might be
    attributed simply to exposure to more data, regardless of the domain. In
  * We use the vocabulary overlap statistics in Figure 2 to guide the choice
  * for NEWS , we use a CS LM; for REVIEWS , a BIO MED LM; for CS, a NEWS LM;
    for BIO MED , a REVIEWS LM
* Our results are shown in Table 3, where the last column (¬ DAPT ) corresponds
  * For each task, DAPT significantly outperforms adapting to an irrelevant
  * generally observe that ¬ DAPT results in worse performance than RoBertA on
  * two tasks (S CI ERC and ACL-ARC) in which ¬ DAPT marginally improves
    * in some cases, continued pretraining on any additional data is useful, as
      noted in Baevski+ (2019)

## 3.4 Domain Overlap

* boundaries between domains are in some sense fuzzy; for example, 40% of
* we also qualitatively identify documents that overlap cross-domain: in Table
* pretraining beyond conventional domain boundaries could result in more
  effective DAPT ; we leave this investigation to future work

# 4 Task-Adaptive Pretraining 5

* Datasets curated to capture specific tasks of interest
  tend to cover only a subset of the text available within the broader domain
  * eg the CHEM PROT dataset for extracting relations between chemicals and pro
    focuses on abstracts of recently-published, high-impact articles from
    hand-selected PubMed categories (Krallinger+ 2017, 2015)
  * trade-off between domain-adaptive pretraining and task-adaptive approach
  * smaller pretraining corpus, but one that is much more task-relevant (under
    the assumption that the training set represents aspects of the task well)
    => TAPT much less expensive to run than DAPT , and as we show in our
  * performance of TAPT is often competitive with that of DAPT

## 4.1 Experiments

* second phase of pretraining RO BERT A, but only on the task training data. In
  * 100 epochs. We artificially augment each dataset by randomly
  * masking different words (masking probability of 0.15) across epochs. As in
* results are shown in the TAPT column of Table 5
* TAPT consistently improves the RO BERT A baseline for all tasks across doms
  * Even on the news domain, which was part of RO BERT Apretraining corpus,
  * differences between TAPT and DAPT
    * DAPT is more resource intensive (see Table 9 in §5.3), but
      TAPT manages to match its performance in some of the tasks, eg S CI ERC
    * In RCT, HYPER PARTISAN , AGN EWS , H ELPFULNESS , and IMDB, the results
      even exceed those of DAPT , highlighting the efficacy

### Combined DAPT and TAPT We investigate the effect of using both techniques

* begin with RO BERT Aand apply DAPT then TAPT under this setting. The three
  * the most computationally expensive of all our settings (see Table 9). As
  * the best performance on all tasks (Table 5). 2
* we speculate that TAPT followed by DAPT would be susceptible to catastrophic
  forgetting of the task-relevant corpus (Yogatama+ 2019),
  * D Yogatama, C de Masson d’Autume, J Connor, T Kociský, M Chrzanowski,
      L peng Kong, A Lazaridou, W Ling, L Yu, C Dyer, P Blunsom
    2019
    Learning and evaluating general linguistic intelligence
  * alternate methods of combining the procedures
    may result in better downstream performance
  * Future work may explore pretraining with a more sophisticated curriculum of
    domain and task distributions

### Cross-Task Transfer We complete the comparison between DAPT and TAPT by
exploring whether

# 5 Augmenting Training Data for Task-Adaptive Pretraining 6

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
  * better data selection for TAPT ,
  * efficient adaptation large pretrained language models to distant domains,
  * reusable language models after adaptation
