Topic detection using paragraph vectors
  to support active learning in systematic reviews
Kazuma Hashimoto, Georgios Kontonatsios, Makoto Miwa, Sophia Ananiadou
Journal of Biomedical Informatics 62 (2016) 59–65

https://nactem.ac.uk/pvtopic/

# Abstract

* _Systematic reviews_ require expert reviewers to manually screen thousands of
  citations in order to identify all relevant articles to the review.
* [Wikipedia: _Active learning_: learning algorithm is able to interactively
  query the user (or some other information source) to obtain the desired
  outputs at new data points]
* evaluation baseline: Latent Dirichlet Allocation

# 1

* the identification of relevant studies is more challenging in [the public
  health] domain compared to others, e.g., clinical documents. This can be
  attributed to the fact that the public health literature extends across a
  wide range of disciplines covering diverse topics
* Extending upon [probabilistic Latent Semantic Indexing (PLSI)], LDA assumes
  that topic distributions are drawn from the same prior distribution which
  allows the model to scale up to large datasets and better generalise to
  unseen documents.
* In this article, we present a novel topic detection model
