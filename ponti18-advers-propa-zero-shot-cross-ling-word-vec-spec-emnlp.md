Edoardo Maria Ponti, Ivan Vulić, Goran Glavaš, Nikola Mrkšić, Anna Korhonen
Adversarial Propagation and Zero-Shot Cross-Lingual Transfer of Word Vector Specialization
EMNLP 2018

code is available at https://github.com/cambridgeltl/ adversarial-postspec

# Abstract

* a novel approach to specializing the full distributional vocabulary
  * [an] adversarial post-specialization method
  * combining a standard L2-distance loss with an adversarial loss: the
    adversarial component produces more realistic output vectors
* three languages (it, de) and on three tasks:
  * word similarity, dialog state tracking, and lexical simplification. We
  * consistent improvements over ... other state-of-the-art specialization
* we also propose a cross-lingual transfer method for zero-shot specialization
  * without any lexical knowledge in the target language [or] bilingual data

# 1 Intro

* specialize the distributional spaces for a particular relation, e.g.,
  * synonymy (i.e., true similarity) (Faruqui+ 2015; Mrkšić+ 2017) or
  * hypernymy (Nickel and Kiela, 2017; Nguyen+ 2017; Vulić and Mrkšić, 2018)
* this paper ...  addresses the following two research questions:
  1. more realistic specialized vectors for the full vocabulary?
  1. where resources are scarce or non-existent?
* Our model ... casting the feed-forward specialization network as a generator
  * discriminator component learns to discern
    original specialized vectors (produced by any local specialization model)
    from vectors produced by transforming distributional vectors with the
    feed-forward post-specialization network (i.e., the generator)
* SOTA performance on standard word similarity benchmarks,
  outperforming the post-specialization model of Vulić+ (2018)
* two downstream tasks: lexical text simplification and dialog state tracking
* zero-shot language transfer of the specialization, §2.3
  * by coupling our adversarial specialization model with any unsupervised model
  for inducing bilingual vector spaces, such as the algorithm proposed by
  Conneau+ (2018), we can successfully perform
  * [i.e. no] linguistic constraints in those languages, [or] bilingual data

# 2 Methodology

* The post-specialization procedure (Vulić+ 2018) is a two-step process.  First,
  * words observed in external resources is fine-tuned using any off-the-shelf
    specialization model, such as the original retrofitting model (Faruqui+
    2015), counter-fitting (Mrkšić+ 2016), dLCE (Nguyen+ 2016), or
    state-of-theart ATTRACT REPEL ( AR ) specialization (Mrkšić+ 2017;
    Vulić+ 2017). We outline the initial specialization algorithms in §2.1. In
  * specialization is propagated to the entire vocabulary
    * adversarial architecture, described in §2.2

## 2.2 Adversarial Post-Specialization 3

# 5 Related Work 9

## Generative Adversarial Networks

* originally devised to generate images from input noise variables
  (Goodfellow+ 2014). The generation process is
* typically conditioned on discrete labels or data from other modalities, such
  as text (Mirza and Osindero, 2014)
* real data in input rather than (or in addition to) noise: in this case, the
  * pixelto-pixel (Isola+ 2017) or character-to-pixel (Reed+ 2016)
* The GAN objective can be mixed with more traditional loss functions: in these
  * apart from trying to fool the discriminator, the generator also
    minimizes the distance between input and target data
    (Pathak+ 2016; Li and Wand, 2016; Ledig+ 2017). The
  * distance can be formulated as the
    * mean squared error between the input and the target (Pathak+ 2016), their
    * feature maps (Li and Wand, 2016), both (Zhu+ 2016), or a loss
    * calculated on feature maps of a deep convolutional network (Ledig+ 2017)
* In the textual domain, adversarial models have been proven to support
  * domain adaptation (Ganin+ 2016) and
  * language transfer (Chen+ 2016)
    by learning domain/language-invariant latent features. Adversarial training
  * unsupervised mapping between monolingual vector spaces
    to learn cross-lingual word embeddings (Zhang+ 2017; Conneau+ 2018)

# 6 Conclusion and Future Work

* In future work, we will explore
  * more sophisticated adversarial models such as Cycle-GAN (Zhu+ 2017)
  * bootstrapping approaches to extract new lexical constraints from
    post-specialized embeddings
  * extend the method to asymmetric relations (e.g., hypernymy) and to
  * more target (resource-lean) languages
