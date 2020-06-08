Kevin Clark, Minh-Thang Luong, Quoc V. Le, Christopher D.  Manning
ELECTRA: Pre-training Text Encoders as Discriminators Rather Than
ICLR 2020 https://arxiv.org/abs/2003.10555 arXiv.orgarXiv.org

https://github.com/google-research/electra

# Abstract

* we propose replaced token detection. Instead of masking the input
  * corrupts [text] by replacing some tokens with
    plausible alternatives sampled from a small generator
* more efficient than MLM because the task is defined over all input tokens
* substantially outperform BERT given the same model size, data, and compute
  * particularly for small models; for example, we train a model on one GPU for
    4 days that outperforms GPT (trained using 30x more compute) on the GLUE
* performs comparably to RoBERTa and XLNet while using less than 1/4 of their
  compute and outperforms them when using the same amount of compute

# 1 Introduction

* Current SOTA representation learning methods for language
  * can be viewed as learning denoising autoencoders (Vincent+ 2008)
    * select a small subset of the unlabeled input sequence (typically 15%),
    * mask the identities of those tokens (e.g., BERT; Devlin+ (2019)) or
    * attention to those tokens (e.g., XLNet; Yang+ (2019)), and then train the
      network to recover the original input
  * more effective than conventional LM pre-training due to bidirectional repr
  * substantial compute cost because the network only learns from 15%
* we propose replaced token detection, a pre-training task in which the model
  * to distinguish real input tokens from plausible but synthetically generated
  * replacements from a small masked language model
* solves a mismatch in BERT (although not in XLNet) where
  the network sees artificial [MASK] tokens during pre-training
  but not when being fine-tuned on downstream tasks
* We then pre-train the network as a discriminator
  * In contrast, MLM trains the network as a generator that predicts the
    original identities of the corrupted tokens. A key advantage of our
  * our model learns from all input tokens instead of just the small masked-out
    subset, making it more computationally efficient
* Although our approach is reminiscent of training the discriminator of a GAN,
  * not adversarial in that the generator is trained with maximum likelihood
    due to the difficulty of applying GANs to text (Caccia+ 2018)
* ELECTRA for “Efficiently Learning an Encoder that Classifies Token Replacem
  * we apply it to pre-train Transformer text encoders (Vaswani+ 2017) that
    can be fine-tuned on downstream tasks
  * ablations, we show that learning from all input positions causes ELECTRA to
    * much faster than BERT
    * higher accuracy on downstream tasks when fully trained
* we train ELECTRA models of various sizes and evaluate their
  downstream performance vs. their compute requirement
  * tasks
    * GLUE natural language understanding benchmark (Wang+ 2019) and
    * SQuAD question answering benchmark (Rajpurkar+ 2016)
  * ELECTRA substantially outperforms MLM-based methods such as BERT and XLNet
    given the same model size, data, and compute (see Figure 1)
    * ELECTRA-Small model that
      * can be trained on 1 GPU in 4 days
      * outperforms
        * a comparably small BERT model by 5 points on GLUE, and even outperfor
        * the much larger GPT model (Radford+ 2018)
    * also works well at large scale, where we train an ELECTRA-Large model
      * performs comparably to RoBERTa (Liu+ 2019) and XLNet (Yang+ 2019),
        despite having fewer parameters and using 1/4 of the compute for traing
  * outperforms ALBERT (Lan+ 2019) on GLUE and sets a new SOTA for SQuAD 2.0

# 2 Method 2

# 3 Experiments 4

## 3.5 E FFICIENCY A NALYSIS

* We have suggested that posing the training objective over a small subset of
  tokens makes masked language modeling inefficient. However, it isn’t entirely
