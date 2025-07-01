Transformers are SSMs: Generalized Models and Efficient Algorithms Through
  Structured State Space Duality
Tri Dao, Albert Gu
ICML 2024 2405.21060 [cs.LG]

https://github.com/state-spaces/mamba

# Abstract

* SSMs and variants of attention
  * Transformers have been the main architecture behind deep LM
  * state-space models (SSMs) such as Mamba have recently been shown to
    match or outperform Transformers at small to medium scale
* We: the two families of models are actually quite closely related, and
  * we develop a rich framework of theoretical connections
  * connected through various decompositions of a well-studied class of
    structured semiseparable matrices
    * state space duality (SSD) framework allows us to design
  * a new architecture (Mamba-2) whose
    * at the intersection of SSMs and structured attention
    * core layer is an a refinement of Mamba's selective SSM that is
    * 2-8X faster, while
    * continuing to be competitive with Transformers on language modeling
  * Technically, these connections only relate to certain flavors of attention;
    * the title of this paper is an homage to Katharopoulos+ (2020) which first
      showed that “Transformers are RNNs”
* from the concusion
  * our theoretical tools provide new ideas to
    improve SSMs (and potentially Transformers)
    by connecting the algorithmic and systems advances on both sides

# 1 Intro

* the development of SSMs have appeared disjoint from the community’s
  collective effort to improve Transformers, such as
  * eg understanding them theoretically as well as optimizing them on hardware
  ~> it is more difficult to understand and experiment with SSMs compared to
  * challenging to train SSMs as efficiently as Transformers from both an
    algorithmic and systems perspective
* we develop a rich body of theoretical connections
  * transfer algorithmic and systems optimizations originally developed for
    Transformers to SSMs, towards the
  * goal: foundation models that perform better than Transformers while
    scaling more efficiently in sequence length
* Linear Attention (LA) framework (Katharopoulos+ 2020), which derived
  * a connection between autoregressive attention and linear RNNs by showing
  * equivalence between “dual forms” of quadratic kernelized attention and a
    particular linear recurrence. This duality
  * allows new capabilities such as the ability to have
    both efficient parallelizable training and efficient autoregressive
    inference. In the same spirit, this paper
  * we provide multiple viewpoints connecting linear-complexity SSMs with
    quadratic-complexity forms to combine the strengths of SSMs and attention.1

## State Space Duality

* Our framework connecting structured SSMs and variants of attention, which
  * we call structured state space duality (SSD), is made
  * through the abstractions of structured matrices
    * matrices with subquadratic parameters and multiplication complexity
* We develop two broad frameworks for representing sequence models,
  * one as matrix transformations and one as tensor contractions, which
  * each reveal different perspectives of the duality
* technical contributions
  * an equivalence between state space models and a well-studied family of
    structured matrices called semiseparable matrices (Section 3)
    * This connection reveals new properties and algorithms for SSMs. A central
    * different methods of computing state space models can be reframed as
      various matrix multiplication algorithms on structured matrices
  * We signif improve the theory of linear attention (Katharopoulos+ 2020) We
    * an incisive proof of its recurrent form through tensor contractions, and
    * we generalize it to a new family of structured masked attention (SMA)
      (Section 4)
  * We connect SSMs and SMA, showing that
    * they have a large intersection that are duals of each other, possessing
      both SSM-like linear and attention-like quadratic forms (Section 5). We
    * any kernel attention method possessing a fast recurrent form must be an SSM
* ie theoretical value and a broad set of
  directions for understanding and improving sequence models

## Efficient Algorithms. First and most importantly, our framework exposes

* new efficient and easily-implementable algorithms for computing SSMs (Sec 6)
* a new SSD algorithm, based on block decompositions of semiseparable mxs
  * takes advantage of both the linear SSM recurrence and quadratic dual form,
  * optimal tradeoffs on all main efficiency axes (eg training and inference
    compute, memory usage, and ability to leverage matrix multiplication units
    on modern hardware)
  * A dedicated implementation of SSD is 2 − 8× faster than the optimized
    selective scan implementation of Mamba, while simultaneously
    * allowing for much larger recurrent state sizes (8× the size of Mamba or
      even higher, with minimal slowdown). SSD is
    * highly competitive with optimized implementations of softmax attention
      (FlashAttention-2 (Dao 2024)), crossing over at sequence length 2K and 6×
      faster at sequence length 16K

## Architecture Design

* One major obstacle to adopting new architectures such as SSMs is the
  * ecosystem tailored to Transformers
  * eg hardware-efficient optimization and parallelism techniques for
    large-scale training
* we allow using established conventions and techniques for attention to build
  a vocabulary of architecture design choices for SSMs, and further improve
  them (Section 7)
  * eg the analog of heads from multi-head attention (MHA) to SSMs
  * We show that the Mamba architecture is a multi-input SSM (MIS) that turns
    * analogous to multi-value attention (MVA), and
    * we compare other variants of Mamba with different head structures
* slight modifications to the Mamba block allow tensor parallelism to be
  implemented (eg in the style of Megatron (Shoeybi+ 2019)). The main ideas:
  * grouped-value attention (GVA) head structure, and moving all data-dependent
    projections to occur in parallel at the beginning of the block
* The combination of 
  * the modified parallel Mamba block, together with using 
  * SSD as the inner SSM layer, results in the Mamba-2 architecture
  * Chinchilla scaling laws for Mamba-2 in the same setting as Mamba
  * it Pareto dominates Mamba and Transformer++ in both perplexity and
    wall-clock time
