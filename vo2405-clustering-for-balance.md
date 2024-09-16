Automatic Data Curation for Self-Supervised Learning: A Clustering-Based Apprch
Huy V Vo, V Khalidov, T Darcet, T Moutakanni, N Smetanin, M Szafraniec,
  H Touvron, C Couprie, M Oquab, A Joulin, H Jégou, P Labatut, P Bojanowski
arXiv:2405.15613 [cs.LG]

https://github.com/facebookresearch/ssl-data-curation

* Self-supervised features are the cornerstone of modern machine learning
  * pre-trained on data collections whose construction and curation typically
    require extensive human effort
  * manual curation has some limitations
    similar to those encountered in supervised learning
    * the crowd-sourced selection of data is costly and time-consuming,
      preventing scaling the dataset size
* we: automatic curation of high-quality datasets for self-supervised
  * datasets should be large, diverse and balanced
  * a clustering-based approach for building datasets satisfying all these
  * successive and hierarchical applications of k-means
    on a large and diverse data repository
    to obtain clusters that distribute uniformly among data concepts,
    followed by a hierarchical, balanced sampling step from these clusters
* Extensive experiments
  * 3 domains including web-based images, satellite images and text
  * features trained on our automatically curated datasets
    outperform those trained on uncurated data while being
    on par or better than ones trained on manually curated data

# 1 Introduction

* Self-supervised learning (SSL) is at the core of modern SOTA machine learning
* objective
  * Large language models (LLMs) are pre-trained in a self-supervised way
    using a language modeling objective
    (Radford+ 2019; Ouyang+ 2022; Raffel+ 2020; Touvron+ 2023)
    * outstanding performance across all conventional NLP tasks
      eg sentiment, translation, summarisation, question answering, or dialogue
  * foundational visual encoders: different flavors of contrastive learning
    (Richemond+ 2020; Chen+ 2020; Caron+ 2021; Oquab+ 2023)
    * accuracies above 87% on ImageNet (Oquab+ 2023)
    * the gap with the absolute supervised SOTA is drastically shrinking
* strong out-of-distribution generalization, opening new research avenues
  * successfully applied to more narrow domains, considerable model improv
    * medical image analysis (Azizi+ 2021; Chen+ 2024), 
    * phenotypic representations of cells (Ucar+ 2021), and
    * canopy height estimation for forest growth monitoring (Tolan+ 2023)
* corpus qual
  * Large language models trained on large pools of ill-curated text corpora
    led to subpar performance on standard benchms (Zhang+ 2022; Le Scao+ 2023)
  * random collections of internet images also consistently led to a
    significant drop in performance
    (Doersch+ 2015; Caron+ 2019; Goyal+ 2019; 2021; Tian+ 2021)
  * likely due to the long-tail distribution of concepts in uncurated datasets
    (Salakhutdinov+ 2011; Zhu+ 2014; Liu+ 2019)
  * web data: a highly non-uniform distribution of languages (Wenzek+ 2019)
    * proper language identification and filtering are required
  * image collections, specific object categories dominate the distribution and
    appear in many images, while others are significantly less present
  * Images containing a plunger [pumpa] constitute 0.1% of ImageNet but likely
    will be less frequent in online images. This imbalance leads to biases
* successful applications of SSL at scale
  * LLMs are typically trained on a carefully curated mix of data
    * high-grade data sources such as Wikipedia (Touvron+ 2023)
    * raw internet data is filtered to match
      the language and topic distribution of Wikipedia
  * foundational image models: relevant images are retrieved from a pool of
    random web images base on a seed, often manually labelled dataset
    ~> a relatively good balance between visual concepts (Oquab+ 2023)
  * the data curation pipelines are rather ad hoc
* we: principled and automatic curation of large-scale uncurated data
  * task dependent curation (Oquab+ 2023)
  * our goal: A principled and generic curation algorithm that allows of
    inferring interesting properties from completely uncurated data sources,
    independently of the specificities of the applications at hand
* datasets should be large, diverse, and balanced
  * importance of size and diversity (Kaplan+ 2020, Hoffmann+ 2022)
  * Obtaining large and diverse data is possible by
    leveraging large-scale web archives of Internet (Grave+ 2018; Wenzek+ 2019)
* we use the term “concept” rather than “category” or “class” as  
  the latter is often poorly defined, subjective, and depends on the context
  * a data point (an image or a text paragraph) could belong to multiple such
    “classes”. In contrast, “concept” is a more abstract term and allows us to
    have a more objective discussion. We do not explicitly define concepts
  * let the data define concepts
  * concept = the shared content of a group of data points
    that are similar according to human perception
* (possibly weak) labels ~> a balance between concepts could be achieved by
  capping the number of data points corresponding to each concept
  (Radford+ 2021; Dehghani+ 2023; Xu+ 2024)
