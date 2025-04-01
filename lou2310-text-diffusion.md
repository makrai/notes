Discrete Diffusion Modeling by Estimating the Ratios of the Data Distribution
Aaron Lou, Chenlin Meng, Stefano Ermon
ICML 2024 Oral. Code at this https URL arXiv:2310.16834 [stat.ML]

# Abstract

* diffusion models have groundbreaking performance for many generative modeling
  * hE fallen short on discrete data domains such as natural language
  * they rely on the well-established theory of score matching, but efforts to
  * not generalized to discrete structures with the same empirical gains. In
* we bridge this gap by proposing score entropy, a novel loss that 
  * score entropy naturally extends score matching to discrete spaces,
    integrates seamlessly to build discrete diffusion models, and 
    significantly boosts performance
* Experimentally, we test our Score Entropy Discrete Diffusion models (SEDD) on
  standard language modeling tasks
  * For comparable model sizes, SEDD beats existing language diffusion paradigms
    (reducing perplexity by 25-75\%) and is 
  * competitive with autoregressive models, in particular outperforming GPT-2
  * without requiring distribution annealing techniques like temperature scaling
    (around 6-8× better generative perplexity than un-annealed GPT-2), 
  * can trade compute and quality (similar quality with 32× fewer network
    evaluations), and 
  * enables controllable infilling (matching nucleus sampling quality while
    enabling other strategies besides left to right prompting)

# 1 Intro

* generative modeling
  * model learns how to generate novel samples from unstructured data. With the
  * capabilities, such as creating images given only text (Ramesh+ 2022)
  * answering complex questions (Brown+ 2020)
* probabilistic modeling technique. For discrete data such as natural language,
  * autoregressive modeling (Yule, 1971)– arguably the simplest modeling type
    since it derives from the probabilistic chain rule–has remained the only
  * autoregressive transformers have produced stunning results (Vaswani+ 2017;
    Radford+ 2019), there are limits. For example, the 
  * hE sequential sampling of tokens is slow, hard to control, and often
    degrades without distribution annealing techniques like nucleus sampling
    (Holtzman+ 2019)
* diffusion models (Sohl-Dickstein+ 2015; Ho+ 2020; Song+ 2021c) 
  * to language domains (Li+ 2022; Austin+ 2021). Yet, despite considerable
  * no such approach yet rivals autoregressive modeling, as they are 
  * not competitive on likelihoods, are slower to sample from, and do not
  * resorting to heavy annealing and empirical alterations
* we challenge the longstanding dominance of autoregressive models by
  introducing Score Entropy Discrete Diffusion models (SEDD). 
  * SEDD parameterizes a reverse discrete diffusion process
    using the ratios of the data distribution. These 
  * the ratios are learned using score entropy, a novel loss that is
  * score entropy is analogous to score matching for standard diffusion models
    (Hyvärinen, 2005; Song & Ermon, 2019) and results in several 
  * empirical benefits:
1. On core language modeling tasks, SEDD 
  * outperforms all existing language diffusion models (Li+ 2022; Austin+ 2021;
    Gulrajani & Hashimoto, 2023; He+ 2022) by large margins and is 
  * competitive with autoregressive models of the same size (beating GPT-2 on
    its zero-shot perplexity tasks (Radford+ 2019))
2. SEDD generates high quality unconditional samples and enables one to
   * trade off compute for quality. 
   * When measuring the generative perplexity (given by large models) of
     unconditional and un-annealed samples from similarly sized models, SEDD
     beats GPT-2 by 6-8× and can match performance using 32× fewer function
     evaluations
3. By directly parameterizing probability ratios, SEDD is highly controllable
  * one can prompt SEDD from arbitrary positions without specialized training
  * For both standard (left to right) and infilling, SEDD 
    * outperforms language diffusion models and is 
    * comparable with autoregressive models with nucleus sampling (as measured
      by MAUVE score (Pillutla+ 2021))

# 6. Related Work

