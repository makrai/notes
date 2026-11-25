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
  Rai+ 2024; Anwar+ 2024; Davies & Khakzar, 2024; Mosbach+ 2024; Mueller+ 2024)
* we: which directions we might benefit most from prioritizing in the future

### 1.1.1 Why ‘mechanistic’ interpretability?

* distinction between interprtab and mechanistic interprtab is not always clear
  * interpr: motivations and methods used in interpretability work are diverse
    (Lipton, 2018; Doshi-Velez & Kim, 2017; Jacovi, 2023)
  * categorizations of interpretability include
    * causal vs correlational methods, supervised vs unsupervised methods,
    * bottom-up vs top-down methods, among others
    (Geiger+ 2024b; Mueller+ 2024; Bereska & Gavves, 2024; Belinkov, 2022a; Zou+
    2023a; Davies & Khakzar, 2024)
* mechanistic interpretability. But what distinguishes ‘mechanistic'?
  * the term is used in a number of (sometimes inconsistent) ways
    (Saphra & Wiegreffe, 2024)
  * we in a technical sense: mechanisms underlying neural network generalization
* one of three threads of interpretability research
  * the three roughly reflect the changing aims of interpretabilit over time
1. AI systems that are interpretable by design
  * the sensitivity of machine learning models to inputs and training data
  * This work typically used
    small-to-medium sized models designed to be easily interpretable
    * eg decision trees (Breiman, 1984; Hu+ 2019),
    * linear models (Roweis & Ghahramani, 1999), and
    * generalized additive models (Hastie & Tibshirani, 1986; Agarwal+ 2021)
  + attribution methods such as influence functions (Hampel, 1974; Koh & Liang,
    2017) and
    * Shapley values (Shapley, 1997; Lundberg & Lee, 2017)
    * characterize model decision boundaries with respect to inputs
  * continues to be an active research area, including architectures such as
    * Concept-Bottleneck Models (Koh+ 2020),
    * Backpack Language Models (Hewitt+ 2023),
    * Kolmogorov-Arnold Networks (Liu+ 2024c), and
    * sparse decision trees (Xin+ 2022)
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
  * models became capable of more profound generalization
  * How did my model solve this general class of problems? Due to its emphasis
  * commonly referred to as ‘mechanistic interpretability’ (in addition to
    + cultural reasons according to (Saphra & Wiegreffe, 2024)). This
  * driven by a fundamental hypothesis in deep learning that
    generalization arises from shared computation (LeCun+ 2015)
  * Early work in this area, such as
    eg feature visualization (Olah+ 2017b), or network dissection (Bau+ 2020),
    sought “global” explanations for model generalization
    by investigating the roles of model components across a class of decisions
  * More recent work in this area looks at
    * “circuits” of components (Wang+ 2023),
    * generalizable patterns of information flow (Geva+ 2023),
    * representation subspaces (Geiger+ 2024c; Zou+ 2023a) and
    * probes (or self-supervised searches via sparse dictionary learning)
      for representation vectors that carry information that
      generalizes across many instances for a particular task or set of tasks
      (Huben+ 2024; Bricken, 2023; Todd+ 2024; Hollinsworth+ 2024)

## 1.2 Types of open problems

* concrete scientific and engineering goals
  * Monitor AI systems for signs of cognition related to dangerous behavior
    (Section 3.2);
  * Modify internal mechanisms and edit model parameters
    to adapt their behavior to better suit our needs (Section 3.2.2);
  * Predict how models will act in unseen situations or predict when a model
    might learn specific abilities (Section 3.3);
  * Improve model inference, training, and mechanisms
    to better suit our preferences (Section 3.4);
  * Extract latent knowledge from AI systems so we can better model the world
    (Section 3.5)
* needs: greater application of current SOTA mechanistic interpretabilit methods
  + development of improved techniques. The first major section (Section 2)


# 2 Methods and foundations

* One way of thinking about what neural networks do internally is that NNs learn
  parameters that implement neural algorithms. These neural algorithms
  * Different parts of the network learn different steps in the algorithm;
  * MI aims to describe the function of different network components
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
  outperforms humans on next-token prediction tasks (Shlegeris+ 2024)
* hE even SOTA multimodal LLMs struggle with tasks that a four-year-old  masters
  * eg learning causal properties of new objects involving simple lights and
    shapes (Kosoy+ 2023). An even clearer sign that humans and AI are using
* cases where humans cannot solve a problem at all, as in the case of predicting
  * protein structure from sequence (Jumper+ 2021; Lin+ 2023)
* diff heuris Even when both humans and AI exhibit comparable competence on a
  * image models tend to rely more heavily on
    * textural features (such as recognizing elephants by their hide rather than
      their shape (Geirhos+ 2019)) or rely on
    * dataset correlations (as when identifying fish by the fingers that proud
      fisherman use to hold them (Brendel & Bethge, 2019)) to a greater degree
  * simple algorithmic tasks, like modular addition, which
    * humans might solve with simple carries, were solved by
    * a small transformer model by learning a Fourier transform strategy that
      researchers only understood in retrospect (Nanda+ 2023a)
* ie we must be able to reverse engineer these models (Olah, 2024)
1. Decomposition: Breaking down the object of study into simpler parts (S 2.1.2)
2. Description of components: Formulating hypotheses about the functional role
   of component parts and how they interact
   * (a process that can be called ‘interpretation’) (Section 2.1.3);
3. Validation of descriptions: Testing if our hypotheses are correct (Sec 2.1.4)
* If our hypotheses are invalidated, we must either improve our decomposition or
  improve our hypotheses regarding the functional roles of its components. We
* this sec: current methods and their respective shortcomings

### 2.1.2 Reverse engineering step 1: Neural network decomposition

#### Networks do not naturally decompose into architectural components. The

* eg individual neurons, attention heads, or layers
  * early attempts: responses or weight structure of individual neurons or
    single convolutional filters
    (Erhan+ 2009; Le+ 2012; Krizhevsky+ 2012; Szegedy+ 2014; Simonyan+ 2014b;
    Zhou+ 2015; Srivastava+ 2014; Yosinski+ 2015; Mordvintsev, 2015;
    Olah+ 2017a; Bau+ 2020; Dalvi+ 2019; Olah+ 2020a; Cammarata+ 2020). These
    * paid homage [respected] to the ‘Neuron Doctrine’ in neuroscience, which
      (Cajal, 1924; Sherrington, 1906)
  * hE neurons are ‘polysemantic’ – they seem to respond to multiple kinds of
    features in both
    artificial (Wei+ 2015; Nguyen+ 2016c; Olah+ 2017a) and
    biological networks (Churchland & Shenoy, 2007; Rigotti+ 2013; Mante+ 2013;
    Raposo+ 2014)
  * representations used by neural networks do not necessarily align with the
    activation of individual neurons (Hinton, 1981)
* individual attention heads does not fare better than neurons, as
  * attention heads also exhibit polysemanticity (Janiak+ 2023). More broadly,
  * the attention patterns of models can often be misleading
    (Jain & Wallace, 2019; Pruthi+ 2020)
* layers
  * representations in language models might span multiple layers (Yun+ 2021;
    Lindsey+ 2024; Ameisen+ 2025). This chimes with
  * some work edits or intervenes on individual layers, which indicates that
    * this level is too coarse-grained to robustly carve the network at its joints
      (Meng+ 2022b; Wang+ 2023)

#### Decomposition by dimensionality reduction methods. If individual neurons

