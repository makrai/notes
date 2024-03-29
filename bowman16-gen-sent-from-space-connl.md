Samuel R Bowman, Luke Vilnis, Oriol Vinyals, AM Dai, R Jozefowicz, Samy Bengio
Generating Sentences from a Continuous Space
CoNLL 2016

# Abstract

* RNN-based variational autoencoder generative model that
  * incorporates distributed latent representations of entire sentences
  * explicitly model holistic properties of sentences such as
    style, topic, and high-level syntactic features
* Samples from the prior over these sentence representations produce remarkably
  diverse and well-formed sentences through simple deterministic decoding
* paths through this latent space generate coherent novel sentences
* negative results on the use of the model in language modeling

# 1 Intro

* Recurrent neural network language models (rnnlms, Mikolov+ 2011)
  * the SOTA in unsupervised generative modeling
  * rnnlm decoders conditioned on task-specific features are
    the SOTA in supervised tasks eg
    * machine translation (Sutskever+ 2014; Bahdanau+ 2015)
    * image captioning (Vinyals+ 2015; Mao+ 2015; Donahue+ 2015)
* a probabilistic model with no significant independence assumptions
* does not expose global features like topic or high-level syntactic properties
* variational autoencoder
  * inspiration from recent successes in modeling
    * images (Gregor+ 2015),
    * handwriting, and
    * natural speech (Chung+ 2015)
  * variational inference (Kingma and Welling, 2015; Rezende+ 2014)
* task
  * on a standard language modeling evaluation similar performance to
    existing rnnlms.  We also evaluate our model using a larger corpus
  * imputing missing words
    * we introduce a novel evaluation strategy using an adversarial classifier,
      * sidestepping the issue of intractable likelihood computations by
        inspiration from work on non-parametric two-sample tests and
        adversarial training
* qualitative techniques for analyzing the ability to learn high level sent feat
  * produce diverse, coherent sentences through purely deterministic decoding
  * interpolate smoothly between sentences

# 3 A VAE for sentences

## 3.1 Optimization challenges

### Word dropout and historyless decoding

* In addition to weakening the penalty term on the encodings, we also
* weakening the decoder. As in rnnlms and sequence autoencoders
* [training originally is] conditioned on the ground-truth previous word
* [now] remove some or all of this conditioning information
  * by randomly replacing some fraction of the [word tokens with] `unknown`
    * forces the model to rely on the latent variable ~z to make
    * a variant of word dropout (Iyyer+ 2015; Kumar+ 2015),
      applied not to a feature extractor but to a decoder. We also experimented
  * standard dropout (Srivastava+ 2014)
    applied to the input word embeddings in the decoder, but this
    did not help the model learn to use the latent variable
