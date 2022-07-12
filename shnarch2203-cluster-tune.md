Cluster & Tune: Boost Cold Start Performance in Text Classification
Eyal Shnarch, A Gera, A Halfon, L Dankin, L Choshen, R Aharonov, N Slonim
ACL 2022 arXiv:2203.10581 [cs.CL]

# Abstract

* in text classification the common practice of fine-tuning pre-trained models,
* We suggest a method to boost the performance of such models by adding an
  intermediate unsupervised classif task, between pre-training and fine-tuning
* intermediate task is clustering, and train the pre-trained model on
  predicting the cluster labels
* experiments on various data sets
* classification phase can significantly improve performance,
  mainly for topical classification tasks, when the number of labeled instances
  available for fine-tuning is only a couple of dozen to a few hundred

# 1 Intro

* labeled data is scarce. In many real-world scenarios,
  obtaining even a couple of 100s of labeled examples per class is challenging
  * Commonly, a target class has a relatively low prior in the examined data,
    making it a formidable [rettentő] goal to collect enough positive examples
    (Japkowicz and Stephen, 2002)
  * cannot be labeled via crowd-annotation platforms due to its
    confidentiality (data privacy reasons or for protecting intellec property)
    or since the labeling task requires special expertise
  * number of categories to be considered is relatively large, eg, 50, thus
    * even a modest demand of 200 labeled examples per class = 10K
    * for an extreme example, cf. Partalas+ (2015)
* gradual approaches composed of various phases
  * One possibility is to further pretrain the model with the self-supervised
    MLM task over unlabeled data from the target task domain (Whang+ 2019)
  * the method requires the existence of an unlabeled corpus,
    in the order of several thousand examples
  * supervised intermediate task which is different in nature from the
    target-task, and for which labeled data is more readily available
    (Pruksachatkun+ 2020; Wang+ 2019a; Phang+ 2018)
* we propose a strategy that exploits
  unsupervised text clustering as the intermediate task
  towards fine-tuning a pretrained model for text classification
  * inspired by the use of clustering to obtain labels in computer vision
    (Gidaris+ 2018; Kolesnikov+ 2019)
* we use an efficient clustering technique, that relies on
  simple Bag Of Words (BOW) representations, to partition the unlabeled
  * Next, we treat these clusters as labeled data for an intermed text classif,
    and train the pre-trained model – with or without additional MLM pretrain –
    with respect to this multi-class problem, prior to the final fine-tuning
* Extensive experimental results on a variety of benchmark data
* We further analyze the results to gain insights as to why and when this works
  * it is most prominent when the training data available for the target task
    is relatively small and the classification task is of a topical nature
* future work
  * additional embedding space and/or more clustering techniques ; co-training
    (Blum and Mitchell, 1998) methods
  * tuning the number of clusters
  * using the labeled data available for fine-tuning as anchors for the
    intermediate clustering step
  * binary inter-training task, where BERT is trained to determine whether two
    samples are drawn from the same cluster or not
  * additional downstream target tasks,
    that are similar in spirit to standard text classification, eg
    * Key-Point Analysis (Bar-Haim+ ACL 20) & Textual Entailment (Dagan+ 13)
      Roy Bar-Haim, L Eden, Roni Friedman, Yoav Kantor, Dan Lahav, N Slonim
      From arguments to key points: Towards automatic argument summarization

# 2 Intermediate Training using Unsupervised Clustering

# 3 Experiments

# 4 Results

# 5 Analysis

## 5.1 Additional Clustering Techniques

## 5.2 Comparison to BOW-based methods

## 5.3 Effect on Sentence Embeddings

* quantitatively assess whether examples of the same class are more closely
  represented after inter-training. Formally, given a set of instances’
  * compute for each class l ∈ L a centroid c l which is the average embedding
  * We then compute the average Euclidean Embeddings’ Distance (ED) from the
    corresponding centroids: ED(l, e) = E ni=0 ke i − c i k 2
  * Macro average results were similar, we hence report only micro average res
    * Results with Cosine similarity were also similar, hence omitted
* sanity check:
  * significance test to the ED statistic, confirming that representations of
    same-class examples are close to each other
  * permutation test (Fisher, 1971), with 1000 repetitions, comparing the class
    labels to random labels. We find that EDs for both BERT and BERT IT:CLUST
    are significantly different from random (p < 0.001)
  * ie both before and after inter-training, same-class reprs are close
* compare the representations before and after inter-training
  * randomly permuted EDs of BERT IT:CLUST are about 3 times larger than
    BERT’s, despite similar norm values
  * ie the post inter-training representations are more dispersed. Hence, to
    properly compare, we normalize ED by the average of the permuted EDs
