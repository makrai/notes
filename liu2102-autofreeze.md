AutoFreeze: Automatically Freezing Model Blocks to Accelerate Fine-tuning
Yuhan Liu, Saurabh Agarwal, Shivaram Venkataraman
arXiv:2102.01386 [cs.LG]

Our implementation is available at https://github.com/uw-mad-dash/AutoFreeze

# Abstract

* fine-tuning models like BERT can take many hours even when using GPUs
  * prior work proposes limiting the number of layers that are fine-tuned
  * eg freezing all layers but the last layer
  * we find that such static approaches lead to reduced accuracy
* We propose AutoFreeze
  * adaptive approach to choose which layers are trained
    * accelerate model fine-tuning while preserving accuracy
    * conclu: freeze parts of the model that are closest to convergence during
  * mechanisms to enable efficient caching of intermediate activations
    * reduce the forward computation time when performing fine-tuning
  * We extend AutoFreeze to perform distributed fine-tuning
  * two execution modes that minimize cost and running time respectively
* evaluation on ten NLP tasks shows that AutoFreeze, with caching enabled, can
  * on a single GPU, improve fine-tuning by up to 2.55x
  * On a 64 GPU cluster, for fine-tuning on the AG's news dataset,
    * 4.38x speedup when optimizing for end-to-end training time and
    * 5.03x reduction in total cost when optimizing for efficiency,
      without affecting model accuracy

# 1 Intro

* transfer learning vs fine tuning
  * transfer-learning: only the last one or few layers are trained to specializ
  * fine tuning: pre-trained model used to initialise a new task; then
    * all layers of the model are trained until convergence
* ways to reduce training time
  * data-parallel distributed training
    * PyTorch DistributedDataParallel (DDP) [25] and BytePS [21]
      heterogeneous resources such as GPUs, CPUs, and network bandwidth
  * hybrid parallelism to
    improve model selection throughput and minimize synchronization bottlenecks
    * Cerebro [39] and PipeDream [40]
* Even when using Pytorch DDP [25], we find that
  fine-tuning BERT for the sentiment classification task with the Yelp dataset
  [69] can take around 27 hours in a four P100 GPU cluster
* existing training systems are oblivious to
  [unaware of] the convergence properties of the fine-tuning workloads
  * given that fine tuning already starts from a pre-trained model,
    training systems need to be aware of the opportunities that arise from
    rapid convergence to achieve high throughput
* A natural approach to improve fine-tuning performance is to
  * limit the number of layers of the model that are updated
  * Lee+ [24] trains a fixed number of blocks (e.g., the last 3 blocks)
  * with the MRPC dataset [11] this approach can
    reduce the time for an epoch by 2×, but we find that
    the accuracy of the fine-tuned model suffers, dropping from 87% to 76.5%
* Chen+ [6]: “Lottery Ticket Hypothesis”
  * identify matching subnetworks in pre-trained BERT models
    to enforce sparsity in models trained for different downstream tasks
  * retains accuracy and can lead to sparser models
  * no improvements in speed without dedicated hardware or libraries [30]
* we propose a novel approach where
  * adaptively chosen during the fine-tuning process:
    * the number of model blocks that are updated and
      resources used during fine-tuning
  * inspired by SVCCA (Raghu+ [45]) who developed
    * a new metric that captures how different layers of model change
    * computed by comparing the intermediate model weights with the final weigh
    * can thus be used for post-hoc analysis
  * we Applying that approach to model fine-tuning
  * the initial layers of the model converge rapidly and
    thus we can freeze such layers
    * the backward pass for those layers can be skipped
  * we still need an
    online algorithm that can decide which layers should be frozen and when
  * We develop a gradient-norm based test that
    ranks layers by their rate of change and
    selects the slowest changing layers for freezing
  * our method is effective at detecting when layers should be frozen
    without affecting accuracy across multiple datasets
* advantages of freezing early layer
  * reducing the time for backward pass model
  * reduce the amount of communication required for distributed training
    * eg freezing layers of BERT can save around 27MB per layer frozen, thus
      reducing the synchronization required
  * can reduce the time for forward pass. Since the frozen layers don’t change
    * the output for a given data point will be constant for the frozen layers
    * cache the output of the forward pass up to the frozen layer
    * Once the same data point is selected to be used again for training, we
      can load the pre-computed intermediate values from our cache
* We design AutoFreeze, a system for automatically freezing layers
  to accelerate fine-tuning
  * two main modules on each GPU: a
    * freezing module that has a pluggable decision engine that can
      make decisions on which layers should be frozen
      based on the aggregated gradients as training progresses
      * includes a decision engine that
        dynamically picks the amount of resources to use during fine-tuning
        * two modes that the user can choose from:
          Performance Packing for minimizing training time or
          Efficiency Packing for minimizing cost
    * storage manager module implement the caching functions described above
      * handles a number of common concerns in caching, including
        selecting the appropriate backend (CPU memory / SSD etc.) and
        deciding when to evict data from the cache
