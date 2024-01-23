MultiCQA: Zero-Shot Transfer of Self-Supervised Text Matching Models
  on a Massive Scale
Andreas Rücklé, Jonas Pfeiffer, Iryna Gurevych
EMNLP-2020 arXiv:2010.00980 [cs.CL]

# Abstract

* We study the zero-shot transfer capabilities of text matching models on a
  massive scale, by
  self-supervised training on 140 source domains from community question
  answering forums in English
* We investigate the model performances on nine benchmarks of answer selection
  and question similarity tasks, and show that
  all 140 models transfer surprisingly well, where
  the large majority of models substantially outperforms common IR baselines.
  * considering a broad selection of source domains is crucial for obtaining
    the best zero-shot transfer performances, which
    * contrasts the standard procedure that merely relies on the largest and
      most similar domains. In
* we extensively study how to best combine multiple source domains
  * We propose to incorporate self-supervised with supervised multi-task
    learning on all available source domains
  * Our best zero-shot transfer model considerably outperforms in-domain BERT
    and the previous SOTA on six benchmarks
  * Fine-tuning of our model with in-domain data results in additional large
    gains and achieves the new SOTA on all nine benchmarks

# 1 Intro

* We utilize the
  * training method provided by Rücklé+ (2019b) and train
  * adapter modules (Rebuffi+ 2017; Houlsby+ 2019) within BERT (Devlin+ 2019)
    for each of the 140 English StackExchange forums
    * Sylvestre-Alvise Rebuffi, Hakan Bilen, and Andrea Vedaldi
      NeurIPS 2017
      Learning multiple visual domains with residual adapters
    * Houlsby, Giurgiu, Jastrzkebski, Morrone, de Laroussilhe, al, Gelly
      Parameter-efficient transfer learning for NLP
      ICML 2019
    * Adapters considerably reduce storage requirements by training
      only a small number of additional parameters while
      keeping the pre-trained BERT weights fixed. In our extensive analysis, we
* results: on six benchmarks all 140 models outperform common IR baselines
* revisit and analyze the traditional strategy of leveraging large data sets
  from intuitively similar domains to train models for zeroshot transfer. We
  establish that neither training data size nor domain similarity are suitable
  for predicting the best models, stressing the need for more elaborate
  strategies to identify suitable training tasks. This also demonstrates that
  considering a broad selection of source domains is crucial, which contrasts
  the standard practice of merely relying on the most similar or largest ones

## 3.3 Models and Training

### Adapters

* To reduce the storage requirements, and to efficiently distribute our models
  to the community, we train adapters (Houlsby+ 2019; Rebuffi+ 2017) instead of
  full fine-tuning for our 140 single-domain BERT models
* Adapters share the parameters of a large pre-trained model— in our case BERT—
  and introduce a small number of task-specific parameters
* transform the intermediate representations in every BERT layer to the
  training task while keeping the pre-trained model itself unchanged
* recent architecture of Pfeiffer+ (2020a) 
  * we investigate their adapter combination technique AdapterFusion in §5
  * J Pfeiffer, A Kamath, A Rücklé, K Cho, I Gurevych
    2020a arXiv preprint arXiv:2005.00247
    AdapterFusion: Non-destructive task composition for transfer learning
  * In preliminary experiments, we find that using adapters in contrast to full
    model fine-tuning does not decrease the model performance while drastically
    reducing the number of parameters (one model is ∼5 MB)

# 5 Zero-Shot Transfer from Combinations of Multiple Domains

## 5.1 Setup

* we (2) combine knowledge from our domain adapters (§4) with
  AdapterFusion (AF; Pfeiffer+ 2020a). This learns
  * a weighted combination of multiple (fixed) adapters in each BERT layer and
  * typically trained on the target task. We adapt this approach to our
    zero-shot setup and train it with multi-task learning as above

# 7 Conclusoin

* future
  * combining our approach with additional pre-training objectives eg the
    Inverse Cloze Task (Chang+ 2020) could substantially increase the amount of
    training data for the large quantity of smaller forums
  * Researchers could also use our 140 domain-specific adapters and investigate
    further combination techniques to make them even more broadly applicable
