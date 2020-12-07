Pooled Contextualized Embeddings for Named Entity Recognition 
Alan Akbik, Tanja Bergmann, Roland Vollgraf
2019 NAACL

all code and pre-trained models available to the research community for use and

# Abstract

* Contextual string embeddings are a recent type of contextualized word embed
  * SOTA results in a range of sequence labeling tasks. They are based on
  * character-level language models which 
    treat text as distributions over characters and are capable of generating
    embeddings for any string of characters within any textual context.
  * hE, struggle to produce meaningful embeddings if a rare string is used in a
    underspecified context.  To address this drawback, 
* we propose a method in which we 
  * dynamically aggregate contextualized embeddings of each unique string that
  * pooling operation to distill a ”global” word representation from all
* evaluate these ”pooled contextualized embeddings” on common named entity
  recognition (NER) tasks such as CoNLL-03 and WNUT and show that our approach
  significantly improves the SOTA for NER. We make 
