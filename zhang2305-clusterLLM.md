ClusterLLM: Large Language Models as a Guide for Text Clustering
Yuwei Zhang, Zihan Wang, Jingbo Shang
EMNLP 2023 (main) arXiv:2305.14871 [cs.CL]

https://github.com/zhang-yu-wei/ClusterLLM

# Abstract

* We introduce ClusterLLM, a novel text clustering framework that leverages
feedback from an instruction-tuned large language model, such as ChatGPT
  * traditional unsupervised methods build upon "small" embedders,
  * ClusterLLM exhibits two intriguing advantages: (1) it
    * enjoys the emergent capability of LLM even if its embeddings are
      inaccessible; and (2) it
    * understands the user's preference on clustering through
      textual instruction and/or a few annotated data
* we prompt ChatGPT for insights on clustering perspective by constructing
  * hard triplet questions `<does A better correspond to B than C>`, where
  * A, B and C are similar data points that belong to different clusters
    according to small embedder. We empirically show that this strategy is both
  * chooses the sentence that is most similar with anchor
    combining with a perspective instruction from users
    * The predicted triplets are used for fine-tuning small embedders
  * effective for fine-tuning small embedder and
  * cost-efficient to query ChatGPT.  Second,
* we prompt ChatGPT for helps on clustering granularity by carefully designed
  pairwise questions `<do A and B belong to the same category>`, and
  * tune the granularity from cluster hierarchies that is the most consistent
    with the ChatGPT answers
* experiments on 14 datasets show that
  ClusterLLM consistently improves clustering quality, at an
  * ClusterLLM can propose reasonable cluster granularity at a negligib cost
  * average cost of ~$0.6 per dataset. The code will be available
  * hE still relies on the embedding model itself, which is inefficient and
    inapplicable on black-box embedding models. We encourage
* future: model-free training such as constrained clustering

# 1 Intro

* applications, such as
  * identifying public perception from social media (Park + 2022)
  * analysing cause of accidents (Xu+ 2022)
  * detecting emerging research topics (Martínez+ 2022)
    * José M Guaita Martínez, P Carracedo, D lores Gorgues Comas, C H Siemens. 2022
      An analysis of the blockchain and covid-19 research landscape using
         a bibliometric study
       Sustainable Technology and Entrepreneurship, 1(1):100006
* clustering algorithms (MacQueen, 1967; Zhang+ 2021a)
  on top of pre-trained embedders (Muennighoff+ 2022; Wang+ 2022; Su+ 2022)
  * Niklas Muennighoff, Nouamane Tazi, Loïc Magne, and Nils Reimers. 2022
    MTEB: Massive text embedding benchmark. arXiv preprint arXiv:2210.07316
  * Liang Wang, Nan Yang, Xiaolong Huang, Binxing Jiao, Linjun Yang, Daxin
    Jiang, Rangan Majumder, and Furu Wei. 2022
    Text embeddings by weakly-supervised contrastive pre-training
    arXiv preprint arXiv:2212.03533
  * Hongjin Su, Weijia Shi, Jungo Kasai, Yizhong Wang, Yushi Hu,
      Mari Ostendorf, Wen-tau Yih, Noah A.  Smith, Luke Zettlemoyer, and Tao Yu
    One embedder, any task: Instruction-finetuned text embeddings
    https://arxiv.org/abs/2212.09741
  * higher performance with better pre-training quality.  State-of-the-art
* large language models (LLMs) 
  * recent GPT series (Brown+ 2020; Ouyang+ 2022; OpenAI, 2023) have
  * extraordinary language capabilities for various NLP applications however,
  * hE can only be utilized through the APIs
  * no accessible embedding vectors for clustering. Hence, LLMs 
  * ie cannot be directly applied on text clustering tasks
* Can we leverage API-based LLMs to guide text clustering efficiently? We
  * pairwise relationships
  * inspiration from an observation that humans represent an instance through
    comparing with others (Nosofsky, 2011). For instance, people often classify
    a new piece of music into a specific genre by relating to familiar ones
  * pairwise relationships have been utilized in spectral clustering (Donath
    and Hoffman, 1972; Cheeger, 1970) before. Nonetheless,
  * hE naively traversing all the pairs within dataset is obviously intractable
    * too expensive for querying LLMs
* We propose ClusterLLM, a framework that utilizes LLM to guide a small
  embedder for finding text clusters with a low cost, as shown in Figure 1
  * two stages that are specially designed for two aspects of clustering:
    * perspective, ie, the grouping criterion such as topic, intent and emotion
    * granularity, ie the scope of clusters
