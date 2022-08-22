A Closer Look at How Fine-tuning Changes BERT
Yichu Zhou, Vivek Srikumar
ACL 2022 arXiv:2106.14282 [cs.CL]

code and data to replicate our analysis is available at
https://github.com/utahnlp/BERT-fine-tuning-analysis

# Abstract

* how fine-tuning changes the underlying embedding space is less studied
* we study the English BERT family with two probing techniques
* We hypothesize that fine-tuning affects classification performance by
  increasing the distances between examples associated with different labels
  * We confirm this hypothesis with carefully designed
    experiments on five different NLP tasks
  * an exception to the prevailing wisdom that "fine-tuning always improves"
* by comparing the representations before and after fine-tuning, we discover
  * fine-tuning does not introduce arbitrary changes to representations;
    instead, it adjusts the representations to downstream tasks
    while largely preserving the original spatial structure of the data points

# 1 Intro

* probes to investigate linguistic regularities captured
  (Kovaleva+ 2019; Conneau+ 2018; Jawahar+ 2019)
* two ways to use a pre-trained representation (Peters+ 2019):
  * as a fixed feature extractor (where the pre-trained weights are frozen), or
  * fine-tuning it for a task
* The probing literature has largely focused on the former
  * Kassner and Schütze, ACL 2020
    Negated and misprimed probes for pretrained LM: Birds can/not talk/fly
  * Perone+ 2018
    Christian S Perone, Roberto Silveira, and Thomas S Paula
    Evaluation of sentence embeddings in downstream and linguistic probing
  * Yaghoobzadeh+ ACL 2019
    Yadollah Yaghoobzadeh, Katharina Kann, TJ Hazen, Eneko Agirre, & H Schütze
    Probing for semantic classes: Diagnosing the meaning content of word embeds
  * Krasnowska-Kieraś and Wróblewska, ACL 2019
    Empirical linguistic study of sentence embeddings
  * Wallace+ EMNLP-IJCNLP 2019
    Eric Wallace, Yizhong Wang, Sujian Li, Sameer Singh, and Matt Gardner
    Do NLP models know numbers? Probing numeracy in embeddings
  * Pruksachatkun+ ACL 2020
    Yada Pruksachatkun, Jason Phang, Haokun Liu, Phu Mon Htut, Xiaoyi Zhang,
      Richard Yuanzhe Pang, Clara Vania, Katharina Kann, and Samuel R Bowman
    Intermed-task transfer learn with pretrained LMs: When & why does it work?
  * Aghajanyan+ ACL-IJCNLP 2021
    Armen Aghajanyan, Sonal Gupta, and Luke Zettlemoyer. 2021
    Intrinsic dimensionality explains the effectiveness of LM fine-tuning
* insights about fine-tuning
  * Merchant+ (2020); Mosbach+ (2020b); Hao+ (2020)
  * fine-tuning changes higher layers more than lower ones and
    linguistic information is not lost during fine-tuning
  * hE, less is understood about
    how the representation changes during the process of fine-tuning and
    why fine-tuning invariably seems to improve task performance
* In this work, we investigate the process of fine-tuning of representations
  using the English BERT family (Devlin+ 2019). Specifically, we ask:
  1. Does fine-tuning always improve performance?
  2. How does fine-tuning alter the representation to adjust for downstream?
  3. How does fine-tuning change the geometric structure of different layers?
* We apply two probing techniques
  * classifier-based probing (Kim+ 2019; Tenney+ 2019) and
  * DirectProbe (Zhou and Srikumar, 2021)
    on variants of BERT representations that are
  * fine-tuned on five tasks: part-of-speech tagging, dependency head pred,
    preposition supersense role & function prediction, and text classification
