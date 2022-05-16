Under review as a conference paper at ICLR 2022
EXT5: Towards extreme multi-task scaling for transfer learning

ABSTRACT

* recent success of multi-task learning and transfer learning for NLP,
* few works have systematically studied the effect of
  scaling up the number of tasks during pre-training. Towards this goal, this
* we introduce EX MIX (Extreme Mixture): a massive collection of 107 supervised
  NLP tasks across diverse domains and task-families. Using EX MIX , we study
  the effect of multi-task pre-training at the largest scale to date, and
  analyze co-training transfer amongst common families of tasks. Through this
* manually curating an ideal set of tasks for multi-task pre-training is not
  straightforward, and that
* multi-task scaling can vastly improve models on its own
* we propose EXT5: a model pre-trained using a multi-task objective of
  self-supervised span denoising and supervised EX MIX . Via extensive
  * experiments, we show that EX T5 outperforms strong T5 baselines
    on SuperGLUE, GEM, Rainbow, Closed-Book QA tasks, and
    several tasks outside of EX MIX
  * also significantly improves sample efficiency while pre-training

# 1 Intro

* we propose ExT5:
  * T5 model (Raffel+ 2020) pre-trained on
    a mixture of supervised ExMix and self-supervised C4 span denoising. ExT5
* outperforms state-of-the-art T5 models on
  * well-established benchmarks such
    * SuperGLUE (Wang+ 2019a)
    * GEM (Gehrmann+ 2021)
    * Rainbow (Lourie+ 2021); as well as
  * Closed-Book QA (Roberts+ 2020) tasks.  Notably, our experimental findings
  * including ExMix may reduce the number of pre-training steps required to
    achieve strong performance,
    bringing about substantial sample efficiency benefits
