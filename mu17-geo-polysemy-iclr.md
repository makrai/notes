Geometry of polysemy
Jiaqi Mu, Suma Bhat, Pramod Viswanath
2017 ICLR

https://github.com/jiaqimu2/polysemy
When dealing with a training corpus, please chunk a large corpus into smaller
files to avoid memory overflow

* a sentence containing a target word is ... represented by a low rank
  subspace, instead of a point in a vector space
* subspaces associated with a particular sense of the target word tend to
  intersect over a line (one-dimensional subspace), which we use to
  disambiguate senses using a clustering algorithm that harnesses the
  Grassmannian geometry of the representations. The disambiguation algorithm,
  which we call K-Grassmeans, leads to a procedure to label the different
  senses of the target word in the corpus
* we validate our algorithms on standard sense induction and disambiguation
  datasets and present new state-of-the-art results
