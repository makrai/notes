It’s Not Just Size That Matters: Small Language Models Are Also Few-Shot Learners 
Timo Schick, Hinrich Schütze
NAACL 2021

code, models and datasets https://github.com/timoschick/pet.

# Abstract

* When scaled to hundreds of billions of parameters, pretrained language models
  such as GPT-3 (Brown+ 2020) achieve remarkable few-shot performance.
  hE, enormous amounts of compute are required for training and applying such
* We show that performance similar to GPT-3 can be obtained with LM whose
  parameter count is several orders of magnitude smaller
  * by converting textual inputs into cloze questions that contain a task
    description, combined with gradient-based optimization; exploiting
    unlabeled data gives further improvements
  * We identify key factors required for successful NLU with small LMs

# Intrto

* GPT-3 Brown+ (2020) achieves near SOTA results for some SuperGLUE (Wang+
  2019) tasks given just 32 labeled examples
  * 175 billion parameters,
  * This is achieved through priming: GPT-3 is given a few demonstrations of
    inputs and corresponding outputs as context for its predictions, but no
    gradient updates are performed.
* two major drawbacks:
  * It requires a gigantic LM to work well, making it
    * unusable in many real-world scenarios and resulting in a
    * large carbon footprint (Strubell+ 2019).
  * not scale to more than a few examples as the context window of most LMs is
    limited to a few hundred tokens. 2
    * GPT-3 can process up to 2,048 tokens, this is
      still not enough to fit ≥32 examples for some SuperGLUE tasks.
* pattern-exploiting training (P ET, Schick and Schütze, 2021), which
  * An alternative to priming 
  * combines the idea of reformulating tasks as cloze questions with
    regular gradient-based finetuning.
* P ET additionally requires unlabeled data, but that is much easier to obtain
  * only works when the answers to be predicted by the LM correspond to 1 token
    in its vocabulary; this is a severe limitation as many tasks cannot easily
* we adapt P ET for tasks that require predicting multiple tokens. We then show
  * in combination with ALBERT (Lan+ 2020), P ET and its iterative variant (iP
    ET ) both outperform GPT-3 on SuperGLUE with 32 training examples, while
    requiring only 0.1% of its parameters (Figure 1)
  * training with P ET can be performed in several hours on a single GPU
    without expensive hyperparameter optimization.  
* similar performance can also be achieved without unlabeled data and provide a
* detailed analysis of the factors contributing to P ET ’s strong performance:
  * ability to combine multiple task formulations, its 
  * resilience to wordings that are hard to understand, its
  * usage of labeled data, and characteristics of
  * the underlying LM
  * an important contribution to an environ

# 2 Related Work

* Enabling LMs to perform zero-shot learning by providing task descriptions
  * proposed by Radford+ (2019) and has been
  * applied to
    * text classification (Puri and Catanzaro, 2019)
    * commonsense knowledge mining (Davison+ 2019) and 
    * argumentative relation classification (Opitz, 2019).  It is also
  * commonly used for probing the knowledge contained within LMs
    (Trinh and Le, 2018; Petroni+ 2019; Talmor+ 2020; Schick and Schütze, 2020;
    Ettinger, 2020)
* finding ways to reformulate tasks as cloze questions that are understood
  well by LMs is difficult (Jiang+ 2020), 
  * Schick and Schütze (2021) propose P ET , a method that
    * uses knowledge distillation (Hinton+ 2015) and
      self-training (Scudder, 1965; Yarowsky, 1995; Brin, 1999; McClosky+ 2006)
    * easily combine several reformulations
  * Our modified version of P ET uses masked language models (Devlin+ 2019) to
    assign probabilities to sequences of text; this is similar to using them in
    a generative fashion (Wang and Cho, 2019) and has previously been
    investigated by Salazar+ (2020) and Ghazvininejad+ (2019). In contrast to P
    ET , which uses gradient-based optimization, Radford+ (2019) 
* Brown+ (2020) investigate priming, where examples are given as context but
  no parameter updates are performed.  Finally, our focus on
* reducing the amount of compute required for few-shot learning is closely
  * Green AI (Schwartz+ 2020a) aims to improve model efficiency, including
  * knowledge distillation (Hinton+ 2015; Sanh+ 2019; Jiao+ 2020; Mao+ 2020;
    Anderson and GómezRodríguez, 2020),
  * pruning (Han+ 2015, 2016; Sanh+ 2020) 
  * quantization (Gong+ 2014; Zafrir+ 2019; Stock+ 2021) as well as
  * early exit strategies for inference (Liu+ 2020; Schwartz+ 2020b; Xin+ 2020)

# 6 Conclusion

* factors responsible for the strong performance of P ET combined with ALBERT:
  * possibility to concurrently use multiple patterns for transforming examples
    into cloze questions, the ability to
  * compensate for patterns that are difficult to understand, the
  * usage of labeled data to perform parameter updates, and
  * the underlying LM itself.
* few-shot text classification performance similar to GPT-3 on SuperGLUE with
  * three orders of magnitude fewer parameters.
* For future work, it would be interesting to see whether P ET also works for
  * generative tasks when combined with generative LMs
  * in multi-task settings: whether further improvements are possible