* findings
  * Beyond confirming previous findings about fine-tuning, our analysis reveals
  1. fine-tuning introduces a divergence between training and test sets,
    * not severe enough to hurt generalization in most cases
    * hE exception where fine-tuning hurts the performance; in the setting with
      the largest divergence between training and test set after fine-tuning
      (§4.1)
  2. how fine-tuning changes labeled regions of the representation space
    * For a representation where task labels are
      not linearly separable, we find that
      fine-tuning adjusts it by grouping points with the same label into a
      small number of clusters (ideally one),
      thus simplifying the underlying representation
      * makes it easier to linearly separate labels with fine-tuned
        representations than untuned ones (§4.2)
    * For a representation whose task labels are already linearly separable,
      fine-tuning pushes the clusters of points representing different labels
      away from each other, thus introducing large separating regions
      * Rather than simply scaling the points, clusters move in different
        directions and with different extents (measured by Euclidean distance)
      * Overall, these clusters become distant compared to the untuned repr
      * We conjecture that the enlarged region between groups admits a bigger
        set of classifiers that can separate them => better generaliz (§4.3)
    * We verify our distance hypothesis by
      investigating the effect of fine-tuning across tasks
      * fine-tuning for related tasks can also provide useful signal for the
        target task by altering the distances between clusters representing
        different labels (§4.4)
  3. Finally, fine-tuning does not change the higher layers arbitrarily
    * confirms previous findings
    * fine-tuning largely preserves the relative positions of the label clusts,
      while reconfiguring the space to adjust for downstream tasks (§4.5)
    * fine-tuning only “slightly” changes higher layers

# 2 Preliminaries: Probing Methods 2

## 2.1 classifier-based probe (eg, Tenney+ 2019; Jullien+ 2022)

* assess how well a representation supports classifiers for a task
* the most commonly used probes in the literature
  (eg Hewitt+ 2021; Whitney+ 2021; Belinkov, 2021)
* To understand how well a representation encodes the labels for a task, a
  probing classifier is trained over it, with the embeddings kept frozen
* For all our experiments, we use two-layer neural networks as our probe
  * grid-search to choose the best hyperparameters
  * Each best classifier is trained five times with different initializations
  * We report the average accuracy and its std for each classifier
  * The hidden layer sizes are selected from {32, 64, 128, 256} × {32, 64, 128,
    256}, and the regularizer weight from the range 10 −7 to 10 0
  * All models use ReLUs as the activation function for the hidden layer and
    are optimized by Adam (Kingma and Ba, 2015)
  * maximum number of learning iterations set to 1000
  * We use scikit-learn v0.22 (Pedregosa+ 2011)
* Classifier probes aim to measure how well a contextualized representation
  captures a linguistic property. The classification performance can help us
  assess the effect of fine-tuning

## 2.2 DirectProbe (Zhou and Srikumar, 2021) to analyze the repr geometry

* refer to the original work for details
* For a given labeling task, DirectProbe returns a set of clusters such that
  each cluster only contains the points with the same label, and
  there are no overlaps between the convex hulls of these clusters
* Any decision boundary must cross the regions between the clusters that have
  different labels (see in Figure 1)
  * Since fine-tuning creates different representations for different tasks,
    it is reasonable to probe the representation based on a given task
* allow us to measure three properties of interest:

### Number of Clusters

* indicates the linearity of the representation for a task
* If, however, there are more clusters than labels, then at least two clusters
  of examples with the same label can not be grouped together (as in Figure 1,
  right). This scenario calls for a non-linear classifier

### Distances between Clusters (Euclidean)

* can reveal the internal structure of a representation
* tracking these distances during fine-tuning
* we use the fact that each cluster represents a convex object
* we use max-margin separators to compute distances
* We train a linear SVM (Chang and Lin, 2011) to find the maximum margin
  separator and compute its margin
* The distance between the two clusters is twice the margin

### Spatial Similarity

* Distances between clusters can also reveal the spatial similarity of two
  representations. Intuitively, if two representations have similar relative
  distances between clusters, the representations themselves are similar to
  each other for the task at hand
* we construct a distance vector v for a representation, where
  each element v i is the distance between the clusters of a pair of labels
  * With n labels in a task, the size of v is n(n−1)
  * works only when the number of clusters equals the number of labels (ie, the
    dataset is linearly separable under the representation)
  * nL we find this to be the case for most representations we studied
* measure of the similarity of two representations for a labeling task:
  * Pearson correlation coefficient between their distance vectors
