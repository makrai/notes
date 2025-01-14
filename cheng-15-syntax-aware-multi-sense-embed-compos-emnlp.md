Syntax-Aware Multi-Sense Word Embeddings
  for Deep Compositional Models of Meaning
Jianpeng Cheng & Dimitri Kartsaklis
emnlp 2015

# Abstract

* each word is associated with a number of senses,
  the most plausible of which is selected dynamically during the composition
* We evaluate the produced vectors qualitatively and quantitatively
  * At the sentence level, on the MSRPar task, results [around SOTA]

# Introduction

* deep-learning architectures in modelling the meaning of sentences for
  a variety of tasks (Socher+ 2012; Kalchbrenner+ 2014)
* lexical ambiguity affects the compositional process
  * recent work [by the authors] has shown that
    shallow multi-linear compositional models
      that explicitly handle extreme cases of lexical ambiguity
      in a step prior to composition
    present consistently better performance than their “ambiguous” counterparts
    (Kartsaklis and Sadrzadeh, 2013; Kartsaklis+ 2014)
  * in a deep compositional setting Cheng+ (2014)
* we make the word embeddings syntax-aware by introducing
  * a variation of the hinge loss objective function of Collobert & Weston (08)
  * predict the position of the word within that context
  * qualitative analysis shows that our
    vectors reflect both semantic and syntactic features in a concise way
* the compositional model [is] further refined according to the purposes of a
  specific task at hand
  * paraphrase detection, we achieve a result very close to SOTA
    on the Microsoft Research Paraphrase Corpus (Dolan and Brockett, 2005)
  * siamese architecture (Bromley+ 1993)
    in contrast to mainstream approaches
