Pruning Redundant Mappings in Transformer Models via Spectral-Normalized Identity Prior
Zi Lin, Jeremiah Zhe Liu, Zi Yang, Nan Hua, Dan Roth
Findings of EMNLP 2020

* Traditional (unstructured) pruning methods for a Transformer model focus on
  regularizing the individual weights by penalizing them toward zero. In this
* we explore spectral-normalized identity priors (SNIP),
  * a structured pruning approach that
  * penalizes an entire residual module in a Transformer model
    toward an identity mapping. Our method
  * identifies and discards unimportant non-linear mappings in the residual con
    by applying a thresholding operator on the function norm. It is
  * applicable to any structured module, including a
    single attention head, an entire attention block, or a feed-forward subnetw
* we introduce spectral normalization
  to stabilize the distribution of the post-activation values of the
  Transformer layers
  * further improving the pruning effectiveness of the proposed methodology. We
* experiments with BERT on 5 GLUE benchmark tasks
  * SNIP achieves effective pruning results while maintaining comparable
    performance
  * Specifically, we improve the performance over the SOTA by 0.5 to 1.0% on
    average at 50% compression ratio
