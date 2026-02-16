         BESSTIE: A Benchmark for Sentiment and Sarcasm Classification
                            for Varieties of English
         Dipankar Srirag, Aditya Joshi, Jordan Painter, Diptesh Kanojia
               Findings of ACL: ACL 2025 arXiv:2412.04726 [cs.CL]

https://huggingface.co/datasets/unswnlporg/BESSTIE

* LLMs being known to exhibit bias against non-standard language varieties,
  * no known labelled datasets for sentiment analysis of English
* we introduce BESSTIE, a benchmark for sentiment and sarcasm classification for
  three varieties of English: Australian (en-AU), Indian (en-IN), and British
* collection methods:
  * location-based for Google Places reviews, and
  * topic-based filtering for Reddit comments. To
  * assessment: whether the dataset accurately represents these varieties, we
    (a) manual annotation of language varieties and (b) automatic lang var pred
  * Native speakers of the language varieties manually annotate the datasets
    with sentiment and sarcasm labels. We perform an additional annotation
    exercise to validate the reliance of the annotated labels
* we fine-tune nine LLMs (representing a range of encoder/decoder and
  mono/multilingual models) on these datasets, and
  evaluate their performance on the two tasks. Our results show that
  * the models consistently perform better on inner-circle varieties
    (ie en-AU and en-UK), in comparison with en-IN,
    particularly for sarcasm classification
  * challenges in cross-variety generalisation, highlighting the
    need for language variety-specific datasets such as ours

# 1 Intro

| Benchmark          | Sent. | Sarc. | Eng. | Var. |
|--------------------|:-----:|:-----:|:----:|:----:|
| Cieliebak+ (2017)  |   1   |   0   |  0   |  0   |
| Wang+ (2018)       |   1   |   0   |  1   |  0   |
| Alharbi+ (2020)    |   1   |   0   |  0   |  1   |
| Abu Farha+ (2021)  |   1   |   1   |  ar  |  1   |
| Elmadany+ (2023)   |   1   |   1   |  ar  |  1   |
| Faisal+ (2024)     |   1   |   0   |  0   |  1   |
| **BESSTIE**        |   1   |   1   |  1   |  1   |

* The relationship between sentiment and sarcasm classification is
  well-understood (Chauhan+ 2020)

# 6 Rel work

* non-standard language varieties. Efforts to address this include datasets for
  * African languages and dialects (Muhammad+ 2023)
  * Arabic dialects (Elmadany+ 2023)
  * CreoleVal (Lent+ 2024) which provides datasets for 28 creole languages. More
  * DialectBench (Faisal+ 2024) in 280 dialectal varieties for several tasks
    * English dialectal datasets for sentiment and sarcasm classification
* sarcasm classification datasets for standard English
  * reddit comments (Khodak+ 2018)
  * amazon reviews (Filatova, 2012)
  * tweets (Ptáček+ 2014; Painter+ 2022; Abercrombie and Hovy, 2016; Oprea and
    Magdy, 2020)
* Arabic: ArSarcasm-v2 (Abu Farha+ 2021)
  * annotations for sarcasm, sentiment, and the dialect of each tweet
  * ne sarcasm classification datasets for non-standard varieties of English
