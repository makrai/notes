Jamba: A Hybrid Transformer-Mamba Language Model
O Lieber, B Lenz, H Bata, G Cohen, J Osin, I Dalmedigos, E Safahi, S Meirom,
  M Gokhman, A Manevich, N Ratner, N Rozen, E Shwartz, M Zusman, Y Shoham
arXiv:2403.19887 [cs.CL]

* We present Jamba, a new base large language model based on a novel
* hybrid Transformer-Mamba mixture-of-experts (MoE) architecture
  * interleaves blocks of Transformer and Mamba layers, enjoying the benefits
  * MoE is added in some of these layers to increase model capacity while
    keeping active parameter usage manageable
  * allows resource- and objective-specific configurations
* a model that fits in a single 80GB GPU
* at a large scale
  * high throughput and small memory compared to vanilla Transformers
  * SOTA on standard language model benchmarks and long-context evaluations
  * strong results for up to 256K tokens context length
* We study various architectural decisions, such as how to
  * combine Transformer and Mamba layers, and how to
  * mix experts, and show that
  * some of them are crucial in large scale modeling
* We also describe several interesting props of training and evaluation of Jamba
* we plan to release checkpoints from various ablation runs
* weights of our implementation of Jamba publicly available, permissive license
