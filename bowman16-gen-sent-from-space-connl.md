{Samuel R. Bowman, Luke Vilnis}, Oriol Vinyals, Andrew M. Dai, Rafal
  Jozefowicz, and Samy Bengio
Generating Sentences from a Continuous Space
CoNLL. 2016

# Abstract

* rnn-based variational autoencoder generative model that
  * incorporates distributed latent representations of entire sentences. This
  * explicitly model holistic properties of sentences such as
    style, topic, and high-level syntactic features
* Samples from the prior over these sentence representations remarkably produce
  diverse and well-formed sentences through simple deterministic decoding
* paths through this latent space ... generate coherent novel sentences
* negative results on the use of the model in language modeling

# 1 Intro

* Recurrent neural network language models (rnnlms, Mikolov et al., 2011)
  * the state of the art in unsupervised generative modeling
  * In supervised settings, rnnlm decoders conditioned on task-specific
    features are the state of the art in tasks
    * like machine translation (Sutskever et al., 2014; Bahdanau et al., 2015)
    * image captioning 
      (Vinyals et al., 2015; Mao et al., 2015; Donahue et al., 2015)
* a probabilistic model with no significant independence assumptions
* does not expose ... global features like topic or of high-level syntactic
  properties
* variational autoencoder
  * inspiration from recent successes in modeling
    * images (Gregor et al., 2015), handwriting, and
    * natural speech (Chung et al., 2015)
  * variational inference (Kingma and Welling, 2015; Rezende et al., 2014)
* task
  * on a standard language modeling evaluation ... similar performance to
    existing rnnlms.  We also evaluate our model using a larger corpus
  * imputing missing words. For this task, we introduce a
    * novel evaluation strategy using anadversarial classifier, 
      * sidestepping the issue of intractable likelihood computations by
      * inspiration from work on non-parametric two-sample tests and
        adversarial training
* qualitative techniques for analyzing the ability ... to learn high level
  features of sentences. We find that they can 
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
    * a variant of word dropout (Iyyer et al., 2015; Kumar et al., 2015),
      applied not to a feature extractor but to a decoder. We also experimented
  * standard dropout (Srivastava et al., 2014)
    applied to the input word embeddings in the decoder, but this
    did not help the model learn to use the latent variable
