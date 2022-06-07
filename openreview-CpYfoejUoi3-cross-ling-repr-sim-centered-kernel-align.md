* representation similarity analysis methods have developed in recent years
  to study the hidden representations of multilingual language models
  * Kudugunta+ (2019) used SVCCA (Morcos+ 2018) to study the CLRS of NMT models
  * CLRS score fell as the network depth increased for multilingual LMs
  * Singh+ (2019) used PWCCA (Morcos+ 2018) to show that
    CLRS for mBERT drastically fell with the network’s depth
  * Wu+ (2020) also found similar results as Morcos+ (2018) for BERT using CKA
  * Using CKA, Muller+ (2021) showed that for mBERT the CLRS score
    increased steadily in the first five layers, only to
    fall in the final layers
* Del and Fishel (2021) applied different similarity measures and also showed
  * CLRS score
    increased in the first half of the models while
    steadily falling in the later layers
* Moosa+ (2022) also applied CKA on the FLORES-101 dataset to analyze
  cross-lingual representation similarity
