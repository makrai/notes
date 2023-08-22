LLM.int8(): 8-bit Matrix Multiplication for Transformers at Scale
Tim Dettmers, Mike Lewis, Younes Belkada, Luke Zettlemoyer
NeurIPS 2022. Camera-ready version

* We open-source our software
  * Hugging Face Transformers (Wolf+ 2019) integration
  => our method available to all Hugging Face Models that have linear layers

# Abstract

* Large language models require significant GPU memory for inference
* We develop a procedure for Int8 matrix multiplication
  for feed-forward and attention projection layers in transformers, which
  * cut the memory needed for inference by half while retaining full precision
  * a 175B parameter 16/32-bit checkpoint can be loaded, converted to Int8, and
    used immediately without performance degradation
  * This is made possible by understanding and working around properties of
    highly systematic emergent features in transformer language models that
    dominate attention and transformer predictive performance. To
    cope with these features, we develop a
* two-part quantization procedure, LLM.int8(). We first use
  1. vector-wise quantization with separate normalization constants for each
     inner product in the matrix multiplication, to quantize most of the
     features
  2. for the emergent outliers, we also include a new mixed-precision
     decomposition scheme, which isolates the outlier feature dimensions into a
     16-bit matrix multiplication while
  * still more than 99.9% of values are multiplied in 8-bit. Using LLM.int8(),
* it is possible to perform inference in LLMs with up to 175B parameters
  without any performance degradation. This result makes such models much more
  * eg possible to use OPT-175B/BLOOM on a single server with consumer GPUs

# 1 Intro

* 8-bit quantization methods for transformers have been developed
  (Chen+ 2020; Lin+ 2020; Zafrir+ 2019; Shen+ 2020)
  * reduce memory use
  * hE they degrade performance, usually require tuning quantization further
    after training, and have only been studied for models with less than 350M
    parameters
  * Degradation-free quantization up to 350M parameters is poorly understood,
  * multi-billion parameter quantization remains an open challenge
* we present the first multi-billion-scale Int8 quantization procedure for
  transformers that does not incur any performance degradation. Our procedure
  makes it possible to load a 175B parameter transformer with 16 or 32-bit
  weights, convert the feed-forward and attention projection layers to 8-bit,
  and use the resulting model immediately for inference without any performance
  degradation
* We achieve this result by solving two key challenges: need for/to
  * higher quantization precision at scales beyond 1B parameters and the need
  * explicitly represent the sparse but systematic large magnitude outlier
    features that ruin quantization precision once they emerge in all
    transformer layers starting at scales of 6.7B parameters
    * This loss of precision is reflected in C4 evaluation perplexity (Sec 3)
      and zeroshot accuracy as soon as these outlier features emerge, Fig 1
* We show that with the first part of our method, vector-wise quantization, it
  is possible to retain performance at scales up to 2.7B parameters
  * For vector-wise quantization, matrix multiplication can be seen as a
    sequence of independent inner products of row and column vectors. As such,
    we can use a separate quantization normalization constant for each inner
    product to improve quantization precision
  * We can recover the output of the matrix multiplication by denormalizing by
    the outer product of column and row normalization constants
    before we perform the next operation
* To scale beyond 6.7B parameters without performance degradation,
  it is critical to understand the emergence of extreme outliers in the feature
  dimensions of the hidden states during inference. To this end
  * we provide a new descriptive analysis which shows that
    large features with magnitudes up to 20x larger than in other dimensions
    first appear in about 25% of all transformer layers and then gradually
    spread to other layers as we scale transformers to 6B parameters
  * At around 6.7B parameters, a phase shift occurs, and
    all transformer layers and 75% of all sequence dimensions are affected by
    extreme magnitude features.  These outliers are highly systematic: at the
    6.7B scale, 150,000 outliers occur per sequence, but they are concentrated
    in only 6 feature dimensions across the entire transformer
* Setting these outlier feature dimensions to zero
  decreases top-1 attention softmax probability mass by more than 20% and
  degrades validation perplexity by 600-1000%
  despite them only making up about 0.1% of all input features
  * In contrast, removing the same amount of random features
    decreases the probability by a maximum of 0.3% and
    degrades perplexity by about 0.1%
* To support effective quantization with such extreme outliers, we develop
  mixed-precision decomposition, the second part of our method
  * 16-bit matrix multiplication for the outlier feature dimensions
  *  8-bit matrix multiplication for the other 99.9% of the dimensions
* LLM.int8() = vector-wise quantization + mixed precision decomposition. We
* we can perform inference in LLMs with up to 175B parameters without any
  performance degradation
  * Our method provides new insights into the effects of these outliers on
    model performance
  * possible for the first time to use very large models eg OPT-175B/BLOOM, on
    a single server with consumer GPUs
* lossy (App D)
  * our work focuses on no degrad
  * we maintain end-to-end inference runtime performance for LLMs eg BLOOM-176B
  * modest matrix multiplication speedups for GPT-3 models of size >= 6.7B