* In Stage 1, we prompt LLMs with a triplet task that predicts
  which one of the two candidate choices is closer to anchor instance
  to understand the user-preferred perspectives
  * advantages
    * it is irrelevant with [orthogonal to?] cluster granularity and (b)
    * the produced triplets can finetune small embedder towards the right
      perspective
  * for sample efficiency, we further propose entropy-based triplet sampling to
    find the most informative triplets. Specifically,
    * we first calculate entropy for each instance based on cluster assignment
      probabilities, and then identify those with highest entropy
    * Two candidate choices are then sampled from its nearest clusters to
      guarantee they are close enough to the anchor
* In Stage 2, we
  * first obtain the cluster hierarchy that starts from instance-level clusters
    and iteratively merge the entire dataset . And
  * then we prompt LLMs to determine cluster granularity
    with a few annotated data pairs as demonstrations
    * pairs constructed by sampling from two clusters that are merged at each
      step of hierarchical clustering, so that they cover a wide range of
      granularities
  * the final decision is made by measuring consistency between each level of
    clustering and predictions
* evaluate ClusterLLM on 14 datasets that include diverse/span a wide range of
  * tasks such as
    * intent discovery: Bank77, CLINC(I), MTOP(I), Massive(I)
    * topic mining: StackEx, ArxivS2S, Reddit
    * type discovery: FewRel, FewNerd, FewEvent,
    * domain discovery: CLINC(D), MTOP(D), Massive(D)
    * emotion detection: GoEmo
  * granularities that have 10 to 150 number of clusters. We show that
  * ClusterLLM is effective overall on improving clustering quality, where the
    * clustering performance is improved
      over both a deep clustering baseline and a self-supervise baseline
  * ablation study shows that our sampling strategy is effective
    compared to a random sampling baseline
  * outperforms clustering-error based methods
    on determining cluster granularity
* contributions are three-fold:
  * a framework ClusterLLM that
    utilizes sentence relations predicted from API-based LLMs to guide cluster
    * allows users to provide textual instructions
    and/or fewshot annotations to specify preferences on clustering
  * to reduce API-queries: entropy-based sampling strategy
    to find the most informative triplets. Additionally, we utilize pairwise
    data sampled from hierarchical clustering to determine cluster granularity
  * Extensive experiments show that our proposed method can improve clust perf
    at ∼$0.2 for perspective and ∼$0.4 for granularity with GPT-3.5

# 2 Preliminary

* Cluster-LLM integrates additional
  * textual instruction (eg  “Select the example that better corresponds with
    the Query in terms of entity type.”) [to?] understand perspective and
  * few-shot annotations (eg “Sentence1 and Sentence2 have the same entity
    type...”) to determine cluster granularity

# 3 Our ClusterLLM 

* based on a pre-trained small embedder (Wang+ 2022; Su+ 2022) (denoted as f )
  which usually represents sentences individually. In contrast, inspired by
* ClusterLLM considers a pair or a triplet of sentences through prompting LLMs
  that are trained to follow human instructions (Ouyang+ 2022; OpenAI, 2023).
* a two-stage framework (See Figure 2). In 

## 3.1 Stage 1 

* triplet task to improve clustering quality with respect to user-specified
  perspectives, along with a sampling strategy that reduces number of API quers

## 3.2 Stage 2 that leverages pairwise task to determine cluster granularity
based on predictions from LLMs.

### 3.2.1 Determine Granularity with Pairwise Hierarchical Sampling

* Finally, for largescale datasets, we address the high time complexity of
  hierarchical clustering by applying it on top of mini-batch K-means. See
  details in Appendix A.

# 4 Experiments 5

## 4.4 Main Results

* main results with small-scale datasets in Table 2
* variants of our method:
  * ClusterLLM-I(E) adopt Instructor or E5 as embedders
  * ClusterLLM-I(E)-iter applies the entire framework twice in an iterative
    manner by using 
    * previous fine-tuned model as initialization and 
    * the 1, 024 triplets inferred from new embeddings for fine-tuning
* All of these use GPT-3.5 for prediction
* observations:
  * ClusterLLM consistently improves upon both embedders. For example,
    * ClusterLLM-I increases the performance by 6.71% on FewRel
    * ClusterLLM-E increases the performance by 9.19 on Bank77. However, we do
    * hE on Massive(D) and CLINC(D), there are no improvements
  * ClusterLLM outperforms deep clustering and self-supervise baselines. For
    * ClusterLLM-I surpasses self-supervise-I on most datasets except for two
      and it is also better than SCCL-I on 11 over 14 datasets.  Furthermore,
    * improvements are consistent across both reported metrics
  * Combined with the results in Appendix F, applying ClusterLLM iteratively is
    beneficial, emphasizing the potential of further improvements

## 4.5 Analysis on Triplet Prediction Accuracy

