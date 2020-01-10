Interpreting the Neural Code with Formal Concept Analysis
Dominik Endres, Peter Földiák
2008

We explore the effects of neural code sparsity on the lattice.

#Intro

* organization
  2. a short introduction to FCA
  3. how the sparseness (or denseness) of the neural code affects the structure
     of the concept lattice
  4. describes the generative classifier model which we use to build the FCs
     from the responses of neurons in the high-level visual cortex of monkeys
  5. we discuss the concept lattices so obtained

#1 Intro

* Mammalian brains consist of billions of neurons
* the patterns of activation ... can be understood as the codewords comprising
  the _neural code_
* Neural decoding is the attempt to reconstruct the stimulus [1, 2, 3, 4].
  * decoding quality measures, 
    * such as Fisher’s linear discriminant [5] or mutual information [6] 
    * tell us little about the structure of the neural code
* Földiák [7] demonstrated that a sparse neural code can be interpreted as a
  graph (a kind of ”semantic net”). In this interpretation, the 
  * neural responses are assumed to be binary (active/inactive)

[a section 2 Sparse coding-ot ld. a 2009-es cikkről szóló jegyzetben]

#3 Concept lattices of local, sparse and dense codes

* neural codes [are sparse]
* In the case of a binary neural code, the 
  sparseness of a codeword is inversely related 
  to the fraction of active neurons
  * average sparseness across all codewords is the sparseness of the code 
  [12, 13].  
* Sparse codes, i.e. codes where this fraction is low, are found interesting
  * offer a good compromise between 
    encoding capacity, ease of decoding and robustness [14], they 
  * seem to be employed in the mammalian visual processing system [15] and they
  * well suited to representing the visual environment we live in [15, 16].  It
* is also possible to define sparseness for graded or even continuous-valued
  responses (see e.g.  [17, 4, 13]). 
* To study what structural effects different levels of sparseness would have on
  a neural code, we generated random codes, 
  i.e.  each of 10 stimuli was associated with randomly drawn responses of 10
  neurons, subject to the constraints that the code be perfectly decodable and
  that the sparseness of each codeword was equal to the sparseness of the code.
  Fig.2 shows the [cross-tables] and the concept lattices of a 
    * local code (activity ratio 0.1)
    * a sparse code (activity ratio 0.2) and a 
    * dense code (activity ratio 0.5).
* total number of concepts. A 
  * dense code, even for a small number of stimuli, will give rise to a lot of
    concepts
    * Determining these intents ... requires the observation of a large number
      of neurons, which is unappealing from a decoding perspective.  The 
  * local code does not have this drawback, but is 
    * hampered by a small encoding capacity 
      (maximal number of concepts with non-empty extents)

#5

[ld. a 2009-es cikkben (nem a jegyzetben) részletesebben]

* the neural code has a higher ”resolution” for faces of conspecifics
  [fajtársak] than for faces in general [e.g.] humans or cartoons

#6 Conclusion

FCA ... is feasible even for high-level visual codes, where linear decoding
methods [19, 20]
