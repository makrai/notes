Characterizing Intrinsic Compositionality in Transformers with Tree Projections
Shikhar Murty, Pratyusha Sharma, Jacob Andreas, Christopher D. Manning
arXiv:2211.01288 [cs.CL]

* what do NLP transformers learn
  * some arbitrary computation that utilizes the full capacity of the archit
  * a simpler, tree-like computation,
    * hypothesized to underlie compositional meaning systems like human langs?
* There is an apparent tension between
  * compositional accounts of human language understanding, which are
    * based on a restricted bottom-up computational process, and the
  * enormous success of neural models like transformers, which can
    * route information arbitrarily between different parts of their input
* One possibility is that these models, while extremely flexible in principle,
  * interpret language hierarchically, ultimately building sentence
    representations close to those predictable by a bottom-up, tree-structured
    model. To evaluate this
* we describe an unsupervised and parameter-free method to _functionally
  project_ the behavior of any transformer
  into the space of tree-structured networks
  * Given an input sentence `s`, we produce a binary tree that
    approximates the transformer's representation-building process and a
  * score that captures how "tree-like" the transformer's behavior is on `s`
    * calculation of this score does not require training any additional models,
    * upper-bounds the fit between a transformer and any tree-structured approx
* transformers for three different tasks
  become more tree-like over the course of training,
  in some cases unsupervisedly recovering the same trees as supervised parsers.
  These trees, in turn, are predictive of model behavior, with more tree-like
  models generalizing better on tests of compositional generalization.
