Chain-of-Thought Prompting Elicits Reasoning in Large Language Models
Jason Wei, Xuezhi Wang, Dale Schuurmans, Maarten Bosma, Brian Ichter, Fei Xia,
  Ed Chi, Quoc Le, Denny Zhou
arXiv:2201.11903 [cs.CL]

* a chain of thought -- a series of intermediate reasoning steps --
* significantly improves the ability of large language models to perform
  complex reasoning. In particular, we show how such reasoning abilities emerge
* simple method called chain of thought prompting, where
  a few chain of thought demonstrations are provided as exemplars in prompting.
* Experiments on three large language models show that chain of thought
  * improves performance
  * tasks: arithmetic, commonsense, and symbolic reasoning tasks, on a range of
* eg prompting a 540B-parameter language model with just eight chains of thought
  * SOTA accuracy on the GSM8K benchmark of math word problems,
  * surpassing even finetuned GPT-3 with a verifier.
