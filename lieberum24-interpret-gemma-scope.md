Gemma Scope: Open Sparse Autoencoders Everywhere All At Once on Gemma 2
Tom Lieberum, Senthooran Rajamanoharan, Arthur Conmy, Lewis Smith,
  Nicolas Sonnerat, Vikrant Varma, János Kramár, Anca Dragan, R Shah, N Nanda
Google DeepMind

* tutorial can be found at https://huggingface.co/google/gemma-scope and
* interactive demo can be found at https://neuronpedia.org/gemma-scope.

# Abstract

* safety and interpretability research by community?
* Sparse autoencoders (SAEs) are an unsupervised method for learning a sparse
  decomposition of a neural network’s latent representations into seemingly
  interpretable features
* recent excitement about their potential, 
  * a comprehensive suite of SAE: only industry can pay the high training cost 
* we introduce Gemma Scope, an open suite of JumpReLU SAEs trained on 
  * which layers
    * all layers and sub-layers of Gemma 2 2B and 9B and 
    * select layers of Gemma 2 27B base models. We 
  * trained on pre-trained/instruction-tuned models
    * we primarily train SAEs on the Gemma 2 pre-trained models, but
    * we release SAEs trained on instruction-tuned Gemma 2 9B for comparison.
* evaluation of each SAE on standard metrics and release these results. We hope

# 5. Open problems that Gemma Scope may help tackle

## Deepening our understanding of SAEs
1. Exploring the structure and relationships between SAE features, 
  as suggested in Wattenberg and Viégas (2024).
2. Comparisons of residual stream SAE features across layers, 
  * eg are there persistent features that one can “match up”
    across adjacent layers?
3. Better understanding the phenomenon of “feature splitting” (Bricken+ 2023)
   where high-level features in a small SAE break apart into
   several finer-grained features in a wider SAE.
4. We know that SAEs introduce error, and
  completely miss out on some features that are captured by wider SAEs
  (Bussmann+ 2024; Templeton+ 2024). Can we quantify and easily 
  * measure “how much” they miss and how much this matters in practice?
5. How are circuits connecting up superposed features represented in the
   weights? How do models deal with the interference between features
   (Nanda+ 2023b)?

## Using SAEs to improve performance on real-world tasks
  (compared to fair baselines)

1. Detecting or fixing jailbreaks.
2. Helping find new jailbreaks/red-teaming models (Ziegler+ 2022).
3. Comparing steering vectors (Turner+ 2024) to 
  * SAE feature steering (Conmy and Nanda, 2024) or 
  * clamping (Templeton+ 2024)
4. Can SAEs be used to improve interpretability techniques, like steering
   vectors, such as by removing irrelevant features (Conmy and Nanda, 2024)?

## Red-teaming SAEs
1. Do SAEs really find the “true” concepts in a model?
2. How robust are claims about the interpretability of SAE features
  (Huang+ 2023)
3. computable, quantitative measures that are a useful proxy for how
   “interpretable” humans think a feature vector is (Bills+ 2023)?
4. Can we find the “dark matter” of truly nonlinear features?
  * We distinguish truly non-linear features
    from low-rank subspaces of linear features as found in Engels+ (2024).
5. Do SAEs learn spurious compositions of independent features
  to improve sparsity
  as has been shown to happen in toy models (Anders+ 2024), and 
  * can we fix this?

## Scalable circuit analysis: What interesting circuits can we find
in these models?

1. What’s the learned algorithm for addition (Stolfo+ 2023)
  in Gemma 2 2B?
2. How can we practically extend
  the SAE feature circuit finding algorithm in Marks+ (2024) 
  to larger models?
3. Can we use
  SAE-like techniques such as MLP transcoders (Dunefsky+ 2024)
  to find input independent, weights-based circuits?

## Using SAEs as a tool to answer existing questions in interpretability

1. What does finetuning do to a model’s internals (Jain+ 2024)?
2. What is actually going on when a model uses chain of thought?
3. Is in-context learning true learning, or just promoting existing circuits
   (Hendel+ 2023; Todd+ 2024)?
4. Can we find any “macroscopic structure” in language models,
  eg families of features that work together to perform specialised roles, 
  like organs in biological organisms?13
  * We know this happens in image models (Voss+ 2021) but have 
  * not much evidence seen in language models.  But 
  * superposition is incentivized for features that do not co-occur (Gurnee+
    2023), so 
    specialized macroscopic structure may be a prime candidate to have in
    superposition.  Now we have SAEs, can we find and recover it?
5. Does attention head superposition (Jermyn+ 2023) occur in practice?
   eg are many attention features spread across several heads (Kissane+ 2024b)?

## Improvements to SAEs

1. How can SAEs efficiently capture the circular features of Engels+ (2024)?
2. How can they deal efficiently with cross-layer superposition,
  ie features produced in superposition by neurons spread across multiple
  layers?
3. How much can SAEs be quantized without significant performance degradation,
   both for inference and training?

# B. Transcoders

* MLP SAEs are trained on the output of MLPs, but we can also replace the whole
  MLP with a transcoder (Dunefsky+ 2024) for easier circuit analysis.
  * Transcoders are not autoencoders: while 
  * SAEs are trained to reconstruct their input, 
  * transcoders are trained to approximate the output of MLP layers from the
    input of the MLP layer
* We train one suite of transcoders on Gemma 2B PT, and release these at the
