Gemma Scope: Open Sparse Autoencoders Everywhere All At Once on Gemma 2
Tom Lieberum, Senthooran Rajamanoharan, Arthur Conmy, Lewis Smith,
  Nicolas Sonnerat, Vikrant Varma, János Kramár, Anca Dragan, R Shah, N Nanda
Google DeepMind

* tutorial can be found at https://huggingface.co/google/gemma-scope and
* interactive demo can be found at https://neuronpedia.org/gemma-scope

# Abstract

* safety and interpretability research by the community?
* Sparse autoencoders (SAEs) are an unsupervised method for learning
  a sparse decomposition of a neural network’s latent representations
  into seemingly interpretable features
* recent excitement about their potential,
  * a comprehensive suite of SAE? Only industry can pay the high training cost
* we introduce Gemma Scope, an open suite of JumpReLU SAEs trained on
  * which layers
    * all layers and sub-layers of Gemma 2 2B and 9B and
    * select layers of Gemma 2 27B base models. We
  * trained on pre-trained/instruction-tuned models
    * we primarily train SAEs on the Gemma 2 pre-trained models, but
    * we release SAEs trained on instruction-tuned Gemma 2 9B for comparison
* evaluation of each SAE on standard metrics and release these results

# 1. Intro

* a significant fraction of the internal activations of language models are
  sparse, linear combination of vectors,
  each corresponding to meaningful features
  (Elhage+ 2022; Gurnee+ 2023; Mikolov+ 2013; Nanda+ 2023a; Olah+ 2020;
  Park+ 2023). But by default, it is
  * difficult to identify which vectors are meaningful, or
    which meaningful vectors are present
  * Sparse autoencoders are a promising unsupervised approach to do this, and
  * often find causally relevant, interpretable directions (Bricken+ 2023;
    Cunningham+ 2023; Gao+ 2024; Marks+ 2024; Templeton+ 2024). If this
  * SAEs could help unlock many of the hoped for applications of interpretabil
    (Hubinger, 2022; Nanda, 2022; Olah, 2021), such as
    * detecting and fixing hallucinations, being able to reliably
    * explain and debug unexpected model behaviour and
    * preventing deception or manipulation from autonomous AI agents
* hE sparse autoencoders are still an immature technique, and there are many
  * open problems to be resolved (Templeton+ 2024) before these downstream uses
  * especially validating or red-teaming SAEs as an approach, learning
  * how to measure their performance, learning
  * how to train SAEs at scale efficiently and well, and exploring
  * how SAEs can be productively applied to real-world tasks
* industry and the broader community. However, unlike
  * previous interpretability techniques like
    * steering vectors (Li+ 2023; Turner+ 2024) or
    * probing (Belinkov, 2022),
  * sparse autoencoders can be highly expensive and difficult to train,
  * lot of excellent work with sparse autoencoders on smaller models
    (Bricken+ 2023; Cunningham+ 2023; Dunefsky+ 2024; Marks+ 2024), the
  * works that use SAEs on more modern models have normally
    focused on residual stream SAEs at a single layer
    (Engels+ 2024; Gao+ 2024; Templeton+ 2024)
  * many of these (Gao+ 2024; Templeton+ 2024) trained on proprietary models
* we have trained and released the weights of Gemma Scope:
  * a comprehensive, open suite of JumpReLU SAEs (Rajamanoharan+ 2024b)
    * every layer and sublayer of Gemma 2 9B and 2B (Gemma Team, 2024b),1 as
    * select layers of the larger 27B model in this series. We release these
  * permissive CC-BY-4.0 license2 on HuggingFace to enable and accelerate
* > 400 sparse autoencoders in the main release3 , with more than
  * > 30 million learned features in total (though many features likely
    overlap), trained on 4-16B tokens of text each. We used over
  * > 20% of the training compute of GPT-3 (Brown+ 2020),
  * we saved about 20 Pebibytes (PiB) of activations to disk, and produced
  * hundreds of billions of sparse autoencoder parameters in total. This was
* essential for enabling more ambitious applications of interpretability, such
  * circuit analysis (Conmy+ 2023; Hanna+ 2023; Wang+ 2022),
    * ie scaling up Marks+ (2024) to larger models, which may be
    * necessary to answer mysteries about larger models like what happens
      during chain of thought or in-context learning

# 2. Preliminaries.  Background on SAEs in general + JumpReLU SAEs

# 3. Training details: hyperparameters and computational infrastructure

# 4. Evaluation

* In this section we evaluate the trained SAEs from various different angles. We
* hE no consensus on what constitutes a reliable metric for the quality of a
  sparse autoencoder or its learned latents and that this is
  * an ongoing area of research (Gao+ 2024; Karvonen+ 2024; Makelov+ 2024)
* evaluations are on sequences from the same distribution as the SAE training
  * ie the pretraining distribution of Gemma 1, unless otherwise noted

## 4.1. Evaluating the sparsity-fidelity trade-off

## 4.2. Impact of sequence position

## 4.3. Studying the effect of SAE width

* Holding all else equal, wide SAEs learn more latent directions and provide
  better reconstruction fidelity at a given level of sparsity than narrow SAEs
  * Intuitively, this suggests that we should use the widest SAEs practicable
    for downstream tasks. However, there are also signs of caveats. The
  * ‘feature-splitting’ (Bricken+ 2023) – where latents in a narrow SAE seem
    to split into multiple specialized latents within wider SAEs – is one
    * ie wide SAEs do not always use their extra capacity to learn a greater
      breadth of features (Bussmann+ 2024)
    * It is plausible that the sparsity penalty used to train SAEs encourages
      wide SAEs to learn frequent compositions of existing features over (or
      at least in competition with) using their increased capacity to learn
      new features (Anders+ 2024)
    * unclear whether this is good or bad for the usefulness of SAEs on
      downstream tasks
