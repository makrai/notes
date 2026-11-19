Open Problems in Mechanistic Interpretability
Sharkey, Chughtai, Batson, Lindsey, Wu, Bushnaq, Goldowsky-Dill,+

# Abstract

* Mechanistic interpretability aims to
  understand the computational mechanisms underlying neural networks' capabilits
  in order to accomplish concrete scientific and engineering goals
  * goals eg assurance over AI system behavior and
  * the nature of intelligence
  * many open problems in the field that require solutions beforehand
  * required: both conceptual and practical improvements to reveal deeper
    * how best to apply our methods in pursuit of specific goals
    * socio-technical challenges that influence and are influenced by our work
* we discuss the current frontier of mech interpret and the open


# 1 Introduction

* human understanding of these mechanisms is not necessary for AI capabilities,
  * nL understanding them would enhance several human abilities
* Beyond the engineering benefits, understanding offers scientific opportunities
  * laws of nature governing the mechanisms of minds we might discover
  * methods for analyzing biological neural systems: neuroscientists
  * other sci
    * learn about protein folding from AIs that can predict protein structure?
    * insights about disease from a radiographer that performs beyond humans
* Mechanistic interpretability might unlock these benefits
  * understand neural networks’ decision-making processes
    * mech interpr := successfully predict its behavior (even on arbitrary
      inputs) or
      eg more precise control of the network’s behavior, or
      improved network design
  * promises greater assurances for AI systems
    through a better understanding of what neural networks have learned

## 1.1 The focus of this review: Open problems and the future of mech interpret

* reviews of mechanistic interpretability research and related topics exist
  (Rauker+ 2023; Geiger+ 2022; Bereska & Gavves, 2024; Ferrando+ 2024;
  Rai+ 2024; Anwar+ 2024; Davies & Khakzar, 2024; Mosbach+ 2024; Mueller+ 2024).
* we: which directions we might benefit most from prioritizing in the future.

### 1.1.1 Why ‘mechanistic’ interpretability?

* distinction between interprtab and mechanistic interprtab is not always clear
  * interpr: motivations and methods used in interpretability work are diverse
    (Lipton, 2018; Doshi-Velez & Kim, 2017; Jacovi, 2023)
  * categorizations of interpretability include
    * causal vs. correlational methods, supervised vs. unsupervised methods,
    * bottom-up vs. top-down methods, among others
    (Geiger+ 2024b; Mueller+ 2024; Bereska & Gavves, 2024; Belinkov, 2022a; Zou+
    2023a; Davies & Khakzar, 2024)
* mechanistic interpretability. But what distinguishes ‘mechanistic'?
  * the term is used in a number of (sometimes inconsistent) ways
    (Saphra & Wiegreffe, 2024)
  * we in a technical sense: mechanisms underlying neural network generalization
* one of three threads of interpretability research
  * the three roughly reflect the changing aims of interpretabilit over time
1. AI systems that are interpretable by design
  * the sensitivity of machine learning models to inputs and training data.
  * This work typically used
    small-to-medium sized models designed to be easily interpretable
    * eg decision trees (Breiman, 1984; Hu+ 2019),
    * linear models (Roweis & Ghahramani, 1999), and
    * generalized additive models (Hastie & Tibshirani, 1986; Agarwal+ 2021).
  + attribution methods such as influence functions (Hampel, 1974; Koh & Liang,
    2017) and
    * Shapley values (Shapley, 1997; Lundberg & Lee, 2017)
    * characterize model decision boundaries with respect to inputs.
  * continues to be an active research area, including architectures such as
    * Concept-Bottleneck Models (Koh+ 2020),
    * Backpack Language Models (Hewitt+ 2023),
    * Kolmogorov-Arnold Networks (Liu+ 2024c), and
    * sparse decision trees (Xin+ 2022).
2. Why did my model make this particular decision?
  * With the rise of larger-scale nonlinear neural networks (Krizhevsky+ 2012)
  * attribution methods that could scale to large networks (Zeiler & Fergus,
    2014). In response, a number of
  * local attribution methods were developed, including
    * grad-CAM (Selvaraju+ 2019)
    * integrated gradients (Sundararajan+ 2017)
    * masking-based causal attribution (Fong & Vedaldi, 2017)
    * SHAP (Lundberg & Lee, 2017)
    * LIME (Ribeiro+ 2016)
    * backprop-based visualization methods (Simonyan+ 2014a; Nguyen+ 2016b)
3. focused on generalization
  * Inspired by eg Inception (Szegedy+ 2015) and GPT-3 (Brown+ 2020),
  * models became capable of more profound generalization.
  * How did my model solve this general class of problems? Due to its emphasis
  * commonly referred to as ‘mechanistic interpretability’ (in addition to
    + cultural reasons according to (Saphra & Wiegreffe, 2024)). This
  * driven by a fundamental hypothesis in deep learning that
    generalization arises from shared computation (LeCun+ 2015).
  * Early work in this area, such as
    eg feature visualization (Olah+ 2017b), or network dissection (Bau+ 2020),
    sought “global” explanations for model generalization
    by investigating the roles of model components across a class of decisions.
  * More recent work in this area looks at
    * “circuits” of components (Wang+ 2023),
    * generalizable patterns of information flow (Geva+ 2023),
    * representation subspaces (Geiger+ 2024c; Zou+ 2023a) and
    * probes (or self-supervised searches via sparse dictionary learning)
      for representation vectors that carry information that
      generalizes across many instances for a particular task or set of tasks
      (Huben+ 2024; Bricken, 2023; Todd+ 2024; Hollinsworth+ 2024)

## 1.2 Types of open problems

