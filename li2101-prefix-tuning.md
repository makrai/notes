Prefix-Tuning: Optimizing Continuous Prompts for Generation
Xiang Lisa Li, Percy Liang
arXiv:2101.00190 [cs.CL]

* prompt tuning [14] and prefix tuning [29] concatenate learned continuous
  embeddings to the model’s input or activations to induce it for a task;

# Abstract

* Fine-tuning is the de facto way to leverage large pretrained language models
  * modifies all the language model parameters ~>
  * necessitates storing a full copy for each task
* we propose prefix-tuning
  * a lightweight alternative to fine-tuning for natural language generation
  * keeps language model parameters frozen, but
  * optimizes a small continuous task-specific vector (called the prefix)
  * inspiration from prompting
  * allowing subsequent tokens to attend to this prefix: "virtual tokens"
* We apply prefix-tuning to
  * GPT-2 for table-to-text generation and to BART for summarization
  * full data: comparable performance by learning only 0.1% of the params
  * low-data settings outperforms fine-tuning
    * prefix-tuning extrapolates better to examples with unseen topics