* can also be used to measure the similarity between two labeled datasets
  with respect to the same representation
* We exploit this observation to analyze the divergence between training and
  test sets for fine-tuned representations (§4.1)

# 3 Experimental Setup

## 3.1 Representations

* several models from the BERT family (Devlin+ 2019; Turc+ 2019)
  * same basic architecture but with different capacities, ie, different layers
    and hidden sizes
  * Table 1 summarizes the models we investigate in this work 4
  * All of these models are for English text and uncased
  * BERT tiny, BERT mini, BERT small, BERT medium, BERT base
  * We ignore the BERT large because, during preliminary experiments, we found
    BERT large is highly unstable
    * The variance between different fine-tuning runs is so large that not
      comparable with other BERT models
    * This is consistent with the observations from Mosbach+ (2020a)
* For tokens that are broken into subwords by the tokenizer, we average
  * models by HuggingFace v4.2.1 (Wolf+ 20), and Pytorch v1.6.0 (Paszke+ 19)

## 3.2 Tasks

### Part-of-speech tagging (POS) predicts the partof-speech tag for each word

* We use the English portion of the parallel universal dependencies treebank
  (ud-pud, Nivre+ 2016)

### Dependency relation (DEP) predicts the syntactic dependency relation

* involves assigning a category to a pair of tokens
* We concatenate their contextualized representations from BERT and treat the
  concatenation as the representation of the pair
* We use the same dataset as the POS task for dependencies

### Preposition supersense disambiguation: two categorization tasks

* predicting prep’s semantic role (PS-role) and semantic function (PS-fxn)
* Following the previous work (Liu+ 2019), we only train and evaluate on
  single-token prepositions from Streusle v4.2 corpus (Schneider+ 2018)
  * Nathan Schneider, Jena D. Hwang, Vivek Srikumar, Jakob Prange,
      Austin Blodgett, Sarah R. Moeller, Aviram Stern, Adi Bitan, Omri Abend
    ACL 2018
    Comprehensive supersense disambiguation of English prepositions and possess

### Text classification: categorizing sentences or documents

* We use the TREC50 dataset (Li and Roth, 2002) with
  * 50 semantic labels for sentences
* As is the standard practice, we use the representation of the [CLS] token as
  the sentence representation

## 3.3 Fine-tuning Setup

* We fine-tune the models in §3.1 on the five tasks from §3.2 separately
  * More detailed settings can be found in Appendix A
  * The fine-tuned models (along with the original models) are then used
  * The probing techniques described in §2 are applied to study both original
    and fine-tuned representations
* number of epochs
  * Our preliminary experiments showed that the commonly used 3-5 epochs of
    fine-tuning are insufficient for the smaller representations, such as BERT
    tiny, and they require more epochs
  * We fine-tuned all the representations for 10 epochs
    except BERT base, which we fine-tuned for the usual three epochs
  * the fine-tuning phase is separate from the probing classif training phase
* for the probe classifiers, we train two-layer neural networks (§2.1) from
  scratch on both original and fine-tuned representations 7, ensuring a fair
  comparsion between them
  * When the fine-tuned representations are probed, their weights are frozen
  * ie the fine-tuned representations as a black-box that produces embeddings

# 4 Observations and Analysis 4

* a geometric explanation for why fine-tuning improves classification
  performance using DirectProbe (§4.2 and §4.3)

## 4.1 Fine-tuned performance

* classifier probes to examine if fine-tuning always improves classifier perf
* It is commonly accepted that the fine-tuning improves task performance
  Does this always hold?
* Table 2 summarizes the relevant observations from our experiments
* Appendix C presents the complete fine-tuning results

### Fine-tuning diverges the training and test set

* In Table 2, the last column shows the spatial similarity between the
  training and test set for each representation
* We apply DirectProbe on the training and test set separately
* The spatial similarity is calculated as the Pearson correlation coefficient
  between the distance vectors of training and test set (described in §2)
* We observe that after fine-tuning, all the similarities decrease, implying
  that the training and test set diverge as a result of fine-tuning
* In most cases, this divergence is not severe enough to decrease the perf

