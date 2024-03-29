Unsupervised Multilingual Sentence Embeddings for Parallel Corpus Mining
Ivana Kvapilíková, Mikel Artetxe, Gorka Labaka, Eneko Agirre, Ondřej Bojar
ACL 2020

# Abstract

* models of multilingual sentence embeddings require large parallel data
* We propose an unsupervised method to derive multilingual sentence embeddings
  relying only on monolingual data
  * first produce a synthetic parallel corpus using unsupervised MT
  * fine-tune a pretrained cross-lingual masked language model (XLM) to derive
    the multilingual sentence representations
* evaluated on two parallel corpus mining tasks
  * improvements of up to 22 F1 points over vanilla XLM
  * a single synthetic bilingual corpus is able to improve results for other
    language pairs
