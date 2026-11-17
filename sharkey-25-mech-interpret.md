Open Problems in Mechanistic Interpretability
Sharkey, Chughtai, Batson, Lindsey, Wu, Bushnaq, Goldowsky-Dill,+

# Abstract

* Mechanistic interpretability aims to
  understand the computational mechanisms underlying neural networks' capabilits
  in order to accomplish concrete scientific and engineering goals
  * goals eg assurance over AI system behavior and
  * shed light on exciting scientific questions about the nature of intelligence
  * many open problems in the field that require solutions before many
  * required: both conceptual and practical improvements to reveal deeper
    * how best to apply our methods in pursuit of specific goals; and the field
    * socio-technical challenges that influence and are influenced by our work
* we discuss the current frontier of mech interpret and the open 


# 1 Introduction 

* human understanding of these mechanisms is not necessary for AI capabilities,
  * nL understanding them would enhance several human abilities. For example, it
* Beyond the engineering benefits, understanding offers scientific opportunities
  * laws of nature governing the mechanisms of minds might we discover from
  * methods for analyzing biological neural systems might neuroscientists be
  * other sci
    * learn about protein folding from AIs that can predict protein structure?
    * insights about disease from a radiographer that performs beyond human
* Mechanistic interpretability might unlock these benefits. This field of study
  * understand neural networks’ decision-making processes. Here, we define
    * mech interpr := successfully predict its behavior (even on arbitrary
      inputs) or 
      or eg more precise control of the network’s behavior,
      or improved network design. Interpretability promises greater assurances
      for AI systems through a better understanding of what neural networks have
      learned, thus enabling us to realize their potential benefits.

## 1.1 The focus of this review: Open problems and the future of mech interpret

* reviews of mechanistic interpretability research and related topics exist
  (Rauker+ 2023; Geiger+ 2022; Bereska & Gavves, 2024; Ferrando+ 2024; Rai+
  2024; Anwar+ 2024; Davies & Khakzar, 2024; Mosbach+ 2024; Mueller+ 2024). Our
  * we: which directions we might benefit most from prioritizing in the future.

### 1.1.1 Why ‘mechanistic’ interpretability?

* distinction between interpretability and mechanistic interpretability is not
  * interpr:: motivations and methods used in interpretability work are diverse
    (Lipton, 2018; Doshi-Velez & Kim, 2017; Jacovi, 2023). As a result, there
  * categorizations of interpretability include   
    * causal vs. correlational methods, supervised vs. unsupervised methods,
    * bottom-up vs. top-down methods, among others 
    (Geiger+ 2024b; Mueller+ 2024; Bereska & Gavves, 2024; Belinkov, 2022a; Zou+
    2023a; Davies & Khakzar, 2024). This review focuses specifically on
* mechanistic interpretability. But what distinguishes ‘mechanistic'
  * the term is used in a number of (sometimes inconsistent) ways (Saphra &
  Wiegreffe, 2024). In this review, we use the term ‘mechanistic'
  we in a technical sense, referring specifically to work that investigates
* one of three threads of interpretability research, each with distinct but
  * the three roughly reflect the changing aims of interpretabilit over time
1. AI systems that are interpretable by design. Much early interpretability
  * the sensitivity of machine learning models to inputs and training data.
  * This work typically used small-to-medium sized models designed to be easily
    interpretable, such as decision trees (Breiman, 1984; Hu+ 2019), linear
    models (Roweis & Ghahramani, 1999), and generalized additive models (Hastie
    & Tibshirani, 1986; Agarwal+ 2021). 
  + attribution methods such as influence functions (Hampel, 1974; Koh & Liang,
    2017) and Shapley values (Shapley, 1997; Lundberg & Lee, 2017), which were
    * characterize model decision boundaries with respect to inputs.
  * continues to be an active research area, including architectures such as
    Concept-Bottleneck Models (Koh+ 2020), Backpack Language Models (Hewitt+
    2023), Kolmogorov-Arnold Networks (Liu+ 2024c), and sparse decision trees
    (Xin+ 2022).