### There are exceptions, where fine-tuning hurts performance

* BERT small does not show the improvements on the PS-fxn task after
  fine-tuning, which breaks the well-accepted impression
  * only one such exception is observed across all our experiments (Appendix C)
  * insufficient to draw any concrete conclusions about why this is happening
  * BERT small shows the smallest similarity (0.44) between the training and
    test set after fine-tuning on PS-fxn task
* We conjecture that
  controlling the divergence between the training and test sets
  can help ensure that fine-tuning helps

## 4.2 Linearity of Representations

* We will focus on the overwhelming majority where fine-tuning improves perf

### Smaller representations require more complex classifiers

* Table 3 summarizes the results
* For brevity, we only present the results on BERT tiny
  * The full results are in Appendix C
* before fine-tuning, small representations (ie, BERT tiny ) are non-linear
  for most tasks
* => advisable to use a non-linear classifier rather than a simple linear one

### Fine-tuning makes the space simpler

* In Table 3, we observe that
  the number of clusters decreases after fine-tuning
* a simpler spatial configuration
* The same trend holds for TREC-50 (Table 4),
  even when the final repr is not linearly separable

## 4.3 Spatial Structure of Labels

* we apply DirectProbe to every intermediate representation during fine-tuning
* Here, we focus on the BERT base
* In this part, we exclude the TREC-50 task
  because it is non-linear even after fine-tuning
  * It is difficult to track the minimum distances between clusters when the
    clusters are merging during fine-tuning
* Since all representations we considered are linearly separable 8
  * the number of clusters equals the number of labels
  * each cluster exclusively corresponds to one label
  * we will use clusters and labels interchangeably

### Fine-tuning pushes each label far away from each other

* confirms the observation of Zhou and Srikumar (2021)
  * they use the global minimum distance between clusters to support this,
    which only partially supports the claim: the distances between some
    clusters might increase despite the global minimum distance decreasing
* We track the min distance of each label to all other labels during fine-tunin
  * all the minimum distances are increasing
  * Figure 2 shows how these distances change in the last layer of BERT base
    for the PS-role and POS tagging tasks
* Appendix D includes the plots for all tasks
  * we only show the three labels where the distance increases the most/least
  * although the trend is increasing, the minimum distance associated with a
    label may decrease during the course of fine-tuning,
  * eg, the label Stuff in PS-role task,
    suggesting a potential instability of fine-tuning
* we track the centroids of each cluster
  * We select three closest labels from the POS tagging task and
    track the paths of the centroids of each label cluster in the last layer of
    BERT base during the fine-tuning
  * Figure 3 (right) shows the 2D PCA projection of these paths
    * before fine-tuning, the centroids of all these three labels are close
    * As fine-tuning proceeds, the centroids move around in different
      directions, away from each other
* We conclude that fine-tuning enlarges the gaps between label clusters and
  * admits more classifiers consistent with the labels
  * neither the loss nor the optimizer explicitly mandates this change
    * since the labels were originally linearly separable, the learner need not
      adjust the representation at all

## 4.4 Cross-task fine-tuning confirms the geometric explanation

* In §4.3, we hypothesized that fine-tuning improves the performance because it
  enlarges the gaps between label clusters
  * A natural inference of this hypothesis is that
    the process may shrink the gaps between labels of an unrelated task, and
    its performance can decrease
  * how fine-tuning for one task affects another
* We fine-tune the BERT base on PS-role and POS tagging tasks separately and
  use the fine-tuned models for the PS-fxn task
  * Our choice of tasks motivated by the observation that
    * PS-role and PS-fxn are similar tasks (predict supersense tags for preps)
    * POS tagging can adversely affect the PS-fxn task because POS/PS-fxn
      requires the preps to be grouped together/far away from each other
* We apply DirectProbe on both representations to analyze the geometric changes
  with respect to PS-fxn
  * The PS-fxn task is still linearly separable even after fine-tuning on
    PS-role or POS tagging tasks

### The effects of cross-task fine-tuning depends on how close two tasks are

* The third and fourth columns of Table 5 indicate the number of labels whose
  minimum distance is increased or decreased after fine-tuning
