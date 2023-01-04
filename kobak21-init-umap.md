Initialization is critical for preserving global data structure
  in both t-SNE and UMAP
Kobak, D., Linderman, G.C.
Nature Biotechnology 39(2), 156–157 (Feb 2021)

* we: alleged superiority of UMAP can be entirely attributed to
  different choices of initialization in the implementations used by Becht+ the
  * t-SNE implementations by default used random initialization, while the
  * UMAP implementation used a technique called Laplacian eigenmaps (LE)5 to
* We show that
  * UMAP with random init preserves global structure as poorly as t-SNE with ran
  * t-SNE with informative initialization performs as well as UMAP with infoive
* => no evidence that the UMAP algorithm per se has any advantage over t-SNE in
  terms of preserving global structure. We also contend that these algorithms

* both loss functions make similar points attract each other and push
  dissimilar points away from each other
  * Both algorithms minimize their loss functions by using gradient descent.
* LE5 can often achieve globally accurate embedding on its own6.  The effect of
  this difference on how well the two algorithms preserve global structure was
  not discussed or investigated by Becht+ 

* We: illustration using a simple toy dataset (Fig. 1). We sampled
  * n = 7,000 points from a circle with some added Gaussian noise and used
    UMAP and t-SNE to construct an embedding
  * all parameters for both algorithms at their default values and
    only changed the initialization
  * rand
    * t-SNE algorithm with random initialization produced a knot;
    * UMAP produced a tangled web with multiple tears
    * In both cases, the global structure was evidently not preserved; indeed,
  * gradient descent in t-SNE and UMAP only pulls close neighbors together and
    is not much influenced by the global arrangement of points.
  * nL LE recovers the original circle for this toy dataset and, when used for
    * strongly improves the UMAP result
  * PCA
    * A method often recommended for initialization in t-SNE is PCA
    * also recovers the original circle and strongly improves the t-SNE result.
* We used all three datasets analyzed by Becht+ (sample sizes from 320,000 to
  820,000 cells)8,9,10
  * To quantify preservation of global structure, Becht+ computed Pearson
    correlation between pairwise Euclidean distances in high-dimensional space
    and in the embedding. To quantify the
  * reproducibility of the embedding, the authors embedded random subsamples of
    the data and measured the correlation of the coordinates of subsample
    embeddings with the coordinates of the full-dataset embeddings (up to
    symmetries around the coordinate axes). Our results show that t-SNE and
* [in 2d?,] modern implementations of the two algorithms work with similar
  speed (the widespread opinion that UMAP is much faster than t-SNE is
  outdated: for two-dimensional embeddings, FIt-SNE works at least as
  quickly2,7). When comparing the resulting embeddings (Extended Data Figs.
  * we diff: UMAP produces denser, more compact clusters than t-SNE, with more
    white space in between
    * Very similar embeddings can be produced by t-SNE with _exaggeration_,
      * increases the attractive forces by a constant factor2
* Future research in
  * machine learning: the exact mathematical and algorithmic origins of this
    difference12, and future research in
  * single-cell biology: which algo is more faithful to the underlying bio data
  * measure how faithful a given embedding is