2. Why did my model make this particular decision? 
  * With the rise of larger-scale nonlinear neural networks (Krizhevsky+ 2012)
  * attribution methods that could scale to large networks (Zeiler & Fergus,
    2014). In response, a number of 
  * local attribution methods were developed, including grad-CAM (Selvaraju+
    2019), integrated gradients (Sundararajan+ 2017), and masking-based causal
    attribution (Fong & Vedaldi, 2017), SHAP (Lundberg & Lee, 2017), LIME
    (Ribeiro+ 2016), and many other methods, including 
    backprop-based visualization methods (Simonyan+ 2014a; Nguyen+ 2016b).
3. focused on generalization
  * Inspired by, for example, Inception (Szegedy+ 2015) and GPT-3 (Brown+ 2020),
  * models became capable of more profound generalization.
  * How did my model solve this general class of problems? Due to its emphasis
  * commonly referred to as ‘mechanistic interpretability’ (in addition to
    other, more cultural reasons, according to (Saphra & Wiegreffe, 2024)). This
    kind of interpretability work is driven by a fundamental hypothesis in deep
    learning that generalization arises from shared computation (LeCun+ 2015).
    Early work in this area, such as feature visualization (Olah+ 2017b), or
    network dissection (Bau+ 2020), sought “global” explanations for model
    generalization by investigating the roles of model components across a class
    of decisions. More recent work in this area looks at “circuits” of
    components (Wang+ 2023), generalizable patterns of information flow (Geva+
    2023), representation subspaces (Geiger+ 2024c; Zou+ 2023a) and probes (or
    self-supervised searches via sparse dictionary learning) for representation
    vectors that carry information that generalizes across many instances for a
    particular task or set of tasks (Huben+ 2024; Bricken, 2023; Todd+ 2024;
    Hollinsworth+ 2024).

## 1.2 Types of open problems  

# 2 ...in methods and foundations

## 2.1 Reverse engineering: Identifying the roles of network components

### 2.1.1 Reverse engineering is necessary because AI and humans use different representations and perform different tasks

### 2.1.2 Reverse engineering step 1: Neural network decomposition

#### Networks do not naturally decompose into architectural components

#### Decomposition by dimensionality reduction methods

#### Decomposition by sparse dictionary learning (SDL)

#### Current decomposition methods lack solid theoretical foundations

#### Intrinsic interpretability: Building more easily decomposable models

### 2.1.3 Reverse engineering step 2: Describing the functional role of components

#### Explanations for what causes components to activate

#### Explanations for the downstream effects of components

### 2.1.4 Reverse engineering step 3: Validation of descriptions ‘Model organisms’ facilitate hypothesis validation

#### Validating interpretability methods using benchmarks

## 2.2 Concept-based interpretability: Identifying components for given roles

### 2.2.1 Concept-based probes

### 2.2.2 Probes need carefully chosen data for well-defined concepts

### 2.2.3 Probes detect correlations, rather than causal variables, in hidden activations

### 2.2.4 Concept-based intrinsic interpretability

## 2.3 Proceduralz mech interpret into circuit discovery pipelines: A case study

## 2.4 Automating steps in mech interpret research 7


# 3 ...in applications of mech interpret

## 3.1 Axes of mech interpret progress 25

## 3.2 ...for potentially unsafe cognition 25

### 3.2.1 Mechanistic interpretability-based evaluations could help us detect unsafe or unethical

#### AI cognition 25

#### Enabling real time monitoring of AI systems for potentially unsafe cognition 26

#### Improving our ability to red-team AI systems and elicit unsafe outputs 26

### 3.2.2 Using mech interpret for better control of AI system behavior 27

## 3.3 Using mech interpret for better predictions about AI systems 28

### 3.3.1 Predicting behavior in novel situations 28

### 3.3.2 Predicting capabilities that arise during training or finetuning 29

## 3.4 ...inference, improve training, and make better use of learned mechs 30

## 3.5 Using mech interpret for ‘microscope AI’ 31

## 3.6 ... on a broader range of models and model families 31

## 3.7 Human computer interaction with model internals 32


# 4 Socio-technical

## 4.1 Translating tech progress ...  into levers for AI policy and govern 33

## 4.2 Social and philosophical problems in mech interpret 34 

# 5 Conclusion
