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

#### Decomposition by sparse dictionary learning (SDL)

* ‘superposition hypothesis’, 
  NNs can represent more features than they have dimensions, as long as 
  each feature activates sparsely (Elhage+ 2021) (Figure 4)
* dim redu cannot identify more directions than there are activation dimensions. 
* search for methods that can identify more directions than dimensions
* sparse dictionary learning (SDL) to this end 
  (Elhage+ 2021; Sharkey+ 2022b; Huben+ 2024; Bricken, 2023)

* Figure 4: Three ideas underlying the sparse dictionary learning (SDL) paradigm
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
* _latent_ is often used instead of _feature_ to refer to 
  = SDL dictionary elements, 
  since _feature_ is often used to refer to multiple ideas (Smith, 2024b) 
* hidden activations are typically passed to 
  a small neural network consisting of only two layers, which correspond to 
  an encoder and decoder respectively, with a wide hidden space
  * encoder activations represent how active each ‘latent’ is, and the 
  * decoder matrix corresponds to a dictionary of latent directions.
* We want to train the dictionary elements 
  to align with ‘feature directions’ in the network’s hidden activations
* we assume that individual features are sparsely present in the activations,
  ~> the encoder activations are trained to be sparsely activating
  * SAEs: the output is trained to reconstruct the input
  * transcoders (Dunefsky+ 2024; Ameisen+ 2025), to 
    reconstruct the activations of the next layer or layers. 
  * Crosscoders (Lindsey+ 2024; Ameisen+ 2025) permit a wider class of inputs
    and outputs, 
    potentially reconstructing the activations of many layers simultaneously.
* Since the encoder is nonlinear, it encoder is 
  thought to be able to learn to activate a latent only if a feature is 
  ‘active’ in the hidden activations and remain ‘off’ if it is not
* SDL is considered a leading decomposition method for MI
* hE substantial practical and conceptual limitations (Figure 5).

#### SDL reconstruction errors are too high

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

#### SDL methods are expensive to apply to large models

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

#### SDL assumes the linear representation hypothesis in nonlinear models

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

#### Sparsity is not a good proxy for interpretability: Another of SDL’s key

* (related) problems of 
  feature splitting (Bricken, 2023), 
  feature absorption (Chanin+ 2024) and 
  composition (Till, 2024) suggest that 
* with sufficient optimization pressure, sparsity as a proxy for interpretabilit
  breaks down (though note that 
  * nL it is debated whether feature splitting is actually a problem). 
* Other proxies, such as minimum description length, might be better optim targs
  than sparsity per se (Ayonrinde+ 2024). 
* It also may be the case that no proxy metric is sufficient.

#### SDL leaves feature geometry unexplained: 

* SDL decomposes networks into single directions in the activation space, which
  * ie consider feature activations akin to ‘a bag of features’ (Harris, 1954)
    without any internal structure. 
* hE the geometric arrangement of features in relation to each other seems to
  reflect semantic and functional structure 
  (Engels+ 2024a; Gurnee & Tegmark, 2024; Park+ 2024b; Bussman+ 2024)
* Understanding the geometric structure of a network means 
  understand the position of one feature relative to (potentially) many others
  * may be necessary if we want to know 
    why and how a network treats certain features similarly or differently.
* this might pose a fundamental problem for current approaches to MI 
  (Hänni+ 2024; Mendel, 2024). However, 
* nL if only local geometric relationships between features need to be understd,
  understanding networks with a ‘bag of features’ approach may be more feasible.

#### SDL cannot straightforwardly be applied to all architectures: SDL was

* originally developed to identify features that may be represented 
  in superposition across many neurons within a single layer
  * hE representations may be spread over other network architecture components
    besides neurons. In 
* transformers: representations may be spread across 
  * separate attention heads (Jermyn+ 2023; Janiak+ 2023), and even across
    * not obvious how with SDL (Mathwin+ 2024; Wynroe & Sharkey, 2024)
  * different layers (Yun+ 2021; Lindsey+ 2024). However, it is straightforward
    * ? how to translate cross-layer distributed representations into 
      causal descriptions of neural network mechanisms (Lindsey+ 2024), though 
* nL some recent work makes progress toward this (Ameisen+ 2025).

#### SDL decomposes the input and output activations of network mechanisms, but
not the mechanisms themselves: Ultimately, the aim of mechanistic
interpretability is to understand the mechanisms learned by neural networks. 
* The parameters of the network, along with its nonlinearities and other
  architectural components, implement these mechanisms, which are applied to
  the input’s hidden activations. SDL identifies directions in activation space.
