Contextual String Embeddings for Sequence Labeling
Roland Vollgraf, Alan Akbik, Duncan Blythe
emnlp 2018 

all code and pre-trained language models in a simple-to-use framework
https://github.com/zalandoresearch/flair

# Abstract

* recurrent neural networks ... model language as distributions over characters
* automatically internalize linguistic concepts such as 
  words, sentences, subclauses and even sentiment. 
* In this paper, we propose to leverage the internal states ... to 
  produce a novel type of word embedding which we refer to as 
  contextual string embeddings
  * trained without any explicit notion of words 
  * contextualized by their surrounding text
* evaluation against previous embeddings [in] downstream tasks: 
  * [new SOTA] across four classic sequence labeling tasks 
    * we significantly outperform previous work on 
    * English and German ... NER, ... on the CONLL03 shared task
