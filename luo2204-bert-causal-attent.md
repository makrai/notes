DecBERT: Enhancing the NLU of BERT with Causal Attention Masks
Ziyang Luo, Yadong Xi, Jing Ma, Zhiwei Yang, Xiaoxi Mao, Changjie Fan, R Zhang
NAACL-HLT 2022 Findings arXiv:2204.08688 [cs.CL]

* Since 2017, the Transformer-based models play critical roles in NLP
* hE attention mechanism utilized in Transformer Encoder cannot automatically
  capture the information of word order, so explicit position embeddings are
  generally required to be fed into the target model
* In contrast, Transformer Decoder with the causal attention masks is naturally
  sensitive to the word order
* we: improving the position encoding ability of BERT
  with the causal attention masks
  * a new pre-trained language model DecBERT and
  * evaluate it on the GLUE benchmark.  Experimental results show that
    * the causal attention mask is effective for BERT on the NLU tasks;
    * our DecBERT model without position embeddings achieve comparable
      performance on the GLUE benchmark; and
    * our modification accelerates the pre-training process and
    * DecBERT w/ PE achieves better overall performance than the baseline sys
      when pre-training with the same amount of computational resources

# 1 Intro

* Multi-Head Self-Attention (M HA ) mechanism (Vaswani+ 2017). Since M HA is
  * designed as an order-invariant mechanism (Lee+ 2019), Transformer Encoder
  * without the help of position embeddings should [limited to the] same
    intuitions with the bag-of-word model. On the other hand,
  * in Transformer Decoder, the causal attention masks make the M HA different
    from that of the Transformer Encoder
    * Tsai+ (2019): M HA with such attention masks is not permutation equiv,
      indicating that Transformer Decoder is sensitive to word order
* several studies focus on enriching the position information of BERT for NLU
  (Dai+ 2019; Dufter+ 2020; He+ 2020; Wu+ 2021a; Ke+ 2021), eg introducing
  * extra learnable parameters to trace the word order. Previous analysis also
  * the lower layers of BERT tend to capture rich surface-level language
    structural information such as position information (Jawahar+ 2019).  In
  * we propose to enrich the position information in the lower hidden layers
    instead of introducing extra learnable positional parameters
* we
  * analysis experiments to examine the effectiveness of causal attention masks
  in terms of capturing position information. Then we propose
  * a new pre-trained language model DecBERT by adding the causal attention
    masks into the lower layers of BERT (eg the first two layers) to enhance
    the position encoding ability
    * naturally sensitive to word order
  * Then we pre-train our DecBERT as a masked language model, following the
    same objective as BERT. To verify whether our modification can help BERT
  * comparison with a variant of our DecBERT that excludes any position
    embeddings
  * experimental results show that DecBERT w/o PE has
    * 77 times (4.59 vs.  353.97) lower valid PPL score than BERT w/o PE and
      achieves comparable performance with BERT w/ PE on downstream tasks,
      corroborating the effectiveness of our modification
    * better performances than BERT on most downstream tasks when pre-training
      with the same amount of time and computational resources
    * our modification can also accelerate pre-training
      * By analyzing the pre-training process, we find that

# 5 Related work

* Irie+ (2019) train the Transformer Language Models with speech dataset. They
  * models without position embeddings have lower (sic!) perplexity scores
  * Schlag+ (2021a) introduce a new Linear Transformer Language Model with
    fast weight memories (Schmidhuber, 1992; Schlag+ 2021b), which has
    lower perplexity without position encodings on the WikiText-103 dataset
* an explosion of work focuses on proposing a
  better method to add the position information into the pre-trained LM
  * Dufter+ (2021) give a comprehensive introduction of different position
    encodings methods of Transformer
    * They divide position encodings into three approaches
    * add position embeddings to the input before it is fed to the Transformer
      (Vaswani+ 2017; Shaw+ 2018; Devlin+ 2019; Kitaev+ 2020; Liu+ 2020;
      Press+ 2020; Wang+ 2020)
    * directly modify the attention matrix
      (Dai+ 2019; Dufter+ 2020; He+ 2020; Wu+ 2021a; Ke+ 2021; Su+ 2021)
    * combine the first two approaches together
    * all of them focus on introducing an extra set of parameters to trace the
      word order. Our work chooses to make use of the causal attention masks
* Most similar to our modification in Section 3.2,
  Im and Cho (2017) propose a self-attention based model which achieve better
  performance on SNLI task (Bowman+ 2015) without the help of explicit
  position encodings
  * hE models are different from the standard Transformer and use
    extra local attention masks to control the information flow. With the
* popularity of the Transformer model in the Computer Vision field, some works
  propose different methods to make Vision Transformer know word order
  implicitly (Chu+ 2021; Yuan+ 2021; Wu+ 2021b), but
  * all of them modify the models with convolution neural network (Lecun+ 1998)
