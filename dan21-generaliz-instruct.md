Generalization in Instruction Following Systems
Soham Dan, Michael Zhou, Dan Roth
NAACL 2021

Our code is publicly available http://cogcomp.org/page/publication_view/936

# Abstract

* Understanding and executing natural language instructions in a grounded dom
  * one of the hallmarks of artificial intelligence. In this paper, we focus on
  * instruction understanding in the blocks world domain and
  * we investigate the language understanding abilities of two top-performing
    systems for the task
  * whether the test performance of these models indicates an understanding of
    the spatial domain and of the natural language instructions relative to it,
    * or they merely over-fit spurious signals in the dataset
* We formulate a set of expectations one might have from a model and concretely
  * dimensions of robustness such a model should possess. Despite decent test
* SOTA models fall short of these expectations and are extremely brittle
* We then propose a learning strategy that involves data augmentation and show
  * extensive experiments that the proposed learning strategy yields models
    * competitive on the original test set while
    * satisfying our expectations much better

# 1 Intro

* Building agents that can understand and execute natural language instructions
  in a grounded environment
  * a hallmark of artificial intelligence (Winograd, 1972). There is wide
* applicability of this technology in
  * navigation (Chen+, 2019; Tellex+, 2011; Chen and Mooney, 2011)
  * collaborative building (Narayan-Chen+, 2019)
  * and several others areas (Li+, 2020b; Branavan+, 2009). The key
* challenge underlying these and many other applications is the need to
  understand the natural language instruction (to the extent that it is possib)
  * ground relevant parts of it in the environment. While the use of
  * deep networks have led to significant progress on several benchmarks
    (Abiodun+, 2018)
* investigation into the instruction understanding capabilities of such systems
  * understand the spatial relations in the environment, nor their
  * robustness to variability in the environment or in the instructions. This
  * important from the viewpoint of safety critical applications , where
* While robustness to input perturbations at test-time has been studied in
  * computer vision (Goodfellow+, 2014) and in certain
  * natural language tasks (Alzantot+, 2018; Wallace+, 2019; Shah+, 2020), it
  * grounded environment: it remains relatively elusive (instruction following)
* different expectations of robustness in this setting
  * multiple channels of input involved, which sem constrain each other
* The Blocks World domain is an ideal platform to study the NLU abilities of a
  (Winograd, 1972; Bisk+, 2016; Narayan-Chen+, 2019; Misra+, 2017; Bisk+, 2018;
  Mehta and Goldwasser, 2019; Tan and Bansal, 2018).  Despite being seemingly
  * compositional language understanding and spatial understanding, that need
  * Bisk+ (2016): environment consists of a number of blocks placed on a board
    * input: current configuration of blocks in the environment + instruction,
    * tasked with executing the instruction by manipulating appropriate blocks
    * blocks are unlabeled, more challenging setting, we follow this
    * necessitating the use of involved referential expressions in the
    * Fig.1 shows that the instruction and block configuration are sem dependnt
* success of top performing models (Tan and Bansal, 2018; Bisk+, 2016) on the
  * we question if the models are able to reason about the complex language and
    spatial concepts of this task and generalize or are merely over fitting the
  * we formulate the following expectations from an instruction following model
    1. Identity Invariance Expectation: The performance of the model on an
    input should not degrade on slightly perturbing the input
    2. Symmetry Equivariance Expectation: A symmetric transformation of an
    input should cause an equivalent transformation of model prediction
    3. Length Invariance Expectation: The performance of a model should not
      * as long as the semantics is unchanged
* Our expectations complement existing work in three dimensions: (1) is related
  to adversarial perturbations (Goodfellow+, 2014) and (2) is related to
    * equivariance of CNNs explored in CV (Cohen & Welling 2016)
    * contrast sets (Gardner+, 2020; Li+, 2020a) and
    * counterfactual data augmentation (Kaushik+, 2019)
  * we: both natural language and an environment, discrete and continuous
    perturbations and both regression and classification tasks (3) is related
    to Lake and Baroni (2018)
    * vulnerability to length in a toy sequence-sequence task was demonstrated
    * we show that length-based vulnerability exists the number of blocks
      present on the board, for this much more complicated task
  * form only a subset of the expectations one might have from an instruction
  * nL allows us to formally characterize some of the dimensions of robustness
* The space of perturbations that we consider have the following attributes:
  * Semantic Preserving or Semantic Altering
  * Linguistic or Geometric
  * Discrete or Continuous. We find that
* both models studied suffer a large performance drop under each perturbation,
* We then present a data augmentation scheme designed to better address our
  * extensive experiments in Sec. 2.3 indicate that our learning strategy
  * more robust models that perform much better on the perturbed test set while
    maintaining similar performance on the original test set
