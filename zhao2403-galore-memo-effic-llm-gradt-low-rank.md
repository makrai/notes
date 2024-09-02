GaLore: Memory-Efficient LLM Training by Gradient Low-Rank Projection
Jiawei Zhao, Zhenyu Zhang, Beidi Chen, Zhangyang Wang, Anima Anandkumar,
  Yuandong Tian
ICML 2024 (Oral) arXiv:2403.03507 [cs.LG]

# Abstract

* Training Large Language Models (LLMs) presents significant memory challenges,
  predominantly due to the growing size of weights and optimizer states. Common
* memory-reduction approaches, such as low-rank adaptation (LoRA), 
  * add a trainable low-rank matrix to the frozen pre-trained weight in each
    layer, reducing trainable parameters and optimizer states. However, such
  * hE underperform training with full-rank weights
    in both pre-training and fine-tuning stages 
    since 
    * they limit the parameter search to a low-rank subspace and alter the
      training dynamics, and further, 
    * may require full-rank warm start. In this work, 
* we propose Gradient Low-Rank Projection (GaLore), a training strategy that
  allows full-parameter learning but is more memory-efficient than common
  low-rank adaptation methods such as LoRA. Our approach 
  * reduces memory usage by up to 65.5% in optimizer states while maintaining
    both efficiency and performance for 
    * pre-training on LLaMA 1B and 7B architectures with C4 dataset with up to
      19.7B tokens, and on 
    * fine-tuning RoBERTa on GLUE tasks. Our 8-bit GaLore further 
  * reduces optimizer memory by up to 82.5% and total training memory by 63.3%,
    compared to a BF16 baseline.
  * pre-training a 7B model on consumer GPUs with 24GB memory (eg NVIDIA RTX
    4090) without model parallel, checkpointing, or offloading strategies. 
