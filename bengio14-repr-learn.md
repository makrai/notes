Yoshua Bengio, Aaron Courville, and Pascal Vincent
2014
Representation Learning: A Review and New Perspectives

#Abstract

* covering advances in
  * probabilistic models, autoencoders, manifold learning, and deep networks
* This motivates longer-term unanswered questions about
  * the appropriate objectives for
    * learning good representations,
    * computing representations (i.e., inference)
  * the geometrical connections between
    representation learning, density estimation and manifold learning

#1 Introduction

* this paper focuses on deep learning methods:
* unsupervised feature learning and deep learning, covering
  * probabilistic models,
  * auto-encoders,
  * manifold learning, and
  * deep networks

#2 Why should we care about learning representations?

* Representation learning [has]
   * regular workshops at the leading conferences NIPS and ICML, and a new
  *  conference dedicated to it, ICLR
  * sometimes ... the header of Deep Learning or Feature Learning
* Below, we briefly highlight some ... empirical successes both in academia
  and in industry

##2.1 Speech Recognition and Signal Processing

* one of the early applications of neural networks, in particular
  convolutional (or time-delay) neural networks
* breakthrough results
  * Dahl+ 2010;
    * George Dahl, Marc'aurelio Ranzato, Abdel-rahman Mohamed, GE Hinton
    * Phone recognition with the mean-covariance RBM. In NIPS’2010
    * mean-covariance restricted Boltzmann machine (mcRBM)
      * first introduced for modeling natural images
  * Deng+ 2010;
    * Binary coding of speech spectrograms using a deep auto-encoder
    * produce[s] a logspectral distortion that is approximately 2 dB lower
      than a subband vector quantization technique
  * Seide+ 2011a Interspeech
    * Conversational speech transcription using context-dependent DNNs
    * CD-DNN-HMMs combine classic artificial-neural-network HMMs with
      traditional tied-state triphones and deep-belief network pre-training
  * Mohamed+ 2012; IEEE
    * Acoustic modeling using deep belief networks
    * pre-trained as a multilayer generative model of a window of spectral
      feature vectors without making use of any discriminative information
  * Dahl+ 2012;
    * Context-Dependent pre-trained deep neural networks for large vocab
    * architecture that trains the DNN to produce a distribution over senones
      (tied triphone states)
    * The relative improvement in error rate
      * on a smaller large-vocabulary speech recognition benchmark
        * Bing mobile business search dataset, with 40 hours of speech
      * is between 16% and 23%
  * Hinton+ 2012 IEEE
    * Deep neural networks for acoustic modeling in speech recognition
    * Most current speech recognition systems use ... Gaussian mixture models
      to determine how well each state of each HMM fits a frame or a short
      window of frames of coefficients that represents the acoustic input
    * An alternative way to evaluate the fit is to use a feedforward NN that
      * takes several frames of coefficients as input and
      * produces posterior probabilities over HMM states as output
    * Deep neural networks with many hidden layers, that are trained using new
      methods have been shown to outperform Gaussian mixture models on a
      variety of speech recognition benchmarks, sometimes by a large margin
    * This paper provides an overview of this progress and represents the
      shared views of four research groups who have had recent successes in
      using deep neural networks for acoustic modeling in speech recognition
  * bringing these algorithms to a larger scale and into products
    * Microsoft Audio Video Indexing Service 2012 [183]
  * music
    * polyphonic transcription (Boulanger-Lewandowski+ 2012),
    * audio tagging (Hamel+ 2011)

##2.2 Object Recognition

MNIST digit image classification problem
  * beginning
    * (Hinton+ 2006; Bengio+ 2007),
  *   * breaking the supremacy of SVMs
  * The latest records
    * unconstrained version, convolutional: Ciresan+ (2012)
    * knowledge-free version: Rifai+ (2011c) is
* object recognition in natural images: (Krizhevsky+ 2012)

##2.3. Natural Language Processing