* We evaluate AutoFreeze using a wide range of fine-tuning tasks
  * topic classification on the AG’s News dataset [69] and Sogou News [55]
    [69] X. Zhang, J. Zhao, and Y. LeCun
    Character-level convolutional networks for text classification
    NeurIPS 2015.
    [55] C. Sun, X. Qiu, Y. Xu, and X. Huang
    How to fine-tune BERT for text classification? 
    China National Conference on Chinese Computational Linguistics 2019
  * sentiment analysis on Yelp Full dataset [69] and IMDb dataset [32]
  * question answering on SQuAD2.0 dataset [46]
  * multiple choice task on SWAG dataset [67], and
  * text summarization on CNN/DailyMail dataset [16]
* We find that
  * for a single machine fine tuning AutoFreeze can
    improve training time by up to 2.55× while affecting accuracy by < 0.1%
  * especially effective for large datasets like Yelp where
    * freezing layers reduces fine-tuning time from 52.5 hours to 27 hours and
      caching further reduces this to 24.6 hours
  * In distributed fine-tuning AutoFreeze can
    significantly improve training time and efficiency,
    reducing the end-to-end training time by 4.4× with the performance packing
    mode and
    reducing total cost by 5.03× when using the efficiency packing mode for
    fine tuning on the AG’s News dataset in a 64 GPU cluster

# 2 Motivation and Background

## 2.1 Model Fine-tuning

* periodic fine-tuning is a necessity for models deployed in production, since
  * data distribution changes quite frequently [57]
  * increased error rates from out of distribution(OOD) data points [26, 34]
    Periodically fine-tuning [57, 26, 72], making fine-tuning an extremely
* feature based transfer learning vs fine-tuning
  * feature based transfer learning is very popular in computer vision tasks
    [52, 19, 3, 63, 5], recent works  show that
  * LMs enjoy significantly better performance when using fine tuning [18, 43]

## 2.2 BERT Model Architecture and Timing

* by freezing a layer we mean freezing the entire transformer block

## 2.3 Existing Approaches

# 3 AutoFreeze Design

## 3.1 the scheme used to decide which layers to freeze 6

* insight is that layers which are closer to convergence can be frozen and
  by periodically inspecting the progress of each layer we can determine when a
  layer can be safely frozen
* We validate our intuition by using SVCCA [45]
  * SVCCA is a recently proposed metric for understanding convergence of neural
  * evaluates the similarity between two layers of neural network
* Raghu+ [45] perform a post-hoc analysis
  * calculate SVCCA score by comparing the each layer of the model during
    training with the layers of the converged model
  * We use the same IMDB dataset as before and compute the SVCCA scores by
    comparing each layer’s weights periodically (5 times every epoch)
  * results of this experiment are depicted in Figure 5. We observe
    * two main takeaways from this experiment in Figure 5. First, we see that
    * layers of the model converge in order
      * layers 0-4 reaching high SVCCA scores within one epoch. Second,
      * while some layers converge fast, others take significantly long time
* without knowing the final model weights. We next describe how we can use the
  gradient values at each layer to estimate this

### 3.1.1 Gradient Norm Test

* we accumulate gradients for each layer in the model (∆) and perform our
  test at fixed intervals (T )
  * gradient norm change for layer l: `η l = ∆_{T −1_l} − ∆_{T l} / ∆_{T −1_l}`
* rank the layers in the order of η l to determine the layer that is changing
* a layer to be frozen if all the layers preceding it are frozen and its rate
  of change is in the bottom N th percentile, where N is a tunable parameter

#### Comparison of Gradient Norm Test to SVCCA score

* In Figure 6, we evaluate the performance of our proposed gradient norm test
  * comparing it with the ideal SVCCA score based freezing scheme that has
* In the ideal scheme, we denote a layer as frozen if its SVCCA score compared
  to the final model weights is above a fixed threshold of 0.9
* In Figures 6a and 6b, we vary the percentile value used in Algorithm 1 and
  * N = median closely tracks the ideal freezing scheme
  * further evaluation of the effect of varying N in Section 4.3

## 3.2 How AutoFreeze can automatically cache intermediate outputs

## 3.3 Improve resource utilization in distributed settings

# 4 Evaluation 11

## 4.1 Datasets, hyper-parameters

## 4.2 Comparison with baselines 12

## 4.3 Freezing, Caching Benefits

## 4.4 Distributed Fine-tuning

## 4.5 Ablation Studies

# 5 Related Work

# 6 Conclusion

* While this paper mainly focused on BERT due to its popularity
* future: other domains like image classification or speech recognition
