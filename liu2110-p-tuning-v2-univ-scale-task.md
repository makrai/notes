P-Tuning v2: Prompt Tuning Can Be Comparable to Fine-tuning
  Universally Across Scales and Tasks
Xiao Liu, Kaixuan Ji, Yicheng Fu, Weng Lam Tam, Zhengxiao Du, Zhilin Yang,
  Jie Tang
ACL 2022 arXiv:2110.07602 [cs.CL]

https://github.com/THUDM/P-tuning-v2

# Abstract

* Prompt tuning, which only tunes continuous prompts with a frozen LM
  * substantially reduces per-task storage and memory usage at training
  * hE, in NLU, it does not perform well for normal-sized pretrained models
    * existing methods of prompt tuning cannot handle hard seq labeling tasks
* we P-Tuning v2: properly optimized prompt tuning can be universally effective
  across a wide range of model scales and NLU tasks
  * matches the performance of finetuning with only 0.1%-3% tuned parameters
  * an implementation of Deep Prompt Tuning \cite{li2021prefix,qin2021learning}
    optimized and adapted for NLU
  * universality and simplicity: a strong baseline, an alternative to finetuning
