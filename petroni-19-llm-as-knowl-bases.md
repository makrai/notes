Language Models as Knowledge Bases?
Fabio Petroni, T Rocktäschel, S Riedel, P Lewis, A Bakhtin, Y Wu, A Miller
EMNLP | IJCNLP 2019 Hong Kong, China petroni-etal-2019-language

code to reproduce our analysis is available at github.com/facebookresearch/LAMA

# Abstract

* LLMs may also be storing relational knowledge present in the training data,
  * answer queries structured as “fill-in-the-blank” cloze statements. Language
* LLMs have many advantages over structured knowledge bases: they 
  * require no schema engineering, allow practitioners to 
  * query about an open class of relations, are 
  * easy to extend to more data, and 
  * require no human supervision to train. 
* We: an in-depth analysis of the relational knowledge (without fine-tuning)
  in a wide range of state-of-the-art pretrained language models.
* We find that 
  * without fine-tuning, BERT contains relational knowledge competitive with
    traditional NLP methods that have some access to oracle knowledge, 
  * BERT also does remarkably well on open-domain question answering
    against a supervised baseline, and 
  * certain types of factual knowledge are learned much more readily than
    others by standard language model pretraining approaches. The surprisingly
* ie potential as unsupervised open-domain QA systems. The 