* we: Given embeddings of all data points produced by a feature extractor, eg
  DINOv2 (Oquab+ 2023) for images or SBERT (Reimers & Gurevych, 2019) for text,

# 2 Related work

## Self-supervised learning is at the core of modern machine learning

* NLP: language modeling is a fundamental task that is self-supervised
  * neural language models started with relatively simple architectures
    * feed-forward models (Bengio+ 2000)
    * plain recurrent neural networks
      (Elman, 1990; Hochreiter & Schmidhuber, 1997; Mikolov+ 2010)
  * language models for representation learning
    (Radford+ 2017; 2018; Devlin+ 2019)
  * Finetuning BERT models on the task at hand has become the standard
  * large-scale models fundamentally changing AI research (Chowdhery+ 2022; 
    Hoffmann+ 2022; Ouyang+ 2022; Achiam+ 2023; Touvron+ 2023), 
* unsupervised learning of visual features has also received much interest
  * Initially relied on well-tailored pretext tasks
  * idea was that general visual features would emerge by training a NN to
    solve these simple ad hoc tasks, which require the model to understand and
    reason about specific image properties
  * several methods based on recognizing each image as its own class
    (Dosovitskiy+ 2014; Bojanowski & Joulin, 2017; Wu+ 2018)
  * alternative “general” self-supervised loss functions have been proposed,
  * Joint Embedding Architectures (LeCun, 2022)
  * contrastive-based methods (Oord+ 2018; Chen+ 2020; Hénaff+ 2020)
  * momentum queue (He+ 2020) and
  * exploiting the nearest neighbor graph (Dwibedi+ 2021)
  * losses based on
    * clustering (Caron+ 2018; Asano+ 2020; Caron+ 2020; Assran+ 2022),
    * distillation (Grill+ 2020; Caron+ 2021), and
    * information maximization (Zbontar+ 2021; Bardes+ 2022) have been proposed
  * led to astonishing progress of the representation power of SSL models
* We evaluate our curated datasets with DINOv2 (Oquab+ 2023), 
  * DINOv2 is a distillation-based approach which shows 
    successful training attempts on large, curated image datasets
  * Eval with other SSL methods (SimCLR, MoCo, SwAV) is beyond our scope
    * we assume that our conclusions hold for similar training algorithms

## Data curation. In the context of self-supervised learning ie no metadata

* NLP
  * word vectors trained with word2vec (Mikolov+ 2013)
    * Their quality was directly influenced by
      using a carefully selected dataset of > 1B words
    * in 157 languages (Grave+ 2018)
      Édouard Grave, Piotr Bojanowski, Prakhar Gupta, Armand Joulin, T Mikolov
      Learning word vectors for 157 languages
      LREC 2018
    * By filtering Common Crawl data, the authors managed to obtain
      large datasets to train reliable word vectors for 157 languages
  * SOTA open-source LLMs (Touvron+ 2023) also leverage this type of
    carefully curated large data from the web (Wenzek+ 2019)
* vision. Most successful self-supervised visual models are trained on the
  curated ImageNet dataset (Deng+ 2009) without labels
  * attempts on other datasets, often created from large uncurated data
  * Doersch+ (2015) show that self-supervised methods can be trained on
    uncurated visual data, and
  * Caron+ (2019); Goyal+ (2019) show how it can be scaled to 100 Ms of
    uncurated images
  * Goyal+ (2021; 2022a) leverage billions of random internet images to obtain
    high-quality self-supervised features
  * Asano+ (2021) propose an ImageNet-sized dataset of uncurated images
    to facilitate research beyond curated images
  * on uncurated data, Tian+ (2021) is inspired by the divide and conquer algo
    * the uncurated dataset is split into coherent parts using clustering, and
      individual models are trained with SSL on those parts
    * A large model is obtained by distilling knowledge from the part-specific
      models
  * Oquab+ (2023) propose to retrieve the closest images
    to a fixed set of datasets of interest in an unsupervised manner
* label propagation for semi-supervised learning
  * explored by Yalniz+ (2019)
  * good results, but selecting images based on queries from specific datasets
    may ignore a wide range of visual concepts in Internet-based repositories
* we do not use image labels in our curation pipeline

## Data pruning and active learning

* seek to reduce the size of the training dataset
  * to save computation and/or annotation cost
  * finds and removes redundant or troublesome data points from the training
* Typical approaches involves ranking data points according to some metrics
  and remove low-ranked ones
  * metrics include
    * distance to prototypes (Sorscher+ 2022),
    * training error (Paul+ 2021),
    * forgetting score (Toneva+ 2019) or
    * influence score (Feldman & Zhang, 2020)
  * Most data pruning methods require label information
