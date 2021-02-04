Augmented SBERT: Data Augmentation Method for Improving Bi-Encoders 
  for Pairwise Sentence Scoring Tasks
Nandan Thakur, Nils Reimers, Johannes Daxenberger, Iryna Gurevych
arXiv:2010.08240 [cs.CL]

* two approaches for pairwise sentence scoring: 
  * Cross-encoders, which perform full-attention over the input pair, and
    * often achieve higher performance, they are too slow for many practical use cases. 
  * Bi-encoders, which map each input independently to a dense vector space.
    * require substantial training data and fine-tuning over the target task to
* We present a simple yet efficient data augmentation strategy called Augmented
  * we use the cross-encoder to label a larger set of input pairs to augment the
    training data for the bi-encoder
  * selecting the sentence pairs is non-trivial and crucial for the success of
  * evaluate our approach compared to the original bi-encoder performance
    * multiple tasks (in-domain) as well as on a 
      * improvement of up to 6 points for in-domain
    * domain adaptation task, up to 37 points
