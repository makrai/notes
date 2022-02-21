AutoFreeze: Automatically Freezing Model Blocks to Accelerate Fine-tuning
Yuhan Liu, Saurabh Agarwal, Shivaram Venkataraman
arXiv:2102.01386 [cs.LG]

* fine-tuning on models like BERT can take many hours even when using GPUs
  * prior work proposes limiting the number of layers that are fine-tuned, e.g.
    freezing all layers but the last layer
  * we find that such static approaches lead to reduced accuracy
* We propose, AutoFreeze, a system that uses
  * an adaptive approach to choose which layers are trained
    * accelerate model fine-tuning while preserving accuracy. We also develop
  * mechanisms to enable efficient caching of intermediate activations
    * reduce the forward computation time when performing fine-tuning
  * We extend AutoFreeze to perform distributed fine-tuning
  * two execution modes that minimize cost and running time respectively. Our
* evaluation on ten NLP tasks shows that AutoFreeze, with caching enabled, can
  improve fine-tuning on a single GPU by up to 2.55x
  * On a 64 GPU cluster, for fine-tuning on the AG's news dataset, AutoFreeze
    is able to achieve up to 4.38x speedup when optimizing for end-to-end
    training time and 5.03x reduction in total cost when optimizing for
    efficiency, without affecting model accuracy

# 1 Intro

* ways to reduce training time by maximizing throughput
  * data-parallel distributed training and improve utilization of
    * PyTorch DistributedDataParallel (DDP) [25] and BytePS [21]
     heterogeneous resources such as GPUs, CPUs, and network bandwidth
  * hybrid parallelism to
    improve model selection throughput and minimize synchronization bottlenecks
    * Cerebro [39] and PipeDream [40] utilize
* Even when using Pytorch DDP [25], we find that fine-tuning BERT for the
  sentiment classification task with the Yelp dataset [69] can take around 27
  hours in a four P100 GPU cluster
Each layer of the pre-trained model is computationally intensive (Section 2.2)
and requires a significant amount of time for forward and backward pass
* existing training systems are oblivious to [unaware of] the convergence
  properties of the fine-tuning workloads
  * given that fine tuning already starts from a pre-trained model,
    training systems need to be aware of the opportunities that arise from
    rapid convergence to achieve high throughput

* A natural approach to improve fine-tuning performance is to
  * limit the number of layers of the model that are updated, thus making it
  * Lee+ [24] trains a fixed number of blocks (e.g., the last 3 blocks) and
  * with the MRPC dataset [11] this approach can
    reduce the time for an epoch by 2×, but we find that
    the accuracy of the fine-tuned model suffers, dropping from 87% to 76.5%
* Chen+ [6]: “Lottery Ticket Hypothesis” to
  * identify matching subnetworks in pre-trained BERT models
    to enforce sparsity in models trained for different downstream tasks. While
  * retains accuracy and can lead to sparser models, it does
  * no improvements in speed without dedicated hardware or libraries [30]
* we propose a novel approach where
  * adaptively chosen during the fine-tuning process:
    * the number of model blocks that are updated and
      resources used during fine-tuning
  * inspired by SVCCA (Raghu+ [45]) who developed ,
    * a new metric that captures how different layers of model change over the
      course of training
    * computed by comparing the intermediate model weights with the final weigh
      * can thus be used for post-hoc analysis
  * we Applying that approach to model fine-tuning we observe that
  * the initial layers of the model converge rapidly and
    thus we can freeze such layers
    * the backward pass for those layers can be skipped, thereby reducing the
  * we still need an online algorithm that can decide which layers should be
    frozen and when
  * We develop a gradient-norm based test that
    ranks layers by their rate of change and based on it,
    selects the slowest changing layers for freezing
  * our method is effective at detecting when layers should be frozen
    without affecting accuracy across multiple datasets
* advantages of freezing early layers Beyond just
  * reducing the time for backward pass model
  * reduce the amount of communication required for distributed training.  For
    * eg freezing layers of BERT can save around 27MB per layer frozen 2 , thus
      reducing the synchronization required
  * can reduce the time for forward pass. Since the frozen layers don’t change
    * the output for a given data point will be constant for the frozen layers
    * cache the output of the forward pass up to the frozen layer
    * Once the same data point is selected to be used again for training, we
      can load the pre-computed intermediate values from our cache
* We design AutoFreeze, a system for automatically freezing layers to
  accelerate fine-tuning. Our system consists of
  * two main modules on each GPU: a
    * freezing module that has a pluggable decision engine that can
      make decisions on which layers should be frozen
      based on the aggregated gradients as training progresses
      * includes a decision engine that
        dynamically picks the amount of resources to use during fine-tuning. We
        * two modes that the user can choose from:
          Performance Packing for minimizing training time or
          Efficiency Packing for minimizing cost.  We also design a
    * storage manager module implement the caching functions described above
      * handles a number of common concerns in caching, including
        selecting the appropriate backend (CPU memory / SSD etc.) and
        deciding when to evict data from the cache
* We evaluate AutoFreeze using a wide range of fine-tuning tasks including
  * topic classification on the AG’s News dataset [69] and Sogou News [55]
  * sentiment analysis on Yelp Full dataset[69] and IMDb dataset[32]
  * question answering on SQuAD2.0 dataset[46]
  * multiple choice task on SWAG dataset[67], and
  * text summarization on CNN/DailyMail dataset [16]
* We find that
  * for a single machine fine tuning AutoFreeze can improve training time by up
    to 2.55× while affecting accuracy by less than 0.1%. We also show that
  * especially effective for large datasets like Yelp where
    * freezing layers reduces fine-tuning time from 52.5 hours to 27 hours and
      caching further reduces this to 24.6 hours
  * In distributed fine-tuning AutoFreeze can
    significantly improve training time and efficiency,
    reducing the end-to-end training time by 4.4× with the performance packing
    mode and
    reducing total cost by 5.03× when using the efficiency packing mode for
    fine tuning on the AG’s News dataset in a 64 GPU cluster
