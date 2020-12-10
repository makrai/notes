Pooled Contextualized Embeddings for Named Entity Recognition
Alan Akbik, Tanja Bergmann, Roland Vollgraf
2019 NAACL

all code and pre-trained models available to the research community for use and
* in Flair framework

# Abstract

* Contextual string embeddings are a recent type of contextualized word embed
  * SOTA results in a range of sequence labeling tasks
  * character-level language models which
  * generating embeddings for any string of characters within any textual contxt
  * no meaningful embeddings if a rare string is used in a underspecified contxt
* we propose a method in which we
  * dynamically aggregate contextualized embeddings of each unique string
  * pooling operation to distill a ”global” word representation
  * global word representation used in combination with the current contextualzd
  * i.e. evolving word representations:
    * change as more instances of the same word are observed
  * fomr the conclusion:
    * continues to “learn” even after the training of the downstream NER model,
      in prediction mode. We consider this idea of constantly evolving
* evaluate these ”pooled contextualized embeddings” on NER
  * significantly improves the SOTA for tasks such as CoNLL-03 and WNUT

# 1 Intro

* contextual string embeddings (Akbik+ 2018)
  * a character-level contextualized embeddings approach
  * leverage pre-trained character-level language models from which they extract
    hidden states at the beginning and end character positions of each word to
    produce embeddings for any string of characters in a sentential context
  * SOTA results when utilized in sequence labeling tasks such as NER or PoS

## Underspecified contexts. However, such contextualized character-level models

* weakness when encountering rare words in an underspecified context
* e.g. “Fung Permadi (Taiwan) v Indra”, from the English CONLL-03 test data
  * If we consider the word “Indra” to be OOV,
    the underspecified context allows this word to be interpreted as either a
    person or an organization
  * causes an incorrect classification of “Indra” as an organization

## Pooled Contextual Embeddings. In this paper, we present a simple but

* entities are normally only used in underspecified contexts if they are
  expected to be known to the reader
  * i.e. either more clearly introduced in an earlier sentence, or
    part of general in-domain knowledge

# 4 Discussion and conclusion

## Evolving embeddings. Our dynamic aggrega-

* Assuming that entity names are more often used in well-specified contexts,
  their pooled embeddings will improve as more data is processed. The embedding

## Future work. 

* weighted poolings of previous mentions
  * in our pooling, all previous instances of a word are equally important.
  * more recent mentions of a word such as words within the same document or
    news cycle may be more important for creating embeddings than mentions that
