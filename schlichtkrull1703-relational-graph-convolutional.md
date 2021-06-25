Modeling Relational Data with Graph Convolutional Networks
Michael Schlichtkrull, Thomas N. Kipf, Peter Bloem, Rianne van den Berg, Ivan Titov, Max Welling
arXiv:1703.06103 [stat.ML]

* We introduce Relational Graph Convolutional Networks (R-GCNs) and
* apply them to two standard knowledge base completion tasks:
  * Link prediction (recovery of missing facts, i.e. subject-predicate-object)
  * entity classification (recovery of missing entity attributes).  R-GCNs are
* factorization models for link prediction such as DistMult can be significantly
  improved by enriching them with an encoder model to accumulate evidence over
  multiple inference steps in the relational graph, demonstrating a large
  improvement of 29.8% on FB15k-237 over a decoder-only baseline

# 7 Conclusion

* future: ComplEx (Trouillon+ 2016), better suited for asymmetric relations. It
* integrate entity features in R-GCNs, which would be beneficial both for link
* for scalability: subsampling techniques, such as in Hamilton+ (2017).  Lastly,
* replace the current form of summation over neighboring nodes and relation
  types with a data-dependent attention mechanism
* Beyond modeling knowledge bases, R-GCNs can be generalized to other
  applications where relation factorization models have been shown effective
  (e.g. relation extraction)
