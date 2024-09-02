RoFormer: Enhanced Transformer with Rotary Position Embedding
Jianlin Su, Yu Lu, Shengfeng Pan, Ahmed Murtadha, Bo Wen, Yunfeng Liu
arXiv:2104.09864 [cs.CL]

already integrated into Huggingface: \url{this https URL}

* Position encoding recently has shown effective in the transformer
  * enables valuable supervision for dependency modeling between elements at
    different positions of the sequence. In this paper, 
* we first investigate various methods to integrate positional information into
  the learning process of transformer-based language models. Then, we propose a
  * novel method named Rotary Position Embedding(RoPE) to effectively leverage
  * encodes the absolute position with a rotation matrix and
    meanwhile incorporates the explicit relative position dependency in
    self-attention formulation.
    * by multiplying the context representations with a rotation matrix with a
      clear theoretical interpretation
  * valuable properties, including the
    * flexibility of sequence length, 
    * decaying inter-token dependency with increasing relative distances, and the
    * equipping the linear self-attention with relative position encoding.
* evaluation on various long text classification benchmark datasets. Our
  * consistently overcomes its alternatives.  Furthermore, we provide a
* theoretical analysis to explain some experimental results

# 1 Intro

* The sequential order of words is of great value to NLU. 
  * Recurrent neural networks (RRNs) based models encode tokens’ order by
    recursively computing a hidden state along the time dimension.
  * Convolution neural networks (CNNs) based models (CNNs) Gehring+ [2017] 
    * were typically considered position-agnostic, but recent work 
    * nL Islam+ [2020] has shown that the commonly used padding operation can
      implicitly learn position information. Recently, the 
  * pre-trained language models (PLMs), which were built upon the transformer
    Vaswani+ [2017], have achieved the SOTA performance of various NLP tasks,
    * context representation learning Devlin+ [2019], machine translation
      Vaswani+ [2017], and language modeling Radford+ [2019], to name a few.
    * self-attention mechanism to semantically capture the contextual
      representation of a given corpus. As a consequence, PLMs achieve a
    * significant improvement in terms of parallelization over RNNs and 
    * improved modeling ability of longer intra-token relations
      compared to CNNs1
      * A stack of multiple CNN layers can also capture longer intra-token
        relation, here we only consider single layer setting
* the self-attention architecture is position-agnostic Yun+ [2020]
  * approaches to encode the position information into the learning process.
  * absolute
    * generated absolute position encoding through a pre-defined function
      Vaswani+ [2017] was added to the contextual representations,
    * trainable absolute position encoding 
      Gehring+ [2017], Devlin+ [2019], Lan+ [2020], Clark+ [2020],
      Radford+ [2019], Radford and Narasimhan [2018]
    * relative position encoding
      * Parikh+ [2016], Shaw+ [2018], Huang+ [2018], Dai+ [2019], Yang+ [2019],
        Raffel+ [2020], Ke+ [2020], He+ [2020], Huang+ [2020] focus on relative
      * typically encodes the relative position information into the attention
        mechanism. In addition
  * Liu+ [2020] have proposed to model the dependency of position encoding from
    the perspective of Neural ordinary differential equations (ODE) Chen+
    [2018a], and the authors of 
  * Wang+ [2020] model the position information in complex space.
  * these approaches, they commonly add the position information to the context
    representation and thus render them unsuitable for the linear
    self-attention architecture.
* our Rotary Position Embedding (RoPE) leverages the positional information
  into the learning process of PLMS. Specifically, RoPE 
  * encodes the absolute position with a rotation matrix and meanwhile
    incorporates the explicit relative position dependency in self-attention
  * valuable properties, including the sequence length flexibility, decaying
    inter-token dependency with increasing relative distances, and the
    capability of equipping the linear self-attention with relative position
    encoding.
* Experimental results on various long text classification benchmark datasets
  * the enhanced transformer with rotary position embedding, namely RoFormer,
  * better performance compared to baseline alternatives and thus demonstrates
* contributions are three-folds as follows:
  * We investigated the existing approaches to the relative position encoding
    * they are mostly built based on the idea of the decomposition of adding
      position encoding to the context representations. We introduce a novel
    * RoPE leverages the positional information into the learning process of
  * RoPE decays with the relative distance increased, which is desired for
    natural language encoding. We kindly argue that previous relative position
    encoding-based approaches are not compatible with linear self-attention.
  * We evaluate the proposed RoFormer on various long text benchmark datasets.
    Our experiments show that it consistently achieves better performance
    compared to its alternatives. Some experiments with pre-trained language
    models are available on GitHub:
    https://github.com/ZhuiyiTechnology/roformer.  The remaining of the paper

# 2 Formal description of the position encoding problem in self-attention
and previous works

# 3 Rotary position encoding (RoPE) and its properties in 

# 4 Experiments 

# 5 Conclusion
(5).
