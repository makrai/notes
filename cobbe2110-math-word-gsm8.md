Training Verifiers to Solve Math Word Problems
Karl Cobbe, Vineet Kosaraju, Mohammad Bavarian, Mark Chen, Heewoo Jun,
  L Kaiser, M Plappert, J Tworek, J Hilton, R Nakano, C Hesse, J Schulman
Cite as: 	arXiv:2110.14168 [cs.LG]

* SOTA language models can match human performance on many tasks, but they
  still struggle to robustly perform multi-step mathematical reasoning. To
* we introduce GSM8K, a dataset of
  8.5K high quality linguistically diverse grade school math word problems
* We find that even the largest transformer models fail to achieve high perf,
* To increase performance, we propose training
  verifiers to judge the correctness of model completions
  * At test time, we generate many candidate solutions and select the one
    ranked highest by the verifier
  * significantly improves performance on GSM8K, and we provide strong
  * scales more effectively with increased data than a finetuning baseline
