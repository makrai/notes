Reformer: The Efficient Transformer
Nikita Kitaev, Łukasz Kaiser, Anselm Levskaya
ICLR 2020 arXiv:2001.04451 [cs.LG]

* training Transformers can be prohibitively costly, especially on long seqs
* We introduce two techniques to improve the efficiency of Transformers. For
  * replace dot-product attention by one that uses locality-sensitive hashing,
    changing its complexity from O(L2) to O(LlogL), where L is the length of the
  * reversible residual layers instead of the standard residuals, which
    * allows storing activations only once in the training process
      instead of N times, where N is the number of layers
* Reformer performs on par with Transformer models while being
  much more memory-efficient and much faster on long sequences

# 1 Intro

* long sequences
  * Up to 11 thousand tokens of text in a single example (Liu+ 2018) and when
  * other modalities, like music (Huang+ 2018) and images (Parmar+ 2018), even
    longer sequences are commonplace. These large-scale long-sequence models
  * some argue that this trend is breaking NLP research 1 . Many large
    https://hackingsemantics.xyz/2019/leaderboards/ 1
* If our memory use was only per-layer, then we should fairly easily fit a large
  Transformer even on sequences of length 64K on a single accelerator. Further,
  the whole corpus used to train BERT only requires 17GB to store. Why is it
  then that we cannot even fine-tune these models on single machines?

The above estimate includes only per-layer memory and input activations cost and
does not take into account the following major sources of memory use in the
Transformer
  * Memory in a model with N layers is N -times larger than in a single-layer
* activations need to be stored for back-propagation
* We introduce the Reformer model which solves these problems using
  * Reversible layers, first introduced in Gomez+ (2017), enable storing only a
    single copy of activations in the whole model, so the N factor disappears
  * Splitting activations inside feed-forward layers and processing them in
    chunks removes the d f f factor and saves memory inside feed-forward layers
  * Approximate attention computation based on locality-sensitive hashing
    replaces the O(L 2 ) factor in attention layers with O(L log L) and so
    allows operating on long sequences
* negligible impact on the training process compared to the standard
  * Splitting activations in fact only affects the implementation; it is
    numerically identical to the layers used in the Transformer. Applying
  * reversible residuals instead of the standard ones does change the model but
    has a negligible effect on training in all configurations
  * locality-sensitive hashing in attention is a more major change that can
    influence the training dynamics, depending on the number of concurrent
    hashes used. We study this parameter and find a value which is both
    efficient to use and yields results very close to full attention
* We experiment
  * on a
    * synthetic task, a
    * text task (enwik8) with sequences of length 64K and an
    * image generation task (imagenet-64 generation) with seqs of length 12K
  * Reformer matches the results obtained with full Transformer but runs much
    faster, especially on the text task, and with orders of magnitude better
    memory efficiency
