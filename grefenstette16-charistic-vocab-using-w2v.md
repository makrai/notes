Gregory Grefenstette and Lawrence Muchemi
Determining the Characteristic Vocabulary for a Specialized Dictionary 
  using Word2vec and a Directed Crawler
2016 LREC

# Abstract

* Specialized dictionaries are used to understand concepts in specific domains,
  * concepts 
    * not part of the general vocabulary, or 
    * having meanings that differ from ordinary languages
* first step [is] detecting the characteristic vocabulary of the domain
  * methods ... involve 
    * gathering a domain corpus, 
    * calculating statistics [frequency of] the terms found there, and then 
    * comparing these statistics to a background or general language corpus.
* Here we present two tools, a directed crawler, and a distributional semantics
  package, that can be used together, circumventing the need of a background
  corpus. Both tools are available on the web.

## 4.1 Word2vec Trick

## 4.2 Examples

* In step 4, this combined text is input into word2vec using the
default parameters 10 from the demo-word.sh script
* -cbow 1 -size 200 -window 8 -negative 25 -hs 0 -sample 1e- 4  -iter 15