Distributed representations for symbolic data
  * were introduced by Hinton (1986)
* in the context of statistical language modeling
  * by Bengio+ (2003) in so-called
  * neural net language models (Bengio, 2008)
Adding a convolutional architecture, Collobert+ (2011) developed
  * the SENNA system that
  * _shares representations across the tasks_
* combined with learning image representations in a way that allow to
* associate text and images
  * Google’s image search, exploiting huge quantities of data to
  * map images and queries in the same space (Weston+ 2010) and it has
  * recently been extended to deeper multi-modal representations
    * Srivastava and Salakhutdinov
      Multimodal learning with deep boltzmann machines
      NIPS 2012
* adding recurrence to the hidden layers (Mikolov+ 2011)
* statistical machine translation [182], [121],
Recursive auto-encoders (which generalize recurrent networks)
  * full sentence paraphrase detection (Socher+ 2011a)
    * almost doubling the F1 score for paraphrase detection
* word sense disambiguation [33],
  * Bordes, A., Glorot, X., Weston, J., and Bengio, Y. (2012)
  * Joint learning of words and meaning representations for open-text
  * semantic parsing. AISTATS’2012
* sentiment analysis (Glorot+ 2011b; Socher+ 2011b)

##2.4. Multitask and Transfer Learning, Domain Adaptation

* two transfer learning challenges held in 2011
  * ICML 2011 workshop of the same name, was won using
  * unsupervised layerwise pretraining [12], [145]
  * Goodfellow+ [72] ... at NIPS 2011’s Challenges in Learning
  * Hierarchical Models Workshop
* setups
  * domain adaptation
    * the target remains the same but the input distribution changes
    * (Glorot+ 2011b; Chen+ 2012)
  * multitask learning
    * Krizhevsky+ (2012); Collobert+ (2011)

##3. What Makes A Representation Good?

##3.1 Priors for Representation Learning in AI

In Bengio+ (2007): AI task
Smoothness, see 3.2
Multiple explanatory factors, distributed representations
  * recover or at least disentangle these underlying factors of variation
    * Section 3.5
  * distributed representations, discussed in Section 3.3
A hierarchical organization of explanatory factors
  * deep representations, elaborated in Section 3.4
Semi-supervised learning (megérteni)
  * Section 4
Shared factors across tasks
  * Section 2.4
Manifolds:
  * probability mass concentrates near regions that have a much smaller dim
  * auto-encoder algorithms (Section 7.2)
  * other manifold-inspired algorithms (Section  8)
Natural clustering
  * different values of categorical variables such as object classes are
    * associated with separate manifolds
  * Manifold Tangent Classifier discussed in Section 8.3
  * consistent with the idea that humans have named categories
Temporal and spatial coherence
  * consecutive (from a sequence) or spatially nearby observations tend to
  * be associated with the same value of relevant categorical concepts
  * Becker and Hinton (1992)
  * discussed in Section 11.3
Sparsity
  * only a small fraction of the possible factors are relevant
  * this could be represented by
    * features that are often zero2
  *   * (as initially proposed by Olshausen and Field (1996)),
    * [most] features are insensitive to small variations of x
  * This can be achieved with
    * priors on latent variables (peaked at 0), or by using
    * a nonlinearity whose value is often flat at 0
    * penalizing the magnitude of the Jacobian matrix
  * Sections 6.1.1 and 7.2
Simplicity of Factor Dependencies
  * linear dependencies
    * This can be seen in many laws of physics
This idea is pursued further in Sections 3.5 and 11.4

##3.2 Smoothness and the Curse of Dimensionality

* kernel machines
We advocate learning algorithms that are flexible and non-parametric7
* but do not rely exclusively on the smoothness assumption

##3.3 Distributed representations
##3.4 Depth and abstraction
##3.5 Disentangling Factors of Variation
##3.6 Good criteria for learning representations?

#4 Building deep representations