* The second column from the right shows the average distance change over all
  labels, eg fine-tuning on POS results in the minimum distances of the PS-fxn
  labels decreasing by 1.68 on average
* fine-tuning on
  * the same dataset (PS-fxn) increases the distances between labels (second
    row), which is consistent with observations from §4.3;
  * a similar task also increases the distances between clusters (third row)
    but to a lesser extent
  * a “opposing” task decreases the distances between clusters (last row)
* suggest that cross-task fine-tuning could add or remove information from the
  representation, depending on how close the source and target task are

### Small distances between label clusters indicate a poor performance

* Based on our conclusion in §4.3 that
  a larger gap between labels leads to better generalization,
  we expect that the performance of PS-fxn after fine-tuning on PS-role
  would be higher than the performance after fine-tuning on POS tagging
* To verify this, we train two-layer neural networks on PS-fxn task using the
  representations that are fine-tuned on PS-role and POS tagging tasks
  * we do not further fine-tune the representations for PS-fxn
* The last column of Table 5 shows the results
* Fine-tuning on
  * PS-fxn enlarges gaps between all PS-fxn labels,
    which justifies the highest performance
  * PS-role enlarges gaps between some labels in PS-fxn,
    leading to a slight improvement
  * POS tags shrinks the gaps between all labels in PS-fxn,
    leading to a decrease in performance

## summary of §4.2, §4.3 and §4.4

* fine-tuning injects or removes task-related information from representations
  by adjusting the distances between label clusters
  even if the original representation is linearly separable
  (ie, when there is no need to change the representation)
  * When the original representation does not support a linear classifier,
    fine-tuning tries to group points with the same label into a small number
    of clusters, ideally one cluster

## 4.5 How fine-tuning changes the geometry of different layers of BERT base

* Merchant+ (2020); Mosbach+ (2020b):
  during fine-tuning, lower layers changed little compared to higher layers
* In the following experiments, we confirm their findings and further show
  * fine-tuning does not change the repr arbitrarily, even for higher layers;
  * an analysis of the changes of different layers by a visual comparison
    between lower and higher layers
* Here, we focus on the POS tagging task with BERT base
  * conclusions extend to other tasks, whose results are in Appendix E

### Higher layers do not change arbitrarily

* Mosbach+ (2020b) show that higher layers change more than the lower
* nL, we find that higher layers still remain close to the original reprs
* we compare each layer during fine-tuning to its corresponding original
  * spatial similarity between two representations is calculated as the
    Pearson correlation coefficient of their distance vectors (§2)
  * Intuitively, a classifier learns a decision boundary that traverses the
    region between clusters => the distances between clusters more relevant to
    our analysis than the spatial structure of points within each cluster
* Figure 4 shows the results for all four tasks
  * We exclude the TREC-50 task because it is non-linear:
    We cannot have the distance vectors for non-linear representations
  * To avoid visual clutter, we only show the plots for every alternate layer
  * For the higher layers, we find that the Pearson between the original
    representation and the fine-tuned one is surprisingly high (more than 0.5),
* this reinforces the notion that fine-tuning does
  * not change the representation arbitrarily
  * attempts to preserve the relative positions of the labels
  * ie encodes task-specific information, yet it largely preserves the
    pre-trained information encoded in the representation

### The labels of lower layers move only in a small region
and almost in the same directions

* The unchanged nature of lower layers raises the question:
* do lower layers change at all? To answer this question,
  * for every label, we compute difference between its centroids before and
    after fine-tuning
* Figure 5 shows the PCA projection in 2D of these difference vectors
  * Note that, in Figure 5, the motion range of lower layers is much smaller
    than the higher layers
  * For brevity, we only present the plots for every alternate layer
    * A plot with all layers can be found in Appendix E
  * the movements of labels in lower layers concentrate in a few directions
    compared to the higher layers,
    suggesting the labels in lower layers do change, but do not separate the
    labels as much as higher layers
  * the POS labels INTJ and SYM have distinctive directions in the lower layers
  * Figure 3
    * as opposed to the layer 12 (right) paths, we see that the
      layer 1 paths (left) traverse almost the same trajectories, which is
      consistent with the observations from Figure 5

