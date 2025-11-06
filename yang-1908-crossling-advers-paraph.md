PAWS-X: A Cross-lingual Adversarial Dataset for Paraphrase Identification
Yinfei Yang, Yuan Zhang, Chris Tar, Jason Baldridge
EMNLP2019 arXiv:1908.11828 [cs.CL]

* PAWS (Paraphrase Adversaries from Word Scrambling) consists of challenging
  English paraphrase identification pairs from Wikipedia and Quora. 
* We: PAWS-X, a new dataset of 23,659 human translated PAWS evaluation pairs in
  * six typol distinct langs: French, Spanish, German, Chinese, Japanese, Korean
* baseline numbers for three 
  * 3 models with diff capac to capture non-local context and sentence struct,
    and using different multilingual training and evaluation regimes.
* Multilingual BERT fine-tuned on PAWS English plus machine-translated data
  performs the best, with a range of 83.1-90.8 accuracy across the non-English
  languages and an average accuracy gain of 23% over the next best model.
* effectiveness of deep, multilingual pre-training while also
  leaving considerable headroom as a new challenge to drive multilingual