* greedy layerwise unsupervised pre-training
(Deep Boltzmann Machine)

#5 Single-layer learning modules

* probabilistic graphical models and one rooted in neural networks
* single-layer greedy learning modules
  * restricted Boltzmann machine (RBM) ... and the auto-encoder variants
In the next few sections (6--8) we will review the major developments in
* single-layer training modules
  * Principal Components Analysis
    * the three interpretations
  * this review does not cover ... Independent Component Analysis

#6 Probabilistic models

##6.1 Directed Graphical Models

* 6.1.1 Explaining Away

#7 Directly learning a parametric map from input to representation

##7.2 Regularized Auto-Encoders

  * auto-encoders originally ... dimensionality reduction ... bottleneck,
  `d_h < d_x`
  * successful uses of sparse coding and RBM approaches ->
    * overcomplete representations, i.e. d h > d x
  * Recent: regulrized auto-encoders
    * “constrain” the representation, even when it is overcomplete
  * Alternative view: making the representation as “constant”
  * (insensitive) as possible with respect to changes in input
    * contractive autoencoders reduce the number of effective degrees
    * of freedom of the representation (around each point) by making the
    * encoder contractive, i.e., making the derivative of the encoder
    * small (thus making the hidden units saturate),
    * denoising auto-encoder makes the whole mapping “robust”, i.e.,
    * insensitive to small random perturbations, or contractive,
    * making sure that the reconstruction cannot stay good when moving
    * in most directions around a training example
  * 7.2.1 Sparse Auto-Encoders
  * 7.2.2 Denoising Auto-Encoders
  * 7.2.3 Contractive Auto-Encoders
  * 7.2.4 Predictive Sparse Decomposition

#8 Representation learning as manifold learning

* manifold hypothesis, according to which 
  * real-world data presented in high dimensional spaces are expected to con-
    centrate in the vicinity of a manifold M of much lower dimensionality
  * considering the variations in input space, which are captured by or
    reflected (by corresponding changes) in the learned representation.  To
    * some directions are well preserved (the tangent directions)
    * others aren’t (directions orthogonal to the manifolds)
  * an intrinsic coordinate system on the embedded manifold
* The archetypal manifold modeling algorithm is ... PCA
* real world domains are however expected to be strongly nonlinear.  Their
* patchworks of locally linear tangent spaces (Vincent & Bengio, 03; Brand, 03)
* a non-parametric approach, based on a training set nearest neighbor graph
  (Schölkopf+ 1998; Roweis & Saul 2000; Tenenbaum+ 2000; Brand 2003; 
  Belkin & Niyogi 2003; Donoho & Grimes 2003; Weinberger & Saul 2004; 
  Hinton & Roweis 2003; van der Maaten & Hinton 2008)
  * each high-dimensional training point has 
    its own set of free low-dimensional embedding coordinates, which are
    optimized so that certain properties of the neighborhood graph computed in
    original high dimensional input space are best preserved
  * do not directly learn a parametrized feature extraction function `f_θ(x)`
    applicable to new test points 
* we will focus on [non-linear manifold learning methods] that learn a
  parametric map that can directly compute a representation for new points

##8.1 Learning a parametric mapping based on a neighborhood graph

* as with the parametric variant (van der Maaten, 2009) 
  of t-SNE (van der Maaten and Hinton, 2008).
* Semi-Supervised Embedding (Weston+ 2008) learns a direct encoding while
  taking into account the manifold hypothesis through a neighborhood graph
  * simultaneously learns a manifold embedding and a classifier
  * encourages training set neigbhors to have similar representations

##8.2 Learning to represent non-linear manifolds

##8.3 Leveraging the modeled tangent spaces

#9 Connections between probabilistic and direct encoding models

#10 Global training of deep models

#11 Building-in invariance

#12 Conclusion

  * Practical Concerns and Guidelines
  * Incorporating Generic AI-level Priors
  * Inference
  * Optimization
