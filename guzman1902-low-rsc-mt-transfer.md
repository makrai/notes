The FLoRes Evaluation Datasets for Low-Resource MT: Nepali/Sinhala-English
F Guzmán, P Chen, M Ott, J Pino, G Lample, P Koehn, V Chaudhary, M Ranzato
EMNLP 2019 arXiv:1902.01382 [cs.CL]

Data and code: https://github.com/facebookresearch/flores

* machine translation, little parallel data available
  * Besides learning, it is difficult to evaluate methods
* we introduce the FLoRes evaluation datasets for
  Nepali-English and Sinhala-English, based on sentences translated from Wikiped
  * morphology and syntax very different from English, for which
    little out-of-domain parallel data is available and for which
    relatively large amounts of monolingual data are freely available
  * collect and cross-check the quality of translations, and we report
    baseline performance using several learning settings:
    fully supervised, weakly supervised, semi-supervised, and fully unsup
* experiments demonstrate that current SOTA methods perform rather poorly on
  this benchmark, posing a challenge to the research community
* conclusion:
  * semi-supervised and in particular multi-lingual neural methods outperforming
    all the other model variants and training settings we considered
  * We perform additional analysis to probe the quality of the datasets. We find
    no evidence of poor construction quality, yet observe that
    the low BLEU scores are partly due to the domain mismatch

# 1 Intro

* difficult to verify the quality of the human translations as an non-native,
  because the topics of the documents in these low-resource languages may
  require knowl-edge and context coming from the local culture

In this work, we introduce new evaluation benchmarks on two very low-resource
language pairs: Nepali–English and Sinhala–English. Sentences were extracted
from Wikipedia articles in each language and translated by professional
translators. The datasets we release to the community are composed of a tune
set of 2559 and 2898 sentences, a development set of 2835 and 2766 sentences,
and a test set of 2924 and 2905 sentences for Nepali–English and
Sinhala–English respectively

# 3  methodology we used to collect the data as well as to check the quality of

# 4 experiments demonstrate that these benchmarks are very challenging for
current SOTA methods, yielding very low BLEU scores (Papineni+ 2002) even using
all available parallel data as well as monolingual data or Paracrawl 1 filtered
data

This suggests that these languages and evaluation benchmarks can constitute a
useful test-bed for developing and comparing MT systems for lowresource language
pairs

## 4.1 data used for training the models

* Small amounts of parallel data are available for Sinhala–English and
  Nepali–English. Statistics can be found in Table 2
  * Open Subtitles and GNOME/KDE/Ubuntu come from the OPUS repository 7
  * Global Voices is an updated version (2018q4) of a data set originally created
    for the CASMACAT project 8
  * Bible translations come from the bible-corpus 9
  * The Paracrawl corpus comes from the Paracrawl project 10
  * The filtered version (Clean Paracrawl) was generated using the LASER model
    (Artetxe and Schwenk, 2018) to get the best sentence pairs having 1 million
    English tokens as specified in Chaudhary+ (2019)
  * randomly filtered version (Random Paracrawl) with the same number of English tokens
  * our multilingual experiments in Nepali use Hindi
    monolingual (about 5 million sentences) and English-Hindi parallel data
    (about 1.5 million parallel sentences) from the IIT Bombay corpus 11

## 4.2 learning settings

## 4.3 models considered, and finally we report the

## 4.4 Preprocessing and Evaluation

## 4.5 results of these baseline models on the new evaluation benchmarks
