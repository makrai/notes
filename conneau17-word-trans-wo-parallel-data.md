Word translation without parallel data
Alexis Conneau†, Guillaume Lample†, Marc’Aurelio Ranzato, Ludovic Denoyer, Hervé Jégou

* we show that we can build a bilingual dictionary between two languages
  * without using any parallel corpora, by 
  * aligning monolingual word embedding spaces in an unsupervised way. 
  * Without using any character information, our
* outperforms existing supervised methods on cross-lingual tasks for some
  language pairs
  * works very well [for] distant language pairs, like 
    English-Russian or English-Chinese
  * experiments on the English-Esperanto language pair
    * limited amount of parallel data

#1 Intro

* works aimed at improving these cross-lingual word embeddings
  * rely on bilingual word lexicons
    * Faruqui & Dyer (2014)
    * Xing+ (2015)
    * Lazaridou+ (2015)
    * Ammar+ (2016)
    * Artetxe+ (2016)
    * Smith+ (2017)),
      * Offline bilingual word vectors, orthogonal transformations and the
        inverted softmax
    * seed parallel lexicon (Duong+ (2016)
  * parallel corpora (Gouws+ (2015)
* reducing the need for bilingual supervision (Smith+ 2017) employ
  identical character strings to form a parallel vocabulary. The
  * iterative method of Artetxe+ (2017) gradually aligns embedding
    spaces, starting from a parallel vocabulary of aligned digits. These
    * limited to similar languages sharing a common alphabet, such as European
  * recent methods explored distribution-based approach
    * Cao+ (2016) or
      A distribution-based model to learn bilingual word embeddings
      H Cao, T Zhao, S Zhang, Y Meng - Proceedings of COLING 2016
    * adversarial training Zhang+ (2017b) ... without any parallel data
    * performance is significantly below supervised methods
* Our method leverages adversarial training to learn a linear mapping from a
  * two steps
    1. discriminator is trained to distinguish between the mapped ...
       embeddings and the target embeddings, while the mapping (which can be
       seen as a generator) is jointly trained to fool the discriminator
    2. extract a synthetic dictionary from the resulting shared embedding space
       and fine-tune the mapping with the closed-form Procrustes solution from
       Schönemann (1966).  
      * unsupervised selection metric
        * cross-lingual data can not be used ... Since the method is unsupervised, 
        * introduce a ... metric that is highly correlated with the mapping
          quality and 
        * that we use both as a stopping criterion and 
        * to select the best hyper-parameters
* main contributions:
  * an unsupervised approach that reaches or outperforms state-of-the-art
    supervised approaches on several language pairs and on
    * three different evaluation tasks, namely
      * word translation,
      * sentence translation retrieval, and
      * cross-lingual word similarity
  * cross-domain similarity adaptation to mitigate the ...  hubness problem
    * inspired by the self-tuning method from Zelnik-manor & Perona (2005), but
    * we ... consider a bi-partite graph for neighbors
  * an unsupervised criterion that is highly correlated with the quality of the
    mapping, that can be used both as a stopping criterion and to select the
    best hyper-parameters
  * We release
    * high-quality dictionaries for 12 oriented languages pairs, as well as the
      corresponding supervised and unsupervised word embeddings.  • We
    * demonstration on English-Esperanto
* organized as follows. Section
  2. describes our unsupervised approach with adversarial training and our
     refinement procedure. We then present our
  3. training procedure with unsupervised model selection in Section 3. We
  4. our results on several cross-lingual tasks for several language pairs and
     compare our approach to supervised methods.  Finally, we explain how our
  5. related work on learning cross-lingual word embeddings

#2. Model

* Xing+ (2015) showed that [Mikolov 13's] results are improved by enforc-
  ing an orthogonality constraint on W . In that case, the equation (1) boils
  down to the Procrustes problem, which advantageously offers a closed form
  solution obtained from the singular value decomposition (SVD) of $Y X^T$
*  In this paper ... without cross-lingual supervision
  * First, we learn an initial proxy of W by using an adversarial criterion
  * Then, we use the words that match the best as anchor points for Procrustes
  * Finally, we improve performance over less frequent words by
    * changing the metric of the space, which leads to
    * spread more of those points in dense regions
  * Next, we describe the details of each of these steps

##2.1 Domain-adversarial setting

* This approach is [the adaptation of] Ganin+ 2016 to language
  * Ganin, Ustinova, Ajakan, Germain, Larochelle, Laviolette, Marchand, Lempitsky
    Domain-adversarial training of neural networks.
    Journal of Machine Learning Research, 17(59):1–35, 2016.
* we follow the standard training procedure of 
  deep adversarial networks (Goodfellow+ 2014)
  * The details of training are given in the next section

##2.2 Refinement procedure

* The matrix W obtained with adversarial training 
  * good performance [but] still not on par with the supervised approach
  * tries to align all words irrespective of their frequencies. 
    * However, rare words have embeddings that are 
      * less updated and are 
      * more likely to appear in different contexts in each corpus
* accuracy on the most frequent word pairs is high after adversarial training
* we build a synthetic parallel vocabulary using the W just learned with
  adversarial training. Specifically, we 
  * consider the most frequent words and
  * retain only mutual nearest neighbors to ensure a high-quality dictionary.
* Subsequently, we apply the Procrustes solution ... on this ...  dictionary
  * it is possible to generate a more accurate dictionary and apply this method
    iteratively, similarly to Artetxe+ (2017). 
  * However [one iteration] is already strong
    * improvements [in more iterations] are usually below 1%.

##2.3 Cross-domain similarity local scaling (csls)

* some [solutions of hubness] being reminiscent of pre-processing already
  existing in spectral clustering algorithms (Zelnik-manor & Perona, 2005).
* Dinu+ (2015) ... propose a pairing rule based on reverse ranks, and the
  inverted soft-max (ISF) by Smith+ (2017), which we evaluate in our
  experimental section. These methods are not fully satisfactory because the
  similarity updates are different for the words of the source and target
  languages. Additionally, ISF requires to cross-validate a parameter, whose
  estimation is noisy in an unsupervised setting where we do not have a direct
  cross-validation criterion.
* we consider a bi-partite neighborhood graph
* mean similarity `r` of [an] embedding x [or y] s to its target neighborhood as 
  * computed for all source and target word vectors [efficiently] (Johnson+ 2017).  
  * similarity measure CSLS(., .) between mapped source words and target words,

  `CSLS(W x_s , y_t) = 2 cos(W x_s , y_t) − r_T(W x_s) − r_S(y_t)`
* Intuitively, this 
  * increases the similarity associated with isolated word vectors. 
  * decreases the ones of vectors lying in dense areas.  Our experiments show
  * significantly increases the accuracy for word translation retrieval, while
  * not requiring any parameter tuning.

#3 Training and architectural choices 5

##3.2 Discriminator inputs

* we only feed the discriminator with the 50,000 most frequent words. 
  * At each training step ...  sampled uniformly.  
  * Sampling [according to the] frequency did not have any noticeable impact

##3.3 Orthogonality

* orthogonal constraint ... made the training procedure more stable in our
  experiments
* we propose to use a simple update step to ensure that the matrix W stays
  close to an orthogonal matrix during training (Cisse+ (2017)).
  * alternate the update of our model with the following update rule on the
    `W ← (1 + β)W − β(W W^T)W` where β = 0.01 is usually found to perform well.
  * eigenvalues of our matrices all have a modulus close to 1, as expected.

##3.5 Validation criterion for unsupervised model selection

* we consider the 10k most frequent source words, and use CSLS to generate a
  translation for each of them. We then compute the average cosine similarity
  between these deemed translations, and use this average as a validation
  metric. We found that this simple criterion is better correlated with the
  performance on the evaluation tasks than optimal transport distances such as
  the Wasserstein distance (Rubner+ (2000)). Figure 2 shows the
  correlation between the evaluation score and this unsupervised criterion
  (without stabilization by learning rate shrinkage). We use it as a stopping
  criterion during training, and also for hyperparameter selection in all our
  experiments.

#4 Experiments 6

* organization
  * We first present the cross-lingual evaluation tasks 
  * our baseline model. Last, 
  * [comparison] to our baseline and to previous methods
  * appendix, we offer a complementary analysis on the alignment of several
    sets of English embeddings trained with different methods and corpora.

###4.1.3 Sentence translation retrieval 

* bag-of-words aggregation methods to perform sentence retrieval on the
  Europarl corpus
  * idf-weighted average to merge word into sentence embeddings

#5 Related work 9
