FlashAttention: Fast and Memory-Efficient Exact Attention with IO-Awareness
Tri Dao, Daniel Y. Fu, Stefano Ermon, Atri Rudra, Christopher Ré
arXiv:2205.14135 [cs.LG]

# Abstract

* Transformers are slow and memory-hungry on long sequences, since the
  * time and memory complexity of self-attention are quadratic in sequence len
  * Approximate attention methods have attempted to address this problem by
    * often do not achieve wall-clock speedup. We argue that a missing
* we: making attention algorithms IO-aware -- accounting for
  reads and writes between levels of GPU memory. We propose
  * FlashAttention, an IO-aware exact attention algorithm that uses
  * tiling to reduce the number of memory reads/writes
    between GPU high bandwidth memory (HBM) and GPU on-chip SRAM.  We analyze
  * IO complexity: requires fewer HBM accesses than standard attention, and is
    optimal for a range of SRAM sizes
* We also extend FlashAttention to block-sparse attention, yielding an
  approximate attention algorithm that is faster than any existing approximate
  attention method
* 15% end-to-end wall-clock speedup on BERT-large (seq. length 512) compared to
  the MLPerf 1.1 training speed record,
* 3× speedup on GPT-2 (seq.  length 1K), and
* 2.4× speedup on long-range arena (seq. length 1K-4K)
* FlashAttention and block-sparse FlashAttention enable
* longer context in Transformers, yielding
* higher quality models
    * 0.7 better perplexity on GPT-2 and
    * 6.4 points of lift on long-document classification) and entirely
* new capabilities: the first Transformers to achieve better-than-chance
  performance on the Path-X challenge (seq. length 16K, 61.4% accuracy) and
  Path-256 (seq. length 64K, 63.1% accuracy)