* concrete scientific and engineering goals.
  * Monitor AI systems for signs of cognition related to dangerous behavior
    (Section 3.2);
  * Modify internal mechanisms and edit model parameters
    to adapt their behavior to better suit our needs (Section 3.2.2);
  * Predict how models will act in unseen situations or predict when a model
    might learn specific abilities (Section 3.3);
  * Improve model inference, training, and mechanisms
    to better suit our preferences (Section 3.4);
  * Extract latent knowledge from AI systems so we can better model the world
    (Section 3.5).
* needs: greater application of current SOTA mechanistic interpretabilit methods
  + development of improved techniques. The first major section (Section 2)


# 2 ...in methods and foundations

* One way of thinking about what neural networks do internally is that NNs learn
  parameters that implement neural algorithms. These neural algorithms
  * Different parts of the network learn different steps in the algorithm;
  * MI aims to describe the function of different network components.
* In this section, we will examine both approaches
  * ‘Reverse engineering’ (2.2)
  * ‘Concept-based interpretability’ (2.3)
  * their methods and open problems
* open problems that cut across either approach, including
  * proceduralizing the mechanistic interpretability pipeline (Section 2.3) and
    * automating interpretability research (Section 2.4). We provide a
* high-level overview in Table 1, summarizing the principal methodologies that
  have been used in mechanistic interpretability

## 2.1 Reverse engineering: Identifying the roles of network components

* The first approach, often called ‘reverse engineering’, is to 
  decompose the network into components and then 
  attempt to identify the function of those components (Section 2.1). This
* ie “identifies the roles of network components”. This approach involves
* three distinct methods for three key steps: first, methods for neural network
  1. NN decomposition to break down the network into simpler parts (Sec 2.1.2)
  2. description of components to formulate hypotheses about their functional
  roles and interactions, such as
    * eg max-activating dataset examples, attribution methods, feature synthesis
      methods, or causal intervention methods
  3. validation of these descriptions to test the correctness of the hypotheses,
    * testing descriptions’ predictions, attempting to
    * use the descriptions for downstream tasks, or use of
    * benchmarks

### 2.1.1 Reverse engineering is necessary because 
#### AI and humans use different representations and perform different tasks

* eg a model that is only 1% the size of GPT-3 
  outperforms humans on next-token prediction tasks (Shlegeris+ 2024).
* hE even SOTA multimodal LLMs struggle with tasks that a four-year-old  masters
  * eg learning causal properties of new objects involving simple lights and
    shapes (Kosoy+ 2023). An even clearer sign that humans and AI are using
* cases where humans cannot solve a problem at all, as in the case of predicting
  * protein structure from sequence (Jumper+ 2021; Lin+ 2023).
* diff heuris Even when both humans and AI exhibit comparable competence on a
  * image models tend to rely more heavily on 
    * textural features (such as recognizing elephants by their hide rather than
      their shape (Geirhos+ 2019)) or rely on 
    * dataset correlations (as when identifying fish by the fingers that proud
      fisherman use to hold them (Brendel & Bethge, 2019)) to a greater degree
  * simple algorithmic tasks, like modular addition, which 
    * humans might solve with simple carries, were solved by 
    * a small transformer model by learning a Fourier transform strategy that
      researchers only understood in retrospect (Nanda+ 2023a).
* ie we must be able to reverse engineer these models (Olah, 2024).
1. Decomposition: Breaking down the object of study into simpler parts (S 2.1.2)
2. Description of components: Formulating hypotheses about the functional role
   of component parts and how they interact 
   * (a process that can be called ‘interpretation’) (Section 2.1.3);
3. Validation of descriptions: Testing if our hypotheses are correct (Sec 2.1.4)
* If our hypotheses are invalidated, we must either improve our decomposition or
  improve our hypotheses regarding the functional roles of its components. We
* this sec: current methods and their respective shortcomings.

### 2.1.2 Reverse engineering step 1: Neural network decomposition

#### Networks do not naturally decompose into architectural components. The

* eg individual neurons, attention heads, or layers.
  * early attempts: responses or weight structure of individual neurons or
    single convolutional filters 
    (Erhan+ 2009; Le+ 2012; Krizhevsky+ 2012; Szegedy+ 2014; Simonyan+ 2014b;
    Zhou+ 2015; Srivastava+ 2014; Yosinski+ 2015; Mordvintsev, 2015;
    Olah+ 2017a; Bau+ 2020; Dalvi+ 2019; Olah+ 2020a; Cammarata+ 2020). These
    * paid homage [respected] to the ‘Neuron Doctrine’ in neuroscience, which
      (Cajal, 1924; Sherrington, 1906).
  * hE neurons are ‘polysemantic’ – they seem to respond to multiple kinds of
    features in both 
    artificial (Wei+ 2015; Nguyen+ 2016c; Olah+ 2017a) and 
    biological networks (Churchland & Shenoy, 2007; Rigotti+ 2013; Mante+ 2013;
    Raposo+ 2014).
  * representations used by neural networks do not necessarily align with the
    activation of individual neurons (Hinton, 1981).  
* individual attention heads does not fare better than neurons, as 
  * attention heads also exhibit polysemanticity (Janiak+ 2023). More broadly,
  * the attention patterns of models can often be misleading 
    (Jain & Wallace, 2019; Pruthi+ 2020)
* layers
  * representations in language models might span multiple layers (Yun+ 2021;
    Lindsey+ 2024; Ameisen+ 2025). This chimes with 
  * some work edits or intervenes on individual layers, which indicates that 
    * this level is too coarse-grained to robustly carve the network at its joints
      (Meng+ 2022b; Wang+ 2023).

#### Decomposition by dimensionality reduction methods. If individual neurons

* groups or patterns of neurons are.
* identify activation vectors that correspond to the basic unit of computation.
  * provide models with a range of unlabeled inputs, collect the resulting
    hidden activations, and then apply unsupervised dimensionality reduction
