Contextual Text Understanding in Distributional Semantic Space
Jianpeng Cheng, Zhongyuan Wang, Ji-Rong Wen, Jun Yan, Zheng Chen
2015 ACM

# Abstract

* [multi-sense embedding is] prone to data sparsity, since each sense needs to
  be managed discriminatively. In this work, we propose a new framework for
  generating context-aware text representations
* We model the concept space shared among senses, resulting in a framework that
  is efficient in both computation and storage. Specifically, the framework we
  propose is one that: i) projects both words and concepts into the same vector
  space; ii) obtains unambiguous word representations that not only preserve
  the uniqueness among words, but also reflect their context-appropriate
  meanings
* [eval] including word/phrase similarity measurements, paraphrase
  identification and question-answer relatedness classification

# 4 Jointly embedding words and concepts

* We propose two classes of neural language models for co-training word-concept
  embeddings, based on the Skip-gram.

## 4.1 Parallel Word-Concept Skip-gram (PWCS)

## 4.2 Generative Word-Concept Skip-gram (GWCS)

# 6 Experiments

## 6.3 Similarities of Words and Phrases

* word-level dataset
  * the Stanford Contextual Word Similarity Dataset (SCWS) of Huang et al.
* phrase similarity dataset
  * Mitchell and Lapata (M& L) [32].

### Comparison with Baselines and Published Results

* we compare the results of our models with a few well-established baselines
  * neural language model of Collobert and Weston (C&W) [10], the
  * ordinary Skip-gram model trained with hierarchical softmax, and
  * three sets of sense embedding models of
    * Huang et al. [18] (nClass=3), Neelakantan et al.  [34] and Bartunov et
      al. [1], respectively
  * preprocessed baseline
    * training words are preprocessed into word-concept pairs, after which the
      ordinary Skipgram is applied
* contextual word representations significantly outperform the word embedding
  baselines
* training time
  * our models have a clear advantage over Huang et al. [18], while they are
    slightly faster than the non-parametric methods of Neelakantan et al. [34]
    and Bartunov et al.[1], But note that
* we only need to _store_ 4,819 explicit concept vectors or 500 implicit
  concept vectors, whereas the size of sense vectors is usually several times
  more than the size of the vocabulary (55,000).

# 7 Related Work

* approaches to training sense embeddings directly from a neural language
  model, without considering any clustering step in mind.
  * Pina and Johansson [35] use a naive Bayesian step for updating the most
    proper senses in a neural language model.
  * Bartunov et al. [1] propose a non-parametric Bayesian extension of the
    Skip-gram
  * Li and Jurafsky [24] use the non-parametric Chinese Restaurant Process for
    sense induction in a Skip-gram
* Despite the improved efficiency of these models, they all require a
  significant amount of storage in the case of a large vocabulary, since every
  sense is associated with a vector which will be stored.  Moreover, there is
  no clear mapping between the senses learned by these models and the actual
  senses of a word. This becomes problematic for rare words or rare senses, for
  which there does not exist enough training contexts for inference.
