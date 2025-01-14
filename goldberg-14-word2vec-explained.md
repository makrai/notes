word2vec Explained: Deriving Mikolov+’s Negative-Sampling Word-Embedding Method
Yoav Goldberg and Omer Levy
arXiv:1402.3722

# [no title]

* This note is an attempt to explain
  equation (4) (negative sampling) in Mikolov (2013 Distributed)

## Remarks

* Unlike the Skip-gram model described above,
  the negative sampling formulation does not model p(c|w) but instead
  models a quantity related to the joint distribution of w and c
* If we fix the words representation and learn only the contexts repr,
  or fix the contexts representation and learn only the word representations,
  the model reduces to logistic regression, and is convex
  * hE in this model the words and contexts representations are learned
    jointly, making the model non-convex
