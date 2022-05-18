EXT5: Towards extreme multi-task scaling for transfer learning
V Aribandi, Y Tay, T Schuster, J Rao, H Steven Zheng, S Vaibhav Mehta,
  H Zhuang, V Q. Tran, D Bahri, J Ni, J Gupta, K Hui, S Ruder, D Metzler
ICLR 2022

# ABSTRACT

* recent success of multi-task learning and transfer learning for NLP,
* few works have systematically studied the effect of
  scaling up the number of tasks during pre-training
* we introduce EX MIX (Extreme Mixture): a massive collection of 107 supervised
  NLP tasks across diverse domains and task-families
  * study the effect of multi-task pre-training at the largest scale to date,
  * analyze co-training transfer amongst common families of tasks
* manually curating an ideal set of tasks for multi-task pre-training is not
  straightforward
* multi-task scaling can vastly improve models on its own
* we propose EXT5: a model pre-trained using a multi-task objective of
  self-supervised span denoising and supervised EX MIX
  * experiments, we show that EX T5 outperforms strong T5 baselines
    on SuperGLUE, GEM, Rainbow, Closed-Book QA tasks, and
    several tasks outside of EX MIX
  * also significantly improves sample efficiency while pre-training

# 1 Intro

* we propose ExT5:
  * T5 model (Raffel+ 2020) pre-trained on
    a mixture of supervised ExMix and self-supervised C4 span denoising
* outperforms SOTA T5 models on
  * well-established benchmarks eg
    * SuperGLUE (Wang+ 2019a)
    * GEM (Gehrmann+ 2021)
    * Rainbow (Lourie+ 2021)
  * Closed-Book QA (Roberts+ 2020) tasks
  * including ExMix may reduce the number of pre-training steps required to
    achieve strong performance,
    bringing about substantial sample efficiency benefits
