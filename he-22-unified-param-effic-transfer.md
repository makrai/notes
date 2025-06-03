Towards a Unified View of Parameter-Efficient Transfer Learning
Junxian He, Chunting Zhou, Xuezhe Ma, Taylor Berg-Kirkpatrick, Graham Neubig
ICLR 2022

# Abstract

* Fine-tuning large pretrained language models on downstream tasks has become
  * conventional approaches fine-tune all the parameters of the pretrained mod
  * prohibitive as the model size and the number of tasks grow.  Recent work
  * parameter-efficient transfer learning methods that
    only fine-tune a small number of (extra) parameters to attain strong perf
  * hE poorly understood
    * the critical ingredients for success and
    * the connections among the various methods are
* we break down the design of SOTA parameter-efficient transfer learning
  * a unified framework that establishes connections between them
  * we re-frame them as modifications to specific hidden states in pretrained
  * we define a set of design dimensions along which different methods vary, eg
    * the function to compute the modification and
    * the position to apply the modification
* comprehensive empirical studies across machine translation, text
  summarization, language understanding, and text classification benchmarks, we
  * we identify important design choices in previous methods
  * unified framework enables the transfer of design elements across approachs
  * new parameter-efficient fine-tuning methods that tune
    less parameters than previous methods while being more effective, achieving
    comparable results to fine-tuning all parameters on all four tasks

# 1 Intro

* Transfer learning from pre-trained language models (PLMs) is now the
