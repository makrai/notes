CamemBERT: a Tasty French Language Model
L Martin, B Muller, P Suárez, Y Dupont, L Romary, É Clergerie, D Seddah, B Sagot
ACL 2020 arXiv:1911.03894 [cs.CL]

freely available and distributed with the MIT license via popular NLP libraries
(fairseq and huggingface) as well as on our website camembert-model.fr

# Abstract

* evaluating our language models on part-of-speech tagging, dependency parsing,
  named entity recognition and natural language inference tasks. We show that
* web crawled data is preferable to the use of Wikipedia data
  * high variability 
* a relatively small web crawled dataset (4GB) leads to results that are as good
  as those obtained using larger datasets (130+GB).  Our best performing model
* reaches or improves the SOTA in all four downstream tasks. 
  * even when compared to mBERT, XLM and XLM-R, while also having fewer params
* based on RoBERTa

# 1 Introducion

* multilingual models are often larger, and their results can lag behind their
  monolingual counterparts for high-resource languages.  
* In order to reproduce results that have so far only been obtained for English,
* we take advantage of the multilingual corpora OSCAR (Ortiz Suárez+ 2019) to
  * alternative versions of CamemBERT on different smaller corpora with
    different levels of homogeneity in genre and style in order to assess the
    impact of these parameters on downstream task performance. CamemBERT uses
  * RoBERTa architecture (Liu+ 2019), an improved variant of BERT architecture 
* four different downstream tasks for French: part-of-speech (POS) tagging,
  dependency parsing, named entity recognition (NER) and NLI
* improves on the SOTA in all four tasks compared to previous
  monolingual and multilingual approaches including mBERT, XLM and XLM-R, which

# 2 Previous work

### Non-English contextualized models Following the success of large pretrained

* multilingual setting with 
  * multilingual BERT (hereafter mBERT, Devlin+ 2018), a single multilingual
    model for 104 different languages trained on Wikipedia data, and later 
  * XLM (Lample and Conneau, 2019), which significantly improved unsupervized
    machine translation. More recently 
  * XLM-R (Conneau+ 2019), extended XLM by training on 2.5TB of data and
    outperformed previous scores on multilingual benchmarks.  They show that
    * competitive with monolingual models by leveraging higher quality data from
      other languages on specific downstream tasks.  A few non-English
* monolingual models have been released: 
  * ELMo models for Japanese, Portuguese, German and Basque 2 and 
  * BERT for Simplified and Trad Chinese (Devlin+ 2018) and German (Chan+ 2019)
  * not at a scale similar to the latest English models 
    (e.g. RoBERTa trained on more than 100GB of data)

### BERT and RoBERTa Our approach is based on 

* RoBERTa (Liu+ 2019) itself is based on BERT (Devlin+ 2019). 
* BERT is a multi-layer bidirectional Transformer encoder 
  * trained with a masked language modeling (MLM) objective, 
    * inspired by the Cloze task (Taylor, 1953).  It comes in 
  * two sizes: the BERT BASE architecture and the BERT LARGE architecture. The
    * BERT BASE architecture is 3 times smaller and therefore faster and easier
* RoBERTa improves the original implementation of BERT by identifying key choics
  * dynamic masking, removing the next sentence prediction task, training with
    larger batches, on more data, and for longer.

# 3 Downstream evaluation tasks

* four downstream tasks that we use to evaluate CamemBERT, namely: 
  Part-Of-Speech (POS) tagging, dependency parsing, Named Entity Recognition
  (NER) and Natural Language Inference (NLI). We also present the baselines that
* Tasks 
  * POS tagging is a low-level syntactic task, which consists in assigning to
  * Dependency parsing consists in predicting the labeled syntactic tree in
  * both of these tasks: Universal Dependencies (UD) 3 framework and its
  * NER, which is a sequence labeling task predicting which words refer to
    * French Treebank 6 (FTB) (Abeillé+ 2003) in its 2008 version introduced by
      Candito and Crabbé (2009) and with NER annotations by Sagot+ (2012). The
      * more than 11 thousand entity mentions distributed among 7 entity types.
  * NLI, using the French part of the XNLI dataset (Conneau+ 2018). NLI consists
    * predicting whether a hypothesis sentence is entailed, neutral or contradic
    * The XNLI dataset is the extension of the Multi-Genre NLI (MultiNLI) corpus
      (Williams+ 2018) to 15 languages by translating the validation and test
      sets manually into each of those languages. The English training set is
      machine translated for all languages other than English. The dataset is
      composed of 122k train, 2490 development and 5010 test examples for each
      language. As usual, NLI performance is evaluated using accuracy.

# 4 CamemBERT: a French Language Model

## 4.3 Language Modeling

### Pretraining Objective We train our model on

* Masked Language Modeling (MLM) task.  Given an input text sequence composed of
* Following the RoBERTa approach, we dynamically mask tokens instead of fixing
  them statically for the whole dataset during preprocessing. This improves
* Whole-word Masking (WWM)
  * upgraded version of BERT 8 and Joshi+ (2019) have shown that masking whole
    words instead of individual subwords leads to improved performance.  makes
  * using WWM by using whitespaces in the initial untokenized text as word delim 
  * sampling 15% of the words in the sequence and then dconsidering all subword
    tokens in each of this 15% for candidate replacement. This amounts to a
    proportion of selected tokens that is close to the original 15%. These
    * either replaced by <MASK> tokens (80%), left unchanged (10%) or replaced
      by a random token.  
* next sentence prediction (NSP) task originally used in BERT does not improve
  (Lample and Conneau, 2019; Liu+ 2019), thus we also remove it.

# 7 Discussion: FlauBert

* Since the pre-publication of this work (Martin+ 2019), many monolingual
  language models have appeared, e.g. (Le+ 2019; Virtanen+ 2019; Delobelle+
  2020), for as much as 30 languages (Nozza+ 2020). 
  In almost all tested configurations they displayed 
  better results than multilingual language models such as mBERT (Pires+ 2019).
* Le+ (2019) showed that using their FlauBert, a RoBERTa-based language model
  for French, which was trained on less but more edited data, 
  * in conjunction to CamemBERT in an ensemble system could 
    improve the performance of a parsing model and establish a 
    new SOTA in constituency parsing of French, highlighting thus the
    complementarity of both models. 18 As it was the case for English when 
* BERT-scale language models for French enabled interesting applications, such
  * large scale anonymization of legal texts, where CamemBERT-based models
    established a new SOTA on this task (Benesty, 2019), or 
  * the first large question answering experiments on a French Squad data set
    (d’Hoffschmidt+ 2020) where the authors 
    * matched human performance using CamemBERT LARGE

# 8 Conclusion

* question of knowing whether pretraining on small domain specific content will
  be a better option than transfer learning techniques such as fine-tuning
  remains open and we leave it for future work.
