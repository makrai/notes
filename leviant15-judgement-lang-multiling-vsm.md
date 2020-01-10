Separated by an Un-common Language:
  Towards Judgment Language Informed Vector Space Modeling
2015 arxiv:1508.00106
Ira Leviant, Roi Reichart

An earlier version of the paper appears with the name _Judgment Language
Matters: Towards Judgment Language Informed Vector Space Modeling_. Please cite
the current version

#Abstract

* we translate two prominent evaluation sets,
  * wordsim353 (association) and SimLex999 (similarity),
  * from English to Italian, German and Russian and
    * collect scores for each dataset from crowdworkers
* we show that:
  1. The judgment language in which word pairs are presented to human
     evaluators, all fluent in that language, has a substantial impact on
     their produced similarity scores;
  1. Given the judgment language of an evaluation set, this judgment language
     is a good choice for the VSM training corpus language; and
  1. Monolingual VSMs can be combined into multilingual VSMs that can predict
     human similarity scores for a variety of judgment languages better than
     any monolingual model
* differences between word association and similarity. For example, while for
  association the predictions of a VSM trained on a given language best
  correlate with human judgments made with that language, for similarity some
  JL s better correlate with all monolingual models than others

#Previous work

* evaluation sets consisting of English word pairs scored by humans for
  semantic relations (mostly association and similarity)
  * RG-65 (Rubenstein and Goodenough, 1965),
  * MC-30 (Miller and Charles, 1991),
  * WS 353 ((Finkelstein et al., 2001)),
  * YP-130 (Yang and Powers, 2006), and
  * SL 999 (Hill et al., 2014b)
* languages other than English (e.g
  * Arabic, French, Farsi, German, Portuguese, Romanian and Spanish) were !
    presented
    * Gurevych, 2005
    * Zesch and Gurevych, 2006
    * Hassan and Mihalcea, 2009
    * Schmidt et al., 2011
    * Camacho-Collados et al., 2015
    * Köper et al., 2015
  * translations of the English sets, where the original human scores
  * Even for those cases where evaluation sets were re-scored (e.g
    (Camacho-Collados et al., 2015; Köper et al., 2015)) our investigation of
    the JL effect is much more thorough

#6 The VSM Training Language Effect

##Training Language Choice

* English is overall the best choice of TL for both BOW and W2V
  * JL itself is overall the second best TL , which is observed in 10 of the 11
* for each of the TL s T , what is the JL J that leads to human judgments that
  best correlate with the pre- dictions of the monolingual model trained with T
  .Here we observe considerable differences between word similarity and
  association

##Judgment Language Choice

* WS 353
  * in 7 of 8 cases a model trained with a TL `T` best correlates with human
  judg- ments made with `T` as a JL , for
* SL 999 both models best correlate with German judgments for all TLs
* For WS 353 in 3 out of the 5 cases where English is not the best JL for a
  model it is the sec- ond best JL . For SL 999, in contrast, for all 8 TL and
  model type combinations, English is the JL with the lowest correlation. For
  this dataset, Italian is always the second best JL , and Russian is the third
  best