* we train and release a ‘feature-splitting‘ suite of mid-network residual
  stream SAEs for Gemma 2 2B and 9B PT with matching sparsity coefficients and
  widths between 214 ≈ 16.4K and 219 ≈ 524K in steps of powers of two.8 The
  * different sparsity settings after layers 12 and 20 of Gemma 2 2B and 9B resp

## 4.4. Interpretability of latents

* The interpretability of latents for a subset of the SAEs included in Gemma
  Scope was investigated in Rajamanoharan+ (2024b); latents were
  * both human raters and LM generated explanations. For completeness, we in-
  * key findings of those studies here (refer to section 5.3 of that work)
  * setting: JumpReLU, TopK and Gated SAEs of width 131K trained on all sites
    at layers 9, 20, and 31 of Gemma 2 9B
  * Fig. 6 shows human raters’ judgment of latent interpretability for each
    investigated SAE architecture
  * Fig. 7 shows the Pearson correlation between the language model (LM)
    simulated activations based on LM-generated explanations and the ground
    truth activation values
  * there is little discernible difference between JumpReLU, TopK & Gated SAEs

## 4.5. SAEs trained on base models transfer to instruction-tuned (IT) models

## 4.6. Pile subsets

### Results In Fig. 9 we show delta loss by subset

* Of the studied subsets, SAEs perform
  * best on DeepMind mathematics (Saxton+ 2019)
    * Possibly this is due to the especially formulaic nature of the data
  * worst on Europarl (Koehn, 2005), a multilingual dataset
    * We conjecture that this is due to the Gemma 1 pretraining data, which
      was used to train the SAEs, containing predominantly English text

## 4.7. Impact of low precision inference precision at inference time. This is

* particularly important for applications like circuit analysis:
  splice several SAEs into a language model simultaneously
* Fig. 10 comparse fidelity-versus-sparsity curves computed using
  * float32 SAE and LM weights versus the same curves computed using bfloat16
  * there is negligible impact in switching to bfloat16 for inference

# 5. Open problems that Gemma Scope may help tackle

## Deepening our understanding of SAEs

1. Exploring the structure and relationships between SAE features,
  as suggested in Wattenberg and Viégas (2024)
2. Comparisons of residual stream SAE features across layers,
  * eg are there persistent features that one can “match up”
    across adjacent layers?
3. Better understanding the phenomenon of “feature splitting” (Bricken+ 2023)
   where high-level features in a small SAE break apart into
   several finer-grained features in a wider SAE
4. Measure “how much” SAEs miss and how much this matters in practice?
  * We know that SAEs introduce error, and
  * completely miss out on some features that are captured by wider SAEs
    (Bussmann+ 2024; Templeton+ 2024)
5. How are circuits connecting up superposed features repred in the weights?
   * How do models deal with the interference between features (Nanda+ 2023b)?

## Using SAEs to improve performance on real-world tasks
  (compared to fair baselines)

1. Detecting or fixing jailbreaks
2. Helping find new jailbreaks/red-teaming models (Ziegler+ 2022)
3. Comparing steering vectors (Turner+ 2024) to
  * SAE feature steering (Conmy and Nanda, 2024) or
  * clamping (Templeton+ 2024)
    A Templeton, T Conerly, J Marcus, J Lindsey, T Bricken, B Chen, A  Pearce,
      C Citro, E Ameisen, A Jones, H Cunningham, N L  Turner, C  McDougall,
      M MacDiarmid, C D  Freeman, T R Sumers, E Rees, J Batson, A Jermyn,
      S Carter, C Olah, and T Henighan
    Scaling monosemanticity:
      Extracting interpretable features from claude 3 sonnet
    [Transformer Circuits Thread, 2024]
    (https://transformer-circuits.pub/2024/scaling-monosemanticity/)
4. Can SAEs be used to improve interpretability techniques,
  * similarly to steering vectors
  * eg by removing irrelevant features (Conmy and Nanda, 2024)?

## Red-teaming SAEs

1. Do SAEs really find the “true” concepts in a model?
2. How robust are claims about the interpretability of SAE features
  (Huang+ 2023)
3. computable, quantitative measures that are a useful proxy for how
   “interpretable” humans think a feature vector is (Bills+ 2023)?
4. Can we find the “dark matter” of truly nonlinear features?
  * We distinguish truly non-linear features
    from low-rank subspaces of linear features as found in Engels+ (2024)
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
  like organs in biological organisms?
  * We know this happens in image models (Voss+ 2021)
  * not much evidence seen in language models
  * superposition is incentivized for features that do not co-occur
    (Gurnee+ 2023), so
    specialized macroscopic structure may be a prime candidate to have in
    superposition.  Now we have SAEs, can we find and recover it?
5. Does attention head superposition (Jermyn+ 2023) occur in practice?
  * eg are many attention features spread across several heads (Kissane+ 2024b)

## Improvements to SAEs

1. How can SAEs efficiently capture the circular features of Engels+ (2024)?
2. How can they deal efficiently with cross-layer superposition,
  ie features produced in superposition
  by neurons spread across multiple layers?
3. How much can SAEs be quantized without significant performance degradation,
   both for inference and training?

# B. Transcoders

* MLP SAEs are trained on the output of MLPs, but we can also replace the whole
  MLP with a transcoder (Dunefsky+ 2024) for easier circuit analysis
  * Transcoders are not autoencoders:
  * SAEs are trained to reconstruct their input,
  * transcoders are trained to approximate the output of MLP layers
    from the input of the MLP layer
* We train one suite of transcoders on Gemma 2B PT, and release these