* groups or patterns of neurons are
* identify activation vectors that correspond to the basic unit of computation
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
  semantically unique and distinguishable concepts (Graziani+ 2023)

#### Decomposition by sparse dictionary learning (SDL)

* ‘superposition hypothesis’,
  NNs can represent more features than they have dimensions, as long as
  each feature activates sparsely (Elhage+ 2021) (Figure 4)
* dim redu cannot identify more directions than there are activation dimensions
* search for methods that can identify more directions than dimensions
* sparse dictionary learning (SDL) to this end
  (Elhage+ 2021; Sharkey+ 2022b; Huben+ 2024; Bricken, 2023)

* Figure 4: Three ideas underlying the sparse dictionary learning (SDL) paradigm
  * (Left) The linear representation hypothesis states that
    the map from ‘concepts’ to neural activations is linear
  * (Middle) Superposition is the hypothesis that
    models represent many more concepts than they have dimensions by
    * representing them both sparsely and linearly in activation spaces
  * (Right) SDL attempts to recover an overcomplete basis of concepts
    represented in superposition in activation space
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
  * decoder matrix corresponds to a dictionary of latent directions
* We want to train the dictionary elements
  to align with ‘feature directions’ in the network’s hidden activations
* we assume that individual features are sparsely present in the activations,
  ~> the encoder activations are trained to be sparsely activating
  * SAEs: the output is trained to reconstruct the input
  * transcoders (Dunefsky+ 2024; Ameisen+ 2025), to
    reconstruct the activations of the next layer or layers
  * Crosscoders (Lindsey+ 2024; Ameisen+ 2025) permit a wider class of inputs
    and outputs,
    potentially reconstructing the activations of many layers simultaneously
* Since the encoder is nonlinear, it encoder is
  thought to be able to learn to activate a latent only if a feature is
  ‘active’ in the hidden activations and remain ‘off’ if it is not
* SDL is considered a leading decomposition method for MI
* hE substantial practical and conceptual limitations (Figure 5)

#### SDL reconstruction errors are too high

* question whether SDL methods can reconstruct the hidden representation
  sufficiently well such that the latents learned by SDL are adequately faithful
  to the models being interpreted
* To measure this, the model’s true
  hidden activations can be replaced with sparse dictionary reconstructions,
  * evaluating the extent to which the model’s performance decreases
* the error results in significant performance reductions. When a sparse
* eg
  * 16 million latents was inserted into GPT-4, the language modeling loss was
    equivalent to a model with only 10% of GPT-4’s pretraining compute (Gao+
    2024). Similarly,
  * Makelov+ (2024) found that using reconstructions from sparse autoencoders
    decreased GPT-2 small performance by 10% when trained on task-specific data,
    and 40% when trained on the full distribution
* Making sparse dictionaries much larger and sparser to reduce errors is a
  feasible but computationally expensive approach. Furthermore,
  * in the limit, this results in merely assigning one dictionary latent per
    datapoint, which is clearly less interpretable. One
* partial solution is using SDL methods with
  ‘error nodes’ (Marks+ 2024), to account for the discrepancies between the
  original and reconstructed activations
  However, while the sparse autoencoders identified interpretable latents, the
  error nodes contain ‘everything else’, making them an inadequate solution to
* Engels+ (2024b): reconstruction errors are not purely random, as
  much of the direction of the error and its norm
  can be linearly predicted from the initial activation vector
  * This suggests that current SDL methods may
    systematically fail to capture certain structured aspects of model reprs,
  * also implies potential solutions. To overcome this issue, it may be
    necessary to improve SDL training methods, or develop entirely new methods
    of network decomposition

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
  Guerner+ 2024; Gurnee & Tegmark, 2024)
* The hypothesis formalizes this phenomenon by stating that
  high level concepts are linearly represented as directions (vectors) in NN embeds
* two core claims
  * the composition of multiple concepts can be represented as the addition of
    their corresponding feature vectors, and
  * the intensity of a concept is represented by the scale of its corresponding
    feature vector (Olah & Jermyn, 2024)
* additional assumptions
  * Elhage+ (2021): one-dimensional features
    * this definition has since been
      refuted (Yedidia, 2023; Chughtai & Lau, 2024; Engels+ 2024a) and
      clarified (Olah & Jermyn, 2024). Another recently proposed criterion is that
  * the intensity of concepts should be retrievable by a linear function of the
    embeddings, up to a small error (Hänni+ 2024; Olah & Jermyn, 2024)
  * A weak version of the linear representation hypothesis states that
    some concepts are linearly represented, while a
    strong version may assert that all concepts are (Smith, 2024a). Some works
  * the strong version is false for some models (Black+ 2022; Csordás+ 2024)
  * The weaker version of the linear repr hypo is supported by the successes of
    * linear probes (Section 2.2.1)
    * activation steering (Section 3.2.2)
    * sparse autoencoders in finding seemingly interpretable latents (Sec 2.1.2)

#### Sparsity is not a good proxy for interpretability

* (related) problems of
  feature splitting (Bricken, 2023),
  feature absorption (Chanin+ 2024) and
  composition (Till, 2024) suggest that
* with sufficient optimization pressure, sparsity as a proxy for interpretabilit
  breaks down (though note that
  * nL it is debated whether feature splitting is actually a problem)
* Other proxies, such as minimum description length, might be better optim targs
  than sparsity per se (Ayonrinde+ 2024)
* It also may be the case that no proxy metric is sufficient

#### SDL leaves feature geometry unexplained

* SDL decomposes networks into single directions in the activation space, which
  * ie consider feature activations akin to ‘a bag of features’ (Harris, 1954)
    without any internal structure
* hE the geometric arrangement of features in relation to each other seems to
  reflect semantic and functional structure
  (Engels+ 2024a; Gurnee & Tegmark, 2024; Park+ 2024b; Bussman+ 2024)
* Understanding the geometric structure of a network means
  understand the position of one feature relative to (potentially) many others
  * may be necessary if we want to know
    why and how a network treats certain features similarly or differently
* this might pose a fundamental problem for current approaches to MI
  (Hänni+ 2024; Mendel, 2024). However,
* nL if only local geometric relationships between features need to be understd,
  understanding networks with a ‘bag of features’ approach may be more feasible

#### SDL cannot straightforwardly be applied to all architectures

* originally for features that may be represented in superposition
  across many neurons **within a single layer**
  * hE representations may be spread over other network architecture components
* transformers: representations may be spread across
  * separate attention heads (Jermyn+ 2023; Janiak+ 2023), and even across
    * not obvious how with SDL (Mathwin+ 2024; Wynroe & Sharkey, 2024)
  * different layers (Yun+ 2021; Lindsey+ 2024). However, it is straightforward
    * ? how to translate cross-layer distributed representations into
      causal descriptions of neural network mechanisms (Lindsey+ 2024), though
* nL some recent work makes progress toward this (Ameisen+ 2025)

#### SDL decomposes the input and output activations of network mechanisms, but
not the mechanisms themselves

* Ultimately, the aim of mechanistic interpretability is to understand the
  mechanisms learned by neural networks
* The params of the network, along with its nonlinearities and other compons,
  implement these mechanisms, which are applied to the input’s hidden activats
  SDL identifies directions in activation space
* Being activations, they only interact with the network’s mechanisms, but are
  not the mechanisms themselves
* Gaining insights about the network’s mechanisms from SDL latents
  requires further post hoc analysis, which can be
  labor intensive, computationally expensive, or data set dependent
  (Huben+ 2024; Bricken, 2023; Riggs+ 2023; Marks+ 2024)
