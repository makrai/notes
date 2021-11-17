Pretrained Language Models for Text Generation: A Survey
Junyi Li, Tianyi Tang, Wayne Xin Zhao, Ji-Rong Wen
IJCAI 2021 Survey Track arXiv:2105.10311 [cs.CL]

* how to adapt existing PLMs to model different input data and
  satisfy special properties in the generated text
* fine-tuning strategies for text generation

# 1 Introduction

* Existing surveys in this area only partially reviewed some related topics
  * Zaib+ [2020] and Guan+ [2020]: dialogue systems and summarization

# 2 General task definition and different text generation tasks

# 3 Architectures of PLMs that are used in text generation

# 4 Modeling Different Data Types from Input

## 4.1 Unstructured Input

* Thus, Liu and Lapata [2019] and Zheng and Lapata [2019] employed PLMs
* long document consisting of several sentences and paragraphs
  * PLMs trained on sentences or short paragraphs less accurately
    model long-range dependencies in a document
  * Zhang+ [2019b] and Xu+ [2020b] proposed hierarchical BERT to learn
    interactions between sentences with self-attention for document encoding
  * for capturing inter-sentential relations, DiscoBERT [Xu+ 2020a] stacked
    graph convolutional network (GCN) on top of BERT to model structural
    discourse graphs. By directly operating on the discourse units, DiscoBERT
    retains capacities to include more concepts or contexts
* multilingual text generation tasks
  * Conneau and Lample [2019] proposed to learn cross-lingual language models
    (XLMs) for multilingual language understanding
  * effective even in a low-resource language [Wada and Iwata, 2018]

# 5 Satisfying Special Properties for Output Text

# 6 Fine-tuning strategies for text generation 4

* we review several commonly-used fine-tuning strategies from different views

# 7 Future directions and conclusion
