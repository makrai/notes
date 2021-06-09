uspu

# Abstract

* hypernymy, such as poodle is-a dog , is an important generalization aid
* [for] e.g. entailment, coreference, relation extraction, and [QA]
* unsupervised
  * Existing unsupervised methods either do not scale to large vocabularies or
    yield unacceptably poor accuracy.
* This paper introduces distributional inclusion vector embedding (DIVE), a
  simple-to-implement unsupervised method of hypernym discovery
  * via per-word non-negative vector embeddings which preserve the inclusion
    property of word contexts in a low-dimensional and interpretable space. In
* experimental evaluations
  * more comprehensive than any previous literature of which we are
    * 11 datasets using multiple
    * existing as well as newly proposed scoring functions—we find that our
    * up to double the precision of previous unsupervised embeddings, and the
      highest average performance, using a
    * much more compact word representation, and yielding
    * many new state-of-the-art results

## 1.1

* A novel unsupervised low-dimensional embedding method via performing
  non-negative matrix factorization (NMF) on a weighted PMI matrix, which can
  be efficiently optimized using modified skip-grams.
* Theoretical and qualitative analysis illustrate that the proposed embedding
  can intuitively and interpretably
  preserve inclusion relations among word contexts.
* Extensive experiments on 11 hypernym detection datasets demonstrate that
  the learned embeddings dominate previous low-dimensional unsupervised
  embedding approaches, achieving similar or better performance than SBOW,
  * on both existing and newly proposed asymmetric scoring functions, while
  requiring much less memory and compute.
