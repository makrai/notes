Kevin Clark, Minh-Thang Luong, Quoc V. Le, Christopher D.  Manning
ELECTRA: Pre-training Text Encoders as Discriminators Rather Than
https://arxiv.org/abs/2003.10555 arXiv.orgarXiv.org

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
    can be fine-tuned on downstream tasks. Through a series of
  * ablations, we show that learning from all input positions causes ELECTRA to
    * much faster than BERT. We also show ELECTRA achieves
    * higher accuracy on downstream tasks when fully trained
* we train ELECTRA models of various sizes and evaluate their
  downstream performance vs. their compute requirement
  * tasks
    * GLUE natural language understanding benchmark (Wang+ 2019) and
    * SQuAD question answering benchmark (Rajpurkar+ 2016)
  * ELECTRA substantially outperforms MLM-based methods such as BERT and XLNet
    given the same model size, data, and compute (see Figure 1). For example,
    * ELECTRA-Small model that
      * can be trained on 1 GPU in 4 days. 2 ELECTRA-Small
      * outperforms
        * a comparably small BERT model by 5 points on GLUE, and even outperforms
        * the much larger GPT model (Radford+ 2018)
    * also works well at large scale, where we train an ELECTRA-Large model
      * performs comparably to RoBERTa (Liu+ 2019) and XLNet (Yang+ 2019),
        despite having fewer parameters and using 1/4 of the compute for traing
  * outperforms ALBERT (Lan+ 2019) on GLUE and sets a new SOTA for SQuAD 2.0
