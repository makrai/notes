Anant Subramanian, D Pruthi, H Jhamtani, Taylor Berg-Kirkpatrick, Eduard Hovy
SPINE: SParse Interpretable Neural Embeddings
AAAI 2018

https://github.com/harsh19/SPINE

# Abstract

* Prediction without justification has limited utility
* neural models ... capture the underlying complexity and latent trends
* We propose
  a novel variant of denoising k-sparse autoencoders
    * generates highly efficient and interpretable ... (word embeddings),
    * beginning with existing word representations ... like GloVe and word2vec
* large scale human evaluation [shows that our] embedddings are
  * much more interpretable than the original GloVe and word2vec embeddings
  * outperform existing popular word embeddings on [diverse] downstream tasks

# Intro

* Distributed representations ... obtain state-of-the-art results in NLP tasks,
  * parsing (Bansal, Gimpel, and Livescu 2014),
  * named entity recognition (Guo+ 2014), and
  * sentiment analysis (Socher+ 2013)
* To demonstrate [interpretability], we analyze embeddings
  * interpretability: each dimension to denote a semantic concept
    * This notion of interpretability resonates with post-hoc interpretability,
      introduced and discussed in (Lipton 2016)
  * For ... randomly picked words, we examine top participating dimensions
    (absolute values). For [these dimensions], we note the words that have the
    highest absolute values in that dimension
  * for [GloVe  and word2vec] the top participating words
    do not form a semantically coherent group
* feature norming studies
  (Garrard+ 2001; McRae+ 2005; Vinson and Vigliocco 2008)
  * participants were asked to list the properties of several words
  * they typically used few sparse characteristic properties

> For instance, to describe the city of Pittsburgh, one might talk about
> phenomena typical of the city, like erratic weather and large bridges. It is
> redundant and inefficient to list negative properties, like the absence of
> the Statue of Liberty

* Thus, sparsity and non-negativity are desirable characteristics
* recent studies (Lee and Seung 1999; Murphy, Talukdar, and Mitchell 2012;
  Fyshe+ 2014; 2015; Faruqui+ 2015;
  Danish, Dahiya, and Talukdar
  2016)

# Related Work

## Interpretability in word embeddings

* Murphy+ (2012) proposed NNSE (Non-Negative Sparse Embeddings)
  * non-negative matrix factorization on the co-occurrence matrix of words
* Faruqui+ (2015, a) consider linguistically inspired dimensions as a
  means to induce sparsity and interpretability
  * dimensions are binary valued, there is no notion of the extent to which a
    word participates in a particular dimension
* Park+ (2017) apply rotations ... to improve the interpretability
* Our method [differently from these approaches, is]
  * based on neural models, and is hence more expressive than linear matrix
    factorization or simple transformations like rotation
* Faruqui+ (2015, b) ... Sparse Overcomplete Word Vectors (SPOWV)
  * We direct interested readers to (Faruqui+ 2015; Lee+ 2007)
  * we compare our approach with SPOWV in both performance and interpretability

## k-sparse autoencoders

* Ng 2011
* with high probability, at most k hidden units are active for any given input
* The underlying idea is to achieve an expected activation value for a hidden
  unit that is equivalent to k completely activated hidden units. The
  training algorithm does so by
* augmenting a standard input reconstruction loss with a term that measures
  the deviation between the observed and the desired mean activation values
* does not necessarily produce exactly (or less than) k-sparse representations
  (Makhzani and Frey 2014)
* Our proposed novel objective function and choice of activation function
  mitigate this issue

# Methodology

* loss function.  L (D) = RL(D) + λ 1 ASL(D) + λ 2 P SL(D) where
  * RL(D) is the reconstruction loss over the data set,
  * sparsity loss
    * average
      * in addition to the original formulation in Ng (2011), we also allow for
        the observed average activation value to be less than [desired]
    * "partial"
      * penalizes values that are neither close to 0 nor to 1

## Choice of activation function

* nonnegativity in the output embeddings is a useful property
* This drives us to use activation functions that produce non-negative values
  e.g. Rectified Linear Units (ReLU) and Sigmoid units
* Since we wish to allow for strict sparsity (... exact 0 values),
  we rule out the Sigmoid activation function,
  due to its asymptotic nature with respect to 0 activation
* capped ReLU (cap-ReLU) activation function, that
  produces activation values in the [0, 1]

## Hyperparameter tuning

* We tune our hyperparameters using the automatic metric to evaluate topic
  coherence discussed in Lau+ (2014). The metric
  * aims to maximize coherence among different dimensions
  * correlate positively with human evaluation
  * Faruqui+ (2015) ... select hyperparameters [based on] word similarity
  * we
    * observe that high topic coherence comes at the cost of
      * high reconstruction loss, which manifests itself in the form of
      * poor performance on downstream tasks.  To mitigate this issue, we
    * cap the maximum permissible reconstruction loss to a threshold