* dimensionality reduction methods include 
  * Principal Component Analysis or Singular Value Decomposition (Hollinsworth+
    2024; Marks & Tegmark, 2024; Huang+ 2024a; Bushnaq+ 2024), 
  * tensor factorization (Oldfield+ 2023), and 
  * non-negative matrix factorization (Olah+ 2018; Voss+ 2021; Cammarata+ 2020;
    Fel+ 2023), though these techniques are 
  * no longer predominant methods used for mechanistically decomposing language
    models (Friedman+ 2024). Related approaches use 
* singular value decomposition as an initial step, followed by unsupervised
  clustering step in order to identify 
  semantically unique and distinguishable concepts (Graziani+ 2023).

#### Decomposition by sparse dictionary learning (SDL). According to the

* ‘superposition hypothesis’, 
  NNs can represent more features than they have dimensions, as long as 
  each feature activates sparsely (Elhage+ 2021) (Figure 4). This is a key
* dim redu cannot identify more directions than there are activation dimensions. 
* search for methods that can identify more directions than dimensions. Recent
* sparse dictionary learning (SDL) to this end 
  (Elhage+ 2021; Sharkey+ 2022b; Huben+ 2024; Bricken, 2023)

* Figure 4: Three ideas underlying the sparse dictionary learning (SDL) paradigm
  in mechanistic interpretability. 
  * (Left) The linear representation hypothesis states that 
    the map from ‘concepts’ to neural activations is linear. 
  * (Middle) Superposition is the hypothesis that 
    models represent many more concepts than they have dimensions by
    * representing them both sparsely and linearly in activation spaces. 
  * (Right) SDL attempts to recover an overcomplete basis of concepts
    represented in superposition in activation space.
* SDL is the most popular set of unsupervised decomposition methods in MI
  * a family of methods, including 
  * Sparse Autoencoders (SAEs) (Gao+ 2024; Templeton+ 2024; Rajamanoharan+ 2024;
    Makelov+ 2024; Kissane+ 2024b; Braun+ 2024), 
  * transcoders (Dunefsky+ 2024; Ameisen+ 2025), and 
  * crosscoders (Lindsey+ 2024; Ameisen+ 2025)
* 2 The term latent is often used instead of the word feature to refer to SDL
  dictionary elements, since the term ‘feature’ is often used to refer to
  multiple different ideas (Smith, 2024b) 
* hidden activations are typically passed to a small neural network consisting
  of only two layers, which correspond to an encoder and decoder respectively,
  with a wide hidden space. The 
  * encoder activations represent how active each ‘latent’ 2 is, and the 
  * decoder matrix corresponds to a dictionary of latent directions.
* We want to train the dictionary elements to align with ‘feature directions’ in
  the network’s hidden activations.
* we assume that individual features are sparsely present in the activations,
  ~> the encoder activations are trained to be sparsely activating. In the case
  * SAEs, the output is trained to either reconstruct the input or, in the case
  * transcoders (Dunefsky+ 2024; Ameisen+ 2025), to 
    reconstruct the activations of the next layer or layers. 
  * Crosscoders (Lindsey+ 2024; Ameisen+ 2025) permit a wider class of inputs
    and outputs, 
    potentially reconstructing the activations of many layers simultaneously.
* Since the encoder is nonlinear, it is thought to be able to learn to activate
  a latent only if a feature is ‘active’ in the hidden activations and remain
  ‘off’ if it is not.
* Although SDL is considered a leading decomposition method for MI
* substantial practical and conceptual limitations (Figure 5).

#### SDL reconstruction errors are too high: Large errors in SDL reconstruction

* question whether SDL methods can reconstruct the hidden representation
  sufficiently well such that the latents learned by SDL are adequately faithful
  to the models being interpreted. 
* To measure this, the model’s true 
  hidden activations can be replaced with sparse dictionary reconstructions,
  * evaluating the extent to which the model’s performance decreases.
* the error results in significant performance reductions. When a sparse
* eg
  * 16 million latents was inserted into GPT-4, the language modeling loss was
    equivalent to a model with only 10% of GPT-4’s pretraining compute (Gao+
    2024). Similarly, 
  * Makelov+ (2024) found that using reconstructions from sparse autoencoders
    decreased GPT-2 small performance by 10% when trained on task-specific data,
    and 40% when trained on the full distribution.
* Making sparse dictionaries much larger and sparser to reduce errors is a
  feasible but computationally expensive approach. Furthermore, 
  * in the limit, this results in merely assigning one dictionary latent per
    datapoint, which is clearly less interpretable. One 
* partial solution is using SDL methods with 
  ‘error nodes’ (Marks+ 2024), to account for the discrepancies between the
  original and reconstructed activations. 
  However, while the sparse autoencoders identified interpretable latents, the
  error nodes contain ‘everything else’, making them an inadequate solution to
* Engels+ (2024b): reconstruction errors are not purely random, as 
  much of the direction of the error and its norm 
  can be linearly predicted from the initial activation vector. 
  * This suggests that current SDL methods may 
    systematically fail to capture certain structured aspects of model reprs,
  * also implies potential solutions. To overcome this issue, it may be
    necessary to improve SDL training methods, or develop entirely new methods
    of network decomposition.

#### SDL methods are expensive to apply to large models: SDL 

* involves training a small neural network for every layer of the AI model that
  * the sparse dictionaries have more parameters at that layer than the original
    model does, and consequently will probably be relatively expensive to train
* The actual relative cost is unclear since there are 
  no public attempts to apply SDL to every vector space in a model, although
  some work applies SDL to various layers (Marks+ 2024; Gao+ 2024; Braun+ 2024;
  Lieberum+ 2024; Bloom & Lin, 2024a; Huben+ 2024)
