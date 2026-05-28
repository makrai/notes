Recursive Language Models
Alex L. Zhang, Tim Kraska, Omar Khattab
arXiv:2512.24601 [cs.AI]

* process arbitrarily long prompts through the lens of inference-time scaling.
* We propose Recursive Language Models (RLMs), a general 
* inference paradigm that treats long prompts as part of an external
  environment and allows the 
* LLM to programmatically examine, decompose, and recursively call itself over
  snippets of the prompt. We find that 
* successfully process inputs up to two orders of magnitude beyond model
  context windows and, 
* even for shorter prompts, dramatically outperform the quality of vanilla
  frontier LLMs and common long-context and coding scaffolds (eg on GPT-5
  by a median across the evaluated benchmarks of 26% against compaction, 130%
  against CodeAct with sub-calls, and 13% against Claude Code) across four
  diverse long-context tasks while having comparable cost. At a 
* small scale, we post-train the first model around the RLM. Our model,
  RLM-Qwen3-8B, outperforms the underlying Qwen3-8B model by 28.3% on average
  * approaches the quality of vanilla GPT-5 on three long-context tasks. Code
