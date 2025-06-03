Improving Abstraction in Text Summarization
Wojciech Kryściński, Romain Paulus, Caiming Xiong, Richard Socher
arXiv:1808.07913 [cs.CL]

# Abstract

* the level of actual abstraction as measured by novel phrases remains low
* We propose two techniques to improve the level of abstraction
  * we decompose the decoder into a
    * contextual network that retrieves relevant parts of the source document,
    * pretrained language model: language generation
* we propose a novelty metric that is
  optimized through policy learning to encourage the generation of novel phrases
* results comparable to SOTA models, as determined by ROUGE scores and human
  * while achieving a significantly higher level of abstraction
    as measured by n-gram overlap with the source document