* As AI models become larger, scaling costs of SDL also increase, although it
  * unclear whether relative scaling costs are sub~ or supra-linear. For cost
* possib solut: intrinsically decomposable methods for training models, while
  remaining at (or close to) SOTA performance (Section 2.1.2). This approach

#### SDL assumes the linear representation hypothesis in nonlinear models: Other

* neural networks are nonlinear functions and could potentially use highly
  nonlinear representations (Black+ 2022; Engels+ 2024b; Kirch+ 2024), 
* The linear representation hypothesis observes that
  NNs tend to use representations that exhibit strikingly linear behavior
  (Smolensky, 1986; Mikolov+ 2013; Olah+ 2020b; Elhage+ 2021; Park+ 2023a;
  Guerner+ 2024; Gurnee & Tegmark, 2024). 
* The hypothesis formalizes this phenomenon by stating that 
  high level concepts are linearly represented as directions (vectors) in NN embeds
* two core claims 
  * the composition of multiple concepts can be represented as the addition of
    their corresponding feature vectors, and 
  * the intensity of a concept is represented by the scale of its corresponding
    feature vector (Olah & Jermyn, 2024). 
* additional assumptions
  * Elhage+ (2021): one-dimensional features
    * this definition has since been 
      refuted (Yedidia, 2023; Chughtai & Lau, 2024; Engels+ 2024a) and 
      clarified (Olah & Jermyn, 2024). Another recently proposed criterion is that
  * the intensity of concepts should be retrievable by a linear function of the
    embeddings, up to a small error (Hänni+ 2024; Olah & Jermyn, 2024).
  * A weak version of the linear representation hypothesis states that 
    some concepts are linearly represented, while a 
    strong version may assert that all concepts are (Smith, 2024a). Some works
  * the strong version is false for some models (Black+ 2022; Csordás+ 2024).
  * The weaker version of the linear repr hypo is supported by the successes of 
    * linear probes (Section 2.2.1)
    * activation steering (Section 3.2.2)
    * sparse autoencoders in finding seemingly interpretable latents (Sec 2.1.2)

#### Sparsity is not a good proxy for interpretability: Another of SDL’s key assumptions is that feature
activations are sparse. Therefore, SDL methods optimize their latents accordingly to be sparsely activating,
with the implicit assumption that sparser decompositions are more interpretable than denser ones. However,
this assumption may not necessarily hold. The (related) problems of feature splitting (Bricken, 2023), feature
absorption (Chanin+ 2024) and composition (Till, 2024) suggest that with sufficient optimization
pressure, sparsity as a proxy for interpretability breaks down (though note that it is debated whether
feature splitting is actually a problem). Other proxies, such as minimum description length, might be better
optimization targets than sparsity per se (Ayonrinde+ 2024). It also may be the case that no proxy
metric is sufficient.

#### SDL leaves feature geometry unexplained: SDL decomposes networks into single directions in the
activation space, which is a reasonable approach only if we consider feature activations akin to ‘a bag of
features’ (Harris, 1954) without any internal structure. However, the geometric arrangement of features in
relation to each other seems to reflect semantic and functional structure (Engels+ 2024a; Gurnee &
Tegmark, 2024; Park+ 2024b; Bussman+ 2024). Understanding the geometric structure of a network
means understanding the position of one feature relative to (potentially) many others. Comprehending this
may be necessary if we want to know why and how a network treats certain features similarly or differently.
If understanding the global geometry (all-to-all relationships) of features is essential to understand neural
networks, this might pose a fundamental problem for current approaches to mechanistic interpretability
(Hänni+ 2024; Mendel, 2024). However, if only local geometric relationships between features need to
be understood, understanding networks with a ‘bag of features’ approach may be more feasible.

#### SDL cannot straightforwardly be applied to all architectures: SDL was originally developed to iden-
tify features that may be represented in superposition across many neurons within a single layer. However,
representations may be spread over other network architecture components besides neurons. In transform-
ers, for example, representations may be spread across separate attention heads (Jermyn+ 2023; Janiak
et al., 2023), and even across different layers (Yun+ 2021; Lindsey+ 2024). However, it is not
immediately obvious how to decompose representations distributed across attention heads with SDL (Math-
win+ 2024; Wynroe & Sharkey, 2024). Nor is it straightforward to translate cross-layer distributed
representations into causal descriptions of neural network mechanisms (Lindsey+ 2024), though some
recent work makes progress toward this (Ameisen+ 2025).

#### SDL decomposes the input and output activations of network mechanisms, but not the mech-
anisms themselves: Ultimately, the aim of mechanistic interpretability is to understand the mechanisms
learned by neural networks. The parameters of the network, along with its nonlinearities and other architec-
tural components, implement these mechanisms, which are applied to the input’s hidden activations. SDL
identifies directions in activation space. Being activations, they only interact with the network’s mechanisms,
12Published in Transactions on Machine Learning Research (09/2025)
but are not the mechanisms themselves. Describing the mechanisms directly remains unresolved with SDL.
Gaining insights about the network’s mechanisms from SDL latents requires further post hoc analysis, which
can be labor intensive, computationally expensive, or data set dependent (Huben+ 2024; Bricken, 2023;
Riggs+ 2023; Marks+ 2024). This is an instance of a more broad problem with current mechanistic
interpretability work; we primarily focus on understanding neural network activations, with little attention
paid to how this structure in activations is computed via weights (Chughtai & Bushnaq, 2025).

