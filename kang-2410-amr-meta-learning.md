Should Cross-Lingual AMR Parsing go Meta? An Empirical Assessment of
  Meta-Learning and Joint Learning AMR Parsing
Jeongwoo Kang, Maximin Coavoux, Cédric Lopez, Didier Schwab
EMNLP 2024 arXiv:2410.03357 [cs.CL]

* Cross-lingual AMR parsing
  * ie predicting AMR graphs in a target language when
    training data is available only in a source language
  * has only been explored in a small set of languages
    eg English, Spanish, German, Chinese, and Italian
* Langedijk+ (2022) apply meta-learning to tackle cross-lingual synt parsing
* we investigate the use of meta-learning for cross-lingual AMR parsing
  * k-shot scenarios (including 0-shot)
  * we assess effectiveness in Croatian, Farsi, Korean, Chinese, and French
  * Korean and Croatian test sets are developed as part of our work,
    based on the existing The Little Prince English AMR corpus, and
    * made publicly available
* comparison to classical joint learning
  * the meta-learning model performs slightly better in 0-shot evaluation for
    certain languages,
  * the performance gain is minimal or absent when k is higher than 0