* We attribute the improvements on clustering to triplet predictions. In
* Table 3 shows the accuracy on predicted triplets that have ground truth
  (exactly one positive and one negative choices based on ground truth) with
  two different sampling methods
  * Random triplet sampling uniformly samples
    three random instances as query and two choices, and we guarantee 
    * the two choices are different from the anchor <~ filtering
* a selection accuracy with Euclidean distances between embeddings as a
  comparison. We observe that,
  * GPT-3.5/4 consistently improves upon Instructor on high entropy examples,
    demonstrating our hypothesis. In contrast,
  * with random sampling, the ground truth triplets is significantly fewer and
    the accuracy gap is much smaller or even decreases performance

## 4.6 Ablation Study

### Clustering Quality

* We show ablation studies on ClusterLLM based on Instructor in Table 4
  * results with 
    * 3 kinds of predictions on the same set of triplets for finetuning:
      GPT-3.5/4, replace triplet predictions of GPT-3.5 to ground truth on
      those triplets that have ground truth
    * GPT-4 marginally improves upon GPT-3.5 given the much higher cost. When
    * human labels, 
    * ClusterLLM-GT&GPT3.5 achieves the highest performance, which indicates
      * possibility for further improvement with more accurate predictions
* similar observations for large-scale datasets in Table 6

### Sampling Strategy (entropy-based sampling) In

Figure 3: clustering accuracy increases when increasing entropies (or equally
decreasing mean of interval) except for GoEmo. We make two hypothesis:
* explanations
  * LLMs are much better than small embedders on harder instances
  * high-entropy instances are generally more informative. In
* Table 4: training with randomly selected triplets even decreases performance,

## 4.7 Determining Cluster Granularity

* We evaluate on a subset of 8 datasets including various cluster granularities
  with kmax = 200 and kmin = 2. We compare with different methods that rely on
  clustering errors. For our methods, we show results with λ = {1, 3} (except
  for GPT-4 to reduce costs), which involve 198 & 594 pairs in total
  respectively. To simulate experts for providing demonstrations, we directly
  sample 16 pairs from small-scale datasets when λ = 3 and then choose 2
  positive and 2 negative as demonstrations. Notice that we use the same
  demonstrations for large-scale experiments. See more details in Appendix B
* observations from Table 5 and Table 7:
  * Our methods have higher ranks. Most baseline methods predict similar number
    of clusters for domain and intent, while our methods can effectively
    distinguish between the two. For instance, on MTOP(I)/(D) in Table 5, BIC
    predicts number of clusters 69/64 while our method (GPT-3.5, λ = 3)
    predicts 92/18
  * Increasing λ generally helps (MTOP(D) in Table 5) but might not always make
    a large difference
  * GPT-4 significantly improves upon GPT-3.5, probably due to its better
    understanding of demonstrations

# 5 Related Works

## Clustering, a fundamental task in machine learning

* data types, including
  * texts (Xu+ 2015; Hadifar+ 2019; Zhang+ 2021a),
    * Jiaming Xu, P Wang, G Tian, B Xu, J Zhao, F Wang, H Hao. 2015
      Short text clustering via convolutional neural networks
      Workshop on Vector Space Modeling for NLP pages 62–69, Denver, ACL
    * Amir Hadifar, Lucas Sterckx, Thomas Demeester, and Chris Develder. 2019
      A self-training approach for short text clustering
      RepL4NLP-2019, pages 194–199, Florence, Italy
    * Dejiao Zhang, Feng Nan, Xiaokai Wei, Shang-Wen Li, Henghui Zhu,
        Kathleen McKeown, Ramesh Nallapati, Andrew O. Arnold, and Bing Xiang
      Supporting clustering with contrastive learning
      NAACL 2021a Conference of the North American, pages 5419–5430, Online
  * images (Yaling Tao, 2021; Yang+ 2016; Caron+ 2018; Niu+ 2020; Xie+ 2016)
  * graphs (Huang+ 2014; Chiang+ 2019)
* deep clustering (Zhou+ 2022) leverages deep neural networks
  * Zhou+ (2022) has categorized deep clustering research into four types
    * multi-stage (Yaling Tao, 2021; Huang+ 2014),
    * iterative (Yang+ 2016; Caron+ 2018; Van Gansbeke+ 2020; Niu+ 2022;
      Chang+ 2017; Niu+ 2020),
    * generative (Dilokthanakul+ 2016) and
    * simultaneous (Xie+ 2016; Zhang+ 2021a; Hadifar+ 2019)
    * depended on how representation learning and clustering modules interact
* concurrent work (Wang+ 2023) studies a similar problem by
  * assigning instances to different explanations proposed by LLMs
  * IDAS (Raedt+ 2023) directly encode the concatenation of sentence and
    abstractive summarizations from LLMs for clustering

