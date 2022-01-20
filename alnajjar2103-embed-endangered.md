When Word Embeddings Become Endangered
Khalid Alnajjar
In M. Hämäläinen et al (Eds.), Multilingual Facilitation arXiv:2103.13275

cross-lingual word embeddings and the sentiment analysis model have been
released openly via an easy-to-use Python library.

# Abstract

* we present a method for constructing word embeddings for endangered languages
  using existing word embeddings of different resource-rich languages and the
  translation dictionaries of resource-poor languages. Thereafter, the
  embeddings are fine-tuned using the sentences in the universal dependencies
  and aligned to match the semantic spaces of the big languages; resulting in
  cross-lingual embeddings.
* The endangered languages we work with here are Erzya, Moksha, Komi-Zyrian and
  Skolt Sami. Furthermore,
* we build a universal sentiment analysis model for all the languages that are
  part of this study, whether endangered or not, by utilizing cross-lingual word
  embeddings. The evaluation conducted shows that our word embeddings for
  endangered languages are well-aligned with the resource-rich languages, and
  they are suitable for training task-specific models as demonstrated by our
  sentiment analysis model which achieved a high accuracy.
