Anthony M. Zador 1
A critique of pure learning
  nd what artificial neural networks can learn from animal brains
Nature Communications (2019) 10:3770 https://doi.org/10.1038/s41467-019-11786-6

# Learning by ANNs

* Symbolic AI can be seen as the psychologist’s approach
  it draws inspiration from the human cognitive processing,
  without attempting to crack open the black box—whereas
* ANNs, which use neuron-like elements, take their
  inspiration from neuroscience

# Learning by animals

The term “learning” in neuroscience (and in psychology) refers to
  * a long-lasting change in behavior that is the result of experience
  * encompasses animal paradigms such as
    * classical and operant conditioning, as well as
    * learning by observation or by instruction.  Although there is some
* [differences] between the neuroscience and ANN usage of the term learning
  * [amount of supervision]

# Genomes specify rules for brain wiring

* specification of which neurons are connected, as well as to the strengths of
* In some simple organisms, genomes have the capacity to specify every
  connection between every neuron, to the minutest detail
  * The simple worm c.  elegans, for example, has 302 neurons and about 7000
  * in each individual of an inbred strain, the wiring pattern is largely the
    same 31 .  So, at one extreme, the genome can encode a lookup table, which
* speculation that the neocortex consists of many copies of a basic “canonical”
  microcircuit 34,35 , which are wired together to form the entire cortex

# Supervised learning or supervised evolution?

* ANNs should not be viewed as the analog of learning in animals [but as that
  of] both evolution and learning.  In animals, there are
  * two nested optimization processes:
    * outer “evolution” loop acting on a generational timescale, and an
    * inner “learning” loop, which acts on the lifetime of a single individual
[differences] between learning and evolution
  * learning can act directly on synaptic weights through Hebbian and other
  * evolution acts on brain wiring only indirectly, through the genome. The
    genome doesn’t encode representations or behaviors directly; it encodes
* The limited[ness] of the mammalian genome ... may act as a regularizer
  * the size of the genome [ is ] highly variable across species
    * about average for mammals
    * [larger for] many fish and amphibians;
    * [marbled lungfish genome] is >40 times larger than the humans
    * suggests that the regularizing effect ... might represent a feature

# Implications for ANNs

* We have argued that [innate mechanisms] work synergistically with learning
  * analogous approaches might inspire new approaches to accelerate ...  ANNs
* strong selection pressure for animals to
  restrict their learning to just what is needed for their survival (Fig. 2)
  [relative to the changing environment]
* related to “meta-learning” and “inductive biases” in AI research and
  cognitive science 9,39–41 . In this formulation, there is an
  * outer loop (e.g., evolution) [=inductive biases allow us to learn] quickly
* the genomic information bottleneck may select for
  wiring and plasticity rules which are more generic, and which therefore are
  * wiring of the visual cortex is quite similar to that of the auditory cortex
  * [analogy to] transfer learning
* Local circuitry can be determined with serial electron microscopy; there is
  now an ambitious project to determine every synapse within a 1 mm 3 cube of
  mouse visual cortex 50 . Long-range projections can be determined in a
  high-throughput manner using MAPseq 51 or by other methods. Thus the details
  of cortical wiring may soon be available, and provide an experimental basis
  for ANNs
