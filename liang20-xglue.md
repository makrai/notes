XGLUE: A New Benchmark Dataset for Cross-ling Pre-train, Understand and Gen
Yaobo Liang, Nan Duan, Yeyun Gong, Ning Wu, Fenfei Guo, Weizhen Qi,+
EMNLP 2020

# Abstract

* using multilingual and bilingual corpora, and evaluate their performance
  across a diverse set of cross-lingual tasks.  Comparing to GLUE (Wang+ 2019),
  which is labeled in English and includes natural language understanding tasks
* two corpora with different sizes for cross-lingual pre-training; (2) it
* 11 diversified tasks that cover both NLU and generation scenarios; (3) for
* We extend a recent cross-lingual pre-trained model Unicoder (Huang+ 2019) to
  cover both understanding and generation tasks, which is evaluated on XGLUE as
  a strong baseline. We also evaluate the base versions (12-layer) of
  Multilingual BERT, XLM and XLM-R for comparison.

### 2.2.1 Single-input Understanding Tasks

#### News Classification (NC) This task aims to

* predict the category given a news article. It covers
* 5 languages, including English, Spanish, French, German and Russian.
* Each instance is a 3-tuple: `<news title, news body, category>`. The
* category number is 10.
* crawled from Microsoft News (MSN).
* Accuracy (ACC) of the multi-class classification is used as the metric.

# 6 Related Work

## Dataset

* GLUE (Wang+ 2019) includes 9 natural language understanding tasks that are la-
  beled in English only. Comparing to GLUE, XGLUE not only expands task
  annotations to multiple languages, but also includes natural language
* multilingual datasets built for specific tasks
  * XNLI (Conneau+ 2018), NER (Sang, 2002; Sang and De Meulder, 2003),
  * POS Tagging (Kim+ 2017), MLQA (Lewis+ 2019b) and PAWS-X (Yang+ 2019a) are 5
    * XGLUE introduces 6 new tasks selected from real-world scenarios
* XTREME (Hu+ 2020) is a concurrent work of XGLUE. Comparing to it, XGLUE
  * no generation?