* Being activations, they only interact with the network’s mechanisms, but are
  not the mechanisms themselves. Describing the mechanisms directly unresolved
* Gaining insights about the network’s mechanisms from SDL latents 
  requires further post hoc analysis, which can be 
  labor intensive, computationally expensive, or data set dependent 
  (Huben+ 2024; Bricken, 2023; Riggs+ 2023; Marks+ 2024). This is 
* an instance of a more broad problem with current mechanistic interpretability
  * we primarily focus on understanding neural network activations, with 
    little attention paid to 
    how this structure in activations is computed via weights 
    (Chughtai & Bushnaq, 2025)

#### SDL latents may not contain the concepts needed for downstream use cases:

* there sometimes exists a single latent or small set of latents representing
  some concept of interest for task performance (and not representing much
  else). For instance, 
  * Kantamneni+ (2024) found a single latent whose activation pattern was 
    more accurate than official dataset labels on the NLP task GLUE CoLA
    (Warstadt+ 2019). 
  * hE a sparse set of latents that encode some useful concept of interest
    rarely exist.
* unclear what causes this problem. Hypotheses:
1. the concept we want isn’t how the model ‘thinks’,
  ie the SAE is working as intended.
2. the SAE training distribution could be too narrow, resulting in
  * ie SAE not incentivised to learn the important latents. 
  * Kissane+ (2024c) found that 
  SAEs trained on pretraining data generally do not have good latents 
  for the concept of ‘refusing’ harmful user requests, while 
  SAEs trained on chat formatted data do. Or, 
3. the SAE might not have a large enough dictionary size 
  to learn all concepts of interest. Many more hypotheses are plausible. 
* the latents identified by SDL depend heavily on the train data set
  * an undesirable property for a decomposition method that was 
    initially hoped to be capable of identifying the fundamental units of
    computation in neural networks (Kissane+ 2024c).

#### Current decomposition methods lack solid theoretical foundations. Given the

* improved conceptual clarity beyond the idea of superposition (Elhage+ 2021) is
  needed to advance neural network decomposition.
* the nature of features, despite being the central focus of SDL’s id efforts.
  * Satisfying formal definitions are elusive and 
    conceptual foundations are not yet established. However, even without
  * nL even confused concepts can be pragmatically useful (Henighan, 2024).
* whether the superposition hypothesis is fundamentally valid or merely
  pragmatically useful (Henighan, 2024; Templeton+ 2024).
* take into account feature geometry or 
  take a more dynamic, developmental view of how mechanistic structure emerges
  in the training process (Hoogland+ 2024; Wang+ 2024b).
* how models might perform computation on features natively in superposition.
* ? bounds on the number of features we should expect models to learn 
  (Hänni+ 2024; Adler & Shavit, 2024; Bushnaq & Mendel, 2024). The field should
* decomposing or analyzing network parameters (Braun+ 2025; Tsang+ 2018)
* methods that decompose networks according to 
  analytical descriptions of the local functions they implement, such as 
  deep Taylor decomposition (Montavon+ 2017).
* more formal foundations.
  * causality (Geiger+ 2024a). However, this approach has 
    not yet yielded canonical causal mediators (Mueller+ 2024) 
    that may form a basis for decomposition methods. How should we go about
  * theories about why neural networks generalize appears to be a promising
    avenue. But theories that attempt to characterize why neural networks
    * spline theory of neural networks (Balestriero & Baraniuk, 2018),
    * simplicity bias (Valle-Perez+ 2019), 
    * the neural tangent kernel (Jacot+ 2018; Roberts+ 2022), or 
    * singular learning theory (Watanabe, 2009; Wei+ 2023) have 
  * hE theories either/or
    * no mathematical objects that can be easily used for interpretability, or
    * not successfully linked to approaches for interpreting neural networks.
---
* if we can carve trained networks at their joints, 
  it may suggest ways to train networks such that they come ‘pre-carved’.
  ie models that are intrinsically decomposable by design, 
  which we discuss next.

#### Intrinsic interpretability: Building more easily decomposable models 

* The current strategy of 
  training a model solely for performance and then interpreting it post hoc 
  may not be optimal if our goal is a model that is both interpable and perform
* ie prioritize interpretability during model training, for which there are
  several plausible approaches.
* network activations could be forced to use a discrete code from the outset, as
  * eg Tamkin+ (2025). 