* Active learning
  alternates between
  training models and selecting the best next samples to annotate
  until an annotation budget cost is met (Settles, 2009a)
  * Samples are selected so as to maximize the model’s performance
  * selection strategies include choosing the most
    * representative (Geifman & El-Yaniv, 2017; Sener & Savarese, 2018) or
    * informative samples (Brust+ 2019; Choi+ 2021) or
    * both (Zhdanov, 2019; Ash+ 2020; Vo+ 2022)
* we do not focus on reducing resource cost and do not require data labels

## Clustering or cluster analysis aims at finding structures in data

* types
  * centroid-based 
    * k-means (Arthur & Vassilvitskii, 2007; Lloyd, 1982) or 
    * mean-shift (Cheng, 1995),
  * density-based such as DBSCAN (Ester+ 1996; Schubert+ 2017),
  * statistical model-based with Gaussian Mixture Model (Yang+ 2012) or
  * hierarchical such as agglomerative (Defays, 1977; Sibson, 1973)
* applications in various scientific fields, often used
  to introduce structures into data to ease further analysis
  * in vision:
    * image segmentation (Achanta+ 2012),
    * quantization (Jégou+ 2011) or
    * bag-of-visual-words extraction (Lazebnik+ 2006; Jégou+ 2010)
* Our use of k-means clustering is
  close to active learning (Settles, 2009b) or data pruning (Sorscher+ 2022)
  as part of the data selection or ranking process
  * nL, we do not employ [flat] k-means since it is sub-optimal for our
    * we propose hierarchical k-means to sample balanced datasets
* Hierarchical application of k-means has been considered before
  * Nister & Stewenius (2006) build vocabulary trees of visual concepts
    * top-down manner, k-means is first used to divide the dataset into
      multiple clusters, then a separate k-means is applied onto each cluster
      to obtain finer clusters on which the process continues recursively
  * our method builds the tree in a bottom-up manner where
    * subsequent k-means is applied on the centroids obtained with the previous
    * Sec 3: contrary to Nister & Stewenius (2006), our approach is
      guaranteed to produce approximately balanced clusterings
  * Ma+ (2024) also employs a two-step k-means clustering to obtain
    data clusters with different granularity
    for training CLIP (Ramesh+ 2021) data experts

## 3.1 the necessary properties of pre-training datasets for self-supervised

## 3.2 the use of k-means to build datasets with these properties

## 3.3 hierarchical k-means to build datasets with these properties

# 4 Experiments 9

## 4.1 Controlled experiments on simulated data ~> interpretable algo analysis

* our approach effectively flattens the data distribution, thus
  pulling down dense areas corresponding to redundant data and
  up-weighting the long-tail samples

## 4.2 Self-supervised learning on web-based images

* extensive experiments by training a SOTA self-supervised learning method
  (DINOv2 Oquab+ 2023) on datasets meticulously curated from web images
* our approach leads to improvements on most benchmarks, in particular for
  robustness, out-of-distribution generalisation, and long-tailed cases

## 4.3 application to two other domains

significant improvements in both domains

### 4.3.1 The curation of text data for LLMs

### 4.3.2 The curation of satellite imagery for canopy [lombkorona] height pred

# 5 Conclusion

* resampling-clustering steps improve the distribution of k-means centroids
* experiments
  * significantly better features than raw datasets or ImageNet1k
  * hE slightly outperformed by ImageNet22k on certain benchmarks
    eg ImageNet-1k, fine-grained classification datasets, and iNaturalist
  * nL ImageNet22k was curated with significantly more human effort than
    ImageNet1k
    * These evaluation datasets are very correlated with the ImageNet
      benchmark, which has influenced computer vision benchmarking for > 10 y
  * our curated dataset still bests ImageNet22k on the critical robustness
    tests (ImageNet Adversarial, Rendition, and Sketch)
* future: hierarchical k-means in other learning context
  * It should be considered in place of vanilla k-means
    in tasks necessitating diverse and representative data sets,
    eg active learning or data pruning

## Limitations

* factors not taken into account
  * subjective and hard-to-estimate factors
  * eg the quality of individual data points
* web-based images: we still rely on features pretrained using SSL on a
  manually assembled dataset (ImageNet-1k)
* drastically larger image pools would further improve our performance

## Statement of Broader Impact: reinforcing biases and breaching privacy

* we use safety measures. For instance, we used strong models
  to detect and blur all human faces in our web-based image data pool
* we aim to alleviate the bias due to over-representing some concepts in random
  internet images, leading to better fairness in downstream tasks (Tab 5c)
* practitioners could tailor parametric curation methods for specific goals
  * set up fairness evaluations such as those in Sec 4.2.3
  ~> one can monitor the downstream performance along with fairness indicators
  to choose optimal data
* The end user creating the dataset should probe for fairness issues