* we train a family of Mamba-2 models at varying sizes on the Pile
  * Mamba-2 matches or outperforms Mamba and open source Transformers on
    standard downstream evaluations. For example, Mamba-2
    * with 2.7B parameters trained on 300B tokens on the Pile outperforms
      Mamba-2.8B, Pythia-2.8B and even Pythia-6.9B trained on the same dataset

## Systems Optimizations

* The SSD framework allows us to leverage a rich body of work on systems optim
  developed for Transformers (Sec 8)
  * Tensor Parallelism (TP) is an important model parallelism technique to
    train large Transformer models by
    * splitting each layer across GPUs on the same node
    * We design Mamba-2 to be TP-friendly, reducing the number of
      synchronization point per block by half
  * sequence parallelism for the attention blocks
    * For very long sequences whose activations do not fit on one device,
    * We describe how to train SSMs in general and Mamba-2 in particular with
      sequence parallelism, by passing the recurrent states between devices
  * For finetuning with examples of different lengths
    * for best efficiency, Transformer requires sophisticated techniques to
      remove padding tokens and perform attention on variable length sequences
    * We show how Mamba-2 can be trained with variable sequence lengths
      efficiently, requiring no padding tokens

# 5 State Space Duality

* In Sections 3 and 4, we
  * defined structured state space models and structured attention,
  * they both have a quadratic algorithm and a linear algorithm
* This section connects them together. Main result:
  * a particular case of structured state space models coincides with a
    particular case of structured attention
  * the linear-time SSM algorithm and quadratic-time kernel attention algorithm
    are dual forms of each other

## 5.1 specializes state space models to scalar structure, where the naive
quadratic computation can be seen as an instance of kernel attention

## 5.2 specializes structured masked attention to semiseparable SMA, which
characterizes masked attention with efficient autoregression

## 5.3 summarizes the connection between structured masked attention and
structured state space models, termed structured state space duality

# 8 Systems Optimization for SSMs

## 8.3 Variable Length

* pretraining often uses the same sequence lengths for the batch,
* during finetuning or inference, the model might need to process different
  input sequences of different lengths. One
* naive way to handle this case is to right-pad all sequences in the batch to
  * can be inefficient if sequences are wildly different lengths
* For transformers, sophisticated techniques have been develop to avoid padding
  * load-balancing between GPUs (Zeng+  2022; Y. Zhai+ 2023), or
  * packing multiple sequences in the same batch and adjust the attention mask
    (Ding+ 2024; Pouransari+ 2024)
* With SSMs and Mamba in particular, we can handle variable sequence lengths
  by simply treating the whole batch as one long sequence, and avoid passing
  the states between individual sequences. This is
  * equivalent to simply setting 𝐴𝑡 = 0 for tokens 𝑡 at the end of one sequence

# 9 Empirical Validation

* validation on language modeling, training efficiency, and
  a difficult multi-query associative recall task (Arora, Eyuboglu, Zhang+ 24)
  * Simran Arora, Sabri Eyuboglu, Michael Zhang, Aman Timalsina, Silas Alberti,
      Dylan Zinsley, James Zou, Atri Rudra, and Christopher Ré
    Simple Linear Attention LMs Balance the Recall-Throughput Tradeoff
    ICML 2024


## 9.1 synthetic associative recall tasks, challenging for recurrent LMs

* Synthetic associative recall tasks have been popular for testing the ability
  of language models to look up information in their context. Broadly, they
  * feeding autoregressive models pairs of key-value associations, and then
    prompting the model to produce the correct completion upon being shown a
    previously-seen key
* The multi-query associative recall (MQAR) task is a particular formulation of
  this task that requires the model to memorize multiple associations (Arora,
  Eyuboglu, Timalsina,+ 2024)
* The original Mamba paper reported results on related synthetic tasks, in
  * Selective Copying (Gu and Dao 2023) and Induction Heads (Olsson+ 2022),
  * be seen as easier associative recall tasks
* The MQAR task is also closely related to “phonebook look-up” tasks which has
  * shown to be challenging for recurrent models such as SSMs, due to their
    finite state capacity (De+ 2024; Jelassi+ 2024)
* We compare on a challenging version of the MQAR setup from (Arora, Eyuboglu,
  Zhang,+ 2024), using a
  * harder task, longer sequences, and smaller models. Our baselines include
* standard multi-head softmax attention as well as the Based architecture which
  combines convolutions, local attention, and a linear attention variant
* Results are shown in Figure 8. While
  * Mamba-1 struggles on this task, Mamba-2 performs well across all settings
  * Mamba-2 is significantly better than Mamba-1 even when the state sizes are
    controlled (N = 16)
    * which aspect of the architecture is the predominant factor: future work
  * validates the importance of state size: increasing from N = 16 to N = 64
    and N = 256 consistently improves performance on MQAR, as
  * the larger state allows more information (key-value pairs) to be memorized

## 9.2 language modeling pre-training and downstream evaluations (Section 9.2)

## 9.3 our SSD algorithm is much more efficient than Mamba-1 (Section 9.3) and
comparable to optimized attention for moderate sequence lengths. Finally, we

## 9.4 ablate various design choices in the Mamba-2 architecture (Section 9.4)

# 10 Related work and potential research directions opened up by our framework