#### SDL latents may not contain the concepts needed for downstream use cases: When using SAEs
for practical tasks, there sometimes exists a single latent or small set of latents representing some concept
of interest for task performance (and not representing much else). For instance, Kantamneni+ (2024)
found a single latent whose activation pattern was more accurate than official dataset labels on the NLP
task GLUE CoLA (Warstadt+ 2019). More often than not though, a sparse set of latents that encode
some useful concept of interest do not exist. It is unclear what causes this problem. One hypothesis is that
the concept we want isn’t how the model ‘thinks’ about the concept, and the SAE is working as intended.
Alternatively, the SAE training distribution could be too narrow, resulting in the SAE not being incentivised
to learn the important latents. (Kissane+ 2024c) found that SAEs trained on pretraining data generally
do not have good latents for the concept of ‘refusing’ harmful user requests, while SAEs trained on chat
formatted data do. Or, the SAE might not have a large enough dictionary size to learn all concepts of
interest. Many more hypotheses are plausible. A complicating factor in using SDL to identify the learned
mechanisms of neural networks is that the latents identified by SDL depend heavily on the data set used
to train them. This is an undesirable property for a decomposition method that was initially hoped to be
capable of identifying the fundamental units of computation in neural networks (Kissane+ 2024c).

#### Current decomposition methods lack solid theoretical foundations. Given the practical and con-
ceptual issues with SDL, there is broad agreement that the question of how to correctly decompose networks
into atomic units remains a central problem, evidenced by the large amount of effort focused on the direction
in recent years. After investing considerable effort in SDL approaches, it is apparent that improved con-
ceptual clarity beyond the idea of superposition (Elhage+ 2021) is needed to advance neural network
decomposition.
One of the most significant open questions is the absence of clarity around the nature of features, despite
being the central focus of SDL’s identification efforts. Satisfying formal definitions are elusive and con-
ceptual foundations are not yet established. However, even without foundations, progress in mechanistic
interpretability is possible — even confused concepts can be pragmatically useful (Henighan, 2024).
Without solid conceptual foundations, it remains unclear whether the superposition hypothesis, which under-
pins the SDL paradigm, is fundamentally valid or merely pragmatically useful (Henighan, 2024; Templeton
et al., 2024). If it is the latter, there may be better methods than SDL for carving neural networks at their
joints. Such methods may take into account feature geometry or take a more dynamic, developmental view
of how mechanistic structure emerges in the training process (Hoogland+ 2024; Wang+ 2024b).
Moreover, although there is much emphasis on how models represent features in superposition, there is
comparatively less work examining how they might perform computation on them natively in superposition.
Further conceptual work into this problem may suggest new methodologies for decomposing networks, or
provide bounds on the number of features we should expect models to be capable of learning (Hänni+
2024; Adler & Shavit, 2024; Bushnaq & Mendel, 2024). The field should explore very different approaches
that show promise for decomposing neural networks into functional components and that do not exhibit
many of the problem of the SDL paradigm, such as decomposing or analyzing network parameters (Braun
et al., 2025; Tsang+ 2018) or methods that decompose networks according to analytical descriptions of
the local functions they implement, such as deep Taylor decomposition (Montavon+ 2017).
Mechanistic interpretability should ideally be built on more formal foundations. Some work attempts to
ground mechanistic interpretability in the formalisms of causality (Geiger+ 2024a). However, this
approach has not yet yielded canonical causal mediators (Mueller+ 2024) that may form a basis for
decomposition methods. How should we go about finding them? Given that our field’s objective is to
understand the learned structures that underlie networks’ generalization behaviors, exploring theories about
why neural networks generalize appears to be a promising avenue. But theories that attempt to characterize
13Published in Transactions on Machine Learning Research (09/2025)
why neural networks generalize, such as the spline theory of neural networks (Balestriero & richard baraniuk,
2018), theories of neural networks’ simplicity bias (Valle-Perez+ 2019), deep learning theory involving the
neural tangent kernel (Jacot+ 2018; Roberts+ 2022), or singular learning theory (Watanabe, 2009;
Wei+ 2023) have either not yet yielded mathematical objects that can be easily used for interpretability,
or simply have not been successfully linked to approaches for interpreting neural networks. Establishing
these connections would make significant progress toward carving neural networks at their joints to facilitate
mechanistic interpretability. And if we can carve trained networks at their joints, it may suggest ways to
train networks such that they come ‘pre-carved’. Thus, better theoretical foundations may also be important
for developing models that are intrinsically decomposable by design, which we discuss next.

#### Intrinsic interpretability: Building more easily decomposable models The current strategy of
training a model solely for performance and then interpreting it post hoc may not be optimal if our goal is a
model that is both interpretable and performant. To this end, it may be beneficial to prioritize interpretability
during model training, for which there are several plausible approaches.
Instead of post-hoc decomposing trained network activations into discrete codes (Section 2.1.2), network
activations could be forced to use a discrete code from the outset, as in Tamkin+ (2025). MLPs could
also be trained with sparser activation functions, such as TopK (Makhzani & Frey, 2013; Bills+ 2023) or
SoLU (Elhage+ 2022). Similar approaches could be potentially used to restrict attention superposition
(Jermyn+ 2023) by limiting the number of heads attending to any query-key pair. Several approaches,
such as ‘mixture of experts’ (Shazeer+ 2017; Fedus+ 2022; He, 2024), use sparsely activating
components — with a large enough number of experts, and with sufficient activation sparsity, experts
may become individually interpretable (Warstadt+ 2019). Many attempts to incentivize interpretable
activations directly so far have not been competitively performant, and have also allowed ‘superposition to
sneak through’, mitigating benefits.
We can also target weight sparsity directly during training, including approaches such as L 0 regularization
(Louizos+ 2018) or pruning (Mozer & Smolensky, 1988; Frankle & Carbin, 2019; Mocanu+ 2018).
Han+ (2015) achieve sparse weights by using magnitude pruning followed by finetuning. This highlights
a general strategy of finetuning with interpretability in mind (also used by Tamkin+ (2025)), avoiding the
potentially excessive cost of training from scratch. Another related strategy is targeting modularity (Kirsch
et al., 2018; Andreas+ 2016). For example, brain-inspired modular training (Liu+ 2023) trains for
modularity by embedding neurons in a geometric space and encouraging geometrically local connections.
Existing research implements other approaches that can simplify linearity-reliant circuit analysis (Elhage
et al., 2021). For example, there is work removing the layer norm operations (Heimersheim, 2024), using
input-switched affine transformations for recurrence (Foerster+ 2017). Other studies leverage archi-
tectures that are mathematically analyzable in other ways than linearity, such bilinear activations in MLPs
(Sharkey, 2023; Pearce+ 2024).
After decomposing a network into components, whether through post hoc decomposition or by using intrinsi-
cally decomposable models, our task remains unfinished. We must provide an interpretation of the functional
role of each component (Step 2 – Section 2.1.3) and validate that interpretation (Step 3 – Section 2.1.4). In
the next section, we will discuss common methods of interpretation and their
shortcomings.

