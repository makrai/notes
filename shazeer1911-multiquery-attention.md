Fast Transformer Decoding: One Write-Head is All You Need
Noam Shazeer
arXiv:1911.02150 [cs.NE]

# Abstract

* Multi-head attention layers, as used in the Transformer sequence model, are a
  * powerful alternative to RNNs for moving information across and between seqs
  * training these layers is generally fast and simple,
    due to parallelizability across the length of the sequence,
  * hE incremental inference (where such paralleization is impossible) is slow,
    * due to the memory-bandwidth cost of repeatedly loading the large "keys"
      and "values" tensors
* We propose a variant called multi-query attention, where
  * the keys and values are shared across all of the different attention heads,
    greatly reducing the size of these tensors and hence the memory bandwidth
    requirements of incremental decoding
* experimentally that the resulting models can indeed be
  * much faster to decode, and incur [magával von]
  * only minor quality degradation from the baseline
