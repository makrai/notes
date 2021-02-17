Adaptive Joint Learning of Compositional and Non-Compositional Phrase Embeddings
Kazuma Hashimoto, Yoshimasa Tsuruoka
arXiv:1603.06067 [cs.CL] ACL

* by adaptively weighting both types of embeddings
  using a compositionality scoring function. The scoring function is used to
  quantify the level of compositionality of each phrase, and the
* parameters of the [compositionality] function are jointly optimized with the
  objective for learning phrase embeddings. In
* experiments: embeddings of transitive verb phrases, and show that the
  * compositionality scores have strong correlation with human ratings for VO
  * substantially outperforming the previous state of the art. Moreover, our
  * improve upon the previous best model on a transitive verb disambiguation
  * simple ensemble technique further improves the results for both tasks.

## 3,1

* Acquisition of selectional preference using embeddings has been widely studied
  * word and/or phrase embeddings are learned based on syntactic links
  (Bansal+ 2014; Hashimoto and Tsuruoka, 2015; Levy and Goldberg, 2014;
  Van de Cruys, 2014)
  * word (or phrase) prediction using (syntactic) contexts