#### Networks do not naturally decompose into architectural components

#### Decomposition by dimensionality reduction methods

#### Decomposition by sparse dictionary learning (SDL)

#### Current decomposition methods lack solid theoretical foundations

#### Intrinsic interpretability: Building more easily decomposable models

### 2.1.3 Reverse engineering step 2: Describing the functional role of
components

* description of components to formulate hypotheses about their functional roles
  and interactions, such as
  * eg max-activating dataset examples, attribution methods, feature synthesis
    methods, or causal intervention methods

#### Explanations for what causes components to activate

#### Explanations for the downstream effects of components

### 2.1.4 Reverse engineering step 3: Validation of descriptions ‘Model
organisms’ facilitate hypothesis validation

* validation of these descriptions to test the correctness of the hypotheses,
  * testing descriptions’ predictions, attempting to
  * use the descriptions for downstream tasks, or use of
  * benchmarks

#### Validating interpretability methods using benchmarks

## 2.2 Concept-based interpretability: Identifying components for given roles

* the second approach, referred to as ‘concept-based interpretability’,
  * proposes a set of (human-derived) concepts that might be used by the network
  * looks for components that appear to correspond to those concepts. This
  * ie “identifies network components for given roles”.
* Variants on this approach have been developed in order to overcome some issues
  * issue: carefully chosen data for well-defined concepts (Sec 2.2.2)
  * issue that simple variants of the method only detect correlational, rather
    than causal variables (Section 2.2.3)
* Related methods build human concepts into the training of models ~> they are
  more interpretable by default (Section 2.2.4)

### 2.2.1 Concept-based probes

### 2.2.2 Probes need carefully chosen data for well-defined concepts

### 2.2.3 Probes detect correlations, rather than causal variables, in hidden
activations

### 2.2.4 Concept-based intrinsic interpretability

## 2.3 Proceduralz mech interpret into circuit discovery pipelines: A case study

## 2.4 Automating steps in mech interpret research 7


# 3 ...in applications of mech interpret

* how applications of interpretability methods have made progress
  * for each goal, discusses the specific axes along which progress is needed

## 3.1 Axes of mech interpret progress 25

## 3.2 ...for potentially unsafe cognition 25

### 3.2.1 Mechanistic interpretability-based evaluations could help us detect
unsafe or unethical

#### AI cognition 25

#### Enabling real time monitoring of AI systems for potentially unsafe
cognition 26

#### Improving our ability to red-team AI systems and elicit unsafe outputs 26

### 3.2.2 Using mech interpret for better control of AI system behavior 27

## 3.3 Using mech interpret for better predictions about AI systems 28

### 3.3.1 Predicting behavior in novel situations 28

### 3.3.2 Predicting capabilities that arise during training or finetuning 29

## 3.4 ...inference, improve training, and make better use of learned mechs 30

## 3.5 Using mech interpret for ‘microscope AI’ 31

* Current approaches for knowledge discovery from data involve statistical or
  causal analysis, dimensionality reduction, or using machine learning models
  that are inherently interpretable. These techniques
  * hE influenced by human priors, typically assume linear relationships between
    variables, and cannot handle massive multimodal data. On the other hand,
  * deep learning models are capable of encoding complex, non-linear
    relationships and extracting meaningful features from massive data sets
    without human intervention.
  * Historically, these abilities had limited scientific value, as without
    methods to interpret these models, we could not understand the patterns they
    found. However,
  * nL with advancements in interpretablt research, this is beginning to change
* Applying interpretability for knowledge discovery is sometimes called
  microscope AI. This approach involves
  * steps
    * training a neural network to model a data set, then applying
      interpretability techniques to the model to gain insight into any
      (potentially novel) predictors it discovers. In this way,
  * the superhuman pattern matching skills of deep neural networks can serve as
    a tool to parse complex data sets. By understanding these networks’ detailed
    mechanisms, mechanistic interpretability may add new details to our
    understanding of the domains in which they have learned to perform so well.
