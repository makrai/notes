Diverse Beam Search: Decoding Diverse Solutions from Neural Sequence Models
AK Vijayakumar, M Cogswell, RR Selvaraju, Q Sun, S Lee, D Crandall, D Batra
AAAI 2018 arXiv:1610.02424 [cs.AI]

* beam search (BS) as an approximate inference algorithm to decode output
  * explores the search space in a greedy left-right fashion retaining only the
    top-B candidates resulting in sequences that differ only slightly from
    each other. Producing lists of nearly identical sequences is not only
    computationally wasteful but also typically
  * fails to capture the inherent ambiguity of complex AI tasks. To overcome
* we propose Diverse Beam Search (DBS), an alternative to BS that decodes a list
  * finds better top-1 solutions by controlling for the exploration and
    exploitation of the search space implying that DBS is a better search
  * minimal computational or memory overhead as compared to beam search. To
* results on image captioning, machine translation and visual question
  generation using both standard quantitative metrics and qualitative human stud
* we study the role of diversity for image-grounded language generation tasks as
  the complexity of the image changes. We observe that our method consistently

## 5.1 Sensitivity analysis and effect of diversity functions

### Number of Groups (G)

* extremes
  * G=B allows for the maximum exploration of the space, while setting
  * G=1 reduces our method to BS, resulting in increased exploitation of the
    search-space around the 1-best decoding. Thus, increasing the number of
* Empirically, we find that maximum exploration correlates with improved oracle
  accuracy and hence use G=B to report results unless mentioned otherwise

### Diversity Strength (λ)

* specifies the trade-off between the joint log-probability and the diversity
  terms
  * higher value of λ produces a more diverse list
    * hE, excessively high values of λ can overpower model probability and
      result in grammatically incorrect outputs
* grid search on the validation set for all experiments
* a wide range of λ values (0.2 to 0.8) work well for most tasks and datasets
