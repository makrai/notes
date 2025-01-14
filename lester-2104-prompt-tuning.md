The Power of Scale for Parameter-Efficient Prompt Tuning
Brian Lester, Rami Al-Rfou, Noah Constant
EMNLP 2021 arXiv:2104.08691 [cs.CL]

# Abstract

* "prompt tuning", a simple yet effective mechanism for learning "soft prompts"
  to condition frozen language models to perform specific downstream tasks
  * learned through backpropagation and
    can be tuned to incorporate signal from any number of labeled examples
* outperforms GPT-3's "few-shot" learning by a large margin
* prompt tuning becomes more competitive with scale
  * ablations on model size using T5 show
  * as models exceed Bs of parameters, our method "closes the gap" and matches
    the strong performance of model tuning (where all model weights are tuned)
* reusing one frozen model for multiple downstream tasks can ease the burden
* a simplification of the recent "prefix tuning" of Li & Liang (2021)
  * we provide a comparison to this and other similar approaches
* benefits in robustness to domain transfer, as compared to full model tuning