* methods allow for versions of microscope AI, depending on the kind of insights
  that we want to learn. Some examples of
  * novel chess concepts from AlphaZero and teaching them to top grandmasters
    (Schut+ 2023)
  * using a CNN trained on defendant mugshots and judge decisions to reveal how
    facial features affect judgments (Ludwig & Mullainathan, 2023),
  * transforming psychology articles into a causal graph with an LLM to enable
    link prediction and produce expert-level hypotheses (Tong+ 2024b),
    * Siyuan Tong, Kaiwen Mao, Zhe Huang,+ Automating psycho hypothesigeneration
      with ai: when LLMs meet causal graph Humanities and Social Sciences
      Communications, 11:896, 2024b. doi:
  * analyzing a CNN to learn previously unknown morphological features for
    predicting immune cell protein expression (Cooper+ 2022), and applying
  * BiLRP to assess similarity and extract insights from historical documents
    such as astronomical tables (Eberle+ 2022), among
    * Oliver Eberle, Jochen Buttner, Florian Krautli, Klaus-Robert Muller,
      Matteo Valleriani, and Gregoire Montavon.  Building and interpreting deep
      similarity models.  IEEE Transactions on Pattern Analysis and Machine
      Intelligence, March 2022
  * several other studies (O’Brien+ 2023b; Hicks+ 2021; Narayanaswamy+ 2020;
    Korot+ 2021). As
  * deeper insights in and across more domains will become possible.
* hE the majority of scientists are unable to access microscope AI due to the
  * mic AI needs specialized expertise in machine learning, interpretability,
    and domain knowledge to recognize significant new patterns, a combination of
    skills that is rare in many fields. This
  * may change as interpretb research becomes more widely adopted in the scis,
    and as interpretability becomes increasingly automated and accessible.

## 3.6 ... on a broader range of models and model families 31

## 3.7 Human computer interaction with model internals 32


# 4 Socio-technical

## 4.1 Translating tech progress ...  into levers for AI policy and govern 33

* MI could enable us to act on AI policy and governance
  * implement regulatory standards and social ideals through technical means
* Current frontier AI governance efforts rarely specify concrete ways in which a
  mechanistic understanding of AI models might be used to help
  * OpenAI’s Preparedness Framework commits to mitigating biological risks posed
    by its AI systems (OpenAI 2023)
    * hE lacks details on specific measures that might be taken.  Progress in
* MI could potentially enable the removal of any knowledge from the model which
  could aid users in creating biological weapons (Li+ 2024b).
* uncertain how technical progress will translate into better AI governance,
  largely due to the numerous open technical problems in MI
* nL, there are several promising routes toward better levers
* assisting companies and governments to identify risks through evaluations and
  enhancing forecasts about new AI devel
  * more thorough oversight of AI systems in deployment
  * simplifying how AI systems operate within existing liability law through
    clearer explanations of AI decisions
  * enabling governments to establish risk mitigation regulations and
    * enab companies to commit to concrete mitigation commitments
  * protecting copyright law.
* An understanding of model internals can help AI labs assess the risks from
  frontier models (Chang+ 24; Shevlane+ 23; Casper+ 24) ~> better fulfill their
  obligations under the EU AI Act to “perform model evaluation ...  with a view
  to identifying and mitigating systemic risk” (Council of the European Union,
  2024)
  * MI could help evaluators elicit dangerous capabilities via improved
    finetuning (United Kingdom AI Safety Institute, 2024)
    * guide their adversarial red-team attempts (Tong+ 2024a), and
    * ensure that AI systems are not intentionally underperforming evaluations
      (van der Weij+ 2024).
* Advancements in mechanistic interpretability could also assist in anticipating
  when or if AI models will obtain specific dangerous capabilities.
* Improved forecasting capabilities could enhance threat modeling by reducing
  the “reasonable disagreement amongst experts over which risks to prioritize”
  (Anthropic, 2024)
  * reasonable disagreement eg
    * language models are just stochastic parrots (Bender+ 2021)
    * LMs have coherent world models (Li+ 2023) Kenneth Li, Aspen K Hopkins,
      David Bau, F Viégas, H Pfister, M Wattenberg.  Emergent world
      representations: Exploring a sequence model trained on a synthetic task
      International Conference on Learning Representations, 2023
* supporting or refuting different models of catastrophic threat, such as
  determining the validity of mesa-optimization (Hubinger+ 2021) or
  * Evan Hubinger, Chris van Merwijk, Vladimir Mikulik, J Skalse, S Garrabrant.
    Risks from learned optimization in Advanced Machine Learning Systems, 2021.
    arxiv.org/abs/1906.01820.
  * when a learned machine learning model acts as an optimizer itself during
    inference, pursuing an internal objective ("mesa-objective") that differs
    from the outer training loss function ("base objective").
  * inner alignment concerns (Carlsmith, 2023).
* It would also give additional time for
  * companies to prepare adequate risk mitigation measures, (OpenAI, 2023), and
  * governments to establish appropriate guidance or regul (UK Government, 2022)
* The EU AI Act mandates that developers of General Purpose AI models with
  systemic risk have obligations to report incidents involving their system to
  the AI office.
  * Interpretability tools have the potential to continuously monitor AI
    inference and detect incidents that require report.
  * unlike eg nuclear security, AI systems allow us to log all inputs and system
    states, even those that may lead to catast harm
  * Access to a small number of such data points may greatly improve our ability
    to mitigate similar future failures (Greenblatt & Shlegeris, 2024)
  * investigate the critical “features” of the input that led to the incident.
    This could improve our ability to further red-team the system (Section 3.3)
    and generate more similar data points that could result in similar incidents
    * This, in turn, may help us reduce the likelihood of future incidents
      (Chan+ 2024)
    * The incident could be utilized more directly in the construction of
      test-time monitors to detect similar future incidents (Roger 2023)
* MI could be used to
  * verify companies’ compliance with domestic regulation (O’Brien+ 2023a), or
    to
  * authenticate states’ compliance with future international treaties regarding
    the use of AI (Aarne+ 2024).
* MI could make decision rationales for AI model outputs more easily obtainable.
  * aid in enforcing citizens’ rights under the EU General Data Protection
    Regulation “to obtain an explanation of the decision reached” by a system
    (GDP, 2016; Gilpin+ 2019)