* Comparing the Normalized Embeddings’ Distance (NED) before and after
  inter-training, we find that
  in all datasets the normalized distance is smaller after inter-training
  * ie BERT IT:CLUST brings same-class representations closer
    in comparison to BERT

## 5.4 Are Clusters Indicative of Target Labels?

* Figure 4
  * Normalized Mutual Information (NMI) between sIB labels and the target task
    labels, calculated over the entire training set, versus
  * the gain of using BERT IT:CLUST,
    reflected as the reduction in classif error rate between BERT 
    BERT IT:CLUST, at the extreme case of 64 fine-tuning samples
  * Evidently, in datasets where the NMI is around zero, BERT IT:CLUST does
    not confer a clear benefit; conversely,
    where the NMI is relatively high, the performance gains are also pronounced
    * Notably, the three datasets with the lowest NMI are those for which
      inter-training was not beneficial, as discussed in Section 4
* Since the partition obtained via clustering is often informative for the
  target class labels, we examine whether it can be utilized directly, as
  opposed to as pseudo-labels for BERT inter-training
  * a simple heuristic: Given a labeling budget x, we divide it across
    clusters, relative to their size, while ensuring that at least one instance
    within each of the 50 clusters is labeled
  * reveal the labels of a random sample of examples in that cluster, and
    identify each cluster with its most dominant label
  * Next, given a new test example, we assign it with the label associated
    with its nearest cluster
  * Results (see App. B) showed that this rudimentary classifier is generally
    not on par with BERT IT:CLUST, yet it can be
  * surpris effective where the NMI is high and the labeling budget is small

# 6 Related Work

* transfer a pretrained model to a new domain with little data (across domains)
  * pivoting (Ziser and Reichart, 2018)
  * weak supervision (Shnarch+ 2018)
  * data augmentation (Anaby-Tavor+ 2020)
  * adversarial transfer (Cao+ 2018)
* clustering and transfer learning/data augmentation
  * In Computer Vision, pretrained models are often learnt by image clustering
    (Caron+ 2018)
  * In NLP hE clustering was mainly used for non-transfer scenarios
  * Ball (2019)
    * pretrained embeddings to cluster labeled and unlabeled data
    * Then, they fill the missing labels to augment the training data
  * Clustering itself was improved by combining small amounts of data
    (Torres and Vaca, 2019; Wang+ 2016)
* Pretrained models improved SOTA in many downstream tasks
  (Nogueira and Cho, 2019; Ein-Dor+ 2020)
  * low resource and limited labeled data settings
    (Lacroix+ 2019; Wang+ 2020a; Chau+ 2020)
  * larger models (Raffel+ 2019)
  * changes in the pretraining tasks and architecture (Yang+ 2019)
  * augmenting pretraining (Geva+ 2020)
  * improving the transfer itself (Valipour+ 19; Wang+ 19b; Sun+ 19; Xu+ 20)
* Two findings on pretraining support our hypothesis on the intermediate task,
  namely that classification surpasses MLM
  * Some pretraining tasks are better than others (Lan+ 2020; Raffel+ 2019) and
  * supervised classification as additional pre-training improves performance
    (Lv+ 2020; Wang+ 2019a; Pruksachatkun+ 2020)
  * All these works aim to improve the performance upon transfer, making it
    more suitable for any new domain
    * In contrast, we focus on improvement given the domain
* domain-specific information eg
  * metadata (Melamud+ 2019)
  * training on weakly-supervised data (Raisi and Huang, 2018; Meng+ 2020) or
  * multitasking on related tasks concurrently (Liu+ 2019a)
* further pretraining on unlabeled data from the domain
  (Whang+ 19; Xu+ 19; Sung+ 19; Rietzler+ 20; Lee+ 20; Gururangan+ 20)
  * hE sometimes unhelpful or even hurts results (Pan, 2019)
* few-shot learning
  * Transferring a model and retraining with paucity of labels
  * used for many language-related tasks such as
    * named entity recognition (Wang+ 2020b)
    * relation classification (Hui+ 2020)
    * parsing (Schuster+ 2019)
* other than fine-tuning the model
  * vision
    * Koch (2015): ranking examples’ similarity with Siamese networks
    * Vinyals+ (2016): memory and attention to find neighboring examples
    * Snell+ (2017) search for prototypes to compare to
    * Ravi and Larochelle (2017)
      * don’t define in advance how to compare the examples
      * Instead, they meta-learn how to train the few shot learner
  * adapted on language domains (Geng+ 2019; Yu+ 2018)
* In conclusion, separate successful practices foreshadow our findings:
  * Clustering drives pretraining on images
  * supervised classification aids pre-training
  * training on unlabeled domain examples is helpful with MLM