* MLPs could also be trained with sparser activation functions, such as 
  eg TopK (Makhzani & Frey, 2013; Bills+ 2023) or SoLU (Elhage+ 2022). Similar
* restrict attention superposition (Jermyn+ 2023) 
  by limiting the number of heads attending to any query-key pair. Several
* ‘mixture of experts’ (Shazeer+ 2017; Fedus+ 2022; He, 2024) uses sparsely
  activating components — 
  * with a large enough number of experts, and with 
    sufficient activation sparsity, 
    experts may become individually interpretable (Warstadt+ 2019).
* attempts to incentivize [motivate] interpretable activations directly so far
  have not been competitively performant, and have also allowed ‘superposition
  to sneak through’, mitigating benefits.
* target weight sparsity directly during training, including approaches such as
  * $L_0$ regularization (Louizos+ 2018) or 
  * pruning (Mozer & Smolensky, 1988; Frankle & Carbin, 2019; Mocanu+ 2018).
* Han+ (2015) achieve sparse weights by using 
  magnitude pruning followed by finetuning. This highlights a general strategy
* finetuning with interpretability in mind (also used by Tamkin+ (2025)),
  avoiding the potentially excessive cost of training from scratch. Another
* modularity (Kirsch+ 2018; Andreas+ 2016).
  * brain-inspired modular training (Liu+ 2023) trains for modularity by
    embedding neurons in a geometric space and 
    encouraging geometrically local connections.
* simplify linearity-reliant circuit analysis (Elhage+ 2021). For example, there
  * removing the layer norm operations (Heimersheim, 2024), 
    using input-switched affine transformations for recurrence (Foerster+ 2017).
* architectures that are mathematically analyzable in other ways than linearity,
  such bilinear activations in MLPs (Sharkey, 2023; Pearce+ 2024).

### 2.1.3 Reverse engineering step 2: Describing the functional role of compons

* description of components to formulate hypotheses about their functional roles
  and interactions
* methods: max-activating dataset examples, attribution methods, 
  feature synthesis, or causal intervention 
* should not be taken to be definitive conclusions before they are thr validated
* Descriptions of the functional role of neural network components can either
  indicate 
  * the cause of a component’s activation or 
  * what occurs after that component has been activated, or – 
  * preferably – both (Figure 6). In this section, we will discuss the existing

* Figure 6: To study the functional role of the blue component numerous
  * component's causes: the purple input components or the red intermediate components 
    * via eg feature synthesis (Olah+ 2017a; 2020b), 
      maximum activating examples (Olah+ 2017a; Bricken, 2023), or 
      attributions (Sundararajan+ 2017). Or we could study 
  * component's effects: the orange output components or the green intermediate
    * via eg the logit lens (Nostalgebraist, 2020), 
    * activation steering (Turner+ 2024), or 
    * attributions (Marks+ 2024).

#### Explanations for what causes components to activate Explanations of the
* three broad categories of methods, each with several problems: 
  * Highly activating data set examples; 
  * Attribution methods; and 
  * Feature synthesis.

##### Highly activating data set examples. The simplest method is to use 

* highly activating data set examples (sometimes called ‘exemplar reprs’
  (Hernandez+ 2022)). These are inputs on which a particular component is
* analyzing apparent commonalities in the inputs suggests hypotheses for what
* may be carried out by humans or AI systems (Section 2.4).
* issues. The first issue is that the method 
  1. relies on human prior beliefs, which may lead interpreters to project their
     human understanding onto models that may be using unfamiliar concepts. This
    * may identify concepts in the model that do not truly explain the model’s
      funcalt (Freiesleben & König, 2023; Donnelly & Roegiest, 2019; Gale+ 2020)
  2. ‘interpretability illusions’. Bolukbasi+ (2021) show that 
    * bias in data sets can create misleading explanations 
      * even with real data sets, as opposed to synthetically created data.
    * human annotators identified dramatically different meanings 
      for given directions in the activation space of BERT (Devlin, 2018).
  3. often yields plausible explanations for arbitrarily chosen directions 
    in the activation space (Szegedy+ 2014). This means that plausible
* it is possible to develop adversarial models that 
  deliberately yield misleading feature visualizations (Geirhos+ 2025).
  * Robert Geirhos, Roland S. Zimmermann, Blair Bilodeau, Wieland Brendel, B Kim
    Don’t trust your eyes: on the (un)reliability of feature visualizations. In
    ICML’24. JMLR.org, 2025.