# 5 Discussion

## Does fine-tuning always improve performance?

* Indeed, fine-tuning almost always improves task performance
* hE, rare cases exist where fine-tuning decreases the performance
* Fine-tuning introduces a divergence between the training set & unseen (§4.1)
* unclear how this divergence affects the generalization ability
* eg does this divergence suggest a new kind of overfitting that is
  driven by representations rather than classifiers?

## How does fine-tuning alter the representation?

* Fine-tuning alters the representation by
  * grouping points with the same label into small number of clusters (§4.2)
  * pushing each label cluster away from the others (§4.3)
* We hypothesize that the
  distances between label clusters correlate with the classif performance
  * hypothesis confirmed by investigating cross-task fine-tuning (§4.4)
  * surprising because fine-tuning for a classification task does
    not need to alter the geometry of a representation
    if the data is already linearly separable in the original representation.
    * What we observe reveals geometric properties that characterize good reprs
  * no theoret anal to connect our geometric findings to repr learnability, but
    the findings in this work may serve as a starting point

## How does fine-tuning change the geometric structure of different layers?

* It is established that higher layers change more than the lower ones
* In this work, we analyze this behavior more closely. We discover that
  * higher layers remain similar to the untuned version (§4.5)
  * fine-tuning only “slightly” changes even the higher layers
  * not revealed why higher layers change more than the lower layers
  * A deeper analysis of model parameters during fine-tuning is needed to

## Limitations of this work

* Our experiments use the BERT family of models for English tasks
* structure within each cluster, which is another information source

# 6 Related Work

* analyzing and understanding representations
  * classifier-based method
    * linear classifiers (Alain and Bengio, 2017; Kulmizev+ 2020)
    * linear probe is not sufficient to evaluate a repr (Hewitt and Liang 2019)
    * non-linear probes (Tenney+ 2019; Eger+ 2019)
  * from a geometric persepctive (Ethayarajh, 2019; Mimno and Thompson, 2017),
    * DirectProbe (Zhou and Srikumar, 2021), which we use in this work
  * control tasks (Ravichander+ 2021; Lan+ 2020) to reverse-engineer the
    internal mechanisms of representations (Kovaleva+ 2019; Wu+ 2020)
  * most studies (Zhong+ 2021; Li+ 2021; Chen+ 2021) focused on pre-trained
    representations, not fine-tuned ones
* fine-tuning pre-trained representations
  * usually provides strong performance (Wang+ 2018; Talmor+ 2020),
  * how fine-tuning manage to do so has remained an open question
  * instability (Mosbach+ 2020a; Dodge+ 2020; Zhang+ 2020)
  * forgetting problems (Chen+ 2020; He+ 2021)
  * valuable conclusions
    * Merchant+ BlackboxNLP 2020
      Amil Merchant, Elahe Rahimtoroghi, Ellie Pavlick, and Ian Tenney
      What happens to BERT embeddings during fine-tuning?
    * Mosbach+ 2020b
    * Hao+ 2020 AACL-IJCNLP
      Yaru Hao, Li Dong, Furu Wei, and Ke Xu
      Investigating learning dynamics of BERT fine-tuning

# 7 Conclusions 9

# Appendix A Fine-tuning Details

* we fine-tune all tasks and representations using HuggingFace library
  * linear weight scheduler with a learning rate of 3e −4
  * 10% of the total update steps as the warmup steps
    * The same schduler is used for all tasks
* models are optimized by Adam (Kingma and Ba, 2015) with batch size of 32
* fine-tuning is run on a single Titan GPU
* The best hidden-layer sizes for each task are shown in Table 7

# Appendix B Summary of Tasks: five NLP tasks, see  Table 6

# Appendix C Probing Performance. Table 7

# Appendix D Dynamics of Minimum Distances: Figure 6

# Appendix E PCA Projections of the Movements: Figures 7–10

* the PCA projections of the difference vector between the centroids of labels
  before and after fine-tuning based on BERT base
