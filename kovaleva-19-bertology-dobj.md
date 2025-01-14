Revealing the Dark Secrets of BERT
Olga Kovaleva, Alexey Romanov, Anna Rogers, Anna Rumshisky
2019 EMNLP-IJCNLP

# Abstract

* we focus on the interpretation of self-attention
* Using a subset of GLUE tasks and a set of handcrafted features-of-interest,
  we propose the methodology and carry out a qualitative and quantitative
  analysis of the information encoded by the individual BERT’s heads
* Our findings suggest that
  * a limited set of attention patterns repeated across different heads,
    indicating the overall model overparametrization
  * While different heads consistently use the same attention patterns, they
    have varying impact on performance across different tasks
* disabling attention in certain heads leads to a performance improvement over
  the regular fine-tuned BERT models