* more broad problem: focus on understanding neural network activations
  * little attention paid to
    how this structure in activations is computed via weights
    (Chughtai & Bushnaq, 2025)

#### SDL latents may not contain the concepts needed for downstream use cases

* there sometimes exists a single latent or small set of latents representing
  some concept of interest for task performance (and not representing much
  else) eg
  * Kantamneni+ (2024) found a single latent whose activation pattern was
    more accurate than official dataset labels on the NLP task GLUE CoLA
    (Warstadt+ 2019)
  * hE a sparse set of latents that encode some useful concept of interest
    rarely exist
* unclear what causes this problem. Hypotheses:
1. the concept we want isn’t how the model ‘thinks’,
  ie the SAE is working as intended
2. the SAE training distribution could be too narrow
  * ie SAE not incentivised to learn the important latents
  * Kissane+ (2024c) found that
  SAEs trained on pretraining data generally do not have good latents
  for the concept of ‘refusing’ harmful user requests, while
  SAEs trained on chat formatted data do. Or,
3. the SAE might not have a large enough dictionary size
  to learn all concepts of interest. Many more hypotheses are plausible
* the latents identified by SDL depend heavily on the train data set
  * an undesirable property for a decomposition method
  * method initially hoped to be capable of identifying the fundamental units of
    computation in neural networks (Kissane+ 2024c)

#### Current decomposition methods lack solid theoretical foundations

* needed: improved conceptual clarity beyond the idea of superposition (Elhage+
  2021) for decomposition
* the nature of features, despite being the central focus of SDL’s id efforts
  * Satisfying formal definitions are elusive and
    conceptual foundations are not yet established
  * nL even confused concepts can be pragmatically useful (Henighan, 2024)
* whether the superposition hypothesis is fundamentally valid or merely
  pragmatically useful (Henighan, 2024; Templeton+ 2024)
* take into account feature geometry or
  take a more dynamic, developmental view of how mechanistic structure emerges
  in the training process (Hoogland+ 2024; Wang+ 2024b)
* how models might perform computation on features natively in superposition
* ? bounds on the number of features we should expect models to learn
  (Hänni+ 2024; Adler & Shavit, 2024; Bushnaq & Mendel, 2024)
* decomposing or analyzing network parameters (Braun+ 2025; Tsang+ 2018)
* methods that decompose networks according to
  analytical descriptions of the local functions they implement, such as
  deep Taylor decomposition (Montavon+ 2017)
* more formal foundations
  * causality (Geiger+ 2024a)
    hE yet no canonical causal mediators (Mueller+ 2024)
    that may form a basis for decomposition methods
  * theories about why neural networks generalize
    * spline theory of neural networks (Balestriero & Baraniuk, 2018),
    * simplicity bias (Valle-Perez+ 2019),
    * the neural tangent kernel (Jacot+ 2018; Roberts+ 2022), or
    * singular learning theory (Watanabe, 2009; Wei+ 2023)
  * hE theories either/or
    * no mathematical objects that can be easily used for interpretability, or
    * not successfully linked to approaches for interpreting neural networks

#### Intrinsic interpretability: Building more easily decomposable models

* The current strategy of
  training a model solely for performance and then interpreting it post hoc
  may not be optimal if our goal is a model that is both interpable and perform
* ie prioritize interpretability during model training, for which there are
  several plausible approaches
* network activations could be forced to use a discrete code from the outset, as
  * eg Tamkin+ (2025)
* sparser activation functions, such as eg
  * TopK (Makhzani & Frey, 2013; Bills+ 2023) or
  * SoLU (Elhage+ 2022)
* restrict attention superposition (Jermyn+ 2023)
  by limiting the number of heads attending to any query-key pair
* ‘mixture of experts’ (Shazeer+ 2017; Fedus+ 2022; He, 2024) uses
  * sparsely activating components —
  * with a large enough number of experts, and with
    sufficient activation sparsity,
    experts may become individually interpretable (Warstadt+ 2019)
  * hE not competitively performant, and have also allowed
    ‘superposition to sneak through’, mitigating benefits
* target weight sparsity directly during training, including approaches such as
  * `L_0` regularization (Louizos+ 2018) or
  * pruning (Mozer & Smolensky, 1988; Frankle & Carbin, 2019; Mocanu+ 2018)
* Han+ (2015) achieve sparse weights by using
  magnitude pruning followed by finetuning. General strategy:
* finetuning with interpretability in mind (also used by Tamkin+ (2025)),
  avoiding the potentially excessive cost of training from scratch
* modularity (Kirsch+ 2018; Andreas+ 2016)
  * brain-inspired modular training (Liu+ 2023) trains for modularity
    by embedding neurons in a geometric space and
    encouraging geometrically local connections
* simplify linearity-reliant circuit analysis (Elhage+ 2021) eg
  * removing the layer norm operations (Heimersheim, 2024),
    using input-switched affine transformations for recurrence (Foerster+ 2017)
* architectures that are mathematically analyzable in other ways than linearity,
  such bilinear activations in MLPs (Sharkey, 2023; Pearce+ 2024)

### 2.1.3 Reverse engineering step 2: Describing the functional role of compons

* description of components to formulate hypotheses about
  their functional roles and interactions
* methods: max-activating dataset examples, attribution methods,
  feature synthesis, or causal intervention
* should not be taken to be definitive conclusions before they are thr validated
* Descrip of the functional role of neural network components can either (Fig 6)
  * the cause of a component’s activation or
  * what occurs after that component has been activated, or –
  * preferably both
* Figure 6: To study the functional role of the blue component numerous
  * causes: the purple input components or the red intermediate components
    * via eg feature synthesis (Olah+ 2017a; 2020b),
    * maximum activating examples (Olah+ 2017a; Bricken, 2023), or
    * attributions (Sundararajan+ 2017). Or we could study
  * effects: the orange output components or the green intermediate ones
    * via eg the logit lens (Nostalgebraist, 2020),
    * activation steering (Turner+ 2024), or
    * attributions (Marks+ 2024)

#### Explanations for what causes components to activate

* three broad categories of methods, each with several problems:
  * Highly activating data set examples;
  * Attribution methods; and
  * Feature synthesis

##### Highly activating data set examples. The simplest method

* highly activating data set examples aka ‘exemplar reprs’ (Hernandez+ 2022))
* analyzing apparent commonalities in the inputs suggests hypotheses
* may be carried out by humans or AI systems (Section 2.4)
* issues
  1. relies on human prior beliefs, which may lead interpreters to project their
     human understanding onto models that may be using unfamiliar concepts
    * may identify concepts in the model that do not truly explain the funcality
      (Freiesleben & König, 2023; Donnelly & Roegiest, 2019; Gale+ 2020)
  2. ‘interpretability illusions’ (Bolukbasi+ 2021)
    * bias in data sets can create misleading explanations
    * even with real data sets, as opposed to synthetically created data
    * human annotators identified dramatically different meanings for given
      directions in the activation space of BERT (Devlin, 2018)
  3. often yields plausible explanations for arbitrarily chosen directions in
     the activation space (Szegedy+ 2014)
* it is possible to develop adversarial models that deliberately yield
  misleading feature visualizations (Geirhos+ 2025)
  * Robert Geirhos, Roland S. Zimmermann, Blair Bilodeau, Wieland Brendel, B Kim
    Don’t trust your eyes: on the (un)reliability of feature visualizations
    ICML’24. JMLR.org, 2025
