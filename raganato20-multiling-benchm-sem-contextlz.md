XL-WiC: A Multilingual Benchmark for Evaluating Semantic Contextualization
Alessandro Raganato, Tommaso Pasini, Jose Camacho-Collados, MT Pilehvar
EMNLP 2020

    https://pilehvar.github.io/xlwic/

# Abstract

* modeling distinct meanings of a word is crucial
* hE, most evaluation benchmarks are tied to sense inventories (usu WordNet),
  => restricted to a small subset of knowledge-based representation techniques
* The Word-in-Context dataset (WiC) addresses the dependence on sense
  inventories by
  * reformulating the standard disambiguation task as a binary classification
    problem; but, it is limited to the English language
* We put forward a large multilingual benchmark, XL-WiC
  * 12 new languages from varied language families and with diff resource avail
  * experiments with several recent contextualized multilingual models
  * results show that even when no tagged instances are available for a lang,
    models trained solely on the English data can attain competitive perf in
    the task of distinguishing different meanings of a word,
    even for distant languages