* corr vs cau
  * highly activating data set examples stem from the fact that they 
    merely provide correlational explanations for the activation of a netw compon, 
    rather than causal explanations. 
* To identify causal explanations, other methods, eg attribution methods, necess

##### Attribution methods are necessary for causal explanations but are often
difficult to interpret.

* Attribution methods 
  (Baehrens+ 2009; Simonyan+ 2014a; Nguyen+ 2016b; Selvaraju+ 2019;
  Sundararajan+ 2017; Fong & Vedaldi, 2017; Lundberg & Lee, 2017; Ribeiro+ 2016)
  * intended to measure the causal importance of upstream variables (such as
    inputs) on downstream variables (such as a network component).
* methods include 
  * Grad-CAM (Selvaraju+ 2019) and 
  * Integrated Gradients (Sundararajan+ 2017), as well as 
  * perturbation or model-agnostic approaches such as 
    * LIME (Ribeiro+ 2016) and SHAP (Lundberg & Lee, 2017).
* categorized as 
  * gradient-based (Mozer & Smolensky, 1988; Baehrens+ 2009; Simonyan+ 2014a;
    Nguyen+ 2016b; Selvaraju+ 2019; Sundararajan+ 2017; Wang+ 2024d) or
  * sampling-, perturbation-, or ablation-based 
    (Fong & Vedaldi, 2017; Vig+ 2020; Geiger+ 2020; Ghorbani & Zou, 2020; Meng+
    2022b; Chan+ 2022a; Nanda, 2023a). However, 
* hE grad
  * on a theoretical level, many gradient-based methods 
    identify only a first-order approximation of the ideal attribution, which is
  * sometimes a poor approximation (Watson, 2022). 
  * Most approaches only attribute important single components, though some
* nL feature interaction
 * integrated Hessians, attributes important feature interaction (Janizek+ 2020)
  * KernelSHAP-IQ characterizes higher-order Shapley Interaction Index as a
    solution to a weighted least square problem, offering one way to quantify
    such interactions (Fumagalli+ 2024). Specific to 
  * for Graph Neural Networks (GNNs), recent advancements such as 
    GraphSHAP-IQ by Muschalik+ (2025) enable the exact and efficient computation
    of any-order Shapley Interactions. Other specialized methods, like 
* BiLRP: feature interactions in text sim models (Vasileiou & Eberle, 2024)
* Adebayo+ (2018): some gradient-based methods identify attributions that are
  independent both of the model and of the data generating process.
* an adversary can train a model or perturb an input 
  to reveal any attribution map (Dombrowski+ 2019; Ghorbani+ 2019; Heo+ 2019;
  Kindermans+ 2019; Slack+ 2020; Zhang+ 2020) 4 . 
  * nL Freiesleben & König (2023): 
    adversarial examples do not truly undermine saliency maps 
    as these are highly dissimilar to real interpretability challenges.  
* For specific architectures like Graph Neural Networks (GNNs), methods such as
  GNN-LRP have been developed to provide higher-order explanations 
  by identifying relevant walks in the input graph using 
  Layer-wise Relevance Propagation (Schnake+ 2022).
* Perturbation methods present certain issues, such as 
  * taking models off their training distribution and eliciting unusual behavior,
  * theoretical complications (Feng+ 2018; Molnar+ 2021; Hooker+ 2021; Molnar+
    2024; Freiesleben & König, 2023; Slack+ 2021). Developing efficient and

##### Feature synthesis 

* combines highly activating data set examples and gradient-based attribution
  (Erhan+ 2009; Szegedy+ 2014; Olah+ 2017a).
* synthesize inputs that maximize the activation of a component subject to some
  regularization, such as 
  * consistency with a generative model (Nguyen+ 2016a; 2017) or 
  * total variation distance (Mahendran & Vedaldi, 2014).
* criticisms of feature synthesis methods suggest that 
  * natural dataset examples may serve interpretation better (Zimmermann+ 2021;
    Borowski+ 2021) or show that 
  * current methods struggle to identify trojans (Casper+ 2023a).

#### Explanations for the downstream effects of components Alternatively, the

##### Studying the direct effect. The 

* logit lens (Nostalgebraist, 2020) applies the models unembedding matrix to an
  intermediate residual stream representations, converting it into a
  distribution over the model’s output vocabulary. 
* Direct logit attribution is a generalization of this technique, 
  applying to any appropriately sized vector space in the model, eg 
  * the output of MLP layers (Geva+ 2021; 2022b;a; Dar+ 2023)
  * attention blocks
  * gradients (Katz+ 2024) of these
  * and SDL decoder weights (Bricken 2023). 