* not obvious MLM model still receives a large number of input tokens even
* we compare a series of other pre-training objectives that are designed to be
* a set of “stepping stones” between BERT and ELECTRA
  * ELECTRA 15%: ELECTRA but only the 15% of the tokens that was masked out
  * Replace MLM: MLM but masked-out tokens replaced with generated tokens
    * tests to what extent ELECTRA’s gains come from solving the discrepancy
      of [MASK] tokens during pre-training but not fine-tuning
  * All-Tokens MLM: Like in Replace MLM but model predicts the identity of all
    * a combination of BERT and ELECTRA. Note that
* Results are shown in Table 5. First, we find that ELECTRA is greatly
  * ELECTRA 15% performs much worse than ELECTRA. Secondly, we find that BERT
  * Replace MLM slightly outperforms BERT. We note that BERT (including our)
  * All-Tokens MLM: closes most of the gap between BERT and ELECTRA
* In total, these results suggest
  * a large amount of ELECTRA’s improvement <~ learning from all tokens and a
  * smaller amount <~ alleviating the pre-train fine-tune mismatch
* The improvement of ELECTRA over All-Tokens MLM suggests that the ELECTRA’s
  gains come from more than just faster training
  * We speculate that ELECTRA is more parameter-efficient than BERT because it
    does not have to model the full distribution of possible tokens at each
    position

# 4 Related work

## Self-Supervised Pre-training for NLP Self-supervised learning has been used to

* word representations (Collobert+ 2011; Pennington+ 2014) and more recently
* contextual representations of words though
  objectives such as LM (Dai & Le, 2015; Peters+ 2018; Howard & Ruder, 2018)
* BERT (Devlin+ 2019) pre-trains a large Transformer (Vaswani+ 2017) at MLM
  * extensions to BERT.  For example,
  * MASS (Song+ 2019) and UniLM (Dong+ 2019) extend BERT to generation tasks
    by adding auto-regressive generative training objectives
  * ERNIE (Sun+ 2019a) and SpanBERT (Joshi+ 2019) mask out contiguous
    sequences of token for improved span representations
  * [these ideas] may be complementary to ELECTRA; we think it would be
  * XLNet (Yang+ 2019) masks attention weights such that the input sequence
    is autoregressively generated in a random order.  However, this method
    * same inefficiencies as BERT because XLNet only generates 15% of the
    * Like ELECTRA, XLNet not requiring [MASK] tokens, although this isn’t
      * XLNet uses two “streams” of attention during pre-training but
        only one for fine-tuning. Recently, models such as
  * BERT can effectively be distilled down to a smaller model
    * TinyBERT (Jiao+ 2019) and MobileBERT (Sun+ 2019b)

## Generative Adversarial Networks GANs (Goodfellow+ 2014) are effective at

* Radford+ (2016) propose using the discriminator of a GAN in downstream tasks,
  which is similar to our method.  GANs have been
* applied to text data (Yu+ 2017; Zhang+ 2017), although SOTA approaches still
  lag behind standard maximum-likelihood training (Caccia+ 2018; Tevet+ 2018)
* our generator is particularly reminiscent of MaskGAN (Fedus+ 2018), which
  trains the generator to fill in tokens deleted from the input

## Contrastive Learning Broadly, contrastive learning methods distinguish

* applied to many modalities including
  text (Smith & Eisner, 2005),
  images (Chopra+ 2005), and
  video (Wang & Gupta, 2015; Sermanet+ 2017) data. Common
* approaches
  * embedding spaces where related data points are similar (Saunshi+ 2019) or
  * rank real data points over negative samples (Collobert+ 2011; Bordes+ 2013)
* ELECTRA is particularly related to
  Noise-Contrastive Estimation (NCE) (Gutmann & Hyvärinen, 2010)
  * binary classifier to distinguish real and fake data points
* Word2Vec (Mikolov+ 2013) uses contrastive learning. In fact,
  * ELECTRA can be viewed as a massively scaled-up version of CBOW with NS
  * CBOW also
    predicts an input token given surrounding context and
    negative sampling rephrases the learning task as a binary classification
  * bag-ofvectors encoder rather than a transformer and a
  * simple proposal distribution derived from unigram token frequencies
