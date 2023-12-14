XLM-V: Overcoming the Vocabulary Bottleneck in Multilingual Masked Language Models
Davis Liang, Hila Gonen, Yuning Mao, Rui Hou, Naman Goyal, Marjan Ghazvininejad, Luke Zettlemoyer, Madian Khabsa
EMNLP 2023 arXiv:2301.10472 [cs.CL]

# Abstract

* Large multilingual LMs: typically a single vocabulary for 100+ languages. As
  * these models have increased in parameter count and depth, 
  * vocabulary size has remained largely unchanged: vocabulary bottleneck
* we introduce a new approach for scaling to very large multiling vocabularies
  * de-emphasizing token sharing between languages with little lexical overlap
  * assigning vocabulary capacity to achieve sufficient coverage for each lang
  * our Tokenizations are typically more semantical and shorter than XLM-R
* we train XLM-V, a multilingual language model with a one million token vocab
  * outperforms XLM-R on every task we tested on 
    * natural language inference (XNLI), question answering (MLQA, XQuAD,
      TyDiQA), to named entity recognition (WikiAnn).  XLM-V is 
  * particularly effective on low-resource language tasks and 
  * outperforms XLM-R by 11.2% and 5.8% absolute
    on MasakhaNER and Americas NLI, respectively 