## Clustering with Relations has been explored

* spectral clustering (Donath and Hoffman, 1972; Cheeger, 1970) makes use of
  similarity matrix where each entry measures the similarity between a pair
* deep clustering utilizes relational supervision (Yang+ 2016; Niu+ 2020; Van
  Gansbeke+ 2020; Chang+ 2017) via pseudo-labelling which could be noisy
* constrained clustering
  * closely related to ours
  * pairwise mustlink or cannot-link constraints
    (Basu+ 2004; Wagstaff+ 2001; Basu+ 2008; Zhang+ 2020; Manduchi+ 2021)
  * constraints are often sampled from labels as a prior
    * significantly limits its application in our scenario
* we study how to utilize contemporary API-based LLMs to infer relations

## Pre-trained Embedding Model

* Reimers and Gurevych 2019; Gao+ 2021; Ni+ 2022a,b
* applied in text similarity, classification, clustering and info retrieval
* two embedding models E5 (Wang+ 2022) and Instructor (Su+ 2022)
  * superior performance on a popular benchmark MTEB (Muennighoff+ 2022)
  * E5 is pre-trained on web-scraped data pairs with contrastive objective
  * Instructor is pre-trained on 330 tasks with instructions
* ClusterLLM aims at improving these models with LLMs

# 6 Conclusion 9

# 7 Limitations

## Reliance on pre-trained embedder

* To find the most informative data, we have to rely on a pretrained embedder
  that can indicate the largest clustering assignment entropy. We hope that
* future: self-supervise triplets and LLM-predicted triplets can be combined to
  solve such an issue

## Computational cost for fine-tuning

* Our initial idea is to utilize
  constrained clustering which is a light-weight algorithm that do
  not need to update small embedders. However, the inevitable
  * hE unstable training will be heavily affected by the errors in LLM
* compr[om]ise by introducing embedder into fine-tuning

## Sub-optimal performance on domain discovery.  We notice that

* on domain discovery datasets such as Massive(D) and CLINC(D), the performance
  is usually sub-optimal compared with original Instructor embedding. We
  * discussions on this issue in Appendix H

# More Related Works

## Generalized Category Discovery (GCD)

* Vaze+ 2022; Lin+ 2020; Zhang+ 2021b, 2022; Mou+ 2022; An+ 2022
  * Vaze: the unlabelled images may come from labelled classes or from novel 1s
    * Semantic Shift Benchmark suite
      * [45] Sagar Vaze, Kai Han, Andrea Vedaldi, and Andrew Zisserman.
        Open-set recognition: A good closed-set classifier is all you need
        International Conference on Learning Representations, 2022
* partial known classes with annotations which can also be used to infer user’s
  requirement on clustering
* infant research area, most previous works employ pseudo-labelling, via
  * optimal transport (Rizve+ 2022b; Yang+ 2022)
  * similarity learning (Rizve+ 2022a; Cao+ 2022) or 
  * prototype-based learning (Sun and Li, 2022).
* new intent discovery (Zhang+ 2022, 2021b, 2023; An+ 2022; Lin+ 2020) is
  * a similar research problem in the domain of intent detection.
* Hogan+ 2023 adapts GCD into relation type discovery. However, 
* hE GCD relies on sufficient annotated and unlabeled data for training.  In
* ClusterLLM seeks for minimal supervision and studies a setting with
  controlled computation~ & data~ cost

## LLMs as Annotators. Recent instruction-tuned
LLMs, such as ChatGPT, have been shown to
have the ability to reproduce or improve human-
generated labels (Gilardi+ 2023; He+
2023; Zhu+ 2023). Furthermore, several works
dedicate to fine-tune models with feedbacks from
LLMs (Cheng+ 2023; Bai+ 2022). This
paper instead focuses on clustering tasks.

# H Sub-optimal Performance on Domain Discovery

* the performance of domain discovery (MTOP(D), Massive(D) and CLINC(D)) is
  barely improved or even decreased with C LUS TER LLM from original
  embedders (see Table 2)
* ablation studies reveal that even with ClusterLLM-GT&GPT3.5, clustering
  performance is not as good as self-supervise or C LUS TER LLM-random (see
  CLINC(D) in Table 4 and MTOP(D) in Table 6). We also observe that,
* C LUS TER LLM-I-iter will further decrease the performance (see Massive(D)
  in Table 2). While
* we do not have rigorous explanations, one hypothesize is that
  * the embedding space after fine-tuning may be more compact than before and
    forming small cliques, making it better for clustering finegrained
    clusters but not for coarse-grained clusters. We showcase
* scatterplots on two datasets with both Instructor and ClusterLLM-I-iter. It
  * the clusters in embedding space are tighter and more separated
    especially on CLINC(D)
