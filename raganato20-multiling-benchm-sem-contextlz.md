XL-WiC: A Multilingual Benchmark for Evaluating Semantic Contextualization 
Alessandro Raganato, Tommaso Pasini, Jose Camacho-Collados, Mohammad Taher Pilehvar
EMNLP 2020

    https://pilehvar.github.io/xlwic/.

# Abstract

* to model distinct meanings of a word is crucial for the effectiveness of
* hE, most existing evaluation benchmarks are tied to sense inventories
  (usually WordNet), restricting their usage to a small subset of
  knowledge-based representation techniques
* The Word-in-Context dataset (WiC) addresses the dependence on sense
  inventories by 
  * reformulating the standard disambiguation task as a binary classification
    problem; but, it is limited to the English language. 
* We put forward a large multilingual benchmark, XL-WiC, featuring gold
  * 12 new languages from varied language families and with different degrees
    of resource availability, opening room for evaluation scenarios such as
  * experiments with several recent contextualized multilingual models.
  * results show that even when no tagged instances are available for a lang,
    models trained solely on the English data can attain competitive
    performance in the task of distinguishing different meanings of a word,
    even for distant languages
