Simple linear attention language models balance the recall-throughput tradeoff
Simran Arora, Sabri Eyuboglu, Michael Zhang, Aman Timalsina, Silas Alberti, Dylan Zinsley, James Zou, Atri Rudra, Christopher Ré
arXiv:2402.18668 [cs.CL]

https://github.com/HazyResearch/based

* attention-based language models excel at recall, the ability to ground
  generations in tokens previously seen in context. However,
* hE their efficiency is bottle-necked during inference by the KV-cache's
  aggressive memory consumption. In this work,
* we explore whether we can improve language model efficiency (eg by reducing
  memory consumption) without compromising on recall. By
  * we apply experiments and theory to a broad set of architectures, we
  * a key tradeoff between a model's state size and recall ability. We show
  * efficient alternatives to attention (eg H3, Mamba, RWKV) maintain a
    fixed-size recurrent state, but struggle at recall
  * We propose BASED a simple architecture combining linear and sliding window
    attention
  * By varying BASED window size and linear attention feature dimension, we
    can dial the state size and traverse the pareto frontier of the
    recall-memory tradeoff curve, recovering
    * the full quality of attention on one end and
    * the small state size of attention-alternatives on the other
* We train language models up to 1.3b parameters and show that BASED
  * matches the strongest sub-quadratic models (eg Mamba) in perplexity
  * outperforms them on real-world recall-intensive tasks by 6.22 accuracy
* Implementations of linear attention are often less efficient than optimized
  standard attention implementations. To make BASED competitive,
  * we develop IO-aware algorithms that enable 24x higher throughput on
    language generation than FlashAttention-2, when generating 1024 tokens
    using 1.3b parameter models
