Experiments on Parallel Training of Deep Neural Network using Model Averaging
Hang Su, Haoyu Chen
Cite as: 	arXiv:1507.01239 [cs.LG]

# Abstract

* we apply model averaging to parallel training of deep neural network (DNN)
  Parallelization is done in a model averaging manner
* Data is partitioned and distributed to different nodes for local model
  updates, and model averaging across nodes is done every few minibatches
* multiple GPUs for data parallelization, and
* Message Passing Interface (MPI) for communication between nodes, which
  * allows us to perform model averaging frequently
    without losing much time on communication
* We investigate the effectiveness of Natural Gradient Stochastic Gradient
  Descent (NG-SGD) and Restricted Boltzmann Machine (RBM) pretraining for
  parallel training in model-averaging framework, and
* we explore the best setups in term of different
  learning rate schedules, averaging frequencies and minibatch sizes
* results: NG-SGD and RBM pretraining benefits parameter-averaging based train
* On the 300h Switchboard dataset, a
  * 9.3 times speedup is achieved using 16 GPUs and
  * 17 times speedup using 32 GPUs with limited decoding accuracy loss
