Incorporating Subword Information into Matrix Factorization Word Embeddings
Alexandre Salle and Aline Villavicencio
naacl 2018

implementation of subword LexVec ... at https://github.com/alexandres/lexvec

# Abstract

* We evaluate the impact of different types of subwords
  (n-grams and un- supervised morphemes), with
* results confirming the importance of subword information

# Introduction

* Popular counting models include PPMI-SVD (Levy et al., 2014),
  GloVe (Pennington et al., 2014), and LexVec (Salle et al., 2016b)
* fastText (Bojanowski et al., 2017) addresses these issues
  * representing a word by the sum of a unique vector and a set of shared
    character n-grams ... vectors
* We use LexVec as the counting model as it
  generally outperforms PPMI-SVD and GloVe on intrinsic and extrinsic
  evaluations (Salle et al., 2016a; Cer et al., 2017; Wohlgenannt et al., 2017;
  Konkol et al., 2017), but the
  method proposed here should transfer to GloVe unchanged
* To evaluate the impact subword information has on
  * in-vocabulary (IV) word representations, we run
    * intrinsic evaluations consisting of word similarity and word analogy
      * similar gains (and losses) to that of fastText over Skip-gram
      * n-gram vs morphemes
        * n-gram subwords tends to capture more syntactic information,
        * morphemes better preserve semantics while also improving syntactic
    * the VecEval suite of [extrinsic] tasks (Nayak et al., 2016), in which all
      subword models, including fastText, show no significant improvement
  * OOV words by quantitatively evaluating nearest neighbors. Results show
    * both LexVec n-gram and (to a lesser degree) unsupervised morpheme[s]
      give coherent answers
    * like fastText

# Conclusion

* future work
  * downstream tasks
  * trade-off between semantics and syntax when subword information is used
