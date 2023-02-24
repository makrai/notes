The Lottery Ticket Hypothesis for Pre-trained BERT Networks
Tianlong Chen, J Frankle, Shiyu Chang, Sijia Liu, Yang Zhang, Z Wang, M Carbin
NeurIPS 2020

Codes available at https://github.com/VITA-Group/BERT-Tickets

# Abstract

* In NLP, enormous pre-trained models like BERT have become the standard
  starting point for training on a range of downstream tasks, and
  * similar trends are emerging in other areas of deep learning
* work on the lottery ticket hypothesis has shown that
  models for NLP and computer vision contain smaller matching subnetworks
  capable of training in isol to full accuracy and transferring to other tasks
* we combine these observations to assess
  whether such trainable, transferrable subnetworks exist in pre-trained BERT
  * For a range of downstream tasks, we indeed find matching subnetworks at
    40% to 90% sparsity
  * We find these subnetworks at (pre-trained) initialization, a deviation from
    prior NLP research where they emerge only after some amount of training
  * ?find subnetworks with which objective
    * Subnetworks found on the MLM task transfer universally
      * (the same task used to pre-train the model)
    * those found on other tasks transfer in a limited fashion if at all
* ie the main lottery ticket observations remain relevant in large-scale
  pre-training

# 1 Introduction

* substantial ML research energy to scaling neural networks to enormous sizes
  * Parameter-counts measured in billions rather than millions [1–3]
  * time and financial outlay necessary to train these models growing [4]
  * trend especially pronounced in NLP, where
    * massive BERT models are standard for a variety of downstream tasks [6, 7]
  * vision: Self-supervised pre-training is also growing in popularity [8, 9]
  * Self-supervised pre-trainingmay again become a standard practice across
    deep learning as it was in the past (Erhan+ 2010)
  [10] D Erhan, Y Bengio, A Courville, P-Antoine Manzagol, P Vincent, S Bengio
  Why does unsupervised pre-training help deep learning? 
  Journal of Machine Learning Research, 11(Feb):625–660, 2010
* training smaller subnetworks without sacrificing performance [11–16]
  * lottery ticket hypothesis (LTH) [16] demonstrated that small-scale networks
    for computer vision contain sparse, matching subnetworks [17]
    capable of training in isolation from initialization to full accuracy
    * ie we could have trained smaller networks from the start
      if only we had known which subnetworks to choose
* two key themes have emerged:
  * Initialization via pre-training
    * In larger-scale settings for computer vision and NLP [17–19], the
      LM methodology can only find matching subnetworks at an early point in
      training rather than at random initialization
    * Prior to this point, these subnetworks = pruning randomly
    * The phase of training prior to this point can be seen as dense
      pre-training that creates an initialization amenable to sparsification
    * This pre-training can even occur using a self-supervised task
      rather than the supervised downstream task [20, 21]
  * Transfer learning
    * Finding matching subnetworks with the lottery ticket method is expensive
    * LT entails training the unpruned network to completion,
      pruning unnecessary weights, and rewinding the unpruned weights
      back to their values from an earlier point in training [16]
    * costlier than simply training the full network, and,
      for best results, it must be repeated many times iteratively
    * nL the resulting subnetworks transfer between related tasks [22–24]
  * These two themes are also the signature attributes of BERT models:
    * If we treat the pre-trained weights as our initialization,
    * are there matching subnetworks for each downstream task? 
    * Do they transfer to other downstream tasks?
    * Are there universal subnetworks that can transfer to many tasks
      with no degradation in performance?
* lottery ticket hypoth evaluated in NLP [18, 19] and transformers [18, 25]
* we: LTH in the context of pre-trained BERT models
  * concurrently Prasanna+ [26] also examines the LTH for BERTs
    * differences in the questions we consider and our results: sec 2
  * we investigate how the transformer architecture and the initialization
    resulting from the lengthy BERT pre-training regime behave
    in comparison to existing lottery ticket results
  * We devote particular attention to the transfer behavior of the subnetworks
    * we search for universal subnetworks that can reduce the cost of
      fine-tuning on downstream tasks going forward
* findings:
  * Using unstructured magnitude pruning, we find matching subnetworks at
    between 40% and 90% sparsity in BERT models on standard GLUE and SQuAD
    * Unlike previous work in NLP, we find these subnetworks at (pre-trained)
      initialization rather after some amount of training
      * As in previous work, these subnetworks outperform those
        found by pruning randomly and randomly reinitializing
    * On most downstream tasks, these subnetworks not transfer to other tasks,
      meaning that the matching subnetwork sparsity patterns are task-specific
  * Subnetworks at 70% sparsity found using the masked language modeling task
    (the task used for BERT pre-training) are universal and
    transfer to other tasks while maintaining accuracy
* ie the lottery ticket observations extend to BERT models with a pre-trained
  initialization
  * the biggest caveat of prior work disappears
    * ie in larger-scale settings,
      matching subnetworks could only be found early in training
  * there are indeed universal subnetworks that could replace the full BERT
    without inhibiting transfer
  * the lottery ticket observations—and the tantalizing possibility that we can
    train smaller networks from the beginning—hold for pre-training algorithms
    * increasingly central in NLP and other areas of deep learning [8, 9]