* corr vs cau
  * highly activating data set examples stem from the fact that they merely
    provide correlational explanations for the activation of a netw compon,
    rather than causal explanations
* To identify causal explanations, other methods, eg attribution methods, necess

##### Attribution methods are necessary for causal explanations but are often
difficult to interpret

* Attribution methods
  (Baehrens+ 2009; Simonyan+ 2014a; Nguyen+ 2016b; Selvaraju+ 2019;
  Sundararajan+ 2017; Fong & Vedaldi 2017; Lundberg & Lee 2017; Ribeiro+ 2016)
  * intended to measure the causal importance of upstream variables (eg inputs)
    on downstream variables (such as a network component)
* methods include
  * Grad-CAM (Selvaraju+ 2019) and
  * Integrated Gradients (Sundararajan+ 2017), as well as
  * perturbation or model-agnostic approaches such as
    * LIME (Ribeiro+ 2016) and SHAP (Lundberg & Lee, 2017)
* categorized as
  * gradient-based (Mozer & Smolensky, 1988; Baehrens+ 2009; Simonyan+ 2014a;
    Nguyen+ 2016b; Selvaraju+ 2019; Sundararajan+ 2017; Wang+ 2024d) or
  * sampling-, perturbation-, or ablation-based
    (Fong & Vedaldi, 2017; Vig+ 2020; Geiger+ 2020; Ghorbani & Zou, 2020;
    Meng+ 2022b; Chan+ 2022a; Nanda, 2023a)
* hE grad
  * on a theoretical level, many gradient-based methods identify only a
    first-order approximation of the ideal attribution
  * sometimes a poor approximation (Watson, 2022)
  * Most approaches only attribute important single components
* nL feature interaction
  * integrated Hessians attribute important feature interaction (Janizek+ 2020)
  * KernelSHAP-IQ
    characterizes higher-order Shapley Interaction Index
    as a solution to a weighted least square problem, offering
    one way to quantify such interactions (Fumagalli+ 2024)
  * for Graph Neural Networks (GNNs)
    GraphSHAP-IQ by Muschalik+ (2025) enable the
    exact and efficient computation of any-order Shapley Interactions
* BiLRP: feature interactions in text sim models (Vasileiou & Eberle, 2024)
* Adebayo+ (2018): some gradient-based methods identify attributions that are
  independent both of the model and of the data generating process
* an adversary can train a model or perturb an input to reveal any attribution
  map (Dombrowski+ 2019; Ghorbani+ 2019; Heo+ 2019; Kindermans+ 2019; Slack+
  2020; Zhang+ 2020)
  * nL Freiesleben & König (2023):
    adversarial examples do not truly undermine saliency maps as
    these are highly dissimilar to real interpretability challenges
* For specific architectures like Graph Neural Networks (GNNs), methods such as
  GNN-LRP have been developed to provide higher-order explanations by
  identifying relevant walks in the input graph
  using Layer-wise Relevance Propagation (Schnake+ 2022)
* Perturbation methods present certain issues, such as
  * taking models off their training distribution and eliciting unusual behavior
  * theoretical complications (Feng+ 2018; Molnar+ 2021; Hooker+ 2021;
    Molnar+ 2024; Freiesleben & König, 2023; Slack+ 2021)

##### Feature synthesis

* combines highly activating data set examples and gradient-based attribution
  (Erhan+ 2009; Szegedy+ 2014; Olah+ 2017a)
* synthesize inputs that maximize the activation of a component
  subject to some regularization, such as
  * consistency with a generative model (Nguyen+ 2016a; 2017) or
  * total variation distance (Mahendran & Vedaldi, 2014)
* criticisms of feature synthesis methods suggest that
  * natural dataset examples may serve interpretation better
    (Zimmermann+ 2021; Borowski+ 2021) or show that
  * current methods struggle to identify trojans (Casper+ 2023a)

#### Explanations for the downstream effects of components

##### Studying the direct effect

* logit lens (Nostalgebraist, 2020)
  applies the models unembedding matrix to an intermediate residual stream repr,
  converting it into a distribution over the model’s output vocabulary
* Direct logit attribution is a generalization of this technique, applying to
  any appropriately sized vector space in the model, eg
  * the output of MLP layers (Geva+ 2021; 2022b;a; Dar+ 2023)
  * attention blocks
  * gradients (Katz+ 2024) of these
  * and SDL decoder weights (Bricken 2023)
* tuned lens: Adding a trainable affine or linear trafo before unembedding
  * improves decoding accuracy (Belrose+ 2023a; Yom Din+ 2024)
  * hE less faithfully representing when the model has completed computation
* In the language of causality (Pearl, 2009),
  unembedding a residual stream vector
  measures the direct effect of that vector on the output (McGrath+ 2023)
* hE, the logit lens cannot measure the indirect effect, ie
  * indir = the effects resulting from the influence
    that the embedding has on the hidden activations of subsequent layers
  * causal interventions (see below), are necessary to measure them
* future: extend logit-lens-like approaches to
  project the effects of network components on not only/but also
  * directions in output vocabulary space
  * intermediate downstream components

##### Causal Interventions

* substitute (“patch”)
  the value of some network component, usually an activation vector,
  with a different value
  during a forward pass,
  observing the resulting effect on the model
* a related set of techniques:
  * ablation (for the special case of zero-ing or otherwise attempting to delete
    activations entirely),
  * activation patching,
  * causal mediation analysis, causal tracing, and interchange intervention
    (Vig+ 2020; Geiger+ 2020; Meng+ 2022a; Chan+ 2022a; Nanda, 2023a)
  * eg by patching activations from the corrupt prompt “the capital of Italy is”
    into the clean prompt “the capital of France is”, we can
    observe the effect on the output (“Rome” vs “Paris”). This
    * tells us which component values are relevant for
      the differing output between the two prompts, but
      not for the information that remains consistent (eg the answer is a city)
* patch patching: More surgical patches made on edges between network components
  * isolate the effect of one particular component **on only one other compon,**
    instead of on the entire rest of the network (Goldowsky-Dill+ 2023)
* Causal scrubbing (Chan+ 2022a) is a generalization of path patching that
  allows for testing hypoths concerning any connection between a set of compons
* generate supervision signal to identify subspaces of interest
  * distributed alignment search (Geiger+ 2024c) learns
    a linear subspace that represents a particular concept,
    using data with interventions on that concept as supervision
    (Geiger+ 2024c; Guerner+ 2024; Wu+ 2023)
* masks over network components to remove irrelevant components
  (De Cao+ 2020; Csordás+ 2021; Davies+ 2023)
* A causal intervention typically requires a forward pass of the model
  * may make performing one for every network component in large models, long
    contexts, or when using finer-grained components such as sparse autoencoder
    latents prohibitively expensive
  * Faster alternatives that work well in practice (Marks+ 24; Templeton+ 24)
    * gradient-based approximations to activation patching
    * eg attribution patching (Nanda, 2023a; Syed+ 2024),
    * `AtP*` (Kramár+ 2024),
    * integrated gradients (Sundararajan+ 2017)

##### Observing the effects of components on sequential behavior

* patch in activated components and observe their effect on model behavior
* Steering is one example of this (Rimsky+ 2024; Turner+ 2024), where
  * components (activation vectors) are activated
    in order to influence the network’s behavior, often in interpretable ways
