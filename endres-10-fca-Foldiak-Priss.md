An application of formal concept analysis
to semantic neural decoding
Dominik Maria Endres · Peter Földiák · Uta Priss
Ann Math Artif Intell (2009) 57:233–248

# Intro

organization
2.  more details on sparse coding
3. a short introduction to FCA
4. how the sparseness (or denseness) of the neural code affects the structure
   of the concept lattice
5. the generative classifier model which we use to build the formal context
   from the responses of neurons in the high-level visual cortex of monkeys
6. we discuss the concept lattices so obtained in Section 6

[a cikk többi részét ld. a 2008-as cikk jegyzetében]

# 2 Sparse coding

* sparse coding is to be distinguished from local and dense distributed coding
  * detailed in [12],
* At one extreme of low average activity ratio are local codes, in which
  * each item is represented by a separate neuron or a small set of neurons
  * no overlap between the representations of any two items
  * does not necessarily imply that only one neuron encodes an item, it only
  * neurons are highly selective, corresponding to single significant items
    of the environment (e.g. a “grandmother cell”)
* other extreme (approximate average activity ratio of 0.5) corresponds to
  rense, or holographic coding
  * For N binary neurons this implies a representational capacity of 2^N
  * the representational capacity of a dense code in the brain is much
    greater than what we can experience in a lifetime
* Sparse codes (small average activity ratio) appear to be a favourable
  * compromise between dense and local codes [13, 14]
  * a modest fraction of active units per pattern because
  * representational capacity grows exponentially with average activity ratio
    (for small average activity ratios)
  * it is much more likely that a single layer network can learn to generate a
    target output ... due to the higher proportion of mappings being
    implementable by a linear discriminant function
    * Learning [is therefore] substantially more plausible [biologically]
  * the amount of redundancy necessary for fault tolerance can be chosen.  With
    * the failure of a small number of units
  * can represent values at higher accuracy than a local code
  * also referred to as coarse coding
  * seem to be employed in the mammalian visual system [15] and are
  * well suited to representing the visual environment we live in [16, 17].  It
  * is also possible to define sparseness for graded or even continuous-valued
    responses (see e.g. [4, 12, 18])

# 7 Conclusion

* Our results suggest that at least on our limited sample of neurons and
  stimuli, only a small number (e.g.  7) of neurons are needed to form quite
  specific concepts
  * One can only speculate at this point how adding substantially more stimuli
    and neurons scales this result
  * consistent with the extremely limited relative connectivity of real
    neurons, which on average [is] approx.  10^4 /10^11 = 10^{−7} in the human
    brain)
  * FCA suggests that making these relatively small number of connections to
    the correct subset of other neurons can lead to ...  useful categories,
    without considering the complete pattern of neural activity within an area