## Continuous Diffusion Models for Text Data

* Initially proposed by Li+ (2022), continuous language diffusion models 
* embed tokens in a latent space, learn a diffusion model there, and take the
  nearest neighbor to dequantize
* significant results by iterating on several empirical components. For example,
  * alternative loss functions (moving away from likelihood-based score
    matching, Han+ 2022; Mahabadi+ 2023) and 
  * explicitly encoding conditional information
    (eg inputting an infilling mask, Gong+ 2023; Dieleman+ 2022)
  * distribution annealing methods
    like thresholding (Li+ 2022) and classifier-free guidance (Ho, 2022) 
    can further improve generation quality, although recent work has shown that
    * methods can obviate the need for distribution annealing
      * self-conditioning (Strudel+ 2022) and designing a
      * less sparse embedding space (eg based on bits, Chen+ 2022) 
* Gulrajani & Hashimoto (2023): with many surgical changes to the training
  paradigm, it is possible for language diffusion models to
  begin approaching autoregressive performance for likelihoods

## Discrete Diffusion Models. 

* Most discrete diffusion works follow the framework set out by D3PM (Austin+
  2021) which mimics “mean prediction” (Ho+ 2020). These discrete diffusion
* largely applied to fields other than language (e.g. images), likely due to
  empirical challenges. Despite this,
* some works have shown strong performance on language, particularly for
  seq-to-seq tasks and more efficient generation (Zheng+ 2023; Chen+ 2023; Ye+
  2023)
* discrete diffusion has tended to be advantageous over continuous diffusion
  in reducing network evaluations

## SEDD vs Prior Work. 

* discrete
  * similarity: a discrete diffusion models that focuses on score matching, 
    * score matching is the crucial ingredient for continuous diffusions
      (Song & Ermon, 2019; Ho+ 2020)
    * Many continuous diffusion works also focus on
      reversing a discrete diffusion process
      (Campbell+ 2022; Benton+ 2022; Sun+ 2023)
    * score entropy is naturally related with prior training objectives
  * diff from discrete: SEDD focuses on designing score entropy
    * a principled, scalable, and performant objective (namely denoising score)
    * prior losses either/or
      * the equivalents of implicit score entropy (which is intractable and high
        variance) or propose 
      * alternate losses suffer from other issues. These critical differences
    * large improvements for language tasks, where prior discrete diffusion models
      have conspicuously struggled on
* diff from continuous: better results (for both perplexity and generation) than
  * without resorting to empirically driven heuristics
    * desirable since discrete data should necessitate a novel approach. 
  * Future work could adapt empirical designs from continuous diffusion, further
* diff from autoregressive models, achieving competitive
  perplexities (beating GPT-2) and generation quality (beating nucleus sampling)
* still a large gap with modern large language models
  * we believe that future work can bridge this using SEDD as a backbone

## SEDD vs Autoregressive Sampling Iterations. SEDD and autoregressive models

* significantly different sampling procedures due to the introduction of the
* KV-cache for standard decoder-only transformer models. In particular, this
  * complicates the inference code (as each network pass changes from being a
    standard full batch forward) and trades off speed with memory
  * our (know[ingly]) unoptimized codebase vs the existing huggingface
    transformers library (Wolf+ 2020), we observed that 
    * SEDD matches autoregressive inference time when using around 100 steps but
      can increase the batch size by roughly 4 − 6 times by removing the
      KV-cache memory.  
* Future work will likely decrease the steps required for optimal generation
  (similar to existing work in standard diffusion (Song+ 2021a))
  which can improve this tradeoff

# 7. Conclusion

* We have introduced score entropy discrete diffusion (SEDD) models, 
  * a discrete diffusion model that is parameterized by the concrete score and
    can be trained efficiently with our novel score entropy loss. SEDD 
* beats previous language diffusion models and rivals autoregressive models
  for both perplexity and quality. We hope that 
* future work can define alternatives to the modern autoregressive LM paradigm