* patchscopes
  * have a language model itself decode the activations,
    to determine the functional role of an activation vector
    (Chen+ 25; Watkins, 23; Ghandeharioun+ 24; Huang+ 24b; Kharlapenko+ 24)
  * patch activations from one forward pass of a model
    into a different forward pass (perhaps in a different model)
  * The context of the new forward pass is designed to elicit relevant info
    from the activations of the original forward pass
* A related sequential behavior based technique is simply to read the
  chain-of-thought (Wei+ 2024; Kojima+ 2024) produced by an LMs
  * an ‘interprt technique’ in the sense that it aims to explain model decisions
  * not use model internals in those explanations, at least not directly
  * not entirely faithful to the model’s underlying decision-making process
    (Agarwal+ 24; Atanasova+ 23; Turpin+ 23; Lanham+ 23; Ye & Durrett 22)
* future
  * incorporate model internals into chain-of-thought training, which could
    incentivize faithfulness
  * building monitors based on model internals
    to improve transparency in chain-of-thought faithfulness

### 2.1.4 Reverse engineering step 3: Validation of descriptions

* validation of the descriptions to test the correctness of the hypotheses,
  * testing descriptions’ predictions, attempting to
  * use the descriptions for downstream tasks, or use of
  * benchmarks

* Conflating hypotheses with conclusions has regrettably been commonplace in MI
  * validation has to improve (Madsen+ 2024; Stander+ 2025)
  * often hard to distinguish faithful explanations of NN components from plausb
  * interpretability illusions: many model interpretations fail sanity checks
    (Adebayo+ 2018; Leavitt & Morcos, 2020; Miller+ 2024)
    * seemingly convincing interpretations of a model later turned out to
    be false (Bolukbasi+ 2021; Makelov+ 2023)
* different approaches to explaining the same phenomenon yielded diff interpret
  (eg Chan+ (2022b) or Chughtai+ (2023) vs Stander+ (2025) vs Wu+ (2024a))
* other instances were cited in Section 2.1.3

#### Validating a hypothesis involves posing: Does it predict behavior well?

* Testing the hypothesis often requires multiple approaches (Mueller+ 2024)
* To validate descriptions, many approaches
  * simply apply a different description method (Section 2.1.3)
  * or:

#### Predicting activations and counterfactuals:

* using natural language explanations of a given network component’s function,
* predict the component’s activation levels on different inputs
* by humans or by AI systems (Section 2.4),
  as in (Hernandez+ 2022; Bills+ 2023; Shaham+ 2025; Juang+ 2024)
* predict counterfactual scenarios in neural networks
  * eg ablate or activate particular network components, we should be able to
    predict specific downstream effects on other components

#### Predicting and explaining unusual failures or adversarial examples

* eg Hilton+ (2020) validated their methods by explaining
  * cases where a deep reinforcement learning agent’s neural network
    failed to achieve maximum reward and also explained
  * specific hallucinations exhibited by the network
* use an interpretability approach to handcraft an adversarial input
  (Carter+ 2019; Casper+ 2023c; Mu & Andreas, 2020; Hernandez+ 2022)

#### Handcrafting a network that reconstructs a network behavior

* build replacement parts for the original network
* Cammarata+ (2020): interpretation of a curve detector’s function
  validated in a convolutional neural network
  by substituting the parts with simple handcrafted replacements

#### Testing on ground truth:

* If the weights of a toy neural network were handcrafted by humans,
  it is possible to obtain a ground truth explanation for how it works
* eg Conmy+ (2023) running [the attrib tool] on a simple model that implemented
  a known algorithm.  (See also Section 2.1.4)

#### Using the hypothesis to achieve particular engineering goals

* assess hypot's utility in downstream applications
  (Doshi-Velez & Kim, 2017; Casper+ 2023a)
* Templeton+ (2024) discussed examples where
  manually editing an LLM based on an interpretation
  led to predictable high-level changes in its behavior
* Marks+ (2024) showed how an interpretability tool could assist humans with
  debugging a classifier in a toy task
* Farrell+ (2024) use unlearning (Section 3.2.2) to demonstrate that
  learned SDL latents
  * don’t quite match human concepts, and
    might not be optimal for particular downstream use cases

#### Using the hypothesis to achieve specific engineering goals competitively:

* evaluations using non-cherry-picked tasks remains relatively uncommon
* attempts not consistently useful (Adebayo+ 2020; Denain & Steinhardt, 2023;
  Casper+ 2022b; Hase+ 2023; Durmus+ 2024)
* use interpretabilit methods to achieve things that would be hard or impossible
  without them (Schut+ 2023)
* otherwise bias toward developing methods that only perform well
  in best-case scenarios and on simple tasks, rather than those that can handle
  worst-case scenarios and practical challenges
* high costs in terms of time and cognitive labor
---
two potential solutions that could simplify the validation process:

#### ‘Model organisms’ facilitate hypothesis validation

* interpretability is often approached through the perspective of the nat scis
  (Olah+ 2020b)
  * in eg genomics and neuroscience, it is common to investigate a few
    extensively studied species known as ‘model organisms’ or ’model systems’
  * in-depth studies on a select group of organisms, like
  * eg E. coli, fruit flies, mice, and macaque monkeys
  * leverage the insights and tools gained from those organisms and
    apply them to other species
  * specific types of neural activity in mice is more tractable due to
    existing hypotheses about which proteins should be fluorescently labeled
    in order to identify specific types of neurons
  * allows for cross-checking results with previous work, stronger
* lack of consensus on which networks should serve as model organisms
  * open source, easy and cheap to use,
  * representative of a broad range of systems and phenomena
  * replicable training process with open source training data
  * multiple instances with different random seeds, among other criteria
    (Sharkey+ 2022a)
  * Thus far, researchers have mostly used model organisms that possess only
    some of these criteria, eg
    * transformer than can perform modular addition (Nanda+ 2023a) or
    * GPT-2 (Radford+ 2018)
* support cross-validation of hypotheses, but also
* facilitate the progressive construction of experimental infrastructure by
  providing a reliable foundation for experiment design
  * simplifies the process of rigorous hypothesis testing, thus helping prevent
    oversimplification and ‘interpretability illusions’
* Studying solely model organisms risks
  merely making true statements about neural network structure,
  rather than generating insights that are of immediate practical benefit
  * both scientific and engineering wins should be pursued in parallel
* choices made while studying model organisms
  risk steering the field in suboptimal directions
  * eg often motivated by the engineering goal of understanding
  * understand SOTA models thoroughly enough to make assurances of their safety
    (Bereska & Gavves, 2024; Tegmark & Omohundro, 2023; Dalrymple+ 2024)
  * other
    * studying small toy models (eg Nanda+ (2023a)) or how
    * larger models accomplish select subtasks (Arditi+ 2024),
    * risk: meths fail to generalize to more safety-relevant real-world settings

#### Validating interpretability methods using benchmarks

* Beyond validating individual hypotheses, we may wish to
  validate entire interpretability methods
* Benchmarking is a proven approach to making incremental improvements in ML
* several approaches to benchmarking interpretability methods developed recently
* desideratum: evaluate interpretations against ground truth explanations
  (Freiesleben & König, 2023; Zhou+ 2022)
  * using models with known ground truth explanations
  * can be created by compiling simple programs into weights of models that
    exactly implement the known program
    (Lindner+ 2023; Weiss+ 2021; Thurnherr & Scheurer, 2024; Gupta+ 2024)
  * predetermined explanations can be enforced at training time in conventional
    models using Interchange Intervention Training (Gupta+ 2024; Geiger+ 2022)
