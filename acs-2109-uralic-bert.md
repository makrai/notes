Evaluating Transferability of BERT Models on Uralic Languages
Judit Ács, Dániel Lévai, András Kornai
arXiv:2109.06327 IWCLUL 2021 7th Intl Workshop for Comp Ling of Uralic Langs

* we evaluate monolingual, multilingual, and randomly initialized BERTs on a
  * languages including Estonian, Finnish, Hungarian, Erzya, Moksha, Karelian,
    Livvi, Komi Permyak, Komi Zyrian, Northern Sámi, and Skolt Sámi. 
* When monolingual models are available (currently only et, fi, hu), these
  * perform better on their native language, but in general 
  * they transfer worse than multilingual models or models of genetically
    unrelated languages that share the same character set.
* straightforward transfer of high-resource models, even 
  without special efforts toward hyperparameter optimization, yields what appear
  SOTA POS and NER tools for the minority Uralic languages 
  where there is sufficient data for finetuning.
