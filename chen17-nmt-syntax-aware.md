Improved Neural Machine Translation with a Syntax-Aware Encoder and Decoder
Huadong Chen, Shujian Huang, David Chiang, Jiajun Chen
2017

# Abstract

* we propose
  * a bidirectional tree encoder which
    learns both sequential and tree structured representations;
  * a tree-coverage model that
    lets the attention depend on the source-side syntax.
* on Chinese-English outperform the sequential attentional model as well as
  a stronger baseline with a bottom-up tree encoder and word coverage

# 1 Intro

* NMT models still suffer from syntactic errors such as attachment (Shi+ 2016).
  We argue that instead of letting the NMT model rely solely on the
  implicit structure it learns during training (Cho et al.,
* to guide its reordering decisions better
  * language pairs with significant reordering, like Chinese-English
  * attention model (Bahdanau+ 2015) and the
  * coverage model (Tu+ 2016; Mi+ 2016)
  * cannot capture phrasal cohesion between the two languages (Fox 02; Kim+ 17)
* we improve the tree encoder of Eriguchi+ (2016) by introducing a
  bidirectional tree encoder
* In the decoder, we incorporate source syntactic tree structure into the
  attention model via
  an extension of the coverage model of Tu+ (2016)[,] tree-coverage model