* evaluate specific steps in the interpretability pipelines
  * eg model decomposition (Huang+ 2024a; Makelov+ 2024),
  * generating descriptions of network component functions (Schwettmann+ 2023),
  * testing natural language explanations (Huang+ 2023)
* tests for multiple facets of the interpretability pipeline in order to test
  explanation faithfulness, but
  may require further adaptation to the context of mechanistic explanations
  (Hedström+ 2023)
* reverse engineering is an ambitious goal, especially for very large NNs
  * It may be the case that the field fails ultimately to make progress toward
    complete reverse engineering because of the fundamental difficulty of
    understanding such large, complex systems
  * the components that result may be either too complex or numerous
    to make ready use of them
* explain the learning progress
  * computational neuroscientists aim to study the learning process of a neural
    system, rather than the mechanisms that result (Lillicrap & Kording, 2019)

## 2.2 Concept-based interpretability: Identifying components for given roles

* the second approach, referred to as ‘concept-based interpretability’,
  * proposes a set of (human-derived) concepts that might be used by the network
  * looks for components that appear to correspond to those concepts
  * ie “identifies network components for given roles”
* variants have been developed to overcome issues
  * issue 1: carefully chosen data for well-defined concepts (Sec 2.2.2)
  * issue 2: simple variants of the method only detect correlational, rather
    than causal variables (Section 2.2.3)
* Related methods build human concepts into the training of models ~> they are
  more interpretable by default (Section 2.2.4)

### 2.2.1 Concept-based probes

* ‘probe’ (Köhn, 2015; Gupta+ 2015; Alain & Bengio, 2017; Ettinger+ 2016)
* A concept-based probe is a classifier trained to predict a concept
  from the hidden representation of another model (Hupkes & Zuidema, 2018)
  * typically human concepts of special interest
  * a labeling function that assigns classification labels to input data,
    indicating the ‘value’ of the concept on that data
    * spec: A binary value indicating the presence or absence
  * a probe, which is a simple parameterized model, is
    trained to predict concept labels based on hidden activations
  * If the probe is a linear model, then we have localized the concept
    as a vector in latent space
* domain
  * first introduced in NLP (Köhn, 2015; Gupta+ 2015)
  * extensively explored in NLP (Conneau+ 2018; Tenney+ 2019; Rogers+ 2020;
    Gurnee+ 2023; Peters+ 2018; Burns+ 2023; Marks & Tegmark, 2024)
  * vision (Alain & Bengio, 2017; Kim+ 2018b) and
  * deep reinforcement learning (McGrath+ 2022; Forde+ 2023)
* includes
  * concept activation vectors (Kim+ 2018a),
  * information-theoretic probing (Voita & Titov, 2020), and
  * structural probing (Hewitt & Manning, 2019)
* relatively simple to implement, probing has
  * two main challenges (Ravichander+ 2021; Belinkov, 2022b)
  * The need for carefully chosen data for well-defined concepts, and
  * probes detect correlations instead of causal variables in hidden activations

### 2.2.2 Probes need carefully chosen data for well-defined concepts

* it is only possible to identify concepts that we have defined precisely enough
  to create high-quality data
* can only identify concepts that we were already looking for,
  rather than reveal unexpected features in the network
* Contrast-Consistent Search (CCS), probes not for single concepts but
  * probes for an axis in activation space that
    corresponds to positive or negative propositions by enforcing
    probabilistic consistency conditions
    (Burns+ 2023)
  * more unsupervised than standard concept-based probing
  * still requires the construction of data sets with clear positive and neg
* future: methods that automatically develop data sets
  for probing and concept localization (Shaham+ 2025) (Section 2.4)

### 2.2.3 Probes detect corr, rather than causal variables, in hidden activats

* from an information-theoretic point of view,
  an arbitrarily powerful probe measures the mutual information between a hidden
  representation and a concept (Hewitt & Liang, 2019; Pimentel+ 2020)
* not necessarily imply that those activations causally mediate how that concept
  is used by the network, or even if the network uses the concept at all
  (Ravichander+ 2021; Geiger+ 2024b; Elazar+ 2021; Belinkov, 2022b)
* Probes can be successfully trained on hidden activations that lack any causal
  connection to the output, only localizing correlated hidden activation
* should be used only to generate hypotheses about which network components
  might be causally linked to a concept
  * Confirming such hypotheses requires further investigation
    using causal interventions or other probing methods
* with counterfactual data, intervening on the concept of interest
  * eg observing the output if the dog in an image was changed to a cat
    (Elazar+ 2021; Mueller, 2024; Geiger+ 2024b)
* Methods include
  * distributed alignment search (Geiger+ 2024c; Wu+ 2023; Huang+ 2024a)
  * causal probing (Guerner+ 2024)
  * using attribution methods to measure the effect of concept vectors
    on network predictions (Kim+ 2018b)
  * concept erasure methods
    (Ravfogel+ 2020; 2022; Elazar+ 2021; Belrose+ 2023b;b)
* these methods can identify causal mediators of concepts in hidden reprs
  * hE require more specialized data than probes do
* it might be acceptable for probes to identify merely correlated hidden activs
  if the correlations generalize to the test distribution
  * hE risk of discovering correlated features
  * spurious correlations due to the high dimensionality of hidden activations
* Validating probes is therefore essential to avoid overfitting
  * evaluating them on out-of-distribution test data
    that varies along task-specific dimensions
    to ensure that general purpose features have been found
* ? how to use regularization to achieve good probe generalization

### 2.2.4 Concept-based intrinsic interpretability

* leverage the concepts in the network training process itself, such as in the
* eg concept bottleneck models (Koh+ 2020). This is beneficial as
  * it is more likely that the components to which concepts are assigned are
  causally relevant. Instead of specific concepts,
* networks can also be trained to use particular causal structures (Geiger+
  2022). While
* it may not be possible to prespecify all relevant concepts or structures,
  integrating this approach with methods for disentangling concepts
  could prove
  useful (Chen+ 2018).
* Cloud+ (2024) incentivize modularity via applying data-dependent, weighted
  masks to gradients during backpropagation.

## 2.3 Proceduralz mech interpret into circuit discovery pipelines: A case study

* To form a complete pipeline by combining various methods,
  several methodological choices regarding decomp, description, and validation,
