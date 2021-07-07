Understanding Multi-Head Attention in Abstractive Summarization
Joris Baan, Maartje ter Hoeve, Marlies van der Wees, Anne Schuth, Maarten de Rijke
arXiv:1911.03898 [cs.CL]

# Abstract

* no intuitive alignment role, such as in machine translation. 
* We first introduce three metrics to gain insight in the focus of attention
* heads specialize towards relative positions, specific POS tags, and NEs
* hE, ablating and pruning these heads does not lead to a significant drop in
* By replacing the softmax activation functions with sparsemax activation
  functions, we find that attention heads behave seemingly more transparent:
  we can ablate fewer heads and heads score higher on our interpretbty metrics
* if we apply pruning to the sparsemax model we find that we can prune even more
  heads, raising the question whether enforced sparsity actually improves
  transparency. Finally, we find that 
* relative positions heads seem integral to summarization performance and
  persistently remain after pruning. 