* tuned lens: Adding a trainable affine or linear trafo before unembedding, as
  * improves decoding accuracy (Belrose+ 2023a; Yom Din+ 2024), at the cost of
  * hE less faithfully representing when the model has completed computation.
* In the language of causality (Pearl, 2009), 
  unembedding a residual stream vector 
  measures the direct effect of that vector on the output (McGrath+ 2023).
* hE, the logit lens cannot measure the indirect effect, 
  ie the effects resulting from the influence that the embedding has on the
  hidden activations of subsequent layers. Other methods, such as 
* causal interventions (see below), are necessary to measure the indirect
* future: extend logit-lens-like approaches to project the effects of network
  components on not only/but also
  * directions in output vocabulary space
  * intermediate downstream components.

##### Causal Interventions. Causal interventions typically 

* substitute (“patch”) the value of some network component, usually an
  activation vector, with a different value during a forward pass, 
  observing the resulting effect on the model. There exist 
* a related set of techniques: 
  ablation (for the special case of zero-ing or otherwise attempting to delete
  activations entirely), activation patching, 
  * causal mediation analysis, causal tracing, and interchange intervention
    (Vig+ 2020; Geiger+ 2020; Meng+ 2022a; Chan+ 2022a; Nanda, 2023a).
  * eg by patching activations from the corrupt prompt “the capital of Italy is”
    into the clean prompt “the capital of France is”, we can observe the effect
    on the output (“Rome” vs.“Paris”). This tells us which component values are
    relevant for the differing output between the two prompts, but not the
    information that remains consistent (eg the fact that the answer is a city).
* patch patching: More surgical patches made on edges between network components
  * allows us to isolate the effect of one particular component 
    on only one other component, instead of on the entire rest of the network
    (Goldowsky-Dill+ 2023). 
* Causal scrubbing (Chan+ 2022a) is a generalization of path patching that
  allows for testing hypotheses concerning any given connection between a set of
  network components.
* generate supervision signal to identify subspaces of interest. For instance,
  * distributed alignment search (Geiger+ 2024c) 
    learns a linear subspace that represents a particular concept, 
    using data with interventions on that concept as supervision 
    (Geiger+ 2024c; Guerner+ 2024; Wu+ 2023)
* masks over network components to remove irrelevant components 
  (De Cao+ 2020; Csordás+ 2021; Davies+ 2023)
* A causal intervention typically requires a forward pass of the model. This 
  * may make performing one for every network component in large models, long
    contexts, or when using finer-grained components such as sparse autoencoder
    latents prohibitively expensive. 
  * Faster alternatives that work well in practice (Marks+ 24; Templeton+ 24)
    * gradient-based approximations to activation patching, such as 
    * eg attribution patching (Nanda, 2023a; Syed+ 2024), `AtP*` (Kramár+ 2024),
      and integrated gradients (Sundararajan+ 2017).

##### Observing the effects of components on sequential behavior. Another way to

* patch in activated components and observe their effect on model behavior.
* Steering is one example of this (Rimsky+ 2024; Turner+ 2024), where 
  * components (activation vectors) are activated 
    in order to influence the network’s behavior, often in interpretable ways.
* patchscopes: To determine the functional role of an activation vector, 
  a related method is to have a language model itself decode the activations
  (Chen+ 25; Watkins, 23; Ghandeharioun+ 24; Huang+ 24b; Kharlapenko+ 24). These
  * patch activations from one forward pass of a model 
    into a different forward pass (perhaps in a different model). 
  * The context of the new forward pass is designed to elicit relevant
    information from the activations of the original forward pass.
* A related sequential behavior based technique is simply 
  to read the chain-of-thought (Wei+ 2024; Kojima+ 2024) produced by an LMs
  * this could be considered an ‘interpretability technique’ 
    in the sense that it aims to explain model decisions, it does 
  * not use model internals in those explanations, at least not directly. Recent
* chains of thought are not entirely faithful 
  to the model’s underlying decision-making process 
  (Agarwal+ 2024; Atanasova+ 2023; Turpin+ 2023; Lanham+ 2023; 
  Ye & Durrett, 2022). A promising future direction for interpretability
* future
  * incorporate model internals into chain-of-thought training, which could
    incentivize faithfulness. Another possibility is 
  * building monitors based on model internals 
    to improve transparency in chain-of-thought faithfulness.

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
