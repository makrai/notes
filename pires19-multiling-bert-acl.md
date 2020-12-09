Telmo Pires, Eva Schlinger, Dan Garrette
How Multilingual is Multilingual BERT?  
arXiv preprint arXiv:1906.01502

# Abstract

* Multilingual BERT (M-BERT, Devlin+ 2018) 
  * a single language model pre-trained from monolingual corpora in 104 langs,
* surprisingly good at zero-shot cross-lingual model transfer
  * task-specific annotations in one language are used to fine-tune the [other]
* we present a large number of probing experiments, showing that 
  * transfer is possible even to languages in different scripts
  * monolingual corpora can train models for code-switching
  * systematic deficiencies affecting certain language pairs

# 1 Intro

* we empirically investigate the degree to which mBERT generalizes across langs.
  * mBERT released by Devlin+ (2019) as a single language model pre-trained on
    the concatenation of monolingual Wikipedia corpora from 104 languages. 1
* mBERT enables a straightforward approach to zero-shot cross-lingual transfer:
  we fine-tune the model using task-specific training data from one language,
  and evaluate that task in a different language, thus allowing us to observe
* Our results show that 
  * mBERT is able to perform cross-lingual generalization surprisingly well.
* probing experiments designed to test various hypotheses show that while 
  * high lexical overlap between languages improves transfer, mBERT is also 
  * able to transfer between languages written in different scripts— thus having
  * transfer works best for typologically similar languages, 
    * suggesting that while mBERT ’s multilingual representation 
      * able to map learned structures onto new vocabularies, it does 
      * not to learn systematic transformations of structures to
        accommodate a target language with different word order
