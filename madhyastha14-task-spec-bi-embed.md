Pranava Swaroop Madhyastha and Xavier Carreras and Ariadna Quattoni
Learning Task-specific Bilexical Embeddings
2014

1 Introduction

nuclear norm (NN)

3 Learning Low-rank Bilexical Operators

3.1 Low-rank Optimization
3.2 A Proximal Algorithm for Bilexical Operators

4 Related Work

unsupervised representation learning and semisupervised representation
learning.
Unsupervised approaches ... mainly ... not for a specific task
    rather a variety of tasks.
unsupervised approaches can be roughly categorized into 
    (a) clusters induced using a notion of distributed similarity, 
        such as the method by Brown et al. (1992); 
    (b) multilayer neural network ... to extract features from the data
        (Morin and Bengio, 2005; Mnih and Hinton, 2007; Bengio and S ́en ́ecal,
        2008; Mnih and Hinton, 2009); 
    (c) pure distributional approaches 
        Sahlgren, 2006; 
            The Word-Space Model: Using distributional analysis to represent
            syntagmatic and paradigmatic relations between words in
            high-dimensional vector spaces.
        Turney and Pantel, 2010; 
            From frequency to meaning: Vector space models of semantics.
        Dumais et al., 1988;
            Using latent semantic analysis to improve access to textual info
        Landauer et al., 1998; 
            An introduction to latent semantic analysis
        Lund et al., 1995; 
            Semantic and associative priming in high-dimensional semantic space
        Väyrynen et al., 2007
            Towards explicit semantic features using independent component
            analysis.
Bai et al. (2010) use a technique similar to ours, using bilinear forms with
low-rank constraints. In their case, they explicitly look for a low-rank
factorization of the matrix, making their optimization non-convex. As far as
we know, ours is the first convex formulation,

5 Experiments

none of the test head words has been observed in training, while the list of
modifiers is the same for training, validation and testing.