* copyright
  * Model editing tools could also resolve problems regarding the copyright
    status of existing generative models (Grynbaum & Mac, 2023)
  * According to the US Copyright Act (United States Congress), for any
    copyrighted work, an artifact “from which the work can be perceived,
    reproduced, or otherwise communicated ... with the aid of a machine or
    device” is considered a copy of the work (Lee+ 2024)
  * MI could help detect and remove memorized works that can be reproduced
    verbatim by generative models.

## 4.2 Social and philosophical problems in mech interpret 34

* social and philosophical considerations, which require rigorous inquiry
* The ability to interpret advanced AI systems holds immense potential to
  advance the science of AI and increase our ability to control it (Critch &
  Krueger, 2020; Tegmark & Omohundro, 2023; Dalrymple+ 2024). In this paper, we
  provide an overview of various interpretability tools that offer novel
  insights.
* hE interpretability research has thus far produced few tools that are used to
  make SOTA syss safer in the real world (Rauker+ 23)
  * Modern AI systems are still generally trained, evaluated, monitored, and
    debugged using techniques that do not rely on MI
  * The absence of paradigmatic clarity is a major socio-technical reason
* Questions such as which goals the field of interpretability should pursue, how
  success should be graded, and how we should define interpretability warrant
  more thoughtful answers than exist at present. In
* interpretable AI research, the motivations and methods employed are “diverse
  and occasionally discordant [conflicting” (Lipton, 2018). At times,
* obj ?= understanding
  * objective of AI interpretability research is articulated as “understanding”
    or “uncovering the true essence” (Christensen & Cheney, 2015) of what is
    happening inside black-box models.
  * The intrinsic validity of this paradigm deserves philosophical inquiry.
  * from an engineer’s perspective, pursuing “understanding” without a practical
    downstream application misses an engineer’s objective. Proponents of this
  * quantifiable benchmarks linked to concrete practical goals are accurate
    measures of the success of interpretability. This motivation is concrete and
  * hE some have criticized interpretability research as artificially limiting
    the solution space to engineering problems.
* When MI tools are studied with motivations such as fairness or safety,
  * Krishnan (2020): addressing [fairness or safety] need not involve interpret
  * the focus on interpretability artificially constrains the solution space by
    characterizing one possible solution as the problem itself.” Thus, some
  * interpretability research has failed to produce competitive techniques
    (Rauker+ 2023; Casper+ 2022b), omitted non-interpretability baselines
    (Rudin, 2019; Krishnan, 2020), and graded interpretability tools on their
    own curve (Doshi-Velez & Kim, 2017; Miller, 2019; Rauker+ 2023).
  * ! assess the usefulness of interpretability against alternative methods.
  * misrepresenting these comparisons can lead to false assumptions (Lipton &
    Steinhardt, 2019; Leech+ 2024)
  * particularly problematic when it impacts the efforts of critical safety work
* nL it is not always imperative for MI to strictly outperform uninterpretable
  baselines: It may still be helpful to develop
  * methods that offer interpretability-based advantages, along with the
    benefits of
  * more competitive uninterpretable methods (eg Rimsky+ (2024)).
* interpretability-based methods do not currently outperform black-box
  baselines,
  * nL if they perform in a similar ballpark, further progress in MI could soon
    lead to better methods, especially in problems which we believe might
    disproportionately benefit from improved mechanistic understanding (Section
    3).
* models are often studied in a vacuum: Smart & Kasirzadeh (2024) emphasize that
  the usefulness or correctness of model interpretations can depend on the
  broader context of the model’s development or deployment. For example, it may
  * eg hard to identify representations of fairness within models, since
  * under different definitions of fairness.
* interpret community must exercise caution in their communication to minimize
  potential abuses of the results of its work.
  * selective transparency can be used to actively mislead (Ananny & Crawford,
    2018). Furthermore,
  * interpretability is at risk of being used for corporate interests at the
    potential expense of safety. The field of
  * AI interpretabl is highly influenced by research teams in the private sector
    * industry resources and research contributions have significantly advanced
      interpretability research. On the other hand,
    * hE compared to academia, corporations publish selectively, often have
      financial conflicts of interest, and may provide limited transparency.
* the recent definite — but ultimately modest — progress in MI has been used to
  lobby against specific AI regulation by falsely claiming that, “Although
  advocates for AI safety guidelines often allude to the ‘black box’ nature of
  AI models, where the logic behind their conclusions is not transparent, recent
  advancements in the AI sector have resolved this issue, thereby ensuring the
  integrity of open-source code models.” (A Horowitz Acad, 2023)

# 5 Conclusion

* Current methods like sparse dictionary learning, while promising, face both
  * practical limitations in scaling to larger models and
  * deeper conceptual challenges regarding their underlying assumptions.
* must: moving beyond correlation-based descriptions to capture causal mechs
* need: better techniques to understand how mechanisms evolve during training
  * how they interact to produce complex behaviors.
* Improved interpretability methods could enable
  * more effective monitoring of potential risks,
    better control over model behavior, and
    more accurate predictions of capabilities.
* For AI capabilities, mechanistic understanding could lead to
  more efficient architectures,
  better training procedures, and
  more targeted ways to enhance model performance.
* In various scientific domains, microscope AI approaches could help
  extract valuable insights from model internals.
* must ensure a focus on generating insights that have real-world utility. This
  * establishing better benchmarks
* comparing interpretability-based approaches to non-interpretability baselines.
* fastest progress will likely come from the field
  pursuing both scientific and engineering goals simultaneously, rather than one
* The practical impact of progress in mechanistic interpretability extends
  * technical achievements.
  * governance and oversight. They could help
    * verify compliance with safety standards, detect potential risks before
      deployment, and provide clearer attribution of model decisions. However,
  * hE risks of potential misuse and of giving false assurance about AI safety.