* Circuit discovery has emerged as a prominent pipeline in recent MI research
  (Wang+ 2023; Hanna+ 2023; Heimersheim & Janiak, Its objective is to
  * describe how a neural network performs a task of interest
    while making specific choices for network decomposition, component
    description, and hypothesis validation. In this section, we look at
* this sec: the typical choices in each step in greater depth and discuss how
* The ‘circuit discovery’ pipeline takes the following steps:
  1. Task Definition. For a given model we want to study, we
    * select a task that the model can perform, and
      a dataset on which the network performs that task. This is
    * a concept-based step, since the definition of the task was based on how
  2. Decomposition. During the decomposition step, it is common to
    * think of the neural network as a directed acyclic graph (DAG), where
    * activations are represented by nodes and
      the “abstract weights” between them represented by edges.
    * Most work thus far has selected architectural components (Section 2.1.2),
    * eg attention heads and MLP layers, to be the nodes. However, more recent
    * SDL latents for nodes (Marks+ 2024)
  3. An initial description step:
    * Identify task-relevant vs. -irrelevant subgraphs. The circuit discovery
    * task-relevant nodes and edges. Typically,
    * causal interventions are used, drawing
      samples from some “clean” and “counterfactual” data sets. Circuit
    * iterative activation patching (Wang+ 2023; Chan+ 2022a; Lieberum+ 2023) or
      integrated gradients (Marks+ 2024).
  4. An iterative description-validation loop. After obtaining
    * in a task-relevant subgraph, the next step involves
      describing the function of each node or edge individually. This step is
    * less formulaic than previous steps:  Researchers rely on their intuition,
    * create testable hypotheses for the function of a component or edge of
    * design custom experiments to validate or invalidate their hypothesis. Only
    * several iterations of hypothesis testing through experimentation are
    * In research papers, this loop is rarely made explicit, as
      only the final description is presented. However,
    * nL Chan+ (2022b) detail this process for understanding the induction task,
    * Nanda (2023b) provides another description of such a loop
      (building on work by Li+ (2023))
  5. Final Validation. Circuits are commonly
    * evaluated based on three attributes (Wang+ 2023):
      * faithfulness, which refers to
        how closely the circuit approximates the entire network’s behavior,
      * minimality, which assesses if nodes in the subgraph are unnecessary, and
      * completeness: whether any nodes not included in the subgraph are important
        for task behavior.
    * Additional ad hoc validation methodologies also exist. For example,
    * Wang+ (2023) generate adversarial examples for their task based on their
    * Shi+ (2024) devise a suite of
      formal statistical hypothesis tests for circuit efficacy.  This circuit
* has yielded valuable insight, but falls short using current methods. The
* issues:

### Task definition is concept-based.  Defining circuits has thus far been with

* Miller+ (2024) demonstrate that the within-task variance of model performance
  across the distribution of data points in a task is large, implying that
  ie the circuit provides a good approximation of the average case performance
  on the dataset, but a
  hE poor one for any individual data point.
  ie the process of first selecting a task and then studying how the model
  performs it may not be an effective approach to achieve “reverse engineering”
  -style interpretability. This approach may also create spurious correlations,
  an issue shared with concept-based probing (Section 2.2.1). Thus, it might be
  worth learning the task decomposition instead (Haani+ 2024).

### Network decomposition methods are flawed. Perhaps most importantly,

* prior circuit discovery work has attempted to decompose models in either
  * architectural bases (Wang+ 2023; Conmy+ 2023) or
  * sparse autoencoder latents (Marks+ 2024; Huben+ 2024), which are
  * both imperfect ways to decompose neural networks for MI (Section 2.1.2).
* Future work could locate circuits in improved decompositions
  or simultaneously learn both network decompositions and circuits.

### Circuit faithfulness is low. Simple early unfaithful (Chan+ 2022b; 2023).

* Miller+ (2024) show that existing measures of faithfulness
  * depend on the causal intervention implementation used, and further
  * misleading when applied to several complex end-to-end circuits.
* Makelov+ (2023) argue that
  subspace activation patching via distributed alignment search
  may lead to interpretability illusion mechanisms, although
  * these findings are contested by Wu+ (2024c).

### Scalable methods are only approximate.

* Identifying relevant components through individual interventions is costly
  when there are many components.
* Attribution patching Syed+ (2024) was designed to identify potential relevant
  candidates for further testing through intervention, which 
  becomes more important as the number of components expands significantly
  through sparse dictionary learning (Marks+ 2024). However, 
* hE attribution patching uses gradients, which only yield a first-order
  approximation of the effect of ablating components (Wu+ 2024c; Molchanov+
  2017), leaving it 
  * unclear whether this method and any improvements on it (Kramár+ 2024)
    produce adequate approximations.

### Circuit discovery algorithms struggle with backup and negative behavior.

* “backup” and “negative” behavior (Wang+ 2023; McGrath+ 2023; McDougall+ 2024),
  * Thomas McGrath, Matthew Rahtz, Janos Kramar, Vladimir Mikulik, Shane Legg.
    The hydra effect: Emergent self-repair in language model computations, 
    arxiv.org/abs/2307.15771.
  * Callum Stuart McDougall, Arthur Conmy, Cody Rushing, Thomas McGrath, N Nanda
    Copy suppression: Comprehensiv understanding a motif in LM attention heads
    BlackboxNLP 2024. openreview.net/forum?id=5Hd6813x3U.
* these actively suppress task performance and are thus 
  not captured by maximizing task performance metrics
* they remain important factors to consider
* Mueller (2024) provides further discussion of these issues.

### ‘Streetlight’ Interpretability: 

* Interpretability that focuses on models or behaviors that seem easier to
  interpret than average can be termed ‘streetlight interpretabil’ (Wang+ 2023)
* gives a misleading impression of the level of difficulty involved in
* study arbitrary circuits: less successful (Nanda+ 2023b).
* automating the overall pipeline will become more feasible. However, 
  * some individual steps in mechanistic interpretability can already be
    fruitfully automated, as discussed in the next section (Section 2.4).

## 2.4 Automating steps in mech interpret research 7

* We will explore 
  * previous cases where manual tasks in MI have been successfully automated and
  * open problems in further automation.

### Automating feature description and validation. A task that is amenable to

* ‘describing the functional role of model components’ (Section 2.1.3). 
* LMs generated descriptions of the functional role of 
  * neurons in image models (Hernandez+ 2022), 
  * neurons in language models (Bills+ 2023), and 
  * sparse autoencoder latents in language models (Huben+ 2024; Bricken, 2023;
    Juang+ 2024) using highly activating data set examples.
* validated by assessing how effectively a human or model can use them to pred
  * the activation of a feature in a given data set example, or predict 
  * where a feature is active within a single image or text excerpt. 
* The success of these predictions can be used as a quantitative measurement of
  ‘interpretability’.
This was previously used to measure progress toward a decomposition method that
carves networks at the joints of their generalization structure, assuming that
such a decomposition would be maximally interpretable (Section 2.1.2). While
imperfect, these methods for interpretation hypothesis generation and validation
* future
  * synth input
    * methos might be improved by automating the generation of inputs 
      to test the interpretation hypotheses by ensuring that generations activate
      the interpreted feature (Huang+ 2023), or defining 
  * more rigorous statistical tests (Bloom & Lin, 2024b). Automatic component
  * descriptions of feature effects, relationships between features (Bussman+
    2024), or how components interact during runtime produce behavior.

### Automating circuit discovery (ACDC) pipelines. An approach (Conmy+ 2023)

* works since improved upon and accelerated this process (Syed+ 2024; Kramár+
  2024; Marks+ 2024). Note that ACDC-like approaches in general assist in
  * ACDC don't describ the functional role of subgraph components.
* fully automating current pipelines would not yield satisfactory explanations
  * an attempt using leading decomposition and description meths: Marks+ (2024)


# 3 Applications of mech interpret

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
    without human intervention
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
    understanding of the domains in which they have learned to perform so well
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
  * deeper insights in and across more domains will become possible
* hE the majority of scientists are unable to access microscope AI due to the
  * mic AI needs specialized expertise in machine learning, interpretability,
    and domain knowledge to recognize significant new patterns, a combination of
    skills that is rare in many fields. This
  * may change as interpretb research becomes more widely adopted in the scis,
    and as interpretability becomes increasingly automated and accessible

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
  could aid users in creating biological weapons (Li+ 2024b)
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
  * protecting copyright law
* An understanding of model internals can help AI labs assess the risks from
  frontier models (Chang+ 24; Shevlane+ 23; Casper+ 24) ~> better fulfill their
  obligations under the EU AI Act to “perform model evaluation ...  with a view
  to identifying and mitigating systemic risk” (Council of the European Union,
  2024)
  * MI could help evaluators elicit dangerous capabilities via improved
    finetuning (United Kingdom AI Safety Institute, 2024)
    * guide their adversarial red-team attempts (Tong+ 2024a), and
    * ensure that AI systems are not intentionally underperforming evaluations
      (van der Weij+ 2024)
* Advancements in mechanistic interpretability could also assist in anticipating
  when or if AI models will obtain specific dangerous capabilities
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
  * Evan Hubinger, Chris van Merwijk, Vladimir Mikulik, J Skalse, S Garrabrant
    Risks from learned optimization in Advanced Machine Learning Systems, 2021
    arxiv.org/abs/1906.01820
  * when a learned machine learning model acts as an optimizer itself during
    inference, pursuing an internal objective ("mesa-objective") that differs
    from the outer training loss function ("base objective")
  * inner alignment concerns (Carlsmith, 2023)
* It would also give additional time for
  * companies to prepare adequate risk mitigation measures, (OpenAI, 2023), and
  * governments to establish appropriate guidance or regul (UK Government, 2022)
* The EU AI Act mandates that developers of General Purpose AI models with
  systemic risk have obligations to report incidents involving their system to
  the AI office
  * Interpretability tools have the potential to continuously monitor AI
    inference and detect incidents that require report
  * unlike eg nuclear security, AI systems allow us to log all inputs and system
    states, even those that may lead to catast harm
  * Access to a small number of such data points may greatly improve our ability
    to mitigate similar future failures (Greenblatt & Shlegeris, 2024)
  * investigate the critical “features” of the input that led to the incident
    * could improve our ability to further red-team the system (Section 3.3) and
      generate more similar data points that could result in similar incidents
    * This, in turn, may help us reduce the likelihood of future incidents
      (Chan+ 2024)
    * The incident could be utilized more directly in the construction of
      test-time monitors to detect similar future incidents (Roger 2023)
* MI could be used to
  * verify companies’ compliance with domestic regulation (O’Brien+ 2023a), or
    to
  * authenticate states’ compliance with future international treaties regarding
    the use of AI (Aarne+ 2024)
* MI could make decision rationales for AI model outputs more easily obtainable
  * aid in enforcing citizens’ rights under the EU General Data Protection Regu“
    to obtain an explanation of the decision reached” by a system
    (GDP, 2016; Gilpin+ 2019)
* copyright
  * Model editing tools could also resolve problems regarding the copyright
    status of existing generative models (Grynbaum & Mac, 2023)
  * According to the US Copyright Act (United States Congress), for any
    copyrighted work, an artifact “from which the work can be perceived,
    reproduced, or otherwise communicated ... with the aid of a machine or
    device” is considered a copy of the work (Lee+ 2024)
  * MI could help detect and remove memorized works that can be reproduced
    verbatim by generative models

## 4.2 Social and philosophical problems in mech interpret 34

* social and philosophical considerations, which require rigorous inquiry
* The ability to interpret advanced AI systems holds immense potential to
  advance the science of AI and increase our ability to control it (Critch &
  Krueger, 2020; Tegmark & Omohundro, 2023; Dalrymple+ 2024). In this paper, we
  provide an overview of various interpretability tools that offer novel
  insights
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
    happening inside black-box models
  * The intrinsic validity of this paradigm deserves philosophical inquiry
  * from an engineer’s perspective, pursuing “understanding” without a practical
    downstream application misses an engineer’s objective. Proponents of this
  * quantifiable benchmarks linked to concrete practical goals are accurate
    measures of the success of interpretability. This motivation is concrete and
  * hE some have criticized interpretability research as artificially limiting
    the solution space to engineering problems
* When MI tools are studied with motivations such as fairness or safety,
  * Krishnan (2020): addressing [fairness or safety] need not involve interpret
  * the focus on interpretability artificially constrains the solution space by
    characterizing one possible solution as the problem itself.” Thus, some
  * interpretability research has failed to produce competitive techniques
    (Rauker+ 2023; Casper+ 2022b), omitted non-interpretability baselines
    (Rudin, 2019; Krishnan, 2020), and graded interpretability tools on their
    own curve (Doshi-Velez & Kim, 2017; Miller, 2019; Rauker+ 2023)
  * ! assess the usefulness of interpretability against alternative methods
  * misrepresenting these comparisons can lead to false assumptions (Lipton &
    Steinhardt, 2019; Leech+ 2024)
  * particularly problematic when it impacts the efforts of critical safety work
* nL it is not always imperative for MI to strictly outperform uninterpretable
  baselines: It may still be helpful to develop
  * methods that offer interpretability-based advantages, along with the
    benefits of
  * more competitive uninterpretable methods (eg Rimsky+ (2024))
* interpretability-based methods do not currently outperform black-box
  baselines,
  * nL if they perform in a similar ballpark, further progress in MI could soon
    lead to better methods, especially in problems which we believe might
    disproportionately benefit from improved mechanistic understanding (Section
    3)
* models are often studied in a vacuum: Smart & Kasirzadeh (2024) emphasize that
  the usefulness or correctness of model interpretations can depend on the
  broader context of the model’s development or deployment. For example, it may
  * eg hard to identify representations of fairness within models, since
  * under different definitions of fairness
* interpret community must exercise caution in their communication to minimize
  potential abuses of the results of its work
  * selective transparency can be used to actively mislead (Ananny & Crawford,
    2018). Furthermore,
  * interpretability is at risk of being used for corporate interests at the
    potential expense of safety. The field of
  * AI interpretabl is highly influenced by research teams in the private sector
    * industry resources and research contributions have significantly advanced
      interpretability research. On the other hand,
    * hE compared to academia, corporations publish selectively, often have
      financial conflicts of interest, and may provide limited transparency
* the recent definite — but ultimately modest — progress in MI has been used to
  lobby against specific AI regulation by falsely claiming that, “Although
  advocates for AI safety guidelines often allude to the ‘black box’ nature of
  AI models, where the logic behind their conclusions is not transparent, recent
  advancements in the AI sector have resolved this issue, thereby ensuring the
  integrity of open-source code models.” (A Horowitz Acad, 2023)

# 5 Conclusion

* Current methods like sparse dictionary learning, while promising, face both
  * practical limitations in scaling to larger models and
  * deeper conceptual challenges regarding their underlying assumptions
* must: moving beyond correlation-based descriptions to capture causal mechs
* need: better techniques to understand how mechanisms evolve during training
  * how they interact to produce complex behaviors
* Improved interpretability methods could enable
  * more effective monitoring of potential risks,
    better control over model behavior, and
    more accurate predictions of capabilities
* For AI capabilities, mechanistic understanding could lead to
  more efficient architectures,
  better training procedures, and
  more targeted ways to enhance model performance
* In various scientific domains, microscope AI approaches could help
  extract valuable insights from model internals
* must ensure a focus on generating insights that have real-world utility. This
  * establishing better benchmarks
* comparing interpretability-based approaches to non-interpretability baselines
* fastest progress will likely come from the field
  pursuing both scientific and engineering goals simultaneously, rather than one
* The practical impact of progress in mechanistic interpretability extends
  * technical achievements
  * governance and oversight. They could help
    * verify compliance with safety standards, detect potential risks before
      deployment, and provide clearer attribution of model decisions. However,
  * hE risks of potential misuse and of giving false assurance about AI safety
