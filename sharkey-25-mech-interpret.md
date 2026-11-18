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

* The first approach, often called ‘reverse engineering’, is to decompose the
  network into components and then attempt to identify the function of those
  components (Section 2.1). This approach
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

### 2.1.1 Reverse engineering is necessary because AI and humans use different
representations and perform different tasks

### 2.1.2 Reverse engineering step 1: Neural network decomposition

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