* best performing set of hyperparameters are listed in Table 3. We observed
  * hidden layer of size 1000 units
  * making the autoencoder denoising,
    attaining embeddings that are 6% more sparse at similar reconstruction loss

## alternate loss consisting of `l_1` regularizer

* instead of PSL and ASL formulation
* In order to achieve similar levels of topic coherence with this formulation,
  we require very high regularizer coefficient, leading to
  high reconstruction loss
* ASL & PSL combination [can] force activations to 0 and 1,
  whereas, `l_1` formulation drives values to 0

# interpretability tests

* We estimate the interpretability of the dimensions in two ways
  * word intrusion detection tests [odd man out]
  * we qualitatively examine the top participating words
    from a few randomly sampled dimensions

## Words intrusion detection

* [also called] reading tree leaves (Chang+ 2009)
  * first used to interpret probabilistic topic models
  * Since then ... widely used in estimating interpretability
    (Murphy, Talukdar, and Mitchell 2012; Fyshe+ 2014; Faruqui+ 2015)
* For a given dimension [we] select
  * the top 4 most active words
  * a random intruder word
    * that is both present in the
      * bottom half of the dimension h in question, and in the
      * top 10 percentile in at least one other dimension h 0 ∈ H \ {h}
    * following Murphy, Talukdar, and Mitchell (2012); Faruqui+ (2015)

# Benchmark Downstream Tasks

* tasks
  * sentiment analysis
    * This task tests the semantic properties of word embeddings. It is a
    * sentence-level binary classification task on the
    * Stanford Sentiment Treebank dataset (Socher+ 2013)
    * only the non-neutral labels
  * news classification each task involves categorizing a document according to
    two ... categories
    * Sports: baseball vs. hockey (958/239/796)
    * Computers: IBM vs. Mac (929/239/777)
    * Religion: atheism vs. christian (870/209/717)
  * noun phrase chunking, and
    * a noun phrase of 3 words is classified as left [or right] bracketed
  * question classification
    * about a location, about a person, or about some numeric information
  * + word similarity task discussed in this section (Table 6)
* for text classification tasks
  * Like in Faruqui+ (2015), we use the average of the word vectors of
    the words in a sentence as features . We
  * experiment with SVMs, Logistic Regression and Random forests

# Results and Discussion

## Interpretability [in] word intrusion detection task

* This forms the key result of our effort

## ... downstream tasks

* [our] embeddings ... perform competitively well on all benchmark tasks, and
  do significantly better on a majority of them

## Qualitative assessment

* For a few sampled words, we investigate the
  top words from dimensions where the given word is active
* Often, our representations [capture different interpretations of a] word
  * e.g. ‘remote’ can be used in various settings: remote areas (like remote

## Retroffiting vs joint learning

* An alternate to [retrofitting] is to add various sparsity and non-negativity
  inducing regularizers when training Word2Vec or GloVe.  One practical
* retrofitting
  * does not need access to a giant corpus. Moreover, our
  * agnostic to, and abstracted from, the underlying [word embedding] method

## Interpretability and downstream performance

* [our] Embeddings ... outperform original [ones] for some downstream tasks
* counter-intuitive, as an increase in interpretability might have come at the
  expense of downstream performance
* We believe that this [is because sparse embeddings] capture the salient
  characteristics of concepts, which allow downstream task models to
* e.g. if a dimension in the sparse embedding signifies a location name,
* interpretability vs downstream as a func of dim
  * choosing 2000 or more hidden dimensions, we found
    * both topic coherence and interpretability to improve, though at a
    * severe cost of performance on downstream tasks.  On
  * choosing 500 dimensions, topic coherence and interpretability deteriorated
  * extreme case, [one-hot vectors]
    * highly interpretable, but ... perform significantly worse on downstream

## General discussion

* We attribute the success of our method to the ...  autoencoder framework,
* non-negativity and sparsity lead to semantically coherent (interpretable) dim
* In many prediction settings, a softmax layer precedes the class proba-
  bilities. Weights from these softmax layers bind to the final layer
  representation, and large positive and negative weights sway the output class
  probabilities. In order to explain a prediction, one necessarily has to
  understand the semantic concepts that each of the dimensions corresponding to
  these large weights represent. Hence, this notion of post-hoc inter-
  pretability is more useful in explaining predictions

# Conclusion

* future work
  * inducing varying amounts of sparsity
    at multiple hidden layers in more sophisticated networks, and
    studying the properties of the resultant sparse activations
